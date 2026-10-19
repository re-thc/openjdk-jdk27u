00000 e8bb7ea317                     call       0x7f0c8b895640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85001f0000                   jne        0x7f0c73e5f6ae
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
0010d 49ba80bd978b0c7f0000           movabs     r10, 0x7f0c8b97bd80
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f8444140000                   je         0x7f0c73e5ecf4
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15410000                 cmp        r11d, 0x4115
0013e 0f8544150000                   jne        0x7f0c73e5ee08
00144 4c891424                       mov        qword ptr [rsp], r10
00148 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00150 4d85d2                         test       r10, r10
00153 0f8427140000                   je         0x7f0c73e5ed00
00159 458b12                         mov        r10d, dword ptr [r10]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fadd050000                 cmp        r10d, 0x5dd
00167 0f851b150000                   jne        0x7f0c73e5ee08
0016d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00182 4d85d2                         test       r10, r10
00185 0f8402140000                   je         0x7f0c73e5ed0d
0018b 458b12                         mov        r10d, dword ptr [r10]
0018e 41c1ea0d                       shr        r10d, 0xd
00192 4181fae0050000                 cmp        r10d, 0x5e0
00199 0f85e9140000                   jne        0x7f0c73e5ee08
0019f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
001a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
001b4 4d85d2                         test       r10, r10
001b7 0f84dd130000                   je         0x7f0c73e5ed1a
001bd 458b1a                         mov        r11d, dword ptr [r10]
001c0 41c1eb0d                       shr        r11d, 0xd
001c4 4181fbdf050000                 cmp        r11d, 0x5df
001cb 0f85b7140000                   jne        0x7f0c73e5ee08
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001de 4d85d2                         test       r10, r10
001e1 0f84c0130000                   je         0x7f0c73e5ed27
001e7 458b12                         mov        r10d, dword ptr [r10]
001ea 41c1ea0d                       shr        r10d, 0xd
001ee 4181fadf050000                 cmp        r10d, 0x5df
001f5 0f858d140000                   jne        0x7f0c73e5ee08
001fb 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00203 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00208 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00210 4d85d2                         test       r10, r10
00213 0f849b130000                   je         0x7f0c73e5ed34
00219 458b1a                         mov        r11d, dword ptr [r10]
0021c 41c1eb0d                       shr        r11d, 0xd
00220 4181fbdd050000                 cmp        r11d, 0x5dd
00227 0f855b140000                   jne        0x7f0c73e5ee08
0022d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0023b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00240 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00245 4585d2                         test       r10d, r10d
00248 0f8473130000                   je         0x7f0c73e5ed41
0024e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00253 458b5204                       mov        r10d, dword ptr [r10 + 4]
00257 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0025c 458d5af1                       lea        r11d, [r10 - 0xf]
00260 4585db                         test       r11d, r11d
00263 0f8c58130000                   jl         0x7f0c73e5ed41
00269 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0026e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00272 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0027a 458d53f1                       lea        r10d, [r11 - 0xf]
0027e 4585d2                         test       r10d, r10d
00281 0f8c3a130000                   jl         0x7f0c73e5ed41
00287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0028c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00290 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00298 4585d2                         test       r10d, r10d
0029b 0f8620130000                   jbe        0x7f0c73e5ed41
002a1 4183fa01                       cmp        r10d, 1
002a5 0f8616130000                   jbe        0x7f0c73e5ed41
002ab 4183fa02                       cmp        r10d, 2
002af 0f860c130000                   jbe        0x7f0c73e5ed41
002b5 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002bd 4183c2f9                       add        r10d, -7
002c1 4585d2                         test       r10d, r10d
002c4 0f8cf7120000                   jl         0x7f0c73e5ed41
002ca 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002d2 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002da 458d5af1                       lea        r11d, [r10 - 0xf]
002de 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002eb 4183c2f1                       add        r10d, -0xf
002ef 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002f7 e9c8010000                     jmp        0x7f0c73e5dc44
002fc 4533db                         xor        r11d, r11d
002ff 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00304 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00309 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
0030d 4183fa03                       cmp        r10d, 3
00311 0f8e41020000                   jle        0x7f0c73e5dcd8
00317 45894b10                       mov        dword ptr [r11 + 0x10], r9d
0031b 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0031f 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00324 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00328 4183c2fd                       add        r10d, -3
0032c 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00334 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00339 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00341 45894208                       mov        dword ptr [r10 + 8], r8d
00345 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
0034d 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00352 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00357 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
0035c 4d03d3                         add        r10, r11
0035f 4d3bc2                         cmp        r8, r10
00362 0f8fe40d0000                   jg         0x7f0c73e5e8cc
00368 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00370 4585c9                         test       r9d, r9d
00373 0f8ebf0c0000                   jle        0x7f0c73e5e7b8
00379 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0037e 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
00383 4403542478                     add        r10d, dword ptr [rsp + 0x78]
00388 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
0038d 0f8f190e0000                   jg         0x7f0c73e5e92c
00393 458bd5                         mov        r10d, r13d
00396 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
0039b 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
003a0 0f8ffe0e0000                   jg         0x7f0c73e5ea24
003a6 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003ab 4183fa10                       cmp        r10d, 0x10
003af 0f8fe70f0000                   jg         0x7f0c73e5eb1c
003b5 443bac2490000000               cmp        r13d, dword ptr [rsp + 0x90]
003bd 0f83a10a0000                   jae        0x7f0c73e5e5e4
003c3 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003c8 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
003cf 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
003d4 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
003dc 0f83ce0a0000                   jae        0x7f0c73e5e630
003e2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003e7 4503d5                         add        r10d, r13d
003ea 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003f2 458bd0                         mov        r10d, r8d
003f5 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
003fa 4503c2                         add        r8d, r10d
003fd 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
00402 4963ca                         movsxd     rcx, r10d
00405 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0040a c4c17a7f440808                 vmovdqu    xmmword ptr [r8 + rcx + 8], xmm0
00411 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00416 442b8c2494000000               sub        r9d, dword ptr [rsp + 0x94]
0041e 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
00426 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0042b 4183f810                       cmp        r8d, 0x10
0042f 0f8f5b100000                   jg         0x7f0c73e5ec10
00435 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0043d 4183f910                       cmp        r9d, 0x10
00441 0f8cf9010000                   jl         0x7f0c73e5ddc0
00447 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0044f 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00457 0f83ef0a0000                   jae        0x7f0c73e5e6cc
0045d 458bc3                         mov        r8d, r11d
00460 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00465 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0046c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00471 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00479 0f83310b0000                   jae        0x7f0c73e5e730
0047f 458bc2                         mov        r8d, r10d
00482 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00487 4d63d0                         movsxd     r10, r8d
0048a 438d0c03                       lea        ecx, [r11 + r8]
0048e 034c2478                       add        ecx, dword ptr [rsp + 0x78]
00492 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00496 4d63db                         movsxd     r11, r11d
00499 4d03da                         add        r11, r10
0049c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004a1 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
004a8 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004ac 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004b1 41ffc0                         inc        r8d
004b4 4489442468                     mov        dword ptr [rsp + 0x68], r8d
004b9 418502                         test       dword ptr [r10], eax
004bc 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
004c4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
004c9 452bc5                         sub        r8d, r13d
004cc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004d1 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004d6 0f8d32080000                   jge        0x7f0c73e5e48e
004dc 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
004e1 0f8331090000                   jae        0x7f0c73e5e598
004e7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
004ec 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
004f1 4d8bd3                         mov        r10, r11
004f4 49c1fa24                       sar        r10, 0x24
004f8 458bd2                         mov        r10d, r10d
004fb 4d8bcb                         mov        r9, r11
004fe 49c1e912                       shr        r9, 0x12
00502 458bdb                         mov        r11d, r11d
00505 418bc9                         mov        ecx, r9d
00508 4181e3ffff0100                 and        r11d, 0x1ffff
0050f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00514 81e1ffff0300                   and        ecx, 0x3ffff
0051a 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0051e 4585d2                         test       r10d, r10d
00521 0f8c310b0000                   jl         0x7f0c73e5e7d8
00527 4585db                         test       r11d, r11d
0052a 0f84ccfdffff                   je         0x7f0c73e5da7c
00530 453bd8                         cmp        r11d, r8d
00533 0f8ecbfdffff                   jle        0x7f0c73e5da84
00539 be45ffffff                     mov        esi, 0xffffff45
0053e 418beb                         mov        ebp, r11d
00541 44890424                       mov        dword ptr [rsp], r8d
00545 666690                         nop        
00548 c5f877                         vzeroupper 
0054b e89059b6ff                     call       0x7f0c739c3660
00550 0f1f840048060001               nop        dword ptr [rax + rax + 0x1000648]
00558 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0055d 4585db                         test       r11d, r11d
00560 7403                           je         0x7f0c73e5dce5
00562 41ffca                         dec        r10d
00565 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0056a 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0056e 4585d2                         test       r10d, r10d
00571 0f8481000000                   je         0x7f0c73e5dd78
00577 4183fa03                       cmp        r10d, 3
0057b 0f8436080000                   je         0x7f0c73e5e537
00581 4183fa02                       cmp        r10d, 2
00585 777e                           ja         0x7f0c73e5dd85
00587 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0058f 0f8323110000                   jae        0x7f0c73e5ee38
00595 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0059a 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
0059f 4585d2                         test       r10d, r10d
005a2 7e4b                           jle        0x7f0c73e5dd6f
005a4 458d4aff                       lea        r9d, [r10 - 1]
005a8 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
005b0 0f8316150000                   jae        0x7f0c73e5f24c
005b6 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
005bb 458bc0                         mov        r8d, r8d
005be 4183c0cc                       add        r8d, -0x34
005c2 41c1e802                       shr        r8d, 2
005c6 478d4c10ff                     lea        r9d, [r8 + r10 - 1]
005cb 4d63c2                         movsxd     r8, r10d
005ce 33c9                           xor        ecx, ecx
005d0 bf04000000                     mov        edi, 4
005d5 c442c0f5c9                     bzhi       r9, r9, rdi
005da 4d2bc1                         sub        r8, r9
005dd 49ffc8                         dec        r8
005e0 4d85c0                         test       r8, r8
005e3 4c0f4cc1                       cmovl      r8, rcx
005e7 418bc8                         mov        ecx, r8d
005ea e9fc050000                     jmp        0x7f0c73e5e36b
005ef 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005f4 45895a08                       mov        dword ptr [r10 + 8], r11d
005f8 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00600 e940fdffff                     jmp        0x7f0c73e5dac5
00605 48beb0af72e200000000           movabs     rsi, 0xe272afb0
0060f 418bed                         mov        ebp, r13d
00612 6690                           nop        
00614 c5f877                         vzeroupper 
00617 e8c4daa9ff                     call       0x7f0c738fb860
0061c 0f1f840014070002               nop        dword ptr [rax + rax + 0x2000714]
00624 4885c0                         test       rax, rax
00627 0f8493110000                   je         0x7f0c73e5ef40
0062d 488bf0                         mov        rsi, rax
00630 c5f877                         vzeroupper 
00633 4881c4c0000000                 add        rsp, 0xc0
0063a 5d                             pop        rbp
0063b e9a0d7b6ff                     jmp        0x7f0c739cb560
00640 440344247c                     add        r8d, dword ptr [rsp + 0x7c]
00645 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0064a 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
0064f 0f8de7020000                   jge        0x7f0c73e5e0bc
00655 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0065a 4183c008                       add        r8d, 8
0065e 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00666 4183f908                       cmp        r9d, 8
0066a 0f8dad010000                   jge        0x7f0c73e5df9d
00670 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00678 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
00680 0f835a150000                   jae        0x7f0c73e5f360
00686 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0068b 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
00691 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00696 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0069e 0f8300160000                   jae        0x7f0c73e5f424
006a4 4d63da                         movsxd     r11, r10d
006a7 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
006ac 4d03c3                         add        r8, r11
006af 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006b4 43886c0308                     mov        byte ptr [r11 + r8 + 8], bpl
006b9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006c1 4183c303                       add        r11d, 3
006c5 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
006ca 41ffc1                         inc        r9d
006cd 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
006d5 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
006dd 0f8329160000                   jae        0x7f0c73e5f48c
006e3 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006e8 4183c303                       add        r11d, 3
006ec 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
006f4 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
006f9 430fbe6c0109                   movsx      ebp, byte ptr [r9 + r8 + 9]
006ff 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00707 0f8383160000                   jae        0x7f0c73e5f510
0070d 4d63d2                         movsxd     r10, r10d
00710 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
00715 4d03da                         add        r11, r10
00718 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
0071d 470fbe54010a                   movsx      r10d, byte ptr [r9 + r8 + 0xa]
00723 478854190a                     mov        byte ptr [r9 + r11 + 0xa], r10b
00728 470fbe44010b                   movsx      r8d, byte ptr [r9 + r8 + 0xb]
0072e 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
00733 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0073b 4183fa08                       cmp        r10d, 8
0073f 0f83c7160000                   jae        0x7f0c73e5f58c
00745 49baf0e870e200000000           movabs     r10, 0xe270e8f0
0074f 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00757 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0075f 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00764 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00769 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0076e 4183fb04                       cmp        r11d, 4
00772 7e3c                           jle        0x7f0c73e5df30
00774 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
00778 83c504                         add        ebp, 4
0077b 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00780 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00784 c5f877                         vzeroupper 
00787 e854d9a9ff                     call       0x7f0c738fb860
0078c 0f1f840084080003               nop        dword ptr [rax + rax + 0x3000884]
00794 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00799 8bd5                           mov        edx, ebp
0079b 8bc8                           mov        ecx, eax
0079d 666690                         nop        
007a0 c5f877                         vzeroupper 
007a3 e838d9a9ff                     call       0x7f0c738fb860
007a8 0f1f8400a0080004               nop        dword ptr [rax + rax + 0x40008a0]
007b0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
007b5 4183fb08                       cmp        r11d, 8
007b9 0f8ee9fcffff                   jle        0x7f0c73e5dc28
007bf 49ba18e970e200000000           movabs     r10, 0xe270e918
007c9 8b542414                       mov        edx, dword ptr [rsp + 0x14]
007cd 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
007d5 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
007da 83c208                         add        edx, 8
007dd 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007e2 6690                           nop        
007e4 c5f877                         vzeroupper 
007e7 e8f4d8a9ff                     call       0x7f0c738fb860
007ec 0f1f8400e4080005               nop        dword ptr [rax + rax + 0x50008e4]
007f4 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
007f8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007fd 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00804 488bc8                         mov        rcx, rax
00807 90                             nop        
00808 c5f877                         vzeroupper 
0080b e8d0d8a9ff                     call       0x7f0c738fb860
00810 0f1f840008090006               nop        dword ptr [rax + rax + 0x6000908]
00818 e98bfcffff                     jmp        0x7f0c73e5dc28
0081d 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00822 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00829 666690                         nop        
0082c c5f877                         vzeroupper 
0082f e8acd8a9ff                     call       0x7f0c738fb860
00834 0f1f84002c090007               nop        dword ptr [rax + rax + 0x700092c]
0083c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00841 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00845 488bc8                         mov        rcx, rax
00848 c5f877                         vzeroupper 
0084b e890d8a9ff                     call       0x7f0c738fb860
00850 0f1f840048090008               nop        dword ptr [rax + rax + 0x8000948]
00858 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00860 4183c208                       add        r10d, 8
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
00926 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0092b 90                             nop        
0092c c5f877                         vzeroupper 
0092f e8ac55b6ff                     call       0x7f0c739c3660
00934 0f1f84002c0a0009               nop        dword ptr [rax + rax + 0x9000a2c]
0093c 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00941 4183f830                       cmp        r8d, 0x30
00945 0f8f03020000                   jg         0x7f0c73e5e2ce
0094b 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00953 4183c0f9                       add        r8d, -7
00957 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0095f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00967 453bd8                         cmp        r11d, r8d
0096a 0f83680e0000                   jae        0x7f0c73e5ef58
00970 458bc3                         mov        r8d, r11d
00973 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
0097b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00980 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
00985 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
0098d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00992 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
0099a 0f83c80e0000                   jae        0x7f0c73e5efe8
009a0 4489542414                     mov        dword ptr [rsp + 0x14], r10d
009a5 4d63d2                         movsxd     r10, r10d
009a8 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
009ad 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
009b2 4d63db                         movsxd     r11, r11d
009b5 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
009ba 418be8                         mov        ebp, r8d
009bd 48be28c122e200000000           movabs     rsi, 0xe222c128
009c7 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009cc 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009d4 4533c9                         xor        r9d, r9d
009d7 90                             nop        
009d8 c5f877                         vzeroupper 
009db e800cda9ff                     call       0x7f0c738fae60
009e0 0f1f8400d80a000a               nop        dword ptr [rax + rax + 0xa000ad8]
009e8 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
009ed 44035c2414                     add        r11d, dword ptr [rsp + 0x14]
009f2 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
009f7 458d5308                       lea        r10d, [r11 + 8]
009fb 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a03 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00a08 0f8d2c010000                   jge        0x7f0c73e5e2ba
00a0e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a16 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00a1b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00a20 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00a28 4983c0f9                       add        r8, -7
00a2c 4d63ca                         movsxd     r9, r10d
00a2f 4c639c24a0000000               movsxd     r11, dword ptr [rsp + 0xa0]
00a37 4f8d140b                       lea        r10, [r11 + r9]
00a3b 4d3bd0                         cmp        r10, r8
00a3e 0f83180f0000                   jae        0x7f0c73e5f0dc
00a44 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00a49 4d2bd3                         sub        r10, r11
00a4c 4983c207                       add        r10, 7
00a50 4983e2f8                       and        r10, 0xfffffffffffffff8
00a54 458bd2                         mov        r10d, r10d
00a57 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a5c 478d541a08                     lea        r10d, [r10 + r11 + 8]
00a61 4d63da                         movsxd     r11, r10d
00a64 4f8d5419f8                     lea        r10, [r9 + r11 - 8]
00a69 4d3bd0                         cmp        r10, r8
00a6c 0f83ea0e0000                   jae        0x7f0c73e5f0dc
00a72 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a7a 443b8c2494000000               cmp        r9d, dword ptr [rsp + 0x94]
00a82 0f83d40e0000                   jae        0x7f0c73e5f0dc
00a88 4983c3f8                       add        r11, -8
00a8c 4d3bd8                         cmp        r11, r8
00a8f 0f83c70e0000                   jae        0x7f0c73e5f0dc
00a95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a9a 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00aa1 0f8f6d0f0000                   jg         0x7f0c73e5f194
00aa7 660f1f840000000000             nop        word ptr [rax + rax]
00ab0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ab8 4963cb                         movsxd     rcx, r11d
00abb 4883c108                       add        rcx, 8
00abf 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00ac6 036c2414                       add        ebp, dword ptr [rsp + 0x14]
00aca 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00acf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ad4 48be28c122e200000000           movabs     rsi, 0xe222c128
00ade 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00ae3 4533c9                         xor        r9d, r9d
00ae6 6690                           nop        
00ae8 c5f877                         vzeroupper 
00aeb e8f0cba9ff                     call       0x7f0c738fae60
00af0 0f1f8400e80b000b               nop        dword ptr [rax + rax + 0xb000be8]
00af8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b00 4183c208                       add        r10d, 8
00b04 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00b0c 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00b11 7c9d                           jl         0x7f0c73e5e230
00b13 eb25                           jmp        0x7f0c73e5e2ba
00b15 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b1a 4d63d3                         movsxd     r10, r11d
00b1d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b24 c442a8f5db                     bzhi       r11, r11, r10
00b29 c4c1fb92fb                     kmovq      k7, r11
00b2e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b34 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b3a 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b3f 4403542478                     add        r10d, dword ptr [rsp + 0x78]
00b44 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b49 e95af9ffff                     jmp        0x7f0c73e5dc28
00b4e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b56 4585d2                         test       r10d, r10d
00b59 0f8c850d0000                   jl         0x7f0c73e5f064
00b5f 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00b64 4585c0                         test       r8d, r8d
00b67 0f8c770d0000                   jl         0x7f0c73e5f064
00b6d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00b72 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
00b7a 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00b82 453bc2                         cmp        r8d, r10d
00b85 0f82590d0000                   jb         0x7f0c73e5f064
00b8b 443b442438                     cmp        r8d, dword ptr [rsp + 0x38]
00b90 0f824e0d0000                   jb         0x7f0c73e5f064
00b96 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00b9b 4585d2                         test       r10d, r10d
00b9e 749a                           je         0x7f0c73e5e2ba
00ba0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ba5 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00bad 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00bb2 4c03d9                         add        r11, rcx
00bb5 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00bba 4863542478                     movsxd     rdx, dword ptr [rsp + 0x78]
00bbf 4883fa20                       cmp        rdx, 0x20
00bc3 0f864cffffff                   jbe        0x7f0c73e5e295
00bc9 c5f877                         vzeroupper 
00bcc 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
00bd6 41ffd2                         call       r10
00bd9 0f1f840000000000               nop        dword ptr [rax + rax]
00be1 e954ffffff                     jmp        0x7f0c73e5e2ba
00be6 6690                           nop        
00be8 458bd1                         mov        r10d, r9d
00beb 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00bf0 478b449004                     mov        r8d, dword ptr [r8 + r10*4 + 4]
00bf5 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00bfa 4789449108                     mov        dword ptr [r9 + r10*4 + 8], r8d
00bff 458d4aff                       lea        r9d, [r10 - 1]
00c03 443bc9                         cmp        r9d, ecx
00c06 7fe0                           jg         0x7f0c73e5e368
00c08 4183f93f                       cmp        r9d, 0x3f
00c0c 0f8ec60f0000                   jle        0x7f0c73e5f358
00c12 41ffca                         dec        r10d
00c15 eb0c                           jmp        0x7f0c73e5e3a3
00c17 660f1f840000000000             nop        word ptr [rax + rax]
00c20 458bd0                         mov        r10d, r8d
00c23 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00c28 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00c33 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00c3e 62917e486f849088ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x78]
00c49 62917e487f84908cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x74], zmm0
00c54 62917e486f849048ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xb8]
00c5f 62917e487f84904cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xb4], zmm0
00c6a 62917e486f849008ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xf8]
00c75 62917e487f84900cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xf4], zmm0
00c80 458d42c0                       lea        r8d, [r10 - 0x40]
00c84 4183f83f                       cmp        r8d, 0x3f
00c88 7f96                           jg         0x7f0c73e5e3a0
00c8a 4183f80f                       cmp        r8d, 0xf
00c8e 7e2d                           jle        0x7f0c73e5e43d
00c90 458bc2                         mov        r8d, r10d
00c93 4183c0c0                       add        r8d, -0x40
00c97 90                             nop        
00c98 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00c9d 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00ca8 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00cb3 4183c0f0                       add        r8d, -0x10
00cb7 4183f80f                       cmp        r8d, 0xf
00cbb 7fdb                           jg         0x7f0c73e5e418
00cbd 4585c0                         test       r8d, r8d
00cc0 0f8e29f9ffff                   jle        0x7f0c73e5dd6f
00cc6 6690                           nop        
00cc8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00ccd 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00cd2 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00cd7 4789548108                     mov        dword ptr [r9 + r8*4 + 8], r10d
00cdc 41ffc8                         dec        r8d
00cdf 4585c0                         test       r8d, r8d
00ce2 7fe4                           jg         0x7f0c73e5e448
00ce4 e906f9ffff                     jmp        0x7f0c73e5dd6f
00ce9 4d63d0                         movsxd     r10, r8d
00cec 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cf3 c442a8f5db                     bzhi       r11, r11, r10
00cf8 c4c1fb92fb                     kmovq      k7, r11
00cfd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d03 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d09 e98b000000                     jmp        0x7f0c73e5e519
00d0e 4585ed                         test       r13d, r13d
00d11 0f8ca1110000                   jl         0x7f0c73e5f638
00d17 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d1c 4585d2                         test       r10d, r10d
00d1f 0f8c98110000                   jl         0x7f0c73e5f63d
00d25 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00d2a 443b4c2410                     cmp        r9d, dword ptr [rsp + 0x10]
00d2f 0f8288110000                   jb         0x7f0c73e5f63d
00d35 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00d39 4103e8                         add        ebp, r8d
00d3c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00d44 443bdd                         cmp        r11d, ebp
00d47 0f8270110000                   jb         0x7f0c73e5f63d
00d4d 4585c0                         test       r8d, r8d
00d50 0f8c67110000                   jl         0x7f0c73e5f63d
00d56 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00d5b 453bcd                         cmp        r9d, r13d
00d5e 7439                           je         0x7f0c73e5e519
00d60 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d65 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00d6a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00d6f 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00d74 4963d0                         movsxd     rdx, r8d
00d77 4883fa20                       cmp        rdx, 0x20
00d7b 0f8668ffffff                   jbe        0x7f0c73e5e469
00d81 c5f877                         vzeroupper 
00d84 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
00d8e 41ffd2                         call       r10
00d91 0f1f840000000000               nop        dword ptr [rax + rax]
00d99 4c8b1424                       mov        r10, qword ptr [rsp]
00d9d 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00da1 c5f877                         vzeroupper 
00da4 4881c4c0000000                 add        rsp, 0xc0
00dab 5d                             pop        rbp
00dac 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00db0 0f8762110000                   ja         0x7f0c73e5f698
00db6 c3                             ret        
00db7 41ffcb                         dec        r11d
00dba 4585db                         test       r11d, r11d
00dbd 7e1a                           jle        0x7f0c73e5e559
00dbf 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00dc4 45894a10                       mov        dword ptr [r10 + 0x10], r9d
00dc8 458b4208                       mov        r8d, dword ptr [r10 + 8]
00dcc 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00dd0 45895a08                       mov        dword ptr [r10 + 8], r11d
00dd4 e91ff8ffff                     jmp        0x7f0c73e5dd78
00dd9 48be80af72e200000000           movabs     rsi, 0xe272af80
00de3 418bed                         mov        ebp, r13d
00de6 6690                           nop        
00de8 c5f877                         vzeroupper 
00deb e8f0d2a9ff                     call       0x7f0c738fb860
00df0 0f1f8400e80e000c               nop        dword ptr [rax + rax + 0xc000ee8]
00df8 4885c0                         test       rax, rax
00dfb 0f852cf8ffff                   jne        0x7f0c73e5ddad
00e01 bef6ffffff                     mov        esi, 0xfffffff6
00e06 6690                           nop        
00e08 c5f877                         vzeroupper 
00e0b e8d050b6ff                     call       0x7f0c739c3660
00e10 0f1f8400080f000d               nop        dword ptr [rax + rax + 0xd000f08]
00e18 bee4ffffff                     mov        esi, 0xffffffe4
00e1d 488b2c24                       mov        rbp, qword ptr [rsp]
00e21 48ff742408                     push       qword ptr [rsp + 8]
00e26 488f0424                       pop        qword ptr [rsp]
00e2a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e2f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00e33 89442408                       mov        dword ptr [rsp + 8], eax
00e37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e41 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e45 8944240c                       mov        dword ptr [rsp + 0xc], eax
00e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e4e 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00e53 90                             nop        
00e54 c5f877                         vzeroupper 
00e57 e88450b6ff                     call       0x7f0c739c3660
00e5c 0f1f8400540f000e               nop        dword ptr [rax + rax + 0xe000f54]
00e64 bee4ffffff                     mov        esi, 0xffffffe4
00e69 488b2c24                       mov        rbp, qword ptr [rsp]
00e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e72 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e76 89442414                       mov        dword ptr [rsp + 0x14], eax
00e7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e7f 48ff742470                     push       qword ptr [rsp + 0x70]
00e84 488f442428                     pop        qword ptr [rsp + 0x28]
00e89 48894424f8                     mov        qword ptr [rsp - 8], rax
00e8e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00e92 89442470                       mov        dword ptr [rsp + 0x70], eax
00e96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e9b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00ea0 c5f877                         vzeroupper 
00ea3 e83850b6ff                     call       0x7f0c739c3660
00ea8 0f1f8400a00f000f               nop        dword ptr [rax + rax + 0xf000fa0]
00eb0 bee4ffffff                     mov        esi, 0xffffffe4
00eb5 488b2c24                       mov        rbp, qword ptr [rsp]
00eb9 48ff742408                     push       qword ptr [rsp + 8]
00ebe 488f0424                       pop        qword ptr [rsp]
00ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ec7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00ecb 89442408                       mov        dword ptr [rsp + 8], eax
00ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ed4 48ff742418                     push       qword ptr [rsp + 0x18]
00ed9 488f442410                     pop        qword ptr [rsp + 0x10]
00ede 48ff742420                     push       qword ptr [rsp + 0x20]
00ee3 488f442418                     pop        qword ptr [rsp + 0x18]
00ee8 48894424f8                     mov        qword ptr [rsp - 8], rax
00eed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ef1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00ef5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efa 48ff742470                     push       qword ptr [rsp + 0x70]
00eff 488f442420                     pop        qword ptr [rsp + 0x20]
00f04 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00f09 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00f12 89442470                       mov        dword ptr [rsp + 0x70], eax
00f16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f20 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00f27 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00f2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f30 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00f39 666690                         nop        
00f3c c5f877                         vzeroupper 
00f3f e89c4fb6ff                     call       0x7f0c739c3660
00f44 0f1f84003c100010               nop        dword ptr [rax + rax + 0x1000103c]
00f4c bee4ffffff                     mov        esi, 0xffffffe4
00f51 488b2c24                       mov        rbp, qword ptr [rsp]
00f55 48ff742408                     push       qword ptr [rsp + 8]
00f5a 488f0424                       pop        qword ptr [rsp]
00f5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f63 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f67 89442408                       mov        dword ptr [rsp + 8], eax
00f6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f70 48ff742418                     push       qword ptr [rsp + 0x18]
00f75 488f442410                     pop        qword ptr [rsp + 0x10]
00f7a 48ff742420                     push       qword ptr [rsp + 0x20]
00f7f 488f442418                     pop        qword ptr [rsp + 0x18]
00f84 48894424f8                     mov        qword ptr [rsp - 8], rax
00f89 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f8d 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f96 48ff742470                     push       qword ptr [rsp + 0x70]
00f9b 488f442420                     pop        qword ptr [rsp + 0x20]
00fa0 c5f877                         vzeroupper 
00fa3 e8384fb6ff                     call       0x7f0c739c3660
00fa8 0f1f8400a0100011               nop        dword ptr [rax + rax + 0x110010a0]
00fb0 bee4ffffff                     mov        esi, 0xffffffe4
00fb5 488b2c24                       mov        rbp, qword ptr [rsp]
00fb9 48ff742408                     push       qword ptr [rsp + 8]
00fbe 488f0424                       pop        qword ptr [rsp]
00fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00fcb 89442408                       mov        dword ptr [rsp + 8], eax
00fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd4 48ff742418                     push       qword ptr [rsp + 0x18]
00fd9 488f442410                     pop        qword ptr [rsp + 0x10]
00fde 48ff742420                     push       qword ptr [rsp + 0x20]
00fe3 488f442418                     pop        qword ptr [rsp + 0x18]
00fe8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ff1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00ff5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffa 48ff742470                     push       qword ptr [rsp + 0x70]
00fff 488f442420                     pop        qword ptr [rsp + 0x20]
01004 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01009 48894424f8                     mov        qword ptr [rsp - 8], rax
0100e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01015 89442474                       mov        dword ptr [rsp + 0x74], eax
01019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0101e c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01027 90                             nop        
01028 c5f877                         vzeroupper 
0102b e8b04eb6ff                     call       0x7f0c739c3660
01030 0f1f840028110012               nop        dword ptr [rax + rax + 0x12001128]
01038 be45ffffff                     mov        esi, 0xffffff45
0103d 488b2c24                       mov        rbp, qword ptr [rsp]
01041 4c89542408                     mov        qword ptr [rsp + 8], r10
01046 6690                           nop        
01048 c5f877                         vzeroupper 
0104b e8904eb6ff                     call       0x7f0c739c3660
01050 0f1f840048110013               nop        dword ptr [rax + rax + 0x13001148]
01058 be45ffffff                     mov        esi, 0xffffff45
0105d 488b2c24                       mov        rbp, qword ptr [rsp]
01061 48ff742408                     push       qword ptr [rsp + 8]
01066 488f0424                       pop        qword ptr [rsp]
0106a 48894424f8                     mov        qword ptr [rsp - 8], rax
0106f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01073 89442408                       mov        dword ptr [rsp + 8], eax
01077 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0107c 48ff742418                     push       qword ptr [rsp + 0x18]
01081 488f442410                     pop        qword ptr [rsp + 0x10]
01086 48ff742420                     push       qword ptr [rsp + 0x20]
0108b 488f442418                     pop        qword ptr [rsp + 0x18]
01090 48894424f8                     mov        qword ptr [rsp - 8], rax
01095 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01099 8944240c                       mov        dword ptr [rsp + 0xc], eax
0109d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a2 48ff742430                     push       qword ptr [rsp + 0x30]
010a7 488f442428                     pop        qword ptr [rsp + 0x28]
010ac 48894424f8                     mov        qword ptr [rsp - 8], rax
010b1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
010b5 89442430                       mov        dword ptr [rsp + 0x30], eax
010b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010be 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
010c3 48894424f8                     mov        qword ptr [rsp - 8], rax
010c8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010cc 89442438                       mov        dword ptr [rsp + 0x38], eax
010d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d5 48894424f8                     mov        qword ptr [rsp - 8], rax
010da 8b442448                       mov        eax, dword ptr [rsp + 0x48]
010de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
010e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e7 48ff742450                     push       qword ptr [rsp + 0x50]
010ec 488f442448                     pop        qword ptr [rsp + 0x48]
010f1 48ff742458                     push       qword ptr [rsp + 0x58]
010f6 488f442450                     pop        qword ptr [rsp + 0x50]
010fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01100 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01104 89442458                       mov        dword ptr [rsp + 0x58], eax
01108 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110d 48894424f8                     mov        qword ptr [rsp - 8], rax
01112 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01116 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0111a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111f 48894424f8                     mov        qword ptr [rsp - 8], rax
01124 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01128 89442460                       mov        dword ptr [rsp + 0x60], eax
0112c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01131 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01136 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0113b 90                             nop        
0113c c5f877                         vzeroupper 
0113f e89c4db6ff                     call       0x7f0c739c3660
01144 0f1f84003c120014               nop        dword ptr [rax + rax + 0x1400123c]
0114c 4d3bc2                         cmp        r8, r10
0114f bdffffffff                     mov        ebp, 0xffffffff
01154 7c08                           jl         0x7f0c73e5e8de
01156 400f95c5                       setne      bpl
0115a 400fb6ed                       movzx      ebp, bpl
0115e be45ffffff                     mov        esi, 0xffffff45
01163 48894424f8                     mov        qword ptr [rsp - 8], rax
01168 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0116c 89442414                       mov        dword ptr [rsp + 0x14], eax
01170 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01175 48ff742470                     push       qword ptr [rsp + 0x70]
0117a 488f442428                     pop        qword ptr [rsp + 0x28]
0117f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01184 48894424f8                     mov        qword ptr [rsp - 8], rax
01189 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0118d 89442470                       mov        dword ptr [rsp + 0x70], eax
01191 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01196 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0119b 90                             nop        
0119c c5f877                         vzeroupper 
0119f e83c4db6ff                     call       0x7f0c739c3660
011a4 0f1f84009c120015               nop        dword ptr [rax + rax + 0x1500129c]
011ac be45ffffff                     mov        esi, 0xffffff45
011b1 488b2c24                       mov        rbp, qword ptr [rsp]
011b5 48ff742408                     push       qword ptr [rsp + 8]
011ba 488f0424                       pop        qword ptr [rsp]
011be 48894424f8                     mov        qword ptr [rsp - 8], rax
011c3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
011c7 89442408                       mov        dword ptr [rsp + 8], eax
011cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d0 48ff742418                     push       qword ptr [rsp + 0x18]
011d5 488f442410                     pop        qword ptr [rsp + 0x10]
011da 48ff742420                     push       qword ptr [rsp + 0x20]
011df 488f442418                     pop        qword ptr [rsp + 0x18]
011e4 48894424f8                     mov        qword ptr [rsp - 8], rax
011e9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011ed 8944240c                       mov        dword ptr [rsp + 0xc], eax
011f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f6 48ff742470                     push       qword ptr [rsp + 0x70]
011fb 488f442420                     pop        qword ptr [rsp + 0x20]
01200 48ff742430                     push       qword ptr [rsp + 0x30]
01205 488f442428                     pop        qword ptr [rsp + 0x28]
0120a 48894424f8                     mov        qword ptr [rsp - 8], rax
0120f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01213 89442430                       mov        dword ptr [rsp + 0x30], eax
01217 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01221 48894424f8                     mov        qword ptr [rsp - 8], rax
01226 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0122a 89442438                       mov        dword ptr [rsp + 0x38], eax
0122e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01233 48894424f8                     mov        qword ptr [rsp - 8], rax
01238 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0123c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01240 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01245 48ff742450                     push       qword ptr [rsp + 0x50]
0124a 488f442448                     pop        qword ptr [rsp + 0x48]
0124f 48ff742458                     push       qword ptr [rsp + 0x58]
01254 488f442450                     pop        qword ptr [rsp + 0x50]
01259 48894424f8                     mov        qword ptr [rsp - 8], rax
0125e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01262 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01266 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126b 48894424f8                     mov        qword ptr [rsp - 8], rax
01270 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01274 89442464                       mov        dword ptr [rsp + 0x64], eax
01278 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0127d 48894424f8                     mov        qword ptr [rsp - 8], rax
01282 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01286 89442468                       mov        dword ptr [rsp + 0x68], eax
0128a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128f 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01294 c5f877                         vzeroupper 
01297 e8444cb6ff                     call       0x7f0c739c3660
0129c 0f1f840094130016               nop        dword ptr [rax + rax + 0x16001394]
012a4 be45ffffff                     mov        esi, 0xffffff45
012a9 488b2c24                       mov        rbp, qword ptr [rsp]
012ad 48ff742408                     push       qword ptr [rsp + 8]
012b2 488f0424                       pop        qword ptr [rsp]
012b6 48894424f8                     mov        qword ptr [rsp - 8], rax
012bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
012bf 89442408                       mov        dword ptr [rsp + 8], eax
012c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c8 48ff742418                     push       qword ptr [rsp + 0x18]
012cd 488f442410                     pop        qword ptr [rsp + 0x10]
012d2 48ff742420                     push       qword ptr [rsp + 0x20]
012d7 488f442418                     pop        qword ptr [rsp + 0x18]
012dc 48894424f8                     mov        qword ptr [rsp - 8], rax
012e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012e5 8944240c                       mov        dword ptr [rsp + 0xc], eax
012e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ee 48ff742470                     push       qword ptr [rsp + 0x70]
012f3 488f442420                     pop        qword ptr [rsp + 0x20]
012f8 48ff742430                     push       qword ptr [rsp + 0x30]
012fd 488f442428                     pop        qword ptr [rsp + 0x28]
01302 48894424f8                     mov        qword ptr [rsp - 8], rax
01307 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0130b 89442430                       mov        dword ptr [rsp + 0x30], eax
0130f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01314 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01319 48894424f8                     mov        qword ptr [rsp - 8], rax
0131e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01322 89442438                       mov        dword ptr [rsp + 0x38], eax
01326 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132b 48894424f8                     mov        qword ptr [rsp - 8], rax
01330 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01334 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01338 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133d 48ff742450                     push       qword ptr [rsp + 0x50]
01342 488f442448                     pop        qword ptr [rsp + 0x48]
01347 48ff742458                     push       qword ptr [rsp + 0x58]
0134c 488f442450                     pop        qword ptr [rsp + 0x50]
01351 48894424f8                     mov        qword ptr [rsp - 8], rax
01356 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0135a 89442458                       mov        dword ptr [rsp + 0x58], eax
0135e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01363 48894424f8                     mov        qword ptr [rsp - 8], rax
01368 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0136c 89442460                       mov        dword ptr [rsp + 0x60], eax
01370 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01375 48894424f8                     mov        qword ptr [rsp - 8], rax
0137a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0137e 89442468                       mov        dword ptr [rsp + 0x68], eax
01382 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01387 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0138c c5f877                         vzeroupper 
0138f e84c4bb6ff                     call       0x7f0c739c3660
01394 0f1f84008c140017               nop        dword ptr [rax + rax + 0x1700148c]
0139c be45ffffff                     mov        esi, 0xffffff45
013a1 488b2c24                       mov        rbp, qword ptr [rsp]
013a5 48ff742408                     push       qword ptr [rsp + 8]
013aa 488f0424                       pop        qword ptr [rsp]
013ae 48894424f8                     mov        qword ptr [rsp - 8], rax
013b3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
013b7 89442408                       mov        dword ptr [rsp + 8], eax
013bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c0 48ff742418                     push       qword ptr [rsp + 0x18]
013c5 488f442410                     pop        qword ptr [rsp + 0x10]
013ca 48ff742420                     push       qword ptr [rsp + 0x20]
013cf 488f442418                     pop        qword ptr [rsp + 0x18]
013d4 48894424f8                     mov        qword ptr [rsp - 8], rax
013d9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013dd 8944240c                       mov        dword ptr [rsp + 0xc], eax
013e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e6 48ff742470                     push       qword ptr [rsp + 0x70]
013eb 488f442420                     pop        qword ptr [rsp + 0x20]
013f0 48ff742430                     push       qword ptr [rsp + 0x30]
013f5 488f442428                     pop        qword ptr [rsp + 0x28]
013fa 48894424f8                     mov        qword ptr [rsp - 8], rax
013ff 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01403 89442430                       mov        dword ptr [rsp + 0x30], eax
01407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01411 48894424f8                     mov        qword ptr [rsp - 8], rax
01416 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0141a 89442438                       mov        dword ptr [rsp + 0x38], eax
0141e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01423 48894424f8                     mov        qword ptr [rsp - 8], rax
01428 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0142c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01430 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01435 48ff742450                     push       qword ptr [rsp + 0x50]
0143a 488f442448                     pop        qword ptr [rsp + 0x48]
0143f 48ff742458                     push       qword ptr [rsp + 0x58]
01444 488f442450                     pop        qword ptr [rsp + 0x50]
01449 48894424f8                     mov        qword ptr [rsp - 8], rax
0144e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01452 89442458                       mov        dword ptr [rsp + 0x58], eax
01456 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145b 48894424f8                     mov        qword ptr [rsp - 8], rax
01460 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01464 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01468 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146d 48894424f8                     mov        qword ptr [rsp - 8], rax
01472 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01476 89442460                       mov        dword ptr [rsp + 0x60], eax
0147a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147f 90                             nop        
01480 c5f877                         vzeroupper 
01483 e8584ab6ff                     call       0x7f0c739c3660
01488 0f1f840080150018               nop        dword ptr [rax + rax + 0x18001580]
01490 be45ffffff                     mov        esi, 0xffffff45
01495 488b2c24                       mov        rbp, qword ptr [rsp]
01499 48ff742408                     push       qword ptr [rsp + 8]
0149e 488f0424                       pop        qword ptr [rsp]
014a2 48894424f8                     mov        qword ptr [rsp - 8], rax
014a7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014ab 89442408                       mov        dword ptr [rsp + 8], eax
014af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b4 48ff742418                     push       qword ptr [rsp + 0x18]
014b9 488f442410                     pop        qword ptr [rsp + 0x10]
014be 48ff742420                     push       qword ptr [rsp + 0x20]
014c3 488f442418                     pop        qword ptr [rsp + 0x18]
014c8 48894424f8                     mov        qword ptr [rsp - 8], rax
014cd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014d1 8944240c                       mov        dword ptr [rsp + 0xc], eax
014d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014da 48ff742470                     push       qword ptr [rsp + 0x70]
014df 488f442420                     pop        qword ptr [rsp + 0x20]
014e4 48ff742430                     push       qword ptr [rsp + 0x30]
014e9 488f442428                     pop        qword ptr [rsp + 0x28]
014ee 48894424f8                     mov        qword ptr [rsp - 8], rax
014f3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
014f7 89442438                       mov        dword ptr [rsp + 0x38], eax
014fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01500 48894424f8                     mov        qword ptr [rsp - 8], rax
01505 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01509 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0150d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01512 48ff742450                     push       qword ptr [rsp + 0x50]
01517 488f442448                     pop        qword ptr [rsp + 0x48]
0151c 48ff742458                     push       qword ptr [rsp + 0x58]
01521 488f442450                     pop        qword ptr [rsp + 0x50]
01526 48894424f8                     mov        qword ptr [rsp - 8], rax
0152b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0152f 89442458                       mov        dword ptr [rsp + 0x58], eax
01533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01538 48894424f8                     mov        qword ptr [rsp - 8], rax
0153d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01541 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01545 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154a 48894424f8                     mov        qword ptr [rsp - 8], rax
0154f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01553 89442460                       mov        dword ptr [rsp + 0x60], eax
01557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155c 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01561 666690                         nop        
01564 c5f877                         vzeroupper 
01567 e87449b6ff                     call       0x7f0c739c3660
0156c 0f1f840064160019               nop        dword ptr [rax + rax + 0x19001664]
01574 4533d2                         xor        r10d, r10d
01577 4c891424                       mov        qword ptr [rsp], r10
0157b e9c8ebffff                     jmp        0x7f0c73e5d8c8
01580 4533d2                         xor        r10d, r10d
01583 4c89542408                     mov        qword ptr [rsp + 8], r10
01588 e9edebffff                     jmp        0x7f0c73e5d8fa
0158d 4533d2                         xor        r10d, r10d
01590 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01595 e912ecffff                     jmp        0x7f0c73e5d92c
0159a 4533d2                         xor        r10d, r10d
0159d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
015a2 e92fecffff                     jmp        0x7f0c73e5d956
015a7 4533d2                         xor        r10d, r10d
015aa 4c89542470                     mov        qword ptr [rsp + 0x70], r10
015af e954ecffff                     jmp        0x7f0c73e5d988
015b4 4533d2                         xor        r10d, r10d
015b7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
015bc e971ecffff                     jmp        0x7f0c73e5d9b2
015c1 bebeffffff                     mov        esi, 0xffffffbe
015c6 488b2c24                       mov        rbp, qword ptr [rsp]
015ca 48ff742408                     push       qword ptr [rsp + 8]
015cf 488f0424                       pop        qword ptr [rsp]
015d3 48894424f8                     mov        qword ptr [rsp - 8], rax
015d8 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015dc 89442408                       mov        dword ptr [rsp + 8], eax
015e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e5 48ff742418                     push       qword ptr [rsp + 0x18]
015ea 488f442410                     pop        qword ptr [rsp + 0x10]
015ef 48ff742420                     push       qword ptr [rsp + 0x20]
015f4 488f442418                     pop        qword ptr [rsp + 0x18]
015f9 48894424f8                     mov        qword ptr [rsp - 8], rax
015fe 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01602 8944240c                       mov        dword ptr [rsp + 0xc], eax
01606 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160b 48ff742430                     push       qword ptr [rsp + 0x30]
01610 488f442428                     pop        qword ptr [rsp + 0x28]
01615 48894424f8                     mov        qword ptr [rsp - 8], rax
0161a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0161e 89442430                       mov        dword ptr [rsp + 0x30], eax
01622 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01627 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0162c 48894424f8                     mov        qword ptr [rsp - 8], rax
01631 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01635 89442438                       mov        dword ptr [rsp + 0x38], eax
01639 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163e 48894424f8                     mov        qword ptr [rsp - 8], rax
01643 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01647 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0164b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01650 48ff742450                     push       qword ptr [rsp + 0x50]
01655 488f442448                     pop        qword ptr [rsp + 0x48]
0165a 48ff742458                     push       qword ptr [rsp + 0x58]
0165f 488f442450                     pop        qword ptr [rsp + 0x50]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0166d 89442458                       mov        dword ptr [rsp + 0x58], eax
01671 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01676 6690                           nop        
01678 c5f877                         vzeroupper 
0167b e86048b6ff                     call       0x7f0c739c3660
01680 0f1f84007817001a               nop        dword ptr [rax + rax + 0x1a001778]
01688 be85ffffff                     mov        esi, 0xffffff85
0168d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01691 48894424f8                     mov        qword ptr [rsp - 8], rax
01696 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0169a 890424                         mov        dword ptr [rsp], eax
0169d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a2 44896c2408                     mov        dword ptr [rsp + 8], r13d
016a7 90                             nop        
016a8 c5f877                         vzeroupper 
016ab e83048b6ff                     call       0x7f0c739c3660
016b0 0f1f8400a817001b               nop        dword ptr [rax + rax + 0x1b0017a8]
016b8 bee4ffffff                     mov        esi, 0xffffffe4
016bd 488b2c24                       mov        rbp, qword ptr [rsp]
016c1 48ff742408                     push       qword ptr [rsp + 8]
016c6 488f0424                       pop        qword ptr [rsp]
016ca 48894424f8                     mov        qword ptr [rsp - 8], rax
016cf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016d3 89442408                       mov        dword ptr [rsp + 8], eax
016d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016dc 48ff742418                     push       qword ptr [rsp + 0x18]
016e1 488f442410                     pop        qword ptr [rsp + 0x10]
016e6 48ff742420                     push       qword ptr [rsp + 0x20]
016eb 488f442418                     pop        qword ptr [rsp + 0x18]
016f0 48894424f8                     mov        qword ptr [rsp - 8], rax
016f5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016f9 8944240c                       mov        dword ptr [rsp + 0xc], eax
016fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01702 48ff742430                     push       qword ptr [rsp + 0x30]
01707 488f442428                     pop        qword ptr [rsp + 0x28]
0170c 48894424f8                     mov        qword ptr [rsp - 8], rax
01711 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01715 89442430                       mov        dword ptr [rsp + 0x30], eax
01719 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
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
017a3 894c2468                       mov        dword ptr [rsp + 0x68], ecx
017a7 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
017af 90                             nop        
017b0 c5f877                         vzeroupper 
017b3 e82847b6ff                     call       0x7f0c739c3660
017b8 0f1f8400b018001c               nop        dword ptr [rax + rax + 0x1c0018b0]
017c0 bef6ffffff                     mov        esi, 0xfffffff6
017c5 666690                         nop        
017c8 c5f877                         vzeroupper 
017cb e81047b6ff                     call       0x7f0c739c3660
017d0 0f1f8400c818001d               nop        dword ptr [rax + rax + 0x1d0018c8]
017d8 bee4ffffff                     mov        esi, 0xffffffe4
017dd 488b2c24                       mov        rbp, qword ptr [rsp]
017e1 48ff742408                     push       qword ptr [rsp + 8]
017e6 488f0424                       pop        qword ptr [rsp]
017ea 48894424f8                     mov        qword ptr [rsp - 8], rax
017ef 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017f3 89442408                       mov        dword ptr [rsp + 8], eax
017f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fc 48ff742418                     push       qword ptr [rsp + 0x18]
01801 488f442410                     pop        qword ptr [rsp + 0x10]
01806 48ff742420                     push       qword ptr [rsp + 0x20]
0180b 488f442418                     pop        qword ptr [rsp + 0x18]
01810 48894424f8                     mov        qword ptr [rsp - 8], rax
01815 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01819 8944240c                       mov        dword ptr [rsp + 0xc], eax
0181d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01822 48ff742470                     push       qword ptr [rsp + 0x70]
01827 488f442420                     pop        qword ptr [rsp + 0x20]
0182c 48894424f8                     mov        qword ptr [rsp - 8], rax
01831 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01835 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183e 48894424f8                     mov        qword ptr [rsp - 8], rax
01843 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01847 89442470                       mov        dword ptr [rsp + 0x70], eax
0184b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01850 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01858 c5f877                         vzeroupper 
0185b e88046b6ff                     call       0x7f0c739c3660
01860 0f1f84005819001e               nop        dword ptr [rax + rax + 0x1e001958]
01868 bee4ffffff                     mov        esi, 0xffffffe4
0186d 488b2c24                       mov        rbp, qword ptr [rsp]
01871 48ff742408                     push       qword ptr [rsp + 8]
01876 488f0424                       pop        qword ptr [rsp]
0187a 48894424f8                     mov        qword ptr [rsp - 8], rax
0187f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01883 89442408                       mov        dword ptr [rsp + 8], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48ff742418                     push       qword ptr [rsp + 0x18]
01891 488f442410                     pop        qword ptr [rsp + 0x10]
01896 48ff742420                     push       qword ptr [rsp + 0x20]
0189b 488f442418                     pop        qword ptr [rsp + 0x18]
018a0 48894424f8                     mov        qword ptr [rsp - 8], rax
018a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018a9 8944240c                       mov        dword ptr [rsp + 0xc], eax
018ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b2 48ff742470                     push       qword ptr [rsp + 0x70]
018b7 488f442420                     pop        qword ptr [rsp + 0x20]
018bc 48894424f8                     mov        qword ptr [rsp - 8], rax
018c1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
018c5 89442470                       mov        dword ptr [rsp + 0x70], eax
018c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ce 4489442474                     mov        dword ptr [rsp + 0x74], r8d
018d3 90                             nop        
018d4 c5f877                         vzeroupper 
018d7 e80446b6ff                     call       0x7f0c739c3660
018dc 0f1f8400d419001f               nop        dword ptr [rax + rax + 0x1f0019d4]
018e4 beccffffff                     mov        esi, 0xffffffcc
018e9 488b2c24                       mov        rbp, qword ptr [rsp]
018ed 48ff742408                     push       qword ptr [rsp + 8]
018f2 488f0424                       pop        qword ptr [rsp]
018f6 48894424f8                     mov        qword ptr [rsp - 8], rax
018fb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018ff 89442408                       mov        dword ptr [rsp + 8], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 48ff742418                     push       qword ptr [rsp + 0x18]
0190d 488f442410                     pop        qword ptr [rsp + 0x10]
01912 48ff742420                     push       qword ptr [rsp + 0x20]
01917 488f442418                     pop        qword ptr [rsp + 0x18]
0191c 48894424f8                     mov        qword ptr [rsp - 8], rax
01921 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01925 8944240c                       mov        dword ptr [rsp + 0xc], eax
01929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192e 48ff742470                     push       qword ptr [rsp + 0x70]
01933 488f442420                     pop        qword ptr [rsp + 0x20]
01938 48894424f8                     mov        qword ptr [rsp - 8], rax
0193d 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01941 89442438                       mov        dword ptr [rsp + 0x38], eax
01945 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194a 6690                           nop        
0194c c5f877                         vzeroupper 
0194f e88c45b6ff                     call       0x7f0c739c3660
01954 0f1f84004c1a0020               nop        dword ptr [rax + rax + 0x20001a4c]
0195c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01964 458d5a08                       lea        r11d, [r10 + 8]
01968 be6effffff                     mov        esi, 0xffffff6e
0196d 488b2c24                       mov        rbp, qword ptr [rsp]
01971 48ff742408                     push       qword ptr [rsp + 8]
01976 488f0424                       pop        qword ptr [rsp]
0197a 48894424f8                     mov        qword ptr [rsp - 8], rax
0197f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01983 89442408                       mov        dword ptr [rsp + 8], eax
01987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198c 48ff742418                     push       qword ptr [rsp + 0x18]
01991 488f442410                     pop        qword ptr [rsp + 0x10]
01996 48ff742420                     push       qword ptr [rsp + 0x20]
0199b 488f442418                     pop        qword ptr [rsp + 0x18]
019a0 48894424f8                     mov        qword ptr [rsp - 8], rax
019a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019a9 8944240c                       mov        dword ptr [rsp + 0xc], eax
019ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b2 48ff742470                     push       qword ptr [rsp + 0x70]
019b7 488f442420                     pop        qword ptr [rsp + 0x20]
019bc 48ff742430                     push       qword ptr [rsp + 0x30]
019c1 488f442428                     pop        qword ptr [rsp + 0x28]
019c6 48894424f8                     mov        qword ptr [rsp - 8], rax
019cb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019cf 8944244c                       mov        dword ptr [rsp + 0x4c], eax
019d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d8 48894424f8                     mov        qword ptr [rsp - 8], rax
019dd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019e1 89442460                       mov        dword ptr [rsp + 0x60], eax
019e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ea 48894424f8                     mov        qword ptr [rsp - 8], rax
019ef 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019f3 89442464                       mov        dword ptr [rsp + 0x64], eax
019f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fc 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01a01 666690                         nop        
01a04 c5f877                         vzeroupper 
01a07 e8d444b6ff                     call       0x7f0c739c3660
01a0c 0f1f8400041b0021               nop        dword ptr [rax + rax + 0x21001b04]
01a14 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01a1c 458d5a08                       lea        r11d, [r10 + 8]
01a20 be66ffffff                     mov        esi, 0xffffff66
01a25 488b2c24                       mov        rbp, qword ptr [rsp]
01a29 48ff742408                     push       qword ptr [rsp + 8]
01a2e 488f0424                       pop        qword ptr [rsp]
01a32 48894424f8                     mov        qword ptr [rsp - 8], rax
01a37 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a3b 89442408                       mov        dword ptr [rsp + 8], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48ff742418                     push       qword ptr [rsp + 0x18]
01a49 488f442410                     pop        qword ptr [rsp + 0x10]
01a4e 48ff742420                     push       qword ptr [rsp + 0x20]
01a53 488f442418                     pop        qword ptr [rsp + 0x18]
01a58 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a61 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6a 48ff742470                     push       qword ptr [rsp + 0x70]
01a6f 488f442420                     pop        qword ptr [rsp + 0x20]
01a74 48ff742430                     push       qword ptr [rsp + 0x30]
01a79 488f442428                     pop        qword ptr [rsp + 0x28]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a87 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 48894424f8                     mov        qword ptr [rsp - 8], rax
01a95 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a99 89442460                       mov        dword ptr [rsp + 0x60], eax
01a9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa2 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01aab 89442464                       mov        dword ptr [rsp + 0x64], eax
01aaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab4 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01ab9 666690                         nop        
01abc c5f877                         vzeroupper 
01abf e81c44b6ff                     call       0x7f0c739c3660
01ac4 0f1f8400bc1b0022               nop        dword ptr [rax + rax + 0x22001bbc]
01acc be6effffff                     mov        esi, 0xffffff6e
01ad1 488b2c24                       mov        rbp, qword ptr [rsp]
01ad5 48ff742408                     push       qword ptr [rsp + 8]
01ada 488f0424                       pop        qword ptr [rsp]
01ade 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ae7 89442408                       mov        dword ptr [rsp + 8], eax
01aeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af0 48ff742418                     push       qword ptr [rsp + 0x18]
01af5 488f442410                     pop        qword ptr [rsp + 0x10]
01afa 48ff742420                     push       qword ptr [rsp + 0x20]
01aff 488f442418                     pop        qword ptr [rsp + 0x18]
01b04 48894424f8                     mov        qword ptr [rsp - 8], rax
01b09 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b0d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b16 48ff742430                     push       qword ptr [rsp + 0x30]
01b1b 488f442428                     pop        qword ptr [rsp + 0x28]
01b20 48894424f8                     mov        qword ptr [rsp - 8], rax
01b25 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b29 89442430                       mov        dword ptr [rsp + 0x30], eax
01b2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b32 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01b37 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b40 89442438                       mov        dword ptr [rsp + 0x38], eax
01b44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b49 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b52 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 48ff742450                     push       qword ptr [rsp + 0x50]
01b60 488f442448                     pop        qword ptr [rsp + 0x48]
01b65 48ff742458                     push       qword ptr [rsp + 0x58]
01b6a 488f442450                     pop        qword ptr [rsp + 0x50]
01b6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b74 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b78 89442458                       mov        dword ptr [rsp + 0x58], eax
01b7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b81 48894424f8                     mov        qword ptr [rsp - 8], rax
01b86 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b8a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b93 48894424f8                     mov        qword ptr [rsp - 8], rax
01b98 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b9c 89442460                       mov        dword ptr [rsp + 0x60], eax
01ba0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba5 48894424f8                     mov        qword ptr [rsp - 8], rax
01baa 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01bae 89442464                       mov        dword ptr [rsp + 0x64], eax
01bb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb7 894c2468                       mov        dword ptr [rsp + 0x68], ecx
01bbb 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01bc0 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01bc5 666690                         nop        
01bc8 c5f877                         vzeroupper 
01bcb e81043b6ff                     call       0x7f0c739c3660
01bd0 0f1f8400c81c0023               nop        dword ptr [rax + rax + 0x23001cc8]
01bd8 458bc1                         mov        r8d, r9d
01bdb e9ddf0ffff                     jmp        0x7f0c73e5e43d
01be0 bee4ffffff                     mov        esi, 0xffffffe4
01be5 488b2c24                       mov        rbp, qword ptr [rsp]
01be9 48ff742408                     push       qword ptr [rsp + 8]
01bee 488f0424                       pop        qword ptr [rsp]
01bf2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bfb 89442408                       mov        dword ptr [rsp + 8], eax
01bff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c04 48ff742418                     push       qword ptr [rsp + 0x18]
01c09 488f442410                     pop        qword ptr [rsp + 0x10]
01c0e 48ff742420                     push       qword ptr [rsp + 0x20]
01c13 488f442418                     pop        qword ptr [rsp + 0x18]
01c18 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c21 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48ff742470                     push       qword ptr [rsp + 0x70]
01c2f 488f442420                     pop        qword ptr [rsp + 0x20]
01c34 48894424f8                     mov        qword ptr [rsp - 8], rax
01c39 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c3d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c46 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c4f 89442460                       mov        dword ptr [rsp + 0x60], eax
01c53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c58 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c61 89442464                       mov        dword ptr [rsp + 0x64], eax
01c65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c73 89442468                       mov        dword ptr [rsp + 0x68], eax
01c77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c81 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c85 89442474                       mov        dword ptr [rsp + 0x74], eax
01c89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8e 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01c93 90                             nop        
01c94 c5f877                         vzeroupper 
01c97 e84442b6ff                     call       0x7f0c739c3660
01c9c 0f1f8400941d0024               nop        dword ptr [rax + rax + 0x24001d94]
01ca4 bee4ffffff                     mov        esi, 0xffffffe4
01ca9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cae 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cb2 89442414                       mov        dword ptr [rsp + 0x14], eax
01cb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbb 48ff742470                     push       qword ptr [rsp + 0x70]
01cc0 488f442428                     pop        qword ptr [rsp + 0x28]
01cc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cca 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cce 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ce0 89442460                       mov        dword ptr [rsp + 0x60], eax
01ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cee 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cf2 89442464                       mov        dword ptr [rsp + 0x64], eax
01cf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfb 90                             nop        
01cfc c5f877                         vzeroupper 
01cff e8dc41b6ff                     call       0x7f0c739c3660
01d04 0f1f8400fc1d0025               nop        dword ptr [rax + rax + 0x25001dfc]
01d0c 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01d13 ffc5                           inc        ebp
01d15 bee4ffffff                     mov        esi, 0xffffffe4
01d1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d23 89442414                       mov        dword ptr [rsp + 0x14], eax
01d27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2c 48ff742470                     push       qword ptr [rsp + 0x70]
01d31 488f442428                     pop        qword ptr [rsp + 0x28]
01d36 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d3f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d48 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d51 89442460                       mov        dword ptr [rsp + 0x60], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d63 89442464                       mov        dword ptr [rsp + 0x64], eax
01d67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d71 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d75 89442470                       mov        dword ptr [rsp + 0x70], eax
01d79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7e 6690                           nop        
01d80 c5f877                         vzeroupper 
01d83 e85841b6ff                     call       0x7f0c739c3660
01d88 0f1f8400801e0026               nop        dword ptr [rax + rax + 0x26001e80]
01d90 bee4ffffff                     mov        esi, 0xffffffe4
01d95 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d9e 89442414                       mov        dword ptr [rsp + 0x14], eax
01da2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da7 48ff742470                     push       qword ptr [rsp + 0x70]
01dac 488f442428                     pop        qword ptr [rsp + 0x28]
01db1 48894424f8                     mov        qword ptr [rsp - 8], rax
01db6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01dba 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01dbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01dcc 89442460                       mov        dword ptr [rsp + 0x60], eax
01dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dda 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01dde 89442464                       mov        dword ptr [rsp + 0x64], eax
01de2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dec 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01df0 89442470                       mov        dword ptr [rsp + 0x70], eax
01df4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df9 666690                         nop        
01dfc c5f877                         vzeroupper 
01dff e8dc40b6ff                     call       0x7f0c739c3660
01e04 0f1f8400fc1e0027               nop        dword ptr [rax + rax + 0x27001efc]
01e0c bee4ffffff                     mov        esi, 0xffffffe4
01e11 488b2c24                       mov        rbp, qword ptr [rsp]
01e15 48ff742408                     push       qword ptr [rsp + 8]
01e1a 488f0424                       pop        qword ptr [rsp]
01e1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e23 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e27 89442408                       mov        dword ptr [rsp + 8], eax
01e2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e30 48ff742418                     push       qword ptr [rsp + 0x18]
01e35 488f442410                     pop        qword ptr [rsp + 0x10]
01e3a 48ff742420                     push       qword ptr [rsp + 0x20]
01e3f 488f442418                     pop        qword ptr [rsp + 0x18]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e4d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 48ff742470                     push       qword ptr [rsp + 0x70]
01e5b 488f442420                     pop        qword ptr [rsp + 0x20]
01e60 48894424f8                     mov        qword ptr [rsp - 8], rax
01e65 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e69 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e72 48894424f8                     mov        qword ptr [rsp - 8], rax
01e77 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e7b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e84 48894424f8                     mov        qword ptr [rsp - 8], rax
01e89 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e8d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e96 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e9f 89442470                       mov        dword ptr [rsp + 0x70], eax
01ea3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea8 c5f877                         vzeroupper 
01eab e83040b6ff                     call       0x7f0c739c3660
01eb0 0f1f8400a81f0028               nop        dword ptr [rax + rax + 0x28001fa8]
01eb8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ebd beccffffff                     mov        esi, 0xffffffcc
01ec2 488b2c24                       mov        rbp, qword ptr [rsp]
01ec6 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01ecb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ed0 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01ed5 666690                         nop        
01ed8 c5f877                         vzeroupper 
01edb e80040b6ff                     call       0x7f0c739c3660
01ee0 0f1f8400d81f0029               nop        dword ptr [rax + rax + 0x29001fd8]
01ee8 eb10                           jmp        0x7f0c73e5f67a
01eea eb0e                           jmp        0x7f0c73e5f67a
01eec eb0c                           jmp        0x7f0c73e5f67a
01eee eb0a                           jmp        0x7f0c73e5f67a
01ef0 eb08                           jmp        0x7f0c73e5f67a
01ef2 eb06                           jmp        0x7f0c73e5f67a
01ef4 eb04                           jmp        0x7f0c73e5f67a
01ef6 eb02                           jmp        0x7f0c73e5f67a
01ef8 eb00                           jmp        0x7f0c73e5f67a
01efa 488bf0                         mov        rsi, rax
01efd e92ee7ffff                     jmp        0x7f0c73e5ddb0
01f02 bef6ffffff                     mov        esi, 0xfffffff6
01f07 90                             nop        
01f08 c5f877                         vzeroupper 
01f0b e8d03fb6ff                     call       0x7f0c739c3660
01f10 0f1f84000820002a               nop        dword ptr [rax + rax + 0x2a002008]
01f18 49ba2ce5e5730c7f0000           movabs     r10, 0x7f0c73e5e52c
01f22 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01f29 e932e8a9ff                     jmp        0x7f0c738fdee0
01f2e e8edb3a8ff                     call       0x7f0c738eaaa0
01f33 e9f6e0ffff                     jmp        0x7f0c73e5d7ae
