00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4883ec70                       sub        rsp, 0x70
0000c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00014 7405                           je         0x7f040842bf9b
00016 e805db4b07                     call       0x7f040f8e9aa0
0001b 4889742450                     mov        qword ptr [rsp + 0x50], rsi
00020 4889542440                     mov        qword ptr [rsp + 0x40], rdx
00025 48897c2448                     mov        qword ptr [rsp + 0x48], rdi
0002a 48bb280a093600000000           movabs     rbx, 0x36090a28
00034 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00037 83c002                         add        eax, 2
0003a 894370                         mov        dword ptr [rbx + 0x70], eax
0003d 25fe070000                     and        eax, 0x7fe
00042 85c0                           test       eax, eax
00044 0f8470020000                   je         0x7f040842c23a
0004a 48bb280a093600000000           movabs     rbx, 0x36090a28
00054 488383a800000001               add        qword ptr [rbx + 0xa8], 1
0005c e8ffed271e                     call       0x7f04266aade0
00061 0f1f840000000000               nop        dword ptr [rax + rax]
00069 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
0006e 48894220                       mov        qword ptr [rdx + 0x20], rax
00072 bf00000000                     mov        edi, 0
00077 48897c2458                     mov        qword ptr [rsp + 0x58], rdi
0007c e9b6000000                     jmp        0x7f040842c0b7
00081 0f1f8000000000                 nop        dword ptr [rax]
00088 48be20be083600000000           movabs     rsi, 0x3608be20
00092 488386c800000001               add        qword ptr [rsi + 0xc8], 1
0009a 48be20be083600000000           movabs     rsi, 0x3608be20
000a4 ff86d8000000                   inc        dword ptr [rsi + 0xd8]
000aa 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
000af 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
000b4 41ba01000000                   mov        r10d, 1
000ba 4903da                         add        rbx, r10
000bd 0fbe868c000000                 movsx      eax, byte ptr [rsi + 0x8c]
000c4 85c0                           test       eax, eax
000c6 ba02000000                     mov        edx, 2
000cb 7405                           je         0x7f040842c052
000cd ba00000000                     mov        edx, 0
000d2 48b9280a093600000000           movabs     rcx, 0x36090a28
000dc 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
000e0 4403c2                         add        r8d, edx
000e3 44894174                       mov        dword ptr [rcx + 0x74], r8d
000e7 85d2                           test       edx, edx
000e9 7506                           jne        0x7f040842c071
000eb 41b802000000                   mov        r8d, 2
000f1 4181e0fe3f0000                 and        r8d, 0x3ffe
000f8 4585c0                         test       r8d, r8d
000fb 0f84e4010000                   je         0x7f040842c265
00101 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00105 418502                         test       dword ptr [r10], eax
00108 85c0                           test       eax, eax
0010a 48b8280a093600000000           movabs     rax, 0x36090a28
00114 ba28010000                     mov        edx, 0x128
00119 7505                           jne        0x7f040842c0a0
0011b ba18010000                     mov        edx, 0x118
00120 488b0c10                       mov        rcx, qword ptr [rax + rdx]
00124 488d4901                       lea        rcx, [rcx + 1]
00128 48890c10                       mov        qword ptr [rax + rdx], rcx
0012c 0f8532010000                   jne        0x7f040842c1e4
00132 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
00137 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
0013f 483b07                         cmp        rax, qword ptr [rdi]
00142 488bcf                         mov        rcx, rdi
00145 49b8280a093600000000           movabs     r8, 0x36090a28
0014f 8b09                           mov        ecx, dword ptr [rcx]
00151 c1e90d                         shr        ecx, 0xd
00154 48c1e10a                       shl        rcx, 0xa
00158 41ba00000035                   mov        r10d, 0x35000000
0015e 4903ca                         add        rcx, r10
00161 41ba18000000                   mov        r10d, 0x18
00167 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0016b 7436                           je         0x7f040842c123
0016d 4983c202                       add        r10, 2
00171 4983fa1c                       cmp        r10, 0x1c
00175 75f0                           jne        0x7f040842c0e7
00177 41ba18000000                   mov        r10d, 0x18
0017d 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00182 7412                           je         0x7f040842c116
00184 4983c202                       add        r10, 2
00188 4983fa1c                       cmp        r10, 0x1c
0018c 75ef                           jne        0x7f040842c0fd
0018e 41ba17000000                   mov        r10d, 0x17
00194 eb11                           jmp        0x7f040842c127
00196 50                             push       rax
00197 4833c0                         xor        rax, rax
0019a f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
001a0 58                             pop        rax
001a1 ebbe                           jmp        0x7f040842c0e1
001a3 4983c201                       add        r10, 1
001a7 4b8304d001                     add        qword ptr [r8 + r10*8], 1
001ac 488bf7                         mov        rsi, rdi
001af e82cdd4c07                     call       0x7f040f8f9e60
001b4 0f1f8400ac020001               nop        dword ptr [rax + rax + 0x10002ac]
001bc 488b7c2448                     mov        rdi, qword ptr [rsp + 0x48]
001c1 483b07                         cmp        rax, qword ptr [rdi]
001c4 488bf7                         mov        rsi, rdi
001c7 48bb280a093600000000           movabs     rbx, 0x36090a28
001d1 8b36                           mov        esi, dword ptr [rsi]
001d3 c1ee0d                         shr        esi, 0xd
001d6 48c1e60a                       shl        rsi, 0xa
001da 41ba00000035                   mov        r10d, 0x35000000
001e0 4903f2                         add        rsi, r10
001e3 41ba1e000000                   mov        r10d, 0x1e
001e9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
001ed 7436                           je         0x7f040842c1a5
001ef 4983c202                       add        r10, 2
001f3 4983fa22                       cmp        r10, 0x22
001f7 75f0                           jne        0x7f040842c169
001f9 41ba1e000000                   mov        r10d, 0x1e
001ff 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00204 7412                           je         0x7f040842c198
00206 4983c202                       add        r10, 2
0020a 4983fa22                       cmp        r10, 0x22
0020e 75ef                           jne        0x7f040842c17f
00210 41ba1d000000                   mov        r10d, 0x1d
00216 eb11                           jmp        0x7f040842c1a9
00218 50                             push       rax
00219 4833c0                         xor        rax, rax
0021c f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00222 58                             pop        rax
00223 ebbe                           jmp        0x7f040842c163
00225 4983c201                       add        r10, 1
00229 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0022e 48be20be083600000000           movabs     rsi, 0x3608be20
00238 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
0023b 83c302                         add        ebx, 2
0023e 895e70                         mov        dword ptr [rsi + 0x70], ebx
00241 81e3feff1f00                   and        ebx, 0x1ffffe
00247 85db                           test       ebx, ebx
00249 0f84c1000000                   je         0x7f040842c290
0024f 48be20be083600000000           movabs     rsi, 0x3608be20
00259 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
0025f e924feffff                     jmp        0x7f040842c008
00264 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
00269 48be280a093600000000           movabs     rsi, 0x36090a28
00273 4883863801000001               add        qword ptr [rsi + 0x138], 1
0027b e8e0eb271e                     call       0x7f04266aade0
00280 0f1f840000000000               nop        dword ptr [rax + rax]
00288 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
0028d 48894228                       mov        qword ptr [rdx + 0x28], rax
00291 41ba00000000                   mov        r10d, 0
00297 4c895218                       mov        qword ptr [rdx + 0x18], r10
0029b 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
002a0 c4e1fb2ac3                     vcvtsi2sd  xmm0, xmm0, rbx
002a5 c5fb114210                     vmovsd     qword ptr [rdx + 0x10], xmm0
002aa 4883c470                       add        rsp, 0x70
002ae 5d                             pop        rbp
002af 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
002b3 0f8778000000                   ja         0x7f040842c2b1
002b9 c3                             ret        
002ba 49ba809444f8037f0000           movabs     r10, 0x7f03f8449480
002c4 4c89542408                     mov        qword ptr [rsp + 8], r10
002c9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
002d1 e80a665907                     call       0x7f040f9c2860
002d6 e96ffdffff                     jmp        0x7f040842bfca
002db e880fd5807                     call       0x7f040f9bbfe0
002e0 e87bfd5807                     call       0x7f040f9bbfe0
002e5 49ba809444f8037f0000           movabs     r10, 0x7f03f8449480
002ef 4c89542408                     mov        qword ptr [rsp + 8], r10
002f4 48c7042421000000               mov        qword ptr [rsp], 0x21
002fc e8df655907                     call       0x7f040f9c2860
00301 e9fbfdffff                     jmp        0x7f040842c081
00306 e855fd5807                     call       0x7f040f9bbfe0
0030b e850fd5807                     call       0x7f040f9bbfe0
00310 49baf87345f8037f0000           movabs     r10, 0x7f03f84573f8
0031a 4c89542408                     mov        qword ptr [rsp + 8], r10
0031f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
00327 e8b4655907                     call       0x7f040f9c2860
0032c e91effffff                     jmp        0x7f040842c1cf
00331 49ba2fc24208047f0000           movabs     r10, 0x7f040842c22f
0033b 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00342 e9190c4d07                     jmp        0x7f040f8fcee0
00347 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
0034e 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
00359 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
00364 4883c470                       add        rsp, 0x70
00368 5d                             pop        rbp
00369 e9f2e75807                     jmp        0x7f040f9baae0
0036e f4                             hlt        
0036f f4                             hlt        
