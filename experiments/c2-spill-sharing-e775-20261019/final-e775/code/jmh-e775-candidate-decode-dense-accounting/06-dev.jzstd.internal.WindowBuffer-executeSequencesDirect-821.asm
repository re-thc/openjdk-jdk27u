00000 e8bb805816                     call       0x7f13a6406640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8550220000                   jne        0x7f138fe807fe
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004d 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00095 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
000ad 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b9 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000c0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ed 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f2 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49ba80cd4ea6137f0000           movabs     r10, 0x7f13a64ecd80
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84cc130000                   je         0x7f138fe7fa7c
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb2c420000                 cmp        r11d, 0x422c
0013e 0f8514160000                   jne        0x7f138fe7fcd8
00144 4c891424                       mov        qword ptr [rsp], r10
00148 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00150 4885ed                         test       rbp, rbp
00153 0f84af130000                   je         0x7f138fe7fa88
00159 448b5d00                       mov        r11d, dword ptr [rbp]
0015d 41c1eb0d                       shr        r11d, 0xd
00161 4181fbe4050000                 cmp        r11d, 0x5e4
00168 0f85ea150000                   jne        0x7f138fe7fcd8
0016e 4c8bd5                         mov        r10, rbp
00171 4c89542408                     mov        qword ptr [rsp + 8], r10
00176 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017e 4885ed                         test       rbp, rbp
00181 0f848e130000                   je         0x7f138fe7fa95
00187 448b5500                       mov        r10d, dword ptr [rbp]
0018b 41c1ea0d                       shr        r10d, 0xd
0018f 4181fae7050000                 cmp        r10d, 0x5e7
00196 0f85bc150000                   jne        0x7f138fe7fcd8
0019c 4c8bd5                         mov        r10, rbp
0019f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a4 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ac 4885ed                         test       rbp, rbp
001af 0f846d130000                   je         0x7f138fe7faa2
001b5 448b5500                       mov        r10d, dword ptr [rbp]
001b9 41c1ea0d                       shr        r10d, 0xd
001bd 4181fae6050000                 cmp        r10d, 0x5e6
001c4 0f858e150000                   jne        0x7f138fe7fcd8
001ca 4c8bd5                         mov        r10, rbp
001cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d2 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001da 4885ed                         test       rbp, rbp
001dd 0f844c130000                   je         0x7f138fe7faaf
001e3 448b5500                       mov        r10d, dword ptr [rbp]
001e7 41c1ea0d                       shr        r10d, 0xd
001eb 4181fae6050000                 cmp        r10d, 0x5e6
001f2 0f8560150000                   jne        0x7f138fe7fcd8
001f8 4c8bd5                         mov        r10, rbp
001fb 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00200 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00208 4885ed                         test       rbp, rbp
0020b 0f842b130000                   je         0x7f138fe7fabc
00211 448b5d00                       mov        r11d, dword ptr [rbp]
00215 41c1eb0d                       shr        r11d, 0xd
00219 4181fbe4050000                 cmp        r11d, 0x5e4
00220 0f8532150000                   jne        0x7f138fe7fcd8
00226 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00230 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00234 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00239 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0023e 4585db                         test       r11d, r11d
00241 0f8459140000                   je         0x7f138fe7fc20
00247 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00250 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00255 4585d2                         test       r10d, r10d
00258 0f8642140000                   jbe        0x7f138fe7fc20
0025e 4183fa01                       cmp        r10d, 1
00262 0f8638140000                   jbe        0x7f138fe7fc20
00268 4183fa02                       cmp        r10d, 2
0026c 0f862e140000                   jbe        0x7f138fe7fc20
00272 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00277 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00280 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00285 458b5204                       mov        r10d, dword ptr [r10 + 4]
00289 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0028e 458d53f1                       lea        r10d, [r11 - 0xf]
00292 4585d2                         test       r10d, r10d
00295 0f8c05140000                   jl         0x7f138fe7fc20
0029b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002a0 4183c3f1                       add        r11d, -0xf
002a4 4585db                         test       r11d, r11d
002a7 0f8cf3130000                   jl         0x7f138fe7fc20
002ad 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002b2 4183c2f9                       add        r10d, -7
002b6 4585d2                         test       r10d, r10d
002b9 0f8ce1130000                   jl         0x7f138fe7fc20
002bf 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002c4 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
002cc 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002d1 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002d9 4183c3f1                       add        r11d, -0xf
002dd 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002e5 4183c2f1                       add        r10d, -0xf
002e9 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002f1 e9bb010000                     jmp        0x7f138fe7ea31
002f6 4533d2                         xor        r10d, r10d
002f9 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
002fe 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00303 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00307 83fa03                         cmp        edx, 3
0030a 0f8e54020000                   jle        0x7f138fe7eae4
00310 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00315 45895310                       mov        dword ptr [r11 + 0x10], r10d
00319 458b5308                       mov        r10d, dword ptr [r11 + 8]
0031d 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00321 448d52fd                       lea        r10d, [rdx - 3]
00325 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0032d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00332 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0033a 45895a08                       mov        dword ptr [r10 + 8], r11d
0033e 4c639c2490000000               movsxd     r11, dword ptr [rsp + 0x90]
00346 4d63d5                         movsxd     r10, r13d
00349 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0034e 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00353 4c03d2                         add        r10, rdx
00356 4d3bda                         cmp        r11, r10
00359 0f8f790f0000                   jg         0x7f138fe7f858
0035f 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00367 4585db                         test       r11d, r11d
0036a 0f8e580e0000                   jle        0x7f138fe7f748
00370 418bdd                         mov        ebx, r13d
00373 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
00377 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0037c 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00381 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00389 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0038e 4403d3                         add        r10d, ebx
00391 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
00396 0f8f0d090000                   jg         0x7f138fe7f229
0039c 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003a1 0f8f890f0000                   jg         0x7f138fe7f8b0
003a7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003ac 4183fb10                       cmp        r11d, 0x10
003b0 0f8f8e020000                   jg         0x7f138fe7ebc4
003b6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003bb 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
003c3 0f83370d0000                   jae        0x7f138fe7f680
003c9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003ce 458bc2                         mov        r8d, r10d
003d1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003d6 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
003dd 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
003e5 0f83590d0000                   jae        0x7f138fe7f6c4
003eb 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003f0 4503d0                         add        r10d, r8d
003f3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
003fb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00400 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
00407 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0040c 4503dd                         add        r11d, r13d
0040f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00414 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00419 442b842490000000               sub        r8d, dword ptr [rsp + 0x90]
00421 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00426 4183fa10                       cmp        r10d, 0x10
0042a 0f8fe40f0000                   jg         0x7f138fe7f994
00430 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00438 4183fb10                       cmp        r11d, 0x10
0043c 0f8c5b030000                   jl         0x7f138fe7ed1d
00442 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0044a 0f83e80b0000                   jae        0x7f138fe7f5b8
00450 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00455 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
0045c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00461 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00469 0f83250c0000                   jae        0x7f138fe7f614
0046f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00474 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00479 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00480 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
00485 4503eb                         add        r13d, r11d
00488 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0048d 41ffc2                         inc        r10d
00490 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00495 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00499 418502                         test       dword ptr [r10], eax
0049c 48894424f8                     mov        qword ptr [rsp - 8], rax
004a1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
004a8 89442438                       mov        dword ptr [rsp + 0x38], eax
004ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004b1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004b6 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
004bb 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
004c0 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
004c5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
004ca 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
004cf 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
004d4 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004d9 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004de 0f8d16070000                   jge        0x7f138fe7f17a
004e4 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
004e9 0f830d0b0000                   jae        0x7f138fe7f57c
004ef 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
004f4 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
004f9 4d8bd3                         mov        r10, r11
004fc 49c1ea12                       shr        r10, 0x12
00500 458bd2                         mov        r10d, r10d
00503 4181e2ffff0300                 and        r10d, 0x3ffff
0050a 4489542478                     mov        dword ptr [rsp + 0x78], r10d
0050f 458bd3                         mov        r10d, r11d
00512 49c1fb24                       sar        r11, 0x24
00516 4181e2ffff0100                 and        r10d, 0x1ffff
0051d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00522 458bd3                         mov        r10d, r11d
00525 418bd2                         mov        edx, r10d
00528 4585d2                         test       r10d, r10d
0052b 0f8cb70c0000                   jl         0x7f138fe7f768
00531 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00536 4585db                         test       r11d, r11d
00539 0f84b7fdffff                   je         0x7f138fe7e876
0053f 453bd9                         cmp        r11d, r9d
00542 0f8eb6fdffff                   jle        0x7f138fe7e87e
00548 be45ffffff                     mov        esi, 0xffffff45
0054d 418beb                         mov        ebp, r11d
00550 44890c24                       mov        dword ptr [rsp], r9d
00554 c5f877                         vzeroupper 
00557 e8045ab4ff                     call       0x7f138f9c44e0
0055c 0f1f840054060001               nop        dword ptr [rax + rax + 0x1000654]
00564 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00569 4585db                         test       r11d, r11d
0056c 7407                           je         0x7f138fe7eaf5
0056e 448d5aff                       lea        r11d, [rdx - 1]
00572 418bd3                         mov        edx, r11d
00575 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0057a 458b4308                       mov        r8d, dword ptr [r11 + 8]
0057e 85d2                           test       edx, edx
00580 7479                           je         0x7f138fe7eb7b
00582 83fa03                         cmp        edx, 3
00585 0f84ed050000                   je         0x7f138fe7f0f8
0058b 83fa02                         cmp        edx, 2
0058e 7778                           ja         0x7f138fe7eb88
00590 3b54242c                       cmp        edx, dword ptr [rsp + 0x2c]
00594 0f8306130000                   jae        0x7f138fe7fe20
0059a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0059f 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
005a4 85d2                           test       edx, edx
005a6 7e4a                           jle        0x7f138fe7eb72
005a8 448d5aff                       lea        r11d, [rdx - 1]
005ac 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
005b1 0f834d160000                   jae        0x7f138fe80184
005b7 4533c9                         xor        r9d, r9d
005ba 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005bf 458bd2                         mov        r10d, r10d
005c2 4183c2cc                       add        r10d, -0x34
005c6 41c1ea02                       shr        r10d, 2
005ca 458d5c12ff                     lea        r11d, [r10 + rdx - 1]
005cf 4863ca                         movsxd     rcx, edx
005d2 41ba04000000                   mov        r10d, 4
005d8 c442a8f5d3                     bzhi       r10, r11, r10
005dd 492bca                         sub        rcx, r10
005e0 48ffc9                         dec        rcx
005e3 4885c9                         test       rcx, rcx
005e6 490f4cc9                       cmovl      rcx, r9
005ea 448bd9                         mov        r11d, ecx
005ed e9f9030000                     jmp        0x7f138fe7ef6b
005f2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005f7 45894208                       mov        dword ptr [r10 + 8], r8d
005fb 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00603 e936fdffff                     jmp        0x7f138fe7e8be
00608 48be9010bce200000000           movabs     rsi, 0xe2bc1090
00612 418bed                         mov        ebp, r13d
00615 666690                         nop        
00618 c5f877                         vzeroupper 
0061b e8c0bca7ff                     call       0x7f138f8fa860
00620 0f1f840018070002               nop        dword ptr [rax + rax + 0x2000718]
00628 4885c0                         test       rax, rax
0062b 0f8473130000                   je         0x7f138fe7ff24
00631 488bf0                         mov        rsi, rax
00634 c5f877                         vzeroupper 
00637 4881c4c0000000                 add        rsp, 0xc0
0063e 5d                             pop        rbp
0063f e91ca1b4ff                     jmp        0x7f138f9c8ce0
00644 4183fb30                       cmp        r11d, 0x30
00648 0f8fc1040000                   jg         0x7f138fe7f08f
0064e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00653 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0065b 0f83e80e0000                   jae        0x7f138fe7fac9
00661 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00666 418bfa                         mov        edi, r10d
00669 4d63ca                         movsxd     r9, r10d
0066c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00671 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00678 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00680 0f83560f0000                   jae        0x7f138fe7fb5c
00686 458d5d10                       lea        r11d, [r13 + 0x10]
0068a 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00692 4d63dd                         movsxd     r11, r13d
00695 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0069a c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
006a1 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
006a9 443bd3                         cmp        r10d, ebx
006ac 0f8dd2000000                   jge        0x7f138fe7ed04
006b2 4d2bcb                         sub        r9, r11
006b5 4d63c2                         movsxd     r8, r10d
006b8 48638c2480000000               movsxd     rcx, dword ptr [rsp + 0x80]
006c0 4883c1f1                       add        rcx, -0xf
006c4 4f8d1c08                       lea        r11, [r8 + r9]
006c8 4c3bd9                         cmp        r11, rcx
006cb 0f83af100000                   jae        0x7f138fe7fd00
006d1 4c63db                         movsxd     r11, ebx
006d4 4d2bd8                         sub        r11, r8
006d7 4983c30f                       add        r11, 0xf
006db 4983e3f0                       and        r11, 0xfffffffffffffff0
006df 458bdb                         mov        r11d, r11d
006e2 478d442b10                     lea        r8d, [r11 + r13 + 0x10]
006e7 4d63d8                         movsxd     r11, r8d
006ea 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
006ef 4c3bc1                         cmp        r8, rcx
006f2 0f8388100000                   jae        0x7f138fe7fd00
006f8 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00700 0f837a100000                   jae        0x7f138fe7fd00
00706 4983c3f0                       add        r11, -0x10
0070a 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
00712 4983c2f1                       add        r10, -0xf
00716 4d3bda                         cmp        r11, r10
00719 0f8361100000                   jae        0x7f138fe7fd00
0071f 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00725 0f8fe5100000                   jg         0x7f138fe7fd90
0072b 448bd7                         mov        r10d, edi
0072e 452bd5                         sub        r10d, r13d
00731 0f1f840000000000               nop        dword ptr [rax + rax]
00739 0f1f8000000000                 nop        dword ptr [rax]
00740 458bc2                         mov        r8d, r10d
00743 4403842494000000               add        r8d, dword ptr [rsp + 0x94]
0074b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00750 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00757 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0075f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00764 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0076b 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00773 4183c010                       add        r8d, 0x10
00777 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0077f 443bc3                         cmp        r8d, ebx
00782 7cbc                           jl         0x7f138fe7ecc0
00784 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00789 4403df                         add        r11d, edi
0078c 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00794 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00798 e977fcffff                     jmp        0x7f138fe7e994
0079d 4403542438                     add        r10d, dword ptr [rsp + 0x38]
007a2 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
007aa 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
007af 0f8d78010000                   jge        0x7f138fe7eead
007b5 4183fb08                       cmp        r11d, 8
007b9 0f8d3d170000                   jge        0x7f138fe8047c
007bf 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
007c4 0f83ca120000                   jae        0x7f138fe80014
007ca 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
007cf 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
007d5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007da 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007df 0f831f130000                   jae        0x7f138fe80084
007e5 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
007ea 43886c0b08                     mov        byte ptr [r11 + r9 + 8], bpl
007ef 458d5003                       lea        r10d, [r8 + 3]
007f3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007f8 41ffc3                         inc        r11d
007fb 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00803 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00808 0f8326130000                   jae        0x7f138fe800b4
0080e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00813 4183c203                       add        r10d, 3
00817 4d63d8                         movsxd     r11, r8d
0081a 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0081f 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
00825 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0082a 0f8338130000                   jae        0x7f138fe800e8
00830 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00835 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
0083a 430fbe4c190a                   movsx      ecx, byte ptr [r9 + r11 + 0xa]
00840 43884c110a                     mov        byte ptr [r9 + r10 + 0xa], cl
00845 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
0084b 47885c110b                     mov        byte ptr [r9 + r10 + 0xb], r11b
00850 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00858 4183fb08                       cmp        r11d, 8
0085c 0f8336130000                   jae        0x7f138fe80118
00862 49bab07fb6e200000000           movabs     r10, 0xe2b67fb0
0086c 4703449a08                     add        r8d, dword ptr [r10 + r11*4 + 8]
00871 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00876 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0087b 4183fb04                       cmp        r11d, 4
0087f 7e3b                           jle        0x7f138fe7ee3c
00881 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00885 83c504                         add        ebp, 4
00888 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0088d 418bd0                         mov        edx, r8d
00890 c5f877                         vzeroupper 
00893 e848baa7ff                     call       0x7f138f8fa860
00898 0f1f840090090003               nop        dword ptr [rax + rax + 0x3000990]
008a0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008a5 8bd5                           mov        edx, ebp
008a7 8bc8                           mov        ecx, eax
008a9 666690                         nop        
008ac c5f877                         vzeroupper 
008af e82cbaa7ff                     call       0x7f138f8fa860
008b4 0f1f8400ac090004               nop        dword ptr [rax + rax + 0x40009ac]
008bc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
008c1 4183fb08                       cmp        r11d, 8
008c5 7e59                           jle        0x7f138fe7eea0
008c7 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008cb 83c508                         add        ebp, 8
008ce 49bad87fb6e200000000           movabs     r10, 0xe2b67fd8
008d8 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
008dc 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
008e4 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
008e9 83c208                         add        edx, 8
008ec 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008f1 666690                         nop        
008f4 c5f877                         vzeroupper 
008f7 e8e4b9a7ff                     call       0x7f138f8fa860
008fc 0f1f8400f4090005               nop        dword ptr [rax + rax + 0x50009f4]
00904 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00909 8bd5                           mov        edx, ebp
0090b 488bc8                         mov        rcx, rax
0090e 6690                           nop        
00910 c5f877                         vzeroupper 
00913 e8c8b9a7ff                     call       0x7f138f8fa860
00918 0f1f8400100a0006               nop        dword ptr [rax + rax + 0x6000a10]
00920 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00928 e95bfbffff                     jmp        0x7f138fe7ea08
0092d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00932 4183fa30                       cmp        r10d, 0x30
00936 0f8fa0140000                   jg         0x7f138fe8035c
0093c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00944 4183c3f9                       add        r11d, -7
00948 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00950 453bc3                         cmp        r8d, r11d
00953 0f8363100000                   jae        0x7f138fe7ff3c
00959 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00961 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00966 4b8b6c0208                     mov        rbp, qword ptr [r10 + r8 + 8]
0096b 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00973 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00978 453bd3                         cmp        r10d, r11d
0097b 0f83ab100000                   jae        0x7f138fe7ffac
00981 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00985 89ac2490000000                 mov        dword ptr [rsp + 0x90], ebp
0098c 48be28c122e200000000           movabs     rsi, 0xe222c128
00996 4863cd                         movsxd     rcx, ebp
00999 4883c108                       add        rcx, 8
0099d 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009a2 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009aa 4533c9                         xor        r9d, r9d
009ad 666690                         nop        
009b0 c5f877                         vzeroupper 
009b3 e828afa7ff                     call       0x7f138f8f9e60
009b8 0f1f8400b00a0007               nop        dword ptr [rax + rax + 0x7000ab0]
009c0 448d5508                       lea        r10d, [rbp + 8]
009c4 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
009cc 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
009d4 0f8c3a130000                   jl         0x7f138fe80294
009da 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
009df 4403ed                         add        r13d, ebp
009e2 e9a1faffff                     jmp        0x7f138fe7ea08
009e7 90                             nop        
009e8 418bd1                         mov        edx, r9d
009eb 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
009f0 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
009f5 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
009fa 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
009ff 448d4aff                       lea        r9d, [rdx - 1]
00a03 453bcb                         cmp        r9d, r11d
00a06 7fe0                           jg         0x7f138fe7ef68
00a08 4183f93f                       cmp        r9d, 0x3f
00a0c 0f8efa120000                   jle        0x7f138fe8028c
00a12 448bd2                         mov        r10d, edx
00a15 41ffca                         dec        r10d
00a18 418bca                         mov        ecx, r10d
00a1b eb06                           jmp        0x7f138fe7efa3
00a1d 666690                         nop        
00a20 418bca                         mov        ecx, r10d
00a23 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a28 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00a33 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00a3e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00a49 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00a54 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00a5f 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00a6a 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00a75 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00a80 448d51c0                       lea        r10d, [rcx - 0x40]
00a84 4183fa3f                       cmp        r10d, 0x3f
00a88 7f96                           jg         0x7f138fe7efa0
00a8a 4183fa0f                       cmp        r10d, 0xf
00a8e 7e2d                           jle        0x7f138fe7f03d
00a90 448bd1                         mov        r10d, ecx
00a93 4183c2c0                       add        r10d, -0x40
00a97 90                             nop        
00a98 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a9d 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00aa8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00ab3 4183c2f0                       add        r10d, -0x10
00ab7 4183fa0f                       cmp        r10d, 0xf
00abb 7fdb                           jg         0x7f138fe7f018
00abd 4585d2                         test       r10d, r10d
00ac0 0f8e2cfbffff                   jle        0x7f138fe7eb72
00ac6 458bca                         mov        r9d, r10d
00ac9 666690                         nop        
00acc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00ad1 478b548a04                     mov        r10d, dword ptr [r10 + r9*4 + 4]
00ad6 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00adb 4789548b08                     mov        dword ptr [r11 + r9*4 + 8], r10d
00ae0 41ffc9                         dec        r9d
00ae3 4585c9                         test       r9d, r9d
00ae6 7fe4                           jg         0x7f138fe7f04c
00ae8 e905fbffff                     jmp        0x7f138fe7eb72
00aed 4d63d3                         movsxd     r10, r11d
00af0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00af7 c442a8f5db                     bzhi       r11, r11, r10
00afc c4c1fb92fb                     kmovq      k7, r11
00b01 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b07 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b0d eb60                           jmp        0x7f138fe7f0ef
00b0f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b14 4585db                         test       r11d, r11d
00b17 0f8c9b130000                   jl         0x7f138fe80438
00b1d 4585ed                         test       r13d, r13d
00b20 0f8c92130000                   jl         0x7f138fe80438
00b26 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b2b 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00b33 0f827f130000                   jb         0x7f138fe80438
00b39 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b3e 443bd3                         cmp        r10d, ebx
00b41 0f8271130000                   jb         0x7f138fe80438
00b47 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00b4c 4585db                         test       r11d, r11d
00b4f 741e                           je         0x7f138fe7f0ef
00b51 4883fa20                       cmp        rdx, 0x20
00b55 7696                           jbe        0x7f138fe7f06d
00b57 c5f877                         vzeroupper 
00b5a 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00b64 41ffd2                         call       r10
00b67 0f1f840000000000               nop        dword ptr [rax + rax]
00b6f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00b73 e99cf8ffff                     jmp        0x7f138fe7e994
00b78 41ffc8                         dec        r8d
00b7b 4585c0                         test       r8d, r8d
00b7e 7e1a                           jle        0x7f138fe7f11a
00b80 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00b85 45895310                       mov        dword ptr [r11 + 0x10], r10d
00b89 458b5308                       mov        r10d, dword ptr [r11 + 8]
00b8d 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00b91 45894308                       mov        dword ptr [r11 + 8], r8d
00b95 e961faffff                     jmp        0x7f138fe7eb7b
00b9a 48be6010bce200000000           movabs     rsi, 0xe2bc1060
00ba4 418bed                         mov        ebp, r13d
00ba7 90                             nop        
00ba8 c5f877                         vzeroupper 
00bab e830b7a7ff                     call       0x7f138f8fa860
00bb0 0f1f8400a80c0008               nop        dword ptr [rax + rax + 0x8000ca8]
00bb8 4885c0                         test       rax, rax
00bbb 0f8570faffff                   jne        0x7f138fe7ebb1
00bc1 bef6ffffff                     mov        esi, 0xfffffff6
00bc6 6690                           nop        
00bc8 c5f877                         vzeroupper 
00bcb e89053b4ff                     call       0x7f138f9c44e0
00bd0 0f1f8400c80c0009               nop        dword ptr [rax + rax + 0x9000cc8]
00bd8 4d63d1                         movsxd     r10, r9d
00bdb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00be2 c442a8f5db                     bzhi       r11, r11, r10
00be7 c4c1fb92fb                     kmovq      k7, r11
00bec 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bf2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bf8 eb6a                           jmp        0x7f138fe7f1e4
00bfa 4585d2                         test       r10d, r10d
00bfd 0f8ccd130000                   jl         0x7f138fe80550
00c03 4585ed                         test       r13d, r13d
00c06 0f8cc4130000                   jl         0x7f138fe80550
00c0c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c11 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00c16 0f82b4130000                   jb         0x7f138fe80550
00c1c 438d2c29                       lea        ebp, [r9 + r13]
00c20 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c25 443bd5                         cmp        r10d, ebp
00c28 0f82a2130000                   jb         0x7f138fe80550
00c2e 4585c9                         test       r9d, r9d
00c31 0f8c99130000                   jl         0x7f138fe80550
00c37 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00c3c 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00c41 7421                           je         0x7f138fe7f1e4
00c43 4963d1                         movsxd     rdx, r9d
00c46 4883fa20                       cmp        rdx, 0x20
00c4a 768c                           jbe        0x7f138fe7f158
00c4c c5f877                         vzeroupper 
00c4f 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00c59 41ffd2                         call       r10
00c5c 0f1f840000000000               nop        dword ptr [rax + rax]
00c64 4c8b1424                       mov        r10, qword ptr [rsp]
00c68 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00c6c c5f877                         vzeroupper 
00c6f 4881c4c0000000                 add        rsp, 0xc0
00c76 5d                             pop        rbp
00c77 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c7b 0f87e7150000                   ja         0x7f138fe807e8
00c81 c3                             ret        
00c82 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00c87 4d63d3                         movsxd     r10, r11d
00c8a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c91 c442a8f5db                     bzhi       r11, r11, r10
00c96 c4c1fb92fb                     kmovq      k7, r11
00c9b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ca1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ca7 eb72                           jmp        0x7f138fe7f29b
00ca9 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00cae 4585db                         test       r11d, r11d
00cb1 0f843d030000                   je         0x7f138fe7f574
00cb7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00cbc 4585d2                         test       r10d, r10d
00cbf 0f8ca7130000                   jl         0x7f138fe805ec
00cc5 4585ed                         test       r13d, r13d
00cc8 0f8c9e130000                   jl         0x7f138fe805ec
00cce 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00cd3 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00cdb 0f828b130000                   jb         0x7f138fe805ec
00ce1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00ce6 443bdb                         cmp        r11d, ebx
00ce9 0f827d130000                   jb         0x7f138fe805ec
00cef 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00cf4 4585d2                         test       r10d, r10d
00cf7 7422                           je         0x7f138fe7f29b
00cf9 4883fa20                       cmp        rdx, 0x20
00cfd 0f867fffffff                   jbe        0x7f138fe7f202
00d03 c5f877                         vzeroupper 
00d06 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00d10 41ffd2                         call       r10
00d13 0f1f840000000000               nop        dword ptr [rax + rax]
00d1b 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d20 4585db                         test       r11d, r11d
00d23 0f8ea1010000                   jle        0x7f138fe7f44a
00d29 448bd3                         mov        r10d, ebx
00d2c 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00d34 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00d3c 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
00d41 4403eb                         add        r13d, ebx
00d44 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d49 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00d51 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00d56 498d741a08                     lea        rsi, [r10 + rbx + 8]
00d5b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00d63 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00d68 0f8dd0000000                   jge        0x7f138fe7f3be
00d6e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d73 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00d7b 450f4fd3                       cmovg      r10d, r11d
00d7f 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00d87 4585c9                         test       r9d, r9d
00d8a 0f8c58130000                   jl         0x7f138fe80668
00d90 85db                           test       ebx, ebx
00d92 0f8c50130000                   jl         0x7f138fe80668
00d98 4503d1                         add        r10d, r9d
00d9b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00da0 453bda                         cmp        r11d, r10d
00da3 0f823f130000                   jb         0x7f138fe80668
00da9 448bdb                         mov        r11d, ebx
00dac 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
00db4 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00dbc 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00dc1 453bd3                         cmp        r10d, r11d
00dc4 0f821e130000                   jb         0x7f138fe80668
00dca 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00dd2 4585db                         test       r11d, r11d
00dd5 0f8c0d130000                   jl         0x7f138fe80668
00ddb 4585db                         test       r11d, r11d
00dde 742c                           je         0x7f138fe7f38c
00de0 4963d3                         movsxd     rdx, r11d
00de3 4883fa20                       cmp        rdx, 0x20
00de7 773b                           ja         0x7f138fe7f3a4
00de9 458bd3                         mov        r10d, r11d
00dec 4d63d2                         movsxd     r10, r10d
00def 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df6 c442a8f5db                     bzhi       r11, r11, r10
00dfb c4c1fb92fb                     kmovq      k7, r11
00e00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00e14 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00e19 0f8c0b010000                   jl         0x7f138fe7f4aa
00e1f e964f6ffff                     jmp        0x7f138fe7ea08
00e24 c5f877                         vzeroupper 
00e27 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00e31 41ffd2                         call       r10
00e34 0f1f840000000000               nop        dword ptr [rax + rax]
00e3c ebce                           jmp        0x7f138fe7f38c
00e3e 4585c9                         test       r9d, r9d
00e41 0f8c55130000                   jl         0x7f138fe8071c
00e47 85db                           test       ebx, ebx
00e49 0f8c4d130000                   jl         0x7f138fe8071c
00e4f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00e54 4503d1                         add        r10d, r9d
00e57 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e5c 453bda                         cmp        r11d, r10d
00e5f 0f8237130000                   jb         0x7f138fe8071c
00e65 453bdd                         cmp        r11d, r13d
00e68 0f822e130000                   jb         0x7f138fe8071c
00e6e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00e73 4585d2                         test       r10d, r10d
00e76 0f840cf6ffff                   je         0x7f138fe7ea08
00e7c 4963d2                         movsxd     rdx, r10d
00e7f 4883fa20                       cmp        rdx, 0x20
00e83 7728                           ja         0x7f138fe7f42d
00e85 458bda                         mov        r11d, r10d
00e88 4d63d3                         movsxd     r10, r11d
00e8b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e92 c442a8f5db                     bzhi       r11, r11, r10
00e97 c4c1fb92fb                     kmovq      k7, r11
00e9c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ea2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ea8 e9dbf5ffff                     jmp        0x7f138fe7ea08
00ead c5f877                         vzeroupper 
00eb0 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00eba 41ffd2                         call       r10
00ebd 0f1f840000000000               nop        dword ptr [rax + rax]
00ec5 e9bef5ffff                     jmp        0x7f138fe7ea08
00eca 448beb                         mov        r13d, ebx
00ecd e9b6f5ffff                     jmp        0x7f138fe7ea08
00ed2 448bdd                         mov        r11d, ebp
00ed5 4d63d3                         movsxd     r10, r11d
00ed8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00edf c442a8f5db                     bzhi       r11, r11, r10
00ee4 c4c1fb92fb                     kmovq      k7, r11
00ee9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00eef 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ef5 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00efd 4403d5                         add        r10d, ebp
00f00 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00f08 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00f0c 418502                         test       dword ptr [r10], eax
00f0f 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00f17 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00f1c 0f8d66f5ffff                   jge        0x7f138fe7ea08
00f22 4489b4249c000000               mov        dword ptr [rsp + 0x9c], r14d
00f2a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f32 442b9c2490000000               sub        r11d, dword ptr [rsp + 0x90]
00f3a 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f42 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00f46 2bac2490000000                 sub        ebp, dword ptr [rsp + 0x90]
00f4d 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00f54 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00f5c 410f4fea                       cmovg      ebp, r10d
00f60 4585db                         test       r11d, r11d
00f63 0f8c8b100000                   jl         0x7f138fe80574
00f69 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00f71 4585d2                         test       r10d, r10d
00f74 0f8c7a100000                   jl         0x7f138fe80574
00f7a 458d142b                       lea        r10d, [r11 + rbp]
00f7e 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00f83 453bca                         cmp        r9d, r10d
00f86 0f8268100000                   jb         0x7f138fe80574
00f8c 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
00f94 4403f5                         add        r14d, ebp
00f97 458bd1                         mov        r10d, r9d
00f9a 453bd6                         cmp        r10d, r14d
00f9d 0f8251100000                   jb         0x7f138fe80574
00fa3 85ed                           test       ebp, ebp
00fa5 0f8c49100000                   jl         0x7f138fe80574
00fab 85ed                           test       ebp, ebp
00fad 0f8442ffffff                   je         0x7f138fe7f475
00fb3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fb8 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00fbd 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00fc5 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00fca 4863d5                         movsxd     rdx, ebp
00fcd 4883fa20                       cmp        rdx, 0x20
00fd1 0f86fbfeffff                   jbe        0x7f138fe7f452
00fd7 c5f877                         vzeroupper 
00fda 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00fe4 41ffd2                         call       r10
00fe7 0f1f840000000000               nop        dword ptr [rax + rax]
00fef e901ffffff                     jmp        0x7f138fe7f475
00ff4 418bdd                         mov        ebx, r13d
00ff7 e91ffdffff                     jmp        0x7f138fe7f29b
00ffc bee4ffffff                     mov        esi, 0xffffffe4
01001 488b2c24                       mov        rbp, qword ptr [rsp]
01005 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0100a 4c891424                       mov        qword ptr [rsp], r10
0100e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01013 44895c2408                     mov        dword ptr [rsp + 8], r11d
01018 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0101d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01022 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01027 90                             nop        
01028 c5f877                         vzeroupper 
0102b e8304fb4ff                     call       0x7f138f9c44e0
01030 0f1f84002811000b               nop        dword ptr [rax + rax + 0xb001128]
01038 bee4ffffff                     mov        esi, 0xffffffe4
0103d 488b2c24                       mov        rbp, qword ptr [rsp]
01041 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01046 4c891424                       mov        qword ptr [rsp], r10
0104a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0104f 4489542408                     mov        dword ptr [rsp + 8], r10d
01054 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01059 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0105e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01063 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01068 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0106d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01072 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01077 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0107c 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01081 666690                         nop        
01084 c5f877                         vzeroupper 
01087 e8d44eb4ff                     call       0x7f138f9c44e0
0108c 0f1f84008411000c               nop        dword ptr [rax + rax + 0xc001184]
01094 bee4ffffff                     mov        esi, 0xffffffe4
01099 488b2c24                       mov        rbp, qword ptr [rsp]
0109d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
010a2 4c891424                       mov        qword ptr [rsp], r10
010a6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010ab 44895c2408                     mov        dword ptr [rsp + 8], r11d
010b0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010b5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010c9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
010ce 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
010d3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010d8 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
010e0 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
010e5 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
010ee 6690                           nop        
010f0 c5f877                         vzeroupper 
010f3 e8684eb4ff                     call       0x7f138f9c44e0
010f8 0f1f8400f011000d               nop        dword ptr [rax + rax + 0xd0011f0]
01100 bee4ffffff                     mov        esi, 0xffffffe4
01105 488b2c24                       mov        rbp, qword ptr [rsp]
01109 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0110e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01113 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01118 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0111d 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01122 48894424f8                     mov        qword ptr [rsp - 8], rax
01127 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0112b 89442470                       mov        dword ptr [rsp + 0x70], eax
0112f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01134 c5f877                         vzeroupper 
01137 e8244eb4ff                     call       0x7f138f9c44e0
0113c 0f1f84003412000e               nop        dword ptr [rax + rax + 0xe001234]
01144 bee4ffffff                     mov        esi, 0xffffffe4
01149 488b2c24                       mov        rbp, qword ptr [rsp]
0114d 4c891c24                       mov        qword ptr [rsp], r11
01151 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01156 44895c2408                     mov        dword ptr [rsp + 8], r11d
0115b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01160 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01165 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0116a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0116f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01174 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01179 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0117e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01183 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01188 48894424f8                     mov        qword ptr [rsp - 8], rax
0118d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01191 89442470                       mov        dword ptr [rsp + 0x70], eax
01195 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0119a 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0119f 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
011a7 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
011ac c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
011b5 666690                         nop        
011b8 c5f877                         vzeroupper 
011bb e8a04db4ff                     call       0x7f138f9c44e0
011c0 0f1f8400b812000f               nop        dword ptr [rax + rax + 0xf0012b8]
011c8 be45ffffff                     mov        esi, 0xffffff45
011cd 488b2c24                       mov        rbp, qword ptr [rsp]
011d1 4c89542408                     mov        qword ptr [rsp + 8], r10
011d6 6690                           nop        
011d8 c5f877                         vzeroupper 
011db e8804db4ff                     call       0x7f138f9c44e0
011e0 0f1f8400d8120010               nop        dword ptr [rax + rax + 0x100012d8]
011e8 be45ffffff                     mov        esi, 0xffffff45
011ed 488b2c24                       mov        rbp, qword ptr [rsp]
011f1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011f6 4c891424                       mov        qword ptr [rsp], r10
011fa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011ff 44895c2408                     mov        dword ptr [rsp + 8], r11d
01204 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01209 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0120e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01213 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01218 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0121d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01222 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01227 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0122c 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01231 48894424f8                     mov        qword ptr [rsp - 8], rax
01236 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0123a 89442434                       mov        dword ptr [rsp + 0x34], eax
0123e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01243 48894424f8                     mov        qword ptr [rsp - 8], rax
01248 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0124c 89442438                       mov        dword ptr [rsp + 0x38], eax
01250 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01255 48894424f8                     mov        qword ptr [rsp - 8], rax
0125a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0125e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01262 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01267 48ff742450                     push       qword ptr [rsp + 0x50]
0126c 488f442448                     pop        qword ptr [rsp + 0x48]
01271 48ff742458                     push       qword ptr [rsp + 0x58]
01276 488f442450                     pop        qword ptr [rsp + 0x50]
0127b 48894424f8                     mov        qword ptr [rsp - 8], rax
01280 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01284 89442458                       mov        dword ptr [rsp + 0x58], eax
01288 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128d 48894424f8                     mov        qword ptr [rsp - 8], rax
01292 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01296 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0129a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129f 48894424f8                     mov        qword ptr [rsp - 8], rax
012a4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
012a8 89442460                       mov        dword ptr [rsp + 0x60], eax
012ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b1 48894424f8                     mov        qword ptr [rsp - 8], rax
012b6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
012ba 89442464                       mov        dword ptr [rsp + 0x64], eax
012be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c3 8954246c                       mov        dword ptr [rsp + 0x6c], edx
012c7 90                             nop        
012c8 c5f877                         vzeroupper 
012cb e8904cb4ff                     call       0x7f138f9c44e0
012d0 0f1f8400c8130011               nop        dword ptr [rax + rax + 0x110013c8]
012d8 4d3bda                         cmp        r11, r10
012db bdffffffff                     mov        ebp, 0xffffffff
012e0 7c08                           jl         0x7f138fe7f86a
012e2 400f95c5                       setne      bpl
012e6 400fb6ed                       movzx      ebp, bpl
012ea be45ffffff                     mov        esi, 0xffffff45
012ef 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
012f4 4489442414                     mov        dword ptr [rsp + 0x14], r8d
012f9 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
012fe 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01303 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01308 48894424f8                     mov        qword ptr [rsp - 8], rax
0130d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01311 89442470                       mov        dword ptr [rsp + 0x70], eax
01315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131a 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0131f 90                             nop        
01320 c5f877                         vzeroupper 
01323 e8384cb4ff                     call       0x7f138f9c44e0
01328 0f1f840020140012               nop        dword ptr [rax + rax + 0x12001420]
01330 be45ffffff                     mov        esi, 0xffffff45
01335 488b2c24                       mov        rbp, qword ptr [rsp]
01339 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0133e 4c891424                       mov        qword ptr [rsp], r10
01342 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01347 44895c2408                     mov        dword ptr [rsp + 8], r11d
0134c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01351 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01356 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0135b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01360 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01365 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0136a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0136f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01374 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01379 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0137e 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01383 48894424f8                     mov        qword ptr [rsp - 8], rax
01388 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0138c 89442434                       mov        dword ptr [rsp + 0x34], eax
01390 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01395 48894424f8                     mov        qword ptr [rsp - 8], rax
0139a 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0139e 89442438                       mov        dword ptr [rsp + 0x38], eax
013a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a7 48894424f8                     mov        qword ptr [rsp - 8], rax
013ac 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013b0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b9 48ff742450                     push       qword ptr [rsp + 0x50]
013be 488f442448                     pop        qword ptr [rsp + 0x48]
013c3 48ff742458                     push       qword ptr [rsp + 0x58]
013c8 488f442450                     pop        qword ptr [rsp + 0x50]
013cd 48894424f8                     mov        qword ptr [rsp - 8], rax
013d2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013d6 89442458                       mov        dword ptr [rsp + 0x58], eax
013da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013df 48894424f8                     mov        qword ptr [rsp - 8], rax
013e4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
013e8 89442460                       mov        dword ptr [rsp + 0x60], eax
013ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f1 48894424f8                     mov        qword ptr [rsp - 8], rax
013f6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
013fa 89442468                       mov        dword ptr [rsp + 0x68], eax
013fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01403 90                             nop        
01404 c5f877                         vzeroupper 
01407 e8544bb4ff                     call       0x7f138f9c44e0
0140c 0f1f840004150013               nop        dword ptr [rax + rax + 0x13001504]
01414 be45ffffff                     mov        esi, 0xffffff45
01419 488b2c24                       mov        rbp, qword ptr [rsp]
0141d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01422 4c891424                       mov        qword ptr [rsp], r10
01426 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0142b 4489542408                     mov        dword ptr [rsp + 8], r10d
01430 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01435 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0143a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0143f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01444 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01449 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0144e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01453 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01458 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0145d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01462 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01467 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0146c 48894424f8                     mov        qword ptr [rsp - 8], rax
01471 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01475 89442438                       mov        dword ptr [rsp + 0x38], eax
01479 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147e 48894424f8                     mov        qword ptr [rsp - 8], rax
01483 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01487 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0148b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01490 48ff742450                     push       qword ptr [rsp + 0x50]
01495 488f442448                     pop        qword ptr [rsp + 0x48]
0149a 48ff742458                     push       qword ptr [rsp + 0x58]
0149f 488f442450                     pop        qword ptr [rsp + 0x50]
014a4 48894424f8                     mov        qword ptr [rsp - 8], rax
014a9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014ad 89442458                       mov        dword ptr [rsp + 0x58], eax
014b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b6 48894424f8                     mov        qword ptr [rsp - 8], rax
014bb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014bf 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c8 48894424f8                     mov        qword ptr [rsp - 8], rax
014cd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014d1 89442460                       mov        dword ptr [rsp + 0x60], eax
014d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014da 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
014df 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
014e4 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
014e9 666690                         nop        
014ec c5f877                         vzeroupper 
014ef e86c4ab4ff                     call       0x7f138f9c44e0
014f4 0f1f8400ec150014               nop        dword ptr [rax + rax + 0x140015ec]
014fc 4533d2                         xor        r10d, r10d
014ff 4c891424                       mov        qword ptr [rsp], r10
01503 e940ecffff                     jmp        0x7f138fe7e6c8
01508 4533d2                         xor        r10d, r10d
0150b 4c89542408                     mov        qword ptr [rsp + 8], r10
01510 e961ecffff                     jmp        0x7f138fe7e6f6
01515 4533d2                         xor        r10d, r10d
01518 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0151d e982ecffff                     jmp        0x7f138fe7e724
01522 4533d2                         xor        r10d, r10d
01525 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0152a e9a3ecffff                     jmp        0x7f138fe7e752
0152f 4533d2                         xor        r10d, r10d
01532 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01537 e9c4ecffff                     jmp        0x7f138fe7e780
0153c 4533d2                         xor        r10d, r10d
0153f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01544 e9e2ecffff                     jmp        0x7f138fe7e7ab
01549 bee4ffffff                     mov        esi, 0xffffffe4
0154e 488b2c24                       mov        rbp, qword ptr [rsp]
01552 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01557 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0155c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01561 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01566 48894424f8                     mov        qword ptr [rsp - 8], rax
0156b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0156f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01573 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01578 48894424f8                     mov        qword ptr [rsp - 8], rax
0157d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01581 89442460                       mov        dword ptr [rsp + 0x60], eax
01585 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158a 48894424f8                     mov        qword ptr [rsp - 8], rax
0158f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01593 89442464                       mov        dword ptr [rsp + 0x64], eax
01597 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159c 48894424f8                     mov        qword ptr [rsp - 8], rax
015a1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
015a5 89442468                       mov        dword ptr [rsp + 0x68], eax
015a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ae 48894424f8                     mov        qword ptr [rsp - 8], rax
015b3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
015b7 8944246c                       mov        dword ptr [rsp + 0x6c], eax
015bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
015c4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
015c9 666690                         nop        
015cc c5f877                         vzeroupper 
015cf e88c49b4ff                     call       0x7f138f9c44e0
015d4 0f1f8400cc160015               nop        dword ptr [rax + rax + 0x150016cc]
015dc c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
015e5 bee4ffffff                     mov        esi, 0xffffffe4
015ea 488b2c24                       mov        rbp, qword ptr [rsp]
015ee 4c891424                       mov        qword ptr [rsp], r10
015f2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015f7 4489542408                     mov        dword ptr [rsp + 8], r10d
015fc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01601 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01606 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0160b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01610 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01615 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0161a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0161f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01624 48894424f8                     mov        qword ptr [rsp - 8], rax
01629 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0162d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01631 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01636 48894424f8                     mov        qword ptr [rsp - 8], rax
0163b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0163f 89442460                       mov        dword ptr [rsp + 0x60], eax
01643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01648 48894424f8                     mov        qword ptr [rsp - 8], rax
0164d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01651 89442464                       mov        dword ptr [rsp + 0x64], eax
01655 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165a 48894424f8                     mov        qword ptr [rsp - 8], rax
0165f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01663 89442468                       mov        dword ptr [rsp + 0x68], eax
01667 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166c 48894424f8                     mov        qword ptr [rsp - 8], rax
01671 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01675 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01682 897c247c                       mov        dword ptr [rsp + 0x7c], edi
01686 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
0168e 6690                           nop        
01690 c5f877                         vzeroupper 
01693 e8c848b4ff                     call       0x7f138f9c44e0
01698 0f1f840090170016               nop        dword ptr [rax + rax + 0x16001790]
016a0 bebeffffff                     mov        esi, 0xffffffbe
016a5 488b2c24                       mov        rbp, qword ptr [rsp]
016a9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016ae 4c891424                       mov        qword ptr [rsp], r10
016b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016b7 4489542408                     mov        dword ptr [rsp + 8], r10d
016bc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
016c1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016d0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016d5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016da 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016df 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016e4 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
016e9 48894424f8                     mov        qword ptr [rsp - 8], rax
016ee 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016f2 89442434                       mov        dword ptr [rsp + 0x34], eax
016f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01700 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01704 89442438                       mov        dword ptr [rsp + 0x38], eax
01708 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170d 48894424f8                     mov        qword ptr [rsp - 8], rax
01712 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01716 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0171a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171f 48ff742450                     push       qword ptr [rsp + 0x50]
01724 488f442448                     pop        qword ptr [rsp + 0x48]
01729 48ff742458                     push       qword ptr [rsp + 0x58]
0172e 488f442450                     pop        qword ptr [rsp + 0x50]
01733 48894424f8                     mov        qword ptr [rsp - 8], rax
01738 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0173c 89442458                       mov        dword ptr [rsp + 0x58], eax
01740 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01745 666690                         nop        
01748 c5f877                         vzeroupper 
0174b e81048b4ff                     call       0x7f138f9c44e0
01750 0f1f840048180017               nop        dword ptr [rax + rax + 0x17001848]
01758 be85ffffff                     mov        esi, 0xffffff85
0175d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01761 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01766 44891424                       mov        dword ptr [rsp], r10d
0176a 44896c2404                     mov        dword ptr [rsp + 4], r13d
0176f 90                             nop        
01770 c5f877                         vzeroupper 
01773 e8e847b4ff                     call       0x7f138f9c44e0
01778 0f1f840070180018               nop        dword ptr [rax + rax + 0x18001870]
01780 8bef                           mov        ebp, edi
01782 83c510                         add        ebp, 0x10
01785 be6effffff                     mov        esi, 0xffffff6e
0178a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0178f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01794 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01799 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0179e 897c2438                       mov        dword ptr [rsp + 0x38], edi
017a2 48894424f8                     mov        qword ptr [rsp - 8], rax
017a7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017ab 8944244c                       mov        dword ptr [rsp + 0x4c], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 48894424f8                     mov        qword ptr [rsp - 8], rax
017b9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017bd 89442460                       mov        dword ptr [rsp + 0x60], eax
017c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c6 48894424f8                     mov        qword ptr [rsp - 8], rax
017cb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017cf 89442464                       mov        dword ptr [rsp + 0x64], eax
017d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d8 48894424f8                     mov        qword ptr [rsp - 8], rax
017dd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017e1 89442468                       mov        dword ptr [rsp + 0x68], eax
017e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ea 48894424f8                     mov        qword ptr [rsp - 8], rax
017ef 8b442478                       mov        eax, dword ptr [rsp + 0x78]
017f3 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fc 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01800 c5f877                         vzeroupper 
01803 e85847b4ff                     call       0x7f138f9c44e0
01808 0f1f840000190019               nop        dword ptr [rax + rax + 0x19001900]
01810 8bef                           mov        ebp, edi
01812 83c510                         add        ebp, 0x10
01815 be66ffffff                     mov        esi, 0xffffff66
0181a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0181f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01824 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01829 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0182e 897c2438                       mov        dword ptr [rsp + 0x38], edi
01832 48894424f8                     mov        qword ptr [rsp - 8], rax
01837 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0183b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0183f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01844 48894424f8                     mov        qword ptr [rsp - 8], rax
01849 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0184d 89442460                       mov        dword ptr [rsp + 0x60], eax
01851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01856 48894424f8                     mov        qword ptr [rsp - 8], rax
0185b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0185f 89442464                       mov        dword ptr [rsp + 0x64], eax
01863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01868 48894424f8                     mov        qword ptr [rsp - 8], rax
0186d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01871 89442468                       mov        dword ptr [rsp + 0x68], eax
01875 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187a 48894424f8                     mov        qword ptr [rsp - 8], rax
0187f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01883 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01890 c5f877                         vzeroupper 
01893 e8c846b4ff                     call       0x7f138f9c44e0
01898 0f1f84009019001a               nop        dword ptr [rax + rax + 0x1a001990]
018a0 bee4ffffff                     mov        esi, 0xffffffe4
018a5 488b2c24                       mov        rbp, qword ptr [rsp]
018a9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018ae 4c891424                       mov        qword ptr [rsp], r10
018b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018b7 4489542408                     mov        dword ptr [rsp + 8], r10d
018bc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
018c1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018d0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018d5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018da 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018df 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018e4 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
018e9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ee 8b442438                       mov        eax, dword ptr [rsp + 0x38]
018f2 89442434                       mov        dword ptr [rsp + 0x34], eax
018f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01900 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01904 89442438                       mov        dword ptr [rsp + 0x38], eax
01908 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190d 48894424f8                     mov        qword ptr [rsp - 8], rax
01912 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01916 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0191a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191f 48ff742450                     push       qword ptr [rsp + 0x50]
01924 488f442448                     pop        qword ptr [rsp + 0x48]
01929 48ff742458                     push       qword ptr [rsp + 0x58]
0192e 488f442450                     pop        qword ptr [rsp + 0x50]
01933 48894424f8                     mov        qword ptr [rsp - 8], rax
01938 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0193c 89442458                       mov        dword ptr [rsp + 0x58], eax
01940 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01945 48894424f8                     mov        qword ptr [rsp - 8], rax
0194a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0194e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01952 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01957 48894424f8                     mov        qword ptr [rsp - 8], rax
0195c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01960 89442460                       mov        dword ptr [rsp + 0x60], eax
01964 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01969 48894424f8                     mov        qword ptr [rsp - 8], rax
0196e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01972 89442464                       mov        dword ptr [rsp + 0x64], eax
01976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197b 48894424f8                     mov        qword ptr [rsp - 8], rax
01980 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01984 89442468                       mov        dword ptr [rsp + 0x68], eax
01988 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198d 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01994 c5f877                         vzeroupper 
01997 e8c445b4ff                     call       0x7f138f9c44e0
0199c 0f1f8400941a001b               nop        dword ptr [rax + rax + 0x1b001a94]
019a4 bef6ffffff                     mov        esi, 0xfffffff6
019a9 666690                         nop        
019ac c5f877                         vzeroupper 
019af e8ac45b4ff                     call       0x7f138f9c44e0
019b4 0f1f8400ac1a001c               nop        dword ptr [rax + rax + 0x1c001aac]
019bc bee4ffffff                     mov        esi, 0xffffffe4
019c1 488b2c24                       mov        rbp, qword ptr [rsp]
019c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ca 4c891424                       mov        qword ptr [rsp], r10
019ce 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019d3 44895c2408                     mov        dword ptr [rsp + 8], r11d
019d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019ec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019f6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
019fb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a00 48894424f8                     mov        qword ptr [rsp - 8], rax
01a05 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a09 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a12 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a1a 6690                           nop        
01a1c c5f877                         vzeroupper 
01a1f e83c45b4ff                     call       0x7f138f9c44e0
01a24 0f1f84001c1b001d               nop        dword ptr [rax + rax + 0x1d001b1c]
01a2c bee4ffffff                     mov        esi, 0xffffffe4
01a31 488b2c24                       mov        rbp, qword ptr [rsp]
01a35 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a3a 4c891424                       mov        qword ptr [rsp], r10
01a3e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a43 4489542408                     mov        dword ptr [rsp + 8], r10d
01a48 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01a4d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a52 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a5c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a61 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a66 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a6b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a70 48894424f8                     mov        qword ptr [rsp - 8], rax
01a75 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a79 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a82 6690                           nop        
01a84 c5f877                         vzeroupper 
01a87 e8d444b4ff                     call       0x7f138f9c44e0
01a8c 0f1f8400841b001e               nop        dword ptr [rax + rax + 0x1e001b84]
01a94 bee4ffffff                     mov        esi, 0xffffffe4
01a99 488b2c24                       mov        rbp, qword ptr [rsp]
01a9d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01aa2 4c891424                       mov        qword ptr [rsp], r10
01aa6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01aab 4489542408                     mov        dword ptr [rsp + 8], r10d
01ab0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ab5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01aba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01abf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ac4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ac9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ace 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ad3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ad8 48894424f8                     mov        qword ptr [rsp - 8], rax
01add 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ae1 89442474                       mov        dword ptr [rsp + 0x74], eax
01ae5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aea 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01af2 6690                           nop        
01af4 c5f877                         vzeroupper 
01af7 e86444b4ff                     call       0x7f138f9c44e0
01afc 0f1f8400f41b001f               nop        dword ptr [rax + rax + 0x1f001bf4]
01b04 bee4ffffff                     mov        esi, 0xffffffe4
01b09 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b0e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b13 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b18 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b1d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b22 6690                           nop        
01b24 c5f877                         vzeroupper 
01b27 e83444b4ff                     call       0x7f138f9c44e0
01b2c 0f1f8400241c0020               nop        dword ptr [rax + rax + 0x20001c24]
01b34 418d6801                       lea        ebp, [r8 + 1]
01b38 bee4ffffff                     mov        esi, 0xffffffe4
01b3d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b42 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b47 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b4c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b51 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b56 6690                           nop        
01b58 c5f877                         vzeroupper 
01b5b e80044b4ff                     call       0x7f138f9c44e0
01b60 0f1f8400581c0021               nop        dword ptr [rax + rax + 0x21001c58]
01b68 bee4ffffff                     mov        esi, 0xffffffe4
01b6d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b72 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b77 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b7c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b81 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b86 6690                           nop        
01b88 c5f877                         vzeroupper 
01b8b e8d043b4ff                     call       0x7f138f9c44e0
01b90 0f1f8400881c0022               nop        dword ptr [rax + rax + 0x22001c88]
01b98 bee4ffffff                     mov        esi, 0xffffffe4
01b9d 488b2c24                       mov        rbp, qword ptr [rsp]
01ba1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ba6 4c891424                       mov        qword ptr [rsp], r10
01baa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01baf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bb4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bb9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bbe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bc3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bc8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bcd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bd2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01bd7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01be1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01be5 89442470                       mov        dword ptr [rsp + 0x70], eax
01be9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bee 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01bf3 90                             nop        
01bf4 c5f877                         vzeroupper 
01bf7 e86443b4ff                     call       0x7f138f9c44e0
01bfc 0f1f8400f41c0023               nop        dword ptr [rax + rax + 0x23001cf4]
01c04 be6effffff                     mov        esi, 0xffffff6e
01c09 488b2c24                       mov        rbp, qword ptr [rsp]
01c0d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c12 4c891424                       mov        qword ptr [rsp], r10
01c16 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c1b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c20 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01c25 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c2a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c2f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c34 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c39 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c3e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c43 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c48 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01c4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c52 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c56 89442434                       mov        dword ptr [rsp + 0x34], eax
01c5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c64 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c68 89442438                       mov        dword ptr [rsp + 0x38], eax
01c6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c71 48894424f8                     mov        qword ptr [rsp - 8], rax
01c76 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c7a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c83 48ff742450                     push       qword ptr [rsp + 0x50]
01c88 488f442448                     pop        qword ptr [rsp + 0x48]
01c8d 48ff742458                     push       qword ptr [rsp + 0x58]
01c92 488f442450                     pop        qword ptr [rsp + 0x50]
01c97 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ca0 89442458                       mov        dword ptr [rsp + 0x58], eax
01ca4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cae 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cb2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01cb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbb 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cc4 89442460                       mov        dword ptr [rsp + 0x60], eax
01cc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01cd6 89442464                       mov        dword ptr [rsp + 0x64], eax
01cda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cdf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce4 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ce8 89442468                       mov        dword ptr [rsp + 0x68], eax
01cec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf1 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01cf6 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01cfa 6690                           nop        
01cfc c5f877                         vzeroupper 
01cff e85c42b4ff                     call       0x7f138f9c44e0
01d04 0f1f8400fc1d0024               nop        dword ptr [rax + rax + 0x24001dfc]
01d0c 458bd1                         mov        r10d, r9d
01d0f e9a9edffff                     jmp        0x7f138fe7f03d
01d14 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01d1c 4183c208                       add        r10d, 8
01d20 458bc2                         mov        r8d, r10d
01d23 be45ffffff                     mov        esi, 0xffffff45
01d28 488b2c24                       mov        rbp, qword ptr [rsp]
01d2c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d31 4c891424                       mov        qword ptr [rsp], r10
01d35 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d3a 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d3f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d44 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d49 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d4e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d53 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d58 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d5d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d62 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d67 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d6c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d71 48ff742440                     push       qword ptr [rsp + 0x40]
01d76 488f442438                     pop        qword ptr [rsp + 0x38]
01d7b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d80 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d85 48ff742450                     push       qword ptr [rsp + 0x50]
01d8a 488f442448                     pop        qword ptr [rsp + 0x48]
01d8f 48ff742458                     push       qword ptr [rsp + 0x58]
01d94 488f442450                     pop        qword ptr [rsp + 0x50]
01d99 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d9e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01da3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01da8 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01dad 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01db2 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01db7 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01dbf 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01dc4 458bd3                         mov        r10d, r11d
01dc7 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01dcc c5f877                         vzeroupper 
01dcf e88c41b4ff                     call       0x7f138f9c44e0
01dd4 0f1f8400cc1e0025               nop        dword ptr [rax + rax + 0x25001ecc]
01ddc be45ffffff                     mov        esi, 0xffffff45
01de1 488b2c24                       mov        rbp, qword ptr [rsp]
01de5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dea 4c891424                       mov        qword ptr [rsp], r10
01dee 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01df3 4489542408                     mov        dword ptr [rsp + 8], r10d
01df8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01dfd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e02 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e07 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e0c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e11 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e16 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e1b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e20 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e25 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01e2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e33 89442438                       mov        dword ptr [rsp + 0x38], eax
01e37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e45 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4e 48ff742450                     push       qword ptr [rsp + 0x50]
01e53 488f442448                     pop        qword ptr [rsp + 0x48]
01e58 48ff742458                     push       qword ptr [rsp + 0x58]
01e5d 488f442450                     pop        qword ptr [rsp + 0x50]
01e62 48894424f8                     mov        qword ptr [rsp - 8], rax
01e67 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e6b 89442458                       mov        dword ptr [rsp + 0x58], eax
01e6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e74 48894424f8                     mov        qword ptr [rsp - 8], rax
01e79 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e7d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e86 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e8f 89442460                       mov        dword ptr [rsp + 0x60], eax
01e93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e98 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01e9d 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01ea2 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ea7 90                             nop        
01ea8 c5f877                         vzeroupper 
01eab e8b040b4ff                     call       0x7f138f9c44e0
01eb0 0f1f8400a81f0026               nop        dword ptr [rax + rax + 0x26001fa8]
01eb8 beccffffff                     mov        esi, 0xffffffcc
01ebd 488b2c24                       mov        rbp, qword ptr [rsp]
01ec1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ec6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ecb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ed0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ed5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eda 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ede 89442470                       mov        dword ptr [rsp + 0x70], eax
01ee2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee7 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01eec c5f877                         vzeroupper 
01eef e86c40b4ff                     call       0x7f138f9c44e0
01ef4 0f1f8400ec1f0027               nop        dword ptr [rax + rax + 0x27001fec]
01efc be45ffffff                     mov        esi, 0xffffff45
01f01 488b2c24                       mov        rbp, qword ptr [rsp]
01f05 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f0a 4c891424                       mov        qword ptr [rsp], r10
01f0e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f13 4489542408                     mov        dword ptr [rsp + 8], r10d
01f18 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f1d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f22 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f27 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f2c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f31 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f36 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f3b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f40 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f45 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f53 89442438                       mov        dword ptr [rsp + 0x38], eax
01f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f61 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f65 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6e 48ff742450                     push       qword ptr [rsp + 0x50]
01f73 488f442448                     pop        qword ptr [rsp + 0x48]
01f78 48ff742458                     push       qword ptr [rsp + 0x58]
01f7d 488f442450                     pop        qword ptr [rsp + 0x50]
01f82 48894424f8                     mov        qword ptr [rsp - 8], rax
01f87 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f8b 89442458                       mov        dword ptr [rsp + 0x58], eax
01f8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f94 48894424f8                     mov        qword ptr [rsp - 8], rax
01f99 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f9d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fa1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa6 48894424f8                     mov        qword ptr [rsp - 8], rax
01fab 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01faf 89442460                       mov        dword ptr [rsp + 0x60], eax
01fb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb8 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01fbd 666690                         nop        
01fc0 c5f877                         vzeroupper 
01fc3 e8983fb4ff                     call       0x7f138f9c44e0
01fc8 0f1f8400c0200028               nop        dword ptr [rax + rax + 0x280020c0]
01fd0 beccffffff                     mov        esi, 0xffffffcc
01fd5 488b2c24                       mov        rbp, qword ptr [rsp]
01fd9 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01fde 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01fe3 90                             nop        
01fe4 c5f877                         vzeroupper 
01fe7 e8743fb4ff                     call       0x7f138f9c44e0
01fec 0f1f8400e4200029               nop        dword ptr [rax + rax + 0x290020e4]
01ff4 beccffffff                     mov        esi, 0xffffffcc
01ff9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ffe 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02003 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02008 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0200d 48894424f8                     mov        qword ptr [rsp - 8], rax
02012 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02016 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0201a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201f 48894424f8                     mov        qword ptr [rsp - 8], rax
02024 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02028 89442460                       mov        dword ptr [rsp + 0x60], eax
0202c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02031 48894424f8                     mov        qword ptr [rsp - 8], rax
02036 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0203a 89442464                       mov        dword ptr [rsp + 0x64], eax
0203e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02043 48894424f8                     mov        qword ptr [rsp - 8], rax
02048 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0204c 89442468                       mov        dword ptr [rsp + 0x68], eax
02050 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02055 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02059 666690                         nop        
0205c c5f877                         vzeroupper 
0205f e8fc3eb4ff                     call       0x7f138f9c44e0
02064 0f1f84005c21002a               nop        dword ptr [rax + rax + 0x2a00215c]
0206c beccffffff                     mov        esi, 0xffffffcc
02071 488b2c24                       mov        rbp, qword ptr [rsp]
02075 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0207a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0207f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02084 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02089 48894424f8                     mov        qword ptr [rsp - 8], rax
0208e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02092 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02096 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209b 48894424f8                     mov        qword ptr [rsp - 8], rax
020a0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020a4 89442460                       mov        dword ptr [rsp + 0x60], eax
020a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ad 48894424f8                     mov        qword ptr [rsp - 8], rax
020b2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020b6 89442464                       mov        dword ptr [rsp + 0x64], eax
020ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020bf 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
020c7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
020cf 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
020d7 90                             nop        
020d8 c5f877                         vzeroupper 
020db e8803eb4ff                     call       0x7f138f9c44e0
020e0 0f1f8400d821002b               nop        dword ptr [rax + rax + 0x2b0021d8]
020e8 beccffffff                     mov        esi, 0xffffffcc
020ed 488b2c24                       mov        rbp, qword ptr [rsp]
020f1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020f6 4c891424                       mov        qword ptr [rsp], r10
020fa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020ff 44895c2408                     mov        dword ptr [rsp + 8], r11d
02104 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02109 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0210e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02113 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02118 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0211d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02122 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02127 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0212c 48894424f8                     mov        qword ptr [rsp - 8], rax
02131 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02135 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02139 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213e 48894424f8                     mov        qword ptr [rsp - 8], rax
02143 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02147 89442460                       mov        dword ptr [rsp + 0x60], eax
0214b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02150 48894424f8                     mov        qword ptr [rsp - 8], rax
02155 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02159 89442464                       mov        dword ptr [rsp + 0x64], eax
0215d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02162 48894424f8                     mov        qword ptr [rsp - 8], rax
02167 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0216b 89442468                       mov        dword ptr [rsp + 0x68], eax
0216f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02174 48894424f8                     mov        qword ptr [rsp - 8], rax
02179 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0217d 89442470                       mov        dword ptr [rsp + 0x70], eax
02181 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02186 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0218a 6690                           nop        
0218c c5f877                         vzeroupper 
0218f e8cc3db4ff                     call       0x7f138f9c44e0
02194 0f1f84008c22002c               nop        dword ptr [rax + rax + 0x2c00228c]
0219c beccffffff                     mov        esi, 0xffffffcc
021a1 488b2c24                       mov        rbp, qword ptr [rsp]
021a5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021aa 4c891424                       mov        qword ptr [rsp], r10
021ae 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
021b3 44895c2408                     mov        dword ptr [rsp + 8], r11d
021b8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021bd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021c2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021c7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021cc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021d1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021d6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021db 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021e0 48894424f8                     mov        qword ptr [rsp - 8], rax
021e5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021e9 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f2 48894424f8                     mov        qword ptr [rsp - 8], rax
021f7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021fb 89442460                       mov        dword ptr [rsp + 0x60], eax
021ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02204 48894424f8                     mov        qword ptr [rsp - 8], rax
02209 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0220d 89442464                       mov        dword ptr [rsp + 0x64], eax
02211 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02216 48894424f8                     mov        qword ptr [rsp - 8], rax
0221b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0221f 89442468                       mov        dword ptr [rsp + 0x68], eax
02223 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02228 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0222c c5f877                         vzeroupper 
0222f e82c3db4ff                     call       0x7f138f9c44e0
02234 0f1f84002c23002d               nop        dword ptr [rax + rax + 0x2d00232c]
0223c eb0a                           jmp        0x7f138fe807c8
0223e eb08                           jmp        0x7f138fe807c8
02240 eb06                           jmp        0x7f138fe807c8
02242 eb04                           jmp        0x7f138fe807c8
02244 eb02                           jmp        0x7f138fe807c8
02246 eb00                           jmp        0x7f138fe807c8
02248 488bf0                         mov        rsi, rax
0224b e9e4e3ffff                     jmp        0x7f138fe7ebb4
02250 bef6ffffff                     mov        esi, 0xfffffff6
02255 666690                         nop        
02258 c5f877                         vzeroupper 
0225b e8003db4ff                     call       0x7f138f9c44e0
02260 0f1f84005823002e               nop        dword ptr [rax + rax + 0x2e002358]
02268 49baf7f1e78f137f0000           movabs     r10, 0x7f138fe7f1f7
02272 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02279 e9e2c6a7ff                     jmp        0x7f138f8fcee0
0227e e89d92a6ff                     call       0x7f138f8e9aa0
02283 e9a6ddffff                     jmp        0x7f138fe7e5ae
