import re
import subprocess
import sys
from pathlib import Path

root, output = map(Path, sys.argv[1:])
source = (root / "src/hotspot/share/runtime/simdutfSupport.cpp").read_text()
initialize = source[source.index("jint SimdUTF::initialize()"):source.index("// Check in the shared entry")]
features = list(dict.fromkeys(re.findall(r"VM_Version::(supports_\w+)\(\)", initialize)))
icelake = re.findall(r"VM_Version::(supports_\w+)\(\)", initialize.split('impl = implementations["icelake"]')[0])
methods = "\n".join(f"static bool {name}() {{ return enabled[{i}]; }}" for i, name in enumerate(features))
checks = "\n".join(f"reset(); enabled[{features.index(name)}] = false; SimdUTF::initialize(); "
                   f'assert(active == nullptr || std::string(active->name) != "icelake");' for name in icelake)
text = r'''
#include <array>
#include <cassert>
#include <iostream>
#include <string>
using jint = int;
#define AMD64 1
#define FLAG_IS_DEFAULT(x) true
bool UseSIMDUTFIntrinsics = true, UseCompiler = true;
int UseAVX = 3, UseSSE = 4, SIMDUTFMinLength = 256;
template<class T, class U> T checked_cast(U value) { return static_cast<T>(value); }
namespace simdutf {
struct implementation {
  const char* name;
  bool supported_by_runtime_system() const { return true; }
};
struct implementations {
  implementation icelake{"icelake"}, haswell{"haswell"}, westmere{"westmere"};
  const implementation* operator[](const std::string& name) const {
    return name == "icelake" ? &icelake : name == "haswell" ? &haswell : &westmere;
  }
};
const implementations& get_available_implementations() { static implementations all; return all; }
const implementation* active = nullptr;
const implementation*& get_active_implementation() { return active; }
}
using simdutf::active;
std::array<bool, FEATURE_COUNT> enabled;
struct VM_Version { FEATURE_METHODS };
const simdutf::implementation* simdutf_implementation = nullptr;
struct SimdUTF { static jint initialize(); };
INITIALIZE
void reset() { enabled.fill(true); active = nullptr; simdutf_implementation = nullptr; UseAVX = 3; }
int main() {
  reset(); SimdUTF::initialize(); assert(std::string(active->name) == "icelake");
  FEATURE_CHECKS
  reset(); UseAVX = 2; SimdUTF::initialize(); assert(std::string(active->name) == "haswell");
  reset(); UseAVX = 0; SimdUTF::initialize(); assert(std::string(active->name) == "westmere");
  std::cout << "Independent backend feature masks and lower-backend fallbacks passed\n";
}
'''.replace("FEATURE_COUNT", str(len(features))).replace("FEATURE_METHODS", methods).replace("INITIALIZE", initialize).replace("FEATURE_CHECKS", checks)
output.mkdir(exist_ok=True)
cpp = output / "backend-gates.cpp"
binary = output / "backend-gates"
cpp.write_text(text)
subprocess.run(["g++", "-std=c++17", "-O2", "-Wall", "-Wextra", "-Werror", str(cpp), "-o", str(binary)], check=True)
subprocess.run([str(binary)], check=True)
