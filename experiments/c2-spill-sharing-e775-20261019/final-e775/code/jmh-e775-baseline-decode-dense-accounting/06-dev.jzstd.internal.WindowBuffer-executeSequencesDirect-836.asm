00000 e8fb81ca15                     call       0x7f77bdb28580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f856c220000                   jne        0x7f77a7e8261a
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
0008e 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00095 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0009a 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
000a1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000a6 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
000ad 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
000b4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000b9 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000c0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000d8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000ed 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000f2 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000f6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49bac0ecc0bd777f0000           movabs     r10, 0x7f77bdc0ecc0
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84e8130000                   je         0x7f77a7e81898
00130 458b12                         mov        r10d, dword ptr [r10]
00133 41c1ea0d                       shr        r10d, 0xd
00137 4181fa2c420000                 cmp        r10d, 0x422c
0013e 0f8530160000                   jne        0x7f77a7e81af4
00144 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00149 4c891424                       mov        qword ptr [rsp], r10
0014d 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00155 4885ed                         test       rbp, rbp
00158 0f84c6130000                   je         0x7f77a7e818a4
0015e 448b5d00                       mov        r11d, dword ptr [rbp]
00162 41c1eb0d                       shr        r11d, 0xd
00166 4181fbe4050000                 cmp        r11d, 0x5e4
0016d 0f8501160000                   jne        0x7f77a7e81af4
00173 4c8bd5                         mov        r10, rbp
00176 4c89542408                     mov        qword ptr [rsp + 8], r10
0017b 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
00183 4885ed                         test       rbp, rbp
00186 0f84a5130000                   je         0x7f77a7e818b1
0018c 448b5500                       mov        r10d, dword ptr [rbp]
00190 41c1ea0d                       shr        r10d, 0xd
00194 4181fae7050000                 cmp        r10d, 0x5e7
0019b 0f85d3150000                   jne        0x7f77a7e81af4
001a1 4c8bd5                         mov        r10, rbp
001a4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001b1 4885ed                         test       rbp, rbp
001b4 0f8484130000                   je         0x7f77a7e818be
001ba 448b5d00                       mov        r11d, dword ptr [rbp]
001be 41c1eb0d                       shr        r11d, 0xd
001c2 4181fbe6050000                 cmp        r11d, 0x5e6
001c9 0f85a5150000                   jne        0x7f77a7e81af4
001cf 4c8bd5                         mov        r10, rbp
001d2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d7 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001df 4885ed                         test       rbp, rbp
001e2 0f8463130000                   je         0x7f77a7e818cb
001e8 448b5d00                       mov        r11d, dword ptr [rbp]
001ec 41c1eb0d                       shr        r11d, 0xd
001f0 4181fbe6050000                 cmp        r11d, 0x5e6
001f7 0f8577150000                   jne        0x7f77a7e81af4
001fd 4c8bd5                         mov        r10, rbp
00200 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00205 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
0020d 4885ed                         test       rbp, rbp
00210 0f8442130000                   je         0x7f77a7e818d8
00216 448b5d00                       mov        r11d, dword ptr [rbp]
0021a 41c1eb0d                       shr        r11d, 0xd
0021e 4181fbe4050000                 cmp        r11d, 0x5e4
00225 0f8549150000                   jne        0x7f77a7e81af4
0022b 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
00230 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00235 458b5204                       mov        r10d, dword ptr [r10 + 4]
00239 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0023e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00243 4585db                         test       r11d, r11d
00246 0f8470140000                   je         0x7f77a7e81a3c
0024c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00251 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00255 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0025a 4585db                         test       r11d, r11d
0025d 0f8659140000                   jbe        0x7f77a7e81a3c
00263 4183fb01                       cmp        r11d, 1
00267 0f864f140000                   jbe        0x7f77a7e81a3c
0026d 4183fb02                       cmp        r11d, 2
00271 0f8645140000                   jbe        0x7f77a7e81a3c
00277 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0027c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00280 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00285 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0028a 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0028e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00293 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00298 4183c2f1                       add        r10d, -0xf
0029c 4585d2                         test       r10d, r10d
0029f 0f8c17140000                   jl         0x7f77a7e81a3c
002a5 4183c3f1                       add        r11d, -0xf
002a9 4585db                         test       r11d, r11d
002ac 0f8c0a140000                   jl         0x7f77a7e81a3c
002b2 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002b7 4183c2f9                       add        r10d, -7
002bb 4585d2                         test       r10d, r10d
002be 0f8cf8130000                   jl         0x7f77a7e81a3c
002c4 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002c9 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
002d1 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002d6 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002de 4183c3f1                       add        r11d, -0xf
002e2 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002ea 4183c2f1                       add        r10d, -0xf
002ee 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002f6 e9bb010000                     jmp        0x7f77a7e80836
002fb 4533d2                         xor        r10d, r10d
002fe 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00303 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00308 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0030c 83fb03                         cmp        ebx, 3
0030f 0f8eb8030000                   jle        0x7f77a7e80a4d
00315 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0031a 45895310                       mov        dword ptr [r11 + 0x10], r10d
0031e 458b5308                       mov        r10d, dword ptr [r11 + 8]
00322 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00326 448d53fd                       lea        r10d, [rbx - 3]
0032a 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00332 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00337 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0033f 45895a08                       mov        dword ptr [r10 + 8], r11d
00343 4c63942490000000               movsxd     r10, dword ptr [rsp + 0x90]
0034b 4d63dd                         movsxd     r11, r13d
0034e 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
00353 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00358 4c03da                         add        r11, rdx
0035b 4d3bd3                         cmp        r10, r11
0035e 0f8f900f0000                   jg         0x7f77a7e81674
00364 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0036c 4585d2                         test       r10d, r10d
0036f 0f8e6f0e0000                   jle        0x7f77a7e81564
00375 418bdd                         mov        ebx, r13d
00378 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
0037c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00381 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
00386 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0038e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00393 4403db                         add        r11d, ebx
00396 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
0039b 0f8f29090000                   jg         0x7f77a7e8104a
003a1 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
003a6 0f8fa00f0000                   jg         0x7f77a7e816cc
003ac 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003b1 4183fa10                       cmp        r10d, 0x10
003b5 0f8fb1010000                   jg         0x7f77a7e808ec
003bb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003c0 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
003c8 0f834e0d0000                   jae        0x7f77a7e8149c
003ce 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003d3 458bc3                         mov        r8d, r11d
003d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003db c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
003e2 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
003ea 0f83700d0000                   jae        0x7f77a7e814e0
003f0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003f5 4503d8                         add        r11d, r8d
003f8 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00400 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00405 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
0040c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00411 4503d5                         add        r10d, r13d
00414 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00419 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0041e 442b842490000000               sub        r8d, dword ptr [rsp + 0x90]
00426 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0042b 4183fa10                       cmp        r10d, 0x10
0042f 0f8ffb0f0000                   jg         0x7f77a7e817b0
00435 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0043d 4183fb10                       cmp        r11d, 0x10
00441 0f8c65030000                   jl         0x7f77a7e80b2c
00447 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0044f 0f83ff0b0000                   jae        0x7f77a7e813d4
00455 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0045a c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00461 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00466 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0046e 0f833c0c0000                   jae        0x7f77a7e81430
00474 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00479 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0047e c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00485 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
0048a 4503eb                         add        r13d, r11d
0048d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00492 41ffc2                         inc        r10d
00495 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0049a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0049e 418502                         test       dword ptr [r10], eax
004a1 48894424f8                     mov        qword ptr [rsp - 8], rax
004a6 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
004ad 89442438                       mov        dword ptr [rsp + 0x38], eax
004b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004b6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004bb 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
004c0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
004c5 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
004ca 4c8b542408                     mov        r10, qword ptr [rsp + 8]
004cf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
004d4 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
004d9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004de 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004e3 0f8d2d070000                   jge        0x7f77a7e80f96
004e9 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
004ee 0f83230b0000                   jae        0x7f77a7e81397
004f4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
004f9 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
004fe 4d8bd3                         mov        r10, r11
00501 49c1ea12                       shr        r10, 0x12
00505 458bd2                         mov        r10d, r10d
00508 4181e2ffff0300                 and        r10d, 0x3ffff
0050f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00514 458bd3                         mov        r10d, r11d
00517 49c1fb24                       sar        r11, 0x24
0051b 4181e2ffff0100                 and        r10d, 0x1ffff
00522 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00527 458bd3                         mov        r10d, r11d
0052a 418bda                         mov        ebx, r10d
0052d 4585d2                         test       r10d, r10d
00530 0f8cce0c0000                   jl         0x7f77a7e81584
00536 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0053b 4585db                         test       r11d, r11d
0053e 0f84b7fdffff                   je         0x7f77a7e8067b
00544 458bd3                         mov        r10d, r11d
00547 453bd1                         cmp        r10d, r9d
0054a 0f8eb3fdffff                   jle        0x7f77a7e80683
00550 be45ffffff                     mov        esi, 0xffffff45
00555 418bea                         mov        ebp, r10d
00558 44890c24                       mov        dword ptr [rsp], r9d
0055c c5f877                         vzeroupper 
0055f e87c35b4ff                     call       0x7f77a79c3e60
00564 0f1f84005c060001               nop        dword ptr [rax + rax + 0x100065c]
0056c 4183fa30                       cmp        r10d, 0x30
00570 0f8fb5050000                   jg         0x7f77a7e80eab
00576 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0057b 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00583 0f83dc0f0000                   jae        0x7f77a7e818e5
00589 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0058e 418bcb                         mov        ecx, r11d
00591 4d63c3                         movsxd     r8, r11d
00594 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00599 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
005a0 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
005a8 0f834a100000                   jae        0x7f77a7e81978
005ae 458d5510                       lea        r10d, [r13 + 0x10]
005b2 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
005ba 4d63d5                         movsxd     r10, r13d
005bd 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005c2 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
005c9 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
005d1 443bdb                         cmp        r11d, ebx
005d4 0f8dda000000                   jge        0x7f77a7e80a34
005da 4d2bc2                         sub        r8, r10
005dd 4d63db                         movsxd     r11, r11d
005e0 4c638c2480000000               movsxd     r9, dword ptr [rsp + 0x80]
005e8 4983c1f1                       add        r9, -0xf
005ec 4f8d1403                       lea        r10, [r11 + r8]
005f0 4d3bd1                         cmp        r10, r9
005f3 0f83a3110000                   jae        0x7f77a7e81b1c
005f9 4c63d3                         movsxd     r10, ebx
005fc 4d2bd3                         sub        r10, r11
005ff 4983c20f                       add        r10, 0xf
00603 4983e2f0                       and        r10, 0xfffffffffffffff0
00607 458bd2                         mov        r10d, r10d
0060a 478d5c2a10                     lea        r11d, [r10 + r13 + 0x10]
0060f 4d63d3                         movsxd     r10, r11d
00612 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
00617 4d3bd9                         cmp        r11, r9
0061a 0f837c110000                   jae        0x7f77a7e81b1c
00620 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00628 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00630 0f8366110000                   jae        0x7f77a7e81b1c
00636 4983c2f0                       add        r10, -0x10
0063a 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
00642 4983c3f1                       add        r11, -0xf
00646 4d3bd3                         cmp        r10, r11
00649 0f834d110000                   jae        0x7f77a7e81b1c
0064f 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00655 0f8fd1110000                   jg         0x7f77a7e81bac
0065b 448bd1                         mov        r10d, ecx
0065e 452bd5                         sub        r10d, r13d
00661 0f1f840000000000               nop        dword ptr [rax + rax]
00669 0f1f8000000000                 nop        dword ptr [rax]
00670 458bc2                         mov        r8d, r10d
00673 4403842494000000               add        r8d, dword ptr [rsp + 0x94]
0067b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00680 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00687 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0068f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00694 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0069b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
006a3 4183c310                       add        r11d, 0x10
006a7 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
006af 443bdb                         cmp        r11d, ebx
006b2 7cbc                           jl         0x7f77a7e809f0
006b4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
006b9 4403d9                         add        r11d, ecx
006bc 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
006c4 895c2438                       mov        dword ptr [rsp + 0x38], ebx
006c8 e94cfdffff                     jmp        0x7f77a7e80799
006cd 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
006d2 4585c0                         test       r8d, r8d
006d5 7407                           je         0x7f77a7e80a5e
006d7 448d5bff                       lea        r11d, [rbx - 1]
006db 418bdb                         mov        ebx, r11d
006de 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006e3 458b4b08                       mov        r9d, dword ptr [r11 + 8]
006e7 85db                           test       ebx, ebx
006e9 7478                           je         0x7f77a7e80ae3
006eb 83fb03                         cmp        ebx, 3
006ee 0f84a0040000                   je         0x7f77a7e80f14
006f4 83fb02                         cmp        ebx, 2
006f7 7777                           ja         0x7f77a7e80af0
006f9 3b5c242c                       cmp        ebx, dword ptr [rsp + 0x2c]
006fd 0f83b9110000                   jae        0x7f77a7e81c3c
00703 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00708 458b4c9b08                     mov        r9d, dword ptr [r11 + rbx*4 + 8]
0070d 85db                           test       ebx, ebx
0070f 7e49                           jle        0x7f77a7e80ada
00711 448d5bff                       lea        r11d, [rbx - 1]
00715 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0071a 0f8390130000                   jae        0x7f77a7e81e30
00720 33c9                           xor        ecx, ecx
00722 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00727 458bda                         mov        r11d, r10d
0072a 4183c3cc                       add        r11d, -0x34
0072e 41c1eb02                       shr        r11d, 2
00732 458d541bff                     lea        r10d, [r11 + rbx - 1]
00737 4c63db                         movsxd     r11, ebx
0073a 41b804000000                   mov        r8d, 4
00740 c442b8f5d2                     bzhi       r10, r10, r8
00745 4d2bda                         sub        r11, r10
00748 49ffcb                         dec        r11
0074b 4d85db                         test       r11, r11
0074e 4c0f4cd9                       cmovl      r11, rcx
00752 458bd3                         mov        r10d, r11d
00755 e9a9020000                     jmp        0x7f77a7e80d83
0075a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0075f 45894a08                       mov        dword ptr [r10 + 8], r9d
00763 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
0076b e9d3fbffff                     jmp        0x7f77a7e806c3
00770 48be680fbce200000000           movabs     rsi, 0xe2bc0f68
0077a 418bed                         mov        ebp, r13d
0077d 666690                         nop        
00780 c5f877                         vzeroupper 
00783 e8589da7ff                     call       0x7f77a78fa860
00788 0f1f840080080002               nop        dword ptr [rax + rax + 0x2000880]
00790 4885c0                         test       rax, rax
00793 0f8427120000                   je         0x7f77a7e81d40
00799 488bf0                         mov        rsi, rax
0079c c5f877                         vzeroupper 
0079f 4881c4c0000000                 add        rsp, 0xc0
007a6 5d                             pop        rbp
007a7 e9b454b4ff                     jmp        0x7f77a79c5fe0
007ac 4403542438                     add        r10d, dword ptr [rsp + 0x38]
007b1 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
007b9 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
007be 0f8d7d010000                   jge        0x7f77a7e80cc1
007c4 4183fb08                       cmp        r11d, 8
007c8 0f8d4a170000                   jge        0x7f77a7e82298
007ce 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
007d3 0f83e7130000                   jae        0x7f77a7e81f40
007d9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007de 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
007e4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007e9 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007ee 0f833c140000                   jae        0x7f77a7e81fb0
007f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007f9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
007fe 43886c0a08                     mov        byte ptr [r10 + r9 + 8], bpl
00803 458d5003                       lea        r10d, [r8 + 3]
00807 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0080c 41ffc3                         inc        r11d
0080f 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00817 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0081c 0f833e140000                   jae        0x7f77a7e81fe0
00822 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00827 4183c203                       add        r10d, 3
0082b 4d63d8                         movsxd     r11, r8d
0082e 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00833 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
00839 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0083e 0f8350140000                   jae        0x7f77a7e82014
00844 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00849 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
0084e 430fbe4c190a                   movsx      ecx, byte ptr [r9 + r11 + 0xa]
00854 43884c110a                     mov        byte ptr [r9 + r10 + 0xa], cl
00859 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
0085f 47885c110b                     mov        byte ptr [r9 + r10 + 0xb], r11b
00864 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0086c 4183fb08                       cmp        r11d, 8
00870 0f834e140000                   jae        0x7f77a7e82044
00876 49ba887eb6e200000000           movabs     r10, 0xe2b67e88
00880 4703449a08                     add        r8d, dword ptr [r10 + r11*4 + 8]
00885 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0088a 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0088f 4183fb04                       cmp        r11d, 4
00893 7e3b                           jle        0x7f77a7e80c50
00895 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00899 83c504                         add        ebp, 4
0089c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008a1 418bd0                         mov        edx, r8d
008a4 c5f877                         vzeroupper 
008a7 e8349ca7ff                     call       0x7f77a78fa860
008ac 0f1f8400a4090003               nop        dword ptr [rax + rax + 0x30009a4]
008b4 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008b9 8bd5                           mov        edx, ebp
008bb 8bc8                           mov        ecx, eax
008bd 666690                         nop        
008c0 c5f877                         vzeroupper 
008c3 e8189ca7ff                     call       0x7f77a78fa860
008c8 0f1f8400c0090004               nop        dword ptr [rax + rax + 0x40009c0]
008d0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
008d5 4183fb08                       cmp        r11d, 8
008d9 7e59                           jle        0x7f77a7e80cb4
008db 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008df 83c508                         add        ebp, 8
008e2 49bab07eb6e200000000           movabs     r10, 0xe2b67eb0
008ec 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
008f0 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
008f8 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
008fd 83c208                         add        edx, 8
00900 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00905 666690                         nop        
00908 c5f877                         vzeroupper 
0090b e8d09ba7ff                     call       0x7f77a78fa860
00910 0f1f8400080a0005               nop        dword ptr [rax + rax + 0x5000a08]
00918 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0091d 8bd5                           mov        edx, ebp
0091f 488bc8                         mov        rcx, rax
00922 6690                           nop        
00924 c5f877                         vzeroupper 
00927 e8b49ba7ff                     call       0x7f77a78fa860
0092c 0f1f8400240a0006               nop        dword ptr [rax + rax + 0x6000a24]
00934 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
0093c e94cfbffff                     jmp        0x7f77a7e8080d
00941 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00946 4183fa30                       cmp        r10d, 0x30
0094a 0f8fa8140000                   jg         0x7f77a7e82178
00950 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00958 4183c3f9                       add        r11d, -7
0095c 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00964 453bc3                         cmp        r8d, r11d
00967 0f836b100000                   jae        0x7f77a7e81d58
0096d 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00975 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0097a 4b8b6c0208                     mov        rbp, qword ptr [r10 + r8 + 8]
0097f 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00987 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0098c 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00994 0f83ae100000                   jae        0x7f77a7e81dc8
0099a 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0099e 89ac2490000000                 mov        dword ptr [rsp + 0x90], ebp
009a5 48be28c122e200000000           movabs     rsi, 0xe222c128
009af 4863cd                         movsxd     rcx, ebp
009b2 4883c108                       add        rcx, 8
009b6 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009bb 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009c3 4533c9                         xor        r9d, r9d
009c6 6690                           nop        
009c8 c5f877                         vzeroupper 
009cb e81091a7ff                     call       0x7f77a78f9e60
009d0 0f1f8400c80a0007               nop        dword ptr [rax + rax + 0x7000ac8]
009d8 448d5508                       lea        r10d, [rbp + 8]
009dc 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
009e4 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
009ec 0f8c3e130000                   jl         0x7f77a7e820b0
009f2 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
009f7 4403ed                         add        r13d, ebp
009fa e98efaffff                     jmp        0x7f77a7e8080d
009ff 90                             nop        
00a00 418bdb                         mov        ebx, r11d
00a03 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00a08 458b449804                     mov        r8d, dword ptr [r8 + rbx*4 + 4]
00a0d 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00a12 4489449908                     mov        dword ptr [rcx + rbx*4 + 8], r8d
00a17 448d5bff                       lea        r11d, [rbx - 1]
00a1b 453bda                         cmp        r11d, r10d
00a1e 7fe0                           jg         0x7f77a7e80d80
00a20 4183fb3f                       cmp        r11d, 0x3f
00a24 0f8e8e110000                   jle        0x7f77a7e81f38
00a2a 448bd3                         mov        r10d, ebx
00a2d 41ffca                         dec        r10d
00a30 458bc2                         mov        r8d, r10d
00a33 eb0e                           jmp        0x7f77a7e80dc3
00a35 6666660f1f840000000000         nop        word ptr [rax + rax]
00a40 458bc2                         mov        r8d, r10d
00a43 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a48 62917e486f8483c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0x38]
00a53 62917e487f8483ccffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0x34], zmm0
00a5e 62917e486f848388ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0x78]
00a69 62917e487f84838cffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0x74], zmm0
00a74 62917e486f848348ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0xb8]
00a7f 62917e487f84834cffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0xb4], zmm0
00a8a 62917e486f848308ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0xf8]
00a95 62917e487f84830cffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0xf4], zmm0
00aa0 458d50c0                       lea        r10d, [r8 - 0x40]
00aa4 4183fa3f                       cmp        r10d, 0x3f
00aa8 7f96                           jg         0x7f77a7e80dc0
00aaa 4183fa0f                       cmp        r10d, 0xf
00aae 7e2d                           jle        0x7f77a7e80e5d
00ab0 458bd0                         mov        r10d, r8d
00ab3 4183c2c0                       add        r10d, -0x40
00ab7 90                             nop        
00ab8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00abd 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00ac8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00ad3 4183c2f0                       add        r10d, -0x10
00ad7 4183fa0f                       cmp        r10d, 0xf
00adb 7fdb                           jg         0x7f77a7e80e38
00add 4585d2                         test       r10d, r10d
00ae0 0f8e74fcffff                   jle        0x7f77a7e80ada
00ae6 6690                           nop        
00ae8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00aed 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00af2 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00af7 47895c9008                     mov        dword ptr [r8 + r10*4 + 8], r11d
00afc 41ffca                         dec        r10d
00aff 4585d2                         test       r10d, r10d
00b02 7fe4                           jg         0x7f77a7e80e68
00b04 e951fcffff                     jmp        0x7f77a7e80ada
00b09 4d63d2                         movsxd     r10, r10d
00b0c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b13 c442a8f5db                     bzhi       r11, r11, r10
00b18 c4c1fb92fb                     kmovq      k7, r11
00b1d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b23 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b29 eb60                           jmp        0x7f77a7e80f0b
00b2b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b30 4585d2                         test       r10d, r10d
00b33 0f8c9b130000                   jl         0x7f77a7e82254
00b39 4585ed                         test       r13d, r13d
00b3c 0f8c92130000                   jl         0x7f77a7e82254
00b42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b47 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00b4f 0f827f130000                   jb         0x7f77a7e82254
00b55 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00b5a 443bdb                         cmp        r11d, ebx
00b5d 0f8271130000                   jb         0x7f77a7e82254
00b63 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b68 4585d2                         test       r10d, r10d
00b6b 741e                           je         0x7f77a7e80f0b
00b6d 4883fa20                       cmp        rdx, 0x20
00b71 7696                           jbe        0x7f77a7e80e89
00b73 c5f877                         vzeroupper 
00b76 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00b80 41ffd2                         call       r10
00b83 0f1f840000000000               nop        dword ptr [rax + rax]
00b8b 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00b8f e985f8ffff                     jmp        0x7f77a7e80799
00b94 41ffc9                         dec        r9d
00b97 4585c9                         test       r9d, r9d
00b9a 7e1a                           jle        0x7f77a7e80f36
00b9c 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00ba1 45895310                       mov        dword ptr [r11 + 0x10], r10d
00ba5 458b5308                       mov        r10d, dword ptr [r11 + 8]
00ba9 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00bad 45894b08                       mov        dword ptr [r11 + 8], r9d
00bb1 e9adfbffff                     jmp        0x7f77a7e80ae3
00bb6 48be380fbce200000000           movabs     rsi, 0xe2bc0f38
00bc0 418bed                         mov        ebp, r13d
00bc3 90                             nop        
00bc4 c5f877                         vzeroupper 
00bc7 e81499a7ff                     call       0x7f77a78fa860
00bcc 0f1f8400c40c0008               nop        dword ptr [rax + rax + 0x8000cc4]
00bd4 4885c0                         test       rax, rax
00bd7 0f85bcfbffff                   jne        0x7f77a7e80b19
00bdd bef6ffffff                     mov        esi, 0xfffffff6
00be2 6690                           nop        
00be4 c5f877                         vzeroupper 
00be7 e8f42eb4ff                     call       0x7f77a79c3e60
00bec 0f1f8400e40c0009               nop        dword ptr [rax + rax + 0x9000ce4]
00bf4 4d63d1                         movsxd     r10, r9d
00bf7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bfe c442a8f5db                     bzhi       r11, r11, r10
00c03 c4c1fb92fb                     kmovq      k7, r11
00c08 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c0e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c14 eb6f                           jmp        0x7f77a7e81005
00c16 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c1b 4585db                         test       r11d, r11d
00c1e 0f8cc8130000                   jl         0x7f77a7e8236c
00c24 4585ed                         test       r13d, r13d
00c27 0f8cbf130000                   jl         0x7f77a7e8236c
00c2d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c32 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00c37 0f82af130000                   jb         0x7f77a7e8236c
00c3d 438d2c29                       lea        ebp, [r9 + r13]
00c41 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c46 443bd5                         cmp        r10d, ebp
00c49 0f829d130000                   jb         0x7f77a7e8236c
00c4f 4585c9                         test       r9d, r9d
00c52 0f8c94130000                   jl         0x7f77a7e8236c
00c58 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00c5d 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00c62 7421                           je         0x7f77a7e81005
00c64 4963d1                         movsxd     rdx, r9d
00c67 4883fa20                       cmp        rdx, 0x20
00c6b 7687                           jbe        0x7f77a7e80f74
00c6d c5f877                         vzeroupper 
00c70 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00c7a 41ffd2                         call       r10
00c7d 0f1f840000000000               nop        dword ptr [rax + rax]
00c85 4c8b1424                       mov        r10, qword ptr [rsp]
00c89 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00c8d c5f877                         vzeroupper 
00c90 4881c4c0000000                 add        rsp, 0xc0
00c97 5d                             pop        rbp
00c98 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c9c 0f87e2150000                   ja         0x7f77a7e82604
00ca2 c3                             ret        
00ca3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00ca8 4d63d3                         movsxd     r10, r11d
00cab 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cb2 c442a8f5db                     bzhi       r11, r11, r10
00cb7 c4c1fb92fb                     kmovq      k7, r11
00cbc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cc2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cc8 eb72                           jmp        0x7f77a7e810bc
00cca 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00ccf 4585db                         test       r11d, r11d
00cd2 0f8437030000                   je         0x7f77a7e8138f
00cd8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00cdd 4585d2                         test       r10d, r10d
00ce0 0f8ca2130000                   jl         0x7f77a7e82408
00ce6 4585ed                         test       r13d, r13d
00ce9 0f8c99130000                   jl         0x7f77a7e82408
00cef 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00cf4 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00cfc 0f8286130000                   jb         0x7f77a7e82408
00d02 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d07 443bdb                         cmp        r11d, ebx
00d0a 0f8278130000                   jb         0x7f77a7e82408
00d10 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00d15 4585d2                         test       r10d, r10d
00d18 7422                           je         0x7f77a7e810bc
00d1a 4883fa20                       cmp        rdx, 0x20
00d1e 0f867fffffff                   jbe        0x7f77a7e81023
00d24 c5f877                         vzeroupper 
00d27 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00d31 41ffd2                         call       r10
00d34 0f1f840000000000               nop        dword ptr [rax + rax]
00d3c 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d41 4585db                         test       r11d, r11d
00d44 0f8ea7010000                   jle        0x7f77a7e81271
00d4a 448bd3                         mov        r10d, ebx
00d4d 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00d55 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00d5d 458d341b                       lea        r14d, [r11 + rbx]
00d61 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d66 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d6e 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00d73 498d741a08                     lea        rsi, [r10 + rbx + 8]
00d78 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00d80 453bd3                         cmp        r10d, r11d
00d83 0f8de6000000                   jge        0x7f77a7e811ef
00d89 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00d91 458bd3                         mov        r10d, r11d
00d94 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00d9c 450f4fd0                       cmovg      r10d, r8d
00da0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00da8 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00db0 4585d2                         test       r10d, r10d
00db3 0f8c4b130000                   jl         0x7f77a7e82484
00db9 85db                           test       ebx, ebx
00dbb 0f8c43130000                   jl         0x7f77a7e82484
00dc1 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00dc9 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
00dd1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00dd6 453bc2                         cmp        r8d, r10d
00dd9 0f8225130000                   jb         0x7f77a7e82484
00ddf 448bd3                         mov        r10d, ebx
00de2 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
00dea 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00df2 458bd8                         mov        r11d, r8d
00df5 453bda                         cmp        r11d, r10d
00df8 0f8206130000                   jb         0x7f77a7e82484
00dfe 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00e06 4585d2                         test       r10d, r10d
00e09 0f8cf5120000                   jl         0x7f77a7e82484
00e0f 4585d2                         test       r10d, r10d
00e12 7429                           je         0x7f77a7e811bd
00e14 4963d2                         movsxd     rdx, r10d
00e17 4883fa20                       cmp        rdx, 0x20
00e1b 7738                           ja         0x7f77a7e811d5
00e1d 4d63d2                         movsxd     r10, r10d
00e20 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e27 c442a8f5db                     bzhi       r11, r11, r10
00e2c c4c1fb92fb                     kmovq      k7, r11
00e31 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e37 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e3d 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00e45 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00e4a 0f8cf8000000                   jl         0x7f77a7e812c8
00e50 e99f000000                     jmp        0x7f77a7e81274
00e55 c5f877                         vzeroupper 
00e58 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00e62 41ffd2                         call       r10
00e65 0f1f840000000000               nop        dword ptr [rax + rax]
00e6d ebce                           jmp        0x7f77a7e811bd
00e6f 4585c0                         test       r8d, r8d
00e72 0f8c40130000                   jl         0x7f77a7e82538
00e78 85db                           test       ebx, ebx
00e7a 0f8c38130000                   jl         0x7f77a7e82538
00e80 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00e85 4503d0                         add        r10d, r8d
00e88 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e8d 453bda                         cmp        r11d, r10d
00e90 0f8222130000                   jb         0x7f77a7e82538
00e96 453bde                         cmp        r11d, r14d
00e99 0f8219130000                   jb         0x7f77a7e82538
00e9f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00ea4 4585d2                         test       r10d, r10d
00ea7 744b                           je         0x7f77a7e81274
00ea9 4963d2                         movsxd     rdx, r10d
00eac 4883fa20                       cmp        rdx, 0x20
00eb0 7725                           ja         0x7f77a7e81257
00eb2 458bda                         mov        r11d, r10d
00eb5 4d63d3                         movsxd     r10, r11d
00eb8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ebf c442a8f5db                     bzhi       r11, r11, r10
00ec4 c4c1fb92fb                     kmovq      k7, r11
00ec9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ecf 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ed5 eb1d                           jmp        0x7f77a7e81274
00ed7 c5f877                         vzeroupper 
00eda 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00ee4 41ffd2                         call       r10
00ee7 0f1f840000000000               nop        dword ptr [rax + rax]
00eef eb03                           jmp        0x7f77a7e81274
00ef1 448bf3                         mov        r14d, ebx
00ef4 458bee                         mov        r13d, r14d
00ef7 e991f5ffff                     jmp        0x7f77a7e8080d
00efc 448bdd                         mov        r11d, ebp
00eff 4d63d3                         movsxd     r10, r11d
00f02 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f09 c442a8f5db                     bzhi       r11, r11, r10
00f0e c4c1fb92fb                     kmovq      k7, r11
00f13 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f19 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f1f 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00f27 4403dd                         add        r11d, ebp
00f2a 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f32 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00f36 418502                         test       dword ptr [r10], eax
00f39 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00f3e 7db4                           jge        0x7f77a7e81274
00f40 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00f48 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f50 442b9c2490000000               sub        r11d, dword ptr [rsp + 0x90]
00f58 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f60 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00f64 2bac2490000000                 sub        ebp, dword ptr [rsp + 0x90]
00f6b 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00f72 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00f7a 410f4fea                       cmovg      ebp, r10d
00f7e 4585db                         test       r11d, r11d
00f81 0f8c89100000                   jl         0x7f77a7e82390
00f87 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00f8f 4585d2                         test       r10d, r10d
00f92 0f8c78100000                   jl         0x7f77a7e82390
00f98 458d142b                       lea        r10d, [r11 + rbp]
00f9c 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00fa1 453bc2                         cmp        r8d, r10d
00fa4 0f8266100000                   jb         0x7f77a7e82390
00faa 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00fb2 4403ed                         add        r13d, ebp
00fb5 453bc5                         cmp        r8d, r13d
00fb8 0f8252100000                   jb         0x7f77a7e82390
00fbe 85ed                           test       ebp, ebp
00fc0 0f8c4a100000                   jl         0x7f77a7e82390
00fc6 85ed                           test       ebp, ebp
00fc8 0f8451ffffff                   je         0x7f77a7e8129f
00fce 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fd3 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00fd8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00fe0 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00fe5 4863d5                         movsxd     rdx, ebp
00fe8 4883fa20                       cmp        rdx, 0x20
00fec 0f860affffff                   jbe        0x7f77a7e8127c
00ff2 c5f877                         vzeroupper 
00ff5 49ba203f8ea7777f0000           movabs     r10, 0x7f77a78e3f20
00fff 41ffd2                         call       r10
01002 0f1f840000000000               nop        dword ptr [rax + rax]
0100a e910ffffff                     jmp        0x7f77a7e8129f
0100f 418bdd                         mov        ebx, r13d
01012 e925fdffff                     jmp        0x7f77a7e810bc
01017 bee4ffffff                     mov        esi, 0xffffffe4
0101c 488b2c24                       mov        rbp, qword ptr [rsp]
01020 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01025 4c891424                       mov        qword ptr [rsp], r10
01029 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0102e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01033 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01038 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0103d 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01042 6690                           nop        
01044 c5f877                         vzeroupper 
01047 e8942ab4ff                     call       0x7f77a79c3e60
0104c 0f1f84004411000b               nop        dword ptr [rax + rax + 0xb001144]
01054 bee4ffffff                     mov        esi, 0xffffffe4
01059 488b2c24                       mov        rbp, qword ptr [rsp]
0105d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01062 4c891424                       mov        qword ptr [rsp], r10
01066 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0106b 4489542408                     mov        dword ptr [rsp + 8], r10d
01070 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01075 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0107a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0107f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01084 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01089 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0108e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01093 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01098 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0109d 666690                         nop        
010a0 c5f877                         vzeroupper 
010a3 e8382ab4ff                     call       0x7f77a79c3e60
010a8 0f1f8400a011000c               nop        dword ptr [rax + rax + 0xc0011a0]
010b0 bee4ffffff                     mov        esi, 0xffffffe4
010b5 488b2c24                       mov        rbp, qword ptr [rsp]
010b9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
010be 4c891424                       mov        qword ptr [rsp], r10
010c2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010c7 44895c2408                     mov        dword ptr [rsp + 8], r11d
010cc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010d1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010e0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
010e5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
010ea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
010ef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010f4 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
010fc 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01101 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0110a 6690                           nop        
0110c c5f877                         vzeroupper 
0110f e8cc29b4ff                     call       0x7f77a79c3e60
01114 0f1f84000c12000d               nop        dword ptr [rax + rax + 0xd00120c]
0111c bee4ffffff                     mov        esi, 0xffffffe4
01121 488b2c24                       mov        rbp, qword ptr [rsp]
01125 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0112a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0112f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01134 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01139 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0113e 48894424f8                     mov        qword ptr [rsp - 8], rax
01143 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01147 89442470                       mov        dword ptr [rsp + 0x70], eax
0114b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01150 c5f877                         vzeroupper 
01153 e88829b4ff                     call       0x7f77a79c3e60
01158 0f1f84005012000e               nop        dword ptr [rax + rax + 0xe001250]
01160 bee4ffffff                     mov        esi, 0xffffffe4
01165 488b2c24                       mov        rbp, qword ptr [rsp]
01169 4c891c24                       mov        qword ptr [rsp], r11
0116d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01172 4489542408                     mov        dword ptr [rsp + 8], r10d
01177 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0117c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01181 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01186 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0118b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01190 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01195 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0119a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0119f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
011a4 48894424f8                     mov        qword ptr [rsp - 8], rax
011a9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
011ad 89442470                       mov        dword ptr [rsp + 0x70], eax
011b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b6 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
011bb 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
011c3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011c8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
011d1 666690                         nop        
011d4 c5f877                         vzeroupper 
011d7 e80429b4ff                     call       0x7f77a79c3e60
011dc 0f1f8400d412000f               nop        dword ptr [rax + rax + 0xf0012d4]
011e4 be45ffffff                     mov        esi, 0xffffff45
011e9 488b2c24                       mov        rbp, qword ptr [rsp]
011ed 4c895c2408                     mov        qword ptr [rsp + 8], r11
011f2 6690                           nop        
011f4 c5f877                         vzeroupper 
011f7 e8e428b4ff                     call       0x7f77a79c3e60
011fc 0f1f8400f4120010               nop        dword ptr [rax + rax + 0x100012f4]
01204 be45ffffff                     mov        esi, 0xffffff45
01209 488b2c24                       mov        rbp, qword ptr [rsp]
0120d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01212 4c891424                       mov        qword ptr [rsp], r10
01216 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0121b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01220 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01225 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0122a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0122f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01234 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01239 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0123e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01243 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01248 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0124d 48894424f8                     mov        qword ptr [rsp - 8], rax
01252 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01256 89442434                       mov        dword ptr [rsp + 0x34], eax
0125a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125f 48894424f8                     mov        qword ptr [rsp - 8], rax
01264 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01268 89442438                       mov        dword ptr [rsp + 0x38], eax
0126c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01271 48894424f8                     mov        qword ptr [rsp - 8], rax
01276 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0127a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0127e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01283 48ff742450                     push       qword ptr [rsp + 0x50]
01288 488f442448                     pop        qword ptr [rsp + 0x48]
0128d 48ff742458                     push       qword ptr [rsp + 0x58]
01292 488f442450                     pop        qword ptr [rsp + 0x50]
01297 48894424f8                     mov        qword ptr [rsp - 8], rax
0129c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
012a0 89442458                       mov        dword ptr [rsp + 0x58], eax
012a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a9 48894424f8                     mov        qword ptr [rsp - 8], rax
012ae 8b442464                       mov        eax, dword ptr [rsp + 0x64]
012b2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bb 48894424f8                     mov        qword ptr [rsp - 8], rax
012c0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
012c4 89442460                       mov        dword ptr [rsp + 0x60], eax
012c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cd 48894424f8                     mov        qword ptr [rsp - 8], rax
012d2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
012d6 89442464                       mov        dword ptr [rsp + 0x64], eax
012da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012df 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
012e3 90                             nop        
012e4 c5f877                         vzeroupper 
012e7 e8f427b4ff                     call       0x7f77a79c3e60
012ec 0f1f8400e4130011               nop        dword ptr [rax + rax + 0x110013e4]
012f4 4d3bd3                         cmp        r10, r11
012f7 bdffffffff                     mov        ebp, 0xffffffff
012fc 7c08                           jl         0x7f77a7e81686
012fe 400f95c5                       setne      bpl
01302 400fb6ed                       movzx      ebp, bpl
01306 be45ffffff                     mov        esi, 0xffffff45
0130b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01310 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01315 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0131a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0131f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01324 48894424f8                     mov        qword ptr [rsp - 8], rax
01329 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0132d 89442470                       mov        dword ptr [rsp + 0x70], eax
01331 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01336 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
0133b 90                             nop        
0133c c5f877                         vzeroupper 
0133f e89c27b4ff                     call       0x7f77a79c3e60
01344 0f1f84003c140012               nop        dword ptr [rax + rax + 0x1200143c]
0134c be45ffffff                     mov        esi, 0xffffff45
01351 488b2c24                       mov        rbp, qword ptr [rsp]
01355 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0135a 4c891424                       mov        qword ptr [rsp], r10
0135e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01363 44895c2408                     mov        dword ptr [rsp + 8], r11d
01368 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0136d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01372 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01377 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0137c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01381 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01386 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0138b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01390 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01395 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0139a 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0139f 48894424f8                     mov        qword ptr [rsp - 8], rax
013a4 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013a8 89442434                       mov        dword ptr [rsp + 0x34], eax
013ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b1 48894424f8                     mov        qword ptr [rsp - 8], rax
013b6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013ba 89442438                       mov        dword ptr [rsp + 0x38], eax
013be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c3 48894424f8                     mov        qword ptr [rsp - 8], rax
013c8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013cc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d5 48ff742450                     push       qword ptr [rsp + 0x50]
013da 488f442448                     pop        qword ptr [rsp + 0x48]
013df 48ff742458                     push       qword ptr [rsp + 0x58]
013e4 488f442450                     pop        qword ptr [rsp + 0x50]
013e9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ee 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013f2 89442458                       mov        dword ptr [rsp + 0x58], eax
013f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01400 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01404 89442460                       mov        dword ptr [rsp + 0x60], eax
01408 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140d 48894424f8                     mov        qword ptr [rsp - 8], rax
01412 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01416 89442468                       mov        dword ptr [rsp + 0x68], eax
0141a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141f 90                             nop        
01420 c5f877                         vzeroupper 
01423 e8b826b4ff                     call       0x7f77a79c3e60
01428 0f1f840020150013               nop        dword ptr [rax + rax + 0x13001520]
01430 be45ffffff                     mov        esi, 0xffffff45
01435 488b2c24                       mov        rbp, qword ptr [rsp]
01439 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0143e 4c891424                       mov        qword ptr [rsp], r10
01442 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01447 4489542408                     mov        dword ptr [rsp + 8], r10d
0144c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01451 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01456 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0145b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01460 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01465 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0146a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0146f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01474 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01479 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0147e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01483 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01488 48894424f8                     mov        qword ptr [rsp - 8], rax
0148d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01491 89442438                       mov        dword ptr [rsp + 0x38], eax
01495 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149a 48894424f8                     mov        qword ptr [rsp - 8], rax
0149f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014a3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ac 48ff742450                     push       qword ptr [rsp + 0x50]
014b1 488f442448                     pop        qword ptr [rsp + 0x48]
014b6 48ff742458                     push       qword ptr [rsp + 0x58]
014bb 488f442450                     pop        qword ptr [rsp + 0x50]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014c9 89442458                       mov        dword ptr [rsp + 0x58], eax
014cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d2 48894424f8                     mov        qword ptr [rsp - 8], rax
014d7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014db 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e4 48894424f8                     mov        qword ptr [rsp - 8], rax
014e9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014ed 89442460                       mov        dword ptr [rsp + 0x60], eax
014f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f6 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
014fb 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01500 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01505 666690                         nop        
01508 c5f877                         vzeroupper 
0150b e8d025b4ff                     call       0x7f77a79c3e60
01510 0f1f840008160014               nop        dword ptr [rax + rax + 0x14001608]
01518 4533d2                         xor        r10d, r10d
0151b 4c891424                       mov        qword ptr [rsp], r10
0151f e929ecffff                     jmp        0x7f77a7e804cd
01524 4533d2                         xor        r10d, r10d
01527 4c89542408                     mov        qword ptr [rsp + 8], r10
0152c e94aecffff                     jmp        0x7f77a7e804fb
01531 4533d2                         xor        r10d, r10d
01534 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01539 e96becffff                     jmp        0x7f77a7e80529
0153e 4533d2                         xor        r10d, r10d
01541 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01546 e98cecffff                     jmp        0x7f77a7e80557
0154b 4533d2                         xor        r10d, r10d
0154e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01553 e9adecffff                     jmp        0x7f77a7e80585
01558 4533d2                         xor        r10d, r10d
0155b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01560 e9cbecffff                     jmp        0x7f77a7e805b0
01565 bee4ffffff                     mov        esi, 0xffffffe4
0156a 488b2c24                       mov        rbp, qword ptr [rsp]
0156e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01573 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01578 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0157d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01582 48894424f8                     mov        qword ptr [rsp - 8], rax
01587 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0158b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0158f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01594 48894424f8                     mov        qword ptr [rsp - 8], rax
01599 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0159d 89442460                       mov        dword ptr [rsp + 0x60], eax
015a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a6 48894424f8                     mov        qword ptr [rsp - 8], rax
015ab 8b442468                       mov        eax, dword ptr [rsp + 0x68]
015af 89442464                       mov        dword ptr [rsp + 0x64], eax
015b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b8 48894424f8                     mov        qword ptr [rsp - 8], rax
015bd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
015c1 89442468                       mov        dword ptr [rsp + 0x68], eax
015c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ca 48894424f8                     mov        qword ptr [rsp - 8], rax
015cf 8b442478                       mov        eax, dword ptr [rsp + 0x78]
015d3 8944246c                       mov        dword ptr [rsp + 0x6c], eax
015d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015dc 895c2474                       mov        dword ptr [rsp + 0x74], ebx
015e0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
015e5 666690                         nop        
015e8 c5f877                         vzeroupper 
015eb e8f024b4ff                     call       0x7f77a79c3e60
015f0 0f1f8400e8160015               nop        dword ptr [rax + rax + 0x150016e8]
015f8 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01601 bee4ffffff                     mov        esi, 0xffffffe4
01606 488b2c24                       mov        rbp, qword ptr [rsp]
0160a 4c891424                       mov        qword ptr [rsp], r10
0160e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01613 4489542408                     mov        dword ptr [rsp + 8], r10d
01618 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0161d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01622 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01627 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0162c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01631 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01636 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0163b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01640 48894424f8                     mov        qword ptr [rsp - 8], rax
01645 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01649 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0165b 89442460                       mov        dword ptr [rsp + 0x60], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0166d 89442464                       mov        dword ptr [rsp + 0x64], eax
01671 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01676 48894424f8                     mov        qword ptr [rsp - 8], rax
0167b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0167f 89442468                       mov        dword ptr [rsp + 0x68], eax
01683 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01688 48894424f8                     mov        qword ptr [rsp - 8], rax
0168d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01691 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01695 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0169e 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
016a2 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
016aa 6690                           nop        
016ac c5f877                         vzeroupper 
016af e82c24b4ff                     call       0x7f77a79c3e60
016b4 0f1f8400ac170016               nop        dword ptr [rax + rax + 0x160017ac]
016bc bebeffffff                     mov        esi, 0xffffffbe
016c1 488b2c24                       mov        rbp, qword ptr [rsp]
016c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016ca 4c891424                       mov        qword ptr [rsp], r10
016ce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016d3 4489542408                     mov        dword ptr [rsp + 8], r10d
016d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
016dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016ec 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016f1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016f6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016fb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01700 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01705 48894424f8                     mov        qword ptr [rsp - 8], rax
0170a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0170e 89442434                       mov        dword ptr [rsp + 0x34], eax
01712 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01717 48894424f8                     mov        qword ptr [rsp - 8], rax
0171c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01720 89442438                       mov        dword ptr [rsp + 0x38], eax
01724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01729 48894424f8                     mov        qword ptr [rsp - 8], rax
0172e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01732 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01736 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173b 48ff742450                     push       qword ptr [rsp + 0x50]
01740 488f442448                     pop        qword ptr [rsp + 0x48]
01745 48ff742458                     push       qword ptr [rsp + 0x58]
0174a 488f442450                     pop        qword ptr [rsp + 0x50]
0174f 48894424f8                     mov        qword ptr [rsp - 8], rax
01754 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01758 89442458                       mov        dword ptr [rsp + 0x58], eax
0175c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01761 666690                         nop        
01764 c5f877                         vzeroupper 
01767 e87423b4ff                     call       0x7f77a79c3e60
0176c 0f1f840064180017               nop        dword ptr [rax + rax + 0x17001864]
01774 be85ffffff                     mov        esi, 0xffffff85
01779 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0177d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01782 44891c24                       mov        dword ptr [rsp], r11d
01786 44896c2404                     mov        dword ptr [rsp + 4], r13d
0178b 90                             nop        
0178c c5f877                         vzeroupper 
0178f e84c23b4ff                     call       0x7f77a79c3e60
01794 0f1f84008c180018               nop        dword ptr [rax + rax + 0x1800188c]
0179c 8be9                           mov        ebp, ecx
0179e 83c510                         add        ebp, 0x10
017a1 be6effffff                     mov        esi, 0xffffff6e
017a6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017ab 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017b0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
017b5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017ba 894c2438                       mov        dword ptr [rsp + 0x38], ecx
017be 48894424f8                     mov        qword ptr [rsp - 8], rax
017c3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017c7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
017cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d0 48894424f8                     mov        qword ptr [rsp - 8], rax
017d5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017d9 89442460                       mov        dword ptr [rsp + 0x60], eax
017dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e2 48894424f8                     mov        qword ptr [rsp - 8], rax
017e7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017eb 89442464                       mov        dword ptr [rsp + 0x64], eax
017ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f4 48894424f8                     mov        qword ptr [rsp - 8], rax
017f9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017fd 89442468                       mov        dword ptr [rsp + 0x68], eax
01801 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01806 48894424f8                     mov        qword ptr [rsp - 8], rax
0180b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0180f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01813 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01818 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0181c c5f877                         vzeroupper 
0181f e8bc22b4ff                     call       0x7f77a79c3e60
01824 0f1f84001c190019               nop        dword ptr [rax + rax + 0x1900191c]
0182c 8be9                           mov        ebp, ecx
0182e 83c510                         add        ebp, 0x10
01831 be66ffffff                     mov        esi, 0xffffff66
01836 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0183b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01840 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01845 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0184a 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0184e 48894424f8                     mov        qword ptr [rsp - 8], rax
01853 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01857 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0185b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01869 89442460                       mov        dword ptr [rsp + 0x60], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 48894424f8                     mov        qword ptr [rsp - 8], rax
01877 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0187b 89442464                       mov        dword ptr [rsp + 0x64], eax
0187f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01884 48894424f8                     mov        qword ptr [rsp - 8], rax
01889 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0188d 89442468                       mov        dword ptr [rsp + 0x68], eax
01891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01896 48894424f8                     mov        qword ptr [rsp - 8], rax
0189b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0189f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
018a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a8 895c2478                       mov        dword ptr [rsp + 0x78], ebx
018ac c5f877                         vzeroupper 
018af e82c22b4ff                     call       0x7f77a79c3e60
018b4 0f1f8400ac19001a               nop        dword ptr [rax + rax + 0x1a0019ac]
018bc bee4ffffff                     mov        esi, 0xffffffe4
018c1 488b2c24                       mov        rbp, qword ptr [rsp]
018c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018ca 4c891424                       mov        qword ptr [rsp], r10
018ce 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018d3 44895c2408                     mov        dword ptr [rsp + 8], r11d
018d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
018dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018ec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018f6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018fb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01900 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01905 48894424f8                     mov        qword ptr [rsp - 8], rax
0190a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0190e 89442434                       mov        dword ptr [rsp + 0x34], eax
01912 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01917 48894424f8                     mov        qword ptr [rsp - 8], rax
0191c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01920 89442438                       mov        dword ptr [rsp + 0x38], eax
01924 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01929 48894424f8                     mov        qword ptr [rsp - 8], rax
0192e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01932 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01936 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193b 48ff742450                     push       qword ptr [rsp + 0x50]
01940 488f442448                     pop        qword ptr [rsp + 0x48]
01945 48ff742458                     push       qword ptr [rsp + 0x58]
0194a 488f442450                     pop        qword ptr [rsp + 0x50]
0194f 48894424f8                     mov        qword ptr [rsp - 8], rax
01954 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01958 89442458                       mov        dword ptr [rsp + 0x58], eax
0195c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01961 48894424f8                     mov        qword ptr [rsp - 8], rax
01966 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0196a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0196e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01973 48894424f8                     mov        qword ptr [rsp - 8], rax
01978 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0197c 89442460                       mov        dword ptr [rsp + 0x60], eax
01980 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01985 48894424f8                     mov        qword ptr [rsp - 8], rax
0198a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0198e 89442464                       mov        dword ptr [rsp + 0x64], eax
01992 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01997 48894424f8                     mov        qword ptr [rsp - 8], rax
0199c 8b442478                       mov        eax, dword ptr [rsp + 0x78]
019a0 89442468                       mov        dword ptr [rsp + 0x68], eax
019a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a9 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
019b0 c5f877                         vzeroupper 
019b3 e82821b4ff                     call       0x7f77a79c3e60
019b8 0f1f8400b01a001b               nop        dword ptr [rax + rax + 0x1b001ab0]
019c0 bef6ffffff                     mov        esi, 0xfffffff6
019c5 666690                         nop        
019c8 c5f877                         vzeroupper 
019cb e81021b4ff                     call       0x7f77a79c3e60
019d0 0f1f8400c81a001c               nop        dword ptr [rax + rax + 0x1c001ac8]
019d8 bee4ffffff                     mov        esi, 0xffffffe4
019dd 488b2c24                       mov        rbp, qword ptr [rsp]
019e1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019e6 4c891424                       mov        qword ptr [rsp], r10
019ea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019ef 44895c2408                     mov        dword ptr [rsp + 8], r11d
019f4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a03 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a08 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a0d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a12 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a17 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a25 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2e 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a36 6690                           nop        
01a38 c5f877                         vzeroupper 
01a3b e8a020b4ff                     call       0x7f77a79c3e60
01a40 0f1f8400381b001d               nop        dword ptr [rax + rax + 0x1d001b38]
01a48 bee4ffffff                     mov        esi, 0xffffffe4
01a4d 488b2c24                       mov        rbp, qword ptr [rsp]
01a51 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a56 4c891424                       mov        qword ptr [rsp], r10
01a5a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a5f 4489542408                     mov        dword ptr [rsp + 8], r10d
01a64 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01a69 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a78 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a7d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a82 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a87 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a91 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a95 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9e 6690                           nop        
01aa0 c5f877                         vzeroupper 
01aa3 e83820b4ff                     call       0x7f77a79c3e60
01aa8 0f1f8400a01b001e               nop        dword ptr [rax + rax + 0x1e001ba0]
01ab0 be6effffff                     mov        esi, 0xffffff6e
01ab5 488b2c24                       mov        rbp, qword ptr [rsp]
01ab9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01abe 4c891424                       mov        qword ptr [rsp], r10
01ac2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ac7 4489542408                     mov        dword ptr [rsp + 8], r10d
01acc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ad1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ad6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01adb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ae0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ae5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01aea 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aef 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01af4 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01af9 48894424f8                     mov        qword ptr [rsp - 8], rax
01afe 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b02 89442434                       mov        dword ptr [rsp + 0x34], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b10 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b14 89442438                       mov        dword ptr [rsp + 0x38], eax
01b18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b22 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b26 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2f 48ff742450                     push       qword ptr [rsp + 0x50]
01b34 488f442448                     pop        qword ptr [rsp + 0x48]
01b39 48ff742458                     push       qword ptr [rsp + 0x58]
01b3e 488f442450                     pop        qword ptr [rsp + 0x50]
01b43 48894424f8                     mov        qword ptr [rsp - 8], rax
01b48 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b4c 89442458                       mov        dword ptr [rsp + 0x58], eax
01b50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b55 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b5e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b67 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b70 89442460                       mov        dword ptr [rsp + 0x60], eax
01b74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b79 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b82 89442464                       mov        dword ptr [rsp + 0x64], eax
01b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b90 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b94 89442468                       mov        dword ptr [rsp + 0x68], eax
01b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9d 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01ba2 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01ba6 6690                           nop        
01ba8 c5f877                         vzeroupper 
01bab e8301fb4ff                     call       0x7f77a79c3e60
01bb0 0f1f8400a81c001f               nop        dword ptr [rax + rax + 0x1f001ca8]
01bb8 458bd3                         mov        r10d, r11d
01bbb e91defffff                     jmp        0x7f77a7e80e5d
01bc0 bee4ffffff                     mov        esi, 0xffffffe4
01bc5 488b2c24                       mov        rbp, qword ptr [rsp]
01bc9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bce 4c891424                       mov        qword ptr [rsp], r10
01bd2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bd7 4489542408                     mov        dword ptr [rsp + 8], r10d
01bdc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01be1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01be6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01beb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bf0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bf5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01bfa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01bff 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c04 48894424f8                     mov        qword ptr [rsp - 8], rax
01c09 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c0d 89442474                       mov        dword ptr [rsp + 0x74], eax
01c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c16 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01c1e 6690                           nop        
01c20 c5f877                         vzeroupper 
01c23 e8b81eb4ff                     call       0x7f77a79c3e60
01c28 0f1f8400201d0020               nop        dword ptr [rax + rax + 0x20001d20]
01c30 bee4ffffff                     mov        esi, 0xffffffe4
01c35 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c3a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c3f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c44 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c49 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c4e 6690                           nop        
01c50 c5f877                         vzeroupper 
01c53 e8881eb4ff                     call       0x7f77a79c3e60
01c58 0f1f8400501d0021               nop        dword ptr [rax + rax + 0x21001d50]
01c60 418d6801                       lea        ebp, [r8 + 1]
01c64 bee4ffffff                     mov        esi, 0xffffffe4
01c69 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c6e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c73 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c78 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c7d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c82 6690                           nop        
01c84 c5f877                         vzeroupper 
01c87 e8541eb4ff                     call       0x7f77a79c3e60
01c8c 0f1f8400841d0022               nop        dword ptr [rax + rax + 0x22001d84]
01c94 bee4ffffff                     mov        esi, 0xffffffe4
01c99 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c9e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ca3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ca8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cad 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01cb2 6690                           nop        
01cb4 c5f877                         vzeroupper 
01cb7 e8241eb4ff                     call       0x7f77a79c3e60
01cbc 0f1f8400b41d0023               nop        dword ptr [rax + rax + 0x23001db4]
01cc4 bee4ffffff                     mov        esi, 0xffffffe4
01cc9 488b2c24                       mov        rbp, qword ptr [rsp]
01ccd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cd2 4c891424                       mov        qword ptr [rsp], r10
01cd6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cdb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ce0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ce5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cea 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cf4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cf9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cfe 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d03 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01d08 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d11 89442470                       mov        dword ptr [rsp + 0x70], eax
01d15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1a 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01d1f 90                             nop        
01d20 c5f877                         vzeroupper 
01d23 e8b81db4ff                     call       0x7f77a79c3e60
01d28 0f1f8400201e0024               nop        dword ptr [rax + rax + 0x24001e20]
01d30 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01d38 4183c208                       add        r10d, 8
01d3c 458bca                         mov        r9d, r10d
01d3f be45ffffff                     mov        esi, 0xffffff45
01d44 488b2c24                       mov        rbp, qword ptr [rsp]
01d48 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d4d 4c891424                       mov        qword ptr [rsp], r10
01d51 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d56 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d5b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d60 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d65 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d6a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d6f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d74 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d79 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d7e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d83 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d88 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d8d 48ff742440                     push       qword ptr [rsp + 0x40]
01d92 488f442438                     pop        qword ptr [rsp + 0x38]
01d97 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d9c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01da1 48ff742450                     push       qword ptr [rsp + 0x50]
01da6 488f442448                     pop        qword ptr [rsp + 0x48]
01dab 48ff742458                     push       qword ptr [rsp + 0x58]
01db0 488f442450                     pop        qword ptr [rsp + 0x50]
01db5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01dba 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01dbf 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01dc4 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01dc9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01dce 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01dd3 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01ddb 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
01de0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01de5 666690                         nop        
01de8 c5f877                         vzeroupper 
01deb e8f01cb4ff                     call       0x7f77a79c3e60
01df0 0f1f8400e81e0025               nop        dword ptr [rax + rax + 0x25001ee8]
01df8 be45ffffff                     mov        esi, 0xffffff45
01dfd 488b2c24                       mov        rbp, qword ptr [rsp]
01e01 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e06 4c891424                       mov        qword ptr [rsp], r10
01e0a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e0f 4489542408                     mov        dword ptr [rsp + 8], r10d
01e14 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e19 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e1e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e23 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e28 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e2d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e32 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e37 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e3c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e41 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e46 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e4f 89442438                       mov        dword ptr [rsp + 0x38], eax
01e53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e58 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e61 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6a 48ff742450                     push       qword ptr [rsp + 0x50]
01e6f 488f442448                     pop        qword ptr [rsp + 0x48]
01e74 48ff742458                     push       qword ptr [rsp + 0x58]
01e79 488f442450                     pop        qword ptr [rsp + 0x50]
01e7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e83 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e87 89442458                       mov        dword ptr [rsp + 0x58], eax
01e8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e90 48894424f8                     mov        qword ptr [rsp - 8], rax
01e95 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e99 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01eab 89442460                       mov        dword ptr [rsp + 0x60], eax
01eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb4 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01eb9 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01ebe 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01ec3 90                             nop        
01ec4 c5f877                         vzeroupper 
01ec7 e8141cb4ff                     call       0x7f77a79c3e60
01ecc 0f1f8400c41f0026               nop        dword ptr [rax + rax + 0x26001fc4]
01ed4 beccffffff                     mov        esi, 0xffffffcc
01ed9 488b2c24                       mov        rbp, qword ptr [rsp]
01edd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ee2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ee7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01eec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01efa 89442470                       mov        dword ptr [rsp + 0x70], eax
01efe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f03 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01f08 c5f877                         vzeroupper 
01f0b e8d01bb4ff                     call       0x7f77a79c3e60
01f10 0f1f840008200027               nop        dword ptr [rax + rax + 0x27002008]
01f18 be45ffffff                     mov        esi, 0xffffff45
01f1d 488b2c24                       mov        rbp, qword ptr [rsp]
01f21 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f26 4c891424                       mov        qword ptr [rsp], r10
01f2a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f2f 4489542408                     mov        dword ptr [rsp + 8], r10d
01f34 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f39 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f48 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f4d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f52 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f57 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f5c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f61 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f66 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f6f 89442438                       mov        dword ptr [rsp + 0x38], eax
01f73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f78 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f81 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48ff742450                     push       qword ptr [rsp + 0x50]
01f8f 488f442448                     pop        qword ptr [rsp + 0x48]
01f94 48ff742458                     push       qword ptr [rsp + 0x58]
01f99 488f442450                     pop        qword ptr [rsp + 0x50]
01f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fa7 89442458                       mov        dword ptr [rsp + 0x58], eax
01fab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fb9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fcb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01fd9 666690                         nop        
01fdc c5f877                         vzeroupper 
01fdf e8fc1ab4ff                     call       0x7f77a79c3e60
01fe4 0f1f8400dc200028               nop        dword ptr [rax + rax + 0x280020dc]
01fec beccffffff                     mov        esi, 0xffffffcc
01ff1 488b2c24                       mov        rbp, qword ptr [rsp]
01ff5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01ffa 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01fff 90                             nop        
02000 c5f877                         vzeroupper 
02003 e8d81ab4ff                     call       0x7f77a79c3e60
02008 0f1f840000210029               nop        dword ptr [rax + rax + 0x29002100]
02010 beccffffff                     mov        esi, 0xffffffcc
02015 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0201a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0201f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02024 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02029 48894424f8                     mov        qword ptr [rsp - 8], rax
0202e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02032 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203b 48894424f8                     mov        qword ptr [rsp - 8], rax
02040 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02044 89442460                       mov        dword ptr [rsp + 0x60], eax
02048 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204d 48894424f8                     mov        qword ptr [rsp - 8], rax
02052 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02056 89442464                       mov        dword ptr [rsp + 0x64], eax
0205a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205f 48894424f8                     mov        qword ptr [rsp - 8], rax
02064 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02068 89442468                       mov        dword ptr [rsp + 0x68], eax
0206c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02071 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02075 666690                         nop        
02078 c5f877                         vzeroupper 
0207b e8601ab4ff                     call       0x7f77a79c3e60
02080 0f1f84007821002a               nop        dword ptr [rax + rax + 0x2a002178]
02088 beccffffff                     mov        esi, 0xffffffcc
0208d 488b2c24                       mov        rbp, qword ptr [rsp]
02091 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02096 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0209b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
020a0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020a5 48894424f8                     mov        qword ptr [rsp - 8], rax
020aa 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020ae 8944244c                       mov        dword ptr [rsp + 0x4c], eax
020b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b7 48894424f8                     mov        qword ptr [rsp - 8], rax
020bc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020c0 89442460                       mov        dword ptr [rsp + 0x60], eax
020c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c9 48894424f8                     mov        qword ptr [rsp - 8], rax
020ce 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020d2 89442464                       mov        dword ptr [rsp + 0x64], eax
020d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020db 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
020e3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
020eb 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
020f3 90                             nop        
020f4 c5f877                         vzeroupper 
020f7 e8e419b4ff                     call       0x7f77a79c3e60
020fc 0f1f8400f421002b               nop        dword ptr [rax + rax + 0x2b0021f4]
02104 beccffffff                     mov        esi, 0xffffffcc
02109 488b2c24                       mov        rbp, qword ptr [rsp]
0210d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02112 4c891424                       mov        qword ptr [rsp], r10
02116 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0211b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02120 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02125 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0212a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0212f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02134 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02139 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0213e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02143 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02148 48894424f8                     mov        qword ptr [rsp - 8], rax
0214d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02151 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02155 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215a 48894424f8                     mov        qword ptr [rsp - 8], rax
0215f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02163 89442460                       mov        dword ptr [rsp + 0x60], eax
02167 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216c 48894424f8                     mov        qword ptr [rsp - 8], rax
02171 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02175 89442464                       mov        dword ptr [rsp + 0x64], eax
02179 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217e 48894424f8                     mov        qword ptr [rsp - 8], rax
02183 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02187 89442468                       mov        dword ptr [rsp + 0x68], eax
0218b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02190 48894424f8                     mov        qword ptr [rsp - 8], rax
02195 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02199 89442470                       mov        dword ptr [rsp + 0x70], eax
0219d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a2 895c2474                       mov        dword ptr [rsp + 0x74], ebx
021a6 6690                           nop        
021a8 c5f877                         vzeroupper 
021ab e83019b4ff                     call       0x7f77a79c3e60
021b0 0f1f8400a822002c               nop        dword ptr [rax + rax + 0x2c0022a8]
021b8 beccffffff                     mov        esi, 0xffffffcc
021bd 488b2c24                       mov        rbp, qword ptr [rsp]
021c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021c6 4c891424                       mov        qword ptr [rsp], r10
021ca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
021cf 44895c2408                     mov        dword ptr [rsp + 8], r11d
021d4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021d9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021de 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021e3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021e8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021ed 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021f2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021f7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02201 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02205 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220e 48894424f8                     mov        qword ptr [rsp - 8], rax
02213 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02217 89442460                       mov        dword ptr [rsp + 0x60], eax
0221b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02220 48894424f8                     mov        qword ptr [rsp - 8], rax
02225 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02229 89442464                       mov        dword ptr [rsp + 0x64], eax
0222d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0223b 89442468                       mov        dword ptr [rsp + 0x68], eax
0223f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02244 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02248 c5f877                         vzeroupper 
0224b e89018b4ff                     call       0x7f77a79c3e60
02250 0f1f84004823002d               nop        dword ptr [rax + rax + 0x2d002348]
02258 eb0a                           jmp        0x7f77a7e825e4
0225a eb08                           jmp        0x7f77a7e825e4
0225c eb06                           jmp        0x7f77a7e825e4
0225e eb04                           jmp        0x7f77a7e825e4
02260 eb02                           jmp        0x7f77a7e825e4
02262 eb00                           jmp        0x7f77a7e825e4
02264 488bf0                         mov        rsi, rax
02267 e930e5ffff                     jmp        0x7f77a7e80b1c
0226c bef6ffffff                     mov        esi, 0xfffffff6
02271 666690                         nop        
02274 c5f877                         vzeroupper 
02277 e86418b4ff                     call       0x7f77a79c3e60
0227c 0f1f84007423002e               nop        dword ptr [rax + rax + 0x2e002374]
02284 49ba1810e8a7777f0000           movabs     r10, 0x7f77a7e81018
0228e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02295 e9c6a8a7ff                     jmp        0x7f77a78fcee0
0229a e88174a6ff                     call       0x7f77a78e9aa0
0229f e98addffff                     jmp        0x7f77a7e803ae
022a4 f4                             hlt        
022a5 f4                             hlt        
022a6 f4                             hlt        
022a7 f4                             hlt        
