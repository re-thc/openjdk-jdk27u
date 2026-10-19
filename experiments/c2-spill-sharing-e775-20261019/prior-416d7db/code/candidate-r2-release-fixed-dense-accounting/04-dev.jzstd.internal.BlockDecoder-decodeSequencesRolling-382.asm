00000 e8fb2ad317                     call       0x7fa893ba2880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec20010000                 sub        rsp, 0x120
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85522b0000                   jne        0x7fa87be72900
0002e 4c8baee8010000                 mov        r13, qword ptr [rsi + 0x1e8]
00035 4c8bb6d0010000                 mov        r14, qword ptr [rsi + 0x1d0]
0003c 448b9ed0000000                 mov        r11d, dword ptr [rsi + 0xd0]
00043 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0004b 4c8b96c8010000                 mov        r10, qword ptr [rsi + 0x1c8]
00052 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00057 4c8b9660010000                 mov        r10, qword ptr [rsi + 0x160]
0005e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00063 4c8b9658010000                 mov        r10, qword ptr [rsi + 0x158]
0006a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0006f 4c8b9650010000                 mov        r10, qword ptr [rsi + 0x150]
00076 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0007b 4c8b9610010000                 mov        r10, qword ptr [rsi + 0x110]
00082 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0008a 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00091 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00096 448b9ee0010000                 mov        r11d, dword ptr [rsi + 0x1e0]
0009d 44895c2408                     mov        dword ptr [rsp + 8], r11d
000a2 448b96d8010000                 mov        r10d, dword ptr [rsi + 0x1d8]
000a9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
000ae 448b9ec0010000                 mov        r11d, dword ptr [rsi + 0x1c0]
000b5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
000ba 448b96b8010000                 mov        r10d, dword ptr [rsi + 0x1b8]
000c1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
000c6 448b9ea0010000                 mov        r11d, dword ptr [rsi + 0x1a0]
000cd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000d2 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000d9 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000e0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000e5 448b9e70010000                 mov        r11d, dword ptr [rsi + 0x170]
000ec 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000f1 448b9668010000                 mov        r10d, dword ptr [rsi + 0x168]
000f8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
000fd 448b9e28010000                 mov        r11d, dword ptr [rsi + 0x128]
00104 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0010c 448b9620010000                 mov        r10d, dword ptr [rsi + 0x120]
00113 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0011b 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00122 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0012a 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
00131 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00139 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
00140 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00148 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
0014f 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00157 448b96e0000000                 mov        r10d, dword ptr [rsi + 0xe0]
0015e 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00166 448b9ed8000000                 mov        r11d, dword ptr [rsi + 0xd8]
0016d 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00175 448b9698010000                 mov        r10d, dword ptr [rsi + 0x198]
0017c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00181 488bfe                         mov        rdi, rsi
00184 49ba4018c893a87f0000           movabs     r10, 0x7fa893c81840
0018e 41ffd2                         call       r10
00191 0f1f840000000000               nop        dword ptr [rax + rax]
00199 4d85ed                         test       r13, r13
0019c 0f84d2260000                   je         0x7fa87be725f4
001a2 458b5d04                       mov        r11d, dword ptr [r13 + 4]
001a6 41c1eb0a                       shr        r11d, 0xa
001aa 4181fb05020000                 cmp        r11d, 0x205
001b1 0f8535280000                   jne        0x7fa87be7276c
001b7 4d8bd5                         mov        r10, r13
001ba 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
001c2 4d85f6                         test       r14, r14
001c5 0f84b9260000                   je         0x7fa87be72604
001cb 458b5604                       mov        r10d, dword ptr [r14 + 4]
001cf 41c1ea0a                       shr        r10d, 0xa
001d3 4181fa0e080000                 cmp        r10d, 0x80e
001da 0f850c280000                   jne        0x7fa87be7276c
001e0 4d8bd6                         mov        r10, r14
001e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001ed 4d85d2                         test       r10, r10
001f0 0f849b260000                   je         0x7fa87be72611
001f6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001fa 41c1eb0a                       shr        r11d, 0xa
001fe 4181fb16060000                 cmp        r11d, 0x616
00205 0f85e1270000                   jne        0x7fa87be7276c
0020b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00210 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00215 4d85d2                         test       r10, r10
00218 0f8480260000                   je         0x7fa87be7261e
0021e 458b5204                       mov        r10d, dword ptr [r10 + 4]
00222 41c1ea0a                       shr        r10d, 0xa
00226 4181fa1c060000                 cmp        r10d, 0x61c
0022d 0f85b9270000                   jne        0x7fa87be7276c
00233 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00238 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0023d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00242 4d85d2                         test       r10, r10
00245 0f8460260000                   je         0x7fa87be7262b
0024b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0024f 41c1eb0a                       shr        r11d, 0xa
00253 4181fb1c060000                 cmp        r11d, 0x61c
0025a 0f858c270000                   jne        0x7fa87be7276c
00260 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00265 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0026a 4d85d2                         test       r10, r10
0026d 0f8445260000                   je         0x7fa87be72638
00273 458b5204                       mov        r10d, dword ptr [r10 + 4]
00277 41c1ea0a                       shr        r10d, 0xa
0027b 4181fa1c060000                 cmp        r10d, 0x61c
00282 0f8564270000                   jne        0x7fa87be7276c
00288 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0028d 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00295 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0029d 4d85d2                         test       r10, r10
002a0 0f8422260000                   je         0x7fa87be72648
002a6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002aa 41c1eb0a                       shr        r11d, 0xa
002ae 4181fb08020000                 cmp        r11d, 0x208
002b5 0f8531270000                   jne        0x7fa87be7276c
002bb 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002c3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002c8 4d85d2                         test       r10, r10
002cb 0f8407260000                   je         0x7fa87be72658
002d1 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d5 41c1ea0a                       shr        r10d, 0xa
002d9 4181fa07020000                 cmp        r10d, 0x207
002e0 0f8506270000                   jne        0x7fa87be7276c
002e6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002eb 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
002f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002f8 4d85d2                         test       r10, r10
002fb 0f84e7250000                   je         0x7fa87be72668
00301 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00306 4d85d2                         test       r10, r10
00309 0f84d9250000                   je         0x7fa87be72668
0030f 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00317 4d85d2                         test       r10, r10
0031a 0f84c8250000                   je         0x7fa87be72668
00320 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00328 418b6a08                       mov        ebp, dword ptr [r10 + 8]
0032c 892c24                         mov        dword ptr [rsp], ebp
0032f 4c8b942408010000               mov        r10, qword ptr [rsp + 0x108]
00337 458b4208                       mov        r8d, dword ptr [r10 + 8]
0033b 458d50f9                       lea        r10d, [r8 - 7]
0033f 4585d2                         test       r10d, r10d
00342 0f8ca0250000                   jl         0x7fa87be72668
00348 4183c0f9                       add        r8d, -7
0034c 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
00354 e962020000                     jmp        0x7fa87be7033b
00359 4c8b9c2408010000               mov        r11, qword ptr [rsp + 0x108]
00361 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00366 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
0036b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00370 48894424f8                     mov        qword ptr [rsp - 8], rax
00375 8b442430                       mov        eax, dword ptr [rsp + 0x30]
00379 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0037d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00382 0f1f8000000000                 nop        dword ptr [rax]
00389 0f1f8000000000                 nop        dword ptr [rax]
00390 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8da4100000                   jge        0x7fa87be711c4
003a0 c462d3f79c2400010000           shrx       r11, qword ptr [rsp + 0x100], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942400010000               and        r10, qword ptr [rsp + 0x100]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d39120000                   jge        0x7fa87be7138c
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d00140000                   jge        0x7fa87be7157c
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8db7150000                   jge        0x7fa87be7175c
00425 41b801000000                   mov        r8d, 1
0042b c442d1f7c8                     shlx       r9, r8, rbp
00430 49ffc9                         dec        r9
00433 4d23cb                         and        r9, r11
00436 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0043e 458bc3                         mov        r8d, r11d
00441 4403c1                         add        r8d, ecx
00444 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0044c 458bdb                         mov        r11d, r11d
0044f 4403df                         add        r11d, edi
00452 4963c8                         movsxd     rcx, r8d
00455 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
0045d 8bff                           mov        edi, edi
0045f 4c03cf                         add        r9, rdi
00462 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
0046a 4803f9                         add        rdi, rcx
0046d 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
00475 4d85c9                         test       r9, r9
00478 0f8e3a0c0000                   jle        0x7fa87be70e38
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f2d170000                   jg         0x7fa87be71938
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8f94180000                   jg         0x7fa87be71aac
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f2f1a0000                   jg         0x7fa87be71c54
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83c71b0000                   jae        0x7fa87be71dfc
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83150a0000                   jae        0x7fa87be70c70
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc110                     mov        qword ptr [r9 + r8*8 + 0x10], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8daf000000                   jge        0x7fa87be7032d
004fe 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00512 49c1e830                       shr        r8, 0x30
00516 458bdb                         mov        r11d, r11d
00519 418bc8                         mov        ecx, r8d
0051c 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00524 44038c24e8000000               add        r9d, dword ptr [rsp + 0xe8]
0052c c44233f7c2                     shrx       r8d, r10d, r9d
00531 4103c8                         add        ecx, r8d
00534 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0053b 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00543 c44233f7ca                     shrx       r9d, r10d, r9d
00548 8b8c24e8000000                 mov        ecx, dword ptr [rsp + 0xe8]
0054f 83f920                         cmp        ecx, 0x20
00552 0f8d241d0000                   jge        0x7fa87be71ffc
00558 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00560 49c1e830                       shr        r8, 0x30
00564 458bc0                         mov        r8d, r8d
00567 ba01000000                     mov        edx, 1
0056c c4e271f7ca                     shlx       ecx, edx, ecx
00571 ffc9                           dec        ecx
00573 4123c9                         and        ecx, r9d
00576 4103cb                         add        ecx, r11d
00579 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00580 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00588 4183fb20                       cmp        r11d, 0x20
0058c 0f8d1e1e0000                   jge        0x7fa87be72130
00592 b901000000                     mov        ecx, 1
00597 c46221f7d9                     shlx       r11d, ecx, r11d
0059c 41ffcb                         dec        r11d
0059f 4523da                         and        r11d, r10d
005a2 4503d8                         add        r11d, r8d
005a5 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
005ad 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b1 418502                         test       dword ptr [r10], eax
005b4 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005bb 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005c3 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005c8 0f8d80040000                   jge        0x7fa87be707ce
005ce 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
005d3 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
005d7 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
005df 44239c24a0000000               and        r11d, dword ptr [rsp + 0xa0]
005e7 458b4a08                       mov        r9d, dword ptr [r10 + 8]
005eb 453bd9                         cmp        r11d, r9d
005ee 0f83fa040000                   jae        0x7fa87be7086e
005f4 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
005f9 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
005fd 8b8c248c000000                 mov        ecx, dword ptr [rsp + 0x8c]
00604 238c24a4000000                 and        ecx, dword ptr [rsp + 0xa4]
0060b 458b4108                       mov        r8d, dword ptr [r9 + 8]
0060f 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
00614 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0061c 413bc8                         cmp        ecx, r8d
0061f 0f8307060000                   jae        0x7fa87be709ac
00625 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0062d 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
00631 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00639 44239c24a8000000               and        r11d, dword ptr [rsp + 0xa8]
00641 458b4208                       mov        r8d, dword ptr [r10 + 8]
00645 4d8b4cc910                     mov        r9, qword ptr [r9 + rcx*8 + 0x10]
0064a 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
00652 453bd8                         cmp        r11d, r8d
00655 0f8319070000                   jae        0x7fa87be70af4
0065b 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
00660 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00668 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0066f ffc5                           inc        ebp
00671 896c2404                       mov        dword ptr [rsp + 4], ebp
00675 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00679 0f8d40040000                   jge        0x7fa87be7083f
0067f 49c1ea28                       shr        r10, 0x28
00683 458bda                         mov        r11d, r10d
00686 450fb6db                       movzx      r11d, r11b
0068a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00692 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0069a 49c1ea28                       shr        r10, 0x28
0069e 458bd2                         mov        r10d, r10d
006a1 450fb6c2                       movzx      r8d, r10b
006a5 4503c3                         add        r8d, r11d
006a8 4d8bd1                         mov        r10, r9
006ab 49c1ea28                       shr        r10, 0x28
006af 458bda                         mov        r11d, r10d
006b2 450fb6d3                       movzx      r10d, r11b
006b6 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
006be 4503c2                         add        r8d, r10d
006c1 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
006c9 41bb01000000                   mov        r11d, 1
006cf 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
006d7 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006df 49c1ea20                       shr        r10, 0x20
006e3 458bd2                         mov        r10d, r10d
006e6 410fb6ea                       movzx      ebp, r10b
006ea 89ac24ac000000                 mov        dword ptr [rsp + 0xac], ebp
006f1 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006f9 49c1ea20                       shr        r10, 0x20
006fd 458bda                         mov        r11d, r10d
00700 410fb6eb                       movzx      ebp, r11b
00704 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
0070b 4d8bd1                         mov        r10, r9
0070e 49c1ea20                       shr        r10, 0x20
00712 458bd2                         mov        r10d, r10d
00715 410fb6ea                       movzx      ebp, r10b
00719 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00720 448bdd                         mov        r11d, ebp
00723 44039c24ac000000               add        r11d, dword ptr [rsp + 0xac]
0072b 44039c24f4000000               add        r11d, dword ptr [rsp + 0xf4]
00733 44039c24f0000000               add        r11d, dword ptr [rsp + 0xf0]
0073b 4585db                         test       r11d, r11d
0073e 0f84e40a0000                   je         0x7fa87be70fa8
00744 4183fb3f                       cmp        r11d, 0x3f
00748 0f8f960c0000                   jg         0x7fa87be71164
0074e 41ba40000000                   mov        r10d, 0x40
00754 442b542448                     sub        r10d, dword ptr [rsp + 0x48]
00759 453bda                         cmp        r11d, r10d
0075c 7e43                           jle        0x7fa87be70521
0075e 458bc3                         mov        r8d, r11d
00761 452bc2                         sub        r8d, r10d
00764 4183fa40                       cmp        r10d, 0x40
00768 0f8d2a1f0000                   jge        0x7fa87be72418
0076e 41b901000000                   mov        r9d, 1
00774 c442a9f7d1                     shlx       r10, r9, r10
00779 49ffca                         dec        r10
0077c 4c23d3                         and        r10, rbx
0077f c442b9f7ca                     shlx       r9, r10, r8
00784 41ba40000000                   mov        r10d, 0x40
0078a 452bd0                         sub        r10d, r8d
0078d c462abf7542440                 shrx       r10, qword ptr [rsp + 0x40], r10
00794 4d0bca                         or         r9, r10
00797 4c898c2400010000               mov        qword ptr [rsp + 0x100], r9
0079f eb2b                           jmp        0x7fa87be7054c
007a1 452bd3                         sub        r10d, r11d
007a4 c462abf7d3                     shrx       r10, rbx, r10
007a9 4183fb40                       cmp        r11d, 0x40
007ad 0f8d151d0000                   jge        0x7fa87be72248
007b3 41b801000000                   mov        r8d, 1
007b9 c442a1f7c0                     shlx       r8, r8, r11
007be 49ffc8                         dec        r8
007c1 4d23c2                         and        r8, r10
007c4 4c89842400010000               mov        qword ptr [rsp + 0x100], r8
007cc 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
007d1 4503c3                         add        r8d, r11d
007d4 4489442448                     mov        dword ptr [rsp + 0x48], r8d
007d9 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
007de 4503d3                         add        r10d, r11d
007e1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
007e6 4183f840                       cmp        r8d, 0x40
007ea 0f8ca0fbffff                   jl         0x7fa87be70110
007f0 458d58c0                       lea        r11d, [r8 - 0x40]
007f4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
007f9 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007fd 83c5f8                         add        ebp, -8
00800 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00804 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00808 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0080c 83c1f0                         add        ecx, -0x10
0080f 83f908                         cmp        ecx, 8
00812 0f8ce8010000                   jl         0x7fa87be70780
00818 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0081d 4183c2e8                       add        r10d, -0x18
00821 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00829 0f822afbffff                   jb         0x7fa87be700d9
0082f bee4ffffff                     mov        esi, 0xffffffe4
00834 48894424f8                     mov        qword ptr [rsp - 8], rax
00839 8b442408                       mov        eax, dword ptr [rsp + 8]
0083d 890424                         mov        dword ptr [rsp], eax
00840 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00845 48894424f8                     mov        qword ptr [rsp - 8], rax
0084a 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0084e 89442404                       mov        dword ptr [rsp + 4], eax
00852 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00857 48ff742410                     push       qword ptr [rsp + 0x10]
0085c 488f442408                     pop        qword ptr [rsp + 8]
00861 48ff742418                     push       qword ptr [rsp + 0x18]
00866 488f442410                     pop        qword ptr [rsp + 0x10]
0086b 48894424f8                     mov        qword ptr [rsp - 8], rax
00870 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00874 89442418                       mov        dword ptr [rsp + 0x18], eax
00878 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0087d 48894424f8                     mov        qword ptr [rsp - 8], rax
00882 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00886 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0088a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088f 48894424f8                     mov        qword ptr [rsp - 8], rax
00894 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00898 89442420                       mov        dword ptr [rsp + 0x20], eax
0089c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a1 48894424f8                     mov        qword ptr [rsp - 8], rax
008a6 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008aa 89442424                       mov        dword ptr [rsp + 0x24], eax
008ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b3 48ff742440                     push       qword ptr [rsp + 0x40]
008b8 488f442428                     pop        qword ptr [rsp + 0x28]
008bd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008c2 48894424f8                     mov        qword ptr [rsp - 8], rax
008c7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
008cb 89442434                       mov        dword ptr [rsp + 0x34], eax
008cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008d4 48ff742450                     push       qword ptr [rsp + 0x50]
008d9 488f442438                     pop        qword ptr [rsp + 0x38]
008de 48ff742458                     push       qword ptr [rsp + 0x58]
008e3 488f442440                     pop        qword ptr [rsp + 0x40]
008e8 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
008f0 488f442448                     pop        qword ptr [rsp + 0x48]
008f5 48894424f8                     mov        qword ptr [rsp - 8], rax
008fa 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00901 89442450                       mov        dword ptr [rsp + 0x50], eax
00905 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0090a 48894424f8                     mov        qword ptr [rsp - 8], rax
0090f 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00916 89442454                       mov        dword ptr [rsp + 0x54], eax
0091a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0091f 48894424f8                     mov        qword ptr [rsp - 8], rax
00924 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0092b 89442458                       mov        dword ptr [rsp + 0x58], eax
0092f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00934 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0093c 488f442460                     pop        qword ptr [rsp + 0x60]
00941 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00949 488f442468                     pop        qword ptr [rsp + 0x68]
0094e 48ffb42498000000               push       qword ptr [rsp + 0x98]
00956 488f442470                     pop        qword ptr [rsp + 0x70]
0095b 48894424f8                     mov        qword ptr [rsp - 8], rax
00960 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00967 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0096b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00970 48894424f8                     mov        qword ptr [rsp - 8], rax
00975 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0097c 89442478                       mov        dword ptr [rsp + 0x78], eax
00980 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00985 48894424f8                     mov        qword ptr [rsp - 8], rax
0098a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00991 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099a 48894424f8                     mov        qword ptr [rsp - 8], rax
0099f 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
009a6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b2 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009ba 488f842488000000               pop        qword ptr [rsp + 0x88]
009c2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009ca 488f842490000000               pop        qword ptr [rsp + 0x90]
009d2 48894424f8                     mov        qword ptr [rsp - 8], rax
009d7 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
009de 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
009e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009ea 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009f2 90                             nop        
009f3 e8e875b6ff                     call       0x7fa87b9d7d60
009f8 0f1f8400f00a0001               nop        dword ptr [rax + rax + 0x1000af0]
00a00 85c9                           test       ecx, ecx
00a02 7f08                           jg         0x7fa87be7078c
00a04 4533d2                         xor        r10d, r10d
00a07 e95af9ffff                     jmp        0x7fa87be700e6
00a0c 8be9                           mov        ebp, ecx
00a0e 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
00a16 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a1a 90                             nop        
00a1b e8c000aaff                     call       0x7fa87b910860
00a20 0f1f8400180b0002               nop        dword ptr [rax + rax + 0x2000b18]
00a28 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a2d 41c1e003                       shl        r8d, 3
00a31 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a36 41c1e303                       shl        r11d, 3
00a3a 452bd8                         sub        r11d, r8d
00a3d 4181c3c0000000                 add        r11d, 0xc0
00a44 c462a1f7d0                     shlx       r10, rax, r11
00a49 e918f9ffff                     jmp        0x7fa87be700e6
00a4e 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00a56 4c03942498000000               add        r10, qword ptr [rsp + 0x98]
00a5e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a63 4d3bd3                         cmp        r10, r11
00a66 7e31                           jle        0x7fa87be70819
00a68 48bea8367ce200000000           movabs     rsi, 0xe27c36a8
00a72 90                             nop        
00a73 e86800aaff                     call       0x7fa87b910860
00a78 0f1f8400700b0003               nop        dword ptr [rax + rax + 0x3000b70]
00a80 4885c0                         test       rax, rax
00a83 0f846b200000                   je         0x7fa87be72874
00a89 488bf0                         mov        rsi, rax
00a8c 4881c420010000                 add        rsp, 0x120
00a93 5d                             pop        rbp
00a94 e9479eb6ff                     jmp        0x7fa87b9da660
00a99 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00a9e 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00aa3 0f855f200000                   jne        0x7fa87be72888
00aa9 418bc2                         mov        eax, r10d
00aac 4881c420010000                 add        rsp, 0x120
00ab3 5d                             pop        rbp
00ab4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ab8 0f87ac200000                   ja         0x7fa87be728ea
00abe c3                             ret        
00abf 4533d2                         xor        r10d, r10d
00ac2 4533c0                         xor        r8d, r8d
00ac5 4533db                         xor        r11d, r11d
00ac8 33c9                           xor        ecx, ecx
00aca 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00ad2 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00ada 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
00ae2 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
00ae9 e9e9fbffff                     jmp        0x7fa87be70457
00aee bee4ffffff                     mov        esi, 0xffffffe4
00af3 48894424f8                     mov        qword ptr [rsp - 8], rax
00af8 8b442408                       mov        eax, dword ptr [rsp + 8]
00afc 890424                         mov        dword ptr [rsp], eax
00aff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b04 48894424f8                     mov        qword ptr [rsp - 8], rax
00b09 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b0d 89442404                       mov        dword ptr [rsp + 4], eax
00b11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b16 48ff742410                     push       qword ptr [rsp + 0x10]
00b1b 488f442408                     pop        qword ptr [rsp + 8]
00b20 48ff742418                     push       qword ptr [rsp + 0x18]
00b25 488f442410                     pop        qword ptr [rsp + 0x10]
00b2a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b2f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b33 89442418                       mov        dword ptr [rsp + 0x18], eax
00b37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b41 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b45 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b53 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b57 89442420                       mov        dword ptr [rsp + 0x20], eax
00b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b60 48894424f8                     mov        qword ptr [rsp - 8], rax
00b65 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b69 89442424                       mov        dword ptr [rsp + 0x24], eax
00b6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b72 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b77 48ff742440                     push       qword ptr [rsp + 0x40]
00b7c 488f442430                     pop        qword ptr [rsp + 0x30]
00b81 48894424f8                     mov        qword ptr [rsp - 8], rax
00b86 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00b8a 89442438                       mov        dword ptr [rsp + 0x38], eax
00b8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b93 48894424f8                     mov        qword ptr [rsp - 8], rax
00b98 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00b9c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ba0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba5 48ff742450                     push       qword ptr [rsp + 0x50]
00baa 488f442440                     pop        qword ptr [rsp + 0x40]
00baf 48ff742458                     push       qword ptr [rsp + 0x58]
00bb4 488f442448                     pop        qword ptr [rsp + 0x48]
00bb9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bbe 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00bc5 89442458                       mov        dword ptr [rsp + 0x58], eax
00bc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bce 48894424f8                     mov        qword ptr [rsp - 8], rax
00bd3 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00bda 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00bde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00be3 48894424f8                     mov        qword ptr [rsp - 8], rax
00be8 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00bef 89442460                       mov        dword ptr [rsp + 0x60], eax
00bf3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
00bfd 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00c04 89442464                       mov        dword ptr [rsp + 0x64], eax
00c08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c0d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00c15 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00c1d 6690                           nop        
00c1f e8bc73b6ff                     call       0x7fa87b9d7d60
00c24 0f1f84001c0d0004               nop        dword ptr [rax + rax + 0x4000d1c]
00c2c bee4ffffff                     mov        esi, 0xffffffe4
00c31 48894424f8                     mov        qword ptr [rsp - 8], rax
00c36 8b442408                       mov        eax, dword ptr [rsp + 8]
00c3a 890424                         mov        dword ptr [rsp], eax
00c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c42 48894424f8                     mov        qword ptr [rsp - 8], rax
00c47 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c4b 89442404                       mov        dword ptr [rsp + 4], eax
00c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c54 48ff742410                     push       qword ptr [rsp + 0x10]
00c59 488f442408                     pop        qword ptr [rsp + 8]
00c5e 48ff742418                     push       qword ptr [rsp + 0x18]
00c63 488f442410                     pop        qword ptr [rsp + 0x10]
00c68 48894424f8                     mov        qword ptr [rsp - 8], rax
00c6d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c71 89442418                       mov        dword ptr [rsp + 0x18], eax
00c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c83 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c91 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c95 89442420                       mov        dword ptr [rsp + 0x20], eax
00c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ca7 89442424                       mov        dword ptr [rsp + 0x24], eax
00cab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00cb5 48ff742440                     push       qword ptr [rsp + 0x40]
00cba 488f442430                     pop        qword ptr [rsp + 0x30]
00cbf 48894424f8                     mov        qword ptr [rsp - 8], rax
00cc4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00cc8 89442438                       mov        dword ptr [rsp + 0x38], eax
00ccc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cd1 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00cda 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce3 48ff742450                     push       qword ptr [rsp + 0x50]
00ce8 488f442440                     pop        qword ptr [rsp + 0x40]
00ced 48ff742458                     push       qword ptr [rsp + 0x58]
00cf2 488f442448                     pop        qword ptr [rsp + 0x48]
00cf7 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfc 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00d03 89442458                       mov        dword ptr [rsp + 0x58], eax
00d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d11 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00d18 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d21 48894424f8                     mov        qword ptr [rsp - 8], rax
00d26 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00d2d 89442460                       mov        dword ptr [rsp + 0x60], eax
00d31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d36 48ffb42498000000               push       qword ptr [rsp + 0x98]
00d3e 488f442478                     pop        qword ptr [rsp + 0x78]
00d43 48894424f8                     mov        qword ptr [rsp - 8], rax
00d48 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00d4f 89442464                       mov        dword ptr [rsp + 0x64], eax
00d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d58 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d60 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d67 e87472b6ff                     call       0x7fa87b9d7d60
00d6c 0f1f8400640e0005               nop        dword ptr [rax + rax + 0x5000e64]
00d74 bee4ffffff                     mov        esi, 0xffffffe4
00d79 48894424f8                     mov        qword ptr [rsp - 8], rax
00d7e 8b442408                       mov        eax, dword ptr [rsp + 8]
00d82 890424                         mov        dword ptr [rsp], eax
00d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d93 89442404                       mov        dword ptr [rsp + 4], eax
00d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9c 48ff742410                     push       qword ptr [rsp + 0x10]
00da1 488f442408                     pop        qword ptr [rsp + 8]
00da6 48ff742418                     push       qword ptr [rsp + 0x18]
00dab 488f442410                     pop        qword ptr [rsp + 0x10]
00db0 48894424f8                     mov        qword ptr [rsp - 8], rax
00db5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00db9 89442418                       mov        dword ptr [rsp + 0x18], eax
00dbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00dcb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00dcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd4 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ddd 89442420                       mov        dword ptr [rsp + 0x20], eax
00de1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de6 48894424f8                     mov        qword ptr [rsp - 8], rax
00deb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00def 89442424                       mov        dword ptr [rsp + 0x24], eax
00df3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00dfd 48ff742440                     push       qword ptr [rsp + 0x40]
00e02 488f442430                     pop        qword ptr [rsp + 0x30]
00e07 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00e10 89442438                       mov        dword ptr [rsp + 0x38], eax
00e14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e19 48894424f8                     mov        qword ptr [rsp - 8], rax
00e1e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00e22 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e2b 48ff742450                     push       qword ptr [rsp + 0x50]
00e30 488f442440                     pop        qword ptr [rsp + 0x40]
00e35 48ff742458                     push       qword ptr [rsp + 0x58]
00e3a 488f442448                     pop        qword ptr [rsp + 0x48]
00e3f 48894424f8                     mov        qword ptr [rsp - 8], rax
00e44 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00e4b 89442458                       mov        dword ptr [rsp + 0x58], eax
00e4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e54 48894424f8                     mov        qword ptr [rsp - 8], rax
00e59 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00e60 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e69 48894424f8                     mov        qword ptr [rsp - 8], rax
00e6e 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00e75 89442460                       mov        dword ptr [rsp + 0x60], eax
00e79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e7e 48ffb42498000000               push       qword ptr [rsp + 0x98]
00e86 488f442478                     pop        qword ptr [rsp + 0x78]
00e8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00e90 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00e97 89442464                       mov        dword ptr [rsp + 0x64], eax
00e9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00eac 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ebd 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00ec4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ecb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ed0 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ed8 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00ee0 666690                         nop        
00ee3 e8f870b6ff                     call       0x7fa87b9d7d60
00ee8 0f1f8400e00f0006               nop        dword ptr [rax + rax + 0x6000fe0]
00ef0 bee4ffffff                     mov        esi, 0xffffffe4
00ef5 48894424f8                     mov        qword ptr [rsp - 8], rax
00efa 8b442408                       mov        eax, dword ptr [rsp + 8]
00efe 890424                         mov        dword ptr [rsp], eax
00f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f06 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00f0f 89442404                       mov        dword ptr [rsp + 4], eax
00f13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f18 48ff742410                     push       qword ptr [rsp + 0x10]
00f1d 488f442408                     pop        qword ptr [rsp + 8]
00f22 48ff742418                     push       qword ptr [rsp + 0x18]
00f27 488f442410                     pop        qword ptr [rsp + 0x10]
00f2c 48894424f8                     mov        qword ptr [rsp - 8], rax
00f31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00f35 89442418                       mov        dword ptr [rsp + 0x18], eax
00f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00f47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f50 48894424f8                     mov        qword ptr [rsp - 8], rax
00f55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f59 89442420                       mov        dword ptr [rsp + 0x20], eax
00f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f62 48894424f8                     mov        qword ptr [rsp - 8], rax
00f67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f6b 89442424                       mov        dword ptr [rsp + 0x24], eax
00f6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f79 48ff742440                     push       qword ptr [rsp + 0x40]
00f7e 488f442430                     pop        qword ptr [rsp + 0x30]
00f83 48894424f8                     mov        qword ptr [rsp - 8], rax
00f88 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00f8c 89442438                       mov        dword ptr [rsp + 0x38], eax
00f90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f95 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00f9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00fa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa7 48ff742450                     push       qword ptr [rsp + 0x50]
00fac 488f442440                     pop        qword ptr [rsp + 0x40]
00fb1 48ff742458                     push       qword ptr [rsp + 0x58]
00fb6 488f442448                     pop        qword ptr [rsp + 0x48]
00fbb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00fc3 488f442450                     pop        qword ptr [rsp + 0x50]
00fc8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00fd4 89442458                       mov        dword ptr [rsp + 0x58], eax
00fd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fdd 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe2 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00fe9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00fed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff7 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00ffe 89442460                       mov        dword ptr [rsp + 0x60], eax
01002 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01007 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
0100c 48894424f8                     mov        qword ptr [rsp - 8], rax
01011 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01018 89442464                       mov        dword ptr [rsp + 0x64], eax
0101c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01021 48894424f8                     mov        qword ptr [rsp - 8], rax
01026 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0102d 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01034 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01039 48894424f8                     mov        qword ptr [rsp - 8], rax
0103e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01045 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0104c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01051 48894424f8                     mov        qword ptr [rsp - 8], rax
01056 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0105d 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01064 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01069 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01071 488f842490000000               pop        qword ptr [rsp + 0x90]
01079 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01081 488f842498000000               pop        qword ptr [rsp + 0x98]
01089 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01091 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01099 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
010a1 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
010a9 6690                           nop        
010ab e8306fb6ff                     call       0x7fa87b9d7d60
010b0 0f1f8400a8110007               nop        dword ptr [rax + rax + 0x70011a8]
010b8 33c9                           xor        ecx, ecx
010ba 4c3bc9                         cmp        r9, rcx
010bd bdffffffff                     mov        ebp, 0xffffffff
010c2 7c08                           jl         0x7fa87be70e4c
010c4 400f95c5                       setne      bpl
010c8 400fb6ed                       movzx      ebp, bpl
010cc be45ffffff                     mov        esi, 0xffffff45
010d1 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
010d6 48ff742440                     push       qword ptr [rsp + 0x40]
010db 488f442438                     pop        qword ptr [rsp + 0x38]
010e0 48894424f8                     mov        qword ptr [rsp - 8], rax
010e5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
010e9 89442440                       mov        dword ptr [rsp + 0x40], eax
010ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f2 48894424f8                     mov        qword ptr [rsp - 8], rax
010f7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
010fb 89442444                       mov        dword ptr [rsp + 0x44], eax
010ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01104 48ff742450                     push       qword ptr [rsp + 0x50]
01109 488f442448                     pop        qword ptr [rsp + 0x48]
0110e 48ff742458                     push       qword ptr [rsp + 0x58]
01113 488f442450                     pop        qword ptr [rsp + 0x50]
01118 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01120 488f442458                     pop        qword ptr [rsp + 0x58]
01125 48894424f8                     mov        qword ptr [rsp - 8], rax
0112a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01131 89442460                       mov        dword ptr [rsp + 0x60], eax
01135 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0113a 48894424f8                     mov        qword ptr [rsp - 8], rax
0113f 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01146 89442464                       mov        dword ptr [rsp + 0x64], eax
0114a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0114f 48894424f8                     mov        qword ptr [rsp - 8], rax
01154 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0115b 89442468                       mov        dword ptr [rsp + 0x68], eax
0115f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01164 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
0116c 48894424f8                     mov        qword ptr [rsp - 8], rax
01171 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01178 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0117c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01181 48894424f8                     mov        qword ptr [rsp - 8], rax
01186 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0118d 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01194 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01199 48894424f8                     mov        qword ptr [rsp - 8], rax
0119e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
011a5 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
011ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b1 48894424f8                     mov        qword ptr [rsp - 8], rax
011b6 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
011bd 89842490000000                 mov        dword ptr [rsp + 0x90], eax
011c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c9 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
011d1 488f842498000000               pop        qword ptr [rsp + 0x98]
011d9 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
011e1 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
011e9 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
011f1 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
011f9 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01201 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01209 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01211 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01219 6690                           nop        
0121b e8c06db6ff                     call       0x7fa87b9d7d60
01220 0f1f840018130008               nop        dword ptr [rax + rax + 0x8001318]
01228 be45ffffff                     mov        esi, 0xffffff45
0122d 48894424f8                     mov        qword ptr [rsp - 8], rax
01232 8b442408                       mov        eax, dword ptr [rsp + 8]
01236 890424                         mov        dword ptr [rsp], eax
01239 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123e 48894424f8                     mov        qword ptr [rsp - 8], rax
01243 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01247 89442404                       mov        dword ptr [rsp + 4], eax
0124b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01250 48ff742410                     push       qword ptr [rsp + 0x10]
01255 488f442408                     pop        qword ptr [rsp + 8]
0125a 48ff742418                     push       qword ptr [rsp + 0x18]
0125f 488f442410                     pop        qword ptr [rsp + 0x10]
01264 48894424f8                     mov        qword ptr [rsp - 8], rax
01269 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0126d 89442418                       mov        dword ptr [rsp + 0x18], eax
01271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01276 48894424f8                     mov        qword ptr [rsp - 8], rax
0127b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0127f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01283 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01288 48894424f8                     mov        qword ptr [rsp - 8], rax
0128d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01291 89442420                       mov        dword ptr [rsp + 0x20], eax
01295 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129a 48894424f8                     mov        qword ptr [rsp - 8], rax
0129f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
012a3 89442424                       mov        dword ptr [rsp + 0x24], eax
012a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
012b1 48ff742440                     push       qword ptr [rsp + 0x40]
012b6 488f442430                     pop        qword ptr [rsp + 0x30]
012bb 48894424f8                     mov        qword ptr [rsp - 8], rax
012c0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
012c4 89442438                       mov        dword ptr [rsp + 0x38], eax
012c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cd 48894424f8                     mov        qword ptr [rsp - 8], rax
012d2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012d6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
012da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012df 48ff742450                     push       qword ptr [rsp + 0x50]
012e4 488f442440                     pop        qword ptr [rsp + 0x40]
012e9 48ff742458                     push       qword ptr [rsp + 0x58]
012ee 488f442448                     pop        qword ptr [rsp + 0x48]
012f3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
012fb 488f442450                     pop        qword ptr [rsp + 0x50]
01300 48894424f8                     mov        qword ptr [rsp - 8], rax
01305 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0130c 89442458                       mov        dword ptr [rsp + 0x58], eax
01310 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01315 48894424f8                     mov        qword ptr [rsp - 8], rax
0131a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01321 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01325 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132a 48894424f8                     mov        qword ptr [rsp - 8], rax
0132f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01336 89442460                       mov        dword ptr [rsp + 0x60], eax
0133a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01347 488f442468                     pop        qword ptr [rsp + 0x68]
0134c 48ffb42498000000               push       qword ptr [rsp + 0x98]
01354 488f442478                     pop        qword ptr [rsp + 0x78]
01359 48894424f8                     mov        qword ptr [rsp - 8], rax
0135e 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01365 89442464                       mov        dword ptr [rsp + 0x64], eax
01369 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136e 48894424f8                     mov        qword ptr [rsp - 8], rax
01373 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0137a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01381 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01386 48894424f8                     mov        qword ptr [rsp - 8], rax
0138b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01392 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01399 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139e 48894424f8                     mov        qword ptr [rsp - 8], rax
013a3 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
013aa 89842488000000                 mov        dword ptr [rsp + 0x88], eax
013b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b6 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
013be 488f842490000000               pop        qword ptr [rsp + 0x90]
013c6 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013ce 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
013d6 90                             nop        
013d7 e8046cb6ff                     call       0x7fa87b9d7d60
013dc 0f1f8400d4140009               nop        dword ptr [rax + rax + 0x90014d4]
013e4 be45ffffff                     mov        esi, 0xffffff45
013e9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ee 8b442408                       mov        eax, dword ptr [rsp + 8]
013f2 890424                         mov        dword ptr [rsp], eax
013f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fa 48894424f8                     mov        qword ptr [rsp - 8], rax
013ff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01403 89442404                       mov        dword ptr [rsp + 4], eax
01407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140c 48ff742410                     push       qword ptr [rsp + 0x10]
01411 488f442408                     pop        qword ptr [rsp + 8]
01416 48ff742418                     push       qword ptr [rsp + 0x18]
0141b 488f442410                     pop        qword ptr [rsp + 0x10]
01420 48894424f8                     mov        qword ptr [rsp - 8], rax
01425 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01429 89442418                       mov        dword ptr [rsp + 0x18], eax
0142d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01432 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01437 e8a46bb6ff                     call       0x7fa87b9d7d60
0143c 0f1f84003415000a               nop        dword ptr [rax + rax + 0xa001534]
01444 be45ffffff                     mov        esi, 0xffffff45
01449 48894424f8                     mov        qword ptr [rsp - 8], rax
0144e 8b442408                       mov        eax, dword ptr [rsp + 8]
01452 890424                         mov        dword ptr [rsp], eax
01455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145a 48894424f8                     mov        qword ptr [rsp - 8], rax
0145f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01463 89442404                       mov        dword ptr [rsp + 4], eax
01467 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146c 48ff742410                     push       qword ptr [rsp + 0x10]
01471 488f442408                     pop        qword ptr [rsp + 8]
01476 48ff742418                     push       qword ptr [rsp + 0x18]
0147b 488f442410                     pop        qword ptr [rsp + 0x10]
01480 48894424f8                     mov        qword ptr [rsp - 8], rax
01485 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01489 89442418                       mov        dword ptr [rsp + 0x18], eax
0148d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01492 48894424f8                     mov        qword ptr [rsp - 8], rax
01497 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0149b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0149f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a4 48894424f8                     mov        qword ptr [rsp - 8], rax
014a9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014ad 89442420                       mov        dword ptr [rsp + 0x20], eax
014b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b6 48894424f8                     mov        qword ptr [rsp - 8], rax
014bb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
014bf 89442424                       mov        dword ptr [rsp + 0x24], eax
014c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
014cd 48ff742440                     push       qword ptr [rsp + 0x40]
014d2 488f442430                     pop        qword ptr [rsp + 0x30]
014d7 48894424f8                     mov        qword ptr [rsp - 8], rax
014dc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014e0 89442438                       mov        dword ptr [rsp + 0x38], eax
014e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ee 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
014f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fb 48ff742450                     push       qword ptr [rsp + 0x50]
01500 488f442440                     pop        qword ptr [rsp + 0x40]
01505 48ff742458                     push       qword ptr [rsp + 0x58]
0150a 488f442448                     pop        qword ptr [rsp + 0x48]
0150f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01517 488f442450                     pop        qword ptr [rsp + 0x50]
0151c 48894424f8                     mov        qword ptr [rsp - 8], rax
01521 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01528 89442458                       mov        dword ptr [rsp + 0x58], eax
0152c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01531 48894424f8                     mov        qword ptr [rsp - 8], rax
01536 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0153d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01546 48894424f8                     mov        qword ptr [rsp - 8], rax
0154b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01552 89442460                       mov        dword ptr [rsp + 0x60], eax
01556 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01563 488f442468                     pop        qword ptr [rsp + 0x68]
01568 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01570 488f442470                     pop        qword ptr [rsp + 0x70]
01575 48ffb42498000000               push       qword ptr [rsp + 0x98]
0157d 488f442478                     pop        qword ptr [rsp + 0x78]
01582 48894424f8                     mov        qword ptr [rsp - 8], rax
01587 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0158e 89442464                       mov        dword ptr [rsp + 0x64], eax
01592 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01597 48894424f8                     mov        qword ptr [rsp - 8], rax
0159c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
015a3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
015aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015af 48894424f8                     mov        qword ptr [rsp - 8], rax
015b4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
015bb 89842484000000                 mov        dword ptr [rsp + 0x84], eax
015c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c7 48894424f8                     mov        qword ptr [rsp - 8], rax
015cc 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
015d3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
015e7 488f842490000000               pop        qword ptr [rsp + 0x90]
015ef 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015f7 488f842498000000               pop        qword ptr [rsp + 0x98]
015ff e8dc69b6ff                     call       0x7fa87b9d7d60
01604 0f1f8400fc16000b               nop        dword ptr [rax + rax + 0xb0016fc]
0160c be45ffffff                     mov        esi, 0xffffff45
01611 48894424f8                     mov        qword ptr [rsp - 8], rax
01616 8b442408                       mov        eax, dword ptr [rsp + 8]
0161a 890424                         mov        dword ptr [rsp], eax
0161d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0162b 89442404                       mov        dword ptr [rsp + 4], eax
0162f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01634 48ff742410                     push       qword ptr [rsp + 0x10]
01639 488f442408                     pop        qword ptr [rsp + 8]
0163e 48ff742418                     push       qword ptr [rsp + 0x18]
01643 488f442410                     pop        qword ptr [rsp + 0x10]
01648 48894424f8                     mov        qword ptr [rsp - 8], rax
0164d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01651 89442418                       mov        dword ptr [rsp + 0x18], eax
01655 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165a 48894424f8                     mov        qword ptr [rsp - 8], rax
0165f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01663 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01667 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166c 48894424f8                     mov        qword ptr [rsp - 8], rax
01671 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01675 89442420                       mov        dword ptr [rsp + 0x20], eax
01679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167e 48894424f8                     mov        qword ptr [rsp - 8], rax
01683 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01687 89442424                       mov        dword ptr [rsp + 0x24], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01695 48ff742440                     push       qword ptr [rsp + 0x40]
0169a 488f442430                     pop        qword ptr [rsp + 0x30]
0169f 48894424f8                     mov        qword ptr [rsp - 8], rax
016a4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016a8 89442438                       mov        dword ptr [rsp + 0x38], eax
016ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b1 48894424f8                     mov        qword ptr [rsp - 8], rax
016b6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
016ba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c3 48ff742450                     push       qword ptr [rsp + 0x50]
016c8 488f442440                     pop        qword ptr [rsp + 0x40]
016cd 48ff742458                     push       qword ptr [rsp + 0x58]
016d2 488f442448                     pop        qword ptr [rsp + 0x48]
016d7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
016df 488f442450                     pop        qword ptr [rsp + 0x50]
016e4 48894424f8                     mov        qword ptr [rsp - 8], rax
016e9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
016f0 89442458                       mov        dword ptr [rsp + 0x58], eax
016f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f9 48894424f8                     mov        qword ptr [rsp - 8], rax
016fe 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01705 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01709 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170e 48894424f8                     mov        qword ptr [rsp - 8], rax
01713 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0171a 89442460                       mov        dword ptr [rsp + 0x60], eax
0171e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01723 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0172b 488f442468                     pop        qword ptr [rsp + 0x68]
01730 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01738 488f442470                     pop        qword ptr [rsp + 0x70]
0173d 48ffb42498000000               push       qword ptr [rsp + 0x98]
01745 488f442478                     pop        qword ptr [rsp + 0x78]
0174a 48894424f8                     mov        qword ptr [rsp - 8], rax
0174f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01756 89442464                       mov        dword ptr [rsp + 0x64], eax
0175a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175f 48894424f8                     mov        qword ptr [rsp - 8], rax
01764 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0176b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01772 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01777 48894424f8                     mov        qword ptr [rsp - 8], rax
0177c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01783 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0178a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178f 48894424f8                     mov        qword ptr [rsp - 8], rax
01794 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0179b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
017a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a7 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
017af 488f842490000000               pop        qword ptr [rsp + 0x90]
017b7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
017bf 488f842498000000               pop        qword ptr [rsp + 0x98]
017c7 48894424f8                     mov        qword ptr [rsp - 8], rax
017cc 8b8424f4000000                 mov        eax, dword ptr [rsp + 0xf4]
017d3 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017df 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017e7 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017ef e8ec67b6ff                     call       0x7fa87b9d7d60
017f4 0f1f8400ec18000c               nop        dword ptr [rax + rax + 0xc0018ec]
017fc be45ffffff                     mov        esi, 0xffffff45
01801 48894424f8                     mov        qword ptr [rsp - 8], rax
01806 8b442408                       mov        eax, dword ptr [rsp + 8]
0180a 890424                         mov        dword ptr [rsp], eax
0180d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01812 48894424f8                     mov        qword ptr [rsp - 8], rax
01817 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0181b 89442404                       mov        dword ptr [rsp + 4], eax
0181f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01824 48ff742410                     push       qword ptr [rsp + 0x10]
01829 488f442408                     pop        qword ptr [rsp + 8]
0182e 48ff742418                     push       qword ptr [rsp + 0x18]
01833 488f442410                     pop        qword ptr [rsp + 0x10]
01838 48894424f8                     mov        qword ptr [rsp - 8], rax
0183d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01841 89442418                       mov        dword ptr [rsp + 0x18], eax
01845 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184a 48894424f8                     mov        qword ptr [rsp - 8], rax
0184f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01853 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01865 89442420                       mov        dword ptr [rsp + 0x20], eax
01869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186e 48894424f8                     mov        qword ptr [rsp - 8], rax
01873 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01877 89442424                       mov        dword ptr [rsp + 0x24], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01885 48ff742440                     push       qword ptr [rsp + 0x40]
0188a 488f442430                     pop        qword ptr [rsp + 0x30]
0188f 48894424f8                     mov        qword ptr [rsp - 8], rax
01894 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01898 89442438                       mov        dword ptr [rsp + 0x38], eax
0189c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a1 48894424f8                     mov        qword ptr [rsp - 8], rax
018a6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018aa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b3 48ff742450                     push       qword ptr [rsp + 0x50]
018b8 488f442440                     pop        qword ptr [rsp + 0x40]
018bd 48ff742458                     push       qword ptr [rsp + 0x58]
018c2 488f442448                     pop        qword ptr [rsp + 0x48]
018c7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
018cf 488f442450                     pop        qword ptr [rsp + 0x50]
018d4 48894424f8                     mov        qword ptr [rsp - 8], rax
018d9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
018e0 89442458                       mov        dword ptr [rsp + 0x58], eax
018e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ee 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
018f5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01903 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0190a 89442460                       mov        dword ptr [rsp + 0x60], eax
0190e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01913 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0191b 488f442468                     pop        qword ptr [rsp + 0x68]
01920 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01928 488f442470                     pop        qword ptr [rsp + 0x70]
0192d 48ffb42498000000               push       qword ptr [rsp + 0x98]
01935 488f442478                     pop        qword ptr [rsp + 0x78]
0193a 48894424f8                     mov        qword ptr [rsp - 8], rax
0193f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01946 89442464                       mov        dword ptr [rsp + 0x64], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 48894424f8                     mov        qword ptr [rsp - 8], rax
01954 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0195b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01962 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01967 48894424f8                     mov        qword ptr [rsp - 8], rax
0196c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01973 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0197a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197f 48894424f8                     mov        qword ptr [rsp - 8], rax
01984 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0198b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01992 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01997 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0199f 488f842490000000               pop        qword ptr [rsp + 0x90]
019a7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019af 488f842498000000               pop        qword ptr [rsp + 0x98]
019b7 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019bf 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019c6 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019ce 90                             nop        
019cf e80c66b6ff                     call       0x7fa87b9d7d60
019d4 0f1f8400cc1a000d               nop        dword ptr [rax + rax + 0xd001acc]
019dc be45ffffff                     mov        esi, 0xffffff45
019e1 48894424f8                     mov        qword ptr [rsp - 8], rax
019e6 8b442408                       mov        eax, dword ptr [rsp + 8]
019ea 890424                         mov        dword ptr [rsp], eax
019ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f2 48894424f8                     mov        qword ptr [rsp - 8], rax
019f7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
019fb 89442404                       mov        dword ptr [rsp + 4], eax
019ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a04 48ff742410                     push       qword ptr [rsp + 0x10]
01a09 488f442408                     pop        qword ptr [rsp + 8]
01a0e 48ff742418                     push       qword ptr [rsp + 0x18]
01a13 488f442410                     pop        qword ptr [rsp + 0x10]
01a18 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a21 89442418                       mov        dword ptr [rsp + 0x18], eax
01a25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a33 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a41 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a45 89442420                       mov        dword ptr [rsp + 0x20], eax
01a49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a53 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a57 89442424                       mov        dword ptr [rsp + 0x24], eax
01a5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a60 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a65 48ff742440                     push       qword ptr [rsp + 0x40]
01a6a 488f442430                     pop        qword ptr [rsp + 0x30]
01a6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a74 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a78 89442438                       mov        dword ptr [rsp + 0x38], eax
01a7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a81 48894424f8                     mov        qword ptr [rsp - 8], rax
01a86 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01a8a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48ff742450                     push       qword ptr [rsp + 0x50]
01a98 488f442440                     pop        qword ptr [rsp + 0x40]
01a9d 48ff742458                     push       qword ptr [rsp + 0x58]
01aa2 488f442448                     pop        qword ptr [rsp + 0x48]
01aa7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01aaf 488f442450                     pop        qword ptr [rsp + 0x50]
01ab4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ac0 89442458                       mov        dword ptr [rsp + 0x58], eax
01ac4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ace 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01ad5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ad9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ade 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae3 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01aea 89442460                       mov        dword ptr [rsp + 0x60], eax
01aee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af3 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01afb 488f442468                     pop        qword ptr [rsp + 0x68]
01b00 48ffb42498000000               push       qword ptr [rsp + 0x98]
01b08 488f442478                     pop        qword ptr [rsp + 0x78]
01b0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b12 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01b19 89442464                       mov        dword ptr [rsp + 0x64], eax
01b1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b22 48894424f8                     mov        qword ptr [rsp - 8], rax
01b27 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b2e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b46 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b52 48894424f8                     mov        qword ptr [rsp - 8], rax
01b57 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b5e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6a 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01b72 488f842490000000               pop        qword ptr [rsp + 0x90]
01b7a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b82 488f842498000000               pop        qword ptr [rsp + 0x98]
01b8a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01b92 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01b99 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01ba0 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01ba8 666690                         nop        
01bab e83064b6ff                     call       0x7fa87b9d7d60
01bb0 0f1f8400a81c000e               nop        dword ptr [rax + rax + 0xe001ca8]
01bb8 be45ffffff                     mov        esi, 0xffffff45
01bbd b9ffffff7f                     mov        ecx, 0x7fffffff
01bc2 4c3bc9                         cmp        r9, rcx
01bc5 bdffffffff                     mov        ebp, 0xffffffff
01bca 7c08                           jl         0x7fa87be71954
01bcc 400f95c5                       setne      bpl
01bd0 400fb6ed                       movzx      ebp, bpl
01bd4 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01bd9 48ff742440                     push       qword ptr [rsp + 0x40]
01bde 488f442438                     pop        qword ptr [rsp + 0x38]
01be3 48894424f8                     mov        qword ptr [rsp - 8], rax
01be8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01bec 89442440                       mov        dword ptr [rsp + 0x40], eax
01bf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01bfe 89442444                       mov        dword ptr [rsp + 0x44], eax
01c02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c07 48ff742450                     push       qword ptr [rsp + 0x50]
01c0c 488f442448                     pop        qword ptr [rsp + 0x48]
01c11 48ff742458                     push       qword ptr [rsp + 0x58]
01c16 488f442450                     pop        qword ptr [rsp + 0x50]
01c1b 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01c23 488f442458                     pop        qword ptr [rsp + 0x58]
01c28 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c34 89442460                       mov        dword ptr [rsp + 0x60], eax
01c38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c42 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01c49 89442464                       mov        dword ptr [rsp + 0x64], eax
01c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c52 48894424f8                     mov        qword ptr [rsp - 8], rax
01c57 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01c5e 89442468                       mov        dword ptr [rsp + 0x68], eax
01c62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c67 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c74 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01c7b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c84 48894424f8                     mov        qword ptr [rsp - 8], rax
01c89 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c90 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca1 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ca8 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01caf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb9 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01cc0 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccc 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01cd4 488f842498000000               pop        qword ptr [rsp + 0x98]
01cdc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ce4 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cec 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cf4 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01cfc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d04 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01d0c 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01d14 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d1c 666690                         nop        
01d1f e8bc62b6ff                     call       0x7fa87b9d7d60
01d24 0f1f84001c1e000f               nop        dword ptr [rax + rax + 0xf001e1c]
01d2c be45ffffff                     mov        esi, 0xffffff45
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b442408                       mov        eax, dword ptr [rsp + 8]
01d3a 890424                         mov        dword ptr [rsp], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d4b 89442404                       mov        dword ptr [rsp + 4], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 48ff742410                     push       qword ptr [rsp + 0x10]
01d59 488f442408                     pop        qword ptr [rsp + 8]
01d5e 48ff742418                     push       qword ptr [rsp + 0x18]
01d63 488f442410                     pop        qword ptr [rsp + 0x10]
01d68 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d71 89442418                       mov        dword ptr [rsp + 0x18], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d83 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d91 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d95 89442420                       mov        dword ptr [rsp + 0x20], eax
01d99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01da3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01da7 89442424                       mov        dword ptr [rsp + 0x24], eax
01dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01db5 48ff742440                     push       qword ptr [rsp + 0x40]
01dba 488f442430                     pop        qword ptr [rsp + 0x30]
01dbf 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01dc8 89442438                       mov        dword ptr [rsp + 0x38], eax
01dcc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01dda 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de3 48ff742450                     push       qword ptr [rsp + 0x50]
01de8 488f442440                     pop        qword ptr [rsp + 0x40]
01ded 48ff742458                     push       qword ptr [rsp + 0x58]
01df2 488f442448                     pop        qword ptr [rsp + 0x48]
01df7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01dff 488f442450                     pop        qword ptr [rsp + 0x50]
01e04 48894424f8                     mov        qword ptr [rsp - 8], rax
01e09 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01e10 89442458                       mov        dword ptr [rsp + 0x58], eax
01e14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e19 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01e25 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e33 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01e3a 89442460                       mov        dword ptr [rsp + 0x60], eax
01e3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e43 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e48 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01e54 89442464                       mov        dword ptr [rsp + 0x64], eax
01e58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e62 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e69 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e75 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e81 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e92 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01e99 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ea0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea5 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01ead 488f842490000000               pop        qword ptr [rsp + 0x90]
01eb5 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ebd 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01ec5 6690                           nop        
01ec7 e81461b6ff                     call       0x7fa87b9d7d60
01ecc 0f1f8400c41f0010               nop        dword ptr [rax + rax + 0x10001fc4]
01ed4 be45ffffff                     mov        esi, 0xffffff45
01ed9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ede 8b442408                       mov        eax, dword ptr [rsp + 8]
01ee2 890424                         mov        dword ptr [rsp], eax
01ee5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eea 48894424f8                     mov        qword ptr [rsp - 8], rax
01eef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01ef3 89442404                       mov        dword ptr [rsp + 4], eax
01ef7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01efc 48ff742410                     push       qword ptr [rsp + 0x10]
01f01 488f442408                     pop        qword ptr [rsp + 8]
01f06 48ff742418                     push       qword ptr [rsp + 0x18]
01f0b 488f442410                     pop        qword ptr [rsp + 0x10]
01f10 48894424f8                     mov        qword ptr [rsp - 8], rax
01f15 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f19 89442418                       mov        dword ptr [rsp + 0x18], eax
01f1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f22 48894424f8                     mov        qword ptr [rsp - 8], rax
01f27 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f2b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f34 48894424f8                     mov        qword ptr [rsp - 8], rax
01f39 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f3d 89442420                       mov        dword ptr [rsp + 0x20], eax
01f41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f46 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f4f 89442424                       mov        dword ptr [rsp + 0x24], eax
01f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f58 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f5d 48ff742440                     push       qword ptr [rsp + 0x40]
01f62 488f442430                     pop        qword ptr [rsp + 0x30]
01f67 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f70 89442438                       mov        dword ptr [rsp + 0x38], eax
01f74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f79 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01f82 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8b 48ff742450                     push       qword ptr [rsp + 0x50]
01f90 488f442440                     pop        qword ptr [rsp + 0x40]
01f95 48ff742458                     push       qword ptr [rsp + 0x58]
01f9a 488f442448                     pop        qword ptr [rsp + 0x48]
01f9f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01fa7 488f442450                     pop        qword ptr [rsp + 0x50]
01fac 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01fb8 89442458                       mov        dword ptr [rsp + 0x58], eax
01fbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01fcd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd6 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdb 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01fe2 89442460                       mov        dword ptr [rsp + 0x60], eax
01fe6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01feb 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ff0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01ffc 89442464                       mov        dword ptr [rsp + 0x64], eax
02000 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02005 48894424f8                     mov        qword ptr [rsp - 8], rax
0200a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02011 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02018 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201d 48894424f8                     mov        qword ptr [rsp - 8], rax
02022 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02029 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02030 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02035 48894424f8                     mov        qword ptr [rsp - 8], rax
0203a 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02041 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02048 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204d 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02055 488f842490000000               pop        qword ptr [rsp + 0x90]
0205d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02065 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
0206d 6690                           nop        
0206f e86c5fb6ff                     call       0x7fa87b9d7d60
02074 0f1f84006c210011               nop        dword ptr [rax + rax + 0x1100216c]
0207c be3dffffff                     mov        esi, 0xffffff3d
02081 48894424f8                     mov        qword ptr [rsp - 8], rax
02086 8b442408                       mov        eax, dword ptr [rsp + 8]
0208a 890424                         mov        dword ptr [rsp], eax
0208d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02092 48894424f8                     mov        qword ptr [rsp - 8], rax
02097 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0209b 89442404                       mov        dword ptr [rsp + 4], eax
0209f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a4 48ff742410                     push       qword ptr [rsp + 0x10]
020a9 488f442408                     pop        qword ptr [rsp + 8]
020ae 48ff742418                     push       qword ptr [rsp + 0x18]
020b3 488f442410                     pop        qword ptr [rsp + 0x10]
020b8 48894424f8                     mov        qword ptr [rsp - 8], rax
020bd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020c1 89442418                       mov        dword ptr [rsp + 0x18], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48894424f8                     mov        qword ptr [rsp - 8], rax
020cf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020d3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020dc 48894424f8                     mov        qword ptr [rsp - 8], rax
020e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e5 89442420                       mov        dword ptr [rsp + 0x20], eax
020e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ee 48894424f8                     mov        qword ptr [rsp - 8], rax
020f3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
020f7 89442424                       mov        dword ptr [rsp + 0x24], eax
020fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02100 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02105 48ff742440                     push       qword ptr [rsp + 0x40]
0210a 488f442430                     pop        qword ptr [rsp + 0x30]
0210f 48894424f8                     mov        qword ptr [rsp - 8], rax
02114 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02118 89442438                       mov        dword ptr [rsp + 0x38], eax
0211c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02121 48894424f8                     mov        qword ptr [rsp - 8], rax
02126 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0212a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0212e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02133 48ff742450                     push       qword ptr [rsp + 0x50]
02138 488f442440                     pop        qword ptr [rsp + 0x40]
0213d 48ff742458                     push       qword ptr [rsp + 0x58]
02142 488f442448                     pop        qword ptr [rsp + 0x48]
02147 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0214f 488f442450                     pop        qword ptr [rsp + 0x50]
02154 48894424f8                     mov        qword ptr [rsp - 8], rax
02159 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02160 89442458                       mov        dword ptr [rsp + 0x58], eax
02164 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02169 48894424f8                     mov        qword ptr [rsp - 8], rax
0216e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02175 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02179 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217e 48894424f8                     mov        qword ptr [rsp - 8], rax
02183 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0218a 89442460                       mov        dword ptr [rsp + 0x60], eax
0218e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02193 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02198 48894424f8                     mov        qword ptr [rsp - 8], rax
0219d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
021a4 89442464                       mov        dword ptr [rsp + 0x64], eax
021a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ad 48894424f8                     mov        qword ptr [rsp - 8], rax
021b2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021b9 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c5 48894424f8                     mov        qword ptr [rsp - 8], rax
021ca 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021d1 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021dd 48894424f8                     mov        qword ptr [rsp - 8], rax
021e2 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
021e9 89842488000000                 mov        dword ptr [rsp + 0x88], eax
021f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f5 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
021fd 488f842490000000               pop        qword ptr [rsp + 0x90]
02205 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0220d 488f842498000000               pop        qword ptr [rsp + 0x98]
02215 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0221d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02225 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0222d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02235 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0223d 48894424f8                     mov        qword ptr [rsp - 8], rax
02242 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02249 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02250 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02255 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0225d 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02265 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
0226d 6690                           nop        
0226f e86c5db6ff                     call       0x7fa87b9d7d60
02274 0f1f84006c230012               nop        dword ptr [rax + rax + 0x1200236c]
0227c be45ffffff                     mov        esi, 0xffffff45
02281 48894424f8                     mov        qword ptr [rsp - 8], rax
02286 8b442408                       mov        eax, dword ptr [rsp + 8]
0228a 890424                         mov        dword ptr [rsp], eax
0228d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02292 48894424f8                     mov        qword ptr [rsp - 8], rax
02297 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0229b 89442404                       mov        dword ptr [rsp + 4], eax
0229f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a4 48ff742410                     push       qword ptr [rsp + 0x10]
022a9 488f442408                     pop        qword ptr [rsp + 8]
022ae 48ff742418                     push       qword ptr [rsp + 0x18]
022b3 488f442410                     pop        qword ptr [rsp + 0x10]
022b8 48894424f8                     mov        qword ptr [rsp - 8], rax
022bd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022c1 89442418                       mov        dword ptr [rsp + 0x18], eax
022c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ca 48894424f8                     mov        qword ptr [rsp - 8], rax
022cf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022d3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022e5 89442420                       mov        dword ptr [rsp + 0x20], eax
022e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ee 48894424f8                     mov        qword ptr [rsp - 8], rax
022f3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022f7 89442424                       mov        dword ptr [rsp + 0x24], eax
022fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02300 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02305 48ff742440                     push       qword ptr [rsp + 0x40]
0230a 488f442430                     pop        qword ptr [rsp + 0x30]
0230f 48894424f8                     mov        qword ptr [rsp - 8], rax
02314 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02318 89442438                       mov        dword ptr [rsp + 0x38], eax
0231c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02321 48894424f8                     mov        qword ptr [rsp - 8], rax
02326 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0232a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0232e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02333 48ff742450                     push       qword ptr [rsp + 0x50]
02338 488f442440                     pop        qword ptr [rsp + 0x40]
0233d 48ff742458                     push       qword ptr [rsp + 0x58]
02342 488f442448                     pop        qword ptr [rsp + 0x48]
02347 48894424f8                     mov        qword ptr [rsp - 8], rax
0234c 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02353 89442458                       mov        dword ptr [rsp + 0x58], eax
02357 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235c 48897c2470                     mov        qword ptr [rsp + 0x70], rdi
02361 48894424f8                     mov        qword ptr [rsp - 8], rax
02366 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0236d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02371 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02376 48894424f8                     mov        qword ptr [rsp - 8], rax
0237b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02382 89442478                       mov        dword ptr [rsp + 0x78], eax
02386 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02393 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0239b 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023a3 e8385cb6ff                     call       0x7fa87b9d7d60
023a8 0f1f8400a0240013               nop        dword ptr [rax + rax + 0x130024a0]
023b0 be45ffffff                     mov        esi, 0xffffff45
023b5 48894424f8                     mov        qword ptr [rsp - 8], rax
023ba 8b442408                       mov        eax, dword ptr [rsp + 8]
023be 890424                         mov        dword ptr [rsp], eax
023c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c6 48894424f8                     mov        qword ptr [rsp - 8], rax
023cb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023cf 89442404                       mov        dword ptr [rsp + 4], eax
023d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d8 48ff742410                     push       qword ptr [rsp + 0x10]
023dd 488f442408                     pop        qword ptr [rsp + 8]
023e2 48ff742418                     push       qword ptr [rsp + 0x18]
023e7 488f442410                     pop        qword ptr [rsp + 0x10]
023ec 48894424f8                     mov        qword ptr [rsp - 8], rax
023f1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023f5 89442418                       mov        dword ptr [rsp + 0x18], eax
023f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02403 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02407 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0240b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02410 48894424f8                     mov        qword ptr [rsp - 8], rax
02415 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02419 89442420                       mov        dword ptr [rsp + 0x20], eax
0241d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02422 48894424f8                     mov        qword ptr [rsp - 8], rax
02427 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0242b 89442424                       mov        dword ptr [rsp + 0x24], eax
0242f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02434 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02439 48ff742440                     push       qword ptr [rsp + 0x40]
0243e 488f442430                     pop        qword ptr [rsp + 0x30]
02443 48894424f8                     mov        qword ptr [rsp - 8], rax
02448 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0244c 89442438                       mov        dword ptr [rsp + 0x38], eax
02450 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02455 48894424f8                     mov        qword ptr [rsp - 8], rax
0245a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0245e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02462 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02467 48ff742450                     push       qword ptr [rsp + 0x50]
0246c 488f442440                     pop        qword ptr [rsp + 0x40]
02471 48ff742458                     push       qword ptr [rsp + 0x58]
02476 488f442448                     pop        qword ptr [rsp + 0x48]
0247b 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0247f 48894424f8                     mov        qword ptr [rsp - 8], rax
02484 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0248b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0248f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02494 48894424f8                     mov        qword ptr [rsp - 8], rax
02499 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
024a0 89442478                       mov        dword ptr [rsp + 0x78], eax
024a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a9 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024b1 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024b9 6690                           nop        
024bb e8205bb6ff                     call       0x7fa87b9d7d60
024c0 0f1f8400b8250014               nop        dword ptr [rax + rax + 0x140025b8]
024c8 be45ffffff                     mov        esi, 0xffffff45
024cd 48894424f8                     mov        qword ptr [rsp - 8], rax
024d2 8b442408                       mov        eax, dword ptr [rsp + 8]
024d6 890424                         mov        dword ptr [rsp], eax
024d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024de 48894424f8                     mov        qword ptr [rsp - 8], rax
024e3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024e7 89442404                       mov        dword ptr [rsp + 4], eax
024eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f0 48ff742410                     push       qword ptr [rsp + 0x10]
024f5 488f442408                     pop        qword ptr [rsp + 8]
024fa 48ff742418                     push       qword ptr [rsp + 0x18]
024ff 488f442410                     pop        qword ptr [rsp + 0x10]
02504 48894424f8                     mov        qword ptr [rsp - 8], rax
02509 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0250d 89442418                       mov        dword ptr [rsp + 0x18], eax
02511 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02516 48894424f8                     mov        qword ptr [rsp - 8], rax
0251b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0251f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02528 48894424f8                     mov        qword ptr [rsp - 8], rax
0252d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02531 89442420                       mov        dword ptr [rsp + 0x20], eax
02535 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253a 48894424f8                     mov        qword ptr [rsp - 8], rax
0253f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02543 89442424                       mov        dword ptr [rsp + 0x24], eax
02547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02551 48ff742440                     push       qword ptr [rsp + 0x40]
02556 488f442430                     pop        qword ptr [rsp + 0x30]
0255b 48894424f8                     mov        qword ptr [rsp - 8], rax
02560 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02564 89442438                       mov        dword ptr [rsp + 0x38], eax
02568 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256d 48894424f8                     mov        qword ptr [rsp - 8], rax
02572 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02576 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0257a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257f 48ff742450                     push       qword ptr [rsp + 0x50]
02584 488f442440                     pop        qword ptr [rsp + 0x40]
02589 48ff742458                     push       qword ptr [rsp + 0x58]
0258e 488f442448                     pop        qword ptr [rsp + 0x48]
02593 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0259b 488f442450                     pop        qword ptr [rsp + 0x50]
025a0 48894424f8                     mov        qword ptr [rsp - 8], rax
025a5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
025ac 89442458                       mov        dword ptr [rsp + 0x58], eax
025b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ba 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
025c1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ca 48894424f8                     mov        qword ptr [rsp - 8], rax
025cf 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
025d6 89442460                       mov        dword ptr [rsp + 0x60], eax
025da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025df 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025e7 488f442468                     pop        qword ptr [rsp + 0x68]
025ec 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025f4 488f442470                     pop        qword ptr [rsp + 0x70]
025f9 48ffb42498000000               push       qword ptr [rsp + 0x98]
02601 488f442478                     pop        qword ptr [rsp + 0x78]
02606 48894424f8                     mov        qword ptr [rsp - 8], rax
0260b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02612 89442464                       mov        dword ptr [rsp + 0x64], eax
02616 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261b 48894424f8                     mov        qword ptr [rsp - 8], rax
02620 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02627 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0262e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02633 48894424f8                     mov        qword ptr [rsp - 8], rax
02638 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0263f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02646 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264b 48894424f8                     mov        qword ptr [rsp - 8], rax
02650 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02657 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0265e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02663 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0266b 488f842490000000               pop        qword ptr [rsp + 0x90]
02673 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
0267b 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02683 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0268b e85059b6ff                     call       0x7fa87b9d7d60
02690 0f1f840088270015               nop        dword ptr [rax + rax + 0x15002788]
02698 be45ffffff                     mov        esi, 0xffffff45
0269d 48894424f8                     mov        qword ptr [rsp - 8], rax
026a2 8b442408                       mov        eax, dword ptr [rsp + 8]
026a6 890424                         mov        dword ptr [rsp], eax
026a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ae 48894424f8                     mov        qword ptr [rsp - 8], rax
026b3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026b7 89442404                       mov        dword ptr [rsp + 4], eax
026bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c0 48ff742410                     push       qword ptr [rsp + 0x10]
026c5 488f442408                     pop        qword ptr [rsp + 8]
026ca 48ff742418                     push       qword ptr [rsp + 0x18]
026cf 488f442410                     pop        qword ptr [rsp + 0x10]
026d4 48894424f8                     mov        qword ptr [rsp - 8], rax
026d9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026dd 89442418                       mov        dword ptr [rsp + 0x18], eax
026e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e6 48894424f8                     mov        qword ptr [rsp - 8], rax
026eb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026ef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
026f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f8 48894424f8                     mov        qword ptr [rsp - 8], rax
026fd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02701 89442420                       mov        dword ptr [rsp + 0x20], eax
02705 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270a 48894424f8                     mov        qword ptr [rsp - 8], rax
0270f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02713 89442424                       mov        dword ptr [rsp + 0x24], eax
02717 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271c 48ff742440                     push       qword ptr [rsp + 0x40]
02721 488f442430                     pop        qword ptr [rsp + 0x30]
02726 48894424f8                     mov        qword ptr [rsp - 8], rax
0272b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0272f 89442438                       mov        dword ptr [rsp + 0x38], eax
02733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02738 48894424f8                     mov        qword ptr [rsp - 8], rax
0273d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02741 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02745 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274a 48ff742450                     push       qword ptr [rsp + 0x50]
0274f 488f442440                     pop        qword ptr [rsp + 0x40]
02754 48ff742458                     push       qword ptr [rsp + 0x58]
02759 488f442448                     pop        qword ptr [rsp + 0x48]
0275e 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
02766 488f442450                     pop        qword ptr [rsp + 0x50]
0276b 48894424f8                     mov        qword ptr [rsp - 8], rax
02770 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02777 89442458                       mov        dword ptr [rsp + 0x58], eax
0277b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02780 48894424f8                     mov        qword ptr [rsp - 8], rax
02785 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0278c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02790 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02795 48894424f8                     mov        qword ptr [rsp - 8], rax
0279a 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
027a1 89442460                       mov        dword ptr [rsp + 0x60], eax
027a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027aa 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027b2 488f442468                     pop        qword ptr [rsp + 0x68]
027b7 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027bf 488f442470                     pop        qword ptr [rsp + 0x70]
027c4 48ffb42498000000               push       qword ptr [rsp + 0x98]
027cc 488f442478                     pop        qword ptr [rsp + 0x78]
027d1 48894424f8                     mov        qword ptr [rsp - 8], rax
027d6 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
027dd 89442464                       mov        dword ptr [rsp + 0x64], eax
027e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e6 48894424f8                     mov        qword ptr [rsp - 8], rax
027eb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
027f2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
027f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02803 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0280a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02816 48894424f8                     mov        qword ptr [rsp - 8], rax
0281b 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02822 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02829 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282e 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02836 488f842490000000               pop        qword ptr [rsp + 0x90]
0283e 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
02846 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0284e 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
02856 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0285e 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02866 90                             nop        
02867 e87457b6ff                     call       0x7fa87b9d7d60
0286c 0f1f840064290016               nop        dword ptr [rax + rax + 0x16002964]
02874 4533d2                         xor        r10d, r10d
02877 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
0287f e93ed9ffff                     jmp        0x7fa87be6ff42
02884 4533d2                         xor        r10d, r10d
02887 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0288c e957d9ffff                     jmp        0x7fa87be6ff68
02891 4533d2                         xor        r10d, r10d
02894 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02899 e972d9ffff                     jmp        0x7fa87be6ff90
0289e 4533d2                         xor        r10d, r10d
028a1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028a6 e992d9ffff                     jmp        0x7fa87be6ffbd
028ab 4533d2                         xor        r10d, r10d
028ae 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028b3 e9add9ffff                     jmp        0x7fa87be6ffe5
028b8 4533d2                         xor        r10d, r10d
028bb 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
028c3 e9cdd9ffff                     jmp        0x7fa87be70015
028c8 4533d2                         xor        r10d, r10d
028cb 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
028d3 e9ebd9ffff                     jmp        0x7fa87be70043
028d8 4533d2                         xor        r10d, r10d
028db 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
028e3 e90bdaffff                     jmp        0x7fa87be70073
028e8 bebeffffff                     mov        esi, 0xffffffbe
028ed 48894424f8                     mov        qword ptr [rsp - 8], rax
028f2 8b442408                       mov        eax, dword ptr [rsp + 8]
028f6 890424                         mov        dword ptr [rsp], eax
028f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02903 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02907 89442404                       mov        dword ptr [rsp + 4], eax
0290b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02910 48ff742410                     push       qword ptr [rsp + 0x10]
02915 488f442408                     pop        qword ptr [rsp + 8]
0291a 48ff742418                     push       qword ptr [rsp + 0x18]
0291f 488f442410                     pop        qword ptr [rsp + 0x10]
02924 48894424f8                     mov        qword ptr [rsp - 8], rax
02929 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0292d 89442418                       mov        dword ptr [rsp + 0x18], eax
02931 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02936 48894424f8                     mov        qword ptr [rsp - 8], rax
0293b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0293f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02948 48894424f8                     mov        qword ptr [rsp - 8], rax
0294d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02951 89442420                       mov        dword ptr [rsp + 0x20], eax
02955 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295a 48894424f8                     mov        qword ptr [rsp - 8], rax
0295f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02963 89442424                       mov        dword ptr [rsp + 0x24], eax
02967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02971 48ff742440                     push       qword ptr [rsp + 0x40]
02976 488f442430                     pop        qword ptr [rsp + 0x30]
0297b 48894424f8                     mov        qword ptr [rsp - 8], rax
02980 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02984 89442438                       mov        dword ptr [rsp + 0x38], eax
02988 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0298d 48894424f8                     mov        qword ptr [rsp - 8], rax
02992 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02996 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0299a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299f 48ff742450                     push       qword ptr [rsp + 0x50]
029a4 488f442440                     pop        qword ptr [rsp + 0x40]
029a9 48ff742458                     push       qword ptr [rsp + 0x58]
029ae 488f442448                     pop        qword ptr [rsp + 0x48]
029b3 48894424f8                     mov        qword ptr [rsp - 8], rax
029b8 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
029bf 89442458                       mov        dword ptr [rsp + 0x58], eax
029c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c8 48894424f8                     mov        qword ptr [rsp - 8], rax
029cd 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
029d4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029dd 6690                           nop        
029df e8fc55b6ff                     call       0x7fa87b9d7d60
029e4 0f1f8400dc2a0017               nop        dword ptr [rax + rax + 0x17002adc]
029ec be85ffffff                     mov        esi, 0xffffff85
029f1 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
029f5 48894424f8                     mov        qword ptr [rsp - 8], rax
029fa 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
029fe 890424                         mov        dword ptr [rsp], eax
02a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a06 48894424f8                     mov        qword ptr [rsp - 8], rax
02a0b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a0f 89442404                       mov        dword ptr [rsp + 4], eax
02a13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a18 48894424f8                     mov        qword ptr [rsp - 8], rax
02a1d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a21 89442408                       mov        dword ptr [rsp + 8], eax
02a25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a2a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a2f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a33 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a3c 48894424f8                     mov        qword ptr [rsp - 8], rax
02a41 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a45 89442410                       mov        dword ptr [rsp + 0x10], eax
02a49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4e 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a53 48ff742440                     push       qword ptr [rsp + 0x40]
02a58 488f442420                     pop        qword ptr [rsp + 0x20]
02a5d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a62 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02a66 89442414                       mov        dword ptr [rsp + 0x14], eax
02a6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6f 48894424f8                     mov        qword ptr [rsp - 8], rax
02a74 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02a78 89442428                       mov        dword ptr [rsp + 0x28], eax
02a7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a81 48894424f8                     mov        qword ptr [rsp - 8], rax
02a86 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02a8d 8944242c                       mov        dword ptr [rsp + 0x2c], eax
02a91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a96 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9b 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02aa2 89442430                       mov        dword ptr [rsp + 0x30], eax
02aa6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aab 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab0 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02ab7 89442434                       mov        dword ptr [rsp + 0x34], eax
02abb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac0 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02acc 89442448                       mov        dword ptr [rsp + 0x48], eax
02ad0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad5 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
02add 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
02ae5 6690                           nop        
02ae7 e8f454b6ff                     call       0x7fa87b9d7d60
02aec 0f1f8400e42b0018               nop        dword ptr [rax + rax + 0x18002be4]
02af4 bef6ffffff                     mov        esi, 0xfffffff6
02af9 6690                           nop        
02afb e8e054b6ff                     call       0x7fa87b9d7d60
02b00 0f1f8400f82b0019               nop        dword ptr [rax + rax + 0x19002bf8]
02b08 be5d000000                     mov        esi, 0x5d
02b0d 6690                           nop        
02b0f e8cc54b6ff                     call       0x7fa87b9d7d60
02b14 0f1f84000c2c001a               nop        dword ptr [rax + rax + 0x1a002c0c]
02b1c bef6ffffff                     mov        esi, 0xfffffff6
02b21 418beb                         mov        ebp, r11d
02b24 666690                         nop        
02b27 e8b454b6ff                     call       0x7fa87b9d7d60
02b2c 0f1f8400242c001b               nop        dword ptr [rax + rax + 0x1b002c24]
02b34 bef6ffffff                     mov        esi, 0xfffffff6
02b39 8be9                           mov        ebp, ecx
02b3b e8a054b6ff                     call       0x7fa87b9d7d60
02b40 0f1f8400382c001c               nop        dword ptr [rax + rax + 0x1c002c38]
02b48 bef6ffffff                     mov        esi, 0xfffffff6
02b4d 418beb                         mov        ebp, r11d
02b50 666690                         nop        
02b53 e88854b6ff                     call       0x7fa87b9d7d60
02b58 0f1f8400502c001d               nop        dword ptr [rax + rax + 0x1d002c50]
02b60 eb00                           jmp        0x7fa87be728e2
02b62 488bf0                         mov        rsi, rax
02b65 e922dfffff                     jmp        0x7fa87be7080c
02b6a 49ba3408e77ba87f0000           movabs     r10, 0x7fa87be70834
02b74 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02b7b e9e005aaff                     jmp        0x7fa87b912ee0
02b80 e89bd1a8ff                     call       0x7fa87b8ffaa0
02b85 e9a4d4ffff                     jmp        0x7fa87be6fdae
02b8a f4                             hlt        
02b8b f4                             hlt        
02b8c f4                             hlt        
02b8d f4                             hlt        
02b8e f4                             hlt        
02b8f f4                             hlt        
