00000 e83b42e316                     call       0x7f8982ca56c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4883ec40                       sub        rsp, 0x40
0001c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00024 0f853c020000                   jne        0x7f896be716e6
0002a 488b5e60                       mov        rbx, qword ptr [rsi + 0x60]
0002e 488b6e58                       mov        rbp, qword ptr [rsi + 0x58]
00032 4c8b16                         mov        r10, qword ptr [rsi]
00035 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0003a 4c8b6e38                       mov        r13, qword ptr [rsi + 0x38]
0003e 4c8b7620                       mov        r14, qword ptr [rsi + 0x20]
00042 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
00046 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0004b 488bfe                         mov        rdi, rsi
0004e 49ba00bed882897f0000           movabs     r10, 0x7f8982d8be00
00058 41ffd2                         call       r10
0005b 0f1f840000000000               nop        dword ptr [rax + rax]
00063 4885db                         test       rbx, rbx
00066 0f843b010000                   je         0x7f896be71627
0006c 448b1b                         mov        r11d, dword ptr [rbx]
0006f 41c1eb0d                       shr        r11d, 0xd
00073 4181fb75410000                 cmp        r11d, 0x4175
0007a 0f8564010000                   jne        0x7f896be71664
00080 488bcb                         mov        rcx, rbx
00083 4c8bcd                         mov        r9, rbp
00086 4885ed                         test       rbp, rbp
00089 0f841f010000                   je         0x7f896be7162e
0008f 448b5d00                       mov        r11d, dword ptr [rbp]
00093 41c1eb0d                       shr        r11d, 0xd
00097 4181fb76410000                 cmp        r11d, 0x4176
0009e 0f8548010000                   jne        0x7f896be7166c
000a4 4c8bd5                         mov        r10, rbp
000a7 4d85ed                         test       r13, r13
000aa 0f8406010000                   je         0x7f896be71636
000b0 458b5d00                       mov        r11d, dword ptr [r13]
000b4 41c1eb0d                       shr        r11d, 0xd
000b8 4181fb6a410000                 cmp        r11d, 0x416a
000bf 0f852c010000                   jne        0x7f896be71671
000c5 498bfd                         mov        rdi, r13
000c8 4d8bde                         mov        r11, r14
000cb 458b06                         mov        r8d, dword ptr [r14]
000ce 41c1e80d                       shr        r8d, 0xd
000d2 4181f863410000                 cmp        r8d, 0x4163
000d9 0f8515010000                   jne        0x7f896be71674
000df 4885ff                         test       rdi, rdi
000e2 0f84d8000000                   je         0x7f896be71640
000e8 4885c9                         test       rcx, rcx
000eb 0f84cf000000                   je         0x7f896be71640
000f1 48890c24                       mov        qword ptr [rsp], rcx
000f5 4c89542408                     mov        qword ptr [rsp + 8], r10
000fa 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
000ff eb17                           jmp        0x7f896be71598
00101 0f1f840000000000               nop        dword ptr [rax + rax]
00109 0f1f8000000000                 nop        dword ptr [rax]
00110 4c8bdd                         mov        r11, rbp
00113 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00118 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
0011c 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
00120 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00124 458b4b1c                       mov        r9d, dword ptr [r11 + 0x1c]
00128 418b4b18                       mov        ecx, dword ptr [r11 + 0x18]
0012c 498beb                         mov        rbp, r11
0012f 498bd0                         mov        rdx, r8
00132 4c8bc1                         mov        r8, rcx
00135 488bf3                         mov        rsi, rbx
00138 498bca                         mov        rcx, r10
0013b e8a092a8ff                     call       0x7f896b8fa860
00140 0f1f840038020000               nop        dword ptr [rax + rax + 0x238]
00148 4c8b1424                       mov        r10, qword ptr [rsp]
0014c 450fb69a8c000000               movzx      r11d, byte ptr [r10 + 0x8c]
00154 488b5c2418                     mov        rbx, qword ptr [rsp + 0x18]
00159 48ffc3                         inc        rbx
0015c 4585db                         test       r11d, r11d
0015f 74af                           je         0x7f896be71590
00161 49ba606eca82897f0000           movabs     r10, 0x7f8982ca6e60
0016b 41ffd2                         call       r10
0016e 0f1f840000000000               nop        dword ptr [rax + rax]
00176 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0017b 49894328                       mov        qword ptr [r11 + 0x28], rax
0017f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00184 4d895318                       mov        qword ptr [r11 + 0x18], r10
00188 c5f9efc0                       vpxor      xmm0, xmm0, xmm0
0018c c4e1fb2ac3                     vcvtsi2sd  xmm0, xmm0, rbx
00191 c4c17b114310                   vmovsd     qword ptr [r11 + 0x10], xmm0
00197 4883c440                       add        rsp, 0x40
0019b 5d                             pop        rbp
0019c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001a0 0f87aa000000                   ja         0x7f896be716d0
001a6 c3                             ret        
001a7 33c9                           xor        ecx, ecx
001a9 e9d5feffff                     jmp        0x7f896be71503
001ae 4533d2                         xor        r10d, r10d
001b1 e9f1feffff                     jmp        0x7f896be71527
001b6 33ff                           xor        edi, edi
001b8 e90bffffff                     jmp        0x7f896be71548
001bd 4533db                         xor        r11d, r11d
001c0 be6effffff                     mov        esi, 0xffffff6e
001c5 488be9                         mov        rbp, rcx
001c8 4c891424                       mov        qword ptr [rsp], r10
001cc 48897c2408                     mov        qword ptr [rsp + 8], rdi
001d1 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
001d6 90                             nop        
001d7 e8041fb5ff                     call       0x7f896b9c3560
001dc 0f1f8400d4020001               nop        dword ptr [rax + rax + 0x10002d4]
001e4 4c8bcd                         mov        r9, rbp
001e7 4d8bde                         mov        r11, r14
001ea eb08                           jmp        0x7f896be71674
001ec 4d8bde                         mov        r11, r14
001ef eb03                           jmp        0x7f896be71674
001f1 4d8bde                         mov        r11, r14
001f4 be85ffffff                     mov        esi, 0xffffff85
001f9 498beb                         mov        rbp, r11
001fc 48ff742418                     push       qword ptr [rsp + 0x18]
00201 488f0424                       pop        qword ptr [rsp]
00205 48ff742420                     push       qword ptr [rsp + 0x20]
0020a 488f442408                     pop        qword ptr [rsp + 8]
0020f 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00214 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00219 4c896c2420                     mov        qword ptr [rsp + 0x20], r13
0021e 90                             nop        
0021f e8bc1eb5ff                     call       0x7f896b9c3560
00224 0f1f84001c030002               nop        dword ptr [rax + rax + 0x200031c]
0022c 488bf0                         mov        rsi, rax
0022f 4883c440                       add        rsp, 0x40
00233 5d                             pop        rbp
00234 e92765b5ff                     jmp        0x7f896b9c7be0
00239 bef6ffffff                     mov        esi, 0xfffffff6
0023e 488be8                         mov        rbp, rax
00241 6690                           nop        
00243 e8981eb5ff                     call       0x7f896b9c3560
00248 0f1f840040030003               nop        dword ptr [rax + rax + 0x3000340]
00250 49ba1c16e76b897f0000           movabs     r10, 0x7f896be7161c
0025a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00261 e9fab7a8ff                     jmp        0x7f896b8fcee0
00266 e8b583a7ff                     call       0x7f896b8e9aa0
0026b e9bafdffff                     jmp        0x7f896be714aa
