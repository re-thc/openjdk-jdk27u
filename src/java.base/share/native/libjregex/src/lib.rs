// Copyright (c) 2026, the openjdk-jdk27u contributors. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

use jni::{EnvUnowned, errors::ThrowRuntimeExAndDefault, jni_sig, jni_str,
          objects::{JByteArray, JClass, JString}, sys::jint};
use regex::bytes::{Regex, RegexBuilder};
use std::sync::OnceLock;

const UUID: &str = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}";
const DATE: &str = "([0-9]{4})-([0-9]{2})-([0-9]{2})";
static UUID_ENGINE: OnceLock<Option<Regex>> = OnceLock::new();
static DATE_ENGINE: OnceLock<Option<Regex>> = OnceLock::new();

fn engine(kind: jint) -> Option<&'static Regex> {
    let (cell, pattern) = match kind {
        1 => (&UUID_ENGINE, UUID),
        2 => (&DATE_ENGINE, DATE),
        _ => return None,
    };
    cell.get_or_init(|| RegexBuilder::new(pattern).unicode(false)
        .size_limit(1 << 20).dfa_size_limit(1 << 20).build().ok()).as_ref()
}

// Only JNI table calls are unsafe. Java references cannot escape the JNI frame;
// all buffers and their indexing are owned and checked by Rust.
#[unsafe(no_mangle)]
pub extern "system" fn Java_java_util_regex_RegexLibrary_find0<'caller>(
    mut unowned: EnvUnowned<'caller>, _class: JClass<'caller>,
    kind: jint, input: JString<'caller>, begin: jint, end: jint,
) -> jint {
    unowned.with_env(|env| -> Result<jint, jni::errors::Error> {
        if input.is_null() || begin < 0 || end < begin || end - begin > 8 << 20 {
            return Ok(-2);
        }
        let raw = env.get_raw();
        // The JVM supplies this valid JNI table and a non-null String reference.
        let length = unsafe { ((**raw).v1_2.GetStringLength)(raw, input.as_raw()) };
        if end > length { return Ok(-2); }
        let Some(re) = engine(kind) else { return Ok(-2); };
        if env.get_field(&input, jni_str!("coder"), jni_sig!("B"))?.b()? == 0 {
            let value = env.get_field(&input, jni_str!("value"), jni_sig!("[B"))?.l()?;
            let value = JByteArray::cast_local(env, value)?;
            if value.len(env)? < end as usize { return Ok(-2); }
            let mut copied = Vec::new();
            if copied.try_reserve_exact((end - begin) as usize).is_err() { return Ok(-2); }
            copied.resize((end - begin) as usize, 0i8);
            // Copy through the regular JNI region API. No GC-critical pointer
            // or mutable view of the immutable String backing array is held.
            value.get_region(env, begin, &mut copied)?;
            // i8 and u8 have equal size/alignment and all bit patterns are valid.
            // This immutable view cannot outlive its owned backing vector.
            let bytes = unsafe { std::slice::from_raw_parts(copied.as_ptr().cast::<u8>(), copied.len()) };
            // Non-ASCII Latin-1 bytes also cannot match these ASCII languages.
            return Ok(re.find(&bytes).map_or(-1, |m| begin + m.start() as jint));
        }
        let mut bytes = Vec::new();
        if bytes.try_reserve_exact((end - begin) as usize).is_err() { return Ok(-2); }
        let mut chars = [0u16; 4096];
        let mut offset = begin;
        while offset < end {
            let count = (end - offset).min(chars.len() as jint);
            // Bounds were checked against the immutable String's real length.
            // The stack buffer has at least count UTF-16 entries. This regular
            // JNI copy does not hold a GC-critical pointer or call back to Java.
            unsafe { ((**raw).v1_2.GetStringRegion)(raw, input.as_raw(), offset,
                                                       count, chars.as_mut_ptr()); }
            if env.exception_check() { return Err(jni::errors::Error::JavaException); }
            // These positive ASCII languages cannot accept a non-ASCII unit.
            // A barrier byte keeps Java UTF-16 indices, including surrogates.
            bytes.extend(chars[..count as usize].iter()
                .map(|&ch| if ch < 128 { ch as u8 } else { 128 }));
            offset += count;
        }
        Ok(re.find(&bytes).map_or(-1, |m| begin + m.start() as jint))
    }).resolve::<ThrowRuntimeExAndDefault>()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fixed_width_ascii_languages() {
        let id = b"01234567-abCD-0123-4567-89abcdef0123";
        assert_eq!(engine(1).unwrap().find(id).unwrap().range(), 0..36);
        assert!(engine(1).unwrap().find(b"01234567-abCD-0123-4567-89abcdef012").is_none());
        assert_eq!(engine(2).unwrap().find(b"x2026-10-03").unwrap().range(), 1..11);
        assert!(engine(2).unwrap().find(b"2026-\x8010-03").is_none());
    }
}
