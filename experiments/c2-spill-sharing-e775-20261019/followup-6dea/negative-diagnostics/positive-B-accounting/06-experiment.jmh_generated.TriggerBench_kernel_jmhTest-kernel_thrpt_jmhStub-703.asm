00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4883ec20                       sub        rsp, 0x20
0000c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00014 0f85a8010000                   jne        0x7f57f3e71442
0001a 48893c24                       mov        qword ptr [rsp], rdi
0001e 4889742438                     mov        qword ptr [rsp + 0x38], rsi
00023 4889542430                     mov        qword ptr [rsp + 0x30], rdx
00028 49bae08db60c587f0000           movabs     r10, 0x7f580cb68de0
00032 41ffd2                         call       r10
00035 0f1f840000000000               nop        dword ptr [rax + rax]
0003d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00042 4d85d2                         test       r10, r10
00045 0f84fb000000                   je         0x7f57f3e713c6
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
00083 e85895a8ff                     call       0x7f57f38fa860
00088 0f1f840080010000               nop        dword ptr [rax + rax + 0x180]
00090 4885ed                         test       rbp, rbp
00093 0f84c3000000                   je         0x7f57f3e713dc
00099 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0009e 450fb6928c000000               movzx      r10d, byte ptr [r10 + 0x8c]
000a6 bd01000000                     mov        ebp, 1
000ab 4585d2                         test       r10d, r10d
000ae 7555                           jne        0x7f57f3e71385
000b0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
000b5 418b5a04                       mov        ebx, dword ptr [r10 + 4]
000b9 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
000bd 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
000c2 458b5b1c                       mov        r11d, dword ptr [r11 + 0x1c]
000c6 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
000cb 458b4018                       mov        r8d, dword ptr [r8 + 0x18]
000cf 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
000d4 418b4914                       mov        ecx, dword ptr [r9 + 0x14]
000d8 488bf3                         mov        rsi, rbx
000db 4d8bcb                         mov        r9, r11
000de 498bd2                         mov        rdx, r10
000e1 6690                           nop        
000e3 e8f894a8ff                     call       0x7f57f38fa860
000e8 0f1f8400e0010001               nop        dword ptr [rax + rax + 0x10001e0]
000f0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
000f5 450fb69a8c000000               movzx      r11d, byte ptr [r10 + 0x8c]
000fd 48ffc5                         inc        rbp
00100 4585db                         test       r11d, r11d
00103 74ab                           je         0x7f57f3e71330
00105 49bae08db60c587f0000           movabs     r10, 0x7f580cb68de0
0010f 41ffd2                         call       r10
00112 0f1f840000000000               nop        dword ptr [rax + rax]
0011a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0011f 49894228                       mov        qword ptr [r10 + 0x28], rax
00123 4d896218                       mov        qword ptr [r10 + 0x18], r12
00127 c5f9efc0                       vpxor      xmm0, xmm0, xmm0
0012b c4e1fb2ac5                     vcvtsi2sd  xmm0, xmm0, rbp
00130 c4c17b114210                   vmovsd     qword ptr [r10 + 0x10], xmm0
00136 4883c420                       add        rsp, 0x20
0013a 5d                             pop        rbp
0013b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0013f 0f8767000000                   ja         0x7f57f3e7142c
00145 c3                             ret        
00146 bef6ffffff                     mov        esi, 0xfffffff6
0014b 488be8                         mov        rbp, rax
0014e 90                             nop        
0014f e88c2ab5ff                     call       0x7f57f39c3e60
00154 0f1f84004c020002               nop        dword ptr [rax + rax + 0x200024c]
0015c bef6ffffff                     mov        esi, 0xfffffff6
00161 488be8                         mov        rbp, rax
00164 666690                         nop        
00167 e8742ab5ff                     call       0x7f57f39c3e60
0016c 0f1f840064020003               nop        dword ptr [rax + rax + 0x3000264]
00174 488bf0                         mov        rsi, rax
00177 eb03                           jmp        0x7f57f3e713fc
00179 488bf0                         mov        rsi, rax
0017c 4883c420                       add        rsp, 0x20
00180 5d                             pop        rbp
00181 e9da41b5ff                     jmp        0x7f57f39c55e0
00186 bef6ffffff                     mov        esi, 0xfffffff6
0018b e8502ab5ff                     call       0x7f57f39c3e60
00190 0f1f840088020004               nop        dword ptr [rax + rax + 0x4000288]
00198 bef6ffffff                     mov        esi, 0xfffffff6
0019d 6690                           nop        
0019f e83c2ab5ff                     call       0x7f57f39c3e60
001a4 0f1f84009c020005               nop        dword ptr [rax + rax + 0x500029c]
001ac 49babb13e7f3577f0000           movabs     r10, 0x7f57f3e713bb
001b6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
001bd e99ebaa8ff                     jmp        0x7f57f38fcee0
001c2 e85986a7ff                     call       0x7f57f38e9aa0
001c7 e94efeffff                     jmp        0x7f57f3e7129a
001cc f4                             hlt        
001cd f4                             hlt        
001ce f4                             hlt        
001cf f4                             hlt        
