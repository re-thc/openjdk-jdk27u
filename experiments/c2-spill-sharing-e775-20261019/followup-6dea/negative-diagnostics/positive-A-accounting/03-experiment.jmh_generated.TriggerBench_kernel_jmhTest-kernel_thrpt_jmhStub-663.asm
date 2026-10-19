00000 e8fb4ab716                     call       0x7fa92a9e4580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4883ec40                       sub        rsp, 0x40
0001c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00024 0f85ef010000                   jne        0x7fa913e6fc99
0002a 488b5e60                       mov        rbx, qword ptr [rsi + 0x60]
0002e 488b6e58                       mov        rbp, qword ptr [rsi + 0x58]
00032 4c8b16                         mov        r10, qword ptr [rsi]
00035 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0003a 4c8b6e38                       mov        r13, qword ptr [rsi + 0x38]
0003e 4c8b7620                       mov        r14, qword ptr [rsi + 0x20]
00042 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
00046 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0004b 488bfe                         mov        rdi, rsi
0004e 49bac0acac2aa97f0000           movabs     r10, 0x7fa92aacacc0
00058 41ffd2                         call       r10
0005b 0f1f840000000000               nop        dword ptr [rax + rax]
00063 4885db                         test       rbx, rbx
00066 0f841c010000                   je         0x7fa913e6fc08
0006c 448b1b                         mov        r11d, dword ptr [rbx]
0006f 41c1eb0d                       shr        r11d, 0xd
00073 4181fb75410000                 cmp        r11d, 0x4175
0007a 0f8544010000                   jne        0x7fa913e6fc44
00080 488bcb                         mov        rcx, rbx
00083 4c8bcd                         mov        r9, rbp
00086 4885ed                         test       rbp, rbp
00089 0f8400010000                   je         0x7fa913e6fc0f
0008f 448b5500                       mov        r10d, dword ptr [rbp]
00093 41c1ea0d                       shr        r10d, 0xd
00097 4181fa76410000                 cmp        r10d, 0x4176
0009e 0f8528010000                   jne        0x7fa913e6fc4c
000a4 4c8bd5                         mov        r10, rbp
000a7 4d85ed                         test       r13, r13
000aa 0f84e7000000                   je         0x7fa913e6fc17
000b0 458b4500                       mov        r8d, dword ptr [r13]
000b4 41c1e80d                       shr        r8d, 0xd
000b8 4181f86a410000                 cmp        r8d, 0x416a
000bf 0f850c010000                   jne        0x7fa913e6fc51
000c5 498bfd                         mov        rdi, r13
000c8 4d8bc6                         mov        r8, r14
000cb 458b1e                         mov        r11d, dword ptr [r14]
000ce 41c1eb0d                       shr        r11d, 0xd
000d2 4181fb63410000                 cmp        r11d, 0x4163
000d9 0f85f5000000                   jne        0x7fa913e6fc54
000df 4885ff                         test       rdi, rdi
000e2 0f84b9000000                   je         0x7fa913e6fc21
000e8 4885c9                         test       rcx, rcx
000eb 0f84b0000000                   je         0x7fa913e6fc21
000f1 48890c24                       mov        qword ptr [rsp], rcx
000f5 4c89542408                     mov        qword ptr [rsp + 8], r10
000fa 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
000ff eb17                           jmp        0x7fa913e6fb98
00101 0f1f840000000000               nop        dword ptr [rax + rax]
00109 0f1f8000000000                 nop        dword ptr [rax]
00110 4c8bc5                         mov        r8, rbp
00113 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00118 418b7810                       mov        edi, dword ptr [r8 + 0x10]
0011c 458b5814                       mov        r11d, dword ptr [r8 + 0x14]
00120 458b5004                       mov        r10d, dword ptr [r8 + 4]
00124 418b481c                       mov        ecx, dword ptr [r8 + 0x1c]
00128 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
0012c 498be8                         mov        rbp, r8
0012f 488bd7                         mov        rdx, rdi
00132 4d8bc1                         mov        r8, r9
00135 4c8bc9                         mov        r9, rcx
00138 498bf2                         mov        rsi, r10
0013b 498bcb                         mov        rcx, r11
0013e 90                             nop        
0013f e83ceaffff                     call       0x7fa913e6e600
00144 0f1f84003c020000               nop        dword ptr [rax + rax + 0x23c]
0014c 4c8b1c24                       mov        r11, qword ptr [rsp]
00150 450fb6938c000000               movzx      r10d, byte ptr [r11 + 0x8c]
00158 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
0015d 49ffc1                         inc        r9
00160 4585d2                         test       r10d, r10d
00163 74ab                           je         0x7fa913e6fb90
00165 be45ffffff                     mov        esi, 0xffffff45
0016a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0016f 4c890c24                       mov        qword ptr [rsp], r9
00173 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00178 666690                         nop        
0017b e8e048b5ff                     call       0x7fa9139c44e0
00180 0f1f840078020001               nop        dword ptr [rax + rax + 0x1000278]
00188 33c9                           xor        ecx, ecx
0018a e9f4feffff                     jmp        0x7fa913e6fb03
0018f 4533d2                         xor        r10d, r10d
00192 e910ffffff                     jmp        0x7fa913e6fb27
00197 33ff                           xor        edi, edi
00199 e92affffff                     jmp        0x7fa913e6fb48
0019e 4533c0                         xor        r8d, r8d
001a1 be6effffff                     mov        esi, 0xffffff6e
001a6 488be9                         mov        rbp, rcx
001a9 4c891424                       mov        qword ptr [rsp], r10
001ad 48897c2408                     mov        qword ptr [rsp + 8], rdi
001b2 4c89442410                     mov        qword ptr [rsp + 0x10], r8
001b7 e8a448b5ff                     call       0x7fa9139c44e0
001bc 0f1f8400b4020002               nop        dword ptr [rax + rax + 0x20002b4]
001c4 4c8bcd                         mov        r9, rbp
001c7 4d8bc6                         mov        r8, r14
001ca eb08                           jmp        0x7fa913e6fc54
001cc 4d8bc6                         mov        r8, r14
001cf eb03                           jmp        0x7fa913e6fc54
001d1 4d8bc6                         mov        r8, r14
001d4 be85ffffff                     mov        esi, 0xffffff85
001d9 498be8                         mov        rbp, r8
001dc 48ff742418                     push       qword ptr [rsp + 0x18]
001e1 488f0424                       pop        qword ptr [rsp]
001e5 48ff742420                     push       qword ptr [rsp + 0x20]
001ea 488f442408                     pop        qword ptr [rsp + 8]
001ef 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
001f4 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
001f9 4c896c2420                     mov        qword ptr [rsp + 0x20], r13
001fe 90                             nop        
001ff e85c48b5ff                     call       0x7fa9139c44e0
00204 0f1f8400fc020003               nop        dword ptr [rax + rax + 0x30002fc]
0020c 488bf0                         mov        rsi, rax
0020f 4883c440                       add        rsp, 0x40
00213 5d                             pop        rbp
00214 e9c766b5ff                     jmp        0x7fa9139c6360
00219 e8029ea7ff                     call       0x7fa9138e9aa0
0021e e907feffff                     jmp        0x7fa913e6faaa
00223 f4                             hlt        
00224 f4                             hlt        
00225 f4                             hlt        
00226 f4                             hlt        
00227 f4                             hlt        
