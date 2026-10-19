00000 e83bdf2d17                     call       0x7f471713b640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85c01e0000                   jne        0x7f46ffe5f5ee
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
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 448b9ef8000000                 mov        r11d, dword ptr [rsi + 0xf8]
000ad 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b2 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
000b9 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000c0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
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
0010d 49ba801d2217477f0000           movabs     r10, 0x7f4717221d80
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f8400140000                   je         0x7f46ffe5ec30
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15410000                 cmp        r11d, 0x4115
0013e 0f8500150000                   jne        0x7f46ffe5ed44
00144 4c891424                       mov        qword ptr [rsp], r10
00148 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00150 4d85d2                         test       r10, r10
00153 0f84e3130000                   je         0x7f46ffe5ec3c
00159 458b12                         mov        r10d, dword ptr [r10]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fae4050000                 cmp        r10d, 0x5e4
00167 0f85d7140000                   jne        0x7f46ffe5ed44
0016d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00182 4d85d2                         test       r10, r10
00185 0f84be130000                   je         0x7f46ffe5ec49
0018b 458b12                         mov        r10d, dword ptr [r10]
0018e 41c1ea0d                       shr        r10d, 0xd
00192 4181fae7050000                 cmp        r10d, 0x5e7
00199 0f85a5140000                   jne        0x7f46ffe5ed44
0019f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
001a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
001b4 4d85d2                         test       r10, r10
001b7 0f8499130000                   je         0x7f46ffe5ec56
001bd 458b1a                         mov        r11d, dword ptr [r10]
001c0 41c1eb0d                       shr        r11d, 0xd
001c4 4181fbe6050000                 cmp        r11d, 0x5e6
001cb 0f8573140000                   jne        0x7f46ffe5ed44
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001de 4d85d2                         test       r10, r10
001e1 0f847c130000                   je         0x7f46ffe5ec63
001e7 458b12                         mov        r10d, dword ptr [r10]
001ea 41c1ea0d                       shr        r10d, 0xd
001ee 4181fae6050000                 cmp        r10d, 0x5e6
001f5 0f8549140000                   jne        0x7f46ffe5ed44
001fb 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00203 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00208 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00210 4d85d2                         test       r10, r10
00213 0f8457130000                   je         0x7f46ffe5ec70
00219 458b1a                         mov        r11d, dword ptr [r10]
0021c 41c1eb0d                       shr        r11d, 0xd
00220 4181fbe4050000                 cmp        r11d, 0x5e4
00227 0f8517140000                   jne        0x7f46ffe5ed44
0022d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0023b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00240 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00245 4585db                         test       r11d, r11d
00248 0f842f130000                   je         0x7f46ffe5ec7d
0024e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00253 458b5204                       mov        r10d, dword ptr [r10 + 4]
00257 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0025c 4183c2f1                       add        r10d, -0xf
00260 4585d2                         test       r10d, r10d
00263 0f8c14130000                   jl         0x7f46ffe5ec7d
00269 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0026e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00272 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0027a 4183c3f1                       add        r11d, -0xf
0027e 4585db                         test       r11d, r11d
00281 0f8cf6120000                   jl         0x7f46ffe5ec7d
00287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0028c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00290 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00298 4585d2                         test       r10d, r10d
0029b 0f86dc120000                   jbe        0x7f46ffe5ec7d
002a1 4183fa01                       cmp        r10d, 1
002a5 0f86d2120000                   jbe        0x7f46ffe5ec7d
002ab 4183fa02                       cmp        r10d, 2
002af 0f86c8120000                   jbe        0x7f46ffe5ec7d
002b5 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002bd 4183c3f9                       add        r11d, -7
002c1 4585db                         test       r11d, r11d
002c4 0f8cb3120000                   jl         0x7f46ffe5ec7d
002ca 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002d2 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002da 458d53f1                       lea        r10d, [r11 - 0xf]
002de 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002e6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002eb 4183c3f1                       add        r11d, -0xf
002ef 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
002f7 e9ac010000                     jmp        0x7f46ffe5dba8
002fc 4533d2                         xor        r10d, r10d
002ff 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00304 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00309 458b4a0c                       mov        r9d, dword ptr [r10 + 0xc]
0030d 4183fb03                       cmp        r11d, 3
00311 0f8e25020000                   jle        0x7f46ffe5dc3c
00317 45894a10                       mov        dword ptr [r10 + 0x10], r9d
0031b 458b4208                       mov        r8d, dword ptr [r10 + 8]
0031f 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00323 4183c3fd                       add        r11d, -3
00327 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0032f 45895a08                       mov        dword ptr [r10 + 8], r11d
00333 4c639c2494000000               movsxd     r11, dword ptr [rsp + 0x94]
0033b 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00340 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00345 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
0034a 4d03d0                         add        r10, r8
0034d 4d3bda                         cmp        r11, r10
00350 0f8fb60d0000                   jg         0x7f46ffe5e80c
00356 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0035e 4585db                         test       r11d, r11d
00361 0f8e910c0000                   jle        0x7f46ffe5e6f8
00367 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0036c 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00371 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
00376 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
0037b 0f8feb0d0000                   jg         0x7f46ffe5e86c
00381 458bdd                         mov        r11d, r13d
00384 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00389 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
0038e 0f8fd00e0000                   jg         0x7f46ffe5e964
00394 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00399 4183fb10                       cmp        r11d, 0x10
0039d 0f8fb90f0000                   jg         0x7f46ffe5ea5c
003a3 443bac2490000000               cmp        r13d, dword ptr [rsp + 0x90]
003ab 0f83730a0000                   jae        0x7f46ffe5e524
003b1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003b6 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
003bd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003c2 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
003ca 0f83a00a0000                   jae        0x7f46ffe5e570
003d0 4503dd                         add        r11d, r13d
003d3 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
003db 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
003e0 4503ca                         add        r9d, r10d
003e3 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
003e8 4d63ca                         movsxd     r9, r10d
003eb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
003f0 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
003f7 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
003fc 442b9c2494000000               sub        r11d, dword ptr [rsp + 0x94]
00404 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0040c 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
00410 83f910                         cmp        ecx, 0x10
00413 0f8f37100000                   jg         0x7f46ffe5eb50
00419 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00421 4183fb10                       cmp        r11d, 0x10
00425 0f8cf5010000                   jl         0x7f46ffe5dd20
0042b 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00433 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0043b 0f83cb0a0000                   jae        0x7f46ffe5e60c
00441 458bd8                         mov        r11d, r8d
00444 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00449 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00450 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00455 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0045d 0f830d0b0000                   jae        0x7f46ffe5e670
00463 458bda                         mov        r11d, r10d
00466 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
0046b 4d63d3                         movsxd     r10, r11d
0046e 478d0419                       lea        r8d, [r9 + r11]
00472 4403c1                         add        r8d, ecx
00475 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0047a 4d63d9                         movsxd     r11, r9d
0047d 4d03da                         add        r11, r10
00480 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00485 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0048c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00490 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00495 41ffc0                         inc        r8d
00498 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0049d 418502                         test       dword ptr [r10], eax
004a0 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
004a8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
004ad 452bd5                         sub        r10d, r13d
004b0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004b5 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004ba 0f8d09080000                   jge        0x7f46ffe5e3c9
004c0 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
004c5 0f830d090000                   jae        0x7f46ffe5e4d8
004cb 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
004d0 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004d5 4f8b44c308                     mov        r8, qword ptr [r11 + r8*8 + 8]
004da 4d8bd8                         mov        r11, r8
004dd 49c1fb24                       sar        r11, 0x24
004e1 458bdb                         mov        r11d, r11d
004e4 4d8bc8                         mov        r9, r8
004e7 49c1e912                       shr        r9, 0x12
004eb 418bc8                         mov        ecx, r8d
004ee 458bc1                         mov        r8d, r9d
004f1 81e1ffff0100                   and        ecx, 0x1ffff
004f7 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
004fb 4181e0ffff0300                 and        r8d, 0x3ffff
00502 4489442478                     mov        dword ptr [rsp + 0x78], r8d
00507 4585db                         test       r11d, r11d
0050a 0f8c080b0000                   jl         0x7f46ffe5e718
00510 85c9                           test       ecx, ecx
00512 0f84e4fdffff                   je         0x7f46ffe5d9fc
00518 413bca                         cmp        ecx, r10d
0051b 0f8ee3fdffff                   jle        0x7f46ffe5da04
00521 be45ffffff                     mov        esi, 0xffffff45
00526 8be9                           mov        ebp, ecx
00528 44891424                       mov        dword ptr [rsp], r10d
0052c c5f877                         vzeroupper 
0052f e82c5ab6ff                     call       0x7f46ff9c3660
00534 0f1f84002c060001               nop        dword ptr [rax + rax + 0x100062c]
0053c 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00541 4585c0                         test       r8d, r8d
00544 7403                           je         0x7f46ffe5dc49
00546 41ffcb                         dec        r11d
00549 458b5208                       mov        r10d, dword ptr [r10 + 8]
0054d 4585db                         test       r11d, r11d
00550 0f8481000000                   je         0x7f46ffe5dcd7
00556 4183fb03                       cmp        r11d, 3
0055a 0f8412080000                   je         0x7f46ffe5e472
00560 4183fb02                       cmp        r11d, 2
00564 777e                           ja         0x7f46ffe5dce4
00566 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
0056e 0f8300110000                   jae        0x7f46ffe5ed74
00574 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00579 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
0057e 4585db                         test       r11d, r11d
00581 7e4b                           jle        0x7f46ffe5dcce
00583 458d43ff                       lea        r8d, [r11 - 1]
00587 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
0058f 0f83eb140000                   jae        0x7f46ffe5f180
00595 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
0059a 458bc8                         mov        r9d, r8d
0059d 4183c1cc                       add        r9d, -0x34
005a1 41c1e902                       shr        r9d, 2
005a5 478d4419ff                     lea        r8d, [r9 + r11 - 1]
005aa 4d63cb                         movsxd     r9, r11d
005ad 33c9                           xor        ecx, ecx
005af bb04000000                     mov        ebx, 4
005b4 c442e0f5c0                     bzhi       r8, r8, rbx
005b9 4d2bc8                         sub        r9, r8
005bc 49ffc9                         dec        r9
005bf 4d85c9                         test       r9, r9
005c2 4c0f4cc9                       cmovl      r9, rcx
005c6 418bd9                         mov        ebx, r9d
005c9 e9e9050000                     jmp        0x7f46ffe5e2b7
005ce 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
005d3 45895308                       mov        dword ptr [r11 + 8], r10d
005d7 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
005df e94ffdffff                     jmp        0x7f46ffe5da33
005e4 48be90af72e200000000           movabs     rsi, 0xe272af90
005ee 418bed                         mov        ebp, r13d
005f1 666690                         nop        
005f4 c5f877                         vzeroupper 
005f7 e864dba9ff                     call       0x7f46ff8fb860
005fc 0f1f8400f4060002               nop        dword ptr [rax + rax + 0x20006f4]
00604 4885c0                         test       rax, rax
00607 0f847f110000                   je         0x7f46ffe5ee8c
0060d 488bf0                         mov        rsi, rax
00610 c5f877                         vzeroupper 
00613 4881c4c0000000                 add        rsp, 0xc0
0061a 5d                             pop        rbp
0061b e940d8b6ff                     jmp        0x7f46ff9cb560
00620 034c247c                       add        ecx, dword ptr [rsp + 0x7c]
00624 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00628 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0062d 0f8df1020000                   jge        0x7f46ffe5e024
00633 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00638 4183c008                       add        r8d, 8
0063c 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00644 4183fb08                       cmp        r11d, 8
00648 0f8db7010000                   jge        0x7f46ffe5df05
0064e 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00656 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
0065e 0f833c150000                   jae        0x7f46ffe5f2a0
00664 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00669 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
0066f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00674 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0067c 0f83e2150000                   jae        0x7f46ffe5f364
00682 4d63da                         movsxd     r11, r10d
00685 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
0068a 4d03c3                         add        r8, r11
0068d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00692 43886c0308                     mov        byte ptr [r11 + r8 + 8], bpl
00697 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0069f 4183c003                       add        r8d, 3
006a3 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
006a8 41ffc1                         inc        r9d
006ab 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
006b3 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
006bb 0f830b160000                   jae        0x7f46ffe5f3cc
006c1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
006c6 4183c003                       add        r8d, 3
006ca 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
006d2 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
006d7 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
006dd 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
006e5 0f8365160000                   jae        0x7f46ffe5f450
006eb 4d63d2                         movsxd     r10, r10d
006ee 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
006f3 4d03c2                         add        r8, r10
006f6 43886c0109                     mov        byte ptr [r9 + r8 + 9], bpl
006fb 470fbe4c190a                   movsx      r9d, byte ptr [r9 + r11 + 0xa]
00701 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00706 47884c020a                     mov        byte ptr [r10 + r8 + 0xa], r9b
0070b 470fbe541a0b                   movsx      r10d, byte ptr [r10 + r11 + 0xb]
00711 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00716 478854030b                     mov        byte ptr [r11 + r8 + 0xb], r10b
0071b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00723 4183fa08                       cmp        r10d, 8
00727 0f839f160000                   jae        0x7f46ffe5f4cc
0072d 49bad0e870e200000000           movabs     r10, 0xe270e8d0
00737 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0073f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00747 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
0074c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00751 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00756 4183fb04                       cmp        r11d, 4
0075a 7e3c                           jle        0x7f46ffe5de98
0075c 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
00760 83c504                         add        ebp, 4
00763 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00768 8b542414                       mov        edx, dword ptr [rsp + 0x14]
0076c c5f877                         vzeroupper 
0076f e8ecd9a9ff                     call       0x7f46ff8fb860
00774 0f1f84006c080003               nop        dword ptr [rax + rax + 0x300086c]
0077c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00781 8bd5                           mov        edx, ebp
00783 8bc8                           mov        ecx, eax
00785 666690                         nop        
00788 c5f877                         vzeroupper 
0078b e8d0d9a9ff                     call       0x7f46ff8fb860
00790 0f1f840088080004               nop        dword ptr [rax + rax + 0x4000888]
00798 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0079d 4183fb08                       cmp        r11d, 8
007a1 0f8ee5fcffff                   jle        0x7f46ffe5db8c
007a7 49baf8e870e200000000           movabs     r10, 0xe270e8f8
007b1 8b542414                       mov        edx, dword ptr [rsp + 0x14]
007b5 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
007bd 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
007c2 83c208                         add        edx, 8
007c5 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007ca 6690                           nop        
007cc c5f877                         vzeroupper 
007cf e88cd9a9ff                     call       0x7f46ff8fb860
007d4 0f1f8400cc080005               nop        dword ptr [rax + rax + 0x50008cc]
007dc 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
007e0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007e5 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
007ec 488bc8                         mov        rcx, rax
007ef 90                             nop        
007f0 c5f877                         vzeroupper 
007f3 e868d9a9ff                     call       0x7f46ff8fb860
007f8 0f1f8400f0080006               nop        dword ptr [rax + rax + 0x60008f0]
00800 e987fcffff                     jmp        0x7f46ffe5db8c
00805 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0080a 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00811 666690                         nop        
00814 c5f877                         vzeroupper 
00817 e844d9a9ff                     call       0x7f46ff8fb860
0081c 0f1f840014090007               nop        dword ptr [rax + rax + 0x7000914]
00824 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00829 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0082d 488bc8                         mov        rcx, rax
00830 c5f877                         vzeroupper 
00833 e828d9a9ff                     call       0x7f46ff8fb860
00838 0f1f840030090008               nop        dword ptr [rax + rax + 0x8000930]
00840 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00848 4183c208                       add        r10d, 8
0084c be95ffffff                     mov        esi, 0xffffff95
00851 488b2c24                       mov        rbp, qword ptr [rsp]
00855 48ff742408                     push       qword ptr [rsp + 8]
0085a 488f0424                       pop        qword ptr [rsp]
0085e 48894424f8                     mov        qword ptr [rsp - 8], rax
00863 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00867 89442408                       mov        dword ptr [rsp + 8], eax
0086b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00870 48ff742418                     push       qword ptr [rsp + 0x18]
00875 488f442410                     pop        qword ptr [rsp + 0x10]
0087a 48ff742420                     push       qword ptr [rsp + 0x20]
0087f 488f442418                     pop        qword ptr [rsp + 0x18]
00884 48894424f8                     mov        qword ptr [rsp - 8], rax
00889 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0088d 8944240c                       mov        dword ptr [rsp + 0xc], eax
00891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00896 48ff742430                     push       qword ptr [rsp + 0x30]
0089b 488f442428                     pop        qword ptr [rsp + 0x28]
008a0 48894424f8                     mov        qword ptr [rsp - 8], rax
008a5 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
008a9 89442434                       mov        dword ptr [rsp + 0x34], eax
008ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b2 48894424f8                     mov        qword ptr [rsp - 8], rax
008b7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
008bb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
008bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c4 48ff742450                     push       qword ptr [rsp + 0x50]
008c9 488f442448                     pop        qword ptr [rsp + 0x48]
008ce 48ff742458                     push       qword ptr [rsp + 0x58]
008d3 488f442450                     pop        qword ptr [rsp + 0x50]
008d8 48894424f8                     mov        qword ptr [rsp - 8], rax
008dd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008e1 89442458                       mov        dword ptr [rsp + 0x58], eax
008e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ea 48894424f8                     mov        qword ptr [rsp - 8], rax
008ef 8b442464                       mov        eax, dword ptr [rsp + 0x64]
008f3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
008f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008fc 48894424f8                     mov        qword ptr [rsp - 8], rax
00901 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00905 89442460                       mov        dword ptr [rsp + 0x60], eax
00909 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0090e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00913 90                             nop        
00914 c5f877                         vzeroupper 
00917 e84456b6ff                     call       0x7f46ff9c3660
0091c 0f1f8400140a0009               nop        dword ptr [rax + rax + 0x9000a14]
00924 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
00928 83f930                         cmp        ecx, 0x30
0092b 0f8ffb010000                   jg         0x7f46ffe5e22c
00931 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00939 4183c3f9                       add        r11d, -7
0093d 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00945 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0094d 453bc3                         cmp        r8d, r11d
00950 0f834e0e0000                   jae        0x7f46ffe5eea4
00956 458bd8                         mov        r11d, r8d
00959 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00961 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00966 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
0096e 4f8b5c0b08                     mov        r11, qword ptr [r11 + r9 + 8]
00973 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
0097b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00980 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00988 0f839a0e0000                   jae        0x7f46ffe5ef28
0098e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00993 4d63d2                         movsxd     r10, r10d
00996 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0099b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
009a0 4d63d8                         movsxd     r11, r8d
009a3 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
009a8 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
009ac 48be28c122e200000000           movabs     rsi, 0xe222c128
009b6 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009bb 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009c3 4533c9                         xor        r9d, r9d
009c6 6690                           nop        
009c8 c5f877                         vzeroupper 
009cb e890cda9ff                     call       0x7f46ff8fae60
009d0 0f1f8400c80a000a               nop        dword ptr [rax + rax + 0xa000ac8]
009d8 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
009dd 4403542414                     add        r10d, dword ptr [rsp + 0x14]
009e2 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
009e7 458d5a08                       lea        r11d, [r10 + 8]
009eb 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
009f3 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
009f8 0f8d1a010000                   jge        0x7f46ffe5e218
009fe 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a06 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00a0b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00a10 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00a18 4983c0f9                       add        r8, -7
00a1c 4963ca                         movsxd     rcx, r10d
00a1f 4d63cb                         movsxd     r9, r11d
00a22 4d8d1409                       lea        r10, [r9 + rcx]
00a26 4d3bd0                         cmp        r10, r8
00a29 0f83e10e0000                   jae        0x7f46ffe5f010
00a2f 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00a34 4d2bd1                         sub        r10, r9
00a37 4983c207                       add        r10, 7
00a3b 4983e2f8                       and        r10, 0xfffffffffffffff8
00a3f 458bd2                         mov        r10d, r10d
00a42 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00a47 478d540a08                     lea        r10d, [r10 + r9 + 8]
00a4c 4d63d2                         movsxd     r10, r10d
00a4f 4e8d4c11f8                     lea        r9, [rcx + r10 - 8]
00a54 4d3bc8                         cmp        r9, r8
00a57 0f83b30e0000                   jae        0x7f46ffe5f010
00a5d 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00a65 0f83a50e0000                   jae        0x7f46ffe5f010
00a6b 4983c2f8                       add        r10, -8
00a6f 4d3bd0                         cmp        r10, r8
00a72 0f83980e0000                   jae        0x7f46ffe5f010
00a78 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a7d 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a84 0f8f3e0f0000                   jg         0x7f46ffe5f0c8
00a8a 660f1f440000                   nop        word ptr [rax + rax]
00a90 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a98 4963ca                         movsxd     rcx, r10d
00a9b 4883c108                       add        rcx, 8
00a9f 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00aa6 036c2414                       add        ebp, dword ptr [rsp + 0x14]
00aaa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00aaf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ab4 48be28c122e200000000           movabs     rsi, 0xe222c128
00abe 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00ac3 4533c9                         xor        r9d, r9d
00ac6 6690                           nop        
00ac8 c5f877                         vzeroupper 
00acb e890cca9ff                     call       0x7f46ff8fae60
00ad0 0f1f8400c80b000b               nop        dword ptr [rax + rax + 0xb000bc8]
00ad8 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ae0 4183c308                       add        r11d, 8
00ae4 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00aec 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00af1 7c9d                           jl         0x7f46ffe5e190
00af3 eb23                           jmp        0x7f46ffe5e218
00af5 458bd3                         mov        r10d, r11d
00af8 4d63d2                         movsxd     r10, r10d
00afb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b02 c442a8f5db                     bzhi       r11, r11, r10
00b07 c4c1fb92fb                     kmovq      k7, r11
00b0c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b12 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b18 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b1d 4403542478                     add        r10d, dword ptr [rsp + 0x78]
00b22 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b27 e960f9ffff                     jmp        0x7f46ffe5db8c
00b2c 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00b33 85c9                           test       ecx, ecx
00b35 0f8c5d0d0000                   jl         0x7f46ffe5ef98
00b3b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b40 4585d2                         test       r10d, r10d
00b43 0f8c4f0d0000                   jl         0x7f46ffe5ef98
00b49 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b4e 4403d9                         add        r11d, ecx
00b51 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
00b58 413bdb                         cmp        ebx, r11d
00b5b 0f82370d0000                   jb         0x7f46ffe5ef98
00b61 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00b65 0f822d0d0000                   jb         0x7f46ffe5ef98
00b6b 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b70 4585db                         test       r11d, r11d
00b73 74a3                           je         0x7f46ffe5e218
00b75 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b7a 498d7c0a08                     lea        rdi, [r10 + rcx + 8]
00b7f 4d03c1                         add        r8, r9
00b82 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00b87 4963d3                         movsxd     rdx, r11d
00b8a 4883fa20                       cmp        rdx, 0x20
00b8e 0f8661ffffff                   jbe        0x7f46ffe5e1f5
00b94 c5f877                         vzeroupper 
00b97 49ba204f8eff467f0000           movabs     r10, 0x7f46ff8e4f20
00ba1 41ffd2                         call       r10
00ba4 0f1f840000000000               nop        dword ptr [rax + rax]
00bac e967ffffff                     jmp        0x7f46ffe5e218
00bb1 666690                         nop        
00bb4 458bd8                         mov        r11d, r8d
00bb7 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00bbc 478b4c9804                     mov        r9d, dword ptr [r8 + r11*4 + 4]
00bc1 47894c9808                     mov        dword ptr [r8 + r11*4 + 8], r9d
00bc6 458d43ff                       lea        r8d, [r11 - 1]
00bca 443bc3                         cmp        r8d, ebx
00bcd 7fe5                           jg         0x7f46ffe5e2b4
00bcf 4183f83f                       cmp        r8d, 0x3f
00bd3 0f8ebf0f0000                   jle        0x7f46ffe5f298
00bd9 41ffcb                         dec        r11d
00bdc eb05                           jmp        0x7f46ffe5e2e3
00bde 6690                           nop        
00be0 458bd9                         mov        r11d, r9d
00be3 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00be8 62917e486f8498c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x38]
00bf3 62917e487f8498ccffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x34], zmm0
00bfe 62917e486f849888ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x78]
00c09 62917e487f84988cffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x74], zmm0
00c14 62917e486f849848ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0xb8]
00c1f 62917e487f84984cffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0xb4], zmm0
00c2a 62917e486f849808ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0xf8]
00c35 62917e487f84980cffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0xf4], zmm0
00c40 458d4bc0                       lea        r9d, [r11 - 0x40]
00c44 4183f93f                       cmp        r9d, 0x3f
00c48 7f96                           jg         0x7f46ffe5e2e0
00c4a 4183f90f                       cmp        r9d, 0xf
00c4e 7e2d                           jle        0x7f46ffe5e37d
00c50 458bcb                         mov        r9d, r11d
00c53 4183c1c0                       add        r9d, -0x40
00c57 90                             nop        
00c58 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00c5d 62917e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x38]
00c68 62917e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x34], zmm0
00c73 4183c1f0                       add        r9d, -0x10
00c77 4183f90f                       cmp        r9d, 0xf
00c7b 7fdb                           jg         0x7f46ffe5e358
00c7d 4585c9                         test       r9d, r9d
00c80 0f8e48f9ffff                   jle        0x7f46ffe5dcce
00c86 6690                           nop        
00c88 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00c8d 478b448b04                     mov        r8d, dword ptr [r11 + r9*4 + 4]
00c92 4789448b08                     mov        dword ptr [r11 + r9*4 + 8], r8d
00c97 41ffc9                         dec        r9d
00c9a 4585c9                         test       r9d, r9d
00c9d 7fe9                           jg         0x7f46ffe5e388
00c9f e92af9ffff                     jmp        0x7f46ffe5dcce
00ca4 4d63d2                         movsxd     r10, r10d
00ca7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cae c442a8f5db                     bzhi       r11, r11, r10
00cb3 c4c1fb92fb                     kmovq      k7, r11
00cb8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cbe 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cc4 e98b000000                     jmp        0x7f46ffe5e454
00cc9 4585ed                         test       r13d, r13d
00ccc 0f8ca6110000                   jl         0x7f46ffe5f578
00cd2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00cd7 4585db                         test       r11d, r11d
00cda 0f8c9d110000                   jl         0x7f46ffe5f57d
00ce0 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00ce5 443b4c2410                     cmp        r9d, dword ptr [rsp + 0x10]
00cea 0f828d110000                   jb         0x7f46ffe5f57d
00cf0 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00cf4 4103ea                         add        ebp, r10d
00cf7 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00cff 443bc5                         cmp        r8d, ebp
00d02 0f8275110000                   jb         0x7f46ffe5f57d
00d08 4585d2                         test       r10d, r10d
00d0b 0f8c6c110000                   jl         0x7f46ffe5f57d
00d11 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00d16 453bcd                         cmp        r9d, r13d
00d19 7439                           je         0x7f46ffe5e454
00d1b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00d20 4b8d741808                     lea        rsi, [r8 + r11 + 8]
00d25 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00d2a 4b8d7c2b08                     lea        rdi, [r11 + r13 + 8]
00d2f 4963d2                         movsxd     rdx, r10d
00d32 4883fa20                       cmp        rdx, 0x20
00d36 0f8668ffffff                   jbe        0x7f46ffe5e3a4
00d3c c5f877                         vzeroupper 
00d3f 49ba204f8eff467f0000           movabs     r10, 0x7f46ff8e4f20
00d49 41ffd2                         call       r10
00d4c 0f1f840000000000               nop        dword ptr [rax + rax]
00d54 4c8b1424                       mov        r10, qword ptr [rsp]
00d58 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00d5c c5f877                         vzeroupper 
00d5f 4881c4c0000000                 add        rsp, 0xc0
00d66 5d                             pop        rbp
00d67 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d6b 0f8767110000                   ja         0x7f46ffe5f5d8
00d71 c3                             ret        
00d72 41ffca                         dec        r10d
00d75 4585d2                         test       r10d, r10d
00d78 7e1f                           jle        0x7f46ffe5e499
00d7a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00d7f 45894b10                       mov        dword ptr [r11 + 0x10], r9d
00d83 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00d87 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00d8c 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00d90 45895008                       mov        dword ptr [r8 + 8], r10d
00d94 e93ef8ffff                     jmp        0x7f46ffe5dcd7
00d99 48be60af72e200000000           movabs     rsi, 0xe272af60
00da3 418bed                         mov        ebp, r13d
00da6 6690                           nop        
00da8 c5f877                         vzeroupper 
00dab e8b0d3a9ff                     call       0x7f46ff8fb860
00db0 0f1f8400a80e000c               nop        dword ptr [rax + rax + 0xc000ea8]
00db8 4885c0                         test       rax, rax
00dbb 0f854cf8ffff                   jne        0x7f46ffe5dd0d
00dc1 bef6ffffff                     mov        esi, 0xfffffff6
00dc6 6690                           nop        
00dc8 c5f877                         vzeroupper 
00dcb e89051b6ff                     call       0x7f46ff9c3660
00dd0 0f1f8400c80e000d               nop        dword ptr [rax + rax + 0xd000ec8]
00dd8 bee4ffffff                     mov        esi, 0xffffffe4
00ddd 488b2c24                       mov        rbp, qword ptr [rsp]
00de1 48ff742408                     push       qword ptr [rsp + 8]
00de6 488f0424                       pop        qword ptr [rsp]
00dea 48894424f8                     mov        qword ptr [rsp - 8], rax
00def 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00df3 89442408                       mov        dword ptr [rsp + 8], eax
00df7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dfc 48894424f8                     mov        qword ptr [rsp - 8], rax
00e01 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e05 8944240c                       mov        dword ptr [rsp + 0xc], eax
00e09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e0e 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00e13 90                             nop        
00e14 c5f877                         vzeroupper 
00e17 e84451b6ff                     call       0x7f46ff9c3660
00e1c 0f1f8400140f000e               nop        dword ptr [rax + rax + 0xe000f14]
00e24 bee4ffffff                     mov        esi, 0xffffffe4
00e29 488b2c24                       mov        rbp, qword ptr [rsp]
00e2d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e32 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e36 89442414                       mov        dword ptr [rsp + 0x14], eax
00e3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3f 48ff742470                     push       qword ptr [rsp + 0x70]
00e44 488f442428                     pop        qword ptr [rsp + 0x28]
00e49 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00e52 89442470                       mov        dword ptr [rsp + 0x70], eax
00e56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00e60 c5f877                         vzeroupper 
00e63 e8f850b6ff                     call       0x7f46ff9c3660
00e68 0f1f8400600f000f               nop        dword ptr [rax + rax + 0xf000f60]
00e70 bee4ffffff                     mov        esi, 0xffffffe4
00e75 488b2c24                       mov        rbp, qword ptr [rsp]
00e79 48ff742408                     push       qword ptr [rsp + 8]
00e7e 488f0424                       pop        qword ptr [rsp]
00e82 48894424f8                     mov        qword ptr [rsp - 8], rax
00e87 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00e8b 89442408                       mov        dword ptr [rsp + 8], eax
00e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e94 48ff742418                     push       qword ptr [rsp + 0x18]
00e99 488f442410                     pop        qword ptr [rsp + 0x10]
00e9e 48ff742420                     push       qword ptr [rsp + 0x20]
00ea3 488f442418                     pop        qword ptr [rsp + 0x18]
00ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ead 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00eb1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00eb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eba 48ff742470                     push       qword ptr [rsp + 0x70]
00ebf 488f442420                     pop        qword ptr [rsp + 0x20]
00ec4 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00ec9 48894424f8                     mov        qword ptr [rsp - 8], rax
00ece 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00ed2 89442470                       mov        dword ptr [rsp + 0x70], eax
00ed6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00edb 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee0 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ee7 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00eeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00ef9 666690                         nop        
00efc c5f877                         vzeroupper 
00eff e85c50b6ff                     call       0x7f46ff9c3660
00f04 0f1f8400fc0f0010               nop        dword ptr [rax + rax + 0x10000ffc]
00f0c bee4ffffff                     mov        esi, 0xffffffe4
00f11 488b2c24                       mov        rbp, qword ptr [rsp]
00f15 48ff742408                     push       qword ptr [rsp + 8]
00f1a 488f0424                       pop        qword ptr [rsp]
00f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f23 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f27 89442408                       mov        dword ptr [rsp + 8], eax
00f2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f30 48ff742418                     push       qword ptr [rsp + 0x18]
00f35 488f442410                     pop        qword ptr [rsp + 0x10]
00f3a 48ff742420                     push       qword ptr [rsp + 0x20]
00f3f 488f442418                     pop        qword ptr [rsp + 0x18]
00f44 48894424f8                     mov        qword ptr [rsp - 8], rax
00f49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f4d 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f56 48ff742470                     push       qword ptr [rsp + 0x70]
00f5b 488f442420                     pop        qword ptr [rsp + 0x20]
00f60 c5f877                         vzeroupper 
00f63 e8f84fb6ff                     call       0x7f46ff9c3660
00f68 0f1f840060100011               nop        dword ptr [rax + rax + 0x11001060]
00f70 bee4ffffff                     mov        esi, 0xffffffe4
00f75 488b2c24                       mov        rbp, qword ptr [rsp]
00f79 48ff742408                     push       qword ptr [rsp + 8]
00f7e 488f0424                       pop        qword ptr [rsp]
00f82 48894424f8                     mov        qword ptr [rsp - 8], rax
00f87 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f8b 89442408                       mov        dword ptr [rsp + 8], eax
00f8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f94 48ff742418                     push       qword ptr [rsp + 0x18]
00f99 488f442410                     pop        qword ptr [rsp + 0x10]
00f9e 48ff742420                     push       qword ptr [rsp + 0x20]
00fa3 488f442418                     pop        qword ptr [rsp + 0x18]
00fa8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00fb1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fba 48ff742470                     push       qword ptr [rsp + 0x70]
00fbf 488f442420                     pop        qword ptr [rsp + 0x20]
00fc4 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00fc9 48894424f8                     mov        qword ptr [rsp - 8], rax
00fce 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00fd5 89442474                       mov        dword ptr [rsp + 0x74], eax
00fd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fde c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00fe7 90                             nop        
00fe8 c5f877                         vzeroupper 
00feb e8704fb6ff                     call       0x7f46ff9c3660
00ff0 0f1f8400e8100012               nop        dword ptr [rax + rax + 0x120010e8]
00ff8 be45ffffff                     mov        esi, 0xffffff45
00ffd 488b2c24                       mov        rbp, qword ptr [rsp]
01001 4c89542408                     mov        qword ptr [rsp + 8], r10
01006 6690                           nop        
01008 c5f877                         vzeroupper 
0100b e8504fb6ff                     call       0x7f46ff9c3660
01010 0f1f840008110013               nop        dword ptr [rax + rax + 0x13001108]
01018 be45ffffff                     mov        esi, 0xffffff45
0101d 488b2c24                       mov        rbp, qword ptr [rsp]
01021 48ff742408                     push       qword ptr [rsp + 8]
01026 488f0424                       pop        qword ptr [rsp]
0102a 48894424f8                     mov        qword ptr [rsp - 8], rax
0102f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01033 89442408                       mov        dword ptr [rsp + 8], eax
01037 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103c 48ff742418                     push       qword ptr [rsp + 0x18]
01041 488f442410                     pop        qword ptr [rsp + 0x10]
01046 48ff742420                     push       qword ptr [rsp + 0x20]
0104b 488f442418                     pop        qword ptr [rsp + 0x18]
01050 48894424f8                     mov        qword ptr [rsp - 8], rax
01055 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01059 8944240c                       mov        dword ptr [rsp + 0xc], eax
0105d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01062 48ff742430                     push       qword ptr [rsp + 0x30]
01067 488f442428                     pop        qword ptr [rsp + 0x28]
0106c 48894424f8                     mov        qword ptr [rsp - 8], rax
01071 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01075 89442430                       mov        dword ptr [rsp + 0x30], eax
01079 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0107e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01083 48894424f8                     mov        qword ptr [rsp - 8], rax
01088 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0108c 89442438                       mov        dword ptr [rsp + 0x38], eax
01090 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01095 48894424f8                     mov        qword ptr [rsp - 8], rax
0109a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0109e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
010a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a7 48ff742450                     push       qword ptr [rsp + 0x50]
010ac 488f442448                     pop        qword ptr [rsp + 0x48]
010b1 48ff742458                     push       qword ptr [rsp + 0x58]
010b6 488f442450                     pop        qword ptr [rsp + 0x50]
010bb 48894424f8                     mov        qword ptr [rsp - 8], rax
010c0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
010c4 89442458                       mov        dword ptr [rsp + 0x58], eax
010c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010cd 48894424f8                     mov        qword ptr [rsp - 8], rax
010d2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
010d6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
010da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010df 48894424f8                     mov        qword ptr [rsp - 8], rax
010e4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
010e8 89442460                       mov        dword ptr [rsp + 0x60], eax
010ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f1 894c2464                       mov        dword ptr [rsp + 0x64], ecx
010f5 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
010fa 6690                           nop        
010fc c5f877                         vzeroupper 
010ff e85c4eb6ff                     call       0x7f46ff9c3660
01104 0f1f8400fc110014               nop        dword ptr [rax + rax + 0x140011fc]
0110c 4d3bda                         cmp        r11, r10
0110f bdffffffff                     mov        ebp, 0xffffffff
01114 7c08                           jl         0x7f46ffe5e81e
01116 400f95c5                       setne      bpl
0111a 400fb6ed                       movzx      ebp, bpl
0111e be45ffffff                     mov        esi, 0xffffff45
01123 48894424f8                     mov        qword ptr [rsp - 8], rax
01128 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0112c 89442414                       mov        dword ptr [rsp + 0x14], eax
01130 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01135 48ff742470                     push       qword ptr [rsp + 0x70]
0113a 488f442428                     pop        qword ptr [rsp + 0x28]
0113f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01144 48894424f8                     mov        qword ptr [rsp - 8], rax
01149 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0114d 89442470                       mov        dword ptr [rsp + 0x70], eax
01151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01156 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0115b 90                             nop        
0115c c5f877                         vzeroupper 
0115f e8fc4db6ff                     call       0x7f46ff9c3660
01164 0f1f84005c120015               nop        dword ptr [rax + rax + 0x1500125c]
0116c be45ffffff                     mov        esi, 0xffffff45
01171 488b2c24                       mov        rbp, qword ptr [rsp]
01175 48ff742408                     push       qword ptr [rsp + 8]
0117a 488f0424                       pop        qword ptr [rsp]
0117e 48894424f8                     mov        qword ptr [rsp - 8], rax
01183 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01187 89442408                       mov        dword ptr [rsp + 8], eax
0118b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01190 48ff742418                     push       qword ptr [rsp + 0x18]
01195 488f442410                     pop        qword ptr [rsp + 0x10]
0119a 48ff742420                     push       qword ptr [rsp + 0x20]
0119f 488f442418                     pop        qword ptr [rsp + 0x18]
011a4 48894424f8                     mov        qword ptr [rsp - 8], rax
011a9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011ad 8944240c                       mov        dword ptr [rsp + 0xc], eax
011b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b6 48ff742470                     push       qword ptr [rsp + 0x70]
011bb 488f442420                     pop        qword ptr [rsp + 0x20]
011c0 48ff742430                     push       qword ptr [rsp + 0x30]
011c5 488f442428                     pop        qword ptr [rsp + 0x28]
011ca 48894424f8                     mov        qword ptr [rsp - 8], rax
011cf 8b442438                       mov        eax, dword ptr [rsp + 0x38]
011d3 89442430                       mov        dword ptr [rsp + 0x30], eax
011d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011dc 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
011e1 48894424f8                     mov        qword ptr [rsp - 8], rax
011e6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
011ea 89442438                       mov        dword ptr [rsp + 0x38], eax
011ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f3 48894424f8                     mov        qword ptr [rsp - 8], rax
011f8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
011fc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01200 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01205 48ff742450                     push       qword ptr [rsp + 0x50]
0120a 488f442448                     pop        qword ptr [rsp + 0x48]
0120f 48ff742458                     push       qword ptr [rsp + 0x58]
01214 488f442450                     pop        qword ptr [rsp + 0x50]
01219 48894424f8                     mov        qword ptr [rsp - 8], rax
0121e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01222 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01226 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122b 48894424f8                     mov        qword ptr [rsp - 8], rax
01230 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01234 89442464                       mov        dword ptr [rsp + 0x64], eax
01238 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123d 48894424f8                     mov        qword ptr [rsp - 8], rax
01242 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01246 89442468                       mov        dword ptr [rsp + 0x68], eax
0124a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124f 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01254 c5f877                         vzeroupper 
01257 e8044db6ff                     call       0x7f46ff9c3660
0125c 0f1f840054130016               nop        dword ptr [rax + rax + 0x16001354]
01264 be45ffffff                     mov        esi, 0xffffff45
01269 488b2c24                       mov        rbp, qword ptr [rsp]
0126d 48ff742408                     push       qword ptr [rsp + 8]
01272 488f0424                       pop        qword ptr [rsp]
01276 48894424f8                     mov        qword ptr [rsp - 8], rax
0127b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0127f 89442408                       mov        dword ptr [rsp + 8], eax
01283 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01288 48ff742418                     push       qword ptr [rsp + 0x18]
0128d 488f442410                     pop        qword ptr [rsp + 0x10]
01292 48ff742420                     push       qword ptr [rsp + 0x20]
01297 488f442418                     pop        qword ptr [rsp + 0x18]
0129c 48894424f8                     mov        qword ptr [rsp - 8], rax
012a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012a5 8944240c                       mov        dword ptr [rsp + 0xc], eax
012a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ae 48ff742470                     push       qword ptr [rsp + 0x70]
012b3 488f442420                     pop        qword ptr [rsp + 0x20]
012b8 48ff742430                     push       qword ptr [rsp + 0x30]
012bd 488f442428                     pop        qword ptr [rsp + 0x28]
012c2 48894424f8                     mov        qword ptr [rsp - 8], rax
012c7 8b442438                       mov        eax, dword ptr [rsp + 0x38]
012cb 89442430                       mov        dword ptr [rsp + 0x30], eax
012cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d4 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
012d9 48894424f8                     mov        qword ptr [rsp - 8], rax
012de 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
012e2 89442438                       mov        dword ptr [rsp + 0x38], eax
012e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012eb 48894424f8                     mov        qword ptr [rsp - 8], rax
012f0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
012f4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
012f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fd 48ff742450                     push       qword ptr [rsp + 0x50]
01302 488f442448                     pop        qword ptr [rsp + 0x48]
01307 48ff742458                     push       qword ptr [rsp + 0x58]
0130c 488f442450                     pop        qword ptr [rsp + 0x50]
01311 48894424f8                     mov        qword ptr [rsp - 8], rax
01316 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0131a 89442458                       mov        dword ptr [rsp + 0x58], eax
0131e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01323 48894424f8                     mov        qword ptr [rsp - 8], rax
01328 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0132c 89442460                       mov        dword ptr [rsp + 0x60], eax
01330 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01335 48894424f8                     mov        qword ptr [rsp - 8], rax
0133a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0133e 89442468                       mov        dword ptr [rsp + 0x68], eax
01342 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01347 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
0134c c5f877                         vzeroupper 
0134f e80c4cb6ff                     call       0x7f46ff9c3660
01354 0f1f84004c140017               nop        dword ptr [rax + rax + 0x1700144c]
0135c be45ffffff                     mov        esi, 0xffffff45
01361 488b2c24                       mov        rbp, qword ptr [rsp]
01365 48ff742408                     push       qword ptr [rsp + 8]
0136a 488f0424                       pop        qword ptr [rsp]
0136e 48894424f8                     mov        qword ptr [rsp - 8], rax
01373 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01377 89442408                       mov        dword ptr [rsp + 8], eax
0137b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01380 48ff742418                     push       qword ptr [rsp + 0x18]
01385 488f442410                     pop        qword ptr [rsp + 0x10]
0138a 48ff742420                     push       qword ptr [rsp + 0x20]
0138f 488f442418                     pop        qword ptr [rsp + 0x18]
01394 48894424f8                     mov        qword ptr [rsp - 8], rax
01399 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0139d 8944240c                       mov        dword ptr [rsp + 0xc], eax
013a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a6 48ff742470                     push       qword ptr [rsp + 0x70]
013ab 488f442420                     pop        qword ptr [rsp + 0x20]
013b0 48ff742430                     push       qword ptr [rsp + 0x30]
013b5 488f442428                     pop        qword ptr [rsp + 0x28]
013ba 48894424f8                     mov        qword ptr [rsp - 8], rax
013bf 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013c3 89442430                       mov        dword ptr [rsp + 0x30], eax
013c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013cc 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
013d1 48894424f8                     mov        qword ptr [rsp - 8], rax
013d6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013da 89442438                       mov        dword ptr [rsp + 0x38], eax
013de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e3 48894424f8                     mov        qword ptr [rsp - 8], rax
013e8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013ec 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f5 48ff742450                     push       qword ptr [rsp + 0x50]
013fa 488f442448                     pop        qword ptr [rsp + 0x48]
013ff 48ff742458                     push       qword ptr [rsp + 0x58]
01404 488f442450                     pop        qword ptr [rsp + 0x50]
01409 48894424f8                     mov        qword ptr [rsp - 8], rax
0140e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01412 89442458                       mov        dword ptr [rsp + 0x58], eax
01416 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141b 48894424f8                     mov        qword ptr [rsp - 8], rax
01420 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01424 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01428 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142d 48894424f8                     mov        qword ptr [rsp - 8], rax
01432 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01436 89442460                       mov        dword ptr [rsp + 0x60], eax
0143a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143f 90                             nop        
01440 c5f877                         vzeroupper 
01443 e8184bb6ff                     call       0x7f46ff9c3660
01448 0f1f840040150018               nop        dword ptr [rax + rax + 0x18001540]
01450 be45ffffff                     mov        esi, 0xffffff45
01455 488b2c24                       mov        rbp, qword ptr [rsp]
01459 48ff742408                     push       qword ptr [rsp + 8]
0145e 488f0424                       pop        qword ptr [rsp]
01462 48894424f8                     mov        qword ptr [rsp - 8], rax
01467 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0146b 89442408                       mov        dword ptr [rsp + 8], eax
0146f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01474 48ff742418                     push       qword ptr [rsp + 0x18]
01479 488f442410                     pop        qword ptr [rsp + 0x10]
0147e 48ff742420                     push       qword ptr [rsp + 0x20]
01483 488f442418                     pop        qword ptr [rsp + 0x18]
01488 48894424f8                     mov        qword ptr [rsp - 8], rax
0148d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01491 8944240c                       mov        dword ptr [rsp + 0xc], eax
01495 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149a 48ff742470                     push       qword ptr [rsp + 0x70]
0149f 488f442420                     pop        qword ptr [rsp + 0x20]
014a4 48ff742430                     push       qword ptr [rsp + 0x30]
014a9 488f442428                     pop        qword ptr [rsp + 0x28]
014ae 48894424f8                     mov        qword ptr [rsp - 8], rax
014b3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
014b7 89442438                       mov        dword ptr [rsp + 0x38], eax
014bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014c9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d2 48ff742450                     push       qword ptr [rsp + 0x50]
014d7 488f442448                     pop        qword ptr [rsp + 0x48]
014dc 48ff742458                     push       qword ptr [rsp + 0x58]
014e1 488f442450                     pop        qword ptr [rsp + 0x50]
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014ef 89442458                       mov        dword ptr [rsp + 0x58], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 48894424f8                     mov        qword ptr [rsp - 8], rax
014fd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01501 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01505 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150a 48894424f8                     mov        qword ptr [rsp - 8], rax
0150f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01513 89442460                       mov        dword ptr [rsp + 0x60], eax
01517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151c 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01520 c5f877                         vzeroupper 
01523 e8384ab6ff                     call       0x7f46ff9c3660
01528 0f1f840020160019               nop        dword ptr [rax + rax + 0x19001620]
01530 4533d2                         xor        r10d, r10d
01533 4c891424                       mov        qword ptr [rsp], r10
01537 e90cecffff                     jmp        0x7f46ffe5d848
0153c 4533d2                         xor        r10d, r10d
0153f 4c89542408                     mov        qword ptr [rsp + 8], r10
01544 e931ecffff                     jmp        0x7f46ffe5d87a
01549 4533d2                         xor        r10d, r10d
0154c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01551 e956ecffff                     jmp        0x7f46ffe5d8ac
01556 4533d2                         xor        r10d, r10d
01559 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0155e e973ecffff                     jmp        0x7f46ffe5d8d6
01563 4533d2                         xor        r10d, r10d
01566 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0156b e998ecffff                     jmp        0x7f46ffe5d908
01570 4533d2                         xor        r10d, r10d
01573 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01578 e9b5ecffff                     jmp        0x7f46ffe5d932
0157d bebeffffff                     mov        esi, 0xffffffbe
01582 488b2c24                       mov        rbp, qword ptr [rsp]
01586 48ff742408                     push       qword ptr [rsp + 8]
0158b 488f0424                       pop        qword ptr [rsp]
0158f 48894424f8                     mov        qword ptr [rsp - 8], rax
01594 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01598 89442408                       mov        dword ptr [rsp + 8], eax
0159c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a1 48ff742418                     push       qword ptr [rsp + 0x18]
015a6 488f442410                     pop        qword ptr [rsp + 0x10]
015ab 48ff742420                     push       qword ptr [rsp + 0x20]
015b0 488f442418                     pop        qword ptr [rsp + 0x18]
015b5 48894424f8                     mov        qword ptr [rsp - 8], rax
015ba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015be 8944240c                       mov        dword ptr [rsp + 0xc], eax
015c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c7 48ff742430                     push       qword ptr [rsp + 0x30]
015cc 488f442428                     pop        qword ptr [rsp + 0x28]
015d1 48894424f8                     mov        qword ptr [rsp - 8], rax
015d6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
015da 89442430                       mov        dword ptr [rsp + 0x30], eax
015de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e3 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
015e8 48894424f8                     mov        qword ptr [rsp - 8], rax
015ed 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015f1 89442438                       mov        dword ptr [rsp + 0x38], eax
015f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fa 48894424f8                     mov        qword ptr [rsp - 8], rax
015ff 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01603 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01607 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160c 48ff742450                     push       qword ptr [rsp + 0x50]
01611 488f442448                     pop        qword ptr [rsp + 0x48]
01616 48ff742458                     push       qword ptr [rsp + 0x58]
0161b 488f442450                     pop        qword ptr [rsp + 0x50]
01620 48894424f8                     mov        qword ptr [rsp - 8], rax
01625 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01629 89442458                       mov        dword ptr [rsp + 0x58], eax
0162d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01632 6690                           nop        
01634 c5f877                         vzeroupper 
01637 e82449b6ff                     call       0x7f46ff9c3660
0163c 0f1f84003417001a               nop        dword ptr [rax + rax + 0x1a001734]
01644 be85ffffff                     mov        esi, 0xffffff85
01649 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0164d 48894424f8                     mov        qword ptr [rsp - 8], rax
01652 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01656 890424                         mov        dword ptr [rsp], eax
01659 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165e 44896c2408                     mov        dword ptr [rsp + 8], r13d
01663 90                             nop        
01664 c5f877                         vzeroupper 
01667 e8f448b6ff                     call       0x7f46ff9c3660
0166c 0f1f84006417001b               nop        dword ptr [rax + rax + 0x1b001764]
01674 bee4ffffff                     mov        esi, 0xffffffe4
01679 488b2c24                       mov        rbp, qword ptr [rsp]
0167d 48ff742408                     push       qword ptr [rsp + 8]
01682 488f0424                       pop        qword ptr [rsp]
01686 48894424f8                     mov        qword ptr [rsp - 8], rax
0168b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0168f 89442408                       mov        dword ptr [rsp + 8], eax
01693 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01698 48ff742418                     push       qword ptr [rsp + 0x18]
0169d 488f442410                     pop        qword ptr [rsp + 0x10]
016a2 48ff742420                     push       qword ptr [rsp + 0x20]
016a7 488f442418                     pop        qword ptr [rsp + 0x18]
016ac 48894424f8                     mov        qword ptr [rsp - 8], rax
016b1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016b5 8944240c                       mov        dword ptr [rsp + 0xc], eax
016b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016be 48ff742430                     push       qword ptr [rsp + 0x30]
016c3 488f442428                     pop        qword ptr [rsp + 0x28]
016c8 48894424f8                     mov        qword ptr [rsp - 8], rax
016cd 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016d1 89442430                       mov        dword ptr [rsp + 0x30], eax
016d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016da 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016df 48894424f8                     mov        qword ptr [rsp - 8], rax
016e4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016e8 89442438                       mov        dword ptr [rsp + 0x38], eax
016ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f1 48894424f8                     mov        qword ptr [rsp - 8], rax
016f6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016fa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01703 48ff742450                     push       qword ptr [rsp + 0x50]
01708 488f442448                     pop        qword ptr [rsp + 0x48]
0170d 48ff742458                     push       qword ptr [rsp + 0x58]
01712 488f442450                     pop        qword ptr [rsp + 0x50]
01717 48894424f8                     mov        qword ptr [rsp - 8], rax
0171c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01720 89442458                       mov        dword ptr [rsp + 0x58], eax
01724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01729 48894424f8                     mov        qword ptr [rsp - 8], rax
0172e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01732 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01736 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173b 48894424f8                     mov        qword ptr [rsp - 8], rax
01740 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01744 89442460                       mov        dword ptr [rsp + 0x60], eax
01748 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174d 48894424f8                     mov        qword ptr [rsp - 8], rax
01752 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01756 89442464                       mov        dword ptr [rsp + 0x64], eax
0175a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175f 48894424f8                     mov        qword ptr [rsp - 8], rax
01764 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01768 89442468                       mov        dword ptr [rsp + 0x68], eax
0176c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01771 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01779 666690                         nop        
0177c c5f877                         vzeroupper 
0177f e8dc47b6ff                     call       0x7f46ff9c3660
01784 0f1f84007c18001c               nop        dword ptr [rax + rax + 0x1c00187c]
0178c bef6ffffff                     mov        esi, 0xfffffff6
01791 666690                         nop        
01794 c5f877                         vzeroupper 
01797 e8c447b6ff                     call       0x7f46ff9c3660
0179c 0f1f84009418001d               nop        dword ptr [rax + rax + 0x1d001894]
017a4 bee4ffffff                     mov        esi, 0xffffffe4
017a9 488b2c24                       mov        rbp, qword ptr [rsp]
017ad 48ff742408                     push       qword ptr [rsp + 8]
017b2 488f0424                       pop        qword ptr [rsp]
017b6 48894424f8                     mov        qword ptr [rsp - 8], rax
017bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017bf 89442408                       mov        dword ptr [rsp + 8], eax
017c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c8 48ff742418                     push       qword ptr [rsp + 0x18]
017cd 488f442410                     pop        qword ptr [rsp + 0x10]
017d2 48ff742420                     push       qword ptr [rsp + 0x20]
017d7 488f442418                     pop        qword ptr [rsp + 0x18]
017dc 48894424f8                     mov        qword ptr [rsp - 8], rax
017e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017e5 8944240c                       mov        dword ptr [rsp + 0xc], eax
017e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ee 48ff742470                     push       qword ptr [rsp + 0x70]
017f3 488f442420                     pop        qword ptr [rsp + 0x20]
017f8 48894424f8                     mov        qword ptr [rsp - 8], rax
017fd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01801 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01805 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180a 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0180e 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01816 6690                           nop        
01818 c5f877                         vzeroupper 
0181b e84047b6ff                     call       0x7f46ff9c3660
01820 0f1f84001819001e               nop        dword ptr [rax + rax + 0x1e001918]
01828 bee4ffffff                     mov        esi, 0xffffffe4
0182d 488b2c24                       mov        rbp, qword ptr [rsp]
01831 48ff742408                     push       qword ptr [rsp + 8]
01836 488f0424                       pop        qword ptr [rsp]
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01843 89442408                       mov        dword ptr [rsp + 8], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 48ff742418                     push       qword ptr [rsp + 0x18]
01851 488f442410                     pop        qword ptr [rsp + 0x10]
01856 48ff742420                     push       qword ptr [rsp + 0x20]
0185b 488f442418                     pop        qword ptr [rsp + 0x18]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01869 8944240c                       mov        dword ptr [rsp + 0xc], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 48ff742470                     push       qword ptr [rsp + 0x70]
01877 488f442420                     pop        qword ptr [rsp + 0x20]
0187c 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01880 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01885 666690                         nop        
01888 c5f877                         vzeroupper 
0188b e8d046b6ff                     call       0x7f46ff9c3660
01890 0f1f84008819001f               nop        dword ptr [rax + rax + 0x1f001988]
01898 beccffffff                     mov        esi, 0xffffffcc
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
018e2 48ff742470                     push       qword ptr [rsp + 0x70]
018e7 488f442420                     pop        qword ptr [rsp + 0x20]
018ec 48894424f8                     mov        qword ptr [rsp - 8], rax
018f1 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
018f5 89442438                       mov        dword ptr [rsp + 0x38], eax
018f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fe 6690                           nop        
01900 c5f877                         vzeroupper 
01903 e85846b6ff                     call       0x7f46ff9c3660
01908 0f1f8400001a0020               nop        dword ptr [rax + rax + 0x20001a00]
01910 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01918 458d5308                       lea        r10d, [r11 + 8]
0191c be6effffff                     mov        esi, 0xffffff6e
01921 488b2c24                       mov        rbp, qword ptr [rsp]
01925 48ff742408                     push       qword ptr [rsp + 8]
0192a 488f0424                       pop        qword ptr [rsp]
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01937 89442408                       mov        dword ptr [rsp + 8], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48ff742418                     push       qword ptr [rsp + 0x18]
01945 488f442410                     pop        qword ptr [rsp + 0x10]
0194a 48ff742420                     push       qword ptr [rsp + 0x20]
0194f 488f442418                     pop        qword ptr [rsp + 0x18]
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0195d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01961 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01966 48ff742470                     push       qword ptr [rsp + 0x70]
0196b 488f442420                     pop        qword ptr [rsp + 0x20]
01970 48ff742430                     push       qword ptr [rsp + 0x30]
01975 488f442428                     pop        qword ptr [rsp + 0x28]
0197a 48894424f8                     mov        qword ptr [rsp - 8], rax
0197f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01983 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198c 48894424f8                     mov        qword ptr [rsp - 8], rax
01991 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01995 89442460                       mov        dword ptr [rsp + 0x60], eax
01999 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199e 48894424f8                     mov        qword ptr [rsp - 8], rax
019a3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019a7 89442464                       mov        dword ptr [rsp + 0x64], eax
019ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
019b5 666690                         nop        
019b8 c5f877                         vzeroupper 
019bb e8a045b6ff                     call       0x7f46ff9c3660
019c0 0f1f8400b81a0021               nop        dword ptr [rax + rax + 0x21001ab8]
019c8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
019d0 458d5308                       lea        r10d, [r11 + 8]
019d4 be66ffffff                     mov        esi, 0xffffff66
019d9 488b2c24                       mov        rbp, qword ptr [rsp]
019dd 48ff742408                     push       qword ptr [rsp + 8]
019e2 488f0424                       pop        qword ptr [rsp]
019e6 48894424f8                     mov        qword ptr [rsp - 8], rax
019eb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019ef 89442408                       mov        dword ptr [rsp + 8], eax
019f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f8 48ff742418                     push       qword ptr [rsp + 0x18]
019fd 488f442410                     pop        qword ptr [rsp + 0x10]
01a02 48ff742420                     push       qword ptr [rsp + 0x20]
01a07 488f442418                     pop        qword ptr [rsp + 0x18]
01a0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a11 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a15 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1e 48ff742470                     push       qword ptr [rsp + 0x70]
01a23 488f442420                     pop        qword ptr [rsp + 0x20]
01a28 48ff742430                     push       qword ptr [rsp + 0x30]
01a2d 488f442428                     pop        qword ptr [rsp + 0x28]
01a32 48894424f8                     mov        qword ptr [rsp - 8], rax
01a37 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a3b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a4d 89442460                       mov        dword ptr [rsp + 0x60], eax
01a51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a56 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a5f 89442464                       mov        dword ptr [rsp + 0x64], eax
01a63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a68 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01a6d 666690                         nop        
01a70 c5f877                         vzeroupper 
01a73 e8e844b6ff                     call       0x7f46ff9c3660
01a78 0f1f8400701b0022               nop        dword ptr [rax + rax + 0x22001b70]
01a80 be6effffff                     mov        esi, 0xffffff6e
01a85 488b2c24                       mov        rbp, qword ptr [rsp]
01a89 48ff742408                     push       qword ptr [rsp + 8]
01a8e 488f0424                       pop        qword ptr [rsp]
01a92 48894424f8                     mov        qword ptr [rsp - 8], rax
01a97 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a9b 89442408                       mov        dword ptr [rsp + 8], eax
01a9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa4 48ff742418                     push       qword ptr [rsp + 0x18]
01aa9 488f442410                     pop        qword ptr [rsp + 0x10]
01aae 48ff742420                     push       qword ptr [rsp + 0x20]
01ab3 488f442418                     pop        qword ptr [rsp + 0x18]
01ab8 48894424f8                     mov        qword ptr [rsp - 8], rax
01abd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ac1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ac5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aca 48ff742430                     push       qword ptr [rsp + 0x30]
01acf 488f442428                     pop        qword ptr [rsp + 0x28]
01ad4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01add 89442430                       mov        dword ptr [rsp + 0x30], eax
01ae1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae6 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
01af0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01af4 89442438                       mov        dword ptr [rsp + 0x38], eax
01af8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afd 48894424f8                     mov        qword ptr [rsp - 8], rax
01b02 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b06 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0f 48ff742450                     push       qword ptr [rsp + 0x50]
01b14 488f442448                     pop        qword ptr [rsp + 0x48]
01b19 48ff742458                     push       qword ptr [rsp + 0x58]
01b1e 488f442450                     pop        qword ptr [rsp + 0x50]
01b23 48894424f8                     mov        qword ptr [rsp - 8], rax
01b28 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b2c 89442458                       mov        dword ptr [rsp + 0x58], eax
01b30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b35 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b50 89442460                       mov        dword ptr [rsp + 0x60], eax
01b54 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b59 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b62 89442464                       mov        dword ptr [rsp + 0x64], eax
01b66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b70 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b74 89442468                       mov        dword ptr [rsp + 0x68], eax
01b78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01b82 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01b87 90                             nop        
01b88 c5f877                         vzeroupper 
01b8b e8d043b6ff                     call       0x7f46ff9c3660
01b90 0f1f8400881c0023               nop        dword ptr [rax + rax + 0x23001c88]
01b98 458bc8                         mov        r9d, r8d
01b9b e9ddf0ffff                     jmp        0x7f46ffe5e37d
01ba0 bee4ffffff                     mov        esi, 0xffffffe4
01ba5 488b2c24                       mov        rbp, qword ptr [rsp]
01ba9 48ff742408                     push       qword ptr [rsp + 8]
01bae 488f0424                       pop        qword ptr [rsp]
01bb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bbb 89442408                       mov        dword ptr [rsp + 8], eax
01bbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc4 48ff742418                     push       qword ptr [rsp + 0x18]
01bc9 488f442410                     pop        qword ptr [rsp + 0x10]
01bce 48ff742420                     push       qword ptr [rsp + 0x20]
01bd3 488f442418                     pop        qword ptr [rsp + 0x18]
01bd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bdd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01be1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bea 48ff742470                     push       qword ptr [rsp + 0x70]
01bef 488f442420                     pop        qword ptr [rsp + 0x20]
01bf4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bfd 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c06 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c0f 89442460                       mov        dword ptr [rsp + 0x60], eax
01c13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c18 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c21 89442464                       mov        dword ptr [rsp + 0x64], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c33 89442468                       mov        dword ptr [rsp + 0x68], eax
01c37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c41 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c45 89442474                       mov        dword ptr [rsp + 0x74], eax
01c49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4e 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01c53 90                             nop        
01c54 c5f877                         vzeroupper 
01c57 e80443b6ff                     call       0x7f46ff9c3660
01c5c 0f1f8400541d0024               nop        dword ptr [rax + rax + 0x24001d54]
01c64 bee4ffffff                     mov        esi, 0xffffffe4
01c69 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c72 89442414                       mov        dword ptr [rsp + 0x14], eax
01c76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7b 48ff742470                     push       qword ptr [rsp + 0x70]
01c80 488f442428                     pop        qword ptr [rsp + 0x28]
01c85 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c8e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c97 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ca0 89442460                       mov        dword ptr [rsp + 0x60], eax
01ca4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cae 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cb2 89442464                       mov        dword ptr [rsp + 0x64], eax
01cb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbb 90                             nop        
01cbc c5f877                         vzeroupper 
01cbf e89c42b6ff                     call       0x7f46ff9c3660
01cc4 0f1f8400bc1d0025               nop        dword ptr [rax + rax + 0x25001dbc]
01ccc 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01cd3 ffc5                           inc        ebp
01cd5 bee4ffffff                     mov        esi, 0xffffffe4
01cda 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ce3 89442414                       mov        dword ptr [rsp + 0x14], eax
01ce7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cec 48ff742470                     push       qword ptr [rsp + 0x70]
01cf1 488f442428                     pop        qword ptr [rsp + 0x28]
01cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cff 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d08 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d11 89442460                       mov        dword ptr [rsp + 0x60], eax
01d15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d23 89442464                       mov        dword ptr [rsp + 0x64], eax
01d27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d31 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d35 89442470                       mov        dword ptr [rsp + 0x70], eax
01d39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3e 6690                           nop        
01d40 c5f877                         vzeroupper 
01d43 e81842b6ff                     call       0x7f46ff9c3660
01d48 0f1f8400401e0026               nop        dword ptr [rax + rax + 0x26001e40]
01d50 bee4ffffff                     mov        esi, 0xffffffe4
01d55 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d5e 89442414                       mov        dword ptr [rsp + 0x14], eax
01d62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d67 48ff742470                     push       qword ptr [rsp + 0x70]
01d6c 488f442428                     pop        qword ptr [rsp + 0x28]
01d71 48894424f8                     mov        qword ptr [rsp - 8], rax
01d76 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d7a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d83 48894424f8                     mov        qword ptr [rsp - 8], rax
01d88 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d8c 89442460                       mov        dword ptr [rsp + 0x60], eax
01d90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d95 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9a 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d9e 89442464                       mov        dword ptr [rsp + 0x64], eax
01da2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dac 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01db0 89442470                       mov        dword ptr [rsp + 0x70], eax
01db4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db9 666690                         nop        
01dbc c5f877                         vzeroupper 
01dbf e89c41b6ff                     call       0x7f46ff9c3660
01dc4 0f1f8400bc1e0027               nop        dword ptr [rax + rax + 0x27001ebc]
01dcc bee4ffffff                     mov        esi, 0xffffffe4
01dd1 488b2c24                       mov        rbp, qword ptr [rsp]
01dd5 48ff742408                     push       qword ptr [rsp + 8]
01dda 488f0424                       pop        qword ptr [rsp]
01dde 48894424f8                     mov        qword ptr [rsp - 8], rax
01de3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01de7 89442408                       mov        dword ptr [rsp + 8], eax
01deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df0 48ff742418                     push       qword ptr [rsp + 0x18]
01df5 488f442410                     pop        qword ptr [rsp + 0x10]
01dfa 48ff742420                     push       qword ptr [rsp + 0x20]
01dff 488f442418                     pop        qword ptr [rsp + 0x18]
01e04 48894424f8                     mov        qword ptr [rsp - 8], rax
01e09 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e0d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e16 48ff742470                     push       qword ptr [rsp + 0x70]
01e1b 488f442420                     pop        qword ptr [rsp + 0x20]
01e20 48894424f8                     mov        qword ptr [rsp - 8], rax
01e25 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e29 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e3b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e4d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e5f 89442470                       mov        dword ptr [rsp + 0x70], eax
01e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e68 c5f877                         vzeroupper 
01e6b e8f040b6ff                     call       0x7f46ff9c3660
01e70 0f1f8400681f0028               nop        dword ptr [rax + rax + 0x28001f68]
01e78 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e7d beccffffff                     mov        esi, 0xffffffcc
01e82 488b2c24                       mov        rbp, qword ptr [rsp]
01e86 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e8b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e90 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e95 666690                         nop        
01e98 c5f877                         vzeroupper 
01e9b e8c040b6ff                     call       0x7f46ff9c3660
01ea0 0f1f8400981f0029               nop        dword ptr [rax + rax + 0x29001f98]
01ea8 eb10                           jmp        0x7f46ffe5f5ba
01eaa eb0e                           jmp        0x7f46ffe5f5ba
01eac eb0c                           jmp        0x7f46ffe5f5ba
01eae eb0a                           jmp        0x7f46ffe5f5ba
01eb0 eb08                           jmp        0x7f46ffe5f5ba
01eb2 eb06                           jmp        0x7f46ffe5f5ba
01eb4 eb04                           jmp        0x7f46ffe5f5ba
01eb6 eb02                           jmp        0x7f46ffe5f5ba
01eb8 eb00                           jmp        0x7f46ffe5f5ba
01eba 488bf0                         mov        rsi, rax
01ebd e94ee7ffff                     jmp        0x7f46ffe5dd10
01ec2 bef6ffffff                     mov        esi, 0xfffffff6
01ec7 90                             nop        
01ec8 c5f877                         vzeroupper 
01ecb e89040b6ff                     call       0x7f46ff9c3660
01ed0 0f1f8400c81f002a               nop        dword ptr [rax + rax + 0x2a001fc8]
01ed8 49ba67e4e5ff467f0000           movabs     r10, 0x7f46ffe5e467
01ee2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01ee9 e9f2e8a9ff                     jmp        0x7f46ff8fdee0
01eee e8adb4a8ff                     call       0x7f46ff8eaaa0
01ef3 e936e1ffff                     jmp        0x7f46ffe5d72e
