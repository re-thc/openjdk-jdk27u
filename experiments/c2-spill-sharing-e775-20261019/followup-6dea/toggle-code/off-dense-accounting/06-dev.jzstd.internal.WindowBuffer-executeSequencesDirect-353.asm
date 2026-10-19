00000 e83baf0a18                     call       0x7f4b9ff086c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85c41e0000                   jne        0x7f4b87e5f672
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
000a6 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
000ad 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000b2 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
000b9 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000c0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000d8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
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
0010d 49ba00eefe9f4b7f0000           movabs     r10, 0x7f4b9ffeee00
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f8420140000                   je         0x7f4b87e5ecd0
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15410000                 cmp        r11d, 0x4115
0013e 0f8520150000                   jne        0x7f4b87e5ede4
00144 4c891424                       mov        qword ptr [rsp], r10
00148 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00150 4d85d2                         test       r10, r10
00153 0f8403140000                   je         0x7f4b87e5ecdc
00159 458b12                         mov        r10d, dword ptr [r10]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fadd050000                 cmp        r10d, 0x5dd
00167 0f85f7140000                   jne        0x7f4b87e5ede4
0016d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00182 4d85d2                         test       r10, r10
00185 0f84de130000                   je         0x7f4b87e5ece9
0018b 458b12                         mov        r10d, dword ptr [r10]
0018e 41c1ea0d                       shr        r10d, 0xd
00192 4181fae0050000                 cmp        r10d, 0x5e0
00199 0f85c5140000                   jne        0x7f4b87e5ede4
0019f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
001a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
001b4 4d85d2                         test       r10, r10
001b7 0f84b9130000                   je         0x7f4b87e5ecf6
001bd 458b1a                         mov        r11d, dword ptr [r10]
001c0 41c1eb0d                       shr        r11d, 0xd
001c4 4181fbdf050000                 cmp        r11d, 0x5df
001cb 0f8593140000                   jne        0x7f4b87e5ede4
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001de 4d85d2                         test       r10, r10
001e1 0f849c130000                   je         0x7f4b87e5ed03
001e7 458b12                         mov        r10d, dword ptr [r10]
001ea 41c1ea0d                       shr        r10d, 0xd
001ee 4181fadf050000                 cmp        r10d, 0x5df
001f5 0f8569140000                   jne        0x7f4b87e5ede4
001fb 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00203 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00208 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00210 4d85d2                         test       r10, r10
00213 0f8477130000                   je         0x7f4b87e5ed10
00219 458b1a                         mov        r11d, dword ptr [r10]
0021c 41c1eb0d                       shr        r11d, 0xd
00220 4181fbdd050000                 cmp        r11d, 0x5dd
00227 0f8537140000                   jne        0x7f4b87e5ede4
0022d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0023b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00240 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00245 4585d2                         test       r10d, r10d
00248 0f844f130000                   je         0x7f4b87e5ed1d
0024e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00253 458b5204                       mov        r10d, dword ptr [r10 + 4]
00257 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0025c 458d5af1                       lea        r11d, [r10 - 0xf]
00260 4585db                         test       r11d, r11d
00263 0f8c34130000                   jl         0x7f4b87e5ed1d
00269 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0026e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00272 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0027a 458d53f1                       lea        r10d, [r11 - 0xf]
0027e 4585d2                         test       r10d, r10d
00281 0f8c16130000                   jl         0x7f4b87e5ed1d
00287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0028c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00290 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00298 4585d2                         test       r10d, r10d
0029b 0f86fc120000                   jbe        0x7f4b87e5ed1d
002a1 4183fa01                       cmp        r10d, 1
002a5 0f86f2120000                   jbe        0x7f4b87e5ed1d
002ab 4183fa02                       cmp        r10d, 2
002af 0f86e8120000                   jbe        0x7f4b87e5ed1d
002b5 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002bd 4183c2f9                       add        r10d, -7
002c1 4585d2                         test       r10d, r10d
002c4 0f8cd3120000                   jl         0x7f4b87e5ed1d
002ca 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002d2 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002da 458d5af1                       lea        r11d, [r10 - 0xf]
002de 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002eb 4183c2f1                       add        r10d, -0xf
002ef 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002f7 e9b9010000                     jmp        0x7f4b87e5dc35
002fc 4533db                         xor        r11d, r11d
002ff 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00304 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00309 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
0030d 4183fa03                       cmp        r10d, 3
00311 0f8e31020000                   jle        0x7f4b87e5dcc8
00317 45894b10                       mov        dword ptr [r11 + 0x10], r9d
0031b 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0031f 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00324 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00328 4183c2fd                       add        r10d, -3
0032c 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00334 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0033c 45895808                       mov        dword ptr [r8 + 8], r11d
00340 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00348 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
0034d 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00352 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
00357 4d03d3                         add        r10, r11
0035a 4d3bc2                         cmp        r8, r10
0035d 0f8fc90d0000                   jg         0x7f4b87e5e8ac
00363 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0036b 4585c0                         test       r8d, r8d
0036e 0f8ea40c0000                   jle        0x7f4b87e5e798
00374 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00379 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
0037e 4403542478                     add        r10d, dword ptr [rsp + 0x78]
00383 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
00388 0f8ffe0d0000                   jg         0x7f4b87e5e90c
0038e 458bd5                         mov        r10d, r13d
00391 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
00396 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
0039b 0f8fe30e0000                   jg         0x7f4b87e5ea04
003a1 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
003a6 4183f810                       cmp        r8d, 0x10
003aa 0f8fcc0f0000                   jg         0x7f4b87e5eafc
003b0 443bac2490000000               cmp        r13d, dword ptr [rsp + 0x90]
003b8 0f83860a0000                   jae        0x7f4b87e5e5c4
003be 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003c3 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
003ca 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003cf 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
003d7 0f83b30a0000                   jae        0x7f4b87e5e610
003dd 4503c5                         add        r8d, r13d
003e0 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
003e8 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
003ed 4503ca                         add        r9d, r10d
003f0 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
003f5 4d63ca                         movsxd     r9, r10d
003f8 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
003fd c4817a7f440808                 vmovdqu    xmmword ptr [r8 + r9 + 8], xmm0
00404 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00409 442b842494000000               sub        r8d, dword ptr [rsp + 0x94]
00411 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00419 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
0041d 83f910                         cmp        ecx, 0x10
00420 0f8f4a100000                   jg         0x7f4b87e5ebf0
00426 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0042e 4183f810                       cmp        r8d, 0x10
00432 0f8cf4010000                   jl         0x7f4b87e5ddac
00438 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00440 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00448 0f83de0a0000                   jae        0x7f4b87e5e6ac
0044e 458bd8                         mov        r11d, r8d
00451 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00456 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
0045d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00462 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0046a 0f83200b0000                   jae        0x7f4b87e5e710
00470 458bda                         mov        r11d, r10d
00473 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00478 4d63d3                         movsxd     r10, r11d
0047b 478d0419                       lea        r8d, [r9 + r11]
0047f 4403c1                         add        r8d, ecx
00482 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00487 4d63d9                         movsxd     r11, r9d
0048a 4d03da                         add        r11, r10
0048d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00492 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00499 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0049d 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004a2 41ffc0                         inc        r8d
004a5 4489442468                     mov        dword ptr [rsp + 0x68], r8d
004aa 418502                         test       dword ptr [r10], eax
004ad 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
004b5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
004ba 452bc5                         sub        r8d, r13d
004bd 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004c2 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004c7 0f8d21080000                   jge        0x7f4b87e5e46e
004cd 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
004d2 0f8320090000                   jae        0x7f4b87e5e578
004d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
004dd 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
004e2 4d8bd3                         mov        r10, r11
004e5 49c1fa24                       sar        r10, 0x24
004e9 458bd2                         mov        r10d, r10d
004ec 4d8bcb                         mov        r9, r11
004ef 49c1e912                       shr        r9, 0x12
004f3 458bdb                         mov        r11d, r11d
004f6 418bc9                         mov        ecx, r9d
004f9 4181e3ffff0100                 and        r11d, 0x1ffff
00500 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00505 81e1ffff0300                   and        ecx, 0x3ffff
0050b 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0050f 4585d2                         test       r10d, r10d
00512 0f8c200b0000                   jl         0x7f4b87e5e7b8
00518 4585db                         test       r11d, r11d
0051b 0f84dbfdffff                   je         0x7f4b87e5da7c
00521 453bd8                         cmp        r11d, r8d
00524 0f8edafdffff                   jle        0x7f4b87e5da84
0052a be45ffffff                     mov        esi, 0xffffff45
0052f 418beb                         mov        ebp, r11d
00532 44890424                       mov        dword ptr [rsp], r8d
00536 6690                           nop        
00538 c5f877                         vzeroupper 
0053b e8a059b6ff                     call       0x7f4b879c3660
00540 0f1f840038060001               nop        dword ptr [rax + rax + 0x1000638]
00548 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0054d 4585c0                         test       r8d, r8d
00550 7403                           je         0x7f4b87e5dcd5
00552 41ffca                         dec        r10d
00555 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00559 4585d2                         test       r10d, r10d
0055c 0f8481000000                   je         0x7f4b87e5dd63
00562 4183fa03                       cmp        r10d, 3
00566 0f842b080000                   je         0x7f4b87e5e517
0056c 4183fa02                       cmp        r10d, 2
00570 777e                           ja         0x7f4b87e5dd70
00572 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0057a 0f8314110000                   jae        0x7f4b87e5ee14
00580 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00585 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
0058a 4585d2                         test       r10d, r10d
0058d 7e4b                           jle        0x7f4b87e5dd5a
0058f 458d4aff                       lea        r9d, [r10 - 1]
00593 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
0059b 0f83ef140000                   jae        0x7f4b87e5f210
005a1 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
005a6 458bc0                         mov        r8d, r8d
005a9 4183c0cc                       add        r8d, -0x34
005ad 41c1e802                       shr        r8d, 2
005b1 478d4c10ff                     lea        r9d, [r8 + r10 - 1]
005b6 4d63c2                         movsxd     r8, r10d
005b9 33c9                           xor        ecx, ecx
005bb bf04000000                     mov        edi, 4
005c0 c442c0f5c9                     bzhi       r9, r9, rdi
005c5 4d2bc1                         sub        r8, r9
005c8 49ffc8                         dec        r8
005cb 4d85c0                         test       r8, r8
005ce 4c0f4cc1                       cmovl      r8, rcx
005d2 418bd8                         mov        ebx, r8d
005d5 e9f5050000                     jmp        0x7f4b87e5e34f
005da 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005df 45895a08                       mov        dword ptr [r10 + 8], r11d
005e3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
005eb e950fdffff                     jmp        0x7f4b87e5dac0
005f0 48be80af72e200000000           movabs     rsi, 0xe272af80
005fa 418bed                         mov        ebp, r13d
005fd 666690                         nop        
00600 c5f877                         vzeroupper 
00603 e8d8daa9ff                     call       0x7f4b878fb860
00608 0f1f840000070002               nop        dword ptr [rax + rax + 0x2000700]
00610 4885c0                         test       rax, rax
00613 0f8483110000                   je         0x7f4b87e5ef1c
00619 488bf0                         mov        rsi, rax
0061c c5f877                         vzeroupper 
0061f 4881c4c0000000                 add        rsp, 0xc0
00626 5d                             pop        rbp
00627 e9b4d7b6ff                     jmp        0x7f4b879cb560
0062c 034c247c                       add        ecx, dword ptr [rsp + 0x7c]
00630 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00634 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00639 0f8de9020000                   jge        0x7f4b87e5e0a8
0063f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00644 4183c308                       add        r11d, 8
00648 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00650 4183f808                       cmp        r8d, 8
00654 0f8daf010000                   jge        0x7f4b87e5df89
0065a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00662 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0066a 0f8334150000                   jae        0x7f4b87e5f324
00670 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00675 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
0067d 430fbe6c0b08                   movsx      ebp, byte ptr [r11 + r9 + 8]
00683 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00688 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00690 0f83d2150000                   jae        0x7f4b87e5f3e8
00696 4d63da                         movsxd     r11, r10d
00699 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
0069e 4d03c3                         add        r8, r11
006a1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006a6 43886c0308                     mov        byte ptr [r11 + r8 + 8], bpl
006ab 458d5903                       lea        r11d, [r9 + 3]
006af 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
006b4 41ffc1                         inc        r9d
006b7 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
006bf 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
006c7 0f8303160000                   jae        0x7f4b87e5f450
006cd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006d2 4183c303                       add        r11d, 3
006d6 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
006de 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
006e3 430fbe6c0109                   movsx      ebp, byte ptr [r9 + r8 + 9]
006e9 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
006f1 0f835d160000                   jae        0x7f4b87e5f4d4
006f7 4d63d2                         movsxd     r10, r10d
006fa 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
006ff 4d03da                         add        r11, r10
00702 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00707 470fbe54010a                   movsx      r10d, byte ptr [r9 + r8 + 0xa]
0070d 478854190a                     mov        byte ptr [r9 + r11 + 0xa], r10b
00712 470fbe44010b                   movsx      r8d, byte ptr [r9 + r8 + 0xb]
00718 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
0071d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00725 4183fa08                       cmp        r10d, 8
00729 0f83a1160000                   jae        0x7f4b87e5f550
0072f 49bac0e870e200000000           movabs     r10, 0xe270e8c0
00739 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00741 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00749 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
0074e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00753 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00758 4183fb04                       cmp        r11d, 4
0075c 7e3e                           jle        0x7f4b87e5df1c
0075e 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
00762 83c504                         add        ebp, 4
00765 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0076a 8b542414                       mov        edx, dword ptr [rsp + 0x14]
0076e 6690                           nop        
00770 c5f877                         vzeroupper 
00773 e868d9a9ff                     call       0x7f4b878fb860
00778 0f1f840070080003               nop        dword ptr [rax + rax + 0x3000870]
00780 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00785 8bd5                           mov        edx, ebp
00787 8bc8                           mov        ecx, eax
00789 666690                         nop        
0078c c5f877                         vzeroupper 
0078f e84cd9a9ff                     call       0x7f4b878fb860
00794 0f1f84008c080004               nop        dword ptr [rax + rax + 0x400088c]
0079c 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
007a1 4183fb08                       cmp        r11d, 8
007a5 0f8eeefcffff                   jle        0x7f4b87e5dc19
007ab 49bae8e870e200000000           movabs     r10, 0xe270e8e8
007b5 8b542414                       mov        edx, dword ptr [rsp + 0x14]
007b9 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
007c1 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
007c6 83c208                         add        edx, 8
007c9 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007ce 6690                           nop        
007d0 c5f877                         vzeroupper 
007d3 e808d9a9ff                     call       0x7f4b878fb860
007d8 0f1f8400d0080005               nop        dword ptr [rax + rax + 0x50008d0]
007e0 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
007e4 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007e9 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
007f0 488bc8                         mov        rcx, rax
007f3 90                             nop        
007f4 c5f877                         vzeroupper 
007f7 e8e4d8a9ff                     call       0x7f4b878fb860
007fc 0f1f8400f4080006               nop        dword ptr [rax + rax + 0x60008f4]
00804 e990fcffff                     jmp        0x7f4b87e5dc19
00809 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0080e 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00815 666690                         nop        
00818 c5f877                         vzeroupper 
0081b e8c0d8a9ff                     call       0x7f4b878fb860
00820 0f1f840018090007               nop        dword ptr [rax + rax + 0x7000918]
00828 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0082d 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00831 488bc8                         mov        rcx, rax
00834 c5f877                         vzeroupper 
00837 e8a4d8a9ff                     call       0x7f4b878fb860
0083c 0f1f840034090008               nop        dword ptr [rax + rax + 0x8000934]
00844 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0084c 4183c208                       add        r10d, 8
00850 be95ffffff                     mov        esi, 0xffffff95
00855 488b2c24                       mov        rbp, qword ptr [rsp]
00859 48ff742408                     push       qword ptr [rsp + 8]
0085e 488f0424                       pop        qword ptr [rsp]
00862 48894424f8                     mov        qword ptr [rsp - 8], rax
00867 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0086b 89442408                       mov        dword ptr [rsp + 8], eax
0086f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00874 48ff742418                     push       qword ptr [rsp + 0x18]
00879 488f442410                     pop        qword ptr [rsp + 0x10]
0087e 48ff742420                     push       qword ptr [rsp + 0x20]
00883 488f442418                     pop        qword ptr [rsp + 0x18]
00888 48894424f8                     mov        qword ptr [rsp - 8], rax
0088d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00891 8944240c                       mov        dword ptr [rsp + 0xc], eax
00895 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089a 48ff742430                     push       qword ptr [rsp + 0x30]
0089f 488f442428                     pop        qword ptr [rsp + 0x28]
008a4 48894424f8                     mov        qword ptr [rsp - 8], rax
008a9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
008ad 89442434                       mov        dword ptr [rsp + 0x34], eax
008b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b6 48894424f8                     mov        qword ptr [rsp - 8], rax
008bb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
008bf 8944243c                       mov        dword ptr [rsp + 0x3c], eax
008c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c8 48ff742450                     push       qword ptr [rsp + 0x50]
008cd 488f442448                     pop        qword ptr [rsp + 0x48]
008d2 48ff742458                     push       qword ptr [rsp + 0x58]
008d7 488f442450                     pop        qword ptr [rsp + 0x50]
008dc 48894424f8                     mov        qword ptr [rsp - 8], rax
008e1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008e5 89442458                       mov        dword ptr [rsp + 0x58], eax
008e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ee 48894424f8                     mov        qword ptr [rsp - 8], rax
008f3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
008f7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
008fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00900 48894424f8                     mov        qword ptr [rsp - 8], rax
00905 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00909 89442460                       mov        dword ptr [rsp + 0x60], eax
0090d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00912 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00917 90                             nop        
00918 c5f877                         vzeroupper 
0091b e8c055b6ff                     call       0x7f4b879c3660
00920 0f1f8400180a0009               nop        dword ptr [rax + rax + 0x9000a18]
00928 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
0092c 83f930                         cmp        ecx, 0x30
0092f 0f8f09020000                   jg         0x7f4b87e5e2be
00935 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0093d 4183c3f9                       add        r11d, -7
00941 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00949 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00951 453bc3                         cmp        r8d, r11d
00954 0f835a0e0000                   jae        0x7f4b87e5ef34
0095a 458bd8                         mov        r11d, r8d
0095d 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00965 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0096a 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00972 4f8b5c0b08                     mov        r11, qword ptr [r11 + r9 + 8]
00977 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
0097f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00984 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
0098c 0f83a60e0000                   jae        0x7f4b87e5efb8
00992 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00997 4d63d2                         movsxd     r10, r10d
0099a 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0099f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
009a4 4d63d8                         movsxd     r11, r8d
009a7 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
009ac 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
009b0 48be28c122e200000000           movabs     rsi, 0xe222c128
009ba 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009bf 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009c7 4533c9                         xor        r9d, r9d
009ca 6690                           nop        
009cc c5f877                         vzeroupper 
009cf e80ccda9ff                     call       0x7f4b878fae60
009d4 0f1f8400cc0a000a               nop        dword ptr [rax + rax + 0xa000acc]
009dc 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
009e1 4403542414                     add        r10d, dword ptr [rsp + 0x14]
009e6 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
009eb 458d5a08                       lea        r11d, [r10 + 8]
009ef 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
009f7 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
009fc 0f8d28010000                   jge        0x7f4b87e5e2aa
00a02 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a0a 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00a0f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00a14 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00a1c 4983c0f9                       add        r8, -7
00a20 4d63cb                         movsxd     r9, r11d
00a23 4c639c24a0000000               movsxd     r11, dword ptr [rsp + 0xa0]
00a2b 4f8d140b                       lea        r10, [r11 + r9]
00a2f 4d3bd0                         cmp        r10, r8
00a32 0f83e80e0000                   jae        0x7f4b87e5f0a0
00a38 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00a3d 4d2bd3                         sub        r10, r11
00a40 4983c207                       add        r10, 7
00a44 4983e2f8                       and        r10, 0xfffffffffffffff8
00a48 458bd2                         mov        r10d, r10d
00a4b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a50 478d541a08                     lea        r10d, [r10 + r11 + 8]
00a55 4d63da                         movsxd     r11, r10d
00a58 4f8d5419f8                     lea        r10, [r9 + r11 - 8]
00a5d 4d3bd0                         cmp        r10, r8
00a60 0f83ba0e0000                   jae        0x7f4b87e5f0a0
00a66 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a6e 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00a76 0f83a40e0000                   jae        0x7f4b87e5f0a0
00a7c 4983c3f8                       add        r11, -8
00a80 4d3bd8                         cmp        r11, r8
00a83 0f83970e0000                   jae        0x7f4b87e5f0a0
00a89 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a8e 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a95 0f8f3d0f0000                   jg         0x7f4b87e5f158
00a9b 0f1f440000                     nop        dword ptr [rax + rax]
00aa0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00aa8 4963cb                         movsxd     rcx, r11d
00aab 4883c108                       add        rcx, 8
00aaf 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00ab6 036c2414                       add        ebp, dword ptr [rsp + 0x14]
00aba 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00abf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ac4 48be28c122e200000000           movabs     rsi, 0xe222c128
00ace 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00ad3 4533c9                         xor        r9d, r9d
00ad6 6690                           nop        
00ad8 c5f877                         vzeroupper 
00adb e800cca9ff                     call       0x7f4b878fae60
00ae0 0f1f8400d80b000b               nop        dword ptr [rax + rax + 0xb000bd8]
00ae8 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00af0 4183c308                       add        r11d, 8
00af4 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00afc 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00b01 7c9d                           jl         0x7f4b87e5e220
00b03 eb25                           jmp        0x7f4b87e5e2aa
00b05 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b0a 4d63d3                         movsxd     r10, r11d
00b0d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b14 c442a8f5db                     bzhi       r11, r11, r10
00b19 c4c1fb92fb                     kmovq      k7, r11
00b1e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b24 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b2a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00b2f 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
00b34 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b39 e95bf9ffff                     jmp        0x7f4b87e5dc19
00b3e 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b46 4585c0                         test       r8d, r8d
00b49 0f8c590d0000                   jl         0x7f4b87e5f028
00b4f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b54 4585d2                         test       r10d, r10d
00b57 0f8c4b0d0000                   jl         0x7f4b87e5f028
00b5d 468d1401                       lea        r10d, [rcx + r8]
00b61 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
00b68 413bca                         cmp        ecx, r10d
00b6b 0f82370d0000                   jb         0x7f4b87e5f028
00b71 3b4c2438                       cmp        ecx, dword ptr [rsp + 0x38]
00b75 0f822d0d0000                   jb         0x7f4b87e5f028
00b7b 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00b80 4585c0                         test       r8d, r8d
00b83 74a5                           je         0x7f4b87e5e2aa
00b85 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b8a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b92 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00b97 4d03d9                         add        r11, r9
00b9a 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00b9f 4863542478                     movsxd     rdx, dword ptr [rsp + 0x78]
00ba4 4883fa20                       cmp        rdx, 0x20
00ba8 0f8657ffffff                   jbe        0x7f4b87e5e285
00bae c5f877                         vzeroupper 
00bb1 49ba204f8e874b7f0000           movabs     r10, 0x7f4b878e4f20
00bbb 41ffd2                         call       r10
00bbe 0f1f840000000000               nop        dword ptr [rax + rax]
00bc6 e95fffffff                     jmp        0x7f4b87e5e2aa
00bcb 90                             nop        
00bcc 458bd1                         mov        r10d, r9d
00bcf 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00bd4 478b449004                     mov        r8d, dword ptr [r8 + r10*4 + 4]
00bd9 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00bde 4789449108                     mov        dword ptr [r9 + r10*4 + 8], r8d
00be3 458d4aff                       lea        r9d, [r10 - 1]
00be7 443bcb                         cmp        r9d, ebx
00bea 7fe0                           jg         0x7f4b87e5e34c
00bec 4183f93f                       cmp        r9d, 0x3f
00bf0 0f8ea60f0000                   jle        0x7f4b87e5f31c
00bf6 41ffca                         dec        r10d
00bf9 eb08                           jmp        0x7f4b87e5e383
00bfb 0f1f440000                     nop        dword ptr [rax + rax]
00c00 458bd0                         mov        r10d, r8d
00c03 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00c08 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00c13 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00c1e 62917e486f849088ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x78]
00c29 62917e487f84908cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x74], zmm0
00c34 62917e486f849048ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xb8]
00c3f 62917e487f84904cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xb4], zmm0
00c4a 62917e486f849008ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xf8]
00c55 62917e487f84900cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xf4], zmm0
00c60 458d42c0                       lea        r8d, [r10 - 0x40]
00c64 4183f83f                       cmp        r8d, 0x3f
00c68 7f96                           jg         0x7f4b87e5e380
00c6a 4183f80f                       cmp        r8d, 0xf
00c6e 7e2d                           jle        0x7f4b87e5e41d
00c70 458bc2                         mov        r8d, r10d
00c73 4183c0c0                       add        r8d, -0x40
00c77 90                             nop        
00c78 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00c7d 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00c88 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00c93 4183c0f0                       add        r8d, -0x10
00c97 4183f80f                       cmp        r8d, 0xf
00c9b 7fdb                           jg         0x7f4b87e5e3f8
00c9d 4585c0                         test       r8d, r8d
00ca0 0f8e34f9ffff                   jle        0x7f4b87e5dd5a
00ca6 6690                           nop        
00ca8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00cad 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00cb2 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00cb7 4789548108                     mov        dword ptr [r9 + r8*4 + 8], r10d
00cbc 41ffc8                         dec        r8d
00cbf 4585c0                         test       r8d, r8d
00cc2 7fe4                           jg         0x7f4b87e5e428
00cc4 e911f9ffff                     jmp        0x7f4b87e5dd5a
00cc9 4d63d0                         movsxd     r10, r8d
00ccc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cd3 c442a8f5db                     bzhi       r11, r11, r10
00cd8 c4c1fb92fb                     kmovq      k7, r11
00cdd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ce3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ce9 e98b000000                     jmp        0x7f4b87e5e4f9
00cee 4585ed                         test       r13d, r13d
00cf1 0f8c85110000                   jl         0x7f4b87e5f5fc
00cf7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00cfc 4585d2                         test       r10d, r10d
00cff 0f8c7c110000                   jl         0x7f4b87e5f601
00d05 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00d0a 443b4c2410                     cmp        r9d, dword ptr [rsp + 0x10]
00d0f 0f826c110000                   jb         0x7f4b87e5f601
00d15 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00d19 4103e8                         add        ebp, r8d
00d1c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00d24 443bdd                         cmp        r11d, ebp
00d27 0f8254110000                   jb         0x7f4b87e5f601
00d2d 4585c0                         test       r8d, r8d
00d30 0f8c4b110000                   jl         0x7f4b87e5f601
00d36 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00d3b 453bcd                         cmp        r9d, r13d
00d3e 7439                           je         0x7f4b87e5e4f9
00d40 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d45 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00d4a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00d4f 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00d54 4963d0                         movsxd     rdx, r8d
00d57 4883fa20                       cmp        rdx, 0x20
00d5b 0f8668ffffff                   jbe        0x7f4b87e5e449
00d61 c5f877                         vzeroupper 
00d64 49ba204f8e874b7f0000           movabs     r10, 0x7f4b878e4f20
00d6e 41ffd2                         call       r10
00d71 0f1f840000000000               nop        dword ptr [rax + rax]
00d79 4c8b1424                       mov        r10, qword ptr [rsp]
00d7d 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00d81 c5f877                         vzeroupper 
00d84 4881c4c0000000                 add        rsp, 0xc0
00d8b 5d                             pop        rbp
00d8c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d90 0f8746110000                   ja         0x7f4b87e5f65c
00d96 c3                             ret        
00d97 41ffcb                         dec        r11d
00d9a 4585db                         test       r11d, r11d
00d9d 7e1a                           jle        0x7f4b87e5e539
00d9f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00da4 45894a10                       mov        dword ptr [r10 + 0x10], r9d
00da8 458b4208                       mov        r8d, dword ptr [r10 + 8]
00dac 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00db0 45895a08                       mov        dword ptr [r10 + 8], r11d
00db4 e92af8ffff                     jmp        0x7f4b87e5dd63
00db9 48be50af72e200000000           movabs     rsi, 0xe272af50
00dc3 418bed                         mov        ebp, r13d
00dc6 6690                           nop        
00dc8 c5f877                         vzeroupper 
00dcb e810d3a9ff                     call       0x7f4b878fb860
00dd0 0f1f8400c80e000c               nop        dword ptr [rax + rax + 0xc000ec8]
00dd8 4885c0                         test       rax, rax
00ddb 0f8538f8ffff                   jne        0x7f4b87e5dd99
00de1 bef6ffffff                     mov        esi, 0xfffffff6
00de6 6690                           nop        
00de8 c5f877                         vzeroupper 
00deb e8f050b6ff                     call       0x7f4b879c3660
00df0 0f1f8400e80e000d               nop        dword ptr [rax + rax + 0xd000ee8]
00df8 bee4ffffff                     mov        esi, 0xffffffe4
00dfd 488b2c24                       mov        rbp, qword ptr [rsp]
00e01 48ff742408                     push       qword ptr [rsp + 8]
00e06 488f0424                       pop        qword ptr [rsp]
00e0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00e13 89442408                       mov        dword ptr [rsp + 8], eax
00e17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e21 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e25 8944240c                       mov        dword ptr [rsp + 0xc], eax
00e29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e2e 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00e33 90                             nop        
00e34 c5f877                         vzeroupper 
00e37 e8a450b6ff                     call       0x7f4b879c3660
00e3c 0f1f8400340f000e               nop        dword ptr [rax + rax + 0xe000f34]
00e44 bee4ffffff                     mov        esi, 0xffffffe4
00e49 488b2c24                       mov        rbp, qword ptr [rsp]
00e4d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e52 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e56 89442414                       mov        dword ptr [rsp + 0x14], eax
00e5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5f 48ff742470                     push       qword ptr [rsp + 0x70]
00e64 488f442428                     pop        qword ptr [rsp + 0x28]
00e69 48894424f8                     mov        qword ptr [rsp - 8], rax
00e6e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00e72 89442470                       mov        dword ptr [rsp + 0x70], eax
00e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e7b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00e80 c5f877                         vzeroupper 
00e83 e85850b6ff                     call       0x7f4b879c3660
00e88 0f1f8400800f000f               nop        dword ptr [rax + rax + 0xf000f80]
00e90 bee4ffffff                     mov        esi, 0xffffffe4
00e95 488b2c24                       mov        rbp, qword ptr [rsp]
00e99 48ff742408                     push       qword ptr [rsp + 8]
00e9e 488f0424                       pop        qword ptr [rsp]
00ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00eab 89442408                       mov        dword ptr [rsp + 8], eax
00eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb4 48ff742418                     push       qword ptr [rsp + 0x18]
00eb9 488f442410                     pop        qword ptr [rsp + 0x10]
00ebe 48ff742420                     push       qword ptr [rsp + 0x20]
00ec3 488f442418                     pop        qword ptr [rsp + 0x18]
00ec8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ecd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ed1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00ed5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eda 48ff742470                     push       qword ptr [rsp + 0x70]
00edf 488f442420                     pop        qword ptr [rsp + 0x20]
00ee4 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00ee9 48894424f8                     mov        qword ptr [rsp - 8], rax
00eee 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00ef2 89442470                       mov        dword ptr [rsp + 0x70], eax
00ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efb 48894424f8                     mov        qword ptr [rsp - 8], rax
00f00 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00f07 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00f0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f10 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00f19 666690                         nop        
00f1c c5f877                         vzeroupper 
00f1f e8bc4fb6ff                     call       0x7f4b879c3660
00f24 0f1f84001c100010               nop        dword ptr [rax + rax + 0x1000101c]
00f2c bee4ffffff                     mov        esi, 0xffffffe4
00f31 488b2c24                       mov        rbp, qword ptr [rsp]
00f35 48ff742408                     push       qword ptr [rsp + 8]
00f3a 488f0424                       pop        qword ptr [rsp]
00f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f43 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f47 89442408                       mov        dword ptr [rsp + 8], eax
00f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f50 48ff742418                     push       qword ptr [rsp + 0x18]
00f55 488f442410                     pop        qword ptr [rsp + 0x10]
00f5a 48ff742420                     push       qword ptr [rsp + 0x20]
00f5f 488f442418                     pop        qword ptr [rsp + 0x18]
00f64 48894424f8                     mov        qword ptr [rsp - 8], rax
00f69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f6d 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f76 48ff742470                     push       qword ptr [rsp + 0x70]
00f7b 488f442420                     pop        qword ptr [rsp + 0x20]
00f80 c5f877                         vzeroupper 
00f83 e8584fb6ff                     call       0x7f4b879c3660
00f88 0f1f840080100011               nop        dword ptr [rax + rax + 0x11001080]
00f90 bee4ffffff                     mov        esi, 0xffffffe4
00f95 488b2c24                       mov        rbp, qword ptr [rsp]
00f99 48ff742408                     push       qword ptr [rsp + 8]
00f9e 488f0424                       pop        qword ptr [rsp]
00fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00fab 89442408                       mov        dword ptr [rsp + 8], eax
00faf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb4 48ff742418                     push       qword ptr [rsp + 0x18]
00fb9 488f442410                     pop        qword ptr [rsp + 0x10]
00fbe 48ff742420                     push       qword ptr [rsp + 0x20]
00fc3 488f442418                     pop        qword ptr [rsp + 0x18]
00fc8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00fd1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fda 48ff742470                     push       qword ptr [rsp + 0x70]
00fdf 488f442420                     pop        qword ptr [rsp + 0x20]
00fe4 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00fe9 48894424f8                     mov        qword ptr [rsp - 8], rax
00fee 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ff5 89442474                       mov        dword ptr [rsp + 0x74], eax
00ff9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffe c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01007 90                             nop        
01008 c5f877                         vzeroupper 
0100b e8d04eb6ff                     call       0x7f4b879c3660
01010 0f1f840008110012               nop        dword ptr [rax + rax + 0x12001108]
01018 be45ffffff                     mov        esi, 0xffffff45
0101d 488b2c24                       mov        rbp, qword ptr [rsp]
01021 4c89542408                     mov        qword ptr [rsp + 8], r10
01026 6690                           nop        
01028 c5f877                         vzeroupper 
0102b e8b04eb6ff                     call       0x7f4b879c3660
01030 0f1f840028110013               nop        dword ptr [rax + rax + 0x13001128]
01038 be45ffffff                     mov        esi, 0xffffff45
0103d 488b2c24                       mov        rbp, qword ptr [rsp]
01041 48ff742408                     push       qword ptr [rsp + 8]
01046 488f0424                       pop        qword ptr [rsp]
0104a 48894424f8                     mov        qword ptr [rsp - 8], rax
0104f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01053 89442408                       mov        dword ptr [rsp + 8], eax
01057 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0105c 48ff742418                     push       qword ptr [rsp + 0x18]
01061 488f442410                     pop        qword ptr [rsp + 0x10]
01066 48ff742420                     push       qword ptr [rsp + 0x20]
0106b 488f442418                     pop        qword ptr [rsp + 0x18]
01070 48894424f8                     mov        qword ptr [rsp - 8], rax
01075 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01079 8944240c                       mov        dword ptr [rsp + 0xc], eax
0107d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01082 48ff742430                     push       qword ptr [rsp + 0x30]
01087 488f442428                     pop        qword ptr [rsp + 0x28]
0108c 48894424f8                     mov        qword ptr [rsp - 8], rax
01091 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01095 89442430                       mov        dword ptr [rsp + 0x30], eax
01099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
010a3 48894424f8                     mov        qword ptr [rsp - 8], rax
010a8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010ac 89442438                       mov        dword ptr [rsp + 0x38], eax
010b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b5 48894424f8                     mov        qword ptr [rsp - 8], rax
010ba 8b442448                       mov        eax, dword ptr [rsp + 0x48]
010be 8944243c                       mov        dword ptr [rsp + 0x3c], eax
010c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c7 48ff742450                     push       qword ptr [rsp + 0x50]
010cc 488f442448                     pop        qword ptr [rsp + 0x48]
010d1 48ff742458                     push       qword ptr [rsp + 0x58]
010d6 488f442450                     pop        qword ptr [rsp + 0x50]
010db 48894424f8                     mov        qword ptr [rsp - 8], rax
010e0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
010e4 89442458                       mov        dword ptr [rsp + 0x58], eax
010e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ed 48894424f8                     mov        qword ptr [rsp - 8], rax
010f2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
010f6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
010fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01104 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01108 89442460                       mov        dword ptr [rsp + 0x60], eax
0110c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01111 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01116 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0111b 90                             nop        
0111c c5f877                         vzeroupper 
0111f e8bc4db6ff                     call       0x7f4b879c3660
01124 0f1f84001c120014               nop        dword ptr [rax + rax + 0x1400121c]
0112c 4d3bc2                         cmp        r8, r10
0112f bdffffffff                     mov        ebp, 0xffffffff
01134 7c08                           jl         0x7f4b87e5e8be
01136 400f95c5                       setne      bpl
0113a 400fb6ed                       movzx      ebp, bpl
0113e be45ffffff                     mov        esi, 0xffffff45
01143 48894424f8                     mov        qword ptr [rsp - 8], rax
01148 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0114c 89442414                       mov        dword ptr [rsp + 0x14], eax
01150 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01155 48ff742470                     push       qword ptr [rsp + 0x70]
0115a 488f442428                     pop        qword ptr [rsp + 0x28]
0115f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01164 48894424f8                     mov        qword ptr [rsp - 8], rax
01169 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0116d 89442470                       mov        dword ptr [rsp + 0x70], eax
01171 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01176 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0117b 90                             nop        
0117c c5f877                         vzeroupper 
0117f e85c4db6ff                     call       0x7f4b879c3660
01184 0f1f84007c120015               nop        dword ptr [rax + rax + 0x1500127c]
0118c be45ffffff                     mov        esi, 0xffffff45
01191 488b2c24                       mov        rbp, qword ptr [rsp]
01195 48ff742408                     push       qword ptr [rsp + 8]
0119a 488f0424                       pop        qword ptr [rsp]
0119e 48894424f8                     mov        qword ptr [rsp - 8], rax
011a3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
011a7 89442408                       mov        dword ptr [rsp + 8], eax
011ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b0 48ff742418                     push       qword ptr [rsp + 0x18]
011b5 488f442410                     pop        qword ptr [rsp + 0x10]
011ba 48ff742420                     push       qword ptr [rsp + 0x20]
011bf 488f442418                     pop        qword ptr [rsp + 0x18]
011c4 48894424f8                     mov        qword ptr [rsp - 8], rax
011c9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011cd 8944240c                       mov        dword ptr [rsp + 0xc], eax
011d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d6 48ff742470                     push       qword ptr [rsp + 0x70]
011db 488f442420                     pop        qword ptr [rsp + 0x20]
011e0 48ff742430                     push       qword ptr [rsp + 0x30]
011e5 488f442428                     pop        qword ptr [rsp + 0x28]
011ea 48894424f8                     mov        qword ptr [rsp - 8], rax
011ef 8b442438                       mov        eax, dword ptr [rsp + 0x38]
011f3 89442430                       mov        dword ptr [rsp + 0x30], eax
011f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011fc 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01201 48894424f8                     mov        qword ptr [rsp - 8], rax
01206 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0120a 89442438                       mov        dword ptr [rsp + 0x38], eax
0120e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01213 48894424f8                     mov        qword ptr [rsp - 8], rax
01218 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0121c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01220 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01225 48ff742450                     push       qword ptr [rsp + 0x50]
0122a 488f442448                     pop        qword ptr [rsp + 0x48]
0122f 48ff742458                     push       qword ptr [rsp + 0x58]
01234 488f442450                     pop        qword ptr [rsp + 0x50]
01239 48894424f8                     mov        qword ptr [rsp - 8], rax
0123e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01242 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01246 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124b 48894424f8                     mov        qword ptr [rsp - 8], rax
01250 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01254 89442464                       mov        dword ptr [rsp + 0x64], eax
01258 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125d 48894424f8                     mov        qword ptr [rsp - 8], rax
01262 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01266 89442468                       mov        dword ptr [rsp + 0x68], eax
0126a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126f 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01274 c5f877                         vzeroupper 
01277 e8644cb6ff                     call       0x7f4b879c3660
0127c 0f1f840074130016               nop        dword ptr [rax + rax + 0x16001374]
01284 be45ffffff                     mov        esi, 0xffffff45
01289 488b2c24                       mov        rbp, qword ptr [rsp]
0128d 48ff742408                     push       qword ptr [rsp + 8]
01292 488f0424                       pop        qword ptr [rsp]
01296 48894424f8                     mov        qword ptr [rsp - 8], rax
0129b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0129f 89442408                       mov        dword ptr [rsp + 8], eax
012a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a8 48ff742418                     push       qword ptr [rsp + 0x18]
012ad 488f442410                     pop        qword ptr [rsp + 0x10]
012b2 48ff742420                     push       qword ptr [rsp + 0x20]
012b7 488f442418                     pop        qword ptr [rsp + 0x18]
012bc 48894424f8                     mov        qword ptr [rsp - 8], rax
012c1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012c5 8944240c                       mov        dword ptr [rsp + 0xc], eax
012c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ce 48ff742470                     push       qword ptr [rsp + 0x70]
012d3 488f442420                     pop        qword ptr [rsp + 0x20]
012d8 48ff742430                     push       qword ptr [rsp + 0x30]
012dd 488f442428                     pop        qword ptr [rsp + 0x28]
012e2 48894424f8                     mov        qword ptr [rsp - 8], rax
012e7 8b442438                       mov        eax, dword ptr [rsp + 0x38]
012eb 89442430                       mov        dword ptr [rsp + 0x30], eax
012ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f4 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
012f9 48894424f8                     mov        qword ptr [rsp - 8], rax
012fe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01302 89442438                       mov        dword ptr [rsp + 0x38], eax
01306 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130b 48894424f8                     mov        qword ptr [rsp - 8], rax
01310 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01314 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131d 48ff742450                     push       qword ptr [rsp + 0x50]
01322 488f442448                     pop        qword ptr [rsp + 0x48]
01327 48ff742458                     push       qword ptr [rsp + 0x58]
0132c 488f442450                     pop        qword ptr [rsp + 0x50]
01331 48894424f8                     mov        qword ptr [rsp - 8], rax
01336 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0133a 89442458                       mov        dword ptr [rsp + 0x58], eax
0133e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01343 48894424f8                     mov        qword ptr [rsp - 8], rax
01348 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0134c 89442460                       mov        dword ptr [rsp + 0x60], eax
01350 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01355 48894424f8                     mov        qword ptr [rsp - 8], rax
0135a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0135e 89442468                       mov        dword ptr [rsp + 0x68], eax
01362 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01367 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0136c c5f877                         vzeroupper 
0136f e86c4bb6ff                     call       0x7f4b879c3660
01374 0f1f84006c140017               nop        dword ptr [rax + rax + 0x1700146c]
0137c be45ffffff                     mov        esi, 0xffffff45
01381 488b2c24                       mov        rbp, qword ptr [rsp]
01385 48ff742408                     push       qword ptr [rsp + 8]
0138a 488f0424                       pop        qword ptr [rsp]
0138e 48894424f8                     mov        qword ptr [rsp - 8], rax
01393 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01397 89442408                       mov        dword ptr [rsp + 8], eax
0139b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a0 48ff742418                     push       qword ptr [rsp + 0x18]
013a5 488f442410                     pop        qword ptr [rsp + 0x10]
013aa 48ff742420                     push       qword ptr [rsp + 0x20]
013af 488f442418                     pop        qword ptr [rsp + 0x18]
013b4 48894424f8                     mov        qword ptr [rsp - 8], rax
013b9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013bd 8944240c                       mov        dword ptr [rsp + 0xc], eax
013c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c6 48ff742470                     push       qword ptr [rsp + 0x70]
013cb 488f442420                     pop        qword ptr [rsp + 0x20]
013d0 48ff742430                     push       qword ptr [rsp + 0x30]
013d5 488f442428                     pop        qword ptr [rsp + 0x28]
013da 48894424f8                     mov        qword ptr [rsp - 8], rax
013df 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013e3 89442430                       mov        dword ptr [rsp + 0x30], eax
013e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ec 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
013f1 48894424f8                     mov        qword ptr [rsp - 8], rax
013f6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013fa 89442438                       mov        dword ptr [rsp + 0x38], eax
013fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01403 48894424f8                     mov        qword ptr [rsp - 8], rax
01408 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0140c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01410 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01415 48ff742450                     push       qword ptr [rsp + 0x50]
0141a 488f442448                     pop        qword ptr [rsp + 0x48]
0141f 48ff742458                     push       qword ptr [rsp + 0x58]
01424 488f442450                     pop        qword ptr [rsp + 0x50]
01429 48894424f8                     mov        qword ptr [rsp - 8], rax
0142e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01432 89442458                       mov        dword ptr [rsp + 0x58], eax
01436 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143b 48894424f8                     mov        qword ptr [rsp - 8], rax
01440 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01444 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01448 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144d 48894424f8                     mov        qword ptr [rsp - 8], rax
01452 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01456 89442460                       mov        dword ptr [rsp + 0x60], eax
0145a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145f 90                             nop        
01460 c5f877                         vzeroupper 
01463 e8784ab6ff                     call       0x7f4b879c3660
01468 0f1f840060150018               nop        dword ptr [rax + rax + 0x18001560]
01470 be45ffffff                     mov        esi, 0xffffff45
01475 488b2c24                       mov        rbp, qword ptr [rsp]
01479 48ff742408                     push       qword ptr [rsp + 8]
0147e 488f0424                       pop        qword ptr [rsp]
01482 48894424f8                     mov        qword ptr [rsp - 8], rax
01487 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0148b 89442408                       mov        dword ptr [rsp + 8], eax
0148f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01494 48ff742418                     push       qword ptr [rsp + 0x18]
01499 488f442410                     pop        qword ptr [rsp + 0x10]
0149e 48ff742420                     push       qword ptr [rsp + 0x20]
014a3 488f442418                     pop        qword ptr [rsp + 0x18]
014a8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014b1 8944240c                       mov        dword ptr [rsp + 0xc], eax
014b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ba 48ff742470                     push       qword ptr [rsp + 0x70]
014bf 488f442420                     pop        qword ptr [rsp + 0x20]
014c4 48ff742430                     push       qword ptr [rsp + 0x30]
014c9 488f442428                     pop        qword ptr [rsp + 0x28]
014ce 48894424f8                     mov        qword ptr [rsp - 8], rax
014d3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
014d7 89442438                       mov        dword ptr [rsp + 0x38], eax
014db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e0 48894424f8                     mov        qword ptr [rsp - 8], rax
014e5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014e9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f2 48ff742450                     push       qword ptr [rsp + 0x50]
014f7 488f442448                     pop        qword ptr [rsp + 0x48]
014fc 48ff742458                     push       qword ptr [rsp + 0x58]
01501 488f442450                     pop        qword ptr [rsp + 0x50]
01506 48894424f8                     mov        qword ptr [rsp - 8], rax
0150b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0150f 89442458                       mov        dword ptr [rsp + 0x58], eax
01513 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01518 48894424f8                     mov        qword ptr [rsp - 8], rax
0151d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01521 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01525 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152a 48894424f8                     mov        qword ptr [rsp - 8], rax
0152f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01533 89442460                       mov        dword ptr [rsp + 0x60], eax
01537 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153c 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01540 c5f877                         vzeroupper 
01543 e89849b6ff                     call       0x7f4b879c3660
01548 0f1f840040160019               nop        dword ptr [rax + rax + 0x19001640]
01550 4533d2                         xor        r10d, r10d
01553 4c891424                       mov        qword ptr [rsp], r10
01557 e9ecebffff                     jmp        0x7f4b87e5d8c8
0155c 4533d2                         xor        r10d, r10d
0155f 4c89542408                     mov        qword ptr [rsp + 8], r10
01564 e911ecffff                     jmp        0x7f4b87e5d8fa
01569 4533d2                         xor        r10d, r10d
0156c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01571 e936ecffff                     jmp        0x7f4b87e5d92c
01576 4533d2                         xor        r10d, r10d
01579 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0157e e953ecffff                     jmp        0x7f4b87e5d956
01583 4533d2                         xor        r10d, r10d
01586 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0158b e978ecffff                     jmp        0x7f4b87e5d988
01590 4533d2                         xor        r10d, r10d
01593 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01598 e995ecffff                     jmp        0x7f4b87e5d9b2
0159d bebeffffff                     mov        esi, 0xffffffbe
015a2 488b2c24                       mov        rbp, qword ptr [rsp]
015a6 48ff742408                     push       qword ptr [rsp + 8]
015ab 488f0424                       pop        qword ptr [rsp]
015af 48894424f8                     mov        qword ptr [rsp - 8], rax
015b4 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015b8 89442408                       mov        dword ptr [rsp + 8], eax
015bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c1 48ff742418                     push       qword ptr [rsp + 0x18]
015c6 488f442410                     pop        qword ptr [rsp + 0x10]
015cb 48ff742420                     push       qword ptr [rsp + 0x20]
015d0 488f442418                     pop        qword ptr [rsp + 0x18]
015d5 48894424f8                     mov        qword ptr [rsp - 8], rax
015da 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015de 8944240c                       mov        dword ptr [rsp + 0xc], eax
015e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e7 48ff742430                     push       qword ptr [rsp + 0x30]
015ec 488f442428                     pop        qword ptr [rsp + 0x28]
015f1 48894424f8                     mov        qword ptr [rsp - 8], rax
015f6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
015fa 89442430                       mov        dword ptr [rsp + 0x30], eax
015fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01603 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01608 48894424f8                     mov        qword ptr [rsp - 8], rax
0160d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01611 89442438                       mov        dword ptr [rsp + 0x38], eax
01615 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161a 48894424f8                     mov        qword ptr [rsp - 8], rax
0161f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01623 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01627 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162c 48ff742450                     push       qword ptr [rsp + 0x50]
01631 488f442448                     pop        qword ptr [rsp + 0x48]
01636 48ff742458                     push       qword ptr [rsp + 0x58]
0163b 488f442450                     pop        qword ptr [rsp + 0x50]
01640 48894424f8                     mov        qword ptr [rsp - 8], rax
01645 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01649 89442458                       mov        dword ptr [rsp + 0x58], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 6690                           nop        
01654 c5f877                         vzeroupper 
01657 e88448b6ff                     call       0x7f4b879c3660
0165c 0f1f84005417001a               nop        dword ptr [rax + rax + 0x1a001754]
01664 be85ffffff                     mov        esi, 0xffffff85
01669 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0166d 48894424f8                     mov        qword ptr [rsp - 8], rax
01672 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01676 890424                         mov        dword ptr [rsp], eax
01679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167e 44896c2408                     mov        dword ptr [rsp + 8], r13d
01683 90                             nop        
01684 c5f877                         vzeroupper 
01687 e85448b6ff                     call       0x7f4b879c3660
0168c 0f1f84008417001b               nop        dword ptr [rax + rax + 0x1b001784]
01694 bee4ffffff                     mov        esi, 0xffffffe4
01699 488b2c24                       mov        rbp, qword ptr [rsp]
0169d 48ff742408                     push       qword ptr [rsp + 8]
016a2 488f0424                       pop        qword ptr [rsp]
016a6 48894424f8                     mov        qword ptr [rsp - 8], rax
016ab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016af 89442408                       mov        dword ptr [rsp + 8], eax
016b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b8 48ff742418                     push       qword ptr [rsp + 0x18]
016bd 488f442410                     pop        qword ptr [rsp + 0x10]
016c2 48ff742420                     push       qword ptr [rsp + 0x20]
016c7 488f442418                     pop        qword ptr [rsp + 0x18]
016cc 48894424f8                     mov        qword ptr [rsp - 8], rax
016d1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016d5 8944240c                       mov        dword ptr [rsp + 0xc], eax
016d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016de 48ff742430                     push       qword ptr [rsp + 0x30]
016e3 488f442428                     pop        qword ptr [rsp + 0x28]
016e8 48894424f8                     mov        qword ptr [rsp - 8], rax
016ed 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016f1 89442430                       mov        dword ptr [rsp + 0x30], eax
016f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fa 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01704 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01708 89442438                       mov        dword ptr [rsp + 0x38], eax
0170c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01711 48894424f8                     mov        qword ptr [rsp - 8], rax
01716 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0171a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0171e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01723 48ff742450                     push       qword ptr [rsp + 0x50]
01728 488f442448                     pop        qword ptr [rsp + 0x48]
0172d 48ff742458                     push       qword ptr [rsp + 0x58]
01732 488f442450                     pop        qword ptr [rsp + 0x50]
01737 48894424f8                     mov        qword ptr [rsp - 8], rax
0173c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01740 89442458                       mov        dword ptr [rsp + 0x58], eax
01744 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01749 48894424f8                     mov        qword ptr [rsp - 8], rax
0174e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01752 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01756 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175b 48894424f8                     mov        qword ptr [rsp - 8], rax
01760 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01764 89442460                       mov        dword ptr [rsp + 0x60], eax
01768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176d 48894424f8                     mov        qword ptr [rsp - 8], rax
01772 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01776 89442464                       mov        dword ptr [rsp + 0x64], eax
0177a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177f 894c2468                       mov        dword ptr [rsp + 0x68], ecx
01783 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0178b 90                             nop        
0178c c5f877                         vzeroupper 
0178f e84c47b6ff                     call       0x7f4b879c3660
01794 0f1f84008c18001c               nop        dword ptr [rax + rax + 0x1c00188c]
0179c bef6ffffff                     mov        esi, 0xfffffff6
017a1 666690                         nop        
017a4 c5f877                         vzeroupper 
017a7 e83447b6ff                     call       0x7f4b879c3660
017ac 0f1f8400a418001d               nop        dword ptr [rax + rax + 0x1d0018a4]
017b4 bee4ffffff                     mov        esi, 0xffffffe4
017b9 488b2c24                       mov        rbp, qword ptr [rsp]
017bd 48ff742408                     push       qword ptr [rsp + 8]
017c2 488f0424                       pop        qword ptr [rsp]
017c6 48894424f8                     mov        qword ptr [rsp - 8], rax
017cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017cf 89442408                       mov        dword ptr [rsp + 8], eax
017d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d8 48ff742418                     push       qword ptr [rsp + 0x18]
017dd 488f442410                     pop        qword ptr [rsp + 0x10]
017e2 48ff742420                     push       qword ptr [rsp + 0x20]
017e7 488f442418                     pop        qword ptr [rsp + 0x18]
017ec 48894424f8                     mov        qword ptr [rsp - 8], rax
017f1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017f5 8944240c                       mov        dword ptr [rsp + 0xc], eax
017f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fe 48ff742470                     push       qword ptr [rsp + 0x70]
01803 488f442420                     pop        qword ptr [rsp + 0x20]
01808 48894424f8                     mov        qword ptr [rsp - 8], rax
0180d 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01811 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181a 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0181e 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01826 6690                           nop        
01828 c5f877                         vzeroupper 
0182b e8b046b6ff                     call       0x7f4b879c3660
01830 0f1f84002819001e               nop        dword ptr [rax + rax + 0x1e001928]
01838 bee4ffffff                     mov        esi, 0xffffffe4
0183d 488b2c24                       mov        rbp, qword ptr [rsp]
01841 48ff742408                     push       qword ptr [rsp + 8]
01846 488f0424                       pop        qword ptr [rsp]
0184a 48894424f8                     mov        qword ptr [rsp - 8], rax
0184f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01853 89442408                       mov        dword ptr [rsp + 8], eax
01857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185c 48ff742418                     push       qword ptr [rsp + 0x18]
01861 488f442410                     pop        qword ptr [rsp + 0x10]
01866 48ff742420                     push       qword ptr [rsp + 0x20]
0186b 488f442418                     pop        qword ptr [rsp + 0x18]
01870 48894424f8                     mov        qword ptr [rsp - 8], rax
01875 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01879 8944240c                       mov        dword ptr [rsp + 0xc], eax
0187d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01882 48ff742470                     push       qword ptr [rsp + 0x70]
01887 488f442420                     pop        qword ptr [rsp + 0x20]
0188c 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01890 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01895 666690                         nop        
01898 c5f877                         vzeroupper 
0189b e84046b6ff                     call       0x7f4b879c3660
018a0 0f1f84009819001f               nop        dword ptr [rax + rax + 0x1f001998]
018a8 beccffffff                     mov        esi, 0xffffffcc
018ad 488b2c24                       mov        rbp, qword ptr [rsp]
018b1 48ff742408                     push       qword ptr [rsp + 8]
018b6 488f0424                       pop        qword ptr [rsp]
018ba 48894424f8                     mov        qword ptr [rsp - 8], rax
018bf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018c3 89442408                       mov        dword ptr [rsp + 8], eax
018c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cc 48ff742418                     push       qword ptr [rsp + 0x18]
018d1 488f442410                     pop        qword ptr [rsp + 0x10]
018d6 48ff742420                     push       qword ptr [rsp + 0x20]
018db 488f442418                     pop        qword ptr [rsp + 0x18]
018e0 48894424f8                     mov        qword ptr [rsp - 8], rax
018e5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018e9 8944240c                       mov        dword ptr [rsp + 0xc], eax
018ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f2 48ff742470                     push       qword ptr [rsp + 0x70]
018f7 488f442420                     pop        qword ptr [rsp + 0x20]
018fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01901 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01905 89442438                       mov        dword ptr [rsp + 0x38], eax
01909 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190e 6690                           nop        
01910 c5f877                         vzeroupper 
01913 e8c845b6ff                     call       0x7f4b879c3660
01918 0f1f8400101a0020               nop        dword ptr [rax + rax + 0x20001a10]
01920 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01928 458d5308                       lea        r10d, [r11 + 8]
0192c be6effffff                     mov        esi, 0xffffff6e
01931 488b2c24                       mov        rbp, qword ptr [rsp]
01935 48ff742408                     push       qword ptr [rsp + 8]
0193a 488f0424                       pop        qword ptr [rsp]
0193e 48894424f8                     mov        qword ptr [rsp - 8], rax
01943 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01947 89442408                       mov        dword ptr [rsp + 8], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48ff742418                     push       qword ptr [rsp + 0x18]
01955 488f442410                     pop        qword ptr [rsp + 0x10]
0195a 48ff742420                     push       qword ptr [rsp + 0x20]
0195f 488f442418                     pop        qword ptr [rsp + 0x18]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0196d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 48ff742470                     push       qword ptr [rsp + 0x70]
0197b 488f442420                     pop        qword ptr [rsp + 0x20]
01980 48ff742430                     push       qword ptr [rsp + 0x30]
01985 488f442428                     pop        qword ptr [rsp + 0x28]
0198a 48894424f8                     mov        qword ptr [rsp - 8], rax
0198f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01993 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199c 48894424f8                     mov        qword ptr [rsp - 8], rax
019a1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019a5 89442460                       mov        dword ptr [rsp + 0x60], eax
019a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ae 48894424f8                     mov        qword ptr [rsp - 8], rax
019b3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019b7 89442464                       mov        dword ptr [rsp + 0x64], eax
019bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
019c5 666690                         nop        
019c8 c5f877                         vzeroupper 
019cb e81045b6ff                     call       0x7f4b879c3660
019d0 0f1f8400c81a0021               nop        dword ptr [rax + rax + 0x21001ac8]
019d8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
019e0 458d5308                       lea        r10d, [r11 + 8]
019e4 be66ffffff                     mov        esi, 0xffffff66
019e9 488b2c24                       mov        rbp, qword ptr [rsp]
019ed 48ff742408                     push       qword ptr [rsp + 8]
019f2 488f0424                       pop        qword ptr [rsp]
019f6 48894424f8                     mov        qword ptr [rsp - 8], rax
019fb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019ff 89442408                       mov        dword ptr [rsp + 8], eax
01a03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a08 48ff742418                     push       qword ptr [rsp + 0x18]
01a0d 488f442410                     pop        qword ptr [rsp + 0x10]
01a12 48ff742420                     push       qword ptr [rsp + 0x20]
01a17 488f442418                     pop        qword ptr [rsp + 0x18]
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a25 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2e 48ff742470                     push       qword ptr [rsp + 0x70]
01a33 488f442420                     pop        qword ptr [rsp + 0x20]
01a38 48ff742430                     push       qword ptr [rsp + 0x30]
01a3d 488f442428                     pop        qword ptr [rsp + 0x28]
01a42 48894424f8                     mov        qword ptr [rsp - 8], rax
01a47 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a4b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a54 48894424f8                     mov        qword ptr [rsp - 8], rax
01a59 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a5d 89442460                       mov        dword ptr [rsp + 0x60], eax
01a61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a66 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a6f 89442464                       mov        dword ptr [rsp + 0x64], eax
01a73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a78 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01a7d 666690                         nop        
01a80 c5f877                         vzeroupper 
01a83 e85844b6ff                     call       0x7f4b879c3660
01a88 0f1f8400801b0022               nop        dword ptr [rax + rax + 0x22001b80]
01a90 be6effffff                     mov        esi, 0xffffff6e
01a95 488b2c24                       mov        rbp, qword ptr [rsp]
01a99 48ff742408                     push       qword ptr [rsp + 8]
01a9e 488f0424                       pop        qword ptr [rsp]
01aa2 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01aab 89442408                       mov        dword ptr [rsp + 8], eax
01aaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab4 48ff742418                     push       qword ptr [rsp + 0x18]
01ab9 488f442410                     pop        qword ptr [rsp + 0x10]
01abe 48ff742420                     push       qword ptr [rsp + 0x20]
01ac3 488f442418                     pop        qword ptr [rsp + 0x18]
01ac8 48894424f8                     mov        qword ptr [rsp - 8], rax
01acd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ad1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ad5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ada 48ff742430                     push       qword ptr [rsp + 0x30]
01adf 488f442428                     pop        qword ptr [rsp + 0x28]
01ae4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01aed 89442430                       mov        dword ptr [rsp + 0x30], eax
01af1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af6 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01afb 48894424f8                     mov        qword ptr [rsp - 8], rax
01b00 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b04 89442438                       mov        dword ptr [rsp + 0x38], eax
01b08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b12 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b16 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1f 48ff742450                     push       qword ptr [rsp + 0x50]
01b24 488f442448                     pop        qword ptr [rsp + 0x48]
01b29 48ff742458                     push       qword ptr [rsp + 0x58]
01b2e 488f442450                     pop        qword ptr [rsp + 0x50]
01b33 48894424f8                     mov        qword ptr [rsp - 8], rax
01b38 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b3c 89442458                       mov        dword ptr [rsp + 0x58], eax
01b40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b45 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b4e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b57 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b60 89442460                       mov        dword ptr [rsp + 0x60], eax
01b64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b69 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b72 89442464                       mov        dword ptr [rsp + 0x64], eax
01b76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7b 894c2468                       mov        dword ptr [rsp + 0x68], ecx
01b7f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01b84 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01b89 666690                         nop        
01b8c c5f877                         vzeroupper 
01b8f e84c43b6ff                     call       0x7f4b879c3660
01b94 0f1f84008c1c0023               nop        dword ptr [rax + rax + 0x23001c8c]
01b9c 458bc1                         mov        r8d, r9d
01b9f e9f9f0ffff                     jmp        0x7f4b87e5e41d
01ba4 bee4ffffff                     mov        esi, 0xffffffe4
01ba9 488b2c24                       mov        rbp, qword ptr [rsp]
01bad 48ff742408                     push       qword ptr [rsp + 8]
01bb2 488f0424                       pop        qword ptr [rsp]
01bb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bbf 89442408                       mov        dword ptr [rsp + 8], eax
01bc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc8 48ff742418                     push       qword ptr [rsp + 0x18]
01bcd 488f442410                     pop        qword ptr [rsp + 0x10]
01bd2 48ff742420                     push       qword ptr [rsp + 0x20]
01bd7 488f442418                     pop        qword ptr [rsp + 0x18]
01bdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01be1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01be5 8944240c                       mov        dword ptr [rsp + 0xc], eax
01be9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bee 48ff742470                     push       qword ptr [rsp + 0x70]
01bf3 488f442420                     pop        qword ptr [rsp + 0x20]
01bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c01 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c13 89442460                       mov        dword ptr [rsp + 0x60], eax
01c17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c21 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c25 89442464                       mov        dword ptr [rsp + 0x64], eax
01c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c33 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c37 89442468                       mov        dword ptr [rsp + 0x68], eax
01c3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c40 48894424f8                     mov        qword ptr [rsp - 8], rax
01c45 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c49 89442474                       mov        dword ptr [rsp + 0x74], eax
01c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c52 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01c57 90                             nop        
01c58 c5f877                         vzeroupper 
01c5b e88042b6ff                     call       0x7f4b879c3660
01c60 0f1f8400581d0024               nop        dword ptr [rax + rax + 0x24001d58]
01c68 bee4ffffff                     mov        esi, 0xffffffe4
01c6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c72 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c76 89442414                       mov        dword ptr [rsp + 0x14], eax
01c7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7f 48ff742470                     push       qword ptr [rsp + 0x70]
01c84 488f442428                     pop        qword ptr [rsp + 0x28]
01c89 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c92 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ca4 89442460                       mov        dword ptr [rsp + 0x60], eax
01ca8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cad 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cb6 89442464                       mov        dword ptr [rsp + 0x64], eax
01cba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbf 90                             nop        
01cc0 c5f877                         vzeroupper 
01cc3 e81842b6ff                     call       0x7f4b879c3660
01cc8 0f1f8400c01d0025               nop        dword ptr [rax + rax + 0x25001dc0]
01cd0 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01cd7 ffc5                           inc        ebp
01cd9 bee4ffffff                     mov        esi, 0xffffffe4
01cde 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ce7 89442414                       mov        dword ptr [rsp + 0x14], eax
01ceb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf0 48ff742470                     push       qword ptr [rsp + 0x70]
01cf5 488f442428                     pop        qword ptr [rsp + 0x28]
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
01d35 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d39 89442470                       mov        dword ptr [rsp + 0x70], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 6690                           nop        
01d44 c5f877                         vzeroupper 
01d47 e89441b6ff                     call       0x7f4b879c3660
01d4c 0f1f8400441e0026               nop        dword ptr [rax + rax + 0x26001e44]
01d54 bee4ffffff                     mov        esi, 0xffffffe4
01d59 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d62 89442414                       mov        dword ptr [rsp + 0x14], eax
01d66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6b 48ff742470                     push       qword ptr [rsp + 0x70]
01d70 488f442428                     pop        qword ptr [rsp + 0x28]
01d75 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d7e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d87 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d90 89442460                       mov        dword ptr [rsp + 0x60], eax
01d94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d99 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01da2 89442464                       mov        dword ptr [rsp + 0x64], eax
01da6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dab 48894424f8                     mov        qword ptr [rsp - 8], rax
01db0 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01db4 89442470                       mov        dword ptr [rsp + 0x70], eax
01db8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbd 666690                         nop        
01dc0 c5f877                         vzeroupper 
01dc3 e81841b6ff                     call       0x7f4b879c3660
01dc8 0f1f8400c01e0027               nop        dword ptr [rax + rax + 0x27001ec0]
01dd0 bee4ffffff                     mov        esi, 0xffffffe4
01dd5 488b2c24                       mov        rbp, qword ptr [rsp]
01dd9 48ff742408                     push       qword ptr [rsp + 8]
01dde 488f0424                       pop        qword ptr [rsp]
01de2 48894424f8                     mov        qword ptr [rsp - 8], rax
01de7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01deb 89442408                       mov        dword ptr [rsp + 8], eax
01def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df4 48ff742418                     push       qword ptr [rsp + 0x18]
01df9 488f442410                     pop        qword ptr [rsp + 0x10]
01dfe 48ff742420                     push       qword ptr [rsp + 0x20]
01e03 488f442418                     pop        qword ptr [rsp + 0x18]
01e08 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e11 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1a 48ff742470                     push       qword ptr [rsp + 0x70]
01e1f 488f442420                     pop        qword ptr [rsp + 0x20]
01e24 48894424f8                     mov        qword ptr [rsp - 8], rax
01e29 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e2d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e36 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e3f 89442460                       mov        dword ptr [rsp + 0x60], eax
01e43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e48 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e51 89442464                       mov        dword ptr [rsp + 0x64], eax
01e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e63 89442470                       mov        dword ptr [rsp + 0x70], eax
01e67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6c c5f877                         vzeroupper 
01e6f e86c40b6ff                     call       0x7f4b879c3660
01e74 0f1f84006c1f0028               nop        dword ptr [rax + rax + 0x28001f6c]
01e7c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e81 beccffffff                     mov        esi, 0xffffffcc
01e86 488b2c24                       mov        rbp, qword ptr [rsp]
01e8a 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e8f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e94 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01e99 666690                         nop        
01e9c c5f877                         vzeroupper 
01e9f e83c40b6ff                     call       0x7f4b879c3660
01ea4 0f1f84009c1f0029               nop        dword ptr [rax + rax + 0x29001f9c]
01eac eb10                           jmp        0x7f4b87e5f63e
01eae eb0e                           jmp        0x7f4b87e5f63e
01eb0 eb0c                           jmp        0x7f4b87e5f63e
01eb2 eb0a                           jmp        0x7f4b87e5f63e
01eb4 eb08                           jmp        0x7f4b87e5f63e
01eb6 eb06                           jmp        0x7f4b87e5f63e
01eb8 eb04                           jmp        0x7f4b87e5f63e
01eba eb02                           jmp        0x7f4b87e5f63e
01ebc eb00                           jmp        0x7f4b87e5f63e
01ebe 488bf0                         mov        rsi, rax
01ec1 e956e7ffff                     jmp        0x7f4b87e5dd9c
01ec6 bef6ffffff                     mov        esi, 0xfffffff6
01ecb 90                             nop        
01ecc c5f877                         vzeroupper 
01ecf e80c40b6ff                     call       0x7f4b879c3660
01ed4 0f1f8400cc1f002a               nop        dword ptr [rax + rax + 0x2a001fcc]
01edc 49ba0ce5e5874b7f0000           movabs     r10, 0x7f4b87e5e50c
01ee6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01eed e96ee8a9ff                     jmp        0x7f4b878fdee0
01ef2 e829b4a8ff                     call       0x7f4b878eaaa0
01ef7 e932e1ffff                     jmp        0x7f4b87e5d7ae
01efc f4                             hlt        
01efd f4                             hlt        
01efe f4                             hlt        
01eff f4                             hlt        
