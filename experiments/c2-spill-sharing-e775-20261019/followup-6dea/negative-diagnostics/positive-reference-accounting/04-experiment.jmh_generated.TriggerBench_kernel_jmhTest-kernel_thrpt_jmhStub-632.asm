00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4883ec20                       sub        rsp, 0x20
0000c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00014 0f8582010000                   jne        0x7f703fe7051c
0001a 48893c24                       mov        qword ptr [rsp], rdi
0001e 4889742438                     mov        qword ptr [rsp + 0x38], rsi
00023 4889542430                     mov        qword ptr [rsp + 0x30], rdx
00028 49bae0cdaf58707f0000           movabs     r10, 0x7f7058afcde0
00032 41ffd2                         call       r10
00035 0f1f840000000000               nop        dword ptr [rax + rax]
0003d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00042 4d85d2                         test       r10, r10
00045 0f84d5000000                   je         0x7f703fe704a0
0004b 49894220                       mov        qword ptr [r10 + 0x20], rax
0004f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00054 458b5204                       mov        r10d, dword ptr [r10 + 4]
00058 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0005d 418b5b1c                       mov        ebx, dword ptr [r11 + 0x1c]
00061 458b4b10                       mov        r9d, dword ptr [r11 + 0x10]
00065 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
00069 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
0006e 418b4814                       mov        ecx, dword ptr [r8 + 0x14]
00072 498bf2                         mov        rsi, r10
00075 4d8bc3                         mov        r8, r11
00078 498bd1                         mov        rdx, r9
0007b 4c8bcb                         mov        r9, rbx
0007e 488b2c24                       mov        rbp, qword ptr [rsp]
00082 90                             nop        
00083 e858a4a8ff                     call       0x7f703f8fa860
00088 0f1f840080010000               nop        dword ptr [rax + rax + 0x180]
00090 4885ed                         test       rbp, rbp
00093 0f849f000000                   je         0x7f703fe704b8
00099 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0009e 410fb6aa8c000000               movzx      ebp, byte ptr [r10 + 0x8c]
000a6 85ed                           test       ebp, ebp
000a8 0f85a2000000                   jne        0x7f703fe704d0
000ae bd01000000                     mov        ebp, 1
000b3 0f1f8000000000                 nop        dword ptr [rax]
000ba 660f1f440000                   nop        word ptr [rax + rax]
000c0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
000c5 418b5a04                       mov        ebx, dword ptr [r10 + 4]
000c9 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
000cd 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
000d2 458b4b1c                       mov        r9d, dword ptr [r11 + 0x1c]
000d6 458b4318                       mov        r8d, dword ptr [r11 + 0x18]
000da 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
000de 488bf3                         mov        rsi, rbx
000e1 498bcb                         mov        rcx, r11
000e4 498bd2                         mov        rdx, r10
000e7 e8f4a3a8ff                     call       0x7f703f8fa860
000ec 0f1f8400e4010001               nop        dword ptr [rax + rax + 0x10001e4]
000f4 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
000f9 450fb69a8c000000               movzx      r11d, byte ptr [r10 + 0x8c]
00101 48ffc5                         inc        rbp
00104 4585db                         test       r11d, r11d
00107 74b7                           je         0x7f703fe70440
00109 be45ffffff                     mov        esi, 0xffffff45
0010e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00113 e84849b5ff                     call       0x7f703f9c4de0
00118 0f1f840010020002               nop        dword ptr [rax + rax + 0x2000210]
00120 bef6ffffff                     mov        esi, 0xfffffff6
00125 488be8                         mov        rbp, rax
00128 666690                         nop        
0012b e83049b5ff                     call       0x7f703f9c4de0
00130 0f1f840028020003               nop        dword ptr [rax + rax + 0x3000228]
00138 bef6ffffff                     mov        esi, 0xfffffff6
0013d 488be8                         mov        rbp, rax
00140 666690                         nop        
00143 e81849b5ff                     call       0x7f703f9c4de0
00148 0f1f840040020004               nop        dword ptr [rax + rax + 0x4000240]
00150 be45ffffff                     mov        esi, 0xffffff45
00155 6690                           nop        
00157 e80449b5ff                     call       0x7f703f9c4de0
0015c 0f1f840054020005               nop        dword ptr [rax + rax + 0x5000254]
00164 488bf0                         mov        rsi, rax
00167 eb03                           jmp        0x7f703fe704ec
00169 488bf0                         mov        rsi, rax
0016c 4883c420                       add        rsp, 0x20
00170 5d                             pop        rbp
00171 e96abcb5ff                     jmp        0x7f703f9cc160
00176 bef6ffffff                     mov        esi, 0xfffffff6
0017b e8e048b5ff                     call       0x7f703f9c4de0
00180 0f1f840078020006               nop        dword ptr [rax + rax + 0x6000278]
00188 bef6ffffff                     mov        esi, 0xfffffff6
0018d 6690                           nop        
0018f e8cc48b5ff                     call       0x7f703f9c4de0
00194 0f1f84008c020007               nop        dword ptr [rax + rax + 0x700028c]
0019c e87f95a7ff                     call       0x7f703f8e9aa0
001a1 e974feffff                     jmp        0x7f703fe7039a
001a6 f4                             hlt        
001a7 f4                             hlt        
