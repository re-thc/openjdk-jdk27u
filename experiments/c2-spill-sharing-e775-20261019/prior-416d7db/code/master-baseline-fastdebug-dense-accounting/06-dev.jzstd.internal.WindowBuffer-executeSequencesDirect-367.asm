00000 e8fbfa5918                     call       0x7f3dd0173c80
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
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85e8220000                   jne        0x7f3db7bd6496
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004d 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
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
0010d 49bab06333d03d7f0000           movabs     r10, 0x7f3dd03363b0
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84fc150000                   je         0x7f3db7bd58ac
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15040000                 cmp        r11d, 0x415
0013e 0f8510170000                   jne        0x7f3db7bd59d4
00144 4c891424                       mov        qword ptr [rsp], r10
00148 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00150 4d85d2                         test       r10, r10
00153 0f84df150000                   je         0x7f3db7bd58b8
00159 458b12                         mov        r10d, dword ptr [r10]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fa05010000                 cmp        r10d, 0x105
00167 0f85e7160000                   jne        0x7f3db7bd59d4
0016d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00182 4d85d2                         test       r10, r10
00185 0f84ba150000                   je         0x7f3db7bd58c5
0018b 458b12                         mov        r10d, dword ptr [r10]
0018e 41c1ea0d                       shr        r10d, 0xd
00192 4181fa08010000                 cmp        r10d, 0x108
00199 0f85b5160000                   jne        0x7f3db7bd59d4
0019f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
001a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
001b4 4d85d2                         test       r10, r10
001b7 0f8495150000                   je         0x7f3db7bd58d2
001bd 458b1a                         mov        r11d, dword ptr [r10]
001c0 41c1eb0d                       shr        r11d, 0xd
001c4 4181fb07010000                 cmp        r11d, 0x107
001cb 0f8583160000                   jne        0x7f3db7bd59d4
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001de 4d85d2                         test       r10, r10
001e1 0f8478150000                   je         0x7f3db7bd58df
001e7 458b12                         mov        r10d, dword ptr [r10]
001ea 41c1ea0d                       shr        r10d, 0xd
001ee 4181fa07010000                 cmp        r10d, 0x107
001f5 0f8559160000                   jne        0x7f3db7bd59d4
001fb 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00203 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00208 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00210 4d85d2                         test       r10, r10
00213 0f8453150000                   je         0x7f3db7bd58ec
00219 458b1a                         mov        r11d, dword ptr [r10]
0021c 41c1eb0d                       shr        r11d, 0xd
00220 4181fb05010000                 cmp        r11d, 0x105
00227 0f8527160000                   jne        0x7f3db7bd59d4
0022d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023b 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00240 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00245 4585db                         test       r11d, r11d
00248 0f842b150000                   je         0x7f3db7bd58f9
0024e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00253 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00257 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0025c 4183c3f1                       add        r11d, -0xf
00260 4585db                         test       r11d, r11d
00263 0f8c10150000                   jl         0x7f3db7bd58f9
00269 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0026e 458b5204                       mov        r10d, dword ptr [r10 + 4]
00272 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0027a 4183c2f1                       add        r10d, -0xf
0027e 4585d2                         test       r10d, r10d
00281 0f8cf2140000                   jl         0x7f3db7bd58f9
00287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0028c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00290 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00298 4585db                         test       r11d, r11d
0029b 0f86d8140000                   jbe        0x7f3db7bd58f9
002a1 4183fb01                       cmp        r11d, 1
002a5 0f86ce140000                   jbe        0x7f3db7bd58f9
002ab 4183fb02                       cmp        r11d, 2
002af 0f86c4140000                   jbe        0x7f3db7bd58f9
002b5 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002bd 4183c2f9                       add        r10d, -7
002c1 4585d2                         test       r10d, r10d
002c4 0f8caf140000                   jl         0x7f3db7bd58f9
002ca 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002d2 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002da 458d53f1                       lea        r10d, [r11 - 0xf]
002de 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002e6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002eb 4183c3f1                       add        r11d, -0xf
002ef 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
002f7 e9bb010000                     jmp        0x7f3db7bd4637
002fc 4533db                         xor        r11d, r11d
002ff 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00304 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00309 418b4a0c                       mov        ecx, dword ptr [r10 + 0xc]
0030d 4183f803                       cmp        r8d, 3
00311 0f8e49020000                   jle        0x7f3db7bd46e0
00317 41894a10                       mov        dword ptr [r10 + 0x10], ecx
0031b 458b5208                       mov        r10d, dword ptr [r10 + 8]
0031f 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00324 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00328 4183c0fd                       add        r8d, -3
0032c 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00334 45894308                       mov        dword ptr [r11 + 8], r8d
00338 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00340 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00345 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0034a 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
0034f 4d03d3                         add        r10, r11
00352 4d3bc2                         cmp        r8, r10
00355 0f8f450f0000                   jg         0x7f3db7bd5420
0035b 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00363 4585c9                         test       r9d, r9d
00366 0f8ef80d0000                   jle        0x7f3db7bd52e4
0036c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00371 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
00376 4403542478                     add        r10d, dword ptr [rsp + 0x78]
0037b 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
00380 0f8f8e0f0000                   jg         0x7f3db7bd5494
00386 458bd5                         mov        r10d, r13d
00389 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
0038e 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00393 0f8f87100000                   jg         0x7f3db7bd55a0
00399 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0039e 4183fa10                       cmp        r10d, 0x10
003a2 0f8f84110000                   jg         0x7f3db7bd56ac
003a8 443bac2490000000               cmp        r13d, dword ptr [rsp + 0x90]
003b0 0f838a0b0000                   jae        0x7f3db7bd50c0
003b6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003bb c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
003c2 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
003c7 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
003cf 0f83cb0b0000                   jae        0x7f3db7bd5120
003d5 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003da 4503d5                         add        r10d, r13d
003dd 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003e5 458bd0                         mov        r10d, r8d
003e8 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
003ed 4503c2                         add        r8d, r10d
003f0 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
003f5 4963ca                         movsxd     rcx, r10d
003f8 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
003fd c4c17a7f440808                 vmovdqu    xmmword ptr [r8 + rcx + 8], xmm0
00404 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00409 442b8c2494000000               sub        r9d, dword ptr [rsp + 0x94]
00411 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
00419 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0041e 4183f810                       cmp        r8d, 0x10
00422 0f8f0c120000                   jg         0x7f3db7bd57b4
00428 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00430 4183f910                       cmp        r9d, 0x10
00434 0f8c02020000                   jl         0x7f3db7bd47bc
0043a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00442 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0044a 0f83000c0000                   jae        0x7f3db7bd51d0
00450 458bc3                         mov        r8d, r11d
00453 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00458 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0045f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00464 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0046c 0f83560c0000                   jae        0x7f3db7bd5248
00472 458bc2                         mov        r8d, r10d
00475 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0047a 4d63d0                         movsxd     r10, r8d
0047d 438d0c03                       lea        ecx, [r11 + r8]
00481 034c2478                       add        ecx, dword ptr [rsp + 0x78]
00485 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00489 4d63db                         movsxd     r11, r11d
0048c 4d03da                         add        r11, r10
0048f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00494 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0049b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0049f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004a4 41ffc3                         inc        r11d
004a7 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004ac 418502                         test       dword ptr [r10], eax
004af 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
004b7 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
004bc 452bdd                         sub        r11d, r13d
004bf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
004c4 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
004c9 0f8df2080000                   jge        0x7f3db7bd4f41
004cf 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
004d4 0f83060a0000                   jae        0x7f3db7bd5060
004da 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
004df 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004e4 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
004e9 458bca                         mov        r9d, r10d
004ec 4181e1ffff0100                 and        r9d, 0x1ffff
004f3 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
004f8 4d8bc2                         mov        r8, r10
004fb 49c1f824                       sar        r8, 0x24
004ff 49c1ea12                       shr        r10, 0x12
00503 458bc0                         mov        r8d, r8d
00506 458bd2                         mov        r10d, r10d
00509 4181e2ffff0300                 and        r10d, 0x3ffff
00510 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00515 4585c0                         test       r8d, r8d
00518 0f8c7a0c0000                   jl         0x7f3db7bd5318
0051e 4585c9                         test       r9d, r9d
00521 0f84d5fdffff                   je         0x7f3db7bd447c
00527 453bcb                         cmp        r9d, r11d
0052a 0f8ed4fdffff                   jle        0x7f3db7bd4484
00530 be45ffffff                     mov        esi, 0xffffff45
00535 418be9                         mov        ebp, r9d
00538 44891c24                       mov        dword ptr [rsp], r11d
0053c c5f877                         vzeroupper 
0053f e89c93afff                     call       0x7f3db76cda60
00544 0f1f84003c060001               nop        dword ptr [rax + rax + 0x100063c]
0054c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
00556 4883e4f0                       and        rsp, 0xfffffffffffffff0
0055a e8811e3718                     call       0x7f3dcff46560
0055f f4                             hlt        
00560 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00565 4585d2                         test       r10d, r10d
00568 7403                           je         0x7f3db7bd46ed
0056a 41ffc8                         dec        r8d
0056d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00572 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00576 4585c0                         test       r8d, r8d
00579 7478                           je         0x7f3db7bd4773
0057b 4183f803                       cmp        r8d, 3
0057f 0f84e5080000                   je         0x7f3db7bd4fea
00585 4183f802                       cmp        r8d, 2
00589 7775                           ja         0x7f3db7bd4780
0058b 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
00593 0f83ff120000                   jae        0x7f3db7bd5a18
00599 478b5c8208                     mov        r11d, dword ptr [r10 + r8*4 + 8]
0059e 4585c0                         test       r8d, r8d
005a1 7e47                           jle        0x7f3db7bd476a
005a3 458d48ff                       lea        r9d, [r8 - 1]
005a7 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
005af 0f8393170000                   jae        0x7f3db7bd5ec8
005b5 458bd2                         mov        r10d, r10d
005b8 4183c2cc                       add        r10d, -0x34
005bc 41c1ea02                       shr        r10d, 2
005c0 478d4c02ff                     lea        r9d, [r10 + r8 - 1]
005c5 4533d2                         xor        r10d, r10d
005c8 4963c8                         movsxd     rcx, r8d
005cb bf04000000                     mov        edi, 4
005d0 c442c0f5c9                     bzhi       r9, r9, rdi
005d5 492bc9                         sub        rcx, r9
005d8 48ffc9                         dec        rcx
005db 4885c9                         test       rcx, rcx
005de 490f4cca                       cmovl      rcx, r10
005e2 448bc9                         mov        r9d, ecx
005e5 e90d060000                     jmp        0x7f3db7bd4d77
005ea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005ef 45895a08                       mov        dword ptr [r10 + 8], r11d
005f3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
005fb e938fdffff                     jmp        0x7f3db7bd44b8
00600 48beb82574e200000000           movabs     rsi, 0xe27425b8
0060a 418bed                         mov        ebp, r13d
0060d 90                             nop        
0060e 90                             nop        
0060f 90                             nop        
00610 c5f877                         vzeroupper 
00613 e8c8b4b5ff                     call       0x7f3db772fc60
00618 0f1f840010070002               nop        dword ptr [rax + rax + 0x2000710]
00620 4885c0                         test       rax, rax
00623 0f849b130000                   je         0x7f3db7bd5b44
00629 488bf0                         mov        rsi, rax
0062c c5f877                         vzeroupper 
0062f 4881c4c0000000                 add        rsp, 0xc0
00636 5d                             pop        rbp
00637 e9a44bafff                     jmp        0x7f3db76c9360
0063c 440344247c                     add        r8d, dword ptr [rsp + 0x7c]
00641 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00646 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
0064b 0f8dff020000                   jge        0x7f3db7bd4ad0
00651 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00656 4183c008                       add        r8d, 8
0065a 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00662 4183f908                       cmp        r9d, 8
00666 0f8db1010000                   jge        0x7f3db7bd499d
0066c 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00674 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
0067c 0f8342180000                   jae        0x7f3db7bd6044
00682 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00687 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
0068d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00692 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
0069a 0f83fc180000                   jae        0x7f3db7bd611c
006a0 4d63da                         movsxd     r11, r10d
006a3 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
006a8 4d03c3                         add        r8, r11
006ab 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006b0 43886c0308                     mov        byte ptr [r11 + r8 + 8], bpl
006b5 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
006bd 4183c003                       add        r8d, 3
006c1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006c6 41ffc3                         inc        r11d
006c9 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
006d1 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
006d9 0f8339190000                   jae        0x7f3db7bd6198
006df 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
006e4 4183c003                       add        r8d, 3
006e8 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
006f0 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
006f5 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
006fb 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
00703 0f83a7190000                   jae        0x7f3db7bd6230
00709 4d63d2                         movsxd     r10, r10d
0070c 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
00711 4d03c2                         add        r8, r10
00714 43886c0109                     mov        byte ptr [r9 + r8 + 9], bpl
00719 470fbe4c190a                   movsx      r9d, byte ptr [r9 + r11 + 0xa]
0071f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00724 47884c020a                     mov        byte ptr [r10 + r8 + 0xa], r9b
00729 470fbe541a0b                   movsx      r10d, byte ptr [r10 + r11 + 0xb]
0072f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00734 478854030b                     mov        byte ptr [r11 + r8 + 0xb], r10b
00739 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00741 4183fb08                       cmp        r11d, 8
00745 0f83f5190000                   jae        0x7f3db7bd62c0
0074b 49baf85e72e200000000           movabs     r10, 0xe2725ef8
00755 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
0075d 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00762 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00767 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0076c 4183fa04                       cmp        r10d, 4
00770 7e3e                           jle        0x7f3db7bd4930
00772 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
00776 83c504                         add        ebp, 4
00779 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0077e 418bd1                         mov        edx, r9d
00781 90                             nop        
00782 90                             nop        
00783 90                             nop        
00784 c5f877                         vzeroupper 
00787 e854b3b5ff                     call       0x7f3db772fc60
0078c 0f1f840084080003               nop        dword ptr [rax + rax + 0x3000884]
00794 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00799 8bd5                           mov        edx, ebp
0079b 8bc8                           mov        ecx, eax
0079d 90                             nop        
0079e 90                             nop        
0079f 90                             nop        
007a0 c5f877                         vzeroupper 
007a3 e838b3b5ff                     call       0x7f3db772fc60
007a8 0f1f8400a0080004               nop        dword ptr [rax + rax + 0x40008a0]
007b0 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
007b5 4183fa08                       cmp        r10d, 8
007b9 0f8edcfcffff                   jle        0x7f3db7bd461b
007bf 49ba205f72e200000000           movabs     r10, 0xe2725f20
007c9 8b542414                       mov        edx, dword ptr [rsp + 0x14]
007cd 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007d5 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007da 83c208                         add        edx, 8
007dd 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007e2 90                             nop        
007e3 90                             nop        
007e4 c5f877                         vzeroupper 
007e7 e8f4b2b5ff                     call       0x7f3db772fc60
007ec 0f1f8400e4080005               nop        dword ptr [rax + rax + 0x50008e4]
007f4 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
007f8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007fd 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00804 488bc8                         mov        rcx, rax
00807 90                             nop        
00808 c5f877                         vzeroupper 
0080b e8d0b2b5ff                     call       0x7f3db772fc60
00810 0f1f840008090006               nop        dword ptr [rax + rax + 0x6000908]
00818 e97efcffff                     jmp        0x7f3db7bd461b
0081d 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00822 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00829 90                             nop        
0082a 90                             nop        
0082b 90                             nop        
0082c c5f877                         vzeroupper 
0082f e8acb2b5ff                     call       0x7f3db772fc60
00834 0f1f84002c090007               nop        dword ptr [rax + rax + 0x700092c]
0083c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00841 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00845 488bc8                         mov        rcx, rax
00848 c5f877                         vzeroupper 
0084b e890b2b5ff                     call       0x7f3db772fc60
00850 0f1f840048090008               nop        dword ptr [rax + rax + 0x8000948]
00858 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00860 4183c308                       add        r11d, 8
00864 be95ffffff                     mov        esi, 0xffffff95
00869 488b2c24                       mov        rbp, qword ptr [rsp]
0086d 48ff742408                     push       qword ptr [rsp + 8]
00872 488f0424                       pop        qword ptr [rsp]
00876 48894424f8                     mov        qword ptr [rsp - 8], rax
0087b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0087f 89442408                       mov        dword ptr [rsp + 8], eax
00883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00888 48ff742418                     push       qword ptr [rsp + 0x18]
0088d 488f442410                     pop        qword ptr [rsp + 0x10]
00892 48ff742420                     push       qword ptr [rsp + 0x20]
00897 488f442418                     pop        qword ptr [rsp + 0x18]
0089c 48894424f8                     mov        qword ptr [rsp - 8], rax
008a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a5 8944240c                       mov        dword ptr [rsp + 0xc], eax
008a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ae 48ff742430                     push       qword ptr [rsp + 0x30]
008b3 488f442428                     pop        qword ptr [rsp + 0x28]
008b8 48894424f8                     mov        qword ptr [rsp - 8], rax
008bd 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
008c1 89442434                       mov        dword ptr [rsp + 0x34], eax
008c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ca 48894424f8                     mov        qword ptr [rsp - 8], rax
008cf 8b442448                       mov        eax, dword ptr [rsp + 0x48]
008d3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
008d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008dc 48ff742450                     push       qword ptr [rsp + 0x50]
008e1 488f442448                     pop        qword ptr [rsp + 0x48]
008e6 48ff742458                     push       qword ptr [rsp + 0x58]
008eb 488f442450                     pop        qword ptr [rsp + 0x50]
008f0 48894424f8                     mov        qword ptr [rsp - 8], rax
008f5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008f9 89442458                       mov        dword ptr [rsp + 0x58], eax
008fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00902 48894424f8                     mov        qword ptr [rsp - 8], rax
00907 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0090b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0090f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00914 48894424f8                     mov        qword ptr [rsp - 8], rax
00919 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0091d 89442460                       mov        dword ptr [rsp + 0x60], eax
00921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00926 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0092b 90                             nop        
0092c c5f877                         vzeroupper 
0092f e8ac8fafff                     call       0x7f3db76cda60
00934 0f1f84002c0a0009               nop        dword ptr [rax + rax + 0x9000a2c]
0093c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
00946 4883e4f0                       and        rsp, 0xfffffffffffffff0
0094a e8911a3718                     call       0x7f3dcff46560
0094f f4                             hlt        
00950 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00955 4183f830                       cmp        r8d, 0x30
00959 0f8fff010000                   jg         0x7f3db7bd4cde
0095f 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00967 4183c0f9                       add        r8d, -7
0096b 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00973 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0097b 453bd8                         cmp        r11d, r8d
0097e 0f836c100000                   jae        0x7f3db7bd5b70
00984 458bc3                         mov        r8d, r11d
00987 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
0098f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00994 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
00999 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
009a1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
009a6 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
009ae 0f83e0100000                   jae        0x7f3db7bd5c14
009b4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
009b9 4d63d2                         movsxd     r10, r10d
009bc 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
009c1 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
009c6 4d63db                         movsxd     r11, r11d
009c9 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
009ce 418be8                         mov        ebp, r8d
009d1 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
009db 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009e0 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009e8 4533c9                         xor        r9d, r9d
009eb 90                             nop        
009ec c5f877                         vzeroupper 
009ef e8eca6b5ff                     call       0x7f3db772f260
009f4 0f1f8400ec0a000a               nop        dword ptr [rax + rax + 0xa000aec]
009fc 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00a01 44035c2414                     add        r11d, dword ptr [rsp + 0x14]
00a06 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00a0b 458d5308                       lea        r10d, [r11 + 8]
00a0f 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a17 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00a1c 0f8d28010000                   jge        0x7f3db7bd4cca
00a22 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a2a 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00a2f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00a34 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00a3c 4983c0f9                       add        r8, -7
00a40 4d63ca                         movsxd     r9, r10d
00a43 4c639c24a0000000               movsxd     r11, dword ptr [rsp + 0xa0]
00a4b 4f8d140b                       lea        r10, [r11 + r9]
00a4f 4d3bd0                         cmp        r10, r8
00a52 0f8358110000                   jae        0x7f3db7bd5d30
00a58 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00a5d 4d2bd3                         sub        r10, r11
00a60 4983c207                       add        r10, 7
00a64 4983e2f8                       and        r10, 0xfffffffffffffff8
00a68 458bd2                         mov        r10d, r10d
00a6b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a70 478d541a08                     lea        r10d, [r10 + r11 + 8]
00a75 4d63da                         movsxd     r11, r10d
00a78 4f8d5419f8                     lea        r10, [r9 + r11 - 8]
00a7d 4d3bd0                         cmp        r10, r8
00a80 0f832a110000                   jae        0x7f3db7bd5d30
00a86 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a8e 443b8c2494000000               cmp        r9d, dword ptr [rsp + 0x94]
00a96 0f8314110000                   jae        0x7f3db7bd5d30
00a9c 4983c3f8                       add        r11, -8
00aa0 4d3bd8                         cmp        r11, r8
00aa3 0f8307110000                   jae        0x7f3db7bd5d30
00aa9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00aae 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00ab5 0f8fc1110000                   jg         0x7f3db7bd5dfc
00abb 90                             nop        
00abc 90                             nop        
00abd 90                             nop        
00abe 90                             nop        
00abf 90                             nop        
00ac0 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00ac8 4963ca                         movsxd     rcx, r10d
00acb 4883c108                       add        rcx, 8
00acf 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00ad6 036c2414                       add        ebp, dword ptr [rsp + 0x14]
00ada 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00adf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ae4 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00aee 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00af3 4533c9                         xor        r9d, r9d
00af6 90                             nop        
00af7 90                             nop        
00af8 c5f877                         vzeroupper 
00afb e8e0a5b5ff                     call       0x7f3db772f260
00b00 0f1f8400f80b000b               nop        dword ptr [rax + rax + 0xb000bf8]
00b08 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b10 4183c208                       add        r10d, 8
00b14 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00b1c 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00b21 7c9d                           jl         0x7f3db7bd4c40
00b23 eb25                           jmp        0x7f3db7bd4cca
00b25 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00b2a 4d63d2                         movsxd     r10, r10d
00b2d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b34 c442a8f5db                     bzhi       r11, r11, r10
00b39 c4c1fb92fb                     kmovq      k7, r11
00b3e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b44 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b4a 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b4f 4403542478                     add        r10d, dword ptr [rsp + 0x78]
00b54 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b59 e93df9ffff                     jmp        0x7f3db7bd461b
00b5e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b66 4585d2                         test       r10d, r10d
00b69 0f8cb50f0000                   jl         0x7f3db7bd5ca4
00b6f 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00b74 4585c0                         test       r8d, r8d
00b77 0f8ca70f0000                   jl         0x7f3db7bd5ca4
00b7d 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00b82 4503c2                         add        r8d, r10d
00b85 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00b8d 453bd0                         cmp        r10d, r8d
00b90 0f828e0f0000                   jb         0x7f3db7bd5ca4
00b96 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00b9b 0f82830f0000                   jb         0x7f3db7bd5ca4
00ba1 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00ba6 4585d2                         test       r10d, r10d
00ba9 749f                           je         0x7f3db7bd4cca
00bab 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00bb0 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00bb8 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00bbd 4c03d9                         add        r11, rcx
00bc0 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00bc5 4863542478                     movsxd     rdx, dword ptr [rsp + 0x78]
00bca 4883fa20                       cmp        rdx, 0x20
00bce 0f8651ffffff                   jbe        0x7f3db7bd4ca5
00bd4 c5f877                         vzeroupper 
00bd7 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
00be1 41ffd2                         call       r10
00be4 0f1f840000000000               nop        dword ptr [rax + rax]
00bec e959ffffff                     jmp        0x7f3db7bd4cca
00bf1 90                             nop        
00bf2 90                             nop        
00bf3 90                             nop        
00bf4 458bc2                         mov        r8d, r10d
00bf7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00bfc 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00c01 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00c06 4689548108                     mov        dword ptr [rcx + r8*4 + 8], r10d
00c0b 458d50ff                       lea        r10d, [r8 - 1]
00c0f 453bd1                         cmp        r10d, r9d
00c12 7fe0                           jg         0x7f3db7bd4d74
00c14 48638c2484000000               movsxd     rcx, dword ptr [rsp + 0x84]
00c1c 4183fa3f                       cmp        r10d, 0x3f
00c20 0f8e0e010000                   jle        0x7f3db7bd4eb4
00c26 4d63c8                         movsxd     r9, r8d
00c29 4983c1fe                       add        r9, -2
00c2d 4c3bc9                         cmp        r9, rcx
00c30 0f833e120000                   jae        0x7f3db7bd5ff4
00c36 458d48bf                       lea        r9d, [r8 - 0x41]
00c3a 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00c42 0f8340120000                   jae        0x7f3db7bd6008
00c48 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00c50 0f8346120000                   jae        0x7f3db7bd601c
00c56 458d50c0                       lea        r10d, [r8 - 0x40]
00c5a 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00c62 0f8348120000                   jae        0x7f3db7bd6030
00c68 41ffc8                         dec        r8d
00c6b eb06                           jmp        0x7f3db7bd4df3
00c6d 90                             nop        
00c6e 90                             nop        
00c6f 90                             nop        
00c70 458bc2                         mov        r8d, r10d
00c73 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00c78 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00c83 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00c8e 62917e486f848288ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x78]
00c99 62917e487f84828cffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x74], zmm0
00ca4 62917e486f848248ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0xb8]
00caf 62917e487f84824cffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0xb4], zmm0
00cba 62917e486f848208ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0xf8]
00cc5 62917e487f84820cffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0xf4], zmm0
00cd0 458d50c0                       lea        r10d, [r8 - 0x40]
00cd4 4183fa3f                       cmp        r10d, 0x3f
00cd8 7f96                           jg         0x7f3db7bd4df0
00cda 4183fa0f                       cmp        r10d, 0xf
00cde 7e54                           jle        0x7f3db7bd4eb4
00ce0 458bc8                         mov        r9d, r8d
00ce3 458d51b0                       lea        r10d, [r9 - 0x50]
00ce7 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00cef 0f8363150000                   jae        0x7f3db7bd63d8
00cf5 4183c1b1                       add        r9d, -0x4f
00cf9 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00d01 0f8379150000                   jae        0x7f3db7bd6400
00d07 4183c0c0                       add        r8d, -0x40
00d0b 90                             nop        
00d0c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00d11 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00d1c 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00d27 4183c0f0                       add        r8d, -0x10
00d2b 4183f80f                       cmp        r8d, 0xf
00d2f 7fdb                           jg         0x7f3db7bd4e8c
00d31 458bd0                         mov        r10d, r8d
00d34 4585d2                         test       r10d, r10d
00d37 0f8eadf8ffff                   jle        0x7f3db7bd476a
00d3d 4d63c2                         movsxd     r8, r10d
00d40 49ffc8                         dec        r8
00d43 4c3bc1                         cmp        r8, rcx
00d46 0f83f8140000                   jae        0x7f3db7bd63c4
00d4c 458bca                         mov        r9d, r10d
00d4f 458d41ff                       lea        r8d, [r9 - 1]
00d53 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
00d5b 0f830b150000                   jae        0x7f3db7bd63ec
00d61 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00d69 0f8325150000                   jae        0x7f3db7bd6414
00d6f 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00d77 0f832b150000                   jae        0x7f3db7bd6428
00d7d 90                             nop        
00d7e 90                             nop        
00d7f 90                             nop        
00d80 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00d85 478b4c9004                     mov        r9d, dword ptr [r8 + r10*4 + 4]
00d8a 47894c9008                     mov        dword ptr [r8 + r10*4 + 8], r9d
00d8f 41ffca                         dec        r10d
00d92 4585d2                         test       r10d, r10d
00d95 7fe9                           jg         0x7f3db7bd4f00
00d97 e94ef8ffff                     jmp        0x7f3db7bd476a
00d9c 4d63d3                         movsxd     r10, r11d
00d9f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00da6 c442a8f5db                     bzhi       r11, r11, r10
00dab c4c1fb92fb                     kmovq      k7, r11
00db0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00db6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dbc e98b000000                     jmp        0x7f3db7bd4fcc
00dc1 4585ed                         test       r13d, r13d
00dc4 0f8c36140000                   jl         0x7f3db7bd6380
00dca 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00dcf 4585c0                         test       r8d, r8d
00dd2 0f8c2d140000                   jl         0x7f3db7bd6385
00dd8 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ddd 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00de2 0f821d140000                   jb         0x7f3db7bd6385
00de8 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00dec 4103eb                         add        ebp, r11d
00def 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00df7 443bcd                         cmp        r9d, ebp
00dfa 0f8205140000                   jb         0x7f3db7bd6385
00e00 4585db                         test       r11d, r11d
00e03 0f8cfc130000                   jl         0x7f3db7bd6385
00e09 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e0e 453bd5                         cmp        r10d, r13d
00e11 7439                           je         0x7f3db7bd4fcc
00e13 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00e18 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00e1d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e22 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00e27 4963d3                         movsxd     rdx, r11d
00e2a 4883fa20                       cmp        rdx, 0x20
00e2e 0f8668ffffff                   jbe        0x7f3db7bd4f1c
00e34 c5f877                         vzeroupper 
00e37 49ba409171b73d7f0000           movabs     r10, 0x7f3db7719140
00e41 41ffd2                         call       r10
00e44 0f1f840000000000               nop        dword ptr [rax + rax]
00e4c 4c8b1424                       mov        r10, qword ptr [rsp]
00e50 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e54 c5f877                         vzeroupper 
00e57 4881c4c0000000                 add        rsp, 0xc0
00e5e 5d                             pop        rbp
00e5f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e63 0f8797140000                   ja         0x7f3db7bd6480
00e69 c3                             ret        
00e6a 41ffcb                         dec        r11d
00e6d 4585db                         test       r11d, r11d
00e70 7e1a                           jle        0x7f3db7bd500c
00e72 41894a10                       mov        dword ptr [r10 + 0x10], ecx
00e76 458b5208                       mov        r10d, dword ptr [r10 + 8]
00e7a 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00e7f 4589500c                       mov        dword ptr [r8 + 0xc], r10d
00e83 45895808                       mov        dword ptr [r8 + 8], r11d
00e87 e967f7ffff                     jmp        0x7f3db7bd4773
00e8c 48be882574e200000000           movabs     rsi, 0xe2742588
00e96 418bed                         mov        ebp, r13d
00e99 90                             nop        
00e9a 90                             nop        
00e9b 90                             nop        
00e9c c5f877                         vzeroupper 
00e9f e83cacb5ff                     call       0x7f3db772fc60
00ea4 0f1f84009c0f000c               nop        dword ptr [rax + rax + 0xc000f9c]
00eac 4885c0                         test       rax, rax
00eaf 0f8574f7ffff                   jne        0x7f3db7bd47a9
00eb5 bef6ffffff                     mov        esi, 0xfffffff6
00eba 90                             nop        
00ebb 90                             nop        
00ebc c5f877                         vzeroupper 
00ebf e81c8aafff                     call       0x7f3db76cda60
00ec4 0f1f8400bc0f000d               nop        dword ptr [rax + rax + 0xd000fbc]
00ecc 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
00ed6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eda e801153718                     call       0x7f3dcff46560
00edf f4                             hlt        
00ee0 bee4ffffff                     mov        esi, 0xffffffe4
00ee5 488b2c24                       mov        rbp, qword ptr [rsp]
00ee9 48ff742408                     push       qword ptr [rsp + 8]
00eee 488f0424                       pop        qword ptr [rsp]
00ef2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00efb 89442408                       mov        dword ptr [rsp + 8], eax
00eff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f04 48894424f8                     mov        qword ptr [rsp - 8], rax
00f09 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f0d 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f16 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00f1b 90                             nop        
00f1c c5f877                         vzeroupper 
00f1f e8bc89afff                     call       0x7f3db76cda60
00f24 0f1f84001c10000e               nop        dword ptr [rax + rax + 0xe00101c]
00f2c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
00f36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f3a e8a1143718                     call       0x7f3dcff46560
00f3f f4                             hlt        
00f40 bee4ffffff                     mov        esi, 0xffffffe4
00f45 488b2c24                       mov        rbp, qword ptr [rsp]
00f49 48894424f8                     mov        qword ptr [rsp - 8], rax
00f4e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f52 89442414                       mov        dword ptr [rsp + 0x14], eax
00f56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f5b 48ff742470                     push       qword ptr [rsp + 0x70]
00f60 488f442428                     pop        qword ptr [rsp + 0x28]
00f65 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6a 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00f6e 89442470                       mov        dword ptr [rsp + 0x70], eax
00f72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f77 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00f7c c5f877                         vzeroupper 
00f7f e85c89afff                     call       0x7f3db76cda60
00f84 0f1f84007c10000f               nop        dword ptr [rax + rax + 0xf00107c]
00f8c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
00f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f9a e841143718                     call       0x7f3dcff46560
00f9f f4                             hlt        
00fa0 bee4ffffff                     mov        esi, 0xffffffe4
00fa5 488b2c24                       mov        rbp, qword ptr [rsp]
00fa9 48ff742408                     push       qword ptr [rsp + 8]
00fae 488f0424                       pop        qword ptr [rsp]
00fb2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00fbb 89442408                       mov        dword ptr [rsp + 8], eax
00fbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc4 48ff742418                     push       qword ptr [rsp + 0x18]
00fc9 488f442410                     pop        qword ptr [rsp + 0x10]
00fce 48ff742420                     push       qword ptr [rsp + 0x20]
00fd3 488f442418                     pop        qword ptr [rsp + 0x18]
00fd8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00fe1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fe5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fea 48ff742470                     push       qword ptr [rsp + 0x70]
00fef 488f442420                     pop        qword ptr [rsp + 0x20]
00ff4 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
00ffe 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01002 89442470                       mov        dword ptr [rsp + 0x70], eax
01006 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0100b 48894424f8                     mov        qword ptr [rsp - 8], rax
01010 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01017 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0101b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01020 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01029 90                             nop        
0102a 90                             nop        
0102b 90                             nop        
0102c c5f877                         vzeroupper 
0102f e8ac88afff                     call       0x7f3db76cda60
01034 0f1f84002c110010               nop        dword ptr [rax + rax + 0x1000112c]
0103c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01046 4883e4f0                       and        rsp, 0xfffffffffffffff0
0104a e891133718                     call       0x7f3dcff46560
0104f f4                             hlt        
01050 bee4ffffff                     mov        esi, 0xffffffe4
01055 488b2c24                       mov        rbp, qword ptr [rsp]
01059 48ff742408                     push       qword ptr [rsp + 8]
0105e 488f0424                       pop        qword ptr [rsp]
01062 48894424f8                     mov        qword ptr [rsp - 8], rax
01067 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0106b 89442408                       mov        dword ptr [rsp + 8], eax
0106f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01074 48ff742418                     push       qword ptr [rsp + 0x18]
01079 488f442410                     pop        qword ptr [rsp + 0x10]
0107e 48ff742420                     push       qword ptr [rsp + 0x20]
01083 488f442418                     pop        qword ptr [rsp + 0x18]
01088 48894424f8                     mov        qword ptr [rsp - 8], rax
0108d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01091 8944240c                       mov        dword ptr [rsp + 0xc], eax
01095 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109a 48ff742470                     push       qword ptr [rsp + 0x70]
0109f 488f442420                     pop        qword ptr [rsp + 0x20]
010a4 c5f877                         vzeroupper 
010a7 e83488afff                     call       0x7f3db76cda60
010ac 0f1f8400a4110011               nop        dword ptr [rax + rax + 0x110011a4]
010b4 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
010be 4883e4f0                       and        rsp, 0xfffffffffffffff0
010c2 e819133718                     call       0x7f3dcff46560
010c7 f4                             hlt        
010c8 bee4ffffff                     mov        esi, 0xffffffe4
010cd 488b2c24                       mov        rbp, qword ptr [rsp]
010d1 48ff742408                     push       qword ptr [rsp + 8]
010d6 488f0424                       pop        qword ptr [rsp]
010da 48894424f8                     mov        qword ptr [rsp - 8], rax
010df 8b442410                       mov        eax, dword ptr [rsp + 0x10]
010e3 89442408                       mov        dword ptr [rsp + 8], eax
010e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ec 48ff742418                     push       qword ptr [rsp + 0x18]
010f1 488f442410                     pop        qword ptr [rsp + 0x10]
010f6 48ff742420                     push       qword ptr [rsp + 0x20]
010fb 488f442418                     pop        qword ptr [rsp + 0x18]
01100 48894424f8                     mov        qword ptr [rsp - 8], rax
01105 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01109 8944240c                       mov        dword ptr [rsp + 0xc], eax
0110d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01112 48ff742470                     push       qword ptr [rsp + 0x70]
01117 488f442420                     pop        qword ptr [rsp + 0x20]
0111c 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01121 48894424f8                     mov        qword ptr [rsp - 8], rax
01126 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0112d 89442474                       mov        dword ptr [rsp + 0x74], eax
01131 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01136 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0113f 90                             nop        
01140 c5f877                         vzeroupper 
01143 e89887afff                     call       0x7f3db76cda60
01148 0f1f840040120012               nop        dword ptr [rax + rax + 0x12001240]
01150 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0115a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0115e e87d123718                     call       0x7f3dcff46560
01163 f4                             hlt        
01164 be45ffffff                     mov        esi, 0xffffff45
01169 488b2c24                       mov        rbp, qword ptr [rsp]
0116d 4c89542408                     mov        qword ptr [rsp + 8], r10
01172 90                             nop        
01173 90                             nop        
01174 c5f877                         vzeroupper 
01177 e86487afff                     call       0x7f3db76cda60
0117c 0f1f840074120013               nop        dword ptr [rax + rax + 0x13001274]
01184 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0118e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01192 e849123718                     call       0x7f3dcff46560
01197 f4                             hlt        
01198 be45ffffff                     mov        esi, 0xffffff45
0119d 488b2c24                       mov        rbp, qword ptr [rsp]
011a1 48ff742408                     push       qword ptr [rsp + 8]
011a6 488f0424                       pop        qword ptr [rsp]
011aa 48894424f8                     mov        qword ptr [rsp - 8], rax
011af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
011b3 89442408                       mov        dword ptr [rsp + 8], eax
011b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011bc 48ff742418                     push       qword ptr [rsp + 0x18]
011c1 488f442410                     pop        qword ptr [rsp + 0x10]
011c6 48ff742420                     push       qword ptr [rsp + 0x20]
011cb 488f442418                     pop        qword ptr [rsp + 0x18]
011d0 48894424f8                     mov        qword ptr [rsp - 8], rax
011d5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011d9 8944240c                       mov        dword ptr [rsp + 0xc], eax
011dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e2 48ff742430                     push       qword ptr [rsp + 0x30]
011e7 488f442428                     pop        qword ptr [rsp + 0x28]
011ec 48894424f8                     mov        qword ptr [rsp - 8], rax
011f1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
011f5 89442430                       mov        dword ptr [rsp + 0x30], eax
011f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011fe 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01203 48894424f8                     mov        qword ptr [rsp - 8], rax
01208 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0120c 89442438                       mov        dword ptr [rsp + 0x38], eax
01210 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01215 48894424f8                     mov        qword ptr [rsp - 8], rax
0121a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0121e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01222 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01227 48ff742450                     push       qword ptr [rsp + 0x50]
0122c 488f442448                     pop        qword ptr [rsp + 0x48]
01231 48ff742458                     push       qword ptr [rsp + 0x58]
01236 488f442450                     pop        qword ptr [rsp + 0x50]
0123b 48894424f8                     mov        qword ptr [rsp - 8], rax
01240 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01244 89442458                       mov        dword ptr [rsp + 0x58], eax
01248 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124d 48894424f8                     mov        qword ptr [rsp - 8], rax
01252 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01256 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0125a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125f 48894424f8                     mov        qword ptr [rsp - 8], rax
01264 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01268 89442460                       mov        dword ptr [rsp + 0x60], eax
0126c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01271 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01276 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0127b 90                             nop        
0127c c5f877                         vzeroupper 
0127f e85c86afff                     call       0x7f3db76cda60
01284 0f1f84007c130014               nop        dword ptr [rax + rax + 0x1400137c]
0128c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01296 4883e4f0                       and        rsp, 0xfffffffffffffff0
0129a e841113718                     call       0x7f3dcff46560
0129f f4                             hlt        
012a0 4d3bc2                         cmp        r8, r10
012a3 bdffffffff                     mov        ebp, 0xffffffff
012a8 7c08                           jl         0x7f3db7bd5432
012aa 400f95c5                       setne      bpl
012ae 400fb6ed                       movzx      ebp, bpl
012b2 be45ffffff                     mov        esi, 0xffffff45
012b7 48894424f8                     mov        qword ptr [rsp - 8], rax
012bc 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012c0 89442414                       mov        dword ptr [rsp + 0x14], eax
012c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c9 48ff742470                     push       qword ptr [rsp + 0x70]
012ce 488f442428                     pop        qword ptr [rsp + 0x28]
012d3 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
012d8 48894424f8                     mov        qword ptr [rsp - 8], rax
012dd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
012e1 89442470                       mov        dword ptr [rsp + 0x70], eax
012e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ea 4c89542478                     mov        qword ptr [rsp + 0x78], r10
012ef 90                             nop        
012f0 c5f877                         vzeroupper 
012f3 e8e885afff                     call       0x7f3db76cda60
012f8 0f1f8400f0130015               nop        dword ptr [rax + rax + 0x150013f0]
01300 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0130a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0130e e8cd103718                     call       0x7f3dcff46560
01313 f4                             hlt        
01314 be45ffffff                     mov        esi, 0xffffff45
01319 488b2c24                       mov        rbp, qword ptr [rsp]
0131d 48ff742408                     push       qword ptr [rsp + 8]
01322 488f0424                       pop        qword ptr [rsp]
01326 48894424f8                     mov        qword ptr [rsp - 8], rax
0132b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0132f 89442408                       mov        dword ptr [rsp + 8], eax
01333 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01338 48ff742418                     push       qword ptr [rsp + 0x18]
0133d 488f442410                     pop        qword ptr [rsp + 0x10]
01342 48ff742420                     push       qword ptr [rsp + 0x20]
01347 488f442418                     pop        qword ptr [rsp + 0x18]
0134c 48894424f8                     mov        qword ptr [rsp - 8], rax
01351 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01355 8944240c                       mov        dword ptr [rsp + 0xc], eax
01359 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135e 48ff742470                     push       qword ptr [rsp + 0x70]
01363 488f442420                     pop        qword ptr [rsp + 0x20]
01368 48ff742430                     push       qword ptr [rsp + 0x30]
0136d 488f442428                     pop        qword ptr [rsp + 0x28]
01372 48894424f8                     mov        qword ptr [rsp - 8], rax
01377 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0137b 89442430                       mov        dword ptr [rsp + 0x30], eax
0137f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01384 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01389 48894424f8                     mov        qword ptr [rsp - 8], rax
0138e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01392 89442438                       mov        dword ptr [rsp + 0x38], eax
01396 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139b 48894424f8                     mov        qword ptr [rsp - 8], rax
013a0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013a4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ad 48ff742450                     push       qword ptr [rsp + 0x50]
013b2 488f442448                     pop        qword ptr [rsp + 0x48]
013b7 48ff742458                     push       qword ptr [rsp + 0x58]
013bc 488f442450                     pop        qword ptr [rsp + 0x50]
013c1 48894424f8                     mov        qword ptr [rsp - 8], rax
013c6 8b442464                       mov        eax, dword ptr [rsp + 0x64]
013ca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
013ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d3 48894424f8                     mov        qword ptr [rsp - 8], rax
013d8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
013dc 89442464                       mov        dword ptr [rsp + 0x64], eax
013e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e5 48894424f8                     mov        qword ptr [rsp - 8], rax
013ea 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
013ee 89442468                       mov        dword ptr [rsp + 0x68], eax
013f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
013fc c5f877                         vzeroupper 
013ff e8dc84afff                     call       0x7f3db76cda60
01404 0f1f8400fc140016               nop        dword ptr [rax + rax + 0x160014fc]
0140c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01416 4883e4f0                       and        rsp, 0xfffffffffffffff0
0141a e8c10f3718                     call       0x7f3dcff46560
0141f f4                             hlt        
01420 be45ffffff                     mov        esi, 0xffffff45
01425 488b2c24                       mov        rbp, qword ptr [rsp]
01429 48ff742408                     push       qword ptr [rsp + 8]
0142e 488f0424                       pop        qword ptr [rsp]
01432 48894424f8                     mov        qword ptr [rsp - 8], rax
01437 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0143b 89442408                       mov        dword ptr [rsp + 8], eax
0143f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01444 48ff742418                     push       qword ptr [rsp + 0x18]
01449 488f442410                     pop        qword ptr [rsp + 0x10]
0144e 48ff742420                     push       qword ptr [rsp + 0x20]
01453 488f442418                     pop        qword ptr [rsp + 0x18]
01458 48894424f8                     mov        qword ptr [rsp - 8], rax
0145d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01461 8944240c                       mov        dword ptr [rsp + 0xc], eax
01465 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146a 48ff742470                     push       qword ptr [rsp + 0x70]
0146f 488f442420                     pop        qword ptr [rsp + 0x20]
01474 48ff742430                     push       qword ptr [rsp + 0x30]
01479 488f442428                     pop        qword ptr [rsp + 0x28]
0147e 48894424f8                     mov        qword ptr [rsp - 8], rax
01483 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01487 89442430                       mov        dword ptr [rsp + 0x30], eax
0148b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01490 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01495 48894424f8                     mov        qword ptr [rsp - 8], rax
0149a 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0149e 89442438                       mov        dword ptr [rsp + 0x38], eax
014a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a7 48894424f8                     mov        qword ptr [rsp - 8], rax
014ac 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014b0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b9 48ff742450                     push       qword ptr [rsp + 0x50]
014be 488f442448                     pop        qword ptr [rsp + 0x48]
014c3 48ff742458                     push       qword ptr [rsp + 0x58]
014c8 488f442450                     pop        qword ptr [rsp + 0x50]
014cd 48894424f8                     mov        qword ptr [rsp - 8], rax
014d2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014d6 89442458                       mov        dword ptr [rsp + 0x58], eax
014da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014df 48894424f8                     mov        qword ptr [rsp - 8], rax
014e4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014e8 89442460                       mov        dword ptr [rsp + 0x60], eax
014ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f1 48894424f8                     mov        qword ptr [rsp - 8], rax
014f6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
014fa 89442468                       mov        dword ptr [rsp + 0x68], eax
014fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01503 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01508 c5f877                         vzeroupper 
0150b e8d083afff                     call       0x7f3db76cda60
01510 0f1f840008160017               nop        dword ptr [rax + rax + 0x17001608]
01518 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01522 4883e4f0                       and        rsp, 0xfffffffffffffff0
01526 e8b50e3718                     call       0x7f3dcff46560
0152b f4                             hlt        
0152c be45ffffff                     mov        esi, 0xffffff45
01531 488b2c24                       mov        rbp, qword ptr [rsp]
01535 48ff742408                     push       qword ptr [rsp + 8]
0153a 488f0424                       pop        qword ptr [rsp]
0153e 48894424f8                     mov        qword ptr [rsp - 8], rax
01543 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01547 89442408                       mov        dword ptr [rsp + 8], eax
0154b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01550 48ff742418                     push       qword ptr [rsp + 0x18]
01555 488f442410                     pop        qword ptr [rsp + 0x10]
0155a 48ff742420                     push       qword ptr [rsp + 0x20]
0155f 488f442418                     pop        qword ptr [rsp + 0x18]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0156d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01571 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01576 48ff742470                     push       qword ptr [rsp + 0x70]
0157b 488f442420                     pop        qword ptr [rsp + 0x20]
01580 48ff742430                     push       qword ptr [rsp + 0x30]
01585 488f442428                     pop        qword ptr [rsp + 0x28]
0158a 48894424f8                     mov        qword ptr [rsp - 8], rax
0158f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01593 89442430                       mov        dword ptr [rsp + 0x30], eax
01597 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
015a1 48894424f8                     mov        qword ptr [rsp - 8], rax
015a6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015aa 89442438                       mov        dword ptr [rsp + 0x38], eax
015ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b3 48894424f8                     mov        qword ptr [rsp - 8], rax
015b8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015bc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c5 48ff742450                     push       qword ptr [rsp + 0x50]
015ca 488f442448                     pop        qword ptr [rsp + 0x48]
015cf 48ff742458                     push       qword ptr [rsp + 0x58]
015d4 488f442450                     pop        qword ptr [rsp + 0x50]
015d9 48894424f8                     mov        qword ptr [rsp - 8], rax
015de 8b442460                       mov        eax, dword ptr [rsp + 0x60]
015e2 89442458                       mov        dword ptr [rsp + 0x58], eax
015e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015eb 48894424f8                     mov        qword ptr [rsp - 8], rax
015f0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015f4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01602 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01606 89442460                       mov        dword ptr [rsp + 0x60], eax
0160a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160f 90                             nop        
01610 c5f877                         vzeroupper 
01613 e8c882afff                     call       0x7f3db76cda60
01618 0f1f840010170018               nop        dword ptr [rax + rax + 0x18001710]
01620 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0162a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0162e e8ad0d3718                     call       0x7f3dcff46560
01633 f4                             hlt        
01634 be45ffffff                     mov        esi, 0xffffff45
01639 488b2c24                       mov        rbp, qword ptr [rsp]
0163d 48ff742408                     push       qword ptr [rsp + 8]
01642 488f0424                       pop        qword ptr [rsp]
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0164f 89442408                       mov        dword ptr [rsp + 8], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 48ff742418                     push       qword ptr [rsp + 0x18]
0165d 488f442410                     pop        qword ptr [rsp + 0x10]
01662 48ff742420                     push       qword ptr [rsp + 0x20]
01667 488f442418                     pop        qword ptr [rsp + 0x18]
0166c 48894424f8                     mov        qword ptr [rsp - 8], rax
01671 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01675 8944240c                       mov        dword ptr [rsp + 0xc], eax
01679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167e 48ff742470                     push       qword ptr [rsp + 0x70]
01683 488f442420                     pop        qword ptr [rsp + 0x20]
01688 48ff742430                     push       qword ptr [rsp + 0x30]
0168d 488f442428                     pop        qword ptr [rsp + 0x28]
01692 48894424f8                     mov        qword ptr [rsp - 8], rax
01697 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0169b 89442438                       mov        dword ptr [rsp + 0x38], eax
0169f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a4 48894424f8                     mov        qword ptr [rsp - 8], rax
016a9 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016ad 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b6 48ff742450                     push       qword ptr [rsp + 0x50]
016bb 488f442448                     pop        qword ptr [rsp + 0x48]
016c0 48ff742458                     push       qword ptr [rsp + 0x58]
016c5 488f442450                     pop        qword ptr [rsp + 0x50]
016ca 48894424f8                     mov        qword ptr [rsp - 8], rax
016cf 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016d3 89442458                       mov        dword ptr [rsp + 0x58], eax
016d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016dc 48894424f8                     mov        qword ptr [rsp - 8], rax
016e1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016e5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ee 48894424f8                     mov        qword ptr [rsp - 8], rax
016f3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016f7 89442460                       mov        dword ptr [rsp + 0x60], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01705 90                             nop        
01706 90                             nop        
01707 90                             nop        
01708 c5f877                         vzeroupper 
0170b e8d081afff                     call       0x7f3db76cda60
01710 0f1f840008180019               nop        dword ptr [rax + rax + 0x19001808]
01718 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01722 4883e4f0                       and        rsp, 0xfffffffffffffff0
01726 e8b50c3718                     call       0x7f3dcff46560
0172b f4                             hlt        
0172c 4533d2                         xor        r10d, r10d
0172f 4c891424                       mov        qword ptr [rsp], r10
01733 e910eaffff                     jmp        0x7f3db7bd42c8
01738 4533d2                         xor        r10d, r10d
0173b 4c89542408                     mov        qword ptr [rsp + 8], r10
01740 e935eaffff                     jmp        0x7f3db7bd42fa
01745 4533d2                         xor        r10d, r10d
01748 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0174d e95aeaffff                     jmp        0x7f3db7bd432c
01752 4533d2                         xor        r10d, r10d
01755 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0175a e977eaffff                     jmp        0x7f3db7bd4356
0175f 4533d2                         xor        r10d, r10d
01762 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01767 e99ceaffff                     jmp        0x7f3db7bd4388
0176c 4533d2                         xor        r10d, r10d
0176f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01774 e9b9eaffff                     jmp        0x7f3db7bd43b2
01779 bebeffffff                     mov        esi, 0xffffffbe
0177e 488b2c24                       mov        rbp, qword ptr [rsp]
01782 48ff742408                     push       qword ptr [rsp + 8]
01787 488f0424                       pop        qword ptr [rsp]
0178b 48894424f8                     mov        qword ptr [rsp - 8], rax
01790 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01794 89442408                       mov        dword ptr [rsp + 8], eax
01798 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179d 48ff742418                     push       qword ptr [rsp + 0x18]
017a2 488f442410                     pop        qword ptr [rsp + 0x10]
017a7 48ff742420                     push       qword ptr [rsp + 0x20]
017ac 488f442418                     pop        qword ptr [rsp + 0x18]
017b1 48894424f8                     mov        qword ptr [rsp - 8], rax
017b6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017ba 8944240c                       mov        dword ptr [rsp + 0xc], eax
017be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c3 48ff742430                     push       qword ptr [rsp + 0x30]
017c8 488f442428                     pop        qword ptr [rsp + 0x28]
017cd 48894424f8                     mov        qword ptr [rsp - 8], rax
017d2 8b442438                       mov        eax, dword ptr [rsp + 0x38]
017d6 89442430                       mov        dword ptr [rsp + 0x30], eax
017da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017df 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
017e4 48894424f8                     mov        qword ptr [rsp - 8], rax
017e9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
017ed 89442438                       mov        dword ptr [rsp + 0x38], eax
017f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f6 48894424f8                     mov        qword ptr [rsp - 8], rax
017fb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017ff 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01803 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01808 48ff742450                     push       qword ptr [rsp + 0x50]
0180d 488f442448                     pop        qword ptr [rsp + 0x48]
01812 48ff742458                     push       qword ptr [rsp + 0x58]
01817 488f442450                     pop        qword ptr [rsp + 0x50]
0181c 48894424f8                     mov        qword ptr [rsp - 8], rax
01821 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01825 89442458                       mov        dword ptr [rsp + 0x58], eax
01829 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182e 90                             nop        
0182f 90                             nop        
01830 c5f877                         vzeroupper 
01833 e8a880afff                     call       0x7f3db76cda60
01838 0f1f84003019001a               nop        dword ptr [rax + rax + 0x1a001930]
01840 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0184a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0184e e88d0b3718                     call       0x7f3dcff46560
01853 f4                             hlt        
01854 be85ffffff                     mov        esi, 0xffffff85
01859 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0185d 48894424f8                     mov        qword ptr [rsp - 8], rax
01862 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01866 890424                         mov        dword ptr [rsp], eax
01869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186e 44896c2408                     mov        dword ptr [rsp + 8], r13d
01873 90                             nop        
01874 c5f877                         vzeroupper 
01877 e86480afff                     call       0x7f3db76cda60
0187c 0f1f84007419001b               nop        dword ptr [rax + rax + 0x1b001974]
01884 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0188e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01892 e8490b3718                     call       0x7f3dcff46560
01897 f4                             hlt        
01898 bee4ffffff                     mov        esi, 0xffffffe4
0189d 488b2c24                       mov        rbp, qword ptr [rsp]
018a1 48ff742408                     push       qword ptr [rsp + 8]
018a6 488f0424                       pop        qword ptr [rsp]
018aa 48894424f8                     mov        qword ptr [rsp - 8], rax
018af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018b3 89442408                       mov        dword ptr [rsp + 8], eax
018b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bc 48ff742418                     push       qword ptr [rsp + 0x18]
018c1 488f442410                     pop        qword ptr [rsp + 0x10]
018c6 48ff742420                     push       qword ptr [rsp + 0x20]
018cb 488f442418                     pop        qword ptr [rsp + 0x18]
018d0 48894424f8                     mov        qword ptr [rsp - 8], rax
018d5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018d9 8944240c                       mov        dword ptr [rsp + 0xc], eax
018dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e2 48ff742430                     push       qword ptr [rsp + 0x30]
018e7 488f442428                     pop        qword ptr [rsp + 0x28]
018ec 48894424f8                     mov        qword ptr [rsp - 8], rax
018f1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
018f5 89442430                       mov        dword ptr [rsp + 0x30], eax
018f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fe 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01903 48894424f8                     mov        qword ptr [rsp - 8], rax
01908 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0190c 89442438                       mov        dword ptr [rsp + 0x38], eax
01910 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01915 48894424f8                     mov        qword ptr [rsp - 8], rax
0191a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0191e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01922 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01927 48ff742450                     push       qword ptr [rsp + 0x50]
0192c 488f442448                     pop        qword ptr [rsp + 0x48]
01931 48ff742458                     push       qword ptr [rsp + 0x58]
01936 488f442450                     pop        qword ptr [rsp + 0x50]
0193b 48894424f8                     mov        qword ptr [rsp - 8], rax
01940 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01944 89442458                       mov        dword ptr [rsp + 0x58], eax
01948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194d 48894424f8                     mov        qword ptr [rsp - 8], rax
01952 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01956 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0195a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195f 48894424f8                     mov        qword ptr [rsp - 8], rax
01964 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01968 89442460                       mov        dword ptr [rsp + 0x60], eax
0196c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01971 48894424f8                     mov        qword ptr [rsp - 8], rax
01976 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0197a 89442464                       mov        dword ptr [rsp + 0x64], eax
0197e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01983 48894424f8                     mov        qword ptr [rsp - 8], rax
01988 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0198c 89442468                       mov        dword ptr [rsp + 0x68], eax
01990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01995 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0199d 90                             nop        
0199e 90                             nop        
0199f 90                             nop        
019a0 c5f877                         vzeroupper 
019a3 e8387fafff                     call       0x7f3db76cda60
019a8 0f1f8400a01a001c               nop        dword ptr [rax + rax + 0x1c001aa0]
019b0 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
019ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
019be e81d0a3718                     call       0x7f3dcff46560
019c3 f4                             hlt        
019c4 bef6ffffff                     mov        esi, 0xfffffff6
019c9 90                             nop        
019ca 90                             nop        
019cb 90                             nop        
019cc c5f877                         vzeroupper 
019cf e80c7fafff                     call       0x7f3db76cda60
019d4 0f1f8400cc1a001d               nop        dword ptr [rax + rax + 0x1d001acc]
019dc 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
019e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ea e8f1093718                     call       0x7f3dcff46560
019ef f4                             hlt        
019f0 bee4ffffff                     mov        esi, 0xffffffe4
019f5 488b2c24                       mov        rbp, qword ptr [rsp]
019f9 48ff742408                     push       qword ptr [rsp + 8]
019fe 488f0424                       pop        qword ptr [rsp]
01a02 48894424f8                     mov        qword ptr [rsp - 8], rax
01a07 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a0b 89442408                       mov        dword ptr [rsp + 8], eax
01a0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a14 48ff742418                     push       qword ptr [rsp + 0x18]
01a19 488f442410                     pop        qword ptr [rsp + 0x10]
01a1e 48ff742420                     push       qword ptr [rsp + 0x20]
01a23 488f442418                     pop        qword ptr [rsp + 0x18]
01a28 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a31 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3a 48ff742470                     push       qword ptr [rsp + 0x70]
01a3f 488f442420                     pop        qword ptr [rsp + 0x20]
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01a4d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a56 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a5f 89442470                       mov        dword ptr [rsp + 0x70], eax
01a63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a68 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01a70 c5f877                         vzeroupper 
01a73 e8687eafff                     call       0x7f3db76cda60
01a78 0f1f8400701b001e               nop        dword ptr [rax + rax + 0x1e001b70]
01a80 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01a8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a8e e84d093718                     call       0x7f3dcff46560
01a93 f4                             hlt        
01a94 bee4ffffff                     mov        esi, 0xffffffe4
01a99 488b2c24                       mov        rbp, qword ptr [rsp]
01a9d 48ff742408                     push       qword ptr [rsp + 8]
01aa2 488f0424                       pop        qword ptr [rsp]
01aa6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01aaf 89442408                       mov        dword ptr [rsp + 8], eax
01ab3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab8 48ff742418                     push       qword ptr [rsp + 0x18]
01abd 488f442410                     pop        qword ptr [rsp + 0x10]
01ac2 48ff742420                     push       qword ptr [rsp + 0x20]
01ac7 488f442418                     pop        qword ptr [rsp + 0x18]
01acc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ad5 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ad9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ade 48ff742470                     push       qword ptr [rsp + 0x70]
01ae3 488f442420                     pop        qword ptr [rsp + 0x20]
01ae8 48894424f8                     mov        qword ptr [rsp - 8], rax
01aed 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01af1 89442470                       mov        dword ptr [rsp + 0x70], eax
01af5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afa 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01aff 90                             nop        
01b00 c5f877                         vzeroupper 
01b03 e8d87dafff                     call       0x7f3db76cda60
01b08 0f1f8400001c001f               nop        dword ptr [rax + rax + 0x1f001c00]
01b10 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01b1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1e e8bd083718                     call       0x7f3dcff46560
01b23 f4                             hlt        
01b24 beccffffff                     mov        esi, 0xffffffcc
01b29 488b2c24                       mov        rbp, qword ptr [rsp]
01b2d 48ff742408                     push       qword ptr [rsp + 8]
01b32 488f0424                       pop        qword ptr [rsp]
01b36 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b3f 89442408                       mov        dword ptr [rsp + 8], eax
01b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b48 48ff742418                     push       qword ptr [rsp + 0x18]
01b4d 488f442410                     pop        qword ptr [rsp + 0x10]
01b52 48ff742420                     push       qword ptr [rsp + 0x20]
01b57 488f442418                     pop        qword ptr [rsp + 0x18]
01b5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b61 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b65 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6e 48ff742470                     push       qword ptr [rsp + 0x70]
01b73 488f442420                     pop        qword ptr [rsp + 0x20]
01b78 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7d 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01b81 89442438                       mov        dword ptr [rsp + 0x38], eax
01b85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8a 90                             nop        
01b8b 90                             nop        
01b8c c5f877                         vzeroupper 
01b8f e84c7dafff                     call       0x7f3db76cda60
01b94 0f1f84008c1c0020               nop        dword ptr [rax + rax + 0x20001c8c]
01b9c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01baa e831083718                     call       0x7f3dcff46560
01baf f4                             hlt        
01bb0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01bb8 458d5a08                       lea        r11d, [r10 + 8]
01bbc be6effffff                     mov        esi, 0xffffff6e
01bc1 488b2c24                       mov        rbp, qword ptr [rsp]
01bc5 48ff742408                     push       qword ptr [rsp + 8]
01bca 488f0424                       pop        qword ptr [rsp]
01bce 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bd7 89442408                       mov        dword ptr [rsp + 8], eax
01bdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be0 48ff742418                     push       qword ptr [rsp + 0x18]
01be5 488f442410                     pop        qword ptr [rsp + 0x10]
01bea 48ff742420                     push       qword ptr [rsp + 0x20]
01bef 488f442418                     pop        qword ptr [rsp + 0x18]
01bf4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bfd 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c06 48ff742470                     push       qword ptr [rsp + 0x70]
01c0b 488f442420                     pop        qword ptr [rsp + 0x20]
01c10 48ff742430                     push       qword ptr [rsp + 0x30]
01c15 488f442428                     pop        qword ptr [rsp + 0x28]
01c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c23 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c31 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c35 89442460                       mov        dword ptr [rsp + 0x60], eax
01c39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c43 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c47 89442464                       mov        dword ptr [rsp + 0x64], eax
01c4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c50 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c55 90                             nop        
01c56 90                             nop        
01c57 90                             nop        
01c58 c5f877                         vzeroupper 
01c5b e8807cafff                     call       0x7f3db76cda60
01c60 0f1f8400581d0021               nop        dword ptr [rax + rax + 0x21001d58]
01c68 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01c72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c76 e865073718                     call       0x7f3dcff46560
01c7b f4                             hlt        
01c7c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01c84 458d5a08                       lea        r11d, [r10 + 8]
01c88 be66ffffff                     mov        esi, 0xffffff66
01c8d 488b2c24                       mov        rbp, qword ptr [rsp]
01c91 48ff742408                     push       qword ptr [rsp + 8]
01c96 488f0424                       pop        qword ptr [rsp]
01c9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ca3 89442408                       mov        dword ptr [rsp + 8], eax
01ca7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cac 48ff742418                     push       qword ptr [rsp + 0x18]
01cb1 488f442410                     pop        qword ptr [rsp + 0x10]
01cb6 48ff742420                     push       qword ptr [rsp + 0x20]
01cbb 488f442418                     pop        qword ptr [rsp + 0x18]
01cc0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cc9 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd2 48ff742470                     push       qword ptr [rsp + 0x70]
01cd7 488f442420                     pop        qword ptr [rsp + 0x20]
01cdc 48ff742430                     push       qword ptr [rsp + 0x30]
01ce1 488f442428                     pop        qword ptr [rsp + 0x28]
01ce6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ceb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cef 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01cf3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d01 89442460                       mov        dword ptr [rsp + 0x60], eax
01d05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d13 89442464                       mov        dword ptr [rsp + 0x64], eax
01d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01d21 90                             nop        
01d22 90                             nop        
01d23 90                             nop        
01d24 c5f877                         vzeroupper 
01d27 e8b47bafff                     call       0x7f3db76cda60
01d2c 0f1f8400241e0022               nop        dword ptr [rax + rax + 0x22001e24]
01d34 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d42 e899063718                     call       0x7f3dcff46560
01d47 f4                             hlt        
01d48 be6effffff                     mov        esi, 0xffffff6e
01d4d 488b2c24                       mov        rbp, qword ptr [rsp]
01d51 48ff742408                     push       qword ptr [rsp + 8]
01d56 488f0424                       pop        qword ptr [rsp]
01d5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d63 89442408                       mov        dword ptr [rsp + 8], eax
01d67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6c 48ff742418                     push       qword ptr [rsp + 0x18]
01d71 488f442410                     pop        qword ptr [rsp + 0x10]
01d76 48ff742420                     push       qword ptr [rsp + 0x20]
01d7b 488f442418                     pop        qword ptr [rsp + 0x18]
01d80 48894424f8                     mov        qword ptr [rsp - 8], rax
01d85 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d89 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d92 48ff742430                     push       qword ptr [rsp + 0x30]
01d97 488f442428                     pop        qword ptr [rsp + 0x28]
01d9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01da1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01da5 89442430                       mov        dword ptr [rsp + 0x30], eax
01da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dae 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01db3 48894424f8                     mov        qword ptr [rsp - 8], rax
01db8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01dbc 89442438                       mov        dword ptr [rsp + 0x38], eax
01dc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dca 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01dce 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd7 48ff742450                     push       qword ptr [rsp + 0x50]
01ddc 488f442448                     pop        qword ptr [rsp + 0x48]
01de1 48ff742458                     push       qword ptr [rsp + 0x58]
01de6 488f442450                     pop        qword ptr [rsp + 0x50]
01deb 48894424f8                     mov        qword ptr [rsp - 8], rax
01df0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01df4 89442458                       mov        dword ptr [rsp + 0x58], eax
01df8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dfd 48894424f8                     mov        qword ptr [rsp - 8], rax
01e02 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e06 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e14 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e18 89442460                       mov        dword ptr [rsp + 0x60], eax
01e1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e21 48894424f8                     mov        qword ptr [rsp - 8], rax
01e26 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e2a 89442464                       mov        dword ptr [rsp + 0x64], eax
01e2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e33 48894424f8                     mov        qword ptr [rsp - 8], rax
01e38 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e3c 89442468                       mov        dword ptr [rsp + 0x68], eax
01e40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e45 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01e4a 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01e4f 90                             nop        
01e50 c5f877                         vzeroupper 
01e53 e8887aafff                     call       0x7f3db76cda60
01e58 0f1f8400501f0023               nop        dword ptr [rax + rax + 0x23001f50]
01e60 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6e e86d053718                     call       0x7f3dcff46560
01e73 f4                             hlt        
01e74 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
01e7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e82 e859053718                     call       0x7f3dcff46560
01e87 f4                             hlt        
01e88 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
01e92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e96 e845053718                     call       0x7f3dcff46560
01e9b f4                             hlt        
01e9c 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
01ea6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eaa e831053718                     call       0x7f3dcff46560
01eaf f4                             hlt        
01eb0 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
01eba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ebe e81d053718                     call       0x7f3dcff46560
01ec3 f4                             hlt        
01ec4 bee4ffffff                     mov        esi, 0xffffffe4
01ec9 488b2c24                       mov        rbp, qword ptr [rsp]
01ecd 48ff742408                     push       qword ptr [rsp + 8]
01ed2 488f0424                       pop        qword ptr [rsp]
01ed6 48894424f8                     mov        qword ptr [rsp - 8], rax
01edb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01edf 89442408                       mov        dword ptr [rsp + 8], eax
01ee3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee8 48ff742418                     push       qword ptr [rsp + 0x18]
01eed 488f442410                     pop        qword ptr [rsp + 0x10]
01ef2 48ff742420                     push       qword ptr [rsp + 0x20]
01ef7 488f442418                     pop        qword ptr [rsp + 0x18]
01efc 48894424f8                     mov        qword ptr [rsp - 8], rax
01f01 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f05 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0e 48ff742470                     push       qword ptr [rsp + 0x70]
01f13 488f442420                     pop        qword ptr [rsp + 0x20]
01f18 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f21 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01f25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f33 89442460                       mov        dword ptr [rsp + 0x60], eax
01f37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f41 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f45 89442464                       mov        dword ptr [rsp + 0x64], eax
01f49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f53 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f57 89442468                       mov        dword ptr [rsp + 0x68], eax
01f5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f60 48894424f8                     mov        qword ptr [rsp - 8], rax
01f65 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f69 89442474                       mov        dword ptr [rsp + 0x74], eax
01f6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f72 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01f77 90                             nop        
01f78 c5f877                         vzeroupper 
01f7b e86079afff                     call       0x7f3db76cda60
01f80 0f1f840078200024               nop        dword ptr [rax + rax + 0x24002078]
01f88 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e845043718                     call       0x7f3dcff46560
01f9b f4                             hlt        
01f9c bee4ffffff                     mov        esi, 0xffffffe4
01fa1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01faa 89442414                       mov        dword ptr [rsp + 0x14], eax
01fae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb3 48ff742470                     push       qword ptr [rsp + 0x70]
01fb8 488f442428                     pop        qword ptr [rsp + 0x28]
01fbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fc6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01fca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fcf 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fd8 89442460                       mov        dword ptr [rsp + 0x60], eax
01fdc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe6 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fea 89442464                       mov        dword ptr [rsp + 0x64], eax
01fee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff3 90                             nop        
01ff4 c5f877                         vzeroupper 
01ff7 e8e478afff                     call       0x7f3db76cda60
01ffc 0f1f8400f4200025               nop        dword ptr [rax + rax + 0x250020f4]
02004 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0200e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02012 e8c9033718                     call       0x7f3dcff46560
02017 f4                             hlt        
02018 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
0201f ffc5                           inc        ebp
02021 bee4ffffff                     mov        esi, 0xffffffe4
02026 48894424f8                     mov        qword ptr [rsp - 8], rax
0202b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0202f 89442414                       mov        dword ptr [rsp + 0x14], eax
02033 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02038 48ff742470                     push       qword ptr [rsp + 0x70]
0203d 488f442428                     pop        qword ptr [rsp + 0x28]
02042 48894424f8                     mov        qword ptr [rsp - 8], rax
02047 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0204b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0204f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02054 48894424f8                     mov        qword ptr [rsp - 8], rax
02059 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0205d 89442460                       mov        dword ptr [rsp + 0x60], eax
02061 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02066 48894424f8                     mov        qword ptr [rsp - 8], rax
0206b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0206f 89442464                       mov        dword ptr [rsp + 0x64], eax
02073 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02078 48894424f8                     mov        qword ptr [rsp - 8], rax
0207d 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02081 89442470                       mov        dword ptr [rsp + 0x70], eax
02085 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208a 90                             nop        
0208b 90                             nop        
0208c c5f877                         vzeroupper 
0208f e84c78afff                     call       0x7f3db76cda60
02094 0f1f84008c210026               nop        dword ptr [rax + rax + 0x2600218c]
0209c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
020a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020aa e831033718                     call       0x7f3dcff46560
020af f4                             hlt        
020b0 bee4ffffff                     mov        esi, 0xffffffe4
020b5 48894424f8                     mov        qword ptr [rsp - 8], rax
020ba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020be 89442414                       mov        dword ptr [rsp + 0x14], eax
020c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c7 48ff742470                     push       qword ptr [rsp + 0x70]
020cc 488f442428                     pop        qword ptr [rsp + 0x28]
020d1 48894424f8                     mov        qword ptr [rsp - 8], rax
020d6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020da 8944244c                       mov        dword ptr [rsp + 0x4c], eax
020de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e3 48894424f8                     mov        qword ptr [rsp - 8], rax
020e8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020ec 89442460                       mov        dword ptr [rsp + 0x60], eax
020f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f5 48894424f8                     mov        qword ptr [rsp - 8], rax
020fa 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020fe 89442464                       mov        dword ptr [rsp + 0x64], eax
02102 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02107 48894424f8                     mov        qword ptr [rsp - 8], rax
0210c 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02110 89442470                       mov        dword ptr [rsp + 0x70], eax
02114 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02119 90                             nop        
0211a 90                             nop        
0211b 90                             nop        
0211c c5f877                         vzeroupper 
0211f e8bc77afff                     call       0x7f3db76cda60
02124 0f1f84001c220027               nop        dword ptr [rax + rax + 0x2700221c]
0212c 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
02136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213a e8a1023718                     call       0x7f3dcff46560
0213f f4                             hlt        
02140 bee4ffffff                     mov        esi, 0xffffffe4
02145 488b2c24                       mov        rbp, qword ptr [rsp]
02149 48ff742408                     push       qword ptr [rsp + 8]
0214e 488f0424                       pop        qword ptr [rsp]
02152 48894424f8                     mov        qword ptr [rsp - 8], rax
02157 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0215b 89442408                       mov        dword ptr [rsp + 8], eax
0215f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02164 48ff742418                     push       qword ptr [rsp + 0x18]
02169 488f442410                     pop        qword ptr [rsp + 0x10]
0216e 48ff742420                     push       qword ptr [rsp + 0x20]
02173 488f442418                     pop        qword ptr [rsp + 0x18]
02178 48894424f8                     mov        qword ptr [rsp - 8], rax
0217d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02181 8944240c                       mov        dword ptr [rsp + 0xc], eax
02185 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218a 48ff742470                     push       qword ptr [rsp + 0x70]
0218f 488f442420                     pop        qword ptr [rsp + 0x20]
02194 48894424f8                     mov        qword ptr [rsp - 8], rax
02199 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0219d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a6 48894424f8                     mov        qword ptr [rsp - 8], rax
021ab 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021af 89442460                       mov        dword ptr [rsp + 0x60], eax
021b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b8 48894424f8                     mov        qword ptr [rsp - 8], rax
021bd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021c1 89442464                       mov        dword ptr [rsp + 0x64], eax
021c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ca 48894424f8                     mov        qword ptr [rsp - 8], rax
021cf 8b442478                       mov        eax, dword ptr [rsp + 0x78]
021d3 89442470                       mov        dword ptr [rsp + 0x70], eax
021d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021dc c5f877                         vzeroupper 
021df e8fc76afff                     call       0x7f3db76cda60
021e4 0f1f8400dc220028               nop        dword ptr [rax + rax + 0x280022dc]
021ec 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
021f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
021fa e8e1013718                     call       0x7f3dcff46560
021ff f4                             hlt        
02200 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02205 beccffffff                     mov        esi, 0xffffffcc
0220a 488b2c24                       mov        rbp, qword ptr [rsp]
0220e 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
02213 4489442414                     mov        dword ptr [rsp + 0x14], r8d
02218 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0221d 90                             nop        
0221e 90                             nop        
0221f 90                             nop        
02220 c5f877                         vzeroupper 
02223 e8b876afff                     call       0x7f3db76cda60
02228 0f1f840020230029               nop        dword ptr [rax + rax + 0x29002320]
02230 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
0223a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0223e e89d013718                     call       0x7f3dcff46560
02243 f4                             hlt        
02244 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
0224e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02252 e889013718                     call       0x7f3dcff46560
02257 f4                             hlt        
02258 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
02262 4883e4f0                       and        rsp, 0xfffffffffffffff0
02266 e875013718                     call       0x7f3dcff46560
0226b f4                             hlt        
0226c 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
02276 4883e4f0                       and        rsp, 0xfffffffffffffff0
0227a e861013718                     call       0x7f3dcff46560
0227f f4                             hlt        
02280 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
0228a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0228e e84d013718                     call       0x7f3dcff46560
02293 f4                             hlt        
02294 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
0229e 4883e4f0                       and        rsp, 0xfffffffffffffff0
022a2 e839013718                     call       0x7f3dcff46560
022a7 f4                             hlt        
022a8 48bf902233903d7f0000           movabs     rdi, 0x7f3d90332290
022b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022b6 e825013718                     call       0x7f3dcff46560
022bb f4                             hlt        
022bc eb10                           jmp        0x7f3db7bd644e
022be eb0e                           jmp        0x7f3db7bd644e
022c0 eb0c                           jmp        0x7f3db7bd644e
022c2 eb0a                           jmp        0x7f3db7bd644e
022c4 eb08                           jmp        0x7f3db7bd644e
022c6 eb06                           jmp        0x7f3db7bd644e
022c8 eb04                           jmp        0x7f3db7bd644e
022ca eb02                           jmp        0x7f3db7bd644e
022cc eb00                           jmp        0x7f3db7bd644e
022ce 488bf0                         mov        rsi, rax
022d1 e956e3ffff                     jmp        0x7f3db7bd47ac
022d6 bef6ffffff                     mov        esi, 0xfffffff6
022db 90                             nop        
022dc c5f877                         vzeroupper 
022df e8fc75afff                     call       0x7f3db76cda60
022e4 0f1f8400dc23002a               nop        dword ptr [rax + rax + 0x2a0023dc]
022ec 48bf509b26903d7f0000           movabs     rdi, 0x7f3d90269b50
022f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022fa e8e1003718                     call       0x7f3dcff46560
022ff f4                             hlt        
02300 49badf4fbdb73d7f0000           movabs     r10, 0x7f3db7bd4fdf
0230a 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02311 e9cabeb5ff                     jmp        0x7f3db7732360
02316 e8458db4ff                     call       0x7f3db771f1e0
0231b e90eddffff                     jmp        0x7f3db7bd41ae
