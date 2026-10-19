00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0a6b5ff                   jne        0x7fc48772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec90000000                 sub        rsp, 0x90
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f857b0c0000                   jne        0x7fc487bd5339
0003e 448bf7                         mov        r14d, edi
00041 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00046 4d8be8                         mov        r13, r8
00049 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004d 488bde                         mov        rbx, rsi
00050 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00053 8b4e04                         mov        ecx, dword ptr [rsi + 4]
00056 448bd9                         mov        r11d, ecx
00059 442bd8                         sub        r11d, eax
0005c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00064 453bd3                         cmp        r10d, r11d
00067 0f8fa7060000                   jg         0x7fc487bd4d94
0006d 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00071 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00076 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007a 4c638424a0000000               movsxd     r8, dword ptr [rsp + 0xa0]
00082 4c63c8                         movsxd     r9, eax
00085 4c034c2440                     add        r9, qword ptr [rsp + 0x40]
0008a 4d2bd9                         sub        r11, r9
0008d 4d3bc3                         cmp        r8, r11
00090 0f8fb6060000                   jg         0x7fc487bd4dcc
00096 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
0009a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0009f 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a3 448b5640                       mov        r10d, dword ptr [rsi + 0x40]
000a7 4489542434                     mov        dword ptr [rsp + 0x34], r10d
000ac 4d85db                         test       r11, r11
000af 0f859b040000                   jne        0x7fc487bd4bd0
000b5 4d03c8                         add        r9, r8
000b8 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
000bd 0f8fc5060000                   jg         0x7fc487bd4e08
000c3 4c8bc2                         mov        r8, rdx
000c6 8b7a04                         mov        edi, dword ptr [rdx + 4]
000c9 458bce                         mov        r9d, r14d
000cc 4585c9                         test       r9d, r9d
000cf 0f8ef7010000                   jle        0x7fc487bd494c
000d5 89442430                       mov        dword ptr [rsp + 0x30], eax
000d9 448d5fe0                       lea        r11d, [rdi - 0x20]
000dd 894c2438                       mov        dword ptr [rsp + 0x38], ecx
000e1 448d51e0                       lea        r10d, [rcx - 0x20]
000e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
000ea 48f7dd                         neg        rbp
000ed 418b5504                       mov        edx, dword ptr [r13 + 4]
000f1 85d2                           test       edx, edx
000f3 0f868e030000                   jbe        0x7fc487bd4b07
000f9 4963c9                         movsxd     rcx, r9d
000fc 4863d2                         movsxd     rdx, edx
000ff 48ffc9                         dec        rcx
00102 483bca                         cmp        rcx, rdx
00105 0f837c030000                   jae        0x7fc487bd4b07
0010b 4c8bb424a8000000               mov        r14, qword ptr [rsp + 0xa8]
00113 418b4604                       mov        eax, dword ptr [r14 + 4]
00117 85c0                           test       eax, eax
00119 0f86b9040000                   jbe        0x7fc487bd4c58
0011f 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00123 33c9                           xor        ecx, ecx
00125 4889742428                     mov        qword ptr [rsp + 0x28], rsi
0012a 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0012f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00134 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0013c 488f442458                     pop        qword ptr [rsp + 0x58]
00141 897c2464                       mov        dword ptr [rsp + 0x64], edi
00145 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0014a 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0014f 48896c2478                     mov        qword ptr [rsp + 0x78], rbp
00154 898424a0000000                 mov        dword ptr [rsp + 0xa0], eax
0015b 4533db                         xor        r11d, r11d
0015e 4d8b54cd08                     mov        r10, qword ptr [r13 + rcx*8 + 8]
00163 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00167 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
0016c 4d8bc2                         mov        r8, r10
0016f 49c1f824                       sar        r8, 0x24
00173 418bc8                         mov        ecx, r8d
00176 4d8bc2                         mov        r8, r10
00179 49c1e812                       shr        r8, 0x12
0017d 458bca                         mov        r9d, r10d
00180 418bc0                         mov        eax, r8d
00183 4181e1ffff0100                 and        r9d, 0x1ffff
0018a 25ffff0300                     and        eax, 0x3ffff
0018f 85c9                           test       ecx, ecx
00191 0f8c4d070000                   jl         0x7fc487bd4f64
00197 4585c9                         test       r9d, r9d
0019a 0f84db010000                   je         0x7fc487bd49fb
001a0 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001a4 412beb                         sub        ebp, r11d
001a7 443bcd                         cmp        r9d, ebp
001aa 0f8f5c080000                   jg         0x7fc487bd508c
001b0 83f903                         cmp        ecx, 3
001b3 0f8fca010000                   jg         0x7fc487bd4a03
001b9 4585c9                         test       r9d, r9d
001bc 0f847e080000                   je         0x7fc487bd50c0
001c2 83f901                         cmp        ecx, 1
001c5 0f8571060000                   jne        0x7fc487bd4ebc
001cb 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
001d0 458b5008                       mov        r10d, dword ptr [r8 + 8]
001d4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
001d9 8bbc24a0000000                 mov        edi, dword ptr [rsp + 0xa0]
001e0 4d63d1                         movsxd     r10, r9d
001e3 4863da                         movsxd     rbx, edx
001e6 48035c2440                     add        rbx, qword ptr [rsp + 0x40]
001eb 4903da                         add        rbx, r10
001ee 4c63542460                     movsxd     r10, dword ptr [rsp + 0x60]
001f3 4c3bd3                         cmp        r10, rbx
001f6 0f8f84070000                   jg         0x7fc487bd5000
001fc 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00200 85c9                           test       ecx, ecx
00202 0f8efc050000                   jle        0x7fc487bd4e84
00208 428d340a                       lea        esi, [rdx + r9]
0020c 03f0                           add        esi, eax
0020e 438d1c0b                       lea        ebx, [r11 + r9]
00212 3b742474                       cmp        esi, dword ptr [rsp + 0x74]
00216 0f8f9c010000                   jg         0x7fc487bd4a38
0021c 3b5c2470                       cmp        ebx, dword ptr [rsp + 0x70]
00220 0f8fc2080000                   jg         0x7fc487bd5168
00226 4183f910                       cmp        r9d, 0x10
0022a 0f8e3c040000                   jle        0x7fc487bd4cec
00230 be45ffffff                     mov        esi, 0xffffff45
00235 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0023a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0023f 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00247 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0024c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00251 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00255 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
0025c 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00261 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00266 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0026b 89542428                       mov        dword ptr [rsp + 0x28], edx
0026f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00274 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00279 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0027e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00283 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00288 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0028d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00292 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00297 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0029c 89442448                       mov        dword ptr [rsp + 0x48], eax
002a0 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
002a5 90                             nop        
002a6 90                             nop        
002a7 90                             nop        
002a8 c5f877                         vzeroupper 
002ab e83091afff                     call       0x7fc4876cda60
002b0 0f1f8400a8030000               nop        dword ptr [rax + rax + 0x3a8]
002b8 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
002c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
002c6 e8953bb817                     call       0x7fc49f7584e0
002cb f4                             hlt        
002cc 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
002d1 4533db                         xor        r11d, r11d
002d4 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
002d9 418b4904                       mov        ecx, dword ptr [r9 + 4]
002dd 4585db                         test       r11d, r11d
002e0 0f8c26020000                   jl         0x7fc487bd4b8c
002e6 85c0                           test       eax, eax
002e8 0f8c1e020000                   jl         0x7fc487bd4b8c
002ee 3b7c240c                       cmp        edi, dword ptr [rsp + 0xc]
002f2 0f8214020000                   jb         0x7fc487bd4b8c
002f8 428d2c10                       lea        ebp, [rax + r10]
002fc 3bcd                           cmp        ecx, ebp
002fe 0f8208020000                   jb         0x7fc487bd4b8c
00304 4585d2                         test       r10d, r10d
00307 0f8cff010000                   jl         0x7fc487bd4b8c
0030d 4585d2                         test       r10d, r10d
00310 7436                           je         0x7fc487bd49c8
00312 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00317 4d8bd9                         mov        r11, r9
0031a 498d740108                     lea        rsi, [r9 + rax + 8]
0031f 4963d2                         movsxd     rdx, r10d
00322 4883fa20                       cmp        rdx, 0x20
00326 7739                           ja         0x7fc487bd49e1
00328 4d63d2                         movsxd     r10, r10d
0032b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00332 c442a8f5db                     bzhi       r11, r11, r10
00337 c4c1fb92fb                     kmovq      k7, r11
0033c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00342 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00348 896b38                         mov        dword ptr [rbx + 0x38], ebp
0034b c5f877                         vzeroupper 
0034e 4881c490000000                 add        rsp, 0x90
00355 5d                             pop        rbp
00356 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0035a 0f8743090000                   ja         0x7fc487bd5323
00360 c3                             ret        
00361 c5f877                         vzeroupper 
00364 49ba40917187c47f0000           movabs     r10, 0x7fc487719140
0036e 41ffd2                         call       r10
00371 0f1f840000000000               nop        dword ptr [rax + rax]
00379 ebcd                           jmp        0x7fc487bd49c8
0037b 4533c9                         xor        r9d, r9d
0037e e92dfeffff                     jmp        0x7fc487bd4830
00383 83c1fd                         add        ecx, -3
00386 8bbc24a0000000                 mov        edi, dword ptr [rsp + 0xa0]
0038d 83ff02                         cmp        edi, 2
00390 0f86ee070000                   jbe        0x7fc487bd5204
00396 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0039b 418b580c                       mov        ebx, dword ptr [r8 + 0xc]
0039f 41895810                       mov        dword ptr [r8 + 0x10], ebx
003a3 458b5008                       mov        r10d, dword ptr [r8 + 8]
003a7 4589500c                       mov        dword ptr [r8 + 0xc], r10d
003ab 41894808                       mov        dword ptr [r8 + 8], ecx
003af 894c2460                       mov        dword ptr [rsp + 0x60], ecx
003b3 e928feffff                     jmp        0x7fc487bd4860
003b8 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
003bf 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
003c7 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
003ce 4c89442458                     mov        qword ptr [rsp + 0x58], r8
003d3 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
003d8 4d8bd0                         mov        r10, r8
003db 4c3b25b6527b18                 cmp        r12, qword ptr [rip + 0x187b52b6]
003e2 0f8414000000                   je         0x7fc487bd4a7c
003e8 48bf38c3459ec47f0000           movabs     rdi, 0x7fc49e45c338
003f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
003f6 e8653ab817                     call       0x7fc49f7584e0
003fb f4                             hlt        
003fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00401 418beb                         mov        ebp, r11d
00404 498bf2                         mov        rsi, r10
00407 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0040b 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00410 418bf9                         mov        edi, r9d
00413 48894424f8                     mov        qword ptr [rsp - 8], rax
00418 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0041c 890424                         mov        dword ptr [rsp], eax
0041f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00424 89442408                       mov        dword ptr [rsp + 8], eax
00428 458bcb                         mov        r9d, r11d
0042b 90                             nop        
0042c c5f877                         vzeroupper 
0042f e8acb1b5ff                     call       0x7fc48772fc60
00434 0f1f84002c050001               nop        dword ptr [rax + rax + 0x100052c]
0043c 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00440 ffc1                           inc        ecx
00442 3b4c2430                       cmp        ecx, dword ptr [rsp + 0x30]
00446 7d17                           jge        0x7fc487bd4adf
00448 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00450 8bd0                           mov        edx, eax
00452 4c8b6c2410                     mov        r13, qword ptr [rsp + 0x10]
00457 458bda                         mov        r11d, r10d
0045a e9fffcffff                     jmp        0x7fc487bd47de
0045f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00464 442b9424a8000000               sub        r10d, dword ptr [rsp + 0xa8]
0046c 488b5c2428                     mov        rbx, qword ptr [rsp + 0x28]
00471 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00476 8b7c2464                       mov        edi, dword ptr [rsp + 0x64]
0047a 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00482 e94dfeffff                     jmp        0x7fc487bd4954
00487 be6effffff                     mov        esi, 0xffffff6e
0048c 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00494 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00499 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
0049e 48894424f8                     mov        qword ptr [rsp - 8], rax
004a3 8b442434                       mov        eax, dword ptr [rsp + 0x34]
004a7 8944242c                       mov        dword ptr [rsp + 0x2c], eax
004ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004b0 48894424f8                     mov        qword ptr [rsp - 8], rax
004b5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
004b9 89442434                       mov        dword ptr [rsp + 0x34], eax
004bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004c2 48ff742440                     push       qword ptr [rsp + 0x40]
004c7 488f442438                     pop        qword ptr [rsp + 0x38]
004cc 48ff742448                     push       qword ptr [rsp + 0x48]
004d1 488f442440                     pop        qword ptr [rsp + 0x40]
004d6 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
004db 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
004e0 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
004e5 90                             nop        
004e6 90                             nop        
004e7 90                             nop        
004e8 c5f877                         vzeroupper 
004eb e8f08eafff                     call       0x7fc4876cda60
004f0 0f1f8400e8050002               nop        dword ptr [rax + rax + 0x20005e8]
004f8 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00502 4883e4f0                       and        rsp, 0xfffffffffffffff0
00506 e85539b817                     call       0x7fc49f7584e0
0050b f4                             hlt        
0050c beccffffff                     mov        esi, 0xffffffcc
00511 488beb                         mov        rbp, rbx
00514 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
0051c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00521 89442414                       mov        dword ptr [rsp + 0x14], eax
00525 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0052a 90                             nop        
0052b 90                             nop        
0052c c5f877                         vzeroupper 
0052f e8ac8eafff                     call       0x7fc4876cda60
00534 0f1f84002c060003               nop        dword ptr [rax + rax + 0x300062c]
0053c 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00546 4883e4f0                       and        rsp, 0xfffffffffffffff0
0054a e81139b817                     call       0x7fc49f7584e0
0054f f4                             hlt        
00550 4533d2                         xor        r10d, r10d
00553 4d3bda                         cmp        r11, r10
00556 bdffffffff                     mov        ebp, 0xffffffff
0055b 7c08                           jl         0x7fc487bd4be5
0055d 400f95c5                       setne      bpl
00561 400fb6ed                       movzx      ebp, bpl
00565 be45ffffff                     mov        esi, 0xffffff45
0056a 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00572 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00577 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
0057c 897c2428                       mov        dword ptr [rsp + 0x28], edi
00580 48894424f8                     mov        qword ptr [rsp - 8], rax
00585 8b442434                       mov        eax, dword ptr [rsp + 0x34]
00589 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0058d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00592 89442430                       mov        dword ptr [rsp + 0x30], eax
00596 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0059a 48ff742440                     push       qword ptr [rsp + 0x40]
0059f 488f442438                     pop        qword ptr [rsp + 0x38]
005a4 48ff742448                     push       qword ptr [rsp + 0x48]
005a9 488f442440                     pop        qword ptr [rsp + 0x40]
005ae 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
005b3 90                             nop        
005b4 c5f877                         vzeroupper 
005b7 e8248eafff                     call       0x7fc4876cda60
005bc 0f1f8400b4060004               nop        dword ptr [rax + rax + 0x40006b4]
005c4 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
005ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
005d2 e88938b817                     call       0x7fc49f7584e0
005d7 f4                             hlt        
005d8 bebeffffff                     mov        esi, 0xffffffbe
005dd 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
005e5 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
005ed 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
005f2 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
005f7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
005fc 4c89742428                     mov        qword ptr [rsp + 0x28], r14
00601 48894424f8                     mov        qword ptr [rsp - 8], rax
00606 8b442434                       mov        eax, dword ptr [rsp + 0x34]
0060a 89442424                       mov        dword ptr [rsp + 0x24], eax
0060e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00613 48894424f8                     mov        qword ptr [rsp - 8], rax
00618 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0061c 89442434                       mov        dword ptr [rsp + 0x34], eax
00620 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00625 48ff742440                     push       qword ptr [rsp + 0x40]
0062a 488f442438                     pop        qword ptr [rsp + 0x38]
0062f 48ff742448                     push       qword ptr [rsp + 0x48]
00634 488f442440                     pop        qword ptr [rsp + 0x40]
00639 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0063e 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00643 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00648 c5f877                         vzeroupper 
0064b e8908dafff                     call       0x7fc4876cda60
00650 0f1f840048070005               nop        dword ptr [rax + rax + 0x5000748]
00658 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00662 4883e4f0                       and        rsp, 0xfffffffffffffff0
00666 e8f537b817                     call       0x7fc49f7584e0
0066b f4                             hlt        
0066c be45ffffff                     mov        esi, 0xffffff45
00671 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00676 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0067b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00683 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00687 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
0068e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00693 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00698 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0069d 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
006a5 4c89442420                     mov        qword ptr [rsp + 0x20], r8
006aa 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
006af 448944240c                     mov        dword ptr [rsp + 0xc], r8d
006b4 89542428                       mov        dword ptr [rsp + 0x28], edx
006b8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006bd 4489542430                     mov        dword ptr [rsp + 0x30], r10d
006c2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006c7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
006cc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006d1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
006d6 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
006db 4489442434                     mov        dword ptr [rsp + 0x34], r8d
006e0 89442448                       mov        dword ptr [rsp + 0x48], eax
006e4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
006e9 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
006ee 90                             nop        
006ef 90                             nop        
006f0 c5f877                         vzeroupper 
006f3 e8e88cafff                     call       0x7fc4876cda60
006f8 0f1f8400f0070006               nop        dword ptr [rax + rax + 0x60007f0]
00700 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
0070a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0070e e84d37b817                     call       0x7fc49f7584e0
00713 f4                             hlt        
00714 be45ffffff                     mov        esi, 0xffffff45
00719 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00720 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00728 c5f877                         vzeroupper 
0072b e8b08cafff                     call       0x7fc4876cda60
00730 0f1f840028080007               nop        dword ptr [rax + rax + 0x7000828]
00738 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00742 4883e4f0                       and        rsp, 0xfffffffffffffff0
00746 e81537b817                     call       0x7fc49f7584e0
0074b f4                             hlt        
0074c 4d3bc3                         cmp        r8, r11
0074f bdffffffff                     mov        ebp, 0xffffffff
00754 7c08                           jl         0x7fc487bd4dde
00756 400f95c5                       setne      bpl
0075a 400fb6ed                       movzx      ebp, bpl
0075e be45ffffff                     mov        esi, 0xffffff45
00763 90                             nop        
00764 c5f877                         vzeroupper 
00767 e8748cafff                     call       0x7fc4876cda60
0076c 0f1f840064080008               nop        dword ptr [rax + rax + 0x8000864]
00774 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
0077e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00782 e8d936b817                     call       0x7fc49f7584e0
00787 f4                             hlt        
00788 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0078d 4d3bca                         cmp        r9, r10
00790 bdffffffff                     mov        ebp, 0xffffffff
00795 7c08                           jl         0x7fc487bd4e1f
00797 400f95c5                       setne      bpl
0079b 400fb6ed                       movzx      ebp, bpl
0079f be45ffffff                     mov        esi, 0xffffff45
007a4 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
007ac 4889542410                     mov        qword ptr [rsp + 0x10], rdx
007b1 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
007b6 897c2428                       mov        dword ptr [rsp + 0x28], edi
007ba 48894424f8                     mov        qword ptr [rsp - 8], rax
007bf 8b442434                       mov        eax, dword ptr [rsp + 0x34]
007c3 8944242c                       mov        dword ptr [rsp + 0x2c], eax
007c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007cc 89442430                       mov        dword ptr [rsp + 0x30], eax
007d0 894c2434                       mov        dword ptr [rsp + 0x34], ecx
007d4 48ff742440                     push       qword ptr [rsp + 0x40]
007d9 488f442438                     pop        qword ptr [rsp + 0x38]
007de 90                             nop        
007df 90                             nop        
007e0 c5f877                         vzeroupper 
007e3 e8f88bafff                     call       0x7fc4876cda60
007e8 0f1f8400e0080009               nop        dword ptr [rax + rax + 0x90008e0]
007f0 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
007fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
007fe e85d36b817                     call       0x7fc49f7584e0
00803 f4                             hlt        
00804 be45ffffff                     mov        esi, 0xffffff45
00809 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0080e 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
00816 90                             nop        
00817 90                             nop        
00818 c5f877                         vzeroupper 
0081b e8c08bafff                     call       0x7fc4876cda60
00820 0f1f84001809000a               nop        dword ptr [rax + rax + 0xa000918]
00828 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00832 4883e4f0                       and        rsp, 0xfffffffffffffff0
00836 e82536b817                     call       0x7fc49f7584e0
0083b f4                             hlt        
0083c ffc9                           dec        ecx
0083e be45ffffff                     mov        esi, 0xffffff45
00843 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00848 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0084d 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00855 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0085a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0085f 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00864 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
0086c 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00871 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00876 89542428                       mov        dword ptr [rsp + 0x28], edx
0087a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0087f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00884 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00889 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0088e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00893 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00898 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0089d 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
008a2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
008a7 89442448                       mov        dword ptr [rsp + 0x48], eax
008ab 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
008b0 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008b5 894c2458                       mov        dword ptr [rsp + 0x58], ecx
008b9 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
008be 90                             nop        
008bf 90                             nop        
008c0 c5f877                         vzeroupper 
008c3 e8188bafff                     call       0x7fc4876cda60
008c8 0f1f8400c009000b               nop        dword ptr [rax + rax + 0xb0009c0]
008d0 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
008da 4883e4f0                       and        rsp, 0xfffffffffffffff0
008de e87d35b817                     call       0x7fc49f7584e0
008e3 f4                             hlt        
008e4 be45ffffff                     mov        esi, 0xffffff45
008e9 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
008ee 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008f3 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
008fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00900 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00905 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0090a 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00912 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00917 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0091c 89542428                       mov        dword ptr [rsp + 0x28], edx
00920 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00925 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0092a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0092f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00934 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00939 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0093e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00943 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00948 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0094d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00952 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00956 894c2450                       mov        dword ptr [rsp + 0x50], ecx
0095a 90                             nop        
0095b 90                             nop        
0095c c5f877                         vzeroupper 
0095f e87c8aafff                     call       0x7fc4876cda60
00964 0f1f84005c0a000c               nop        dword ptr [rax + rax + 0xc000a5c]
0096c 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097a e8e134b817                     call       0x7fc49f7584e0
0097f f4                             hlt        
00980 4c3bd3                         cmp        r10, rbx
00983 bdffffffff                     mov        ebp, 0xffffffff
00988 7c08                           jl         0x7fc487bd5012
0098a 400f95c5                       setne      bpl
0098e 400fb6ed                       movzx      ebp, bpl
00992 be45ffffff                     mov        esi, 0xffffff45
00997 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0099c 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
009a4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009a9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009ae 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
009b3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
009b8 4c89442428                     mov        qword ptr [rsp + 0x28], r8
009bd 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
009c2 4489442424                     mov        dword ptr [rsp + 0x24], r8d
009c7 89542430                       mov        dword ptr [rsp + 0x30], edx
009cb 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
009d0 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
009d5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
009da 89442450                       mov        dword ptr [rsp + 0x50], eax
009de 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
009e3 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
009e8 c5f877                         vzeroupper 
009eb e8f089afff                     call       0x7fc4876cda60
009f0 0f1f8400e80a000d               nop        dword ptr [rax + rax + 0xd000ae8]
009f8 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a06 e85534b817                     call       0x7fc49f7584e0
00a0b f4                             hlt        
00a0c be45ffffff                     mov        esi, 0xffffff45
00a11 44898c24a0000000               mov        dword ptr [rsp + 0xa0], r9d
00a19 90                             nop        
00a1a 90                             nop        
00a1b 90                             nop        
00a1c c5f877                         vzeroupper 
00a1f e8bc89afff                     call       0x7fc4876cda60
00a24 0f1f84001c0b000e               nop        dword ptr [rax + rax + 0xe000b1c]
00a2c 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00a36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a3a e82134b817                     call       0x7fc49f7584e0
00a3f f4                             hlt        
00a40 ffc9                           dec        ecx
00a42 be45ffffff                     mov        esi, 0xffffff45
00a47 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00a4c 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
00a51 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00a59 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a5e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a63 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00a68 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00a70 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00a75 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a7a 89542428                       mov        dword ptr [rsp + 0x28], edx
00a7e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00a83 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a88 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00a8d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a92 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a97 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a9c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00aa1 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00aa6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00aab 89442448                       mov        dword ptr [rsp + 0x48], eax
00aaf 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00ab4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00ab9 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00abd 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00ac2 90                             nop        
00ac3 90                             nop        
00ac4 c5f877                         vzeroupper 
00ac7 e81489afff                     call       0x7fc4876cda60
00acc 0f1f8400c40b000f               nop        dword ptr [rax + rax + 0xf000bc4]
00ad4 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ae2 e87933b817                     call       0x7fc49f7584e0
00ae7 f4                             hlt        
00ae8 be45ffffff                     mov        esi, 0xffffff45
00aed 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00af2 8b7c240c                       mov        edi, dword ptr [rsp + 0xc]
00af6 89bc24a8000000                 mov        dword ptr [rsp + 0xa8], edi
00afd 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b02 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b07 8b7c2430                       mov        edi, dword ptr [rsp + 0x30]
00b0b 89bc24ac000000                 mov        dword ptr [rsp + 0xac], edi
00b12 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00b17 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00b1c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b21 89542428                       mov        dword ptr [rsp + 0x28], edx
00b25 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b2a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b2f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b34 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00b39 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00b3e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00b43 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00b48 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00b4d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b52 89442448                       mov        dword ptr [rsp + 0x48], eax
00b56 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00b5a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00b5f 90                             nop        
00b60 c5f877                         vzeroupper 
00b63 e87888afff                     call       0x7fc4876cda60
00b68 0f1f8400600c0010               nop        dword ptr [rax + rax + 0x10000c60]
00b70 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00b7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b7e e8dd32b817                     call       0x7fc49f7584e0
00b83 f4                             hlt        
00b84 bee4ffffff                     mov        esi, 0xffffffe4
00b89 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00b8e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00b93 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00b9b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ba0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ba5 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00baa 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00bb2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00bb7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00bbc 89542428                       mov        dword ptr [rsp + 0x28], edx
00bc0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00bc5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00bca 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bcf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00bd4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00bd9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00bde 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00be3 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00be8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00bed 89442448                       mov        dword ptr [rsp + 0x48], eax
00bf1 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00bf5 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00bfa 90                             nop        
00bfb 90                             nop        
00bfc c5f877                         vzeroupper 
00bff e8dc87afff                     call       0x7fc4876cda60
00c04 0f1f8400fc0c0011               nop        dword ptr [rax + rax + 0x11000cfc]
00c0c 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00c16 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c1a e84132b817                     call       0x7fc49f7584e0
00c1f f4                             hlt        
00c20 bef6ffffff                     mov        esi, 0xfffffff6
00c25 90                             nop        
00c26 90                             nop        
00c27 90                             nop        
00c28 c5f877                         vzeroupper 
00c2b e8b087afff                     call       0x7fc4876cda60
00c30 0f1f8400280d0012               nop        dword ptr [rax + rax + 0x12000d28]
00c38 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00c42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c46 e81532b817                     call       0x7fc49f7584e0
00c4b f4                             hlt        
00c4c bef6ffffff                     mov        esi, 0xfffffff6
00c51 498be8                         mov        rbp, r8
00c54 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00c5c 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
00c63 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00c6b 90                             nop        
00c6c c5f877                         vzeroupper 
00c6f e86c87afff                     call       0x7fc4876cda60
00c74 0f1f84006c0d0013               nop        dword ptr [rax + rax + 0x13000d6c]
00c7c 48bfe0ad2260c47f0000           movabs     rdi, 0x7fc46022ade0
00c86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8a e8d131b817                     call       0x7fc49f7584e0
00c8f f4                             hlt        
00c90 488bf0                         mov        rsi, rax
00c93 c5f877                         vzeroupper 
00c96 4881c490000000                 add        rsp, 0x90
00c9d 5d                             pop        rbp
00c9e e93d3dafff                     jmp        0x7fc4876c9060
00ca3 49bad649bd87c47f0000           movabs     r10, 0x7fc487bd49d6
00cad 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00cb4 e927d0b5ff                     jmp        0x7fc487732360
00cb9 e8a29eb4ff                     call       0x7fc48771f1e0
00cbe e97bf3ffff                     jmp        0x7fc487bd46be
00cc3 f4                             hlt        
00cc4 f4                             hlt        
00cc5 f4                             hlt        
00cc6 f4                             hlt        
00cc7 f4                             hlt        
