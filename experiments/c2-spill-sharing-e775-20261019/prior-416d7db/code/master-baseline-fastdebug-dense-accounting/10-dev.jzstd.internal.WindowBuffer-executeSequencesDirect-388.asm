00000 e8fba35918                     call       0x7f3dd0173c80
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
0000f 90                             nop        
00010 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85142b0000                   jne        0x7f3db7bdc3c2
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
0009a 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
000a1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000a6 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
000ad 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
000b4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000b9 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000c0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000ed 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000f2 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49bab06333d03d7f0000           movabs     r10, 0x7f3dd03363b0
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f8438190000                   je         0x7f3db7bdb2e8
00130 458b12                         mov        r10d, dword ptr [r10]
00133 41c1ea0d                       shr        r10d, 0xd
00137 4181fa15040000                 cmp        r10d, 0x415
0013e 0f85041d0000                   jne        0x7f3db7bdb6c8
00144 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00149 4c891424                       mov        qword ptr [rsp], r10
0014d 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00155 4885ed                         test       rbp, rbp
00158 0f8416190000                   je         0x7f3db7bdb2f4
0015e 448b5d00                       mov        r11d, dword ptr [rbp]
00162 41c1eb0d                       shr        r11d, 0xd
00166 4181fb05010000                 cmp        r11d, 0x105
0016d 0f85d51c0000                   jne        0x7f3db7bdb6c8
00173 4c8bd5                         mov        r10, rbp
00176 4c89542408                     mov        qword ptr [rsp + 8], r10
0017b 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
00183 4885ed                         test       rbp, rbp
00186 0f84f5180000                   je         0x7f3db7bdb301
0018c 448b5500                       mov        r10d, dword ptr [rbp]
00190 41c1ea0d                       shr        r10d, 0xd
00194 4181fa08010000                 cmp        r10d, 0x108
0019b 0f85a71c0000                   jne        0x7f3db7bdb6c8
001a1 4c8bd5                         mov        r10, rbp
001a4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001b1 4885ed                         test       rbp, rbp
001b4 0f84d4180000                   je         0x7f3db7bdb30e
001ba 448b5d00                       mov        r11d, dword ptr [rbp]
001be 41c1eb0d                       shr        r11d, 0xd
001c2 4181fb07010000                 cmp        r11d, 0x107
001c9 0f85791c0000                   jne        0x7f3db7bdb6c8
001cf 4c8bd5                         mov        r10, rbp
001d2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d7 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001df 4885ed                         test       rbp, rbp
001e2 0f84b3180000                   je         0x7f3db7bdb31b
001e8 448b5d00                       mov        r11d, dword ptr [rbp]
001ec 41c1eb0d                       shr        r11d, 0xd
001f0 4181fb07010000                 cmp        r11d, 0x107
001f7 0f854b1c0000                   jne        0x7f3db7bdb6c8
001fd 4c8bd5                         mov        r10, rbp
00200 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00205 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
0020d 4885ed                         test       rbp, rbp
00210 0f8492180000                   je         0x7f3db7bdb328
00216 448b5d00                       mov        r11d, dword ptr [rbp]
0021a 41c1eb0d                       shr        r11d, 0xd
0021e 4181fb05010000                 cmp        r11d, 0x105
00225 0f851d1c0000                   jne        0x7f3db7bdb6c8
0022b 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
00230 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00235 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00239 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0023e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00243 4585db                         test       r11d, r11d
00246 0f84301b0000                   je         0x7f3db7bdb5fc
0024c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00251 458b5204                       mov        r10d, dword ptr [r10 + 4]
00255 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0025a 4585d2                         test       r10d, r10d
0025d 0f86191b0000                   jbe        0x7f3db7bdb5fc
00263 4183fa01                       cmp        r10d, 1
00267 0f860f1b0000                   jbe        0x7f3db7bdb5fc
0026d 4183fa02                       cmp        r10d, 2
00271 0f86051b0000                   jbe        0x7f3db7bdb5fc
00277 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0027c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00280 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00285 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0028a 458b5204                       mov        r10d, dword ptr [r10 + 4]
0028e 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00296 458d53f1                       lea        r10d, [r11 - 0xf]
0029a 4585d2                         test       r10d, r10d
0029d 0f8cd91a0000                   jl         0x7f3db7bdb5fc
002a3 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002ab 4183c3f1                       add        r11d, -0xf
002af 4585db                         test       r11d, r11d
002b2 0f8cc41a0000                   jl         0x7f3db7bdb5fc
002b8 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002c0 4183c2f9                       add        r10d, -7
002c4 4585d2                         test       r10d, r10d
002c7 0f8caf1a0000                   jl         0x7f3db7bdb5fc
002cd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002d2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002da 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002e2 4d63d3                         movsxd     r10, r11d
002e5 4183c3f1                       add        r11d, -0xf
002e9 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002f1 4983c2f1                       add        r10, -0xf
002f5 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
002fd 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
00305 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0030d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00315 4183c3f1                       add        r11d, -0xf
00319 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00321 4983c2f1                       add        r10, -0xf
00325 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0032d e9e6010000                     jmp        0x7f3db7bd9d98
00332 4533d2                         xor        r10d, r10d
00335 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0033a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0033f 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00343 448bd8                         mov        r11d, eax
00346 4183fb03                       cmp        r11d, 3
0034a 0f8ef0030000                   jle        0x7f3db7bd9fc0
00350 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00355 45895310                       mov        dword ptr [r11 + 0x10], r10d
00359 458b5308                       mov        r10d, dword ptr [r11 + 8]
0035d 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00361 448d50fd                       lea        r10d, [rax - 3]
00365 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0036d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00372 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0037a 45895a08                       mov        dword ptr [r10 + 8], r11d
0037e 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00386 4d63c5                         movsxd     r8, r13d
00389 4c03442440                     add        r8, qword ptr [rsp + 0x40]
0038e 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
00393 4d8bcb                         mov        r9, r11
00396 4d03c3                         add        r8, r11
00399 4d3bd0                         cmp        r10, r8
0039c 0f8f76140000                   jg         0x7f3db7bdb098
003a2 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
003aa 4585d2                         test       r10d, r10d
003ad 0f8e2d130000                   jle        0x7f3db7bdaf60
003b3 418bdd                         mov        ebx, r13d
003b6 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
003ba 48636c2478                     movsxd     rbp, dword ptr [rsp + 0x78]
003bf 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
003c4 4403db                         add        r11d, ebx
003c7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
003cc 440344246c                     add        r8d, dword ptr [rsp + 0x6c]
003d1 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
003d9 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
003de 0f8f220d0000                   jg         0x7f3db7bda986
003e4 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
003e9 0f8f95140000                   jg         0x7f3db7bdb104
003ef 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003f4 4183fb10                       cmp        r11d, 0x10
003f8 0f8fea010000                   jg         0x7f3db7bd9e68
003fe 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00403 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0040b 0f83ef110000                   jae        0x7f3db7bdae80
00411 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00416 458bca                         mov        r9d, r10d
00419 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0041e c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00425 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
0042d 0f8325120000                   jae        0x7f3db7bdaed8
00433 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00438 4503d1                         add        r10d, r9d
0043b 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00443 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00448 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
0044f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00454 4503dd                         add        r11d, r13d
00457 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0045f 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00467 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
0046f 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00477 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0047c 4183fa10                       cmp        r10d, 0x10
00480 0f8ff6140000                   jg         0x7f3db7bdb1fc
00486 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0048e 4183fb10                       cmp        r11d, 0x10
00492 0f8c84030000                   jl         0x7f3db7bda09c
00498 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
004a0 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
004a8 0f8372100000                   jae        0x7f3db7bdada0
004ae 458bda                         mov        r11d, r10d
004b1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004b6 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
004bd 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
004c5 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
004cd 0f83b5100000                   jae        0x7f3db7bdae08
004d3 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
004db 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004e0 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
004e7 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
004ec 4503ea                         add        r13d, r10d
004ef 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004f3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004f8 41ffc3                         inc        r11d
004fb 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00500 418502                         test       dword ptr [r10], eax
00503 48894424f8                     mov        qword ptr [rsp - 8], rax
00508 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0050f 89442438                       mov        dword ptr [rsp + 0x38], eax
00513 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00518 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0051d 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00522 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00527 442b442438                     sub        r8d, dword ptr [rsp + 0x38]
0052c 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00531 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00536 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
0053b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00540 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00545 0f8d040b0000                   jge        0x7f3db7bda8cf
0054b 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00550 0f837b0f0000                   jae        0x7f3db7bdad51
00556 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0055b 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
00560 4d8bda                         mov        r11, r10
00563 49c1eb12                       shr        r11, 0x12
00567 458bdb                         mov        r11d, r11d
0056a 4181e3ffff0300                 and        r11d, 0x3ffff
00571 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00576 4d8bda                         mov        r11, r10
00579 49c1fb24                       sar        r11, 0x24
0057d 458bd2                         mov        r10d, r10d
00580 458bdb                         mov        r11d, r11d
00583 418bc3                         mov        eax, r11d
00586 4181e2ffff0100                 and        r10d, 0x1ffff
0058d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00592 4585db                         test       r11d, r11d
00595 0f8c79110000                   jl         0x7f3db7bdaf94
0059b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
005a0 4585db                         test       r11d, r11d
005a3 0f8489fdffff                   je         0x7f3db7bd9bb2
005a9 458bd3                         mov        r10d, r11d
005ac 453bd0                         cmp        r10d, r8d
005af 0f8e85fdffff                   jle        0x7f3db7bd9bba
005b5 be45ffffff                     mov        esi, 0xffffff45
005ba 418bea                         mov        ebp, r10d
005bd 44890424                       mov        dword ptr [rsp], r8d
005c1 90                             nop        
005c2 90                             nop        
005c3 90                             nop        
005c4 c5f877                         vzeroupper 
005c7 e8143cafff                     call       0x7f3db76cda60
005cc 0f1f8400c4060001               nop        dword ptr [rax + rax + 0x10006c4]
005d4 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
005de 4883e4f0                       and        rsp, 0xfffffffffffffff0
005e2 e8f9c63618                     call       0x7f3dcff46560
005e7 f4                             hlt        
005e8 4183fb30                       cmp        r11d, 0x30
005ec 0f8f38080000                   jg         0x7f3db7bda6aa
005f2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005f7 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
005ff 0f83b0140000                   jae        0x7f3db7bdb335
00605 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0060a 418bcb                         mov        ecx, r11d
0060d 4d63c3                         movsxd     r8, r11d
00610 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00615 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
0061c 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
00624 0f8332150000                   jae        0x7f3db7bdb3dc
0062a 458d5510                       lea        r10d, [r13 + 0x10]
0062e 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00636 4d63d5                         movsxd     r10, r13d
00639 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0063e c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00645 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0064d 443bdb                         cmp        r11d, ebx
00650 0f8dce000000                   jge        0x7f3db7bd9fa4
00656 4d2bc2                         sub        r8, r10
00659 4d63db                         movsxd     r11, r11d
0065c 4f8d1403                       lea        r10, [r11 + r8]
00660 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00668 0f83c6150000                   jae        0x7f3db7bdb4b4
0066e 4c63d3                         movsxd     r10, ebx
00671 4d2bd3                         sub        r10, r11
00674 4983c20f                       add        r10, 0xf
00678 4983e2f0                       and        r10, 0xfffffffffffffff0
0067c 458bd2                         mov        r10d, r10d
0067f 478d5c2a10                     lea        r11d, [r10 + r13 + 0x10]
00684 4d63d3                         movsxd     r10, r11d
00687 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
0068c 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00694 0f839a150000                   jae        0x7f3db7bdb4b4
0069a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006a2 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
006aa 0f8384150000                   jae        0x7f3db7bdb4b4
006b0 4983c2f0                       add        r10, -0x10
006b4 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
006bc 0f8372150000                   jae        0x7f3db7bdb4b4
006c2 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
006c8 0f8f0a160000                   jg         0x7f3db7bdb558
006ce 448bd1                         mov        r10d, ecx
006d1 452bd5                         sub        r10d, r13d
006d4 90                             nop        
006d5 90                             nop        
006d6 90                             nop        
006d7 90                             nop        
006d8 90                             nop        
006d9 90                             nop        
006da 90                             nop        
006db 90                             nop        
006dc 90                             nop        
006dd 90                             nop        
006de 90                             nop        
006df 90                             nop        
006e0 458bc2                         mov        r8d, r10d
006e3 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
006eb 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006f0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
006f7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006ff 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00704 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0070b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00713 4183c310                       add        r11d, 0x10
00717 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0071f 443bdb                         cmp        r11d, ebx
00722 7cbc                           jl         0x7f3db7bd9f60
00724 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00729 4403d1                         add        r10d, ecx
0072c 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00734 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0073b e91ffdffff                     jmp        0x7f3db7bd9cdf
00740 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00745 4585c0                         test       r8d, r8d
00748 7406                           je         0x7f3db7bd9fd0
0074a 41ffcb                         dec        r11d
0074d 418bc3                         mov        eax, r11d
00750 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00755 418b4b08                       mov        ecx, dword ptr [r11 + 8]
00759 85c0                           test       eax, eax
0075b 7478                           je         0x7f3db7bda055
0075d 83f803                         cmp        eax, 3
00760 0f84d30b0000                   je         0x7f3db7bdabb9
00766 83f802                         cmp        eax, 2
00769 7776                           ja         0x7f3db7bda061
0076b 3b44244c                       cmp        eax, dword ptr [rsp + 0x4c]
0076f 0f830f170000                   jae        0x7f3db7bdb704
00775 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0077a 418b4c8308                     mov        ecx, dword ptr [r11 + rax*4 + 8]
0077f 85c0                           test       eax, eax
00781 7e49                           jle        0x7f3db7bda04c
00783 448d58ff                       lea        r11d, [rax - 1]
00787 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0078c 0f830e1a0000                   jae        0x7f3db7bdba20
00792 4c63c8                         movsxd     r9, eax
00795 33db                           xor        ebx, ebx
00797 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0079c 458bda                         mov        r11d, r10d
0079f 4183c3cc                       add        r11d, -0x34
007a3 41c1eb02                       shr        r11d, 2
007a7 458d5403ff                     lea        r10d, [r11 + rax - 1]
007ac 41b804000000                   mov        r8d, 4
007b2 c442b8f5d2                     bzhi       r10, r10, r8
007b7 4d2bca                         sub        r9, r10
007ba 49ffc9                         dec        r9
007bd 4d85c9                         test       r9, r9
007c0 4c0f4ccb                       cmovl      r9, rbx
007c4 458bc9                         mov        r9d, r9d
007c7 e9cf060000                     jmp        0x7f3db7bda71b
007cc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
007d1 41894a08                       mov        dword ptr [r10 + 8], ecx
007d5 898c24a4000000                 mov        dword ptr [rsp + 0xa4], ecx
007dc e99dfbffff                     jmp        0x7f3db7bd9bfe
007e1 48beb82574e200000000           movabs     rsi, 0xe27425b8
007eb 418bed                         mov        ebp, r13d
007ee 90                             nop        
007ef 90                             nop        
007f0 c5f877                         vzeroupper 
007f3 e8e85bb5ff                     call       0x7f3db772fc60
007f8 0f1f8400f0080002               nop        dword ptr [rax + rax + 0x20008f0]
00800 4885c0                         test       rax, rax
00803 0f8493170000                   je         0x7f3db7bdb81c
00809 488bf0                         mov        rsi, rax
0080c c5f877                         vzeroupper 
0080f 4881c4f0000000                 add        rsp, 0xf0
00816 5d                             pop        rbp
00817 e9c4f2aeff                     jmp        0x7f3db76c9360
0081c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00824 4503da                         add        r11d, r10d
00827 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0082f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00837 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0083c 0f8dee020000                   jge        0x7f3db7bda3b0
00842 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0084a 4183c208                       add        r10d, 8
0084e 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00853 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0085b 4183fb08                       cmp        r11d, 8
0085f 0f8db0010000                   jge        0x7f3db7bda295
00865 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0086d 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
00875 0f83d51c0000                   jae        0x7f3db7bdbdd0
0087b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00880 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00888 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
0088e 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00896 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0089e 0f837c1d0000                   jae        0x7f3db7bdbea0
008a4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008a9 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
008b1 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
008b6 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
008be 4183c203                       add        r10d, 3
008c2 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
008ca 41ffc3                         inc        r11d
008cd 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
008d5 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
008dd 0f83b11d0000                   jae        0x7f3db7bdbf14
008e3 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008eb 4183c203                       add        r10d, 3
008ef 4c639c24b4000000               movsxd     r11, dword ptr [rsp + 0xb4]
008f7 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008fc 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
00902 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0090a 0f83081e0000                   jae        0x7f3db7bdbf98
00910 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
00918 43886c1009                     mov        byte ptr [r8 + r10 + 9], bpl
0091d 470fbe4c180a                   movsx      r9d, byte ptr [r8 + r11 + 0xa]
00923 47884c100a                     mov        byte ptr [r8 + r10 + 0xa], r9b
00928 470fbe5c180b                   movsx      r11d, byte ptr [r8 + r11 + 0xb]
0092e 47885c100b                     mov        byte ptr [r8 + r10 + 0xb], r11b
00933 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0093b 4183fb08                       cmp        r11d, 8
0093f 0f83471e0000                   jae        0x7f3db7bdc00c
00945 49baf85e72e200000000           movabs     r10, 0xe2725ef8
0094f 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
00957 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
0095c 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00961 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00966 4183fa04                       cmp        r10d, 4
0096a 7e40                           jle        0x7f3db7bda22c
0096c 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00973 83c504                         add        ebp, 4
00976 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0097b 418bd1                         mov        edx, r9d
0097e 90                             nop        
0097f 90                             nop        
00980 c5f877                         vzeroupper 
00983 e8585ab5ff                     call       0x7f3db772fc60
00988 0f1f8400800a0003               nop        dword ptr [rax + rax + 0x3000a80]
00990 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00995 8bd5                           mov        edx, ebp
00997 8bc8                           mov        ecx, eax
00999 90                             nop        
0099a 90                             nop        
0099b 90                             nop        
0099c c5f877                         vzeroupper 
0099f e83c5ab5ff                     call       0x7f3db772fc60
009a4 0f1f84009c0a0004               nop        dword ptr [rax + rax + 0x4000a9c]
009ac 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
009b1 4183fa08                       cmp        r10d, 8
009b5 7e51                           jle        0x7f3db7bda288
009b7 49ba205f72e200000000           movabs     r10, 0xe2725f20
009c1 8b542414                       mov        edx, dword ptr [rsp + 0x14]
009c5 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
009cd 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
009d2 83c208                         add        edx, 8
009d5 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009da 90                             nop        
009db 90                             nop        
009dc c5f877                         vzeroupper 
009df e8fc59b5ff                     call       0x7f3db772fc60
009e4 0f1f8400dc0a0005               nop        dword ptr [rax + rax + 0x5000adc]
009ec 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009f1 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
009f5 488bc8                         mov        rcx, rax
009f8 c5f877                         vzeroupper 
009fb e8e059b5ff                     call       0x7f3db772fc60
00a00 0f1f8400f80a0006               nop        dword ptr [rax + rax + 0x6000af8]
00a08 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
00a10 e9dafaffff                     jmp        0x7f3db7bd9d6f
00a15 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00a1a 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
00a21 90                             nop        
00a22 90                             nop        
00a23 90                             nop        
00a24 c5f877                         vzeroupper 
00a27 e8b459b5ff                     call       0x7f3db772fc60
00a2c 0f1f8400240b0007               nop        dword ptr [rax + rax + 0x7000b24]
00a34 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00a39 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00a40 488bc8                         mov        rcx, rax
00a43 90                             nop        
00a44 c5f877                         vzeroupper 
00a47 e89459b5ff                     call       0x7f3db772fc60
00a4c 0f1f8400440b0008               nop        dword ptr [rax + rax + 0x8000b44]
00a54 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a5c 4183c208                       add        r10d, 8
00a60 458bca                         mov        r9d, r10d
00a63 be95ffffff                     mov        esi, 0xffffff95
00a68 488b2c24                       mov        rbp, qword ptr [rsp]
00a6c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00a71 4c891424                       mov        qword ptr [rsp], r10
00a75 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a7a 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a7f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a84 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a89 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a8e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a93 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a98 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a9d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00aa2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00aa7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00aac 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00ab1 48ff742440                     push       qword ptr [rsp + 0x40]
00ab6 488f442438                     pop        qword ptr [rsp + 0x38]
00abb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ac0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ac5 48ff742450                     push       qword ptr [rsp + 0x50]
00aca 488f442448                     pop        qword ptr [rsp + 0x48]
00acf 48ff742458                     push       qword ptr [rsp + 0x58]
00ad4 488f442450                     pop        qword ptr [rsp + 0x50]
00ad9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ade 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00ae3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ae8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00aed 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00af2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00af7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00aff 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00b04 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00b09 90                             nop        
00b0a 90                             nop        
00b0b 90                             nop        
00b0c c5f877                         vzeroupper 
00b0f e8cc36afff                     call       0x7f3db76cda60
00b14 0f1f84000c0c0009               nop        dword ptr [rax + rax + 0x9000c0c]
00b1c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
00b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b2a e8b1c13618                     call       0x7f3dcff46560
00b2f f4                             hlt        
00b30 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b35 4183fb30                       cmp        r11d, 0x30
00b39 0f8f20020000                   jg         0x7f3db7bda5df
00b3f 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00b46 83c5f9                         add        ebp, -7
00b49 89ac24a4000000                 mov        dword ptr [rsp + 0xa4], ebp
00b50 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00b58 443bd5                         cmp        r10d, ebp
00b5b 0f83bf140000                   jae        0x7f3db7bdb8a0
00b61 418bea                         mov        ebp, r10d
00b64 89ac24b4000000                 mov        dword ptr [rsp + 0xb4], ebp
00b6b 4863ed                         movsxd     rbp, ebp
00b6e 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00b76 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b7b 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00b80 4889ac24c8000000               mov        qword ptr [rsp + 0xc8], rbp
00b88 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b90 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
00b98 0f831e150000                   jae        0x7f3db7bdb93c
00b9e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00ba6 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00bae 4963eb                         movsxd     rbp, r11d
00bb1 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
00bb9 488d4d08                       lea        rcx, [rbp + 8]
00bbd 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00bc7 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00bcc 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00bd4 4533c9                         xor        r9d, r9d
00bd7 90                             nop        
00bd8 c5f877                         vzeroupper 
00bdb e8004eb5ff                     call       0x7f3db772f260
00be0 0f1f8400d80c000a               nop        dword ptr [rax + rax + 0xa000cd8]
00be8 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00bf0 4183c208                       add        r10d, 8
00bf4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00bfc 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00c04 0f8d43010000                   jge        0x7f3db7bda5cd
00c0a 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00c12 482bac24d0000000               sub        rbp, qword ptr [rsp + 0xd0]
00c1a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00c22 4983c2f9                       add        r10, -7
00c26 4c638424c8000000               movsxd     r8, dword ptr [rsp + 0xc8]
00c2e 4d8d1c28                       lea        r11, [r8 + rbp]
00c32 4d3bda                         cmp        r11, r10
00c35 0f83d1160000                   jae        0x7f3db7bdbb8c
00c3b 4c639c24b8000000               movsxd     r11, dword ptr [rsp + 0xb8]
00c43 4d2bd8                         sub        r11, r8
00c46 4983c307                       add        r11, 7
00c4a 4983e3f8                       and        r11, 0xfffffffffffffff8
00c4e 458bdb                         mov        r11d, r11d
00c51 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
00c59 478d5c0b08                     lea        r11d, [r11 + r9 + 8]
00c5e 4d63c3                         movsxd     r8, r11d
00c61 4d8d5c28f8                     lea        r11, [r8 + rbp - 8]
00c66 4d3bda                         cmp        r11, r10
00c69 0f839d160000                   jae        0x7f3db7bdbb8c
00c6f 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c77 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00c7f 0f8387160000                   jae        0x7f3db7bdbb8c
00c85 4983c0f8                       add        r8, -8
00c89 4d3bc2                         cmp        r8, r10
00c8c 0f837a160000                   jae        0x7f3db7bdbb8c
00c92 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c9a 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00ca1 0f8f41170000                   jg         0x7f3db7bdbc68
00ca7 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00cae 412be9                         sub        ebp, r9d
00cb1 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00cb5 90                             nop        
00cb6 90                             nop        
00cb7 90                             nop        
00cb8 90                             nop        
00cb9 90                             nop        
00cba 90                             nop        
00cbb 90                             nop        
00cbc 90                             nop        
00cbd 90                             nop        
00cbe 90                             nop        
00cbf 90                             nop        
00cc0 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
00cc8 4963ca                         movsxd     rcx, r10d
00ccb 4883c108                       add        rcx, 8
00ccf 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00cd3 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00cda 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00cdf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ce4 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00cee 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00cf3 4533c9                         xor        r9d, r9d
00cf6 90                             nop        
00cf7 90                             nop        
00cf8 c5f877                         vzeroupper 
00cfb e8e04cb5ff                     call       0x7f3db772f260
00d00 0f1f8400f80d000b               nop        dword ptr [rax + rax + 0xb000df8]
00d08 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00d10 4183c308                       add        r11d, 8
00d14 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00d1c 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d24 7c9a                           jl         0x7f3db7bda540
00d26 eb25                           jmp        0x7f3db7bda5cd
00d28 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d2d 4d63d3                         movsxd     r10, r11d
00d30 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d37 c442a8f5db                     bzhi       r11, r11, r10
00d3c c4c1fb92fb                     kmovq      k7, r11
00d41 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d47 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d4d 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00d55 44036c2478                     add        r13d, dword ptr [rsp + 0x78]
00d5a e990f7ffff                     jmp        0x7f3db7bd9d6f
00d5f 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00d67 4585db                         test       r11d, r11d
00d6a 0f8cc8130000                   jl         0x7f3db7bdb9b8
00d70 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00d78 4585d2                         test       r10d, r10d
00d7b 0f8cb7130000                   jl         0x7f3db7bdb9b8
00d81 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d86 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
00d8e 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00d96 453bc3                         cmp        r8d, r11d
00d99 0f8299130000                   jb         0x7f3db7bdb9b8
00d9f 458bd0                         mov        r10d, r8d
00da2 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00daa 0f8288130000                   jb         0x7f3db7bdb9b8
00db0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00db5 4585db                         test       r11d, r11d
00db8 7493                           je         0x7f3db7bda5cd
00dba 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00dbf 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00dc7 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00dcc 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00dd4 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00dd9 4883fd20                       cmp        rbp, 0x20
00ddd 0f8645ffffff                   jbe        0x7f3db7bda5a8
00de3 488bd5                         mov        rdx, rbp
00de6 c5f877                         vzeroupper 
00de9 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
00df3 41ffd2                         call       r10
00df6 0f1f840000000000               nop        dword ptr [rax + rax]
00dfe e94affffff                     jmp        0x7f3db7bda5cd
00e03 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00e08 4d63d2                         movsxd     r10, r10d
00e0b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e12 c442a8f5db                     bzhi       r11, r11, r10
00e17 c4c1fb92fb                     kmovq      k7, r11
00e1c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e22 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e28 eb61                           jmp        0x7f3db7bda70b
00e2a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e2f 4585db                         test       r11d, r11d
00e32 0f8c90110000                   jl         0x7f3db7bdb848
00e38 4585ed                         test       r13d, r13d
00e3b 0f8c87110000                   jl         0x7f3db7bdb848
00e41 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e46 453bd8                         cmp        r11d, r8d
00e49 0f8279110000                   jb         0x7f3db7bdb848
00e4f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00e57 443bd3                         cmp        r10d, ebx
00e5a 0f8268110000                   jb         0x7f3db7bdb848
00e60 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00e65 4585db                         test       r11d, r11d
00e68 7421                           je         0x7f3db7bda70b
00e6a 4983f920                       cmp        r9, 0x20
00e6e 7693                           jbe        0x7f3db7bda683
00e70 498bd1                         mov        rdx, r9
00e73 c5f877                         vzeroupper 
00e76 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
00e80 41ffd2                         call       r10
00e83 0f1f840000000000               nop        dword ptr [rax + rax]
00e8b 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00e92 e9c8f5ffff                     jmp        0x7f3db7bd9cdf
00e97 90                             nop        
00e98 418bc0                         mov        eax, r8d
00e9b 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00ea0 458b5c8304                     mov        r11d, dword ptr [r11 + rax*4 + 4]
00ea5 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00eaa 45895c8008                     mov        dword ptr [r8 + rax*4 + 8], r11d
00eaf 448d40ff                       lea        r8d, [rax - 1]
00eb3 453bc1                         cmp        r8d, r9d
00eb6 7fe0                           jg         0x7f3db7bda718
00eb8 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00ebd 4183f83f                       cmp        r8d, 0x3f
00ec1 0f8e03010000                   jle        0x7f3db7bda84a
00ec7 4c63d0                         movsxd     r10, eax
00eca 4983c2fe                       add        r10, -2
00ece 4d3bd3                         cmp        r10, r11
00ed1 0f83e5130000                   jae        0x7f3db7bdbb3c
00ed7 448d50bf                       lea        r10d, [rax - 0x41]
00edb 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00ee0 0f83ea130000                   jae        0x7f3db7bdbb50
00ee6 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00eeb 0f83f3130000                   jae        0x7f3db7bdbb64
00ef1 448d50c0                       lea        r10d, [rax - 0x40]
00ef5 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00efa 0f83f8130000                   jae        0x7f3db7bdbb78
00f00 448bd0                         mov        r10d, eax
00f03 41ffca                         dec        r10d
00f06 418bda                         mov        ebx, r10d
00f09 eb08                           jmp        0x7f3db7bda793
00f0b 90                             nop        
00f0c 90                             nop        
00f0d 90                             nop        
00f0e 90                             nop        
00f0f 90                             nop        
00f10 418bd8                         mov        ebx, r8d
00f13 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00f18 62d17e486f8498c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 - 0x38]
00f23 62d17e487f8498ccffffff         vmovdqu32  zmmword ptr [r8 + rbx*4 - 0x34], zmm0
00f2e 62d17e486f849888ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 - 0x78]
00f39 62d17e487f84988cffffff         vmovdqu32  zmmword ptr [r8 + rbx*4 - 0x74], zmm0
00f44 62d17e486f849848ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 - 0xb8]
00f4f 62d17e487f84984cffffff         vmovdqu32  zmmword ptr [r8 + rbx*4 - 0xb4], zmm0
00f5a 62d17e486f849808ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 - 0xf8]
00f65 62d17e487f84980cffffff         vmovdqu32  zmmword ptr [r8 + rbx*4 - 0xf4], zmm0
00f70 448d43c0                       lea        r8d, [rbx - 0x40]
00f74 4183f83f                       cmp        r8d, 0x3f
00f78 7f96                           jg         0x7f3db7bda790
00f7a 4183f80f                       cmp        r8d, 0xf
00f7e 7e4a                           jle        0x7f3db7bda84a
00f80 448bd3                         mov        r10d, ebx
00f83 458d42b0                       lea        r8d, [r10 - 0x50]
00f87 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00f8c 0f83be180000                   jae        0x7f3db7bdc0d0
00f92 4183c2b1                       add        r10d, -0x4f
00f96 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00f9b 0f83d7180000                   jae        0x7f3db7bdc0f8
00fa1 83c3c0                         add        ebx, -0x40
00fa4 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00fa9 62d17e486f849ac8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + rbx*4 - 0x38]
00fb4 62d17e487f849accffffff         vmovdqu32  zmmword ptr [r10 + rbx*4 - 0x34], zmm0
00fbf 83c3f0                         add        ebx, -0x10
00fc2 83fb0f                         cmp        ebx, 0xf
00fc5 7fdd                           jg         0x7f3db7bda824
00fc7 448bc3                         mov        r8d, ebx
00fca 4585c0                         test       r8d, r8d
00fcd 0f8ef9f7ffff                   jle        0x7f3db7bda04c
00fd3 4d63d0                         movsxd     r10, r8d
00fd6 49ffca                         dec        r10
00fd9 4d3bd3                         cmp        r10, r11
00fdc 0f835a180000                   jae        0x7f3db7bdc0bc
00fe2 458bd8                         mov        r11d, r8d
00fe5 458d53ff                       lea        r10d, [r11 - 1]
00fe9 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00fee 0f8370180000                   jae        0x7f3db7bdc0e4
00ff4 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00ff9 0f838d180000                   jae        0x7f3db7bdc10c
00fff 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
01004 0f8396180000                   jae        0x7f3db7bdc120
0100a 90                             nop        
0100b 90                             nop        
0100c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01011 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
01016 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0101b 4789548308                     mov        dword ptr [r11 + r8*4 + 8], r10d
01020 41ffc8                         dec        r8d
01023 4585c0                         test       r8d, r8d
01026 7fe4                           jg         0x7f3db7bda88c
01028 e99ff7ffff                     jmp        0x7f3db7bda04c
0102d 4d63d0                         movsxd     r10, r8d
01030 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01037 c442a8f5db                     bzhi       r11, r11, r10
0103c c4c1fb92fb                     kmovq      k7, r11
01041 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01047 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0104d eb72                           jmp        0x7f3db7bda941
0104f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01054 4585d2                         test       r10d, r10d
01057 0f8c57180000                   jl         0x7f3db7bdc134
0105d 4585ed                         test       r13d, r13d
01060 0f8c4e180000                   jl         0x7f3db7bdc134
01066 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0106b 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
01070 0f823e180000                   jb         0x7f3db7bdc134
01076 438d2c28                       lea        ebp, [r8 + r13]
0107a 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01082 443bd5                         cmp        r10d, ebp
01085 0f8229180000                   jb         0x7f3db7bdc134
0108b 4585c0                         test       r8d, r8d
0108e 0f8c20180000                   jl         0x7f3db7bdc134
01094 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01099 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
0109e 7421                           je         0x7f3db7bda941
010a0 4963d0                         movsxd     rdx, r8d
010a3 4883fa20                       cmp        rdx, 0x20
010a7 7684                           jbe        0x7f3db7bda8ad
010a9 c5f877                         vzeroupper 
010ac 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
010b6 41ffd2                         call       r10
010b9 0f1f840000000000               nop        dword ptr [rax + rax]
010c1 4c8b1424                       mov        r10, qword ptr [rsp]
010c5 41896a38                       mov        dword ptr [r10 + 0x38], ebp
010c9 c5f877                         vzeroupper 
010cc 4881c4f0000000                 add        rsp, 0xf0
010d3 5d                             pop        rbp
010d4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
010d8 0f874e1a0000                   ja         0x7f3db7bdc3ac
010de c3                             ret        
010df 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
010e4 4d63d3                         movsxd     r10, r11d
010e7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010ee c442a8f5db                     bzhi       r11, r11, r10
010f3 c4c1fb92fb                     kmovq      k7, r11
010f8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010fe 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01104 eb6f                           jmp        0x7f3db7bda9f5
01106 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0110b 4585db                         test       r11d, r11d
0110e 0f84b5030000                   je         0x7f3db7bdad49
01114 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01119 4585db                         test       r11d, r11d
0111c 0f8cca170000                   jl         0x7f3db7bdc16c
01122 4585ed                         test       r13d, r13d
01125 0f8cc1170000                   jl         0x7f3db7bdc16c
0112b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01130 453bd0                         cmp        r10d, r8d
01133 0f82b3170000                   jb         0x7f3db7bdc16c
01139 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01141 443bdb                         cmp        r11d, ebx
01144 0f82a2170000                   jb         0x7f3db7bdc16c
0114a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0114f 4585d2                         test       r10d, r10d
01152 7421                           je         0x7f3db7bda9f5
01154 4983f920                       cmp        r9, 0x20
01158 7685                           jbe        0x7f3db7bda95f
0115a 498bd1                         mov        rdx, r9
0115d c5f877                         vzeroupper 
01160 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
0116a 41ffd2                         call       r10
0116d 0f1f840000000000               nop        dword ptr [rax + rax]
01175 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0117a 4585db                         test       r11d, r11d
0117d 0f8eae010000                   jle        0x7f3db7bdabb1
01183 448bd3                         mov        r10d, ebx
01186 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
0118e 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01196 458d2c1b                       lea        r13d, [r11 + rbx]
0119a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0119f 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
011a7 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
011ac 498d741a08                     lea        rsi, [r10 + rbx + 8]
011b1 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
011b9 453bd3                         cmp        r10d, r11d
011bc 0f8dde000000                   jge        0x7f3db7bdab20
011c2 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
011ca 458bd3                         mov        r10d, r11d
011cd 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
011d5 450f4fd0                       cmovg      r10d, r8d
011d9 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
011e1 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
011e9 4585d2                         test       r10d, r10d
011ec 0f8c7a170000                   jl         0x7f3db7bdc1ec
011f2 85db                           test       ebx, ebx
011f4 0f8c72170000                   jl         0x7f3db7bdc1ec
011fa 44039424a4000000               add        r10d, dword ptr [rsp + 0xa4]
01202 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
0120a 453bc2                         cmp        r8d, r10d
0120d 0f8259170000                   jb         0x7f3db7bdc1ec
01213 448bd3                         mov        r10d, ebx
01216 44039424a4000000               add        r10d, dword ptr [rsp + 0xa4]
0121e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01226 453bc2                         cmp        r8d, r10d
01229 0f823d170000                   jb         0x7f3db7bdc1ec
0122f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01237 4585d2                         test       r10d, r10d
0123a 0f8c2c170000                   jl         0x7f3db7bdc1ec
01240 4585d2                         test       r10d, r10d
01243 7429                           je         0x7f3db7bdaaee
01245 4963d2                         movsxd     rdx, r10d
01248 4883fa20                       cmp        rdx, 0x20
0124c 7738                           ja         0x7f3db7bdab06
0124e 4d63d2                         movsxd     r10, r10d
01251 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01258 c442a8f5db                     bzhi       r11, r11, r10
0125d c4c1fb92fb                     kmovq      k7, r11
01262 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01268 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0126e 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01276 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0127b 0f8c7b010000                   jl         0x7f3db7bdac7c
01281 e969f2ffff                     jmp        0x7f3db7bd9d6f
01286 c5f877                         vzeroupper 
01289 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
01293 41ffd2                         call       r10
01296 0f1f840000000000               nop        dword ptr [rax + rax]
0129e ebce                           jmp        0x7f3db7bdaaee
012a0 4585c0                         test       r8d, r8d
012a3 0f8c8b170000                   jl         0x7f3db7bdc2b4
012a9 85db                           test       ebx, ebx
012ab 0f8c83170000                   jl         0x7f3db7bdc2b4
012b1 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
012b6 4503d0                         add        r10d, r8d
012b9 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
012c1 453bda                         cmp        r11d, r10d
012c4 0f826a170000                   jb         0x7f3db7bdc2b4
012ca 453bdd                         cmp        r11d, r13d
012cd 0f8261170000                   jb         0x7f3db7bdc2b4
012d3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
012d8 4585d2                         test       r10d, r10d
012db 0f840ef2ffff                   je         0x7f3db7bd9d6f
012e1 4883fd20                       cmp        rbp, 0x20
012e5 772a                           ja         0x7f3db7bdab91
012e7 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
012ec 4d63d3                         movsxd     r10, r11d
012ef 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012f6 c442a8f5db                     bzhi       r11, r11, r10
012fb c4c1fb92fb                     kmovq      k7, r11
01300 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01306 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0130c e9def1ffff                     jmp        0x7f3db7bd9d6f
01311 488bd5                         mov        rdx, rbp
01314 c5f877                         vzeroupper 
01317 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
01321 41ffd2                         call       r10
01324 0f1f840000000000               nop        dword ptr [rax + rax]
0132c e9bef1ffff                     jmp        0x7f3db7bd9d6f
01331 448beb                         mov        r13d, ebx
01334 e9b6f1ffff                     jmp        0x7f3db7bd9d6f
01339 ffc9                           dec        ecx
0133b 85c9                           test       ecx, ecx
0133d 7e1a                           jle        0x7f3db7bdabd9
0133f 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
01344 45895310                       mov        dword ptr [r11 + 0x10], r10d
01348 458b5308                       mov        r10d, dword ptr [r11 + 8]
0134c 4589530c                       mov        dword ptr [r11 + 0xc], r10d
01350 41894b08                       mov        dword ptr [r11 + 8], ecx
01354 e97cf4ffff                     jmp        0x7f3db7bda055
01359 48be882574e200000000           movabs     rsi, 0xe2742588
01363 418bed                         mov        ebp, r13d
01366 90                             nop        
01367 90                             nop        
01368 c5f877                         vzeroupper 
0136b e87050b5ff                     call       0x7f3db772fc60
01370 0f1f84006814000c               nop        dword ptr [rax + rax + 0xc001468]
01378 4885c0                         test       rax, rax
0137b 0f8588f4ffff                   jne        0x7f3db7bda089
01381 bef6ffffff                     mov        esi, 0xfffffff6
01386 90                             nop        
01387 90                             nop        
01388 c5f877                         vzeroupper 
0138b e8502eafff                     call       0x7f3db76cda60
01390 0f1f84008814000d               nop        dword ptr [rax + rax + 0xd001488]
01398 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
013a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
013a6 e835b93618                     call       0x7f3dcff46560
013ab f4                             hlt        
013ac 448bdd                         mov        r11d, ebp
013af 4d63d3                         movsxd     r10, r11d
013b2 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
013b9 c442a8f5db                     bzhi       r11, r11, r10
013be c4c1fb92fb                     kmovq      k7, r11
013c3 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
013c9 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
013cf 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
013d7 4403dd                         add        r11d, ebp
013da 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
013e2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
013e6 418502                         test       dword ptr [r10], eax
013e9 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
013ee 0f8dfbf0ffff                   jge        0x7f3db7bd9d6f
013f4 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
013fc 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01404 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
0140c 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01414 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
01418 2bac24a4000000                 sub        ebp, dword ptr [rsp + 0xa4]
0141f 3bac24a4000000                 cmp        ebp, dword ptr [rsp + 0xa4]
01426 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0142e 410f4fea                       cmovg      ebp, r10d
01432 4585db                         test       r11d, r11d
01435 0f8c89100000                   jl         0x7f3db7bdbd44
0143b 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01443 4585d2                         test       r10d, r10d
01446 0f8c78100000                   jl         0x7f3db7bdbd44
0144c 458d142b                       lea        r10d, [r11 + rbp]
01450 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
01458 453bc2                         cmp        r8d, r10d
0145b 0f8263100000                   jb         0x7f3db7bdbd44
01461 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
01469 4403f5                         add        r14d, ebp
0146c 458bd0                         mov        r10d, r8d
0146f 453bd6                         cmp        r10d, r14d
01472 0f824c100000                   jb         0x7f3db7bdbd44
01478 85ed                           test       ebp, ebp
0147a 0f8c44100000                   jl         0x7f3db7bdbd44
01480 85ed                           test       ebp, ebp
01482 0f8447ffffff                   je         0x7f3db7bdac4f
01488 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0148d 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
01492 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0149a 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
0149f 4863d5                         movsxd     rdx, ebp
014a2 4883fa20                       cmp        rdx, 0x20
014a6 0f8600ffffff                   jbe        0x7f3db7bdac2c
014ac c5f877                         vzeroupper 
014af 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
014b9 41ffd2                         call       r10
014bc 0f1f840000000000               nop        dword ptr [rax + rax]
014c4 e906ffffff                     jmp        0x7f3db7bdac4f
014c9 418bdd                         mov        ebx, r13d
014cc e9a4fcffff                     jmp        0x7f3db7bda9f5
014d1 bee4ffffff                     mov        esi, 0xffffffe4
014d6 488b2c24                       mov        rbp, qword ptr [rsp]
014da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014df 4c891424                       mov        qword ptr [rsp], r10
014e3 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014e8 4489542408                     mov        dword ptr [rsp + 8], r10d
014ed 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014f2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014f7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
014fc c5f877                         vzeroupper 
014ff e8dc2cafff                     call       0x7f3db76cda60
01504 0f1f8400fc15000f               nop        dword ptr [rax + rax + 0xf0015fc]
0150c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01516 4883e4f0                       and        rsp, 0xfffffffffffffff0
0151a e8c1b73618                     call       0x7f3dcff46560
0151f f4                             hlt        
01520 bee4ffffff                     mov        esi, 0xffffffe4
01525 488b2c24                       mov        rbp, qword ptr [rsp]
01529 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0152e 4c891424                       mov        qword ptr [rsp], r10
01532 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01537 44895c2408                     mov        dword ptr [rsp + 8], r11d
0153c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01541 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01546 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0154b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01550 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01555 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0155a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0155f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01564 c5f877                         vzeroupper 
01567 e8742cafff                     call       0x7f3db76cda60
0156c 0f1f840064160010               nop        dword ptr [rax + rax + 0x10001664]
01574 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0157e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01582 e859b73618                     call       0x7f3dcff46560
01587 f4                             hlt        
01588 bee4ffffff                     mov        esi, 0xffffffe4
0158d 488b2c24                       mov        rbp, qword ptr [rsp]
01591 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01596 4c891424                       mov        qword ptr [rsp], r10
0159a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0159f 4489542408                     mov        dword ptr [rsp + 8], r10d
015a4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
015a9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015b3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015bd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015c2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
015c7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
015cc 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
015d1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
015da 90                             nop        
015db 90                             nop        
015dc c5f877                         vzeroupper 
015df e8fc2bafff                     call       0x7f3db76cda60
015e4 0f1f8400dc160011               nop        dword ptr [rax + rax + 0x110016dc]
015ec 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
015f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015fa e8e1b63618                     call       0x7f3dcff46560
015ff f4                             hlt        
01600 bee4ffffff                     mov        esi, 0xffffffe4
01605 488b2c24                       mov        rbp, qword ptr [rsp]
01609 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0160e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01613 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01618 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0161d 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0162b 89442470                       mov        dword ptr [rsp + 0x70], eax
0162f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01634 c5f877                         vzeroupper 
01637 e8a42bafff                     call       0x7f3db76cda60
0163c 0f1f840034170012               nop        dword ptr [rax + rax + 0x12001734]
01644 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0164e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01652 e889b63618                     call       0x7f3dcff46560
01657 f4                             hlt        
01658 bee4ffffff                     mov        esi, 0xffffffe4
0165d 488b2c24                       mov        rbp, qword ptr [rsp]
01661 4c891c24                       mov        qword ptr [rsp], r11
01665 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0166a 4489542408                     mov        dword ptr [rsp + 8], r10d
0166f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01674 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01679 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0167e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01683 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01688 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0168d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01692 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01697 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0169c 48894424f8                     mov        qword ptr [rsp - 8], rax
016a1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
016a5 89442470                       mov        dword ptr [rsp + 0x70], eax
016a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ae 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
016b3 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016bc c5f877                         vzeroupper 
016bf e81c2bafff                     call       0x7f3db76cda60
016c4 0f1f8400bc170013               nop        dword ptr [rax + rax + 0x130017bc]
016cc 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
016d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016da e801b63618                     call       0x7f3dcff46560
016df f4                             hlt        
016e0 be45ffffff                     mov        esi, 0xffffff45
016e5 488b2c24                       mov        rbp, qword ptr [rsp]
016e9 4c89442408                     mov        qword ptr [rsp + 8], r8
016ee 90                             nop        
016ef 90                             nop        
016f0 c5f877                         vzeroupper 
016f3 e8e82aafff                     call       0x7f3db76cda60
016f8 0f1f8400f0170014               nop        dword ptr [rax + rax + 0x140017f0]
01700 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e8cdb53618                     call       0x7f3dcff46560
01713 f4                             hlt        
01714 be45ffffff                     mov        esi, 0xffffff45
01719 488b2c24                       mov        rbp, qword ptr [rsp]
0171d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01722 4c891424                       mov        qword ptr [rsp], r10
01726 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0172b 4489542408                     mov        dword ptr [rsp + 8], r10d
01730 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01735 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0173a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0173f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01744 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01749 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0174e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01753 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01758 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0175d 48894424f8                     mov        qword ptr [rsp - 8], rax
01762 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01766 89442434                       mov        dword ptr [rsp + 0x34], eax
0176a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176f 48894424f8                     mov        qword ptr [rsp - 8], rax
01774 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01778 89442438                       mov        dword ptr [rsp + 0x38], eax
0177c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01781 48894424f8                     mov        qword ptr [rsp - 8], rax
01786 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0178a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0178e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01793 48ff742450                     push       qword ptr [rsp + 0x50]
01798 488f442448                     pop        qword ptr [rsp + 0x48]
0179d 48ff742458                     push       qword ptr [rsp + 0x58]
017a2 488f442450                     pop        qword ptr [rsp + 0x50]
017a7 48894424f8                     mov        qword ptr [rsp - 8], rax
017ac 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017b0 89442458                       mov        dword ptr [rsp + 0x58], eax
017b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b9 48894424f8                     mov        qword ptr [rsp - 8], rax
017be 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017c2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
017c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cb 48894424f8                     mov        qword ptr [rsp - 8], rax
017d0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017d4 89442460                       mov        dword ptr [rsp + 0x60], eax
017d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017dd 48894424f8                     mov        qword ptr [rsp - 8], rax
017e2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017e6 89442464                       mov        dword ptr [rsp + 0x64], eax
017ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ef 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017f3 90                             nop        
017f4 c5f877                         vzeroupper 
017f7 e8e429afff                     call       0x7f3db76cda60
017fc 0f1f8400f4180015               nop        dword ptr [rax + rax + 0x150018f4]
01804 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0180e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01812 e8c9b43618                     call       0x7f3dcff46560
01817 f4                             hlt        
01818 4d3bd0                         cmp        r10, r8
0181b bdffffffff                     mov        ebp, 0xffffffff
01820 7c08                           jl         0x7f3db7bdb0aa
01822 400f95c5                       setne      bpl
01826 400fb6ed                       movzx      ebp, bpl
0182a be45ffffff                     mov        esi, 0xffffff45
0182f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01834 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01839 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0183e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01843 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01848 48894424f8                     mov        qword ptr [rsp - 8], rax
0184d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01851 89442470                       mov        dword ptr [rsp + 0x70], eax
01855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185a 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0185f 90                             nop        
01860 c5f877                         vzeroupper 
01863 e87829afff                     call       0x7f3db76cda60
01868 0f1f840060190016               nop        dword ptr [rax + rax + 0x16001960]
01870 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0187a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0187e e85db43618                     call       0x7f3dcff46560
01883 f4                             hlt        
01884 be45ffffff                     mov        esi, 0xffffff45
01889 488b2c24                       mov        rbp, qword ptr [rsp]
0188d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01892 4c891424                       mov        qword ptr [rsp], r10
01896 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0189b 4489542408                     mov        dword ptr [rsp + 8], r10d
018a0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
018a5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018aa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018af 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018b4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018b9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018be 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
018c3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018c8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018cd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018d2 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
018d7 48894424f8                     mov        qword ptr [rsp - 8], rax
018dc 8b442438                       mov        eax, dword ptr [rsp + 0x38]
018e0 89442434                       mov        dword ptr [rsp + 0x34], eax
018e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ee 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
018f2 89442438                       mov        dword ptr [rsp + 0x38], eax
018f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01900 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01904 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01908 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190d 48ff742450                     push       qword ptr [rsp + 0x50]
01912 488f442448                     pop        qword ptr [rsp + 0x48]
01917 48ff742458                     push       qword ptr [rsp + 0x58]
0191c 488f442450                     pop        qword ptr [rsp + 0x50]
01921 48894424f8                     mov        qword ptr [rsp - 8], rax
01926 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0192a 89442458                       mov        dword ptr [rsp + 0x58], eax
0192e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01933 48894424f8                     mov        qword ptr [rsp - 8], rax
01938 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0193c 89442460                       mov        dword ptr [rsp + 0x60], eax
01940 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01945 48894424f8                     mov        qword ptr [rsp - 8], rax
0194a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0194e 89442468                       mov        dword ptr [rsp + 0x68], eax
01952 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01957 90                             nop        
01958 c5f877                         vzeroupper 
0195b e88028afff                     call       0x7f3db76cda60
01960 0f1f8400581a0017               nop        dword ptr [rax + rax + 0x17001a58]
01968 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01972 4883e4f0                       and        rsp, 0xfffffffffffffff0
01976 e865b33618                     call       0x7f3dcff46560
0197b f4                             hlt        
0197c be45ffffff                     mov        esi, 0xffffff45
01981 488b2c24                       mov        rbp, qword ptr [rsp]
01985 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0198a 4c891424                       mov        qword ptr [rsp], r10
0198e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01993 44895c2408                     mov        dword ptr [rsp + 8], r11d
01998 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0199d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019a2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019ac 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019b1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019b6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
019bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019c0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019c5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
019ca 48894424f8                     mov        qword ptr [rsp - 8], rax
019cf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
019d3 89442438                       mov        dword ptr [rsp + 0x38], eax
019d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dc 48894424f8                     mov        qword ptr [rsp - 8], rax
019e1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ee 48ff742450                     push       qword ptr [rsp + 0x50]
019f3 488f442448                     pop        qword ptr [rsp + 0x48]
019f8 48ff742458                     push       qword ptr [rsp + 0x58]
019fd 488f442450                     pop        qword ptr [rsp + 0x50]
01a02 48894424f8                     mov        qword ptr [rsp - 8], rax
01a07 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a0b 89442458                       mov        dword ptr [rsp + 0x58], eax
01a0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a14 48894424f8                     mov        qword ptr [rsp - 8], rax
01a19 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a1d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a26 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a2f 89442460                       mov        dword ptr [rsp + 0x60], eax
01a33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a38 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01a3d 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01a42 90                             nop        
01a43 90                             nop        
01a44 c5f877                         vzeroupper 
01a47 e89427afff                     call       0x7f3db76cda60
01a4c 0f1f8400441b0018               nop        dword ptr [rax + rax + 0x18001b44]
01a54 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a62 e879b23618                     call       0x7f3dcff46560
01a67 f4                             hlt        
01a68 4533d2                         xor        r10d, r10d
01a6b 4c891424                       mov        qword ptr [rsp], r10
01a6f e9d9e6ffff                     jmp        0x7f3db7bd99cd
01a74 4533d2                         xor        r10d, r10d
01a77 4c89542408                     mov        qword ptr [rsp + 8], r10
01a7c e9fae6ffff                     jmp        0x7f3db7bd99fb
01a81 4533d2                         xor        r10d, r10d
01a84 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a89 e91be7ffff                     jmp        0x7f3db7bd9a29
01a8e 4533d2                         xor        r10d, r10d
01a91 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a96 e93ce7ffff                     jmp        0x7f3db7bd9a57
01a9b 4533d2                         xor        r10d, r10d
01a9e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01aa3 e95de7ffff                     jmp        0x7f3db7bd9a85
01aa8 4533d2                         xor        r10d, r10d
01aab 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ab0 e97be7ffff                     jmp        0x7f3db7bd9ab0
01ab5 bee4ffffff                     mov        esi, 0xffffffe4
01aba 488b2c24                       mov        rbp, qword ptr [rsp]
01abe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ac3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ac8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01acd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ad2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01adb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01adf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aed 89442460                       mov        dword ptr [rsp + 0x60], eax
01af1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af6 48894424f8                     mov        qword ptr [rsp - 8], rax
01afb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01aff 89442464                       mov        dword ptr [rsp + 0x64], eax
01b03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b08 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b11 89442468                       mov        dword ptr [rsp + 0x68], eax
01b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b23 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01b30 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01b35 90                             nop        
01b36 90                             nop        
01b37 90                             nop        
01b38 c5f877                         vzeroupper 
01b3b e8a026afff                     call       0x7f3db76cda60
01b40 0f1f8400381c0019               nop        dword ptr [rax + rax + 0x19001c38]
01b48 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b56 e885b13618                     call       0x7f3dcff46560
01b5b f4                             hlt        
01b5c c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01b65 bee4ffffff                     mov        esi, 0xffffffe4
01b6a 488b2c24                       mov        rbp, qword ptr [rsp]
01b6e 4c891424                       mov        qword ptr [rsp], r10
01b72 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b77 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b7c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01b81 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b86 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b8b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b90 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b95 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b9a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b9f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ba4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bad 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01bb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01bbf 89442460                       mov        dword ptr [rsp + 0x60], eax
01bc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01bd1 89442464                       mov        dword ptr [rsp + 0x64], eax
01bd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bda 48894424f8                     mov        qword ptr [rsp - 8], rax
01bdf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01be3 89442468                       mov        dword ptr [rsp + 0x68], eax
01be7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bec 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01bf5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01bf9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfe 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c02 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01c06 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01c0e 90                             nop        
01c0f 90                             nop        
01c10 c5f877                         vzeroupper 
01c13 e8c825afff                     call       0x7f3db76cda60
01c18 0f1f8400101d001a               nop        dword ptr [rax + rax + 0x1a001d10]
01c20 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01c2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2e e8adb03618                     call       0x7f3dcff46560
01c33 f4                             hlt        
01c34 8be9                           mov        ebp, ecx
01c36 83c510                         add        ebp, 0x10
01c39 be6effffff                     mov        esi, 0xffffff6e
01c3e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c43 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c48 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c4d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c52 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01c56 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c5f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c68 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c71 89442460                       mov        dword ptr [rsp + 0x60], eax
01c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c83 89442464                       mov        dword ptr [rsp + 0x64], eax
01c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c91 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c95 89442468                       mov        dword ptr [rsp + 0x68], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ca7 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01cab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb0 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01cb4 c5f877                         vzeroupper 
01cb7 e82425afff                     call       0x7f3db76cda60
01cbc 0f1f8400b41d001b               nop        dword ptr [rax + rax + 0x1b001db4]
01cc4 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01cce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cd2 e809b03618                     call       0x7f3dcff46560
01cd7 f4                             hlt        
01cd8 8be9                           mov        ebp, ecx
01cda 83c510                         add        ebp, 0x10
01cdd be66ffffff                     mov        esi, 0xffffff66
01ce2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ce7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01cec 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01cf1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cf6 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d03 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d11 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d15 89442460                       mov        dword ptr [rsp + 0x60], eax
01d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d23 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d27 89442464                       mov        dword ptr [rsp + 0x64], eax
01d2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d30 48894424f8                     mov        qword ptr [rsp - 8], rax
01d35 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d39 89442468                       mov        dword ptr [rsp + 0x68], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d4b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01d58 c5f877                         vzeroupper 
01d5b e88024afff                     call       0x7f3db76cda60
01d60 0f1f8400581e001c               nop        dword ptr [rax + rax + 0x1c001e58]
01d68 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d76 e865af3618                     call       0x7f3dcff46560
01d7b f4                             hlt        
01d7c bebeffffff                     mov        esi, 0xffffffbe
01d81 488b2c24                       mov        rbp, qword ptr [rsp]
01d85 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d8a 4c891424                       mov        qword ptr [rsp], r10
01d8e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d93 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d98 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d9d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01da2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01da7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dac 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01db1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01db6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dbb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dc0 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01dc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dca 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01dce 89442434                       mov        dword ptr [rsp + 0x34], eax
01dd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01de0 89442438                       mov        dword ptr [rsp + 0x38], eax
01de4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dee 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01df2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01df6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dfb 48ff742450                     push       qword ptr [rsp + 0x50]
01e00 488f442448                     pop        qword ptr [rsp + 0x48]
01e05 48ff742458                     push       qword ptr [rsp + 0x58]
01e0a 488f442450                     pop        qword ptr [rsp + 0x50]
01e0f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e14 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e18 89442458                       mov        dword ptr [rsp + 0x58], eax
01e1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e21 90                             nop        
01e22 90                             nop        
01e23 90                             nop        
01e24 c5f877                         vzeroupper 
01e27 e8b423afff                     call       0x7f3db76cda60
01e2c 0f1f8400241f001d               nop        dword ptr [rax + rax + 0x1d001f24]
01e34 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01e3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e42 e899ae3618                     call       0x7f3dcff46560
01e47 f4                             hlt        
01e48 be85ffffff                     mov        esi, 0xffffff85
01e4d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01e51 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e56 44891c24                       mov        dword ptr [rsp], r11d
01e5a 44896c2404                     mov        dword ptr [rsp + 4], r13d
01e5f 90                             nop        
01e60 c5f877                         vzeroupper 
01e63 e87823afff                     call       0x7f3db76cda60
01e68 0f1f8400601f001e               nop        dword ptr [rax + rax + 0x1e001f60]
01e70 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e7e e85dae3618                     call       0x7f3dcff46560
01e83 f4                             hlt        
01e84 bee4ffffff                     mov        esi, 0xffffffe4
01e89 488b2c24                       mov        rbp, qword ptr [rsp]
01e8d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e92 4c891424                       mov        qword ptr [rsp], r10
01e96 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e9b 4489542408                     mov        dword ptr [rsp + 8], r10d
01ea0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ea5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01eaa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01eaf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eb4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01eb9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ebe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ec3 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ec8 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01ecd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed2 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ed6 89442434                       mov        dword ptr [rsp + 0x34], eax
01eda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ee8 89442438                       mov        dword ptr [rsp + 0x38], eax
01eec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01efa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01efe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f03 48ff742450                     push       qword ptr [rsp + 0x50]
01f08 488f442448                     pop        qword ptr [rsp + 0x48]
01f0d 48ff742458                     push       qword ptr [rsp + 0x58]
01f12 488f442450                     pop        qword ptr [rsp + 0x50]
01f17 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f20 89442458                       mov        dword ptr [rsp + 0x58], eax
01f24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f29 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01f36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f40 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f44 89442460                       mov        dword ptr [rsp + 0x60], eax
01f48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f52 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f56 89442464                       mov        dword ptr [rsp + 0x64], eax
01f5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f64 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f68 89442468                       mov        dword ptr [rsp + 0x68], eax
01f6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f71 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f78 c5f877                         vzeroupper 
01f7b e86022afff                     call       0x7f3db76cda60
01f80 0f1f84007820001f               nop        dword ptr [rax + rax + 0x1f002078]
01f88 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e845ad3618                     call       0x7f3dcff46560
01f9b f4                             hlt        
01f9c bef6ffffff                     mov        esi, 0xfffffff6
01fa1 90                             nop        
01fa2 90                             nop        
01fa3 90                             nop        
01fa4 c5f877                         vzeroupper 
01fa7 e83422afff                     call       0x7f3db76cda60
01fac 0f1f8400a4200020               nop        dword ptr [rax + rax + 0x200020a4]
01fb4 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
01fbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc2 e819ad3618                     call       0x7f3dcff46560
01fc7 f4                             hlt        
01fc8 beccffffff                     mov        esi, 0xffffffcc
01fcd 488b2c24                       mov        rbp, qword ptr [rsp]
01fd1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fd6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01fdb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01fe0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fe5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fea 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01fee 89442470                       mov        dword ptr [rsp + 0x70], eax
01ff2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff7 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01ffc c5f877                         vzeroupper 
01fff e8dc21afff                     call       0x7f3db76cda60
02004 0f1f8400fc200021               nop        dword ptr [rax + rax + 0x210020fc]
0200c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02016 4883e4f0                       and        rsp, 0xfffffffffffffff0
0201a e8c1ac3618                     call       0x7f3dcff46560
0201f f4                             hlt        
02020 bee4ffffff                     mov        esi, 0xffffffe4
02025 488b2c24                       mov        rbp, qword ptr [rsp]
02029 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0202e 4c891424                       mov        qword ptr [rsp], r10
02032 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02037 44895c2408                     mov        dword ptr [rsp + 8], r11d
0203c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02041 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02046 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0204b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02050 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02055 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0205a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0205f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02064 48894424f8                     mov        qword ptr [rsp - 8], rax
02069 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0206d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02071 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02076 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0207e 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02083 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0208b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02090 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
02095 90                             nop        
02096 90                             nop        
02097 90                             nop        
02098 c5f877                         vzeroupper 
0209b e84021afff                     call       0x7f3db76cda60
020a0 0f1f840098210022               nop        dword ptr [rax + rax + 0x22002198]
020a8 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
020b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020b6 e825ac3618                     call       0x7f3dcff46560
020bb f4                             hlt        
020bc bee4ffffff                     mov        esi, 0xffffffe4
020c1 488b2c24                       mov        rbp, qword ptr [rsp]
020c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020ca 4c891424                       mov        qword ptr [rsp], r10
020ce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020d3 4489542408                     mov        dword ptr [rsp + 8], r10d
020d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
020dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020ec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020f6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
020fb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02100 48894424f8                     mov        qword ptr [rsp - 8], rax
02105 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02109 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0210d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02112 90                             nop        
02113 90                             nop        
02114 c5f877                         vzeroupper 
02117 e8c420afff                     call       0x7f3db76cda60
0211c 0f1f840014220023               nop        dword ptr [rax + rax + 0x23002214]
02124 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0212e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02132 e8a9ab3618                     call       0x7f3dcff46560
02137 f4                             hlt        
02138 beccffffff                     mov        esi, 0xffffffcc
0213d 488b2c24                       mov        rbp, qword ptr [rsp]
02141 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02146 4c891424                       mov        qword ptr [rsp], r10
0214a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0214f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02154 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02159 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0215e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02163 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02168 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0216d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02172 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02177 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0217c c5f877                         vzeroupper 
0217f e85c20afff                     call       0x7f3db76cda60
02184 0f1f84007c220024               nop        dword ptr [rax + rax + 0x2400227c]
0218c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02196 4883e4f0                       and        rsp, 0xfffffffffffffff0
0219a e841ab3618                     call       0x7f3dcff46560
0219f f4                             hlt        
021a0 be6effffff                     mov        esi, 0xffffff6e
021a5 488b2c24                       mov        rbp, qword ptr [rsp]
021a9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021ae 4c891424                       mov        qword ptr [rsp], r10
021b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021b7 4489542408                     mov        dword ptr [rsp + 8], r10d
021bc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021c1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021d0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021d5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021da 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
021df 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021e4 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
021e9 48894424f8                     mov        qword ptr [rsp - 8], rax
021ee 8b442438                       mov        eax, dword ptr [rsp + 0x38]
021f2 89442434                       mov        dword ptr [rsp + 0x34], eax
021f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02200 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02204 89442438                       mov        dword ptr [rsp + 0x38], eax
02208 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220d 48894424f8                     mov        qword ptr [rsp - 8], rax
02212 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02216 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0221a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221f 48ff742450                     push       qword ptr [rsp + 0x50]
02224 488f442448                     pop        qword ptr [rsp + 0x48]
02229 48ff742458                     push       qword ptr [rsp + 0x58]
0222e 488f442450                     pop        qword ptr [rsp + 0x50]
02233 48894424f8                     mov        qword ptr [rsp - 8], rax
02238 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0223c 89442458                       mov        dword ptr [rsp + 0x58], eax
02240 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02245 48894424f8                     mov        qword ptr [rsp - 8], rax
0224a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0224e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02252 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02257 48894424f8                     mov        qword ptr [rsp - 8], rax
0225c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02260 89442460                       mov        dword ptr [rsp + 0x60], eax
02264 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02269 48894424f8                     mov        qword ptr [rsp - 8], rax
0226e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02272 89442464                       mov        dword ptr [rsp + 0x64], eax
02276 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227b 48894424f8                     mov        qword ptr [rsp - 8], rax
02280 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02284 89442468                       mov        dword ptr [rsp + 0x68], eax
02288 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228d 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02291 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02295 90                             nop        
02296 90                             nop        
02297 90                             nop        
02298 c5f877                         vzeroupper 
0229b e8401fafff                     call       0x7f3db76cda60
022a0 0f1f840098230025               nop        dword ptr [rax + rax + 0x25002398]
022a8 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
022b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022b6 e825aa3618                     call       0x7f3dcff46560
022bb f4                             hlt        
022bc 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
022c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ca e811aa3618                     call       0x7f3dcff46560
022cf f4                             hlt        
022d0 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
022da 4883e4f0                       and        rsp, 0xfffffffffffffff0
022de e8fda93618                     call       0x7f3dcff46560
022e3 f4                             hlt        
022e4 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
022ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
022f2 e8e9a93618                     call       0x7f3dcff46560
022f7 f4                             hlt        
022f8 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
02302 4883e4f0                       and        rsp, 0xfffffffffffffff0
02306 e8d5a93618                     call       0x7f3dcff46560
0230b f4                             hlt        
0230c 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
02314 458d5308                       lea        r10d, [r11 + 8]
02318 458bca                         mov        r9d, r10d
0231b be6effffff                     mov        esi, 0xffffff6e
02320 488b2c24                       mov        rbp, qword ptr [rsp]
02324 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02329 4c891424                       mov        qword ptr [rsp], r10
0232d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02332 4489542408                     mov        dword ptr [rsp + 8], r10d
02337 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0233c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02341 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02346 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0234b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02350 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02355 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0235a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0235f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02364 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02369 48ff742440                     push       qword ptr [rsp + 0x40]
0236e 488f442438                     pop        qword ptr [rsp + 0x38]
02373 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02378 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0237d 48ff742450                     push       qword ptr [rsp + 0x50]
02382 488f442448                     pop        qword ptr [rsp + 0x48]
02387 48ff742458                     push       qword ptr [rsp + 0x58]
0238c 488f442450                     pop        qword ptr [rsp + 0x50]
02391 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02396 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0239b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
023a0 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
023a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
023aa 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
023af 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
023b7 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
023bc 458bda                         mov        r11d, r10d
023bf 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
023c4 c5f877                         vzeroupper 
023c7 e8141eafff                     call       0x7f3db76cda60
023cc 0f1f8400c4240026               nop        dword ptr [rax + rax + 0x260024c4]
023d4 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
023de 4883e4f0                       and        rsp, 0xfffffffffffffff0
023e2 e8f9a83618                     call       0x7f3dcff46560
023e7 f4                             hlt        
023e8 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
023f0 458d5308                       lea        r10d, [r11 + 8]
023f4 458bca                         mov        r9d, r10d
023f7 be66ffffff                     mov        esi, 0xffffff66
023fc 488b2c24                       mov        rbp, qword ptr [rsp]
02400 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02405 4c891424                       mov        qword ptr [rsp], r10
02409 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0240e 4489542408                     mov        dword ptr [rsp + 8], r10d
02413 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02418 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0241d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02422 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02427 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0242c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02431 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02436 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0243b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02440 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02445 48ff742440                     push       qword ptr [rsp + 0x40]
0244a 488f442438                     pop        qword ptr [rsp + 0x38]
0244f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02454 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02459 48ff742450                     push       qword ptr [rsp + 0x50]
0245e 488f442448                     pop        qword ptr [rsp + 0x48]
02463 48ff742458                     push       qword ptr [rsp + 0x58]
02468 488f442450                     pop        qword ptr [rsp + 0x50]
0246d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02472 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02477 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0247c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02481 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02486 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0248b 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
02493 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02498 458bda                         mov        r11d, r10d
0249b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
024a0 c5f877                         vzeroupper 
024a3 e8381dafff                     call       0x7f3db76cda60
024a8 0f1f8400a0250027               nop        dword ptr [rax + rax + 0x270025a0]
024b0 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
024ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
024be e81da83618                     call       0x7f3dcff46560
024c3 f4                             hlt        
024c4 beccffffff                     mov        esi, 0xffffffcc
024c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024ce 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
024d3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024d8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024dd 48894424f8                     mov        qword ptr [rsp - 8], rax
024e2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024e6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
024ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ef 48894424f8                     mov        qword ptr [rsp - 8], rax
024f4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
024f8 89442460                       mov        dword ptr [rsp + 0x60], eax
024fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02501 48894424f8                     mov        qword ptr [rsp - 8], rax
02506 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0250a 89442464                       mov        dword ptr [rsp + 0x64], eax
0250e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02513 48894424f8                     mov        qword ptr [rsp - 8], rax
02518 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0251c 89442468                       mov        dword ptr [rsp + 0x68], eax
02520 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02525 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02529 90                             nop        
0252a 90                             nop        
0252b 90                             nop        
0252c c5f877                         vzeroupper 
0252f e8ac1cafff                     call       0x7f3db76cda60
02534 0f1f84002c260028               nop        dword ptr [rax + rax + 0x2800262c]
0253c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02546 4883e4f0                       and        rsp, 0xfffffffffffffff0
0254a e891a73618                     call       0x7f3dcff46560
0254f f4                             hlt        
02550 bee4ffffff                     mov        esi, 0xffffffe4
02555 488b2c24                       mov        rbp, qword ptr [rsp]
02559 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0255e 4c891424                       mov        qword ptr [rsp], r10
02562 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02567 44895c2408                     mov        dword ptr [rsp + 8], r11d
0256c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02571 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02576 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0257b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02580 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02585 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0258a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0258f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02594 48894424f8                     mov        qword ptr [rsp - 8], rax
02599 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0259d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
025a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a6 48894424f8                     mov        qword ptr [rsp - 8], rax
025ab 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025af 89442460                       mov        dword ptr [rsp + 0x60], eax
025b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b8 48894424f8                     mov        qword ptr [rsp - 8], rax
025bd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
025c1 89442464                       mov        dword ptr [rsp + 0x64], eax
025c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ca 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
025d2 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
025d7 48894424f8                     mov        qword ptr [rsp - 8], rax
025dc 8b442478                       mov        eax, dword ptr [rsp + 0x78]
025e0 89442474                       mov        dword ptr [rsp + 0x74], eax
025e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e9 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
025f1 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
025f9 90                             nop        
025fa 90                             nop        
025fb 90                             nop        
025fc c5f877                         vzeroupper 
025ff e8dc1bafff                     call       0x7f3db76cda60
02604 0f1f8400fc260029               nop        dword ptr [rax + rax + 0x290026fc]
0260c 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02616 4883e4f0                       and        rsp, 0xfffffffffffffff0
0261a e8c1a63618                     call       0x7f3dcff46560
0261f f4                             hlt        
02620 bee4ffffff                     mov        esi, 0xffffffe4
02625 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0262a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0262f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02634 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02639 48894424f8                     mov        qword ptr [rsp - 8], rax
0263e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02642 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02646 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264b 48894424f8                     mov        qword ptr [rsp - 8], rax
02650 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02654 89442460                       mov        dword ptr [rsp + 0x60], eax
02658 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0265d 48894424f8                     mov        qword ptr [rsp - 8], rax
02662 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02666 89442464                       mov        dword ptr [rsp + 0x64], eax
0266a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266f 90                             nop        
02670 c5f877                         vzeroupper 
02673 e8681bafff                     call       0x7f3db76cda60
02678 0f1f84007027002a               nop        dword ptr [rax + rax + 0x2a002770]
02680 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0268a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0268e e84da63618                     call       0x7f3dcff46560
02693 f4                             hlt        
02694 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
0269b ffc5                           inc        ebp
0269d bee4ffffff                     mov        esi, 0xffffffe4
026a2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026a7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
026ac 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
026b1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026b6 48894424f8                     mov        qword ptr [rsp - 8], rax
026bb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026bf 8944244c                       mov        dword ptr [rsp + 0x4c], eax
026c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c8 48894424f8                     mov        qword ptr [rsp - 8], rax
026cd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026d1 89442460                       mov        dword ptr [rsp + 0x60], eax
026d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026da 48894424f8                     mov        qword ptr [rsp - 8], rax
026df 8b442468                       mov        eax, dword ptr [rsp + 0x68]
026e3 89442464                       mov        dword ptr [rsp + 0x64], eax
026e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ec 4489442470                     mov        dword ptr [rsp + 0x70], r8d
026f1 90                             nop        
026f2 90                             nop        
026f3 90                             nop        
026f4 c5f877                         vzeroupper 
026f7 e8e41aafff                     call       0x7f3db76cda60
026fc 0f1f8400f427002b               nop        dword ptr [rax + rax + 0x2b0027f4]
02704 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
0270e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02712 e8c9a53618                     call       0x7f3dcff46560
02717 f4                             hlt        
02718 bee4ffffff                     mov        esi, 0xffffffe4
0271d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02722 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02727 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0272c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02731 48894424f8                     mov        qword ptr [rsp - 8], rax
02736 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0273a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0273e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02743 48894424f8                     mov        qword ptr [rsp - 8], rax
02748 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0274c 89442460                       mov        dword ptr [rsp + 0x60], eax
02750 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02755 48894424f8                     mov        qword ptr [rsp - 8], rax
0275a 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0275e 89442464                       mov        dword ptr [rsp + 0x64], eax
02762 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02767 90                             nop        
02768 c5f877                         vzeroupper 
0276b e8701aafff                     call       0x7f3db76cda60
02770 0f1f84006828002c               nop        dword ptr [rax + rax + 0x2c002868]
02778 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02782 4883e4f0                       and        rsp, 0xfffffffffffffff0
02786 e855a53618                     call       0x7f3dcff46560
0278b f4                             hlt        
0278c bee4ffffff                     mov        esi, 0xffffffe4
02791 488b2c24                       mov        rbp, qword ptr [rsp]
02795 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0279a 4c891424                       mov        qword ptr [rsp], r10
0279e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
027a3 4489542408                     mov        dword ptr [rsp + 8], r10d
027a8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
027ad 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027b2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027b7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027bc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027c1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027c6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
027cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
027d0 48894424f8                     mov        qword ptr [rsp - 8], rax
027d5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027d9 8944244c                       mov        dword ptr [rsp + 0x4c], eax
027dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e2 48894424f8                     mov        qword ptr [rsp - 8], rax
027e7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
027eb 89442460                       mov        dword ptr [rsp + 0x60], eax
027ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f4 48894424f8                     mov        qword ptr [rsp - 8], rax
027f9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027fd 89442464                       mov        dword ptr [rsp + 0x64], eax
02801 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02806 48894424f8                     mov        qword ptr [rsp - 8], rax
0280b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0280f 89442470                       mov        dword ptr [rsp + 0x70], eax
02813 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02818 c5f877                         vzeroupper 
0281b e8c019afff                     call       0x7f3db76cda60
02820 0f1f84001829002d               nop        dword ptr [rax + rax + 0x2d002918]
02828 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02832 4883e4f0                       and        rsp, 0xfffffffffffffff0
02836 e8a5a43618                     call       0x7f3dcff46560
0283b f4                             hlt        
0283c 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
02846 4883e4f0                       and        rsp, 0xfffffffffffffff0
0284a e891a43618                     call       0x7f3dcff46560
0284f f4                             hlt        
02850 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
0285a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0285e e87da43618                     call       0x7f3dcff46560
02863 f4                             hlt        
02864 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
0286e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02872 e869a43618                     call       0x7f3dcff46560
02877 f4                             hlt        
02878 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
02882 4883e4f0                       and        rsp, 0xfffffffffffffff0
02886 e855a43618                     call       0x7f3dcff46560
0288b f4                             hlt        
0288c 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
02896 4883e4f0                       and        rsp, 0xfffffffffffffff0
0289a e841a43618                     call       0x7f3dcff46560
0289f f4                             hlt        
028a0 48bf809f30903d7f0000           movabs     rdi, 0x7f3d90309f80
028aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ae e82da43618                     call       0x7f3dcff46560
028b3 f4                             hlt        
028b4 beccffffff                     mov        esi, 0xffffffcc
028b9 488b2c24                       mov        rbp, qword ptr [rsp]
028bd 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
028c2 4489442420                     mov        dword ptr [rsp + 0x20], r8d
028c7 90                             nop        
028c8 c5f877                         vzeroupper 
028cb e81019afff                     call       0x7f3db76cda60
028d0 0f1f8400c829002e               nop        dword ptr [rax + rax + 0x2e0029c8]
028d8 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
028e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028e6 e8f5a33618                     call       0x7f3dcff46560
028eb f4                             hlt        
028ec beccffffff                     mov        esi, 0xffffffcc
028f1 488b2c24                       mov        rbp, qword ptr [rsp]
028f5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028fa 4489542414                     mov        dword ptr [rsp + 0x14], r10d
028ff 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02904 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02909 48894424f8                     mov        qword ptr [rsp - 8], rax
0290e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02912 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02916 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291b 48894424f8                     mov        qword ptr [rsp - 8], rax
02920 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02924 89442460                       mov        dword ptr [rsp + 0x60], eax
02928 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292d 48894424f8                     mov        qword ptr [rsp - 8], rax
02932 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02936 89442464                       mov        dword ptr [rsp + 0x64], eax
0293a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293f 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
02947 90                             nop        
02948 c5f877                         vzeroupper 
0294b e89018afff                     call       0x7f3db76cda60
02950 0f1f8400482a002f               nop        dword ptr [rax + rax + 0x2f002a48]
02958 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02962 4883e4f0                       and        rsp, 0xfffffffffffffff0
02966 e875a33618                     call       0x7f3dcff46560
0296b f4                             hlt        
0296c beccffffff                     mov        esi, 0xffffffcc
02971 488b2c24                       mov        rbp, qword ptr [rsp]
02975 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0297a 4c891424                       mov        qword ptr [rsp], r10
0297e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02983 4489542408                     mov        dword ptr [rsp + 8], r10d
02988 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0298d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02992 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02997 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0299c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029a1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
029a6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
029ab 4c89542420                     mov        qword ptr [rsp + 0x20], r10
029b0 48894424f8                     mov        qword ptr [rsp - 8], rax
029b5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
029b9 8944244c                       mov        dword ptr [rsp + 0x4c], eax
029bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c2 48894424f8                     mov        qword ptr [rsp - 8], rax
029c7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
029cb 89442460                       mov        dword ptr [rsp + 0x60], eax
029cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029d4 48894424f8                     mov        qword ptr [rsp - 8], rax
029d9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
029dd 89442464                       mov        dword ptr [rsp + 0x64], eax
029e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e6 48894424f8                     mov        qword ptr [rsp - 8], rax
029eb 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
029ef 89442468                       mov        dword ptr [rsp + 0x68], eax
029f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f8 48894424f8                     mov        qword ptr [rsp - 8], rax
029fd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02a01 89442470                       mov        dword ptr [rsp + 0x70], eax
02a05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a0a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02a0e 90                             nop        
02a0f 90                             nop        
02a10 c5f877                         vzeroupper 
02a13 e8c817afff                     call       0x7f3db76cda60
02a18 0f1f8400102b0030               nop        dword ptr [rax + rax + 0x30002b10]
02a20 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a2e e8ada23618                     call       0x7f3dcff46560
02a33 f4                             hlt        
02a34 beccffffff                     mov        esi, 0xffffffcc
02a39 488b2c24                       mov        rbp, qword ptr [rsp]
02a3d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02a42 4c891424                       mov        qword ptr [rsp], r10
02a46 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a4b 4489542408                     mov        dword ptr [rsp + 8], r10d
02a50 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02a55 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a5a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a5f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a64 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02a69 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02a6e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02a73 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02a78 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a81 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02a85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a8f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a93 89442460                       mov        dword ptr [rsp + 0x60], eax
02a97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a9c 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02aa5 89442464                       mov        dword ptr [rsp + 0x64], eax
02aa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aae 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab3 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02ab7 89442468                       mov        dword ptr [rsp + 0x68], eax
02abb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02ac4 c5f877                         vzeroupper 
02ac7 e81417afff                     call       0x7f3db76cda60
02acc 0f1f8400c42b0031               nop        dword ptr [rax + rax + 0x31002bc4]
02ad4 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e8f9a13618                     call       0x7f3dcff46560
02ae7 f4                             hlt        
02ae8 eb10                           jmp        0x7f3db7bdc37a
02aea eb0e                           jmp        0x7f3db7bdc37a
02aec eb0c                           jmp        0x7f3db7bdc37a
02aee eb0a                           jmp        0x7f3db7bdc37a
02af0 eb08                           jmp        0x7f3db7bdc37a
02af2 eb06                           jmp        0x7f3db7bdc37a
02af4 eb04                           jmp        0x7f3db7bdc37a
02af6 eb02                           jmp        0x7f3db7bdc37a
02af8 eb00                           jmp        0x7f3db7bdc37a
02afa 488bf0                         mov        rsi, rax
02afd e90addffff                     jmp        0x7f3db7bda08c
02b02 bef6ffffff                     mov        esi, 0xfffffff6
02b07 90                             nop        
02b08 c5f877                         vzeroupper 
02b0b e8d016afff                     call       0x7f3db76cda60
02b10 0f1f8400082c0032               nop        dword ptr [rax + rax + 0x32002c08]
02b18 48bf30e029903d7f0000           movabs     rdi, 0x7f3d9029e030
02b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b26 e8b5a13618                     call       0x7f3dcff46560
02b2b f4                             hlt        
02b2c 49ba54a9bdb73d7f0000           movabs     r10, 0x7f3db7bda954
02b36 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02b3d e99e5fb5ff                     jmp        0x7f3db7732360
02b42 e8192eb4ff                     call       0x7f3db771f1e0
02b47 e9e2d4ffff                     jmp        0x7f3db7bd98ae
02b4c f4                             hlt        
02b4d f4                             hlt        
02b4e f4                             hlt        
02b4f f4                             hlt        
