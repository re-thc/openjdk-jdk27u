00000 e8fb43e717                     call       0x7f56c7a4dc00
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
00028 0f85c82a0000                   jne        0x7f56afbdc2f6
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
0010d 49ba7003c1c7567f0000           movabs     r10, 0x7f56c7c10370
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84ec180000                   je         0x7f56afbdb21c
00130 458b12                         mov        r10d, dword ptr [r10]
00133 41c1ea0d                       shr        r10d, 0xd
00137 4181fa15040000                 cmp        r10d, 0x415
0013e 0f85b81c0000                   jne        0x7f56afbdb5fc
00144 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00149 4c891424                       mov        qword ptr [rsp], r10
0014d 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00155 4885ed                         test       rbp, rbp
00158 0f84ca180000                   je         0x7f56afbdb228
0015e 448b5d00                       mov        r11d, dword ptr [rbp]
00162 41c1eb0d                       shr        r11d, 0xd
00166 4181fb05010000                 cmp        r11d, 0x105
0016d 0f85891c0000                   jne        0x7f56afbdb5fc
00173 4c8bd5                         mov        r10, rbp
00176 4c89542408                     mov        qword ptr [rsp + 8], r10
0017b 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
00183 4885ed                         test       rbp, rbp
00186 0f84a9180000                   je         0x7f56afbdb235
0018c 448b5500                       mov        r10d, dword ptr [rbp]
00190 41c1ea0d                       shr        r10d, 0xd
00194 4181fa08010000                 cmp        r10d, 0x108
0019b 0f855b1c0000                   jne        0x7f56afbdb5fc
001a1 4c8bd5                         mov        r10, rbp
001a4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001b1 4885ed                         test       rbp, rbp
001b4 0f8488180000                   je         0x7f56afbdb242
001ba 448b5d00                       mov        r11d, dword ptr [rbp]
001be 41c1eb0d                       shr        r11d, 0xd
001c2 4181fb07010000                 cmp        r11d, 0x107
001c9 0f852d1c0000                   jne        0x7f56afbdb5fc
001cf 4c8bd5                         mov        r10, rbp
001d2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d7 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001df 4885ed                         test       rbp, rbp
001e2 0f8467180000                   je         0x7f56afbdb24f
001e8 448b5d00                       mov        r11d, dword ptr [rbp]
001ec 41c1eb0d                       shr        r11d, 0xd
001f0 4181fb07010000                 cmp        r11d, 0x107
001f7 0f85ff1b0000                   jne        0x7f56afbdb5fc
001fd 4c8bd5                         mov        r10, rbp
00200 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00205 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
0020d 4885ed                         test       rbp, rbp
00210 0f8446180000                   je         0x7f56afbdb25c
00216 448b5d00                       mov        r11d, dword ptr [rbp]
0021a 41c1eb0d                       shr        r11d, 0xd
0021e 4181fb05010000                 cmp        r11d, 0x105
00225 0f85d11b0000                   jne        0x7f56afbdb5fc
0022b 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
00230 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00235 458b5204                       mov        r10d, dword ptr [r10 + 4]
00239 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0023e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00243 4585d2                         test       r10d, r10d
00246 0f84e41a0000                   je         0x7f56afbdb530
0024c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00251 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00255 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0025a 4585db                         test       r11d, r11d
0025d 0f86cd1a0000                   jbe        0x7f56afbdb530
00263 4183fb01                       cmp        r11d, 1
00267 0f86c31a0000                   jbe        0x7f56afbdb530
0026d 4183fb02                       cmp        r11d, 2
00271 0f86b91a0000                   jbe        0x7f56afbdb530
00277 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0027c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00280 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00285 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0028a 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0028e 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00296 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0029b 4183c2f1                       add        r10d, -0xf
0029f 4585d2                         test       r10d, r10d
002a2 0f8c881a0000                   jl         0x7f56afbdb530
002a8 4183c3f1                       add        r11d, -0xf
002ac 4585db                         test       r11d, r11d
002af 0f8c7b1a0000                   jl         0x7f56afbdb530
002b5 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002bd 4183c2f9                       add        r10d, -7
002c1 4585d2                         test       r10d, r10d
002c4 0f8c661a0000                   jl         0x7f56afbdb530
002ca 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002cf 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
002d7 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
002df 4d63da                         movsxd     r11, r10d
002e2 4183c2f1                       add        r10d, -0xf
002e6 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002ee 4983c3f1                       add        r11, -0xf
002f2 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
002fa 4d63d0                         movsxd     r10, r8d
002fd 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00305 458d50f1                       lea        r10d, [r8 - 0xf]
00309 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00311 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00319 4983c2f1                       add        r10, -0xf
0031d 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00325 e9df010000                     jmp        0x7f56afbd9d09
0032a 4533db                         xor        r11d, r11d
0032d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00332 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00337 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0033b 83fb03                         cmp        ebx, 3
0033e 0f8edc030000                   jle        0x7f56afbd9f20
00344 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00349 45895310                       mov        dword ptr [r11 + 0x10], r10d
0034d 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00351 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00356 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0035a 448d53fd                       lea        r10d, [rbx - 3]
0035e 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00366 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0036b 45895308                       mov        dword ptr [r11 + 8], r10d
0036f 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00377 4d63c5                         movsxd     r8, r13d
0037a 4c03442440                     add        r8, qword ptr [rsp + 0x40]
0037f 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
00384 4d8bcb                         mov        r9, r11
00387 4d03c3                         add        r8, r11
0038a 4d3bd0                         cmp        r10, r8
0038d 0f8f39140000                   jg         0x7f56afbdafcc
00393 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0039b 4585db                         test       r11d, r11d
0039e 0f8ef0120000                   jle        0x7f56afbdae94
003a4 418bdd                         mov        ebx, r13d
003a7 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
003ab 48636c2478                     movsxd     rbp, dword ptr [rsp + 0x78]
003b0 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
003b5 4403d3                         add        r10d, ebx
003b8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003bd 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
003c2 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
003ca 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
003cf 0f8fe70c0000                   jg         0x7f56afbda8bc
003d5 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003da 0f8f58140000                   jg         0x7f56afbdb038
003e0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003e5 4183fb10                       cmp        r11d, 0x10
003e9 0f8fe1010000                   jg         0x7f56afbd9dd0
003ef 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003f4 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
003fc 0f83b2110000                   jae        0x7f56afbdadb4
00402 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00407 458bc3                         mov        r8d, r11d
0040a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0040f c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00416 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
0041e 0f83e8110000                   jae        0x7f56afbdae0c
00424 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00429 4503d0                         add        r10d, r8d
0042c 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00434 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00439 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
00440 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00445 4503dd                         add        r11d, r13d
00448 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00450 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00458 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
00460 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00468 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0046d 4183fa10                       cmp        r10d, 0x10
00471 0f8fb9140000                   jg         0x7f56afbdb130
00477 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0047f 4183fb10                       cmp        r11d, 0x10
00483 0f8c73030000                   jl         0x7f56afbd9ffc
00489 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00491 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00499 0f832d100000                   jae        0x7f56afbdaccc
0049f 458bda                         mov        r11d, r10d
004a2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004a7 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
004ae 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
004b6 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
004be 0f8370100000                   jae        0x7f56afbdad34
004c4 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
004cc 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004d1 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
004d8 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
004dd 4503ea                         add        r13d, r10d
004e0 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004e4 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004e9 41ffc3                         inc        r11d
004ec 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004f1 418502                         test       dword ptr [r10], eax
004f4 48894424f8                     mov        qword ptr [rsp - 8], rax
004f9 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00500 89442438                       mov        dword ptr [rsp + 0x38], eax
00504 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00509 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0050e 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00513 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00518 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
0051d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00522 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00527 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0052c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00531 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00536 0f8dce0a0000                   jge        0x7f56afbda80a
0053c 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00541 0f83360f0000                   jae        0x7f56afbdac7d
00547 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0054c 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
00551 4d8bd3                         mov        r10, r11
00554 49c1ea12                       shr        r10, 0x12
00558 458bd2                         mov        r10d, r10d
0055b 4181e2ffff0300                 and        r10d, 0x3ffff
00562 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00567 4d8bd3                         mov        r10, r11
0056a 49c1fa24                       sar        r10, 0x24
0056e 458bdb                         mov        r11d, r11d
00571 458bd2                         mov        r10d, r10d
00574 418bda                         mov        ebx, r10d
00577 4181e3ffff0100                 and        r11d, 0x1ffff
0057e 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00583 4585d2                         test       r10d, r10d
00586 0f8c3c110000                   jl         0x7f56afbdaec8
0058c 4585db                         test       r11d, r11d
0058f 0f8495fdffff                   je         0x7f56afbd9b2a
00595 453bd9                         cmp        r11d, r9d
00598 0f8e94fdffff                   jle        0x7f56afbd9b32
0059e be45ffffff                     mov        esi, 0xffffff45
005a3 418beb                         mov        ebp, r11d
005a6 44890c24                       mov        dword ptr [rsp], r9d
005aa 90                             nop        
005ab 90                             nop        
005ac c5f877                         vzeroupper 
005af e8ac3cafff                     call       0x7f56af6cda60
005b4 0f1f8400ac060001               nop        dword ptr [rax + rax + 0x10006ac]
005bc 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
005c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ca e81167c417                     call       0x7f56c78204e0
005cf f4                             hlt        
005d0 4183fb30                       cmp        r11d, 0x30
005d4 0f8f03080000                   jg         0x7f56afbda5dd
005da 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005df 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
005e7 0f837c140000                   jae        0x7f56afbdb269
005ed 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005f2 418bcb                         mov        ecx, r11d
005f5 4d63db                         movsxd     r11, r11d
005f8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
005fd c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00604 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
0060c 0f83fe140000                   jae        0x7f56afbdb310
00612 458d5510                       lea        r10d, [r13 + 0x10]
00616 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0061e 4d63d5                         movsxd     r10, r13d
00621 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00626 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0062d 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00635 443bc3                         cmp        r8d, ebx
00638 0f8dc6000000                   jge        0x7f56afbd9f04
0063e 4d2bda                         sub        r11, r10
00641 4d63c8                         movsxd     r9, r8d
00644 4f8d1419                       lea        r10, [r9 + r11]
00648 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00650 0f8392150000                   jae        0x7f56afbdb3e8
00656 4c63d3                         movsxd     r10, ebx
00659 4d2bd1                         sub        r10, r9
0065c 4983c20f                       add        r10, 0xf
00660 4983e2f0                       and        r10, 0xfffffffffffffff0
00664 458bd2                         mov        r10d, r10d
00667 478d542a10                     lea        r10d, [r10 + r13 + 0x10]
0066c 4d63d2                         movsxd     r10, r10d
0066f 4f8d5c1af0                     lea        r11, [r10 + r11 - 0x10]
00674 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
0067c 0f8366150000                   jae        0x7f56afbdb3e8
00682 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0068a 0f8358150000                   jae        0x7f56afbdb3e8
00690 4983c2f0                       add        r10, -0x10
00694 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0069c 0f8346150000                   jae        0x7f56afbdb3e8
006a2 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
006a8 0f8fde150000                   jg         0x7f56afbdb48c
006ae 448bd9                         mov        r11d, ecx
006b1 452bdd                         sub        r11d, r13d
006b4 90                             nop        
006b5 90                             nop        
006b6 90                             nop        
006b7 90                             nop        
006b8 90                             nop        
006b9 90                             nop        
006ba 90                             nop        
006bb 90                             nop        
006bc 90                             nop        
006bd 90                             nop        
006be 90                             nop        
006bf 90                             nop        
006c0 458bd3                         mov        r10d, r11d
006c3 4403942488000000               add        r10d, dword ptr [rsp + 0x88]
006cb 4c8b442408                     mov        r8, qword ptr [rsp + 8]
006d0 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
006d7 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
006df 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006e4 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
006eb 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
006f3 4183c210                       add        r10d, 0x10
006f7 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
006ff 443bd3                         cmp        r10d, ebx
00702 7cbc                           jl         0x7f56afbd9ec0
00704 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00709 4403d1                         add        r10d, ecx
0070c 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00714 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0071b e930fdffff                     jmp        0x7f56afbd9c50
00720 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00725 4585c0                         test       r8d, r8d
00728 7407                           je         0x7f56afbd9f31
0072a 448d5bff                       lea        r11d, [rbx - 1]
0072e 418bdb                         mov        ebx, r11d
00731 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00736 418b4b08                       mov        ecx, dword ptr [r11 + 8]
0073a 85db                           test       ebx, ebx
0073c 7479                           je         0x7f56afbd9fb7
0073e 83fb03                         cmp        ebx, 3
00741 0f84980b0000                   je         0x7f56afbdaadf
00747 83fb02                         cmp        ebx, 2
0074a 7777                           ja         0x7f56afbd9fc3
0074c 3b5c244c                       cmp        ebx, dword ptr [rsp + 0x4c]
00750 0f83e2160000                   jae        0x7f56afbdb638
00756 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0075b 418b4c9b08                     mov        ecx, dword ptr [r11 + rbx*4 + 8]
00760 85db                           test       ebx, ebx
00762 7e4a                           jle        0x7f56afbd9fae
00764 448d5bff                       lea        r11d, [rbx - 1]
00768 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0076d 0f83e1190000                   jae        0x7f56afbdb954
00773 4c63c3                         movsxd     r8, ebx
00776 4533c9                         xor        r9d, r9d
00779 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0077e 458bd2                         mov        r10d, r10d
00781 4183c2cc                       add        r10d, -0x34
00785 41c1ea02                       shr        r10d, 2
00789 458d5c1aff                     lea        r11d, [r10 + rbx - 1]
0078e 41ba04000000                   mov        r10d, 4
00794 c442a8f5d3                     bzhi       r10, r11, r10
00799 4d2bc2                         sub        r8, r10
0079c 49ffc8                         dec        r8
0079f 4d85c0                         test       r8, r8
007a2 4d0f4cc1                       cmovl      r8, r9
007a6 458bc0                         mov        r8d, r8d
007a9 e9a5060000                     jmp        0x7f56afbda653
007ae 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
007b3 41894a08                       mov        dword ptr [r10 + 8], ecx
007b7 898c24a4000000                 mov        dword ptr [rsp + 0xa4], ecx
007be e9acfbffff                     jmp        0x7f56afbd9b6f
007c3 48bea82574e200000000           movabs     rsi, 0xe27425a8
007cd 418bed                         mov        ebp, r13d
007d0 c5f877                         vzeroupper 
007d3 e8885cb5ff                     call       0x7f56af72fc60
007d8 0f1f8400d0080002               nop        dword ptr [rax + rax + 0x20008d0]
007e0 4885c0                         test       rax, rax
007e3 0f8467170000                   je         0x7f56afbdb750
007e9 488bf0                         mov        rsi, rax
007ec c5f877                         vzeroupper 
007ef 4881c4f0000000                 add        rsp, 0xf0
007f6 5d                             pop        rbp
007f7 e964f3aeff                     jmp        0x7f56af6c9360
007fc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00804 4503da                         add        r11d, r10d
00807 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0080f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00817 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0081c 0f8dda020000                   jge        0x7f56afbda2fc
00822 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0082a 4183c308                       add        r11d, 8
0082e 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00833 4183fa08                       cmp        r10d, 8
00837 0f8da4010000                   jge        0x7f56afbda1e1
0083d 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00845 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0084d 0f83b11c0000                   jae        0x7f56afbdbd04
00853 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00858 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
0085e 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00866 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0086e 0f83601d0000                   jae        0x7f56afbdbdd4
00874 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00879 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00881 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00886 4183c303                       add        r11d, 3
0088a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00892 41ffc2                         inc        r10d
00895 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0089d 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
008a5 0f839d1d0000                   jae        0x7f56afbdbe48
008ab 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
008b3 4183c303                       add        r11d, 3
008b7 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
008bf 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008c4 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
008ca 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
008d2 0f83f41d0000                   jae        0x7f56afbdbecc
008d8 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008e0 43886c1809                     mov        byte ptr [r8 + r11 + 9], bpl
008e5 470fbe44100a                   movsx      r8d, byte ptr [r8 + r10 + 0xa]
008eb 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008f0 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
008f5 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
008fb 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
00900 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00908 4183fb08                       cmp        r11d, 8
0090c 0f832e1e0000                   jae        0x7f56afbdbf40
00912 49bae85e72e200000000           movabs     r10, 0xe2725ee8
0091c 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
00924 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00929 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0092e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00933 4183fa04                       cmp        r10d, 4
00937 7e3f                           jle        0x7f56afbda178
00939 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00940 83c504                         add        ebp, 4
00943 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00948 418bd1                         mov        edx, r9d
0094b 90                             nop        
0094c c5f877                         vzeroupper 
0094f e80c5bb5ff                     call       0x7f56af72fc60
00954 0f1f84004c0a0003               nop        dword ptr [rax + rax + 0x3000a4c]
0095c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00961 8bd5                           mov        edx, ebp
00963 8bc8                           mov        ecx, eax
00965 90                             nop        
00966 90                             nop        
00967 90                             nop        
00968 c5f877                         vzeroupper 
0096b e8f05ab5ff                     call       0x7f56af72fc60
00970 0f1f8400680a0004               nop        dword ptr [rax + rax + 0x4000a68]
00978 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0097d 4183fa08                       cmp        r10d, 8
00981 7e51                           jle        0x7f56afbda1d4
00983 49ba105f72e200000000           movabs     r10, 0xe2725f10
0098d 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00991 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00999 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
0099e 83c208                         add        edx, 8
009a1 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009a6 90                             nop        
009a7 90                             nop        
009a8 c5f877                         vzeroupper 
009ab e8b05ab5ff                     call       0x7f56af72fc60
009b0 0f1f8400a80a0005               nop        dword ptr [rax + rax + 0x5000aa8]
009b8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009bd 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
009c1 488bc8                         mov        rcx, rax
009c4 c5f877                         vzeroupper 
009c7 e8945ab5ff                     call       0x7f56af72fc60
009cc 0f1f8400c40a0006               nop        dword ptr [rax + rax + 0x6000ac4]
009d4 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
009dc e9fffaffff                     jmp        0x7f56afbd9ce0
009e1 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009e6 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
009ed 90                             nop        
009ee 90                             nop        
009ef 90                             nop        
009f0 c5f877                         vzeroupper 
009f3 e8685ab5ff                     call       0x7f56af72fc60
009f8 0f1f8400f00a0007               nop        dword ptr [rax + rax + 0x7000af0]
00a00 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00a05 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00a0c 488bc8                         mov        rcx, rax
00a0f 90                             nop        
00a10 c5f877                         vzeroupper 
00a13 e8485ab5ff                     call       0x7f56af72fc60
00a18 0f1f8400100b0008               nop        dword ptr [rax + rax + 0x8000b10]
00a20 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a28 4183c208                       add        r10d, 8
00a2c 458bc2                         mov        r8d, r10d
00a2f be95ffffff                     mov        esi, 0xffffff95
00a34 488b2c24                       mov        rbp, qword ptr [rsp]
00a38 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00a3d 4c891424                       mov        qword ptr [rsp], r10
00a41 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a46 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a4b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a50 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a55 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a5a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a5f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a64 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a69 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a6e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a73 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a78 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00a7d 48ff742440                     push       qword ptr [rsp + 0x40]
00a82 488f442438                     pop        qword ptr [rsp + 0x38]
00a87 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00a8c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00a91 48ff742450                     push       qword ptr [rsp + 0x50]
00a96 488f442448                     pop        qword ptr [rsp + 0x48]
00a9b 48ff742458                     push       qword ptr [rsp + 0x58]
00aa0 488f442450                     pop        qword ptr [rsp + 0x50]
00aa5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00aaa 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00aaf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ab4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00ab9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00abe 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00ac3 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00acb 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00ad0 458bda                         mov        r11d, r10d
00ad3 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ad8 c5f877                         vzeroupper 
00adb e88037afff                     call       0x7f56af6cda60
00ae0 0f1f8400d80b0009               nop        dword ptr [rax + rax + 0x9000bd8]
00ae8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
00af2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00af6 e8e561c417                     call       0x7f56c78204e0
00afb f4                             hlt        
00afc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b01 4183fb30                       cmp        r11d, 0x30
00b05 0f8f14020000                   jg         0x7f56afbda51f
00b0b 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00b12 83c5f9                         add        ebp, -7
00b15 89ac24a4000000                 mov        dword ptr [rsp + 0xa4], ebp
00b1c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00b24 443bd5                         cmp        r10d, ebp
00b27 0f83a7140000                   jae        0x7f56afbdb7d4
00b2d 418bea                         mov        ebp, r10d
00b30 89ac24b4000000                 mov        dword ptr [rsp + 0xb4], ebp
00b37 4863ed                         movsxd     rbp, ebp
00b3a 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00b42 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b47 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00b4c 4889ac24c8000000               mov        qword ptr [rsp + 0xc8], rbp
00b54 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b5c 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
00b64 0f8306150000                   jae        0x7f56afbdb870
00b6a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b72 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00b7a 4963eb                         movsxd     rbp, r11d
00b7d 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
00b85 488d4d08                       lea        rcx, [rbp + 8]
00b89 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00b93 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00b98 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00ba0 4533c9                         xor        r9d, r9d
00ba3 90                             nop        
00ba4 c5f877                         vzeroupper 
00ba7 e8b44eb5ff                     call       0x7f56af72f260
00bac 0f1f8400a40c000a               nop        dword ptr [rax + rax + 0xa000ca4]
00bb4 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00bbc 4183c208                       add        r10d, 8
00bc0 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00bc8 458bca                         mov        r9d, r10d
00bcb 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00bd3 0f8d34010000                   jge        0x7f56afbda50d
00bd9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00be1 482bac24d0000000               sub        rbp, qword ptr [rsp + 0xd0]
00be9 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00bf1 4983c3f9                       add        r11, -7
00bf5 4d63c2                         movsxd     r8, r10d
00bf8 4d8d1428                       lea        r10, [r8 + rbp]
00bfc 4d3bd3                         cmp        r10, r11
00bff 0f83bb160000                   jae        0x7f56afbdbac0
00c05 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00c0d 4d2bd0                         sub        r10, r8
00c10 4983c207                       add        r10, 7
00c14 4983e2f8                       and        r10, 0xfffffffffffffff8
00c18 458bd2                         mov        r10d, r10d
00c1b 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00c23 478d440208                     lea        r8d, [r10 + r8 + 8]
00c28 4d63d0                         movsxd     r10, r8d
00c2b 4d8d442af8                     lea        r8, [r10 + rbp - 8]
00c30 4d3bc3                         cmp        r8, r11
00c33 0f8387160000                   jae        0x7f56afbdbac0
00c39 443b8c24a4000000               cmp        r9d, dword ptr [rsp + 0xa4]
00c41 0f8379160000                   jae        0x7f56afbdbac0
00c47 4983c2f8                       add        r10, -8
00c4b 4d3bd3                         cmp        r10, r11
00c4e 0f836c160000                   jae        0x7f56afbdbac0
00c54 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c5c 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00c63 0f8f33170000                   jg         0x7f56afbdbb9c
00c69 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00c70 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
00c77 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00c7b 90                             nop        
00c7c 90                             nop        
00c7d 90                             nop        
00c7e 90                             nop        
00c7f 90                             nop        
00c80 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c88 4963cb                         movsxd     rcx, r11d
00c8b 4883c108                       add        rcx, 8
00c8f 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00c93 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00c9a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00c9f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ca4 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00cae 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00cb3 4533c9                         xor        r9d, r9d
00cb6 90                             nop        
00cb7 90                             nop        
00cb8 c5f877                         vzeroupper 
00cbb e8a04db5ff                     call       0x7f56af72f260
00cc0 0f1f8400b80d000b               nop        dword ptr [rax + rax + 0xb000db8]
00cc8 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
00cd0 4183c208                       add        r10d, 8
00cd4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00cdc 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00ce4 7c9a                           jl         0x7f56afbda480
00ce6 eb25                           jmp        0x7f56afbda50d
00ce8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00ced 4d63d2                         movsxd     r10, r10d
00cf0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cf7 c442a8f5db                     bzhi       r11, r11, r10
00cfc c4c1fb92fb                     kmovq      k7, r11
00d01 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d07 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d0d 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00d15 44036c2478                     add        r13d, dword ptr [rsp + 0x78]
00d1a e9c1f7ffff                     jmp        0x7f56afbd9ce0
00d1f 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00d27 4585d2                         test       r10d, r10d
00d2a 0f8cbc130000                   jl         0x7f56afbdb8ec
00d30 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d38 4585db                         test       r11d, r11d
00d3b 0f8cab130000                   jl         0x7f56afbdb8ec
00d41 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d46 4503da                         add        r11d, r10d
00d49 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00d51 453bcb                         cmp        r9d, r11d
00d54 0f8292130000                   jb         0x7f56afbdb8ec
00d5a 458bd9                         mov        r11d, r9d
00d5d 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d65 0f8281130000                   jb         0x7f56afbdb8ec
00d6b 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00d70 4585c0                         test       r8d, r8d
00d73 7498                           je         0x7f56afbda50d
00d75 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d7a 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00d82 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00d87 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00d8c 4883fd20                       cmp        rbp, 0x20
00d90 0f8652ffffff                   jbe        0x7f56afbda4e8
00d96 488bd5                         mov        rdx, rbp
00d99 c5f877                         vzeroupper 
00d9c 49ba409171af567f0000           movabs     r10, 0x7f56af719140
00da6 41ffd2                         call       r10
00da9 0f1f840000000000               nop        dword ptr [rax + rax]
00db1 e957ffffff                     jmp        0x7f56afbda50d
00db6 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00dbb 4d63d2                         movsxd     r10, r10d
00dbe 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dc5 c442a8f5db                     bzhi       r11, r11, r10
00dca c4c1fb92fb                     kmovq      k7, r11
00dcf 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dd5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ddb eb66                           jmp        0x7f56afbda643
00ddd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00de2 4585db                         test       r11d, r11d
00de5 0f8c91110000                   jl         0x7f56afbdb77c
00deb 4585ed                         test       r13d, r13d
00dee 0f8c88110000                   jl         0x7f56afbdb77c
00df4 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00df9 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00e01 0f8275110000                   jb         0x7f56afbdb77c
00e07 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00e0f 443bd3                         cmp        r10d, ebx
00e12 0f8264110000                   jb         0x7f56afbdb77c
00e18 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00e1d 4585db                         test       r11d, r11d
00e20 7421                           je         0x7f56afbda643
00e22 4983f920                       cmp        r9, 0x20
00e26 768e                           jbe        0x7f56afbda5b6
00e28 498bd1                         mov        rdx, r9
00e2b c5f877                         vzeroupper 
00e2e 49ba409171af567f0000           movabs     r10, 0x7f56af719140
00e38 41ffd2                         call       r10
00e3b 0f1f840000000000               nop        dword ptr [rax + rax]
00e43 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00e4a e901f6ffff                     jmp        0x7f56afbd9c50
00e4f 90                             nop        
00e50 418bdb                         mov        ebx, r11d
00e53 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00e58 458b549b04                     mov        r10d, dword ptr [r11 + rbx*4 + 4]
00e5d 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00e62 4589549908                     mov        dword ptr [r9 + rbx*4 + 8], r10d
00e67 448d5bff                       lea        r11d, [rbx - 1]
00e6b 453bd8                         cmp        r11d, r8d
00e6e 7fe0                           jg         0x7f56afbda650
00e70 4c634c244c                     movsxd     r9, dword ptr [rsp + 0x4c]
00e75 4183fb3f                       cmp        r11d, 0x3f
00e79 0f8e0b010000                   jle        0x7f56afbda78a
00e7f 4c63d3                         movsxd     r10, ebx
00e82 4983c2fe                       add        r10, -2
00e86 4d3bd1                         cmp        r10, r9
00e89 0f83e1130000                   jae        0x7f56afbdba70
00e8f 448d53bf                       lea        r10d, [rbx - 0x41]
00e93 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00e98 0f83e6130000                   jae        0x7f56afbdba84
00e9e 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00ea3 0f83ef130000                   jae        0x7f56afbdba98
00ea9 448d5bc0                       lea        r11d, [rbx - 0x40]
00ead 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00eb2 0f83f4130000                   jae        0x7f56afbdbaac
00eb8 448bd3                         mov        r10d, ebx
00ebb 41ffca                         dec        r10d
00ebe 418bda                         mov        ebx, r10d
00ec1 eb10                           jmp        0x7f56afbda6d3
00ec3 90                             nop        
00ec4 90                             nop        
00ec5 90                             nop        
00ec6 90                             nop        
00ec7 90                             nop        
00ec8 90                             nop        
00ec9 90                             nop        
00eca 90                             nop        
00ecb 90                             nop        
00ecc 90                             nop        
00ecd 90                             nop        
00ece 90                             nop        
00ecf 90                             nop        
00ed0 418bdb                         mov        ebx, r11d
00ed3 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00ed8 62d17e486f849bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 - 0x38]
00ee3 62d17e487f849bccffffff         vmovdqu32  zmmword ptr [r11 + rbx*4 - 0x34], zmm0
00eee 62d17e486f849b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 - 0x78]
00ef9 62d17e487f849b8cffffff         vmovdqu32  zmmword ptr [r11 + rbx*4 - 0x74], zmm0
00f04 62d17e486f849b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 - 0xb8]
00f0f 62d17e487f849b4cffffff         vmovdqu32  zmmword ptr [r11 + rbx*4 - 0xb4], zmm0
00f1a 62d17e486f849b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 - 0xf8]
00f25 62d17e487f849b0cffffff         vmovdqu32  zmmword ptr [r11 + rbx*4 - 0xf4], zmm0
00f30 448d5bc0                       lea        r11d, [rbx - 0x40]
00f34 4183fb3f                       cmp        r11d, 0x3f
00f38 7f96                           jg         0x7f56afbda6d0
00f3a 4183fb0f                       cmp        r11d, 0xf
00f3e 7e4a                           jle        0x7f56afbda78a
00f40 448bd3                         mov        r10d, ebx
00f43 458d42b0                       lea        r8d, [r10 - 0x50]
00f47 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00f4c 0f83b2180000                   jae        0x7f56afbdc004
00f52 4183c2b1                       add        r10d, -0x4f
00f56 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00f5b 0f83cb180000                   jae        0x7f56afbdc02c
00f61 83c3c0                         add        ebx, -0x40
00f64 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00f69 62d17e486f849ac8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + rbx*4 - 0x38]
00f74 62d17e487f849accffffff         vmovdqu32  zmmword ptr [r10 + rbx*4 - 0x34], zmm0
00f7f 83c3f0                         add        ebx, -0x10
00f82 83fb0f                         cmp        ebx, 0xf
00f85 7fdd                           jg         0x7f56afbda764
00f87 448bdb                         mov        r11d, ebx
00f8a 4585db                         test       r11d, r11d
00f8d 0f8e1bf8ffff                   jle        0x7f56afbd9fae
00f93 4d63d3                         movsxd     r10, r11d
00f96 49ffca                         dec        r10
00f99 4d3bd1                         cmp        r10, r9
00f9c 0f834e180000                   jae        0x7f56afbdbff0
00fa2 458bd3                         mov        r10d, r11d
00fa5 458d4aff                       lea        r9d, [r10 - 1]
00fa9 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
00fae 0f8364180000                   jae        0x7f56afbdc018
00fb4 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00fb9 0f8381180000                   jae        0x7f56afbdc040
00fbf 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00fc4 0f838a180000                   jae        0x7f56afbdc054
00fca 90                             nop        
00fcb 90                             nop        
00fcc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00fd1 478b449a04                     mov        r8d, dword ptr [r10 + r11*4 + 4]
00fd6 4789449a08                     mov        dword ptr [r10 + r11*4 + 8], r8d
00fdb 41ffcb                         dec        r11d
00fde 4585db                         test       r11d, r11d
00fe1 7fe9                           jg         0x7f56afbda7cc
00fe3 e9c6f7ffff                     jmp        0x7f56afbd9fae
00fe8 4d63d1                         movsxd     r10, r9d
00feb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ff2 c442a8f5db                     bzhi       r11, r11, r10
00ff7 c4c1fb92fb                     kmovq      k7, r11
00ffc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01002 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01008 eb72                           jmp        0x7f56afbda87c
0100a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0100f 4585d2                         test       r10d, r10d
01012 0f8c50180000                   jl         0x7f56afbdc068
01018 4585ed                         test       r13d, r13d
0101b 0f8c47180000                   jl         0x7f56afbdc068
01021 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01026 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
0102b 0f8237180000                   jb         0x7f56afbdc068
01031 438d2c29                       lea        ebp, [r9 + r13]
01035 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0103d 443bd5                         cmp        r10d, ebp
01040 0f8222180000                   jb         0x7f56afbdc068
01046 4585c9                         test       r9d, r9d
01049 0f8c19180000                   jl         0x7f56afbdc068
0104f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01054 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
01059 7421                           je         0x7f56afbda87c
0105b 4963d1                         movsxd     rdx, r9d
0105e 4883fa20                       cmp        rdx, 0x20
01062 7684                           jbe        0x7f56afbda7e8
01064 c5f877                         vzeroupper 
01067 49ba409171af567f0000           movabs     r10, 0x7f56af719140
01071 41ffd2                         call       r10
01074 0f1f840000000000               nop        dword ptr [rax + rax]
0107c 4c8b1424                       mov        r10, qword ptr [rsp]
01080 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01084 c5f877                         vzeroupper 
01087 4881c4f0000000                 add        rsp, 0xf0
0108e 5d                             pop        rbp
0108f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01093 0f87471a0000                   ja         0x7f56afbdc2e0
01099 c3                             ret        
0109a 4d63d2                         movsxd     r10, r10d
0109d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010a4 c442a8f5db                     bzhi       r11, r11, r10
010a9 c4c1fb92fb                     kmovq      k7, r11
010ae 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010b4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010ba eb74                           jmp        0x7f56afbda930
010bc 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
010c1 4585db                         test       r11d, r11d
010c4 0f84ab030000                   je         0x7f56afbdac75
010ca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
010cf 4585db                         test       r11d, r11d
010d2 0f8cc8170000                   jl         0x7f56afbdc0a0
010d8 4585ed                         test       r13d, r13d
010db 0f8cbf170000                   jl         0x7f56afbdc0a0
010e1 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
010e6 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
010ee 0f82ac170000                   jb         0x7f56afbdc0a0
010f4 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
010fc 443bdb                         cmp        r11d, ebx
010ff 0f829b170000                   jb         0x7f56afbdc0a0
01105 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0110a 4585d2                         test       r10d, r10d
0110d 7421                           je         0x7f56afbda930
0110f 4983f920                       cmp        r9, 0x20
01113 7685                           jbe        0x7f56afbda89a
01115 498bd1                         mov        rdx, r9
01118 c5f877                         vzeroupper 
0111b 49ba409171af567f0000           movabs     r10, 0x7f56af719140
01125 41ffd2                         call       r10
01128 0f1f840000000000               nop        dword ptr [rax + rax]
01130 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01135 4585db                         test       r11d, r11d
01138 0f8e96010000                   jle        0x7f56afbdaad4
0113e 448bd3                         mov        r10d, ebx
01141 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
01149 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01151 458d341b                       lea        r14d, [r11 + rbx]
01155 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0115a 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01162 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
01167 498d741a08                     lea        rsi, [r10 + rbx + 8]
0116c 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01174 453bd3                         cmp        r10d, r11d
01177 0f8dd2000000                   jge        0x7f56afbdaa4f
0117d 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
01185 458bd3                         mov        r10d, r11d
01188 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
01190 450f4fd1                       cmovg      r10d, r9d
01194 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0119c 4585c0                         test       r8d, r8d
0119f 0f8c7b170000                   jl         0x7f56afbdc120
011a5 85db                           test       ebx, ebx
011a7 0f8c73170000                   jl         0x7f56afbdc120
011ad 478d1c10                       lea        r11d, [r8 + r10]
011b1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
011b9 453bd3                         cmp        r10d, r11d
011bc 0f825e170000                   jb         0x7f56afbdc120
011c2 448bdb                         mov        r11d, ebx
011c5 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
011cd 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
011d5 453bd3                         cmp        r10d, r11d
011d8 0f8242170000                   jb         0x7f56afbdc120
011de 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
011e6 4585db                         test       r11d, r11d
011e9 0f8c31170000                   jl         0x7f56afbdc120
011ef 4585db                         test       r11d, r11d
011f2 7429                           je         0x7f56afbdaa1d
011f4 4963d3                         movsxd     rdx, r11d
011f7 4883fa20                       cmp        rdx, 0x20
011fb 7738                           ja         0x7f56afbdaa35
011fd 4d63d3                         movsxd     r10, r11d
01200 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01207 c442a8f5db                     bzhi       r11, r11, r10
0120c c4c1fb92fb                     kmovq      k7, r11
01211 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01217 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0121d 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01225 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0122a 0f8c78010000                   jl         0x7f56afbdaba8
01230 e9a2000000                     jmp        0x7f56afbdaad7
01235 c5f877                         vzeroupper 
01238 49ba409171af567f0000           movabs     r10, 0x7f56af719140
01242 41ffd2                         call       r10
01245 0f1f840000000000               nop        dword ptr [rax + rax]
0124d ebce                           jmp        0x7f56afbdaa1d
0124f 4585c0                         test       r8d, r8d
01252 0f8c90170000                   jl         0x7f56afbdc1e8
01258 85db                           test       ebx, ebx
0125a 0f8c88170000                   jl         0x7f56afbdc1e8
01260 4503d8                         add        r11d, r8d
01263 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0126b 453bd3                         cmp        r10d, r11d
0126e 0f8274170000                   jb         0x7f56afbdc1e8
01274 458bda                         mov        r11d, r10d
01277 453bde                         cmp        r11d, r14d
0127a 0f8268170000                   jb         0x7f56afbdc1e8
01280 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01285 4585d2                         test       r10d, r10d
01288 744d                           je         0x7f56afbdaad7
0128a 4883fd20                       cmp        rbp, 0x20
0128e 7727                           ja         0x7f56afbdaab7
01290 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01295 4d63d3                         movsxd     r10, r11d
01298 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0129f c442a8f5db                     bzhi       r11, r11, r10
012a4 c4c1fb92fb                     kmovq      k7, r11
012a9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012af 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012b5 eb20                           jmp        0x7f56afbdaad7
012b7 488bd5                         mov        rdx, rbp
012ba c5f877                         vzeroupper 
012bd 49ba409171af567f0000           movabs     r10, 0x7f56af719140
012c7 41ffd2                         call       r10
012ca 0f1f840000000000               nop        dword ptr [rax + rax]
012d2 eb03                           jmp        0x7f56afbdaad7
012d4 448bf3                         mov        r14d, ebx
012d7 458bee                         mov        r13d, r14d
012da e901f2ffff                     jmp        0x7f56afbd9ce0
012df ffc9                           dec        ecx
012e1 85c9                           test       ecx, ecx
012e3 7e1a                           jle        0x7f56afbdaaff
012e5 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
012ea 45895310                       mov        dword ptr [r11 + 0x10], r10d
012ee 458b5308                       mov        r10d, dword ptr [r11 + 8]
012f2 4589530c                       mov        dword ptr [r11 + 0xc], r10d
012f6 41894b08                       mov        dword ptr [r11 + 8], ecx
012fa e9b8f4ffff                     jmp        0x7f56afbd9fb7
012ff 48be782574e200000000           movabs     rsi, 0xe2742578
01309 418bed                         mov        ebp, r13d
0130c c5f877                         vzeroupper 
0130f e84c51b5ff                     call       0x7f56af72fc60
01314 0f1f84000c14000c               nop        dword ptr [rax + rax + 0xc00140c]
0131c 4885c0                         test       rax, rax
0131f 0f85c4f4ffff                   jne        0x7f56afbd9fe9
01325 bef6ffffff                     mov        esi, 0xfffffff6
0132a 90                             nop        
0132b 90                             nop        
0132c c5f877                         vzeroupper 
0132f e82c2fafff                     call       0x7f56af6cda60
01334 0f1f84002c14000d               nop        dword ptr [rax + rax + 0xd00142c]
0133c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01346 4883e4f0                       and        rsp, 0xfffffffffffffff0
0134a e89159c417                     call       0x7f56c78204e0
0134f f4                             hlt        
01350 448bd5                         mov        r10d, ebp
01353 4d63d2                         movsxd     r10, r10d
01356 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0135d c442a8f5db                     bzhi       r11, r11, r10
01362 c4c1fb92fb                     kmovq      k7, r11
01367 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0136d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01373 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0137b 4403d5                         add        r10d, ebp
0137e 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
01386 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0138a 418502                         test       dword ptr [r10], eax
0138d 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01395 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0139a 0f8d37ffffff                   jge        0x7f56afbdaad7
013a0 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
013a8 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
013b0 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
013b8 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
013c0 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
013c4 2bac24a4000000                 sub        ebp, dword ptr [rsp + 0xa4]
013cb 3bac24a4000000                 cmp        ebp, dword ptr [rsp + 0xa4]
013d2 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
013da 410f4fea                       cmovg      ebp, r10d
013de 458bc3                         mov        r8d, r11d
013e1 4585db                         test       r11d, r11d
013e4 0f8c8e100000                   jl         0x7f56afbdbc78
013ea 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
013f2 4585d2                         test       r10d, r10d
013f5 0f8c7d100000                   jl         0x7f56afbdbc78
013fb 458d1c28                       lea        r11d, [r8 + rbp]
013ff 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01407 453bcb                         cmp        r9d, r11d
0140a 0f8268100000                   jb         0x7f56afbdbc78
01410 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
01418 4403ed                         add        r13d, ebp
0141b 453bcd                         cmp        r9d, r13d
0141e 0f8254100000                   jb         0x7f56afbdbc78
01424 85ed                           test       ebp, ebp
01426 0f8c4c100000                   jl         0x7f56afbdbc78
0142c 85ed                           test       ebp, ebp
0142e 0f843fffffff                   je         0x7f56afbdab73
01434 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01439 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0143e 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
01446 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0144b 4863d5                         movsxd     rdx, ebp
0144e 4883fa20                       cmp        rdx, 0x20
01452 0f86f8feffff                   jbe        0x7f56afbdab50
01458 c5f877                         vzeroupper 
0145b 49ba409171af567f0000           movabs     r10, 0x7f56af719140
01465 41ffd2                         call       r10
01468 0f1f840000000000               nop        dword ptr [rax + rax]
01470 e9fefeffff                     jmp        0x7f56afbdab73
01475 418bdd                         mov        ebx, r13d
01478 e9b3fcffff                     jmp        0x7f56afbda930
0147d bee4ffffff                     mov        esi, 0xffffffe4
01482 488b2c24                       mov        rbp, qword ptr [rsp]
01486 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0148b 4c891424                       mov        qword ptr [rsp], r10
0148f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01494 4489542408                     mov        dword ptr [rsp + 8], r10d
01499 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0149e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014a3 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
014a8 c5f877                         vzeroupper 
014ab e8b02dafff                     call       0x7f56af6cda60
014b0 0f1f8400a815000f               nop        dword ptr [rax + rax + 0xf0015a8]
014b8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
014c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
014c6 e81558c417                     call       0x7f56c78204e0
014cb f4                             hlt        
014cc bee4ffffff                     mov        esi, 0xffffffe4
014d1 488b2c24                       mov        rbp, qword ptr [rsp]
014d5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014da 4c891424                       mov        qword ptr [rsp], r10
014de 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014e3 44895c2408                     mov        dword ptr [rsp + 8], r11d
014e8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
014ed 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014fc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01501 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01506 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0150b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01510 c5f877                         vzeroupper 
01513 e8482dafff                     call       0x7f56af6cda60
01518 0f1f840010160010               nop        dword ptr [rax + rax + 0x10001610]
01520 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0152a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0152e e8ad57c417                     call       0x7f56c78204e0
01533 f4                             hlt        
01534 bee4ffffff                     mov        esi, 0xffffffe4
01539 488b2c24                       mov        rbp, qword ptr [rsp]
0153d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01542 4c891424                       mov        qword ptr [rsp], r10
01546 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0154b 4489542408                     mov        dword ptr [rsp + 8], r10d
01550 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01555 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0155a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0155f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01564 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01569 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0156e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01573 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01578 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01580 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01585 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0158e 90                             nop        
0158f 90                             nop        
01590 c5f877                         vzeroupper 
01593 e8c82cafff                     call       0x7f56af6cda60
01598 0f1f840090160011               nop        dword ptr [rax + rax + 0x11001690]
015a0 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
015aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ae e82d57c417                     call       0x7f56c78204e0
015b3 f4                             hlt        
015b4 bee4ffffff                     mov        esi, 0xffffffe4
015b9 488b2c24                       mov        rbp, qword ptr [rsp]
015bd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015c2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015c7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
015cc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
015d1 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
015d6 48894424f8                     mov        qword ptr [rsp - 8], rax
015db 8b442478                       mov        eax, dword ptr [rsp + 0x78]
015df 89442470                       mov        dword ptr [rsp + 0x70], eax
015e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e8 c5f877                         vzeroupper 
015eb e8702cafff                     call       0x7f56af6cda60
015f0 0f1f8400e8160012               nop        dword ptr [rax + rax + 0x120016e8]
015f8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01602 4883e4f0                       and        rsp, 0xfffffffffffffff0
01606 e8d556c417                     call       0x7f56c78204e0
0160b f4                             hlt        
0160c bee4ffffff                     mov        esi, 0xffffffe4
01611 488b2c24                       mov        rbp, qword ptr [rsp]
01615 4c891c24                       mov        qword ptr [rsp], r11
01619 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0161e 4489542408                     mov        dword ptr [rsp + 8], r10d
01623 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01628 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0162d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01632 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01637 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0163c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01641 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01646 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0164b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01650 48894424f8                     mov        qword ptr [rsp - 8], rax
01655 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01659 89442470                       mov        dword ptr [rsp + 0x70], eax
0165d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01662 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01667 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01670 c5f877                         vzeroupper 
01673 e8e82bafff                     call       0x7f56af6cda60
01678 0f1f840070170013               nop        dword ptr [rax + rax + 0x13001770]
01680 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0168a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0168e e84d56c417                     call       0x7f56c78204e0
01693 f4                             hlt        
01694 be45ffffff                     mov        esi, 0xffffff45
01699 488b2c24                       mov        rbp, qword ptr [rsp]
0169d 4c89442408                     mov        qword ptr [rsp + 8], r8
016a2 90                             nop        
016a3 90                             nop        
016a4 c5f877                         vzeroupper 
016a7 e8b42bafff                     call       0x7f56af6cda60
016ac 0f1f8400a4170014               nop        dword ptr [rax + rax + 0x140017a4]
016b4 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
016be 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c2 e81956c417                     call       0x7f56c78204e0
016c7 f4                             hlt        
016c8 be45ffffff                     mov        esi, 0xffffff45
016cd 488b2c24                       mov        rbp, qword ptr [rsp]
016d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016d6 4c891424                       mov        qword ptr [rsp], r10
016da 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016df 4489542408                     mov        dword ptr [rsp + 8], r10d
016e4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
016e9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016ee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016f3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016fd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01702 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01707 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0170c 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01711 48894424f8                     mov        qword ptr [rsp - 8], rax
01716 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0171a 89442434                       mov        dword ptr [rsp + 0x34], eax
0171e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01723 48894424f8                     mov        qword ptr [rsp - 8], rax
01728 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0172c 89442438                       mov        dword ptr [rsp + 0x38], eax
01730 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01735 48894424f8                     mov        qword ptr [rsp - 8], rax
0173a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0173e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01742 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01747 48ff742450                     push       qword ptr [rsp + 0x50]
0174c 488f442448                     pop        qword ptr [rsp + 0x48]
01751 48ff742458                     push       qword ptr [rsp + 0x58]
01756 488f442450                     pop        qword ptr [rsp + 0x50]
0175b 48894424f8                     mov        qword ptr [rsp - 8], rax
01760 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01764 89442458                       mov        dword ptr [rsp + 0x58], eax
01768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176d 48894424f8                     mov        qword ptr [rsp - 8], rax
01772 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01776 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0177a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177f 48894424f8                     mov        qword ptr [rsp - 8], rax
01784 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01788 89442460                       mov        dword ptr [rsp + 0x60], eax
0178c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01791 48894424f8                     mov        qword ptr [rsp - 8], rax
01796 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0179a 89442464                       mov        dword ptr [rsp + 0x64], eax
0179e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a3 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
017a7 90                             nop        
017a8 c5f877                         vzeroupper 
017ab e8b02aafff                     call       0x7f56af6cda60
017b0 0f1f8400a8180015               nop        dword ptr [rax + rax + 0x150018a8]
017b8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
017c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017c6 e81555c417                     call       0x7f56c78204e0
017cb f4                             hlt        
017cc 4d3bd0                         cmp        r10, r8
017cf bdffffffff                     mov        ebp, 0xffffffff
017d4 7c08                           jl         0x7f56afbdafde
017d6 400f95c5                       setne      bpl
017da 400fb6ed                       movzx      ebp, bpl
017de be45ffffff                     mov        esi, 0xffffff45
017e3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017e8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017ed 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
017f2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017f7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
017fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01801 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01805 89442470                       mov        dword ptr [rsp + 0x70], eax
01809 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180e 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01813 90                             nop        
01814 c5f877                         vzeroupper 
01817 e8442aafff                     call       0x7f56af6cda60
0181c 0f1f840014190016               nop        dword ptr [rax + rax + 0x16001914]
01824 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0182e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01832 e8a954c417                     call       0x7f56c78204e0
01837 f4                             hlt        
01838 be45ffffff                     mov        esi, 0xffffff45
0183d 488b2c24                       mov        rbp, qword ptr [rsp]
01841 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01846 4c891424                       mov        qword ptr [rsp], r10
0184a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0184f 4489542408                     mov        dword ptr [rsp + 8], r10d
01854 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01859 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0185e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01863 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01868 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0186d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01872 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01877 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0187c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01881 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01886 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0188b 48894424f8                     mov        qword ptr [rsp - 8], rax
01890 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01894 89442434                       mov        dword ptr [rsp + 0x34], eax
01898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189d 48894424f8                     mov        qword ptr [rsp - 8], rax
018a2 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
018a6 89442438                       mov        dword ptr [rsp + 0x38], eax
018aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018af 48894424f8                     mov        qword ptr [rsp - 8], rax
018b4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018b8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c1 48ff742450                     push       qword ptr [rsp + 0x50]
018c6 488f442448                     pop        qword ptr [rsp + 0x48]
018cb 48ff742458                     push       qword ptr [rsp + 0x58]
018d0 488f442450                     pop        qword ptr [rsp + 0x50]
018d5 48894424f8                     mov        qword ptr [rsp - 8], rax
018da 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018de 89442458                       mov        dword ptr [rsp + 0x58], eax
018e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e7 48894424f8                     mov        qword ptr [rsp - 8], rax
018ec 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018f0 89442460                       mov        dword ptr [rsp + 0x60], eax
018f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f9 48894424f8                     mov        qword ptr [rsp - 8], rax
018fe 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01902 89442468                       mov        dword ptr [rsp + 0x68], eax
01906 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e84c29afff                     call       0x7f56af6cda60
01914 0f1f84000c1a0017               nop        dword ptr [rax + rax + 0x17001a0c]
0191c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e8b153c417                     call       0x7f56c78204e0
0192f f4                             hlt        
01930 be45ffffff                     mov        esi, 0xffffff45
01935 488b2c24                       mov        rbp, qword ptr [rsp]
01939 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0193e 4c891424                       mov        qword ptr [rsp], r10
01942 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01947 44895c2408                     mov        dword ptr [rsp + 8], r11d
0194c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01951 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01956 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0195b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01960 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01965 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0196a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0196f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01974 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01979 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0197e 48894424f8                     mov        qword ptr [rsp - 8], rax
01983 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01987 89442438                       mov        dword ptr [rsp + 0x38], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48894424f8                     mov        qword ptr [rsp - 8], rax
01995 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01999 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0199d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a2 48ff742450                     push       qword ptr [rsp + 0x50]
019a7 488f442448                     pop        qword ptr [rsp + 0x48]
019ac 48ff742458                     push       qword ptr [rsp + 0x58]
019b1 488f442450                     pop        qword ptr [rsp + 0x50]
019b6 48894424f8                     mov        qword ptr [rsp - 8], rax
019bb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019bf 89442458                       mov        dword ptr [rsp + 0x58], eax
019c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c8 48894424f8                     mov        qword ptr [rsp - 8], rax
019cd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019d1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019da 48894424f8                     mov        qword ptr [rsp - 8], rax
019df 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019e3 89442460                       mov        dword ptr [rsp + 0x60], eax
019e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ec 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
019f1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
019f6 90                             nop        
019f7 90                             nop        
019f8 c5f877                         vzeroupper 
019fb e86028afff                     call       0x7f56af6cda60
01a00 0f1f8400f81a0018               nop        dword ptr [rax + rax + 0x18001af8]
01a08 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01a12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a16 e8c552c417                     call       0x7f56c78204e0
01a1b f4                             hlt        
01a1c 4533d2                         xor        r10d, r10d
01a1f 4c891424                       mov        qword ptr [rsp], r10
01a23 e925e7ffff                     jmp        0x7f56afbd994d
01a28 4533d2                         xor        r10d, r10d
01a2b 4c89542408                     mov        qword ptr [rsp + 8], r10
01a30 e946e7ffff                     jmp        0x7f56afbd997b
01a35 4533d2                         xor        r10d, r10d
01a38 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a3d e967e7ffff                     jmp        0x7f56afbd99a9
01a42 4533d2                         xor        r10d, r10d
01a45 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a4a e988e7ffff                     jmp        0x7f56afbd99d7
01a4f 4533d2                         xor        r10d, r10d
01a52 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01a57 e9a9e7ffff                     jmp        0x7f56afbd9a05
01a5c 4533d2                         xor        r10d, r10d
01a5f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a64 e9c7e7ffff                     jmp        0x7f56afbd9a30
01a69 bee4ffffff                     mov        esi, 0xffffffe4
01a6e 488b2c24                       mov        rbp, qword ptr [rsp]
01a72 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a77 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a7c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a81 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a86 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a8f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a98 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aa1 89442460                       mov        dword ptr [rsp + 0x60], eax
01aa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaa 48894424f8                     mov        qword ptr [rsp - 8], rax
01aaf 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ab3 89442464                       mov        dword ptr [rsp + 0x64], eax
01ab7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ac5 89442468                       mov        dword ptr [rsp + 0x68], eax
01ac9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ace 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ad7 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01adb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01ae4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01ae9 90                             nop        
01aea 90                             nop        
01aeb 90                             nop        
01aec c5f877                         vzeroupper 
01aef e86c27afff                     call       0x7f56af6cda60
01af4 0f1f8400ec1b0019               nop        dword ptr [rax + rax + 0x19001bec]
01afc 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0a e8d151c417                     call       0x7f56c78204e0
01b0f f4                             hlt        
01b10 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01b19 bee4ffffff                     mov        esi, 0xffffffe4
01b1e 488b2c24                       mov        rbp, qword ptr [rsp]
01b22 4c891424                       mov        qword ptr [rsp], r10
01b26 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b2b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b30 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01b35 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b3a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b3f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b44 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b49 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b4e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b53 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b58 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b61 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b73 89442460                       mov        dword ptr [rsp + 0x60], eax
01b77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b81 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b85 89442464                       mov        dword ptr [rsp + 0x64], eax
01b89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b93 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b97 89442468                       mov        dword ptr [rsp + 0x68], eax
01b9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ba9 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01bad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb2 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01bb6 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01bba 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01bc2 90                             nop        
01bc3 90                             nop        
01bc4 c5f877                         vzeroupper 
01bc7 e89426afff                     call       0x7f56af6cda60
01bcc 0f1f8400c41c001a               nop        dword ptr [rax + rax + 0x1a001cc4]
01bd4 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01bde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be2 e8f950c417                     call       0x7f56c78204e0
01be7 f4                             hlt        
01be8 8be9                           mov        ebp, ecx
01bea 83c510                         add        ebp, 0x10
01bed be6effffff                     mov        esi, 0xffffff6e
01bf2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bf7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01bfc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c01 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c06 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01c0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c13 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c21 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c25 89442460                       mov        dword ptr [rsp + 0x60], eax
01c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c33 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c37 89442464                       mov        dword ptr [rsp + 0x64], eax
01c3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c40 48894424f8                     mov        qword ptr [rsp - 8], rax
01c45 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c49 89442468                       mov        dword ptr [rsp + 0x68], eax
01c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c52 48894424f8                     mov        qword ptr [rsp - 8], rax
01c57 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c5b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c64 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01c68 c5f877                         vzeroupper 
01c6b e8f025afff                     call       0x7f56af6cda60
01c70 0f1f8400681d001b               nop        dword ptr [rax + rax + 0x1b001d68]
01c78 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c86 e85550c417                     call       0x7f56c78204e0
01c8b f4                             hlt        
01c8c 8be9                           mov        ebp, ecx
01c8e 83c510                         add        ebp, 0x10
01c91 be66ffffff                     mov        esi, 0xffffff66
01c96 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c9b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ca0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ca5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01caa 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01cae 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cb7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01cbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cc9 89442460                       mov        dword ptr [rsp + 0x60], eax
01ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cdb 89442464                       mov        dword ptr [rsp + 0x64], eax
01cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ced 89442468                       mov        dword ptr [rsp + 0x68], eax
01cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01cff 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01d03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d08 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01d0c c5f877                         vzeroupper 
01d0f e84c25afff                     call       0x7f56af6cda60
01d14 0f1f84000c1e001c               nop        dword ptr [rax + rax + 0x1c001e0c]
01d1c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d2a e8b14fc417                     call       0x7f56c78204e0
01d2f f4                             hlt        
01d30 bebeffffff                     mov        esi, 0xffffffbe
01d35 488b2c24                       mov        rbp, qword ptr [rsp]
01d39 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d3e 4c891424                       mov        qword ptr [rsp], r10
01d42 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d47 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d4c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d51 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d56 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d5b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d60 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d65 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d6f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d74 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01d79 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d82 89442434                       mov        dword ptr [rsp + 0x34], eax
01d86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d90 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d94 89442438                       mov        dword ptr [rsp + 0x38], eax
01d98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01da2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01da6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daf 48ff742450                     push       qword ptr [rsp + 0x50]
01db4 488f442448                     pop        qword ptr [rsp + 0x48]
01db9 48ff742458                     push       qword ptr [rsp + 0x58]
01dbe 488f442450                     pop        qword ptr [rsp + 0x50]
01dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01dcc 89442458                       mov        dword ptr [rsp + 0x58], eax
01dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd5 90                             nop        
01dd6 90                             nop        
01dd7 90                             nop        
01dd8 c5f877                         vzeroupper 
01ddb e88024afff                     call       0x7f56af6cda60
01de0 0f1f8400d81e001d               nop        dword ptr [rax + rax + 0x1d001ed8]
01de8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01df2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01df6 e8e54ec417                     call       0x7f56c78204e0
01dfb f4                             hlt        
01dfc be85ffffff                     mov        esi, 0xffffff85
01e01 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01e05 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e0a 44891c24                       mov        dword ptr [rsp], r11d
01e0e 44896c2404                     mov        dword ptr [rsp + 4], r13d
01e13 90                             nop        
01e14 c5f877                         vzeroupper 
01e17 e84424afff                     call       0x7f56af6cda60
01e1c 0f1f8400141f001e               nop        dword ptr [rax + rax + 0x1e001f14]
01e24 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01e2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e32 e8a94ec417                     call       0x7f56c78204e0
01e37 f4                             hlt        
01e38 bee4ffffff                     mov        esi, 0xffffffe4
01e3d 488b2c24                       mov        rbp, qword ptr [rsp]
01e41 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e46 4c891424                       mov        qword ptr [rsp], r10
01e4a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e4f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e54 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e59 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e5e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e63 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e68 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e6d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e72 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e77 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e7c 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01e81 48894424f8                     mov        qword ptr [rsp - 8], rax
01e86 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01e8a 89442434                       mov        dword ptr [rsp + 0x34], eax
01e8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e93 48894424f8                     mov        qword ptr [rsp - 8], rax
01e98 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e9c 89442438                       mov        dword ptr [rsp + 0x38], eax
01ea0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eaa 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01eae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01eb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb7 48ff742450                     push       qword ptr [rsp + 0x50]
01ebc 488f442448                     pop        qword ptr [rsp + 0x48]
01ec1 48ff742458                     push       qword ptr [rsp + 0x58]
01ec6 488f442450                     pop        qword ptr [rsp + 0x50]
01ecb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ed4 89442458                       mov        dword ptr [rsp + 0x58], eax
01ed8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ee6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01eea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ef8 89442460                       mov        dword ptr [rsp + 0x60], eax
01efc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f01 48894424f8                     mov        qword ptr [rsp - 8], rax
01f06 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f0a 89442464                       mov        dword ptr [rsp + 0x64], eax
01f0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f13 48894424f8                     mov        qword ptr [rsp - 8], rax
01f18 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f1c 89442468                       mov        dword ptr [rsp + 0x68], eax
01f20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f25 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01f2c c5f877                         vzeroupper 
01f2f e82c23afff                     call       0x7f56af6cda60
01f34 0f1f84002c20001f               nop        dword ptr [rax + rax + 0x1f00202c]
01f3c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01f46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4a e8914dc417                     call       0x7f56c78204e0
01f4f f4                             hlt        
01f50 bef6ffffff                     mov        esi, 0xfffffff6
01f55 90                             nop        
01f56 90                             nop        
01f57 90                             nop        
01f58 c5f877                         vzeroupper 
01f5b e80023afff                     call       0x7f56af6cda60
01f60 0f1f840058200020               nop        dword ptr [rax + rax + 0x20002058]
01f68 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01f72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f76 e8654dc417                     call       0x7f56c78204e0
01f7b f4                             hlt        
01f7c beccffffff                     mov        esi, 0xffffffcc
01f81 488b2c24                       mov        rbp, qword ptr [rsp]
01f85 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f8a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f8f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f94 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f99 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01fa2 89442470                       mov        dword ptr [rsp + 0x70], eax
01fa6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fab 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01fb0 c5f877                         vzeroupper 
01fb3 e8a822afff                     call       0x7f56af6cda60
01fb8 0f1f8400b0200021               nop        dword ptr [rax + rax + 0x210020b0]
01fc0 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
01fca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fce e80d4dc417                     call       0x7f56c78204e0
01fd3 f4                             hlt        
01fd4 bee4ffffff                     mov        esi, 0xffffffe4
01fd9 488b2c24                       mov        rbp, qword ptr [rsp]
01fdd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01fe2 4c891424                       mov        qword ptr [rsp], r10
01fe6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01feb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ff0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ff5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ffa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02004 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02009 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0200e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02013 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02018 48894424f8                     mov        qword ptr [rsp - 8], rax
0201d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02021 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02025 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02032 4489542474                     mov        dword ptr [rsp + 0x74], r10d
02037 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0203f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
02044 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0204c c5f877                         vzeroupper 
0204f e80c22afff                     call       0x7f56af6cda60
02054 0f1f84004c210022               nop        dword ptr [rax + rax + 0x2200214c]
0205c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02066 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206a e8714cc417                     call       0x7f56c78204e0
0206f f4                             hlt        
02070 bee4ffffff                     mov        esi, 0xffffffe4
02075 488b2c24                       mov        rbp, qword ptr [rsp]
02079 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0207e 4c891424                       mov        qword ptr [rsp], r10
02082 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02087 4489542408                     mov        dword ptr [rsp + 8], r10d
0208c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02091 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02096 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0209b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020a0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020a5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020aa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
020af 4c89542420                     mov        qword ptr [rsp + 0x20], r10
020b4 48894424f8                     mov        qword ptr [rsp - 8], rax
020b9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
020bd 8944246c                       mov        dword ptr [rsp + 0x6c], eax
020c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c6 90                             nop        
020c7 90                             nop        
020c8 c5f877                         vzeroupper 
020cb e89021afff                     call       0x7f56af6cda60
020d0 0f1f8400c8210023               nop        dword ptr [rax + rax + 0x230021c8]
020d8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
020e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020e6 e8f54bc417                     call       0x7f56c78204e0
020eb f4                             hlt        
020ec beccffffff                     mov        esi, 0xffffffcc
020f1 488b2c24                       mov        rbp, qword ptr [rsp]
020f5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020fa 4c891424                       mov        qword ptr [rsp], r10
020fe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02103 44895c2408                     mov        dword ptr [rsp + 8], r11d
02108 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0210d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02112 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02117 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0211c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02121 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02126 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0212b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02130 c5f877                         vzeroupper 
02133 e82821afff                     call       0x7f56af6cda60
02138 0f1f840030220024               nop        dword ptr [rax + rax + 0x24002230]
02140 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0214a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0214e e88d4bc417                     call       0x7f56c78204e0
02153 f4                             hlt        
02154 be6effffff                     mov        esi, 0xffffff6e
02159 488b2c24                       mov        rbp, qword ptr [rsp]
0215d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02162 4c891424                       mov        qword ptr [rsp], r10
02166 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0216b 4489542408                     mov        dword ptr [rsp + 8], r10d
02170 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02175 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0217a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0217f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02184 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02189 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0218e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02193 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02198 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0219d 48894424f8                     mov        qword ptr [rsp - 8], rax
021a2 8b442438                       mov        eax, dword ptr [rsp + 0x38]
021a6 89442434                       mov        dword ptr [rsp + 0x34], eax
021aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021af 48894424f8                     mov        qword ptr [rsp - 8], rax
021b4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
021b8 89442438                       mov        dword ptr [rsp + 0x38], eax
021bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c1 48894424f8                     mov        qword ptr [rsp - 8], rax
021c6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
021ca 8944243c                       mov        dword ptr [rsp + 0x3c], eax
021ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d3 48ff742450                     push       qword ptr [rsp + 0x50]
021d8 488f442448                     pop        qword ptr [rsp + 0x48]
021dd 48ff742458                     push       qword ptr [rsp + 0x58]
021e2 488f442450                     pop        qword ptr [rsp + 0x50]
021e7 48894424f8                     mov        qword ptr [rsp - 8], rax
021ec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021f0 89442458                       mov        dword ptr [rsp + 0x58], eax
021f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f9 48894424f8                     mov        qword ptr [rsp - 8], rax
021fe 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02202 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 48894424f8                     mov        qword ptr [rsp - 8], rax
02210 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02214 89442460                       mov        dword ptr [rsp + 0x60], eax
02218 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221d 48894424f8                     mov        qword ptr [rsp - 8], rax
02222 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02226 89442464                       mov        dword ptr [rsp + 0x64], eax
0222a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222f 48894424f8                     mov        qword ptr [rsp - 8], rax
02234 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02238 89442468                       mov        dword ptr [rsp + 0x68], eax
0223c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02241 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02245 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02249 90                             nop        
0224a 90                             nop        
0224b 90                             nop        
0224c c5f877                         vzeroupper 
0224f e80c20afff                     call       0x7f56af6cda60
02254 0f1f84004c230025               nop        dword ptr [rax + rax + 0x2500234c]
0225c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02266 4883e4f0                       and        rsp, 0xfffffffffffffff0
0226a e8714ac417                     call       0x7f56c78204e0
0226f f4                             hlt        
02270 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
0227a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0227e e85d4ac417                     call       0x7f56c78204e0
02283 f4                             hlt        
02284 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
0228e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02292 e8494ac417                     call       0x7f56c78204e0
02297 f4                             hlt        
02298 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
022a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022a6 e8354ac417                     call       0x7f56c78204e0
022ab f4                             hlt        
022ac 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
022b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ba e8214ac417                     call       0x7f56c78204e0
022bf f4                             hlt        
022c0 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
022c8 458d5a08                       lea        r11d, [r10 + 8]
022cc 458bc3                         mov        r8d, r11d
022cf be6effffff                     mov        esi, 0xffffff6e
022d4 488b2c24                       mov        rbp, qword ptr [rsp]
022d8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022dd 4c891424                       mov        qword ptr [rsp], r10
022e1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
022e6 4489542408                     mov        dword ptr [rsp + 8], r10d
022eb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
022f0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
022f5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022ff 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02304 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02309 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0230e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02313 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02318 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0231d 48ff742440                     push       qword ptr [rsp + 0x40]
02322 488f442438                     pop        qword ptr [rsp + 0x38]
02327 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0232c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02331 48ff742450                     push       qword ptr [rsp + 0x50]
02336 488f442448                     pop        qword ptr [rsp + 0x48]
0233b 48ff742458                     push       qword ptr [rsp + 0x58]
02340 488f442450                     pop        qword ptr [rsp + 0x50]
02345 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0234a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0234f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02354 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02359 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0235e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02363 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0236b 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02370 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02375 90                             nop        
02376 90                             nop        
02377 90                             nop        
02378 c5f877                         vzeroupper 
0237b e8e01eafff                     call       0x7f56af6cda60
02380 0f1f840078240026               nop        dword ptr [rax + rax + 0x26002478]
02388 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02392 4883e4f0                       and        rsp, 0xfffffffffffffff0
02396 e84549c417                     call       0x7f56c78204e0
0239b f4                             hlt        
0239c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
023a4 458d5a08                       lea        r11d, [r10 + 8]
023a8 458bc3                         mov        r8d, r11d
023ab be66ffffff                     mov        esi, 0xffffff66
023b0 488b2c24                       mov        rbp, qword ptr [rsp]
023b4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
023b9 4c891424                       mov        qword ptr [rsp], r10
023bd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023c2 4489542408                     mov        dword ptr [rsp + 8], r10d
023c7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
023cc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023d1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023d6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023db 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023e0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023e5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023ea 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023ef 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023f4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
023f9 48ff742440                     push       qword ptr [rsp + 0x40]
023fe 488f442438                     pop        qword ptr [rsp + 0x38]
02403 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02408 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0240d 48ff742450                     push       qword ptr [rsp + 0x50]
02412 488f442448                     pop        qword ptr [rsp + 0x48]
02417 48ff742458                     push       qword ptr [rsp + 0x58]
0241c 488f442450                     pop        qword ptr [rsp + 0x50]
02421 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02426 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0242b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02430 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02435 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0243a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0243f 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
02447 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0244c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02451 90                             nop        
02452 90                             nop        
02453 90                             nop        
02454 c5f877                         vzeroupper 
02457 e8041eafff                     call       0x7f56af6cda60
0245c 0f1f840054250027               nop        dword ptr [rax + rax + 0x27002554]
02464 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0246e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02472 e86948c417                     call       0x7f56c78204e0
02477 f4                             hlt        
02478 beccffffff                     mov        esi, 0xffffffcc
0247d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02482 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02487 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0248c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02491 48894424f8                     mov        qword ptr [rsp - 8], rax
02496 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0249a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0249e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a3 48894424f8                     mov        qword ptr [rsp - 8], rax
024a8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
024ac 89442460                       mov        dword ptr [rsp + 0x60], eax
024b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b5 48894424f8                     mov        qword ptr [rsp - 8], rax
024ba 8b442468                       mov        eax, dword ptr [rsp + 0x68]
024be 89442464                       mov        dword ptr [rsp + 0x64], eax
024c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c7 48894424f8                     mov        qword ptr [rsp - 8], rax
024cc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
024d0 89442468                       mov        dword ptr [rsp + 0x68], eax
024d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d9 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
024dd 90                             nop        
024de 90                             nop        
024df 90                             nop        
024e0 c5f877                         vzeroupper 
024e3 e8781dafff                     call       0x7f56af6cda60
024e8 0f1f8400e0250028               nop        dword ptr [rax + rax + 0x280025e0]
024f0 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
024fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
024fe e8dd47c417                     call       0x7f56c78204e0
02503 f4                             hlt        
02504 bee4ffffff                     mov        esi, 0xffffffe4
02509 488b2c24                       mov        rbp, qword ptr [rsp]
0250d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02512 4c891424                       mov        qword ptr [rsp], r10
02516 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0251b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02520 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02525 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0252a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0252f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02534 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02539 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0253e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02543 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02548 48894424f8                     mov        qword ptr [rsp - 8], rax
0254d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02551 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02555 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255a 48894424f8                     mov        qword ptr [rsp - 8], rax
0255f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02563 89442460                       mov        dword ptr [rsp + 0x60], eax
02567 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256c 48894424f8                     mov        qword ptr [rsp - 8], rax
02571 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02575 89442464                       mov        dword ptr [rsp + 0x64], eax
02579 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257e 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
02586 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0258b 48894424f8                     mov        qword ptr [rsp - 8], rax
02590 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02594 89442474                       mov        dword ptr [rsp + 0x74], eax
02598 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
025a5 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
025ad 90                             nop        
025ae 90                             nop        
025af 90                             nop        
025b0 c5f877                         vzeroupper 
025b3 e8a81cafff                     call       0x7f56af6cda60
025b8 0f1f8400b0260029               nop        dword ptr [rax + rax + 0x290026b0]
025c0 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
025ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ce e80d47c417                     call       0x7f56c78204e0
025d3 f4                             hlt        
025d4 bee4ffffff                     mov        esi, 0xffffffe4
025d9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025de 4489542414                     mov        dword ptr [rsp + 0x14], r10d
025e3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
025e8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
025ed 48894424f8                     mov        qword ptr [rsp - 8], rax
025f2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025f6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
025fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02604 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02608 89442460                       mov        dword ptr [rsp + 0x60], eax
0260c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02611 48894424f8                     mov        qword ptr [rsp - 8], rax
02616 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0261a 89442464                       mov        dword ptr [rsp + 0x64], eax
0261e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02623 90                             nop        
02624 c5f877                         vzeroupper 
02627 e8341cafff                     call       0x7f56af6cda60
0262c 0f1f84002427002a               nop        dword ptr [rax + rax + 0x2a002724]
02634 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
0263e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02642 e89946c417                     call       0x7f56c78204e0
02647 f4                             hlt        
02648 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
0264f ffc5                           inc        ebp
02651 bee4ffffff                     mov        esi, 0xffffffe4
02656 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0265b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02660 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02665 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0266a 48894424f8                     mov        qword ptr [rsp - 8], rax
0266f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02673 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267c 48894424f8                     mov        qword ptr [rsp - 8], rax
02681 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02685 89442460                       mov        dword ptr [rsp + 0x60], eax
02689 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268e 48894424f8                     mov        qword ptr [rsp - 8], rax
02693 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02697 89442464                       mov        dword ptr [rsp + 0x64], eax
0269b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a0 4489442470                     mov        dword ptr [rsp + 0x70], r8d
026a5 90                             nop        
026a6 90                             nop        
026a7 90                             nop        
026a8 c5f877                         vzeroupper 
026ab e8b01bafff                     call       0x7f56af6cda60
026b0 0f1f8400a827002b               nop        dword ptr [rax + rax + 0x2b0027a8]
026b8 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
026c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
026c6 e81546c417                     call       0x7f56c78204e0
026cb f4                             hlt        
026cc bee4ffffff                     mov        esi, 0xffffffe4
026d1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
026d6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
026db 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
026e0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026e5 48894424f8                     mov        qword ptr [rsp - 8], rax
026ea 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026ee 8944244c                       mov        dword ptr [rsp + 0x4c], eax
026f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f7 48894424f8                     mov        qword ptr [rsp - 8], rax
026fc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02700 89442460                       mov        dword ptr [rsp + 0x60], eax
02704 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02709 48894424f8                     mov        qword ptr [rsp - 8], rax
0270e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02712 89442464                       mov        dword ptr [rsp + 0x64], eax
02716 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271b 90                             nop        
0271c c5f877                         vzeroupper 
0271f e83c1bafff                     call       0x7f56af6cda60
02724 0f1f84001c28002c               nop        dword ptr [rax + rax + 0x2c00281c]
0272c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02736 4883e4f0                       and        rsp, 0xfffffffffffffff0
0273a e8a145c417                     call       0x7f56c78204e0
0273f f4                             hlt        
02740 bee4ffffff                     mov        esi, 0xffffffe4
02745 488b2c24                       mov        rbp, qword ptr [rsp]
02749 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0274e 4c891424                       mov        qword ptr [rsp], r10
02752 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02757 4489542408                     mov        dword ptr [rsp + 8], r10d
0275c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02761 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02766 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0276b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02770 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02775 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0277a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0277f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02784 48894424f8                     mov        qword ptr [rsp - 8], rax
02789 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0278d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02791 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02796 48894424f8                     mov        qword ptr [rsp - 8], rax
0279b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0279f 89442460                       mov        dword ptr [rsp + 0x60], eax
027a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a8 48894424f8                     mov        qword ptr [rsp - 8], rax
027ad 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027b1 89442464                       mov        dword ptr [rsp + 0x64], eax
027b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ba 48894424f8                     mov        qword ptr [rsp - 8], rax
027bf 8b442478                       mov        eax, dword ptr [rsp + 0x78]
027c3 89442470                       mov        dword ptr [rsp + 0x70], eax
027c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cc c5f877                         vzeroupper 
027cf e88c1aafff                     call       0x7f56af6cda60
027d4 0f1f8400cc28002d               nop        dword ptr [rax + rax + 0x2d0028cc]
027dc 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
027e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ea e8f144c417                     call       0x7f56c78204e0
027ef f4                             hlt        
027f0 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
027fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
027fe e8dd44c417                     call       0x7f56c78204e0
02803 f4                             hlt        
02804 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
0280e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02812 e8c944c417                     call       0x7f56c78204e0
02817 f4                             hlt        
02818 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
02822 4883e4f0                       and        rsp, 0xfffffffffffffff0
02826 e8b544c417                     call       0x7f56c78204e0
0282b f4                             hlt        
0282c 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
02836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283a e8a144c417                     call       0x7f56c78204e0
0283f f4                             hlt        
02840 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
0284a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0284e e88d44c417                     call       0x7f56c78204e0
02853 f4                             hlt        
02854 48bfd0192a88567f0000           movabs     rdi, 0x7f56882a19d0
0285e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02862 e87944c417                     call       0x7f56c78204e0
02867 f4                             hlt        
02868 beccffffff                     mov        esi, 0xffffffcc
0286d 488b2c24                       mov        rbp, qword ptr [rsp]
02871 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
02876 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0287b 90                             nop        
0287c c5f877                         vzeroupper 
0287f e8dc19afff                     call       0x7f56af6cda60
02884 0f1f84007c29002e               nop        dword ptr [rax + rax + 0x2e00297c]
0288c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02896 4883e4f0                       and        rsp, 0xfffffffffffffff0
0289a e84144c417                     call       0x7f56c78204e0
0289f f4                             hlt        
028a0 beccffffff                     mov        esi, 0xffffffcc
028a5 488b2c24                       mov        rbp, qword ptr [rsp]
028a9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028ae 4489542414                     mov        dword ptr [rsp + 0x14], r10d
028b3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
028b8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
028bd 48894424f8                     mov        qword ptr [rsp - 8], rax
028c2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028c6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
028ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028cf 48894424f8                     mov        qword ptr [rsp - 8], rax
028d4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028d8 89442460                       mov        dword ptr [rsp + 0x60], eax
028dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e1 48894424f8                     mov        qword ptr [rsp - 8], rax
028e6 8b442468                       mov        eax, dword ptr [rsp + 0x68]
028ea 89442464                       mov        dword ptr [rsp + 0x64], eax
028ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f3 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
028fb 90                             nop        
028fc c5f877                         vzeroupper 
028ff e85c19afff                     call       0x7f56af6cda60
02904 0f1f8400fc29002f               nop        dword ptr [rax + rax + 0x2f0029fc]
0290c 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0291a e8c143c417                     call       0x7f56c78204e0
0291f f4                             hlt        
02920 beccffffff                     mov        esi, 0xffffffcc
02925 488b2c24                       mov        rbp, qword ptr [rsp]
02929 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0292e 4c891424                       mov        qword ptr [rsp], r10
02932 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02937 4489542408                     mov        dword ptr [rsp + 8], r10d
0293c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02941 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02946 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0294b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02950 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02955 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0295a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0295f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02964 48894424f8                     mov        qword ptr [rsp - 8], rax
02969 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0296d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02976 48894424f8                     mov        qword ptr [rsp - 8], rax
0297b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0297f 89442460                       mov        dword ptr [rsp + 0x60], eax
02983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02988 48894424f8                     mov        qword ptr [rsp - 8], rax
0298d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02991 89442464                       mov        dword ptr [rsp + 0x64], eax
02995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299a 48894424f8                     mov        qword ptr [rsp - 8], rax
0299f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
029a3 89442468                       mov        dword ptr [rsp + 0x68], eax
029a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ac 48894424f8                     mov        qword ptr [rsp - 8], rax
029b1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
029b5 89442470                       mov        dword ptr [rsp + 0x70], eax
029b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029be 895c2474                       mov        dword ptr [rsp + 0x74], ebx
029c2 90                             nop        
029c3 90                             nop        
029c4 c5f877                         vzeroupper 
029c7 e89418afff                     call       0x7f56af6cda60
029cc 0f1f8400c42a0030               nop        dword ptr [rax + rax + 0x30002ac4]
029d4 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
029de 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e2 e8f942c417                     call       0x7f56c78204e0
029e7 f4                             hlt        
029e8 beccffffff                     mov        esi, 0xffffffcc
029ed 488b2c24                       mov        rbp, qword ptr [rsp]
029f1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
029f6 4c891424                       mov        qword ptr [rsp], r10
029fa 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
029ff 4489542408                     mov        dword ptr [rsp + 8], r10d
02a04 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02a09 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a0e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a13 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a18 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02a1d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02a22 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02a27 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02a2c 48894424f8                     mov        qword ptr [rsp - 8], rax
02a31 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a35 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02a39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a3e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a43 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a47 89442460                       mov        dword ptr [rsp + 0x60], eax
02a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a50 48894424f8                     mov        qword ptr [rsp - 8], rax
02a55 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02a59 89442464                       mov        dword ptr [rsp + 0x64], eax
02a5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a62 48894424f8                     mov        qword ptr [rsp - 8], rax
02a67 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a6b 89442468                       mov        dword ptr [rsp + 0x68], eax
02a6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a74 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02a78 c5f877                         vzeroupper 
02a7b e8e017afff                     call       0x7f56af6cda60
02a80 0f1f8400782b0031               nop        dword ptr [rax + rax + 0x31002b78]
02a88 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a96 e84542c417                     call       0x7f56c78204e0
02a9b f4                             hlt        
02a9c eb10                           jmp        0x7f56afbdc2ae
02a9e eb0e                           jmp        0x7f56afbdc2ae
02aa0 eb0c                           jmp        0x7f56afbdc2ae
02aa2 eb0a                           jmp        0x7f56afbdc2ae
02aa4 eb08                           jmp        0x7f56afbdc2ae
02aa6 eb06                           jmp        0x7f56afbdc2ae
02aa8 eb04                           jmp        0x7f56afbdc2ae
02aaa eb02                           jmp        0x7f56afbdc2ae
02aac eb00                           jmp        0x7f56afbdc2ae
02aae 488bf0                         mov        rsi, rax
02ab1 e936ddffff                     jmp        0x7f56afbd9fec
02ab6 bef6ffffff                     mov        esi, 0xfffffff6
02abb 90                             nop        
02abc c5f877                         vzeroupper 
02abf e89c17afff                     call       0x7f56af6cda60
02ac4 0f1f8400bc2b0032               nop        dword ptr [rax + rax + 0x32002bbc]
02acc 48bfc07a2688567f0000           movabs     rdi, 0x7f5688267ac0
02ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ada e80142c417                     call       0x7f56c78204e0
02adf f4                             hlt        
02ae0 49ba8fa8bdaf567f0000           movabs     r10, 0x7f56afbda88f
02aea 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02af1 e96a60b5ff                     jmp        0x7f56af732360
02af6 e8e52eb4ff                     call       0x7f56af71f1e0
02afb e92ed5ffff                     jmp        0x7f56afbd982e
