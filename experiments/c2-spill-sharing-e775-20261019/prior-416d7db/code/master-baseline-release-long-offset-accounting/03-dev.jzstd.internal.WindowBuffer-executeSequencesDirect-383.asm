00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540c0a9ff                   jne        0x7f959b8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec90000000                 sub        rsp, 0x90
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85df0a0000                   jne        0x7f959be5f41d
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
00067 0f8f0f060000                   jg         0x7f959be5ef7c
0006d 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00071 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00076 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007a 4c638424a0000000               movsxd     r8, dword ptr [rsp + 0xa0]
00082 4c63c8                         movsxd     r9, eax
00085 4c034c2440                     add        r9, qword ptr [rsp + 0x40]
0008a 4d2bd9                         sub        r11, r9
0008d 4d3bc3                         cmp        r8, r11
00090 0f8f0a060000                   jg         0x7f959be5efa0
00096 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
0009a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0009f 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a3 448b5640                       mov        r10d, dword ptr [rsi + 0x40]
000a7 4489542434                     mov        dword ptr [rsp + 0x34], r10d
000ac 4d85db                         test       r11, r11
000af 0f853f040000                   jne        0x7f959be5edf4
000b5 4d03c8                         add        r9, r8
000b8 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
000bd 0f8f05060000                   jg         0x7f959be5efc8
000c3 4c8bc2                         mov        r8, rdx
000c6 8b7a04                         mov        edi, dword ptr [rdx + 4]
000c9 458bce                         mov        r9d, r14d
000cc 4585c9                         test       r9d, r9d
000cf 0f8ee3010000                   jle        0x7f959be5ebb8
000d5 89442430                       mov        dword ptr [rsp + 0x30], eax
000d9 448d5fe0                       lea        r11d, [rdi - 0x20]
000dd 894c2438                       mov        dword ptr [rsp + 0x38], ecx
000e1 448d51e0                       lea        r10d, [rcx - 0x20]
000e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
000ea 48f7dd                         neg        rbp
000ed 418b5504                       mov        edx, dword ptr [r13 + 4]
000f1 85d2                           test       edx, edx
000f3 0f865a030000                   jbe        0x7f959be5ed53
000f9 4963c9                         movsxd     rcx, r9d
000fc 4863d2                         movsxd     rdx, edx
000ff 48ffc9                         dec        rcx
00102 483bca                         cmp        rcx, rdx
00105 0f8348030000                   jae        0x7f959be5ed53
0010b 4c8bb424a8000000               mov        r14, qword ptr [rsp + 0xa8]
00113 418b4604                       mov        eax, dword ptr [r14 + 4]
00117 85c0                           test       eax, eax
00119 0f8649040000                   jbe        0x7f959be5ee68
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
00191 0f8c51060000                   jl         0x7f959be5f0e8
00197 4585c9                         test       r9d, r9d
0019a 0f84c7010000                   je         0x7f959be5ec67
001a0 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001a4 412beb                         sub        ebp, r11d
001a7 443bcd                         cmp        r9d, ebp
001aa 0f8f38070000                   jg         0x7f959be5f1e8
001b0 83f903                         cmp        ecx, 3
001b3 0f8fb6010000                   jg         0x7f959be5ec6f
001b9 4585c9                         test       r9d, r9d
001bc 0f8446070000                   je         0x7f959be5f208
001c2 83f901                         cmp        ecx, 1
001c5 0f8589050000                   jne        0x7f959be5f054
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
001f6 0f8f74060000                   jg         0x7f959be5f170
001fc 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00200 85c9                           test       ecx, ecx
00202 0f8e28050000                   jle        0x7f959be5f030
00208 428d340a                       lea        esi, [rdx + r9]
0020c 03f0                           add        esi, eax
0020e 438d1c0b                       lea        ebx, [r11 + r9]
00212 3b742474                       cmp        esi, dword ptr [rsp + 0x74]
00216 0f8f88010000                   jg         0x7f959be5eca4
0021c 3b5c2470                       cmp        ebx, dword ptr [rsp + 0x70]
00220 0f8f76070000                   jg         0x7f959be5f29c
00226 4183f910                       cmp        r9d, 0x10
0022a 0f8eb8030000                   jle        0x7f959be5eee8
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
002a5 666690                         nop        
002a8 c5f877                         vzeroupper 
002ab e8b04ab6ff                     call       0x7f959b9c3660
002b0 0f1f8400a8030000               nop        dword ptr [rax + rax + 0x3a8]
002b8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
002bd 4533db                         xor        r11d, r11d
002c0 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
002c5 418b4904                       mov        ecx, dword ptr [r9 + 4]
002c9 4585db                         test       r11d, r11d
002cc 0f8cf2010000                   jl         0x7f959be5edc4
002d2 85c0                           test       eax, eax
002d4 0f8cea010000                   jl         0x7f959be5edc4
002da 3b7c240c                       cmp        edi, dword ptr [rsp + 0xc]
002de 0f82e0010000                   jb         0x7f959be5edc4
002e4 428d2c10                       lea        ebp, [rax + r10]
002e8 3bcd                           cmp        ecx, ebp
002ea 0f82d4010000                   jb         0x7f959be5edc4
002f0 4585d2                         test       r10d, r10d
002f3 0f8ccb010000                   jl         0x7f959be5edc4
002f9 4585d2                         test       r10d, r10d
002fc 7436                           je         0x7f959be5ec34
002fe 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00303 4d8bd9                         mov        r11, r9
00306 498d740108                     lea        rsi, [r9 + rax + 8]
0030b 4963d2                         movsxd     rdx, r10d
0030e 4883fa20                       cmp        rdx, 0x20
00312 7739                           ja         0x7f959be5ec4d
00314 4d63d2                         movsxd     r10, r10d
00317 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0031e c442a8f5db                     bzhi       r11, r11, r10
00323 c4c1fb92fb                     kmovq      k7, r11
00328 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0032e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00334 896b38                         mov        dword ptr [rbx + 0x38], ebp
00337 c5f877                         vzeroupper 
0033a 4881c490000000                 add        rsp, 0x90
00341 5d                             pop        rbp
00342 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00346 0f87bb070000                   ja         0x7f959be5f407
0034c c3                             ret        
0034d c5f877                         vzeroupper 
00350 49ba204f8e9b957f0000           movabs     r10, 0x7f959b8e4f20
0035a 41ffd2                         call       r10
0035d 0f1f840000000000               nop        dword ptr [rax + rax]
00365 ebcd                           jmp        0x7f959be5ec34
00367 4533c9                         xor        r9d, r9d
0036a e941feffff                     jmp        0x7f959be5eab0
0036f 83c1fd                         add        ecx, -3
00372 8bbc24a0000000                 mov        edi, dword ptr [rsp + 0xa0]
00379 83ff02                         cmp        edi, 2
0037c 0f86a2060000                   jbe        0x7f959be5f324
00382 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
00387 418b580c                       mov        ebx, dword ptr [r8 + 0xc]
0038b 41895810                       mov        dword ptr [r8 + 0x10], ebx
0038f 458b5008                       mov        r10d, dword ptr [r8 + 8]
00393 4589500c                       mov        dword ptr [r8 + 0xc], r10d
00397 41894808                       mov        dword ptr [r8 + 8], ecx
0039b 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0039f e93cfeffff                     jmp        0x7f959be5eae0
003a4 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
003ab 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
003b3 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
003ba 4c89442458                     mov        qword ptr [rsp + 0x58], r8
003bf 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
003c4 4d8bd0                         mov        r10, r8
003c7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
003cc 418beb                         mov        ebp, r11d
003cf 498bf2                         mov        rsi, r10
003d2 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
003d6 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
003db 418bf9                         mov        edi, r9d
003de 48894424f8                     mov        qword ptr [rsp - 8], rax
003e3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
003e7 890424                         mov        dword ptr [rsp], eax
003ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
003ef 89442408                       mov        dword ptr [rsp + 8], eax
003f3 458bcb                         mov        r9d, r11d
003f6 6690                           nop        
003f8 c5f877                         vzeroupper 
003fb e860cba9ff                     call       0x7f959b8fb860
00400 0f1f8400f8040001               nop        dword ptr [rax + rax + 0x10004f8]
00408 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
0040c ffc1                           inc        ecx
0040e 3b4c2430                       cmp        ecx, dword ptr [rsp + 0x30]
00412 7d17                           jge        0x7f959be5ed2b
00414 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0041c 8bd0                           mov        edx, eax
0041e 4c8b6c2410                     mov        r13, qword ptr [rsp + 0x10]
00423 458bda                         mov        r11d, r10d
00426 e933fdffff                     jmp        0x7f959be5ea5e
0042b 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00430 442b9424a8000000               sub        r10d, dword ptr [rsp + 0xa8]
00438 488b5c2428                     mov        rbx, qword ptr [rsp + 0x28]
0043d 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00442 8b7c2464                       mov        edi, dword ptr [rsp + 0x64]
00446 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0044e e96dfeffff                     jmp        0x7f959be5ebc0
00453 be6effffff                     mov        esi, 0xffffff6e
00458 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00460 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00465 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
0046a 48894424f8                     mov        qword ptr [rsp - 8], rax
0046f 8b442434                       mov        eax, dword ptr [rsp + 0x34]
00473 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00477 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0047c 48894424f8                     mov        qword ptr [rsp - 8], rax
00481 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00485 89442434                       mov        dword ptr [rsp + 0x34], eax
00489 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0048e 48ff742440                     push       qword ptr [rsp + 0x40]
00493 488f442438                     pop        qword ptr [rsp + 0x38]
00498 48ff742448                     push       qword ptr [rsp + 0x48]
0049d 488f442440                     pop        qword ptr [rsp + 0x40]
004a2 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
004a7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
004ac 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
004b1 666690                         nop        
004b4 c5f877                         vzeroupper 
004b7 e8a448b6ff                     call       0x7f959b9c3660
004bc 0f1f8400b4050002               nop        dword ptr [rax + rax + 0x20005b4]
004c4 beccffffff                     mov        esi, 0xffffffcc
004c9 488beb                         mov        rbp, rbx
004cc 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
004d4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
004d9 89442414                       mov        dword ptr [rsp + 0x14], eax
004dd 4489542418                     mov        dword ptr [rsp + 0x18], r10d
004e2 6690                           nop        
004e4 c5f877                         vzeroupper 
004e7 e87448b6ff                     call       0x7f959b9c3660
004ec 0f1f8400e4050003               nop        dword ptr [rax + rax + 0x30005e4]
004f4 4533d2                         xor        r10d, r10d
004f7 4d3bda                         cmp        r11, r10
004fa bdffffffff                     mov        ebp, 0xffffffff
004ff 7c08                           jl         0x7f959be5ee09
00501 400f95c5                       setne      bpl
00505 400fb6ed                       movzx      ebp, bpl
00509 be45ffffff                     mov        esi, 0xffffff45
0050e 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00516 4889542410                     mov        qword ptr [rsp + 0x10], rdx
0051b 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
00520 897c2428                       mov        dword ptr [rsp + 0x28], edi
00524 48894424f8                     mov        qword ptr [rsp - 8], rax
00529 8b442434                       mov        eax, dword ptr [rsp + 0x34]
0052d 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00531 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00536 89442430                       mov        dword ptr [rsp + 0x30], eax
0053a 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0053e 48ff742440                     push       qword ptr [rsp + 0x40]
00543 488f442438                     pop        qword ptr [rsp + 0x38]
00548 48ff742448                     push       qword ptr [rsp + 0x48]
0054d 488f442440                     pop        qword ptr [rsp + 0x40]
00552 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00557 90                             nop        
00558 c5f877                         vzeroupper 
0055b e80048b6ff                     call       0x7f959b9c3660
00560 0f1f840058060004               nop        dword ptr [rax + rax + 0x4000658]
00568 bebeffffff                     mov        esi, 0xffffffbe
0056d 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00575 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
0057d 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
00582 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00587 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0058c 4c89742428                     mov        qword ptr [rsp + 0x28], r14
00591 48894424f8                     mov        qword ptr [rsp - 8], rax
00596 8b442434                       mov        eax, dword ptr [rsp + 0x34]
0059a 89442424                       mov        dword ptr [rsp + 0x24], eax
0059e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005a3 48894424f8                     mov        qword ptr [rsp - 8], rax
005a8 8b442438                       mov        eax, dword ptr [rsp + 0x38]
005ac 89442434                       mov        dword ptr [rsp + 0x34], eax
005b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005b5 48ff742440                     push       qword ptr [rsp + 0x40]
005ba 488f442438                     pop        qword ptr [rsp + 0x38]
005bf 48ff742448                     push       qword ptr [rsp + 0x48]
005c4 488f442440                     pop        qword ptr [rsp + 0x40]
005c9 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
005ce 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
005d3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
005d8 c5f877                         vzeroupper 
005db e88047b6ff                     call       0x7f959b9c3660
005e0 0f1f8400d8060005               nop        dword ptr [rax + rax + 0x50006d8]
005e8 be45ffffff                     mov        esi, 0xffffff45
005ed 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
005f2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
005f7 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
005ff 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00603 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
0060a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0060f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00614 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00619 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00621 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00626 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0062b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00630 89542428                       mov        dword ptr [rsp + 0x28], edx
00634 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00639 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0063e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00643 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00648 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0064d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00652 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
00657 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0065c 89442448                       mov        dword ptr [rsp + 0x48], eax
00660 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00665 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
0066a 6690                           nop        
0066c c5f877                         vzeroupper 
0066f e8ec46b6ff                     call       0x7f959b9c3660
00674 0f1f84006c070006               nop        dword ptr [rax + rax + 0x600076c]
0067c be45ffffff                     mov        esi, 0xffffff45
00681 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00688 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00690 c5f877                         vzeroupper 
00693 e8c846b6ff                     call       0x7f959b9c3660
00698 0f1f840090070007               nop        dword ptr [rax + rax + 0x7000790]
006a0 4d3bc3                         cmp        r8, r11
006a3 bdffffffff                     mov        ebp, 0xffffffff
006a8 7c08                           jl         0x7f959be5efb2
006aa 400f95c5                       setne      bpl
006ae 400fb6ed                       movzx      ebp, bpl
006b2 be45ffffff                     mov        esi, 0xffffff45
006b7 90                             nop        
006b8 c5f877                         vzeroupper 
006bb e8a046b6ff                     call       0x7f959b9c3660
006c0 0f1f8400b8070008               nop        dword ptr [rax + rax + 0x80007b8]
006c8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006cd 4d3bca                         cmp        r9, r10
006d0 bdffffffff                     mov        ebp, 0xffffffff
006d5 7c08                           jl         0x7f959be5efdf
006d7 400f95c5                       setne      bpl
006db 400fb6ed                       movzx      ebp, bpl
006df be45ffffff                     mov        esi, 0xffffff45
006e4 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
006ec 4889542410                     mov        qword ptr [rsp + 0x10], rdx
006f1 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
006f6 897c2428                       mov        dword ptr [rsp + 0x28], edi
006fa 48894424f8                     mov        qword ptr [rsp - 8], rax
006ff 8b442434                       mov        eax, dword ptr [rsp + 0x34]
00703 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0070c 89442430                       mov        dword ptr [rsp + 0x30], eax
00710 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00714 48ff742440                     push       qword ptr [rsp + 0x40]
00719 488f442438                     pop        qword ptr [rsp + 0x38]
0071e 6690                           nop        
00720 c5f877                         vzeroupper 
00723 e83846b6ff                     call       0x7f959b9c3660
00728 0f1f840020080009               nop        dword ptr [rax + rax + 0x9000820]
00730 be45ffffff                     mov        esi, 0xffffff45
00735 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0073a 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
00742 6690                           nop        
00744 c5f877                         vzeroupper 
00747 e81446b6ff                     call       0x7f959b9c3660
0074c 0f1f84004408000a               nop        dword ptr [rax + rax + 0xa000844]
00754 ffc9                           dec        ecx
00756 be45ffffff                     mov        esi, 0xffffff45
0075b 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00760 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00765 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0076d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00772 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00777 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0077c 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00784 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00789 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0078e 89542428                       mov        dword ptr [rsp + 0x28], edx
00792 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00797 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0079c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
007a1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
007a6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
007ab 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
007b0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
007b5 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
007ba 4489542434                     mov        dword ptr [rsp + 0x34], r10d
007bf 89442448                       mov        dword ptr [rsp + 0x48], eax
007c3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
007c8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
007cd 894c2458                       mov        dword ptr [rsp + 0x58], ecx
007d1 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
007d6 6690                           nop        
007d8 c5f877                         vzeroupper 
007db e88045b6ff                     call       0x7f959b9c3660
007e0 0f1f8400d808000b               nop        dword ptr [rax + rax + 0xb0008d8]
007e8 be45ffffff                     mov        esi, 0xffffff45
007ed 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
007f2 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
007f7 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
007ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00804 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00809 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0080e 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00816 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0081b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00820 89542428                       mov        dword ptr [rsp + 0x28], edx
00824 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00829 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0082e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00833 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00838 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0083d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00842 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00847 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0084c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00851 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00856 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0085a 894c2450                       mov        dword ptr [rsp + 0x50], ecx
0085e 6690                           nop        
00860 c5f877                         vzeroupper 
00863 e8f844b6ff                     call       0x7f959b9c3660
00868 0f1f84006009000c               nop        dword ptr [rax + rax + 0xc000960]
00870 4c3bd3                         cmp        r10, rbx
00873 bdffffffff                     mov        ebp, 0xffffffff
00878 7c08                           jl         0x7f959be5f182
0087a 400f95c5                       setne      bpl
0087e 400fb6ed                       movzx      ebp, bpl
00882 be45ffffff                     mov        esi, 0xffffff45
00887 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0088c 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00894 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00899 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0089e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008a3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008a8 4c89442428                     mov        qword ptr [rsp + 0x28], r8
008ad 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008b2 4489442424                     mov        dword ptr [rsp + 0x24], r8d
008b7 89542430                       mov        dword ptr [rsp + 0x30], edx
008bb 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
008c0 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
008c5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
008ca 89442450                       mov        dword ptr [rsp + 0x50], eax
008ce 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
008d3 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
008d8 c5f877                         vzeroupper 
008db e88044b6ff                     call       0x7f959b9c3660
008e0 0f1f8400d809000d               nop        dword ptr [rax + rax + 0xd0009d8]
008e8 be45ffffff                     mov        esi, 0xffffff45
008ed 44898c24a0000000               mov        dword ptr [rsp + 0xa0], r9d
008f5 666690                         nop        
008f8 c5f877                         vzeroupper 
008fb e86044b6ff                     call       0x7f959b9c3660
00900 0f1f8400f809000e               nop        dword ptr [rax + rax + 0xe0009f8]
00908 ffc9                           dec        ecx
0090a be45ffffff                     mov        esi, 0xffffff45
0090f 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00914 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
00919 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00921 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00926 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0092b 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00930 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00938 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0093d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00942 89542428                       mov        dword ptr [rsp + 0x28], edx
00946 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0094b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00950 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00955 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0095a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0095f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00964 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00969 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0096e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00973 89442448                       mov        dword ptr [rsp + 0x48], eax
00977 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0097c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00981 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00985 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
0098a 6690                           nop        
0098c c5f877                         vzeroupper 
0098f e8cc43b6ff                     call       0x7f959b9c3660
00994 0f1f84008c0a000f               nop        dword ptr [rax + rax + 0xf000a8c]
0099c be45ffffff                     mov        esi, 0xffffff45
009a1 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
009a6 8b7c240c                       mov        edi, dword ptr [rsp + 0xc]
009aa 89bc24a8000000                 mov        dword ptr [rsp + 0xa8], edi
009b1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009b6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009bb 8b7c2430                       mov        edi, dword ptr [rsp + 0x30]
009bf 89bc24ac000000                 mov        dword ptr [rsp + 0xac], edi
009c6 4c89442420                     mov        qword ptr [rsp + 0x20], r8
009cb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
009d0 448954240c                     mov        dword ptr [rsp + 0xc], r10d
009d5 89542428                       mov        dword ptr [rsp + 0x28], edx
009d9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
009de 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
009e3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
009e8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
009ed 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009f2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
009f7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009fc 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00a01 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a06 89442448                       mov        dword ptr [rsp + 0x48], eax
00a0a 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00a0e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00a13 90                             nop        
00a14 c5f877                         vzeroupper 
00a17 e84443b6ff                     call       0x7f959b9c3660
00a1c 0f1f8400140b0010               nop        dword ptr [rax + rax + 0x10000b14]
00a24 bee4ffffff                     mov        esi, 0xffffffe4
00a29 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00a2e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a33 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00a3b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a40 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a45 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00a4a 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00a52 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00a57 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a5c 89542428                       mov        dword ptr [rsp + 0x28], edx
00a60 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00a65 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a6a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00a6f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a74 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a79 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a7e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a83 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00a88 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a8d 89442448                       mov        dword ptr [rsp + 0x48], eax
00a91 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00a95 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00a9a 6690                           nop        
00a9c c5f877                         vzeroupper 
00a9f e8bc42b6ff                     call       0x7f959b9c3660
00aa4 0f1f84009c0b0011               nop        dword ptr [rax + rax + 0x11000b9c]
00aac bef6ffffff                     mov        esi, 0xfffffff6
00ab1 666690                         nop        
00ab4 c5f877                         vzeroupper 
00ab7 e8a442b6ff                     call       0x7f959b9c3660
00abc 0f1f8400b40b0012               nop        dword ptr [rax + rax + 0x12000bb4]
00ac4 bef6ffffff                     mov        esi, 0xfffffff6
00ac9 498be8                         mov        rbp, r8
00acc 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00ad4 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
00adb 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00ae3 90                             nop        
00ae4 c5f877                         vzeroupper 
00ae7 e87442b6ff                     call       0x7f959b9c3660
00aec 0f1f8400e40b0013               nop        dword ptr [rax + rax + 0x13000be4]
00af4 488bf0                         mov        rsi, rax
00af7 c5f877                         vzeroupper 
00afa 4881c490000000                 add        rsp, 0x90
00b01 5d                             pop        rbp
00b02 e9596bb6ff                     jmp        0x7f959b9c5f60
00b07 49ba42ece59b957f0000           movabs     r10, 0x7f959be5ec42
00b11 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00b18 e9c3eaa9ff                     jmp        0x7f959b8fdee0
00b1d e87eb6a8ff                     call       0x7f959b8eaaa0
00b22 e917f5ffff                     jmp        0x7f959be5e93e
00b27 f4                             hlt        
