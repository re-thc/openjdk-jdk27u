00000 e83ba69516                     call       0x7f1e967d5740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec20010000                 sub        rsp, 0x120
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85922b0000                   jne        0x7f1e7fe7dcc0
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
00096 448b96e0010000                 mov        r10d, dword ptr [rsi + 0x1e0]
0009d 4489542408                     mov        dword ptr [rsp + 8], r10d
000a2 448b9ed8010000                 mov        r11d, dword ptr [rsi + 0x1d8]
000a9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
000ae 448b96c0010000                 mov        r10d, dword ptr [rsi + 0x1c0]
000b5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
000ba 448b9eb8010000                 mov        r11d, dword ptr [rsi + 0x1b8]
000c1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
000c6 448b96a0010000                 mov        r10d, dword ptr [rsi + 0x1a0]
000cd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000d2 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000d9 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000e0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000e5 448b9670010000                 mov        r10d, dword ptr [rsi + 0x170]
000ec 4489542448                     mov        dword ptr [rsp + 0x48], r10d
000f1 448b9e68010000                 mov        r11d, dword ptr [rsi + 0x168]
000f8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
000fd 448b9628010000                 mov        r10d, dword ptr [rsi + 0x128]
00104 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0010c 448b9e20010000                 mov        r11d, dword ptr [rsi + 0x120]
00113 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
0011b 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
00122 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0012a 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
00131 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00139 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
00140 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00148 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
0014f 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00157 448b9ee0000000                 mov        r11d, dword ptr [rsi + 0xe0]
0015e 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00166 448b96d8000000                 mov        r10d, dword ptr [rsi + 0xd8]
0016d 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00175 448b9e98010000                 mov        r11d, dword ptr [rsi + 0x198]
0017c 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00181 488bfe                         mov        rdi, rsi
00184 49ba00478b961e7f0000           movabs     r10, 0x7f1e968b4700
0018e 41ffd2                         call       r10
00191 0f1f840000000000               nop        dword ptr [rax + rax]
00199 4d85ed                         test       r13, r13
0019c 0f8412270000                   je         0x7f1e7fe7d9b4
001a2 458b5504                       mov        r10d, dword ptr [r13 + 4]
001a6 41c1ea0a                       shr        r10d, 0xa
001aa 4181fa05020000                 cmp        r10d, 0x205
001b1 0f8575280000                   jne        0x7f1e7fe7db2c
001b7 4d8bd5                         mov        r10, r13
001ba 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
001c2 4d85f6                         test       r14, r14
001c5 0f84f9260000                   je         0x7f1e7fe7d9c4
001cb 458b5e04                       mov        r11d, dword ptr [r14 + 4]
001cf 41c1eb0a                       shr        r11d, 0xa
001d3 4181fb0e080000                 cmp        r11d, 0x80e
001da 0f854c280000                   jne        0x7f1e7fe7db2c
001e0 4d8bd6                         mov        r10, r14
001e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001ed 4d85d2                         test       r10, r10
001f0 0f84db260000                   je         0x7f1e7fe7d9d1
001f6 458b5204                       mov        r10d, dword ptr [r10 + 4]
001fa 41c1ea0a                       shr        r10d, 0xa
001fe 4181fa16060000                 cmp        r10d, 0x616
00205 0f8521280000                   jne        0x7f1e7fe7db2c
0020b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00210 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00215 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0021a 4d85d2                         test       r10, r10
0021d 0f84bb260000                   je         0x7f1e7fe7d9de
00223 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00227 41c1eb0a                       shr        r11d, 0xa
0022b 4181fb1c060000                 cmp        r11d, 0x61c
00232 0f85f4270000                   jne        0x7f1e7fe7db2c
00238 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0023d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00242 4d85d2                         test       r10, r10
00245 0f84a0260000                   je         0x7f1e7fe7d9eb
0024b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0024f 41c1ea0a                       shr        r10d, 0xa
00253 4181fa1c060000                 cmp        r10d, 0x61c
0025a 0f85cc270000                   jne        0x7f1e7fe7db2c
00260 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00265 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0026a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0026f 4d85d2                         test       r10, r10
00272 0f8480260000                   je         0x7f1e7fe7d9f8
00278 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027c 41c1eb0a                       shr        r11d, 0xa
00280 4181fb1c060000                 cmp        r11d, 0x61c
00287 0f859f270000                   jne        0x7f1e7fe7db2c
0028d 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00295 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0029d 4d85d2                         test       r10, r10
002a0 0f8462260000                   je         0x7f1e7fe7da08
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 41c1ea0a                       shr        r10d, 0xa
002ae 4181fa08020000                 cmp        r10d, 0x208
002b5 0f8571270000                   jne        0x7f1e7fe7db2c
002bb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
002c3 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002cb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002d0 4d85d2                         test       r10, r10
002d3 0f843f260000                   je         0x7f1e7fe7da18
002d9 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002dd 41c1eb0a                       shr        r11d, 0xa
002e1 4181fb07020000                 cmp        r11d, 0x207
002e8 0f853e270000                   jne        0x7f1e7fe7db2c
002ee 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
002f6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002fb 4d85d2                         test       r10, r10
002fe 0f8424260000                   je         0x7f1e7fe7da28
00304 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00309 4d85d2                         test       r10, r10
0030c 0f8416260000                   je         0x7f1e7fe7da28
00312 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0031a 4d85d2                         test       r10, r10
0031d 0f8405260000                   je         0x7f1e7fe7da28
00323 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032b 418b6a08                       mov        ebp, dword ptr [r10 + 8]
0032f 892c24                         mov        dword ptr [rsp], ebp
00332 4c8b942408010000               mov        r10, qword ptr [rsp + 0x108]
0033a 458b4208                       mov        r8d, dword ptr [r10 + 8]
0033e 458d50f9                       lea        r10d, [r8 - 7]
00342 4585d2                         test       r10d, r10d
00345 0f8cdd250000                   jl         0x7f1e7fe7da28
0034b 4183c0f9                       add        r8d, -7
0034f 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
00357 e965020000                     jmp        0x7f1e7fe7b6c1
0035c 4c8b9c2408010000               mov        r11, qword ptr [rsp + 0x108]
00364 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00369 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
0036e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00373 48894424f8                     mov        qword ptr [rsp - 8], rax
00378 8b442430                       mov        eax, dword ptr [rsp + 0x30]
0037c 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00380 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00385 6666660f1f840000000000         nop        word ptr [rax + rax]
00390 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8dcc100000                   jge        0x7f1e7fe7c56c
003a0 c462d3f79c2400010000           shrx       r11, qword ptr [rsp + 0x100], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942400010000               and        r10, qword ptr [rsp + 0x100]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d61120000                   jge        0x7f1e7fe7c734
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d28140000                   jge        0x7f1e7fe7c924
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8de1150000                   jge        0x7f1e7fe7cb04
00423 41b901000000                   mov        r9d, 1
00429 c442d1f7c9                     shlx       r9, r9, rbp
0042e 49ffc9                         dec        r9
00431 4d23cb                         and        r9, r11
00434 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0043c 458bdb                         mov        r11d, r11d
0043f 4403d9                         add        r11d, ecx
00442 488b8c24b8000000               mov        rcx, qword ptr [rsp + 0xb8]
0044a 8bc9                           mov        ecx, ecx
0044c 4103c8                         add        ecx, r8d
0044f 4963fb                         movsxd     rdi, r11d
00452 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0045a 458bc0                         mov        r8d, r8d
0045d 4d03c8                         add        r9, r8
00460 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
00468 4c03c7                         add        r8, rdi
0046b 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00473 4d85c9                         test       r9, r9
00476 0f8e540c0000                   jle        0x7f1e7fe7c1d0
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f57170000                   jg         0x7f1e7fe7cce0
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8fc7180000                   jg         0x7f1e7fe7ce5c
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f621a0000                   jg         0x7f1e7fe7d004
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83fa1b0000                   jae        0x7f1e7fe7d1ac
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f83280a0000                   jae        0x7f1e7fe7c000
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc810                     mov        qword ptr [r8 + r9*8 + 0x10], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8db8000000                   jge        0x7f1e7fe7b6b3
004fb 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
0050f 49c1e830                       shr        r8, 0x30
00513 458bdb                         mov        r11d, r11d
00516 418bc8                         mov        ecx, r8d
00519 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00521 44038c24e8000000               add        r9d, dword ptr [rsp + 0xe8]
00529 c44233f7c2                     shrx       r8d, r10d, r9d
0052e 4103c8                         add        ecx, r8d
00531 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
00538 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00540 c44233f7ca                     shrx       r9d, r10d, r9d
00545 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0054d 4183f820                       cmp        r8d, 0x20
00551 0f8d5d1d0000                   jge        0x7f1e7fe7d3b4
00557 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0055f 49c1e830                       shr        r8, 0x30
00563 458bc0                         mov        r8d, r8d
00566 ba01000000                     mov        edx, 1
0056b 8b8c24e8000000                 mov        ecx, dword ptr [rsp + 0xe8]
00572 c4e271f7ca                     shlx       ecx, edx, ecx
00577 ffc9                           dec        ecx
00579 4123c9                         and        ecx, r9d
0057c 4103cb                         add        ecx, r11d
0057f 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00586 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
0058e 4183fb20                       cmp        r11d, 0x20
00592 0f8d481e0000                   jge        0x7f1e7fe7d4e0
00598 b901000000                     mov        ecx, 1
0059d c46221f7d9                     shlx       r11d, ecx, r11d
005a2 41ffcb                         dec        r11d
005a5 4523da                         and        r11d, r10d
005a8 4503d8                         add        r11d, r8d
005ab 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
005b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b7 418502                         test       dword ptr [r10], eax
005ba 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c1 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005c9 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005ce 0f8d8a040000                   jge        0x7f1e7fe7bb5e
005d4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
005d9 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
005dd 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
005e4 238c24a0000000                 and        ecx, dword ptr [rsp + 0xa0]
005eb 458b4208                       mov        r8d, dword ptr [r10 + 8]
005ef 413bc8                         cmp        ecx, r8d
005f2 0f8306050000                   jae        0x7f1e7fe7bbfe
005f8 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
005fd 418b7b18                       mov        edi, dword ptr [r11 + 0x18]
00601 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00609 44238424a4000000               and        r8d, dword ptr [rsp + 0xa4]
00611 448b5f08                       mov        r11d, dword ptr [rdi + 8]
00615 4d8b54ca10                     mov        r10, qword ptr [r10 + rcx*8 + 0x10]
0061a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00622 453bc3                         cmp        r8d, r11d
00625 0f8311060000                   jae        0x7f1e7fe7bd3c
0062b 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00633 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
00637 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
0063f 44238c24a8000000               and        r9d, dword ptr [rsp + 0xa8]
00647 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0064b 4e8b44c710                     mov        r8, qword ptr [rdi + r8*8 + 0x10]
00650 4c898424c0000000               mov        qword ptr [rsp + 0xc0], r8
00658 453bcb                         cmp        r9d, r11d
0065b 0f8323070000                   jae        0x7f1e7fe7be84
00661 4f8b54ca10                     mov        r10, qword ptr [r10 + r9*8 + 0x10]
00666 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0066e 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00675 ffc5                           inc        ebp
00677 896c2404                       mov        dword ptr [rsp + 4], ebp
0067b 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067f 0f8d4a040000                   jge        0x7f1e7fe7bbcf
00685 49c1ea28                       shr        r10, 0x28
00689 458bda                         mov        r11d, r10d
0068c 450fb6db                       movzx      r11d, r11b
00690 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00698 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006a0 49c1ea28                       shr        r10, 0x28
006a4 458bd2                         mov        r10d, r10d
006a7 450fb6c2                       movzx      r8d, r10b
006ab 4503c3                         add        r8d, r11d
006ae 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006b6 49c1ea28                       shr        r10, 0x28
006ba 458bda                         mov        r11d, r10d
006bd 450fb6d3                       movzx      r10d, r11b
006c1 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
006c9 4503c2                         add        r8d, r10d
006cc 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
006d4 41bb01000000                   mov        r11d, 1
006da 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
006e2 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006ea 49c1ea20                       shr        r10, 0x20
006ee 458bd2                         mov        r10d, r10d
006f1 410fb6ea                       movzx      ebp, r10b
006f5 89ac24ac000000                 mov        dword ptr [rsp + 0xac], ebp
006fc 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00704 49c1ea20                       shr        r10, 0x20
00708 458bda                         mov        r11d, r10d
0070b 410fb6eb                       movzx      ebp, r11b
0070f 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00716 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0071e 49c1ea20                       shr        r10, 0x20
00722 458bd2                         mov        r10d, r10d
00725 410fb6ea                       movzx      ebp, r10b
00729 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00730 448bc5                         mov        r8d, ebp
00733 44038424ac000000               add        r8d, dword ptr [rsp + 0xac]
0073b 44038424f4000000               add        r8d, dword ptr [rsp + 0xf4]
00743 44038424f0000000               add        r8d, dword ptr [rsp + 0xf0]
0074b 4585c0                         test       r8d, r8d
0074e 0f84f40a0000                   je         0x7f1e7fe7c348
00754 4183f83f                       cmp        r8d, 0x3f
00758 0f8fae0c0000                   jg         0x7f1e7fe7c50c
0075e 41ba40000000                   mov        r10d, 0x40
00764 442b542448                     sub        r10d, dword ptr [rsp + 0x48]
00769 453bc2                         cmp        r8d, r10d
0076c 7e43                           jle        0x7f1e7fe7b8b1
0076e 458bd8                         mov        r11d, r8d
00771 452bda                         sub        r11d, r10d
00774 4183fa40                       cmp        r10d, 0x40
00778 0f8d521f0000                   jge        0x7f1e7fe7d7d0
0077e 41b901000000                   mov        r9d, 1
00784 c442a9f7d1                     shlx       r10, r9, r10
00789 49ffca                         dec        r10
0078c 4c23d3                         and        r10, rbx
0078f c442a1f7ca                     shlx       r9, r10, r11
00794 41ba40000000                   mov        r10d, 0x40
0079a 452bd3                         sub        r10d, r11d
0079d c462abf7542440                 shrx       r10, qword ptr [rsp + 0x40], r10
007a4 4d0bca                         or         r9, r10
007a7 4c898c2400010000               mov        qword ptr [rsp + 0x100], r9
007af eb2b                           jmp        0x7f1e7fe7b8dc
007b1 452bd0                         sub        r10d, r8d
007b4 c462abf7d3                     shrx       r10, rbx, r10
007b9 4183f840                       cmp        r8d, 0x40
007bd 0f8d351d0000                   jge        0x7f1e7fe7d5f8
007c3 41bb01000000                   mov        r11d, 1
007c9 c442b9f7db                     shlx       r11, r11, r8
007ce 49ffcb                         dec        r11
007d1 4d23da                         and        r11, r10
007d4 4c899c2400010000               mov        qword ptr [rsp + 0x100], r11
007dc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
007e1 4503d8                         add        r11d, r8d
007e4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
007e9 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
007ee 4503d0                         add        r10d, r8d
007f1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
007f6 4183fb40                       cmp        r11d, 0x40
007fa 0f8c90fbffff                   jl         0x7f1e7fe7b490
00800 4183c3c0                       add        r11d, -0x40
00804 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00809 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080d 83c5f8                         add        ebp, -8
00810 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00814 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00818 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081c 83c1f0                         add        ecx, -0x10
0081f 83f908                         cmp        ecx, 8
00822 0f8ce8010000                   jl         0x7f1e7fe7bb10
00828 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082d 4183c2e8                       add        r10d, -0x18
00831 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00839 0f821dfbffff                   jb         0x7f1e7fe7b45c
0083f bee4ffffff                     mov        esi, 0xffffffe4
00844 48894424f8                     mov        qword ptr [rsp - 8], rax
00849 8b442408                       mov        eax, dword ptr [rsp + 8]
0084d 890424                         mov        dword ptr [rsp], eax
00850 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00855 48894424f8                     mov        qword ptr [rsp - 8], rax
0085a 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085e 89442404                       mov        dword ptr [rsp + 4], eax
00862 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00867 48ff742410                     push       qword ptr [rsp + 0x10]
0086c 488f442408                     pop        qword ptr [rsp + 8]
00871 48ff742418                     push       qword ptr [rsp + 0x18]
00876 488f442410                     pop        qword ptr [rsp + 0x10]
0087b 48894424f8                     mov        qword ptr [rsp - 8], rax
00880 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00884 89442418                       mov        dword ptr [rsp + 0x18], eax
00888 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088d 48894424f8                     mov        qword ptr [rsp - 8], rax
00892 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00896 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0089a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089f 48894424f8                     mov        qword ptr [rsp - 8], rax
008a4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a8 89442420                       mov        dword ptr [rsp + 0x20], eax
008ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b1 48894424f8                     mov        qword ptr [rsp - 8], rax
008b6 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008ba 89442424                       mov        dword ptr [rsp + 0x24], eax
008be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c3 48ff742440                     push       qword ptr [rsp + 0x40]
008c8 488f442428                     pop        qword ptr [rsp + 0x28]
008cd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008d2 48894424f8                     mov        qword ptr [rsp - 8], rax
008d7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
008db 89442434                       mov        dword ptr [rsp + 0x34], eax
008df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e4 48ff742450                     push       qword ptr [rsp + 0x50]
008e9 488f442438                     pop        qword ptr [rsp + 0x38]
008ee 48ff742458                     push       qword ptr [rsp + 0x58]
008f3 488f442440                     pop        qword ptr [rsp + 0x40]
008f8 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00900 488f442448                     pop        qword ptr [rsp + 0x48]
00905 48894424f8                     mov        qword ptr [rsp - 8], rax
0090a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00911 89442450                       mov        dword ptr [rsp + 0x50], eax
00915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0091a 48894424f8                     mov        qword ptr [rsp - 8], rax
0091f 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00926 89442454                       mov        dword ptr [rsp + 0x54], eax
0092a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092f 48894424f8                     mov        qword ptr [rsp - 8], rax
00934 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0093b 89442458                       mov        dword ptr [rsp + 0x58], eax
0093f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00944 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0094c 488f442460                     pop        qword ptr [rsp + 0x60]
00951 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00959 488f442468                     pop        qword ptr [rsp + 0x68]
0095e 48ffb42498000000               push       qword ptr [rsp + 0x98]
00966 488f442470                     pop        qword ptr [rsp + 0x70]
0096b 48894424f8                     mov        qword ptr [rsp - 8], rax
00970 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00977 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0097b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00980 48894424f8                     mov        qword ptr [rsp - 8], rax
00985 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0098c 89442478                       mov        dword ptr [rsp + 0x78], eax
00990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00995 48894424f8                     mov        qword ptr [rsp - 8], rax
0099a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
009a1 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009aa 48894424f8                     mov        qword ptr [rsp - 8], rax
009af 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
009b6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009c2 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009ca 488f842488000000               pop        qword ptr [rsp + 0x88]
009d2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009da 488f842490000000               pop        qword ptr [rsp + 0x90]
009e2 48894424f8                     mov        qword ptr [rsp - 8], rax
009e7 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
009ee 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
009f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009fa 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00a02 90                             nop        
00a03 e858c2b5ff                     call       0x7f1e7f9d7d60
00a08 0f1f8400000b0001               nop        dword ptr [rax + rax + 0x1000b00]
00a10 85c9                           test       ecx, ecx
00a12 7f08                           jg         0x7f1e7fe7bb1c
00a14 4533d2                         xor        r10d, r10d
00a17 e94df9ffff                     jmp        0x7f1e7fe7b469
00a1c 8be9                           mov        ebp, ecx
00a1e 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
00a26 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a2a 90                             nop        
00a2b e8304da9ff                     call       0x7f1e7f910860
00a30 0f1f8400280b0002               nop        dword ptr [rax + rax + 0x2000b28]
00a38 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a3d 41c1e003                       shl        r8d, 3
00a41 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a46 41c1e303                       shl        r11d, 3
00a4a 452bd8                         sub        r11d, r8d
00a4d 4181c3c0000000                 add        r11d, 0xc0
00a54 c462a1f7d0                     shlx       r10, rax, r11
00a59 e90bf9ffff                     jmp        0x7f1e7fe7b469
00a5e 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00a66 4c03942498000000               add        r10, qword ptr [rsp + 0x98]
00a6e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a73 4d3bd3                         cmp        r10, r11
00a76 7e31                           jle        0x7f1e7fe7bba9
00a78 48be205d32e300000000           movabs     rsi, 0xe3325d20
00a82 90                             nop        
00a83 e8d84ca9ff                     call       0x7f1e7f910860
00a88 0f1f8400800b0003               nop        dword ptr [rax + rax + 0x3000b80]
00a90 4885c0                         test       rax, rax
00a93 0f849b200000                   je         0x7f1e7fe7dc34
00a99 488bf0                         mov        rsi, rax
00a9c 4881c420010000                 add        rsp, 0x120
00aa3 5d                             pop        rbp
00aa4 e9b7edb5ff                     jmp        0x7f1e7f9da960
00aa9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00aae 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00ab3 0f858f200000                   jne        0x7f1e7fe7dc48
00ab9 418bc2                         mov        eax, r10d
00abc 4881c420010000                 add        rsp, 0x120
00ac3 5d                             pop        rbp
00ac4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ac8 0f87dc200000                   ja         0x7f1e7fe7dcaa
00ace c3                             ret        
00acf 4533db                         xor        r11d, r11d
00ad2 33ed                           xor        ebp, ebp
00ad4 4533d2                         xor        r10d, r10d
00ad7 4533c9                         xor        r9d, r9d
00ada 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00ae2 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00ae9 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
00af1 44898c24fc000000               mov        dword ptr [rsp + 0xfc], r9d
00af9 e9e4fbffff                     jmp        0x7f1e7fe7b7e2
00afe bee4ffffff                     mov        esi, 0xffffffe4
00b03 48894424f8                     mov        qword ptr [rsp - 8], rax
00b08 8b442408                       mov        eax, dword ptr [rsp + 8]
00b0c 890424                         mov        dword ptr [rsp], eax
00b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b14 48894424f8                     mov        qword ptr [rsp - 8], rax
00b19 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b1d 89442404                       mov        dword ptr [rsp + 4], eax
00b21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b26 48ff742410                     push       qword ptr [rsp + 0x10]
00b2b 488f442408                     pop        qword ptr [rsp + 8]
00b30 48ff742418                     push       qword ptr [rsp + 0x18]
00b35 488f442410                     pop        qword ptr [rsp + 0x10]
00b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b3f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b43 89442418                       mov        dword ptr [rsp + 0x18], eax
00b47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b4c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b51 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b55 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b63 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b67 89442420                       mov        dword ptr [rsp + 0x20], eax
00b6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b70 48894424f8                     mov        qword ptr [rsp - 8], rax
00b75 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b79 89442424                       mov        dword ptr [rsp + 0x24], eax
00b7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b82 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b87 48ff742440                     push       qword ptr [rsp + 0x40]
00b8c 488f442430                     pop        qword ptr [rsp + 0x30]
00b91 48894424f8                     mov        qword ptr [rsp - 8], rax
00b96 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00b9a 89442438                       mov        dword ptr [rsp + 0x38], eax
00b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba8 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00bac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb5 48ff742450                     push       qword ptr [rsp + 0x50]
00bba 488f442440                     pop        qword ptr [rsp + 0x40]
00bbf 48ff742458                     push       qword ptr [rsp + 0x58]
00bc4 488f442448                     pop        qword ptr [rsp + 0x48]
00bc9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bce 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00bd5 89442458                       mov        dword ptr [rsp + 0x58], eax
00bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bde 48894424f8                     mov        qword ptr [rsp - 8], rax
00be3 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00bea 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00bee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bf3 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf8 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00bff 89442460                       mov        dword ptr [rsp + 0x60], eax
00c03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c08 48894424f8                     mov        qword ptr [rsp - 8], rax
00c0d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00c14 89442464                       mov        dword ptr [rsp + 0x64], eax
00c18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c1d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00c25 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00c2c 666690                         nop        
00c2f e82cc0b5ff                     call       0x7f1e7f9d7d60
00c34 0f1f84002c0d0004               nop        dword ptr [rax + rax + 0x4000d2c]
00c3c bee4ffffff                     mov        esi, 0xffffffe4
00c41 48894424f8                     mov        qword ptr [rsp - 8], rax
00c46 8b442408                       mov        eax, dword ptr [rsp + 8]
00c4a 890424                         mov        dword ptr [rsp], eax
00c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c52 48894424f8                     mov        qword ptr [rsp - 8], rax
00c57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c5b 89442404                       mov        dword ptr [rsp + 4], eax
00c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c64 48ff742410                     push       qword ptr [rsp + 0x10]
00c69 488f442408                     pop        qword ptr [rsp + 8]
00c6e 48ff742418                     push       qword ptr [rsp + 0x18]
00c73 488f442410                     pop        qword ptr [rsp + 0x10]
00c78 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c81 89442418                       mov        dword ptr [rsp + 0x18], eax
00c85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ca5 89442420                       mov        dword ptr [rsp + 0x20], eax
00ca9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cae 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00cb7 89442424                       mov        dword ptr [rsp + 0x24], eax
00cbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00cc5 48ff742440                     push       qword ptr [rsp + 0x40]
00cca 488f442430                     pop        qword ptr [rsp + 0x30]
00ccf 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00cd8 89442438                       mov        dword ptr [rsp + 0x38], eax
00cdc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ce6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00cea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cf3 48ff742450                     push       qword ptr [rsp + 0x50]
00cf8 488f442440                     pop        qword ptr [rsp + 0x40]
00cfd 48ff742458                     push       qword ptr [rsp + 0x58]
00d02 488f442448                     pop        qword ptr [rsp + 0x48]
00d07 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0c 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00d13 89442458                       mov        dword ptr [rsp + 0x58], eax
00d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d21 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00d28 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d31 48894424f8                     mov        qword ptr [rsp - 8], rax
00d36 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00d3d 89442460                       mov        dword ptr [rsp + 0x60], eax
00d41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d46 48ffb42498000000               push       qword ptr [rsp + 0x98]
00d4e 488f442478                     pop        qword ptr [rsp + 0x78]
00d53 48894424f8                     mov        qword ptr [rsp - 8], rax
00d58 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00d5f 89442464                       mov        dword ptr [rsp + 0x64], eax
00d63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d68 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00d6f 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00d77 e8e4beb5ff                     call       0x7f1e7f9d7d60
00d7c 0f1f8400740e0005               nop        dword ptr [rax + rax + 0x5000e74]
00d84 bee4ffffff                     mov        esi, 0xffffffe4
00d89 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8e 8b442408                       mov        eax, dword ptr [rsp + 8]
00d92 890424                         mov        dword ptr [rsp], eax
00d95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00da3 89442404                       mov        dword ptr [rsp + 4], eax
00da7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dac 48ff742410                     push       qword ptr [rsp + 0x10]
00db1 488f442408                     pop        qword ptr [rsp + 8]
00db6 48ff742418                     push       qword ptr [rsp + 0x18]
00dbb 488f442410                     pop        qword ptr [rsp + 0x10]
00dc0 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00dc9 89442418                       mov        dword ptr [rsp + 0x18], eax
00dcd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00ddb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ddf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de4 48894424f8                     mov        qword ptr [rsp - 8], rax
00de9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ded 89442420                       mov        dword ptr [rsp + 0x20], eax
00df1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df6 48894424f8                     mov        qword ptr [rsp - 8], rax
00dfb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00dff 89442424                       mov        dword ptr [rsp + 0x24], eax
00e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e08 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00e0d 48ff742440                     push       qword ptr [rsp + 0x40]
00e12 488f442430                     pop        qword ptr [rsp + 0x30]
00e17 48894424f8                     mov        qword ptr [rsp - 8], rax
00e1c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00e20 89442438                       mov        dword ptr [rsp + 0x38], eax
00e24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e29 48894424f8                     mov        qword ptr [rsp - 8], rax
00e2e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00e32 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3b 48ff742450                     push       qword ptr [rsp + 0x50]
00e40 488f442440                     pop        qword ptr [rsp + 0x40]
00e45 48ff742458                     push       qword ptr [rsp + 0x58]
00e4a 488f442448                     pop        qword ptr [rsp + 0x48]
00e4f 48894424f8                     mov        qword ptr [rsp - 8], rax
00e54 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00e5b 89442458                       mov        dword ptr [rsp + 0x58], eax
00e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e64 48894424f8                     mov        qword ptr [rsp - 8], rax
00e69 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00e70 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e79 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7e 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00e85 89442460                       mov        dword ptr [rsp + 0x60], eax
00e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8e 48ffb42498000000               push       qword ptr [rsp + 0x98]
00e96 488f442478                     pop        qword ptr [rsp + 0x78]
00e9b 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea0 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00ea7 89442464                       mov        dword ptr [rsp + 0x64], eax
00eab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb0 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00ebc 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00ec3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ecd 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00ed4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00edb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee0 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ee8 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00ef0 666690                         nop        
00ef3 e868bdb5ff                     call       0x7f1e7f9d7d60
00ef8 0f1f8400f00f0006               nop        dword ptr [rax + rax + 0x6000ff0]
00f00 bee4ffffff                     mov        esi, 0xffffffe4
00f05 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0a 8b442408                       mov        eax, dword ptr [rsp + 8]
00f0e 890424                         mov        dword ptr [rsp], eax
00f11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f16 48894424f8                     mov        qword ptr [rsp - 8], rax
00f1b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00f1f 89442404                       mov        dword ptr [rsp + 4], eax
00f23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f28 48ff742410                     push       qword ptr [rsp + 0x10]
00f2d 488f442408                     pop        qword ptr [rsp + 8]
00f32 48ff742418                     push       qword ptr [rsp + 0x18]
00f37 488f442410                     pop        qword ptr [rsp + 0x10]
00f3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00f41 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00f45 89442418                       mov        dword ptr [rsp + 0x18], eax
00f49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f53 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00f57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00f5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f60 48894424f8                     mov        qword ptr [rsp - 8], rax
00f65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f69 89442420                       mov        dword ptr [rsp + 0x20], eax
00f6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f72 48894424f8                     mov        qword ptr [rsp - 8], rax
00f77 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f7b 89442424                       mov        dword ptr [rsp + 0x24], eax
00f7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f84 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f89 48ff742440                     push       qword ptr [rsp + 0x40]
00f8e 488f442430                     pop        qword ptr [rsp + 0x30]
00f93 48894424f8                     mov        qword ptr [rsp - 8], rax
00f98 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00f9c 89442438                       mov        dword ptr [rsp + 0x38], eax
00fa0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa5 48894424f8                     mov        qword ptr [rsp - 8], rax
00faa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00fae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00fb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb7 48ff742450                     push       qword ptr [rsp + 0x50]
00fbc 488f442440                     pop        qword ptr [rsp + 0x40]
00fc1 48ff742458                     push       qword ptr [rsp + 0x58]
00fc6 488f442448                     pop        qword ptr [rsp + 0x48]
00fcb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00fd3 488f442450                     pop        qword ptr [rsp + 0x50]
00fd8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00fe4 89442458                       mov        dword ptr [rsp + 0x58], eax
00fe8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fed 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff2 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ff9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00ffd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01002 48894424f8                     mov        qword ptr [rsp - 8], rax
01007 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0100e 89442460                       mov        dword ptr [rsp + 0x60], eax
01012 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01017 48ffb42498000000               push       qword ptr [rsp + 0x98]
0101f 488f442478                     pop        qword ptr [rsp + 0x78]
01024 48894424f8                     mov        qword ptr [rsp - 8], rax
01029 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01030 89442464                       mov        dword ptr [rsp + 0x64], eax
01034 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01039 48894424f8                     mov        qword ptr [rsp - 8], rax
0103e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01045 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0104c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01051 48894424f8                     mov        qword ptr [rsp - 8], rax
01056 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0105d 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01064 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01069 48894424f8                     mov        qword ptr [rsp - 8], rax
0106e 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01075 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0107c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01081 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01089 488f842490000000               pop        qword ptr [rsp + 0x90]
01091 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01099 488f842498000000               pop        qword ptr [rsp + 0x98]
010a1 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
010a9 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
010b1 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
010b9 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
010c1 6690                           nop        
010c3 e898bbb5ff                     call       0x7f1e7f9d7d60
010c8 0f1f8400c0110007               nop        dword ptr [rax + rax + 0x70011c0]
010d0 4533c0                         xor        r8d, r8d
010d3 4d3bc8                         cmp        r9, r8
010d6 bdffffffff                     mov        ebp, 0xffffffff
010db 7c08                           jl         0x7f1e7fe7c1e5
010dd 400f95c5                       setne      bpl
010e1 400fb6ed                       movzx      ebp, bpl
010e5 be45ffffff                     mov        esi, 0xffffff45
010ea 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
010ef 48ff742440                     push       qword ptr [rsp + 0x40]
010f4 488f442438                     pop        qword ptr [rsp + 0x38]
010f9 48894424f8                     mov        qword ptr [rsp - 8], rax
010fe 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01102 89442440                       mov        dword ptr [rsp + 0x40], eax
01106 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110b 48894424f8                     mov        qword ptr [rsp - 8], rax
01110 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01114 89442444                       mov        dword ptr [rsp + 0x44], eax
01118 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111d 48ff742450                     push       qword ptr [rsp + 0x50]
01122 488f442448                     pop        qword ptr [rsp + 0x48]
01127 48ff742458                     push       qword ptr [rsp + 0x58]
0112c 488f442450                     pop        qword ptr [rsp + 0x50]
01131 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01139 488f442458                     pop        qword ptr [rsp + 0x58]
0113e 48894424f8                     mov        qword ptr [rsp - 8], rax
01143 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0114a 89442460                       mov        dword ptr [rsp + 0x60], eax
0114e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01153 48894424f8                     mov        qword ptr [rsp - 8], rax
01158 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0115f 89442464                       mov        dword ptr [rsp + 0x64], eax
01163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01168 48894424f8                     mov        qword ptr [rsp - 8], rax
0116d 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01174 89442468                       mov        dword ptr [rsp + 0x68], eax
01178 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117d 48ffb42498000000               push       qword ptr [rsp + 0x98]
01185 488f842480000000               pop        qword ptr [rsp + 0x80]
0118d 48894424f8                     mov        qword ptr [rsp - 8], rax
01192 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01199 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0119d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a2 48894424f8                     mov        qword ptr [rsp - 8], rax
011a7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
011ae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
011b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ba 48894424f8                     mov        qword ptr [rsp - 8], rax
011bf 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
011c6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
011cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d2 48894424f8                     mov        qword ptr [rsp - 8], rax
011d7 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
011de 89842490000000                 mov        dword ptr [rsp + 0x90], eax
011e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ea 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
011f2 488f842498000000               pop        qword ptr [rsp + 0x98]
011fa 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01202 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0120a 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01212 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
0121a 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01222 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0122a 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01231 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01239 6690                           nop        
0123b e820bab5ff                     call       0x7f1e7f9d7d60
01240 0f1f840038130008               nop        dword ptr [rax + rax + 0x8001338]
01248 be45ffffff                     mov        esi, 0xffffff45
0124d 48894424f8                     mov        qword ptr [rsp - 8], rax
01252 8b442408                       mov        eax, dword ptr [rsp + 8]
01256 890424                         mov        dword ptr [rsp], eax
01259 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125e 48894424f8                     mov        qword ptr [rsp - 8], rax
01263 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01267 89442404                       mov        dword ptr [rsp + 4], eax
0126b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01270 48ff742410                     push       qword ptr [rsp + 0x10]
01275 488f442408                     pop        qword ptr [rsp + 8]
0127a 48ff742418                     push       qword ptr [rsp + 0x18]
0127f 488f442410                     pop        qword ptr [rsp + 0x10]
01284 48894424f8                     mov        qword ptr [rsp - 8], rax
01289 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0128d 89442418                       mov        dword ptr [rsp + 0x18], eax
01291 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01296 48894424f8                     mov        qword ptr [rsp - 8], rax
0129b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0129f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
012a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a8 48894424f8                     mov        qword ptr [rsp - 8], rax
012ad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012b1 89442420                       mov        dword ptr [rsp + 0x20], eax
012b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ba 48894424f8                     mov        qword ptr [rsp - 8], rax
012bf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
012c3 89442424                       mov        dword ptr [rsp + 0x24], eax
012c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
012d1 48ff742440                     push       qword ptr [rsp + 0x40]
012d6 488f442430                     pop        qword ptr [rsp + 0x30]
012db 48894424f8                     mov        qword ptr [rsp - 8], rax
012e0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
012e4 89442438                       mov        dword ptr [rsp + 0x38], eax
012e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ed 48894424f8                     mov        qword ptr [rsp - 8], rax
012f2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012f6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
012fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ff 48ff742450                     push       qword ptr [rsp + 0x50]
01304 488f442440                     pop        qword ptr [rsp + 0x40]
01309 48ff742458                     push       qword ptr [rsp + 0x58]
0130e 488f442448                     pop        qword ptr [rsp + 0x48]
01313 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0131b 488f442450                     pop        qword ptr [rsp + 0x50]
01320 48894424f8                     mov        qword ptr [rsp - 8], rax
01325 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0132c 89442458                       mov        dword ptr [rsp + 0x58], eax
01330 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01335 48894424f8                     mov        qword ptr [rsp - 8], rax
0133a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01341 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01345 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0134a 48894424f8                     mov        qword ptr [rsp - 8], rax
0134f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01356 89442460                       mov        dword ptr [rsp + 0x60], eax
0135a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01367 488f442468                     pop        qword ptr [rsp + 0x68]
0136c 48ffb42498000000               push       qword ptr [rsp + 0x98]
01374 488f442478                     pop        qword ptr [rsp + 0x78]
01379 48894424f8                     mov        qword ptr [rsp - 8], rax
0137e 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01385 89442464                       mov        dword ptr [rsp + 0x64], eax
01389 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0138e 48894424f8                     mov        qword ptr [rsp - 8], rax
01393 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0139a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
013a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a6 48894424f8                     mov        qword ptr [rsp - 8], rax
013ab 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
013b2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
013b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013be 48894424f8                     mov        qword ptr [rsp - 8], rax
013c3 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
013ca 89842488000000                 mov        dword ptr [rsp + 0x88], eax
013d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d6 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
013de 488f842490000000               pop        qword ptr [rsp + 0x90]
013e6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
013ee 488f842498000000               pop        qword ptr [rsp + 0x98]
013f6 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
013fe 90                             nop        
013ff e85cb8b5ff                     call       0x7f1e7f9d7d60
01404 0f1f8400fc140009               nop        dword ptr [rax + rax + 0x90014fc]
0140c be45ffffff                     mov        esi, 0xffffff45
01411 48894424f8                     mov        qword ptr [rsp - 8], rax
01416 8b442408                       mov        eax, dword ptr [rsp + 8]
0141a 890424                         mov        dword ptr [rsp], eax
0141d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01422 48894424f8                     mov        qword ptr [rsp - 8], rax
01427 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0142b 89442404                       mov        dword ptr [rsp + 4], eax
0142f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01434 48ff742410                     push       qword ptr [rsp + 0x10]
01439 488f442408                     pop        qword ptr [rsp + 8]
0143e 48ff742418                     push       qword ptr [rsp + 0x18]
01443 488f442410                     pop        qword ptr [rsp + 0x10]
01448 48894424f8                     mov        qword ptr [rsp - 8], rax
0144d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01451 89442418                       mov        dword ptr [rsp + 0x18], eax
01455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145a 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0145f e8fcb7b5ff                     call       0x7f1e7f9d7d60
01464 0f1f84005c15000a               nop        dword ptr [rax + rax + 0xa00155c]
0146c be45ffffff                     mov        esi, 0xffffff45
01471 48894424f8                     mov        qword ptr [rsp - 8], rax
01476 8b442408                       mov        eax, dword ptr [rsp + 8]
0147a 890424                         mov        dword ptr [rsp], eax
0147d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01482 48894424f8                     mov        qword ptr [rsp - 8], rax
01487 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0148b 89442404                       mov        dword ptr [rsp + 4], eax
0148f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01494 48ff742410                     push       qword ptr [rsp + 0x10]
01499 488f442408                     pop        qword ptr [rsp + 8]
0149e 48ff742418                     push       qword ptr [rsp + 0x18]
014a3 488f442410                     pop        qword ptr [rsp + 0x10]
014a8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ad 8b442420                       mov        eax, dword ptr [rsp + 0x20]
014b1 89442418                       mov        dword ptr [rsp + 0x18], eax
014b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ba 48894424f8                     mov        qword ptr [rsp - 8], rax
014bf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
014c3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
014c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014cc 48894424f8                     mov        qword ptr [rsp - 8], rax
014d1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014d5 89442420                       mov        dword ptr [rsp + 0x20], eax
014d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014de 48894424f8                     mov        qword ptr [rsp - 8], rax
014e3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
014e7 89442424                       mov        dword ptr [rsp + 0x24], eax
014eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
014f5 48ff742440                     push       qword ptr [rsp + 0x40]
014fa 488f442430                     pop        qword ptr [rsp + 0x30]
014ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01504 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01508 89442438                       mov        dword ptr [rsp + 0x38], eax
0150c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01511 48894424f8                     mov        qword ptr [rsp - 8], rax
01516 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0151a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0151e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01523 48ff742450                     push       qword ptr [rsp + 0x50]
01528 488f442440                     pop        qword ptr [rsp + 0x40]
0152d 48ff742458                     push       qword ptr [rsp + 0x58]
01532 488f442448                     pop        qword ptr [rsp + 0x48]
01537 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0153f 488f442450                     pop        qword ptr [rsp + 0x50]
01544 48894424f8                     mov        qword ptr [rsp - 8], rax
01549 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01550 89442458                       mov        dword ptr [rsp + 0x58], eax
01554 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01559 48894424f8                     mov        qword ptr [rsp - 8], rax
0155e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01565 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156e 48894424f8                     mov        qword ptr [rsp - 8], rax
01573 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0157a 89442460                       mov        dword ptr [rsp + 0x60], eax
0157e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01583 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0158b 488f442468                     pop        qword ptr [rsp + 0x68]
01590 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01598 488f442470                     pop        qword ptr [rsp + 0x70]
0159d 48ffb42498000000               push       qword ptr [rsp + 0x98]
015a5 488f442478                     pop        qword ptr [rsp + 0x78]
015aa 48894424f8                     mov        qword ptr [rsp - 8], rax
015af 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
015b6 89442464                       mov        dword ptr [rsp + 0x64], eax
015ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bf 48894424f8                     mov        qword ptr [rsp - 8], rax
015c4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
015cb 89842480000000                 mov        dword ptr [rsp + 0x80], eax
015d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d7 48894424f8                     mov        qword ptr [rsp - 8], rax
015dc 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
015e3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
015ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ef 48894424f8                     mov        qword ptr [rsp - 8], rax
015f4 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
015fb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01602 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01607 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0160f 488f842490000000               pop        qword ptr [rsp + 0x90]
01617 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0161f 488f842498000000               pop        qword ptr [rsp + 0x98]
01627 e834b6b5ff                     call       0x7f1e7f9d7d60
0162c 0f1f84002417000b               nop        dword ptr [rax + rax + 0xb001724]
01634 be45ffffff                     mov        esi, 0xffffff45
01639 48894424f8                     mov        qword ptr [rsp - 8], rax
0163e 8b442408                       mov        eax, dword ptr [rsp + 8]
01642 890424                         mov        dword ptr [rsp], eax
01645 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164a 48894424f8                     mov        qword ptr [rsp - 8], rax
0164f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01653 89442404                       mov        dword ptr [rsp + 4], eax
01657 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165c 48ff742410                     push       qword ptr [rsp + 0x10]
01661 488f442408                     pop        qword ptr [rsp + 8]
01666 48ff742418                     push       qword ptr [rsp + 0x18]
0166b 488f442410                     pop        qword ptr [rsp + 0x10]
01670 48894424f8                     mov        qword ptr [rsp - 8], rax
01675 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01679 89442418                       mov        dword ptr [rsp + 0x18], eax
0167d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01682 48894424f8                     mov        qword ptr [rsp - 8], rax
01687 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0168b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0168f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01694 48894424f8                     mov        qword ptr [rsp - 8], rax
01699 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0169d 89442420                       mov        dword ptr [rsp + 0x20], eax
016a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a6 48894424f8                     mov        qword ptr [rsp - 8], rax
016ab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
016af 89442424                       mov        dword ptr [rsp + 0x24], eax
016b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
016bd 48ff742440                     push       qword ptr [rsp + 0x40]
016c2 488f442430                     pop        qword ptr [rsp + 0x30]
016c7 48894424f8                     mov        qword ptr [rsp - 8], rax
016cc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016d0 89442438                       mov        dword ptr [rsp + 0x38], eax
016d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d9 48894424f8                     mov        qword ptr [rsp - 8], rax
016de 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
016e2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016eb 48ff742450                     push       qword ptr [rsp + 0x50]
016f0 488f442440                     pop        qword ptr [rsp + 0x40]
016f5 48ff742458                     push       qword ptr [rsp + 0x58]
016fa 488f442448                     pop        qword ptr [rsp + 0x48]
016ff 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01707 488f442450                     pop        qword ptr [rsp + 0x50]
0170c 48894424f8                     mov        qword ptr [rsp - 8], rax
01711 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01718 89442458                       mov        dword ptr [rsp + 0x58], eax
0171c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01721 48894424f8                     mov        qword ptr [rsp - 8], rax
01726 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0172d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01731 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01736 48894424f8                     mov        qword ptr [rsp - 8], rax
0173b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01742 89442460                       mov        dword ptr [rsp + 0x60], eax
01746 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01753 488f442468                     pop        qword ptr [rsp + 0x68]
01758 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01760 488f442470                     pop        qword ptr [rsp + 0x70]
01765 48ffb42498000000               push       qword ptr [rsp + 0x98]
0176d 488f442478                     pop        qword ptr [rsp + 0x78]
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0177e 89442464                       mov        dword ptr [rsp + 0x64], eax
01782 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01787 48894424f8                     mov        qword ptr [rsp - 8], rax
0178c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01793 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0179a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179f 48894424f8                     mov        qword ptr [rsp - 8], rax
017a4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
017ab 89842484000000                 mov        dword ptr [rsp + 0x84], eax
017b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b7 48894424f8                     mov        qword ptr [rsp - 8], rax
017bc 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
017c3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
017ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cf 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
017d7 488f842490000000               pop        qword ptr [rsp + 0x90]
017df 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
017e7 488f842498000000               pop        qword ptr [rsp + 0x98]
017ef 48894424f8                     mov        qword ptr [rsp - 8], rax
017f4 8b8424f4000000                 mov        eax, dword ptr [rsp + 0xf4]
017fb 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
01802 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01807 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0180f 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01817 e844b4b5ff                     call       0x7f1e7f9d7d60
0181c 0f1f84001419000c               nop        dword ptr [rax + rax + 0xc001914]
01824 be45ffffff                     mov        esi, 0xffffff45
01829 48894424f8                     mov        qword ptr [rsp - 8], rax
0182e 8b442408                       mov        eax, dword ptr [rsp + 8]
01832 890424                         mov        dword ptr [rsp], eax
01835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01843 89442404                       mov        dword ptr [rsp + 4], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 48ff742410                     push       qword ptr [rsp + 0x10]
01851 488f442408                     pop        qword ptr [rsp + 8]
01856 48ff742418                     push       qword ptr [rsp + 0x18]
0185b 488f442410                     pop        qword ptr [rsp + 0x10]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01869 89442418                       mov        dword ptr [rsp + 0x18], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 48894424f8                     mov        qword ptr [rsp - 8], rax
01877 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0187b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0187f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01884 48894424f8                     mov        qword ptr [rsp - 8], rax
01889 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0188d 89442420                       mov        dword ptr [rsp + 0x20], eax
01891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01896 48894424f8                     mov        qword ptr [rsp - 8], rax
0189b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0189f 89442424                       mov        dword ptr [rsp + 0x24], eax
018a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
018ad 48ff742440                     push       qword ptr [rsp + 0x40]
018b2 488f442430                     pop        qword ptr [rsp + 0x30]
018b7 48894424f8                     mov        qword ptr [rsp - 8], rax
018bc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018c0 89442438                       mov        dword ptr [rsp + 0x38], eax
018c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ce 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018d2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018db 48ff742450                     push       qword ptr [rsp + 0x50]
018e0 488f442440                     pop        qword ptr [rsp + 0x40]
018e5 48ff742458                     push       qword ptr [rsp + 0x58]
018ea 488f442448                     pop        qword ptr [rsp + 0x48]
018ef 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
018f7 488f442450                     pop        qword ptr [rsp + 0x50]
018fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01901 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01908 89442458                       mov        dword ptr [rsp + 0x58], eax
0190c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01911 48894424f8                     mov        qword ptr [rsp - 8], rax
01916 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0191d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01926 48894424f8                     mov        qword ptr [rsp - 8], rax
0192b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01932 89442460                       mov        dword ptr [rsp + 0x60], eax
01936 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01943 488f442468                     pop        qword ptr [rsp + 0x68]
01948 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01950 488f442470                     pop        qword ptr [rsp + 0x70]
01955 48ffb42498000000               push       qword ptr [rsp + 0x98]
0195d 488f442478                     pop        qword ptr [rsp + 0x78]
01962 48894424f8                     mov        qword ptr [rsp - 8], rax
01967 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0196e 89442464                       mov        dword ptr [rsp + 0x64], eax
01972 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01977 48894424f8                     mov        qword ptr [rsp - 8], rax
0197c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01983 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0198a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198f 48894424f8                     mov        qword ptr [rsp - 8], rax
01994 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0199b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
019a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a7 48894424f8                     mov        qword ptr [rsp - 8], rax
019ac 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
019b3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
019ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019bf 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
019c7 488f842490000000               pop        qword ptr [rsp + 0x90]
019cf 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019d7 488f842498000000               pop        qword ptr [rsp + 0x98]
019df 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019e7 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019ef 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019f7 e864b2b5ff                     call       0x7f1e7f9d7d60
019fc 0f1f8400f41a000d               nop        dword ptr [rax + rax + 0xd001af4]
01a04 be45ffffff                     mov        esi, 0xffffff45
01a09 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0e 8b442408                       mov        eax, dword ptr [rsp + 8]
01a12 890424                         mov        dword ptr [rsp], eax
01a15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a23 89442404                       mov        dword ptr [rsp + 4], eax
01a27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2c 48ff742410                     push       qword ptr [rsp + 0x10]
01a31 488f442408                     pop        qword ptr [rsp + 8]
01a36 48ff742418                     push       qword ptr [rsp + 0x18]
01a3b 488f442410                     pop        qword ptr [rsp + 0x10]
01a40 48894424f8                     mov        qword ptr [rsp - 8], rax
01a45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a49 89442418                       mov        dword ptr [rsp + 0x18], eax
01a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a52 48894424f8                     mov        qword ptr [rsp - 8], rax
01a57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a64 48894424f8                     mov        qword ptr [rsp - 8], rax
01a69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a6d 89442420                       mov        dword ptr [rsp + 0x20], eax
01a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a76 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a7f 89442424                       mov        dword ptr [rsp + 0x24], eax
01a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a8d 48ff742440                     push       qword ptr [rsp + 0x40]
01a92 488f442430                     pop        qword ptr [rsp + 0x30]
01a97 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01aa0 89442438                       mov        dword ptr [rsp + 0x38], eax
01aa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa9 48894424f8                     mov        qword ptr [rsp - 8], rax
01aae 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01ab2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abb 48ff742450                     push       qword ptr [rsp + 0x50]
01ac0 488f442440                     pop        qword ptr [rsp + 0x40]
01ac5 48ff742458                     push       qword ptr [rsp + 0x58]
01aca 488f442448                     pop        qword ptr [rsp + 0x48]
01acf 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01ad7 488f442450                     pop        qword ptr [rsp + 0x50]
01adc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ae8 89442458                       mov        dword ptr [rsp + 0x58], eax
01aec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af1 48894424f8                     mov        qword ptr [rsp - 8], rax
01af6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01afd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b06 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01b12 89442460                       mov        dword ptr [rsp + 0x60], eax
01b16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b23 488f442468                     pop        qword ptr [rsp + 0x68]
01b28 48ffb42498000000               push       qword ptr [rsp + 0x98]
01b30 488f442478                     pop        qword ptr [rsp + 0x78]
01b35 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3a 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01b41 89442464                       mov        dword ptr [rsp + 0x64], eax
01b45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b56 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b62 48894424f8                     mov        qword ptr [rsp - 8], rax
01b67 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b6e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7f 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b86 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b92 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01b9a 488f842490000000               pop        qword ptr [rsp + 0x90]
01ba2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01baa 488f842498000000               pop        qword ptr [rsp + 0x98]
01bb2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bba 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bc2 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bc9 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bd1 6690                           nop        
01bd3 e888b0b5ff                     call       0x7f1e7f9d7d60
01bd8 0f1f8400d01c000e               nop        dword ptr [rax + rax + 0xe001cd0]
01be0 be45ffffff                     mov        esi, 0xffffff45
01be5 41b8ffffff7f                   mov        r8d, 0x7fffffff
01beb 4d3bc8                         cmp        r9, r8
01bee bdffffffff                     mov        ebp, 0xffffffff
01bf3 7c08                           jl         0x7f1e7fe7ccfd
01bf5 400f95c5                       setne      bpl
01bf9 400fb6ed                       movzx      ebp, bpl
01bfd 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c02 48ff742440                     push       qword ptr [rsp + 0x40]
01c07 488f442438                     pop        qword ptr [rsp + 0x38]
01c0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c11 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c15 89442440                       mov        dword ptr [rsp + 0x40], eax
01c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c23 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01c27 89442444                       mov        dword ptr [rsp + 0x44], eax
01c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c30 48ff742450                     push       qword ptr [rsp + 0x50]
01c35 488f442448                     pop        qword ptr [rsp + 0x48]
01c3a 48ff742458                     push       qword ptr [rsp + 0x58]
01c3f 488f442450                     pop        qword ptr [rsp + 0x50]
01c44 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01c4c 488f442458                     pop        qword ptr [rsp + 0x58]
01c51 48894424f8                     mov        qword ptr [rsp - 8], rax
01c56 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c5d 89442460                       mov        dword ptr [rsp + 0x60], eax
01c61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c66 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6b 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01c72 89442464                       mov        dword ptr [rsp + 0x64], eax
01c76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c80 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01c87 89442468                       mov        dword ptr [rsp + 0x68], eax
01c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c90 48ffb42498000000               push       qword ptr [rsp + 0x98]
01c98 488f842480000000               pop        qword ptr [rsp + 0x80]
01ca0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01cac 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01cb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cba 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cc1 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01cc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01cd9 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01ce0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cea 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01cf1 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cf8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfd 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01d05 488f842498000000               pop        qword ptr [rsp + 0x98]
01d0d 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01d15 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01d1d 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01d25 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01d2d 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d35 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01d3d 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01d44 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d4c 666690                         nop        
01d4f e80cafb5ff                     call       0x7f1e7f9d7d60
01d54 0f1f84004c1e000f               nop        dword ptr [rax + rax + 0xf001e4c]
01d5c be45ffffff                     mov        esi, 0xffffff45
01d61 48894424f8                     mov        qword ptr [rsp - 8], rax
01d66 8b442408                       mov        eax, dword ptr [rsp + 8]
01d6a 890424                         mov        dword ptr [rsp], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d7b 89442404                       mov        dword ptr [rsp + 4], eax
01d7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d84 48ff742410                     push       qword ptr [rsp + 0x10]
01d89 488f442408                     pop        qword ptr [rsp + 8]
01d8e 48ff742418                     push       qword ptr [rsp + 0x18]
01d93 488f442410                     pop        qword ptr [rsp + 0x10]
01d98 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01da1 89442418                       mov        dword ptr [rsp + 0x18], eax
01da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daa 48894424f8                     mov        qword ptr [rsp - 8], rax
01daf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01db3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01db7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbc 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dc5 89442420                       mov        dword ptr [rsp + 0x20], eax
01dc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dce 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dd7 89442424                       mov        dword ptr [rsp + 0x24], eax
01ddb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01de5 48ff742440                     push       qword ptr [rsp + 0x40]
01dea 488f442430                     pop        qword ptr [rsp + 0x30]
01def 48894424f8                     mov        qword ptr [rsp - 8], rax
01df4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01df8 89442438                       mov        dword ptr [rsp + 0x38], eax
01dfc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e01 48894424f8                     mov        qword ptr [rsp - 8], rax
01e06 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01e0a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e13 48ff742450                     push       qword ptr [rsp + 0x50]
01e18 488f442440                     pop        qword ptr [rsp + 0x40]
01e1d 48ff742458                     push       qword ptr [rsp + 0x58]
01e22 488f442448                     pop        qword ptr [rsp + 0x48]
01e27 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01e2f 488f442450                     pop        qword ptr [rsp + 0x50]
01e34 48894424f8                     mov        qword ptr [rsp - 8], rax
01e39 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01e40 89442458                       mov        dword ptr [rsp + 0x58], eax
01e44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e49 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01e55 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e63 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01e6a 89442460                       mov        dword ptr [rsp + 0x60], eax
01e6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e73 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e78 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01e84 89442464                       mov        dword ptr [rsp + 0x64], eax
01e88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e92 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e99 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01ea0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eaa 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01eb1 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01eb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec2 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01ec9 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ed0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed5 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01edd 488f842490000000               pop        qword ptr [rsp + 0x90]
01ee5 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01eed 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01ef4 666690                         nop        
01ef7 e864adb5ff                     call       0x7f1e7f9d7d60
01efc 0f1f8400f41f0010               nop        dword ptr [rax + rax + 0x10001ff4]
01f04 be45ffffff                     mov        esi, 0xffffff45
01f09 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0e 8b442408                       mov        eax, dword ptr [rsp + 8]
01f12 890424                         mov        dword ptr [rsp], eax
01f15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f23 89442404                       mov        dword ptr [rsp + 4], eax
01f27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2c 48ff742410                     push       qword ptr [rsp + 0x10]
01f31 488f442408                     pop        qword ptr [rsp + 8]
01f36 48ff742418                     push       qword ptr [rsp + 0x18]
01f3b 488f442410                     pop        qword ptr [rsp + 0x10]
01f40 48894424f8                     mov        qword ptr [rsp - 8], rax
01f45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f49 89442418                       mov        dword ptr [rsp + 0x18], eax
01f4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f52 48894424f8                     mov        qword ptr [rsp - 8], rax
01f57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f64 48894424f8                     mov        qword ptr [rsp - 8], rax
01f69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f6d 89442420                       mov        dword ptr [rsp + 0x20], eax
01f71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f76 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f7f 89442424                       mov        dword ptr [rsp + 0x24], eax
01f83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f8d 48ff742440                     push       qword ptr [rsp + 0x40]
01f92 488f442430                     pop        qword ptr [rsp + 0x30]
01f97 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01fa0 89442438                       mov        dword ptr [rsp + 0x38], eax
01fa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fae 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01fb2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbb 48ff742450                     push       qword ptr [rsp + 0x50]
01fc0 488f442440                     pop        qword ptr [rsp + 0x40]
01fc5 48ff742458                     push       qword ptr [rsp + 0x58]
01fca 488f442448                     pop        qword ptr [rsp + 0x48]
01fcf 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01fd7 488f442450                     pop        qword ptr [rsp + 0x50]
01fdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01fe8 89442458                       mov        dword ptr [rsp + 0x58], eax
01fec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01ffd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02001 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02006 48894424f8                     mov        qword ptr [rsp - 8], rax
0200b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02012 89442460                       mov        dword ptr [rsp + 0x60], eax
02016 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201b 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02020 48894424f8                     mov        qword ptr [rsp - 8], rax
02025 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0202c 89442464                       mov        dword ptr [rsp + 0x64], eax
02030 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02035 48894424f8                     mov        qword ptr [rsp - 8], rax
0203a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02041 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02048 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204d 48894424f8                     mov        qword ptr [rsp - 8], rax
02052 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02059 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02060 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02065 48894424f8                     mov        qword ptr [rsp - 8], rax
0206a 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02071 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02078 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0207d 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02085 488f842490000000               pop        qword ptr [rsp + 0x90]
0208d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02095 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0209d 6690                           nop        
0209f e8bcabb5ff                     call       0x7f1e7f9d7d60
020a4 0f1f84009c210011               nop        dword ptr [rax + rax + 0x1100219c]
020ac be3dffffff                     mov        esi, 0xffffff3d
020b1 48894424f8                     mov        qword ptr [rsp - 8], rax
020b6 8b442408                       mov        eax, dword ptr [rsp + 8]
020ba 890424                         mov        dword ptr [rsp], eax
020bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c2 48894424f8                     mov        qword ptr [rsp - 8], rax
020c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020cb 89442404                       mov        dword ptr [rsp + 4], eax
020cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d4 48ff742410                     push       qword ptr [rsp + 0x10]
020d9 488f442408                     pop        qword ptr [rsp + 8]
020de 48ff742418                     push       qword ptr [rsp + 0x18]
020e3 488f442410                     pop        qword ptr [rsp + 0x10]
020e8 48894424f8                     mov        qword ptr [rsp - 8], rax
020ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020f1 89442418                       mov        dword ptr [rsp + 0x18], eax
020f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fa 48894424f8                     mov        qword ptr [rsp - 8], rax
020ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02103 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02107 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210c 48894424f8                     mov        qword ptr [rsp - 8], rax
02111 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02115 89442420                       mov        dword ptr [rsp + 0x20], eax
02119 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211e 48894424f8                     mov        qword ptr [rsp - 8], rax
02123 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02127 89442424                       mov        dword ptr [rsp + 0x24], eax
0212b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02130 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02135 48ff742440                     push       qword ptr [rsp + 0x40]
0213a 488f442430                     pop        qword ptr [rsp + 0x30]
0213f 48894424f8                     mov        qword ptr [rsp - 8], rax
02144 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02148 89442438                       mov        dword ptr [rsp + 0x38], eax
0214c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02151 48894424f8                     mov        qword ptr [rsp - 8], rax
02156 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0215a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0215e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02163 48ff742450                     push       qword ptr [rsp + 0x50]
02168 488f442440                     pop        qword ptr [rsp + 0x40]
0216d 48ff742458                     push       qword ptr [rsp + 0x58]
02172 488f442448                     pop        qword ptr [rsp + 0x48]
02177 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0217f 488f442450                     pop        qword ptr [rsp + 0x50]
02184 48894424f8                     mov        qword ptr [rsp - 8], rax
02189 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02190 89442458                       mov        dword ptr [rsp + 0x58], eax
02194 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02199 48894424f8                     mov        qword ptr [rsp - 8], rax
0219e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
021a5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
021a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ae 48894424f8                     mov        qword ptr [rsp - 8], rax
021b3 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
021ba 89442460                       mov        dword ptr [rsp + 0x60], eax
021be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c3 48ffb42498000000               push       qword ptr [rsp + 0x98]
021cb 488f442478                     pop        qword ptr [rsp + 0x78]
021d0 48894424f8                     mov        qword ptr [rsp - 8], rax
021d5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
021dc 89442464                       mov        dword ptr [rsp + 0x64], eax
021e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e5 48894424f8                     mov        qword ptr [rsp - 8], rax
021ea 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021f1 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02202 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02209 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02210 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02215 48894424f8                     mov        qword ptr [rsp - 8], rax
0221a 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02221 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02228 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222d 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02235 488f842490000000               pop        qword ptr [rsp + 0x90]
0223d 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02245 488f842498000000               pop        qword ptr [rsp + 0x98]
0224d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02255 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0225d 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02265 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0226d 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02275 48894424f8                     mov        qword ptr [rsp - 8], rax
0227a 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02281 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02288 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228d 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
02294 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0229c 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
022a4 666690                         nop        
022a7 e8b4a9b5ff                     call       0x7f1e7f9d7d60
022ac 0f1f8400a4230012               nop        dword ptr [rax + rax + 0x120023a4]
022b4 be45ffffff                     mov        esi, 0xffffff45
022b9 48894424f8                     mov        qword ptr [rsp - 8], rax
022be 8b442408                       mov        eax, dword ptr [rsp + 8]
022c2 890424                         mov        dword ptr [rsp], eax
022c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ca 48894424f8                     mov        qword ptr [rsp - 8], rax
022cf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022d3 89442404                       mov        dword ptr [rsp + 4], eax
022d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dc 48ff742410                     push       qword ptr [rsp + 0x10]
022e1 488f442408                     pop        qword ptr [rsp + 8]
022e6 48ff742418                     push       qword ptr [rsp + 0x18]
022eb 488f442410                     pop        qword ptr [rsp + 0x10]
022f0 48894424f8                     mov        qword ptr [rsp - 8], rax
022f5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022f9 89442418                       mov        dword ptr [rsp + 0x18], eax
022fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02302 48894424f8                     mov        qword ptr [rsp - 8], rax
02307 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0230b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0230f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02314 48894424f8                     mov        qword ptr [rsp - 8], rax
02319 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0231d 89442420                       mov        dword ptr [rsp + 0x20], eax
02321 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02326 48894424f8                     mov        qword ptr [rsp - 8], rax
0232b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0232f 89442424                       mov        dword ptr [rsp + 0x24], eax
02333 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02338 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0233d 48ff742440                     push       qword ptr [rsp + 0x40]
02342 488f442430                     pop        qword ptr [rsp + 0x30]
02347 48894424f8                     mov        qword ptr [rsp - 8], rax
0234c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02350 89442438                       mov        dword ptr [rsp + 0x38], eax
02354 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02359 48894424f8                     mov        qword ptr [rsp - 8], rax
0235e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02362 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02366 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236b 48ff742450                     push       qword ptr [rsp + 0x50]
02370 488f442440                     pop        qword ptr [rsp + 0x40]
02375 48ff742458                     push       qword ptr [rsp + 0x58]
0237a 488f442448                     pop        qword ptr [rsp + 0x48]
0237f 894c2458                       mov        dword ptr [rsp + 0x58], ecx
02383 48ffb42498000000               push       qword ptr [rsp + 0x98]
0238b 488f442470                     pop        qword ptr [rsp + 0x70]
02390 48894424f8                     mov        qword ptr [rsp - 8], rax
02395 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0239c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
023a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a5 48894424f8                     mov        qword ptr [rsp - 8], rax
023aa 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
023b1 89442478                       mov        dword ptr [rsp + 0x78], eax
023b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ba 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
023c2 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
023ca 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023d2 90                             nop        
023d3 e888a8b5ff                     call       0x7f1e7f9d7d60
023d8 0f1f8400d0240013               nop        dword ptr [rax + rax + 0x130024d0]
023e0 be45ffffff                     mov        esi, 0xffffff45
023e5 48894424f8                     mov        qword ptr [rsp - 8], rax
023ea 8b442408                       mov        eax, dword ptr [rsp + 8]
023ee 890424                         mov        dword ptr [rsp], eax
023f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f6 48894424f8                     mov        qword ptr [rsp - 8], rax
023fb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023ff 89442404                       mov        dword ptr [rsp + 4], eax
02403 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02408 48ff742410                     push       qword ptr [rsp + 0x10]
0240d 488f442408                     pop        qword ptr [rsp + 8]
02412 48ff742418                     push       qword ptr [rsp + 0x18]
02417 488f442410                     pop        qword ptr [rsp + 0x10]
0241c 48894424f8                     mov        qword ptr [rsp - 8], rax
02421 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02425 89442418                       mov        dword ptr [rsp + 0x18], eax
02429 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242e 48894424f8                     mov        qword ptr [rsp - 8], rax
02433 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02437 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0243b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02440 48894424f8                     mov        qword ptr [rsp - 8], rax
02445 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02449 89442420                       mov        dword ptr [rsp + 0x20], eax
0244d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02452 48894424f8                     mov        qword ptr [rsp - 8], rax
02457 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0245b 89442424                       mov        dword ptr [rsp + 0x24], eax
0245f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02464 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02469 48ff742440                     push       qword ptr [rsp + 0x40]
0246e 488f442430                     pop        qword ptr [rsp + 0x30]
02473 48894424f8                     mov        qword ptr [rsp - 8], rax
02478 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0247c 89442438                       mov        dword ptr [rsp + 0x38], eax
02480 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02485 48894424f8                     mov        qword ptr [rsp - 8], rax
0248a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0248e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02492 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02497 48ff742450                     push       qword ptr [rsp + 0x50]
0249c 488f442440                     pop        qword ptr [rsp + 0x40]
024a1 48ff742458                     push       qword ptr [rsp + 0x58]
024a6 488f442448                     pop        qword ptr [rsp + 0x48]
024ab 894c2458                       mov        dword ptr [rsp + 0x58], ecx
024af 48894424f8                     mov        qword ptr [rsp - 8], rax
024b4 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
024bb 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c4 48894424f8                     mov        qword ptr [rsp - 8], rax
024c9 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
024d0 89442478                       mov        dword ptr [rsp + 0x78], eax
024d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d9 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024e1 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024e9 6690                           nop        
024eb e870a7b5ff                     call       0x7f1e7f9d7d60
024f0 0f1f8400e8250014               nop        dword ptr [rax + rax + 0x140025e8]
024f8 be45ffffff                     mov        esi, 0xffffff45
024fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02502 8b442408                       mov        eax, dword ptr [rsp + 8]
02506 890424                         mov        dword ptr [rsp], eax
02509 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250e 48894424f8                     mov        qword ptr [rsp - 8], rax
02513 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02517 89442404                       mov        dword ptr [rsp + 4], eax
0251b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02520 48ff742410                     push       qword ptr [rsp + 0x10]
02525 488f442408                     pop        qword ptr [rsp + 8]
0252a 48ff742418                     push       qword ptr [rsp + 0x18]
0252f 488f442410                     pop        qword ptr [rsp + 0x10]
02534 48894424f8                     mov        qword ptr [rsp - 8], rax
02539 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0253d 89442418                       mov        dword ptr [rsp + 0x18], eax
02541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02546 48894424f8                     mov        qword ptr [rsp - 8], rax
0254b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0254f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02558 48894424f8                     mov        qword ptr [rsp - 8], rax
0255d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02561 89442420                       mov        dword ptr [rsp + 0x20], eax
02565 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256a 48894424f8                     mov        qword ptr [rsp - 8], rax
0256f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02573 89442424                       mov        dword ptr [rsp + 0x24], eax
02577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02581 48ff742440                     push       qword ptr [rsp + 0x40]
02586 488f442430                     pop        qword ptr [rsp + 0x30]
0258b 48894424f8                     mov        qword ptr [rsp - 8], rax
02590 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02594 89442438                       mov        dword ptr [rsp + 0x38], eax
02598 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259d 48894424f8                     mov        qword ptr [rsp - 8], rax
025a2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
025a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025af 48ff742450                     push       qword ptr [rsp + 0x50]
025b4 488f442440                     pop        qword ptr [rsp + 0x40]
025b9 48ff742458                     push       qword ptr [rsp + 0x58]
025be 488f442448                     pop        qword ptr [rsp + 0x48]
025c3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
025cb 488f442450                     pop        qword ptr [rsp + 0x50]
025d0 48894424f8                     mov        qword ptr [rsp - 8], rax
025d5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
025dc 89442458                       mov        dword ptr [rsp + 0x58], eax
025e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ea 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
025f1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025fa 48894424f8                     mov        qword ptr [rsp - 8], rax
025ff 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02606 89442460                       mov        dword ptr [rsp + 0x60], eax
0260a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02617 488f442468                     pop        qword ptr [rsp + 0x68]
0261c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02624 488f442470                     pop        qword ptr [rsp + 0x70]
02629 48ffb42498000000               push       qword ptr [rsp + 0x98]
02631 488f442478                     pop        qword ptr [rsp + 0x78]
02636 48894424f8                     mov        qword ptr [rsp - 8], rax
0263b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02642 89442464                       mov        dword ptr [rsp + 0x64], eax
02646 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264b 48894424f8                     mov        qword ptr [rsp - 8], rax
02650 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02657 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0265e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02663 48894424f8                     mov        qword ptr [rsp - 8], rax
02668 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0266f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267b 48894424f8                     mov        qword ptr [rsp - 8], rax
02680 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02687 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0268e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02693 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0269b 488f842490000000               pop        qword ptr [rsp + 0x90]
026a3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026ab 488f842498000000               pop        qword ptr [rsp + 0x98]
026b3 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
026bb 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
026c3 e898a5b5ff                     call       0x7f1e7f9d7d60
026c8 0f1f8400c0270015               nop        dword ptr [rax + rax + 0x150027c0]
026d0 be45ffffff                     mov        esi, 0xffffff45
026d5 48894424f8                     mov        qword ptr [rsp - 8], rax
026da 8b442408                       mov        eax, dword ptr [rsp + 8]
026de 890424                         mov        dword ptr [rsp], eax
026e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e6 48894424f8                     mov        qword ptr [rsp - 8], rax
026eb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026ef 89442404                       mov        dword ptr [rsp + 4], eax
026f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f8 48ff742410                     push       qword ptr [rsp + 0x10]
026fd 488f442408                     pop        qword ptr [rsp + 8]
02702 48ff742418                     push       qword ptr [rsp + 0x18]
02707 488f442410                     pop        qword ptr [rsp + 0x10]
0270c 48894424f8                     mov        qword ptr [rsp - 8], rax
02711 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02715 89442418                       mov        dword ptr [rsp + 0x18], eax
02719 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271e 48894424f8                     mov        qword ptr [rsp - 8], rax
02723 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02727 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0272b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02730 48894424f8                     mov        qword ptr [rsp - 8], rax
02735 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02739 89442420                       mov        dword ptr [rsp + 0x20], eax
0273d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02742 48894424f8                     mov        qword ptr [rsp - 8], rax
02747 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0274b 89442424                       mov        dword ptr [rsp + 0x24], eax
0274f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02754 48ff742440                     push       qword ptr [rsp + 0x40]
02759 488f442430                     pop        qword ptr [rsp + 0x30]
0275e 48894424f8                     mov        qword ptr [rsp - 8], rax
02763 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02767 89442438                       mov        dword ptr [rsp + 0x38], eax
0276b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02770 48894424f8                     mov        qword ptr [rsp - 8], rax
02775 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02779 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0277d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02782 48ff742450                     push       qword ptr [rsp + 0x50]
02787 488f442440                     pop        qword ptr [rsp + 0x40]
0278c 48ff742458                     push       qword ptr [rsp + 0x58]
02791 488f442448                     pop        qword ptr [rsp + 0x48]
02796 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0279e 488f442450                     pop        qword ptr [rsp + 0x50]
027a3 48894424f8                     mov        qword ptr [rsp - 8], rax
027a8 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
027af 89442458                       mov        dword ptr [rsp + 0x58], eax
027b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b8 48894424f8                     mov        qword ptr [rsp - 8], rax
027bd 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
027c4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cd 48894424f8                     mov        qword ptr [rsp - 8], rax
027d2 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
027d9 89442460                       mov        dword ptr [rsp + 0x60], eax
027dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e2 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027ea 488f442468                     pop        qword ptr [rsp + 0x68]
027ef 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027f7 488f442470                     pop        qword ptr [rsp + 0x70]
027fc 48ffb42498000000               push       qword ptr [rsp + 0x98]
02804 488f442478                     pop        qword ptr [rsp + 0x78]
02809 48894424f8                     mov        qword ptr [rsp - 8], rax
0280e 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02815 89442464                       mov        dword ptr [rsp + 0x64], eax
02819 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281e 48894424f8                     mov        qword ptr [rsp - 8], rax
02823 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0282a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02831 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02836 48894424f8                     mov        qword ptr [rsp - 8], rax
0283b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02842 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02849 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284e 48894424f8                     mov        qword ptr [rsp - 8], rax
02853 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0285a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02861 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02866 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0286e 488f842490000000               pop        qword ptr [rsp + 0x90]
02876 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0287e 488f842498000000               pop        qword ptr [rsp + 0x98]
02886 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0288e 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02896 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0289e 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
028a6 90                             nop        
028a7 e8b4a3b5ff                     call       0x7f1e7f9d7d60
028ac 0f1f8400a4290016               nop        dword ptr [rax + rax + 0x160029a4]
028b4 4533d2                         xor        r10d, r10d
028b7 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
028bf e9fed8ffff                     jmp        0x7f1e7fe7b2c2
028c4 4533d2                         xor        r10d, r10d
028c7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028cc e917d9ffff                     jmp        0x7f1e7fe7b2e8
028d1 4533d2                         xor        r10d, r10d
028d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028d9 e937d9ffff                     jmp        0x7f1e7fe7b315
028de 4533d2                         xor        r10d, r10d
028e1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028e6 e952d9ffff                     jmp        0x7f1e7fe7b33d
028eb 4533d2                         xor        r10d, r10d
028ee 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028f3 e972d9ffff                     jmp        0x7f1e7fe7b36a
028f8 4533d2                         xor        r10d, r10d
028fb 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
02903 e98dd9ffff                     jmp        0x7f1e7fe7b395
02908 4533d2                         xor        r10d, r10d
0290b 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02913 e9b3d9ffff                     jmp        0x7f1e7fe7b3cb
02918 4533d2                         xor        r10d, r10d
0291b 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02923 e9ced9ffff                     jmp        0x7f1e7fe7b3f6
02928 bebeffffff                     mov        esi, 0xffffffbe
0292d 48894424f8                     mov        qword ptr [rsp - 8], rax
02932 8b442408                       mov        eax, dword ptr [rsp + 8]
02936 890424                         mov        dword ptr [rsp], eax
02939 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293e 48894424f8                     mov        qword ptr [rsp - 8], rax
02943 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02947 89442404                       mov        dword ptr [rsp + 4], eax
0294b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02950 48ff742410                     push       qword ptr [rsp + 0x10]
02955 488f442408                     pop        qword ptr [rsp + 8]
0295a 48ff742418                     push       qword ptr [rsp + 0x18]
0295f 488f442410                     pop        qword ptr [rsp + 0x10]
02964 48894424f8                     mov        qword ptr [rsp - 8], rax
02969 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0296d 89442418                       mov        dword ptr [rsp + 0x18], eax
02971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02976 48894424f8                     mov        qword ptr [rsp - 8], rax
0297b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0297f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02988 48894424f8                     mov        qword ptr [rsp - 8], rax
0298d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02991 89442420                       mov        dword ptr [rsp + 0x20], eax
02995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299a 48894424f8                     mov        qword ptr [rsp - 8], rax
0299f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
029a3 89442424                       mov        dword ptr [rsp + 0x24], eax
029a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
029b1 48ff742440                     push       qword ptr [rsp + 0x40]
029b6 488f442430                     pop        qword ptr [rsp + 0x30]
029bb 48894424f8                     mov        qword ptr [rsp - 8], rax
029c0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
029c4 89442438                       mov        dword ptr [rsp + 0x38], eax
029c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cd 48894424f8                     mov        qword ptr [rsp - 8], rax
029d2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
029d6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029df 48ff742450                     push       qword ptr [rsp + 0x50]
029e4 488f442440                     pop        qword ptr [rsp + 0x40]
029e9 48ff742458                     push       qword ptr [rsp + 0x58]
029ee 488f442448                     pop        qword ptr [rsp + 0x48]
029f3 48894424f8                     mov        qword ptr [rsp - 8], rax
029f8 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
029ff 89442458                       mov        dword ptr [rsp + 0x58], eax
02a03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a08 48894424f8                     mov        qword ptr [rsp - 8], rax
02a0d 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02a14 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a1d 6690                           nop        
02a1f e83ca2b5ff                     call       0x7f1e7f9d7d60
02a24 0f1f84001c2b0017               nop        dword ptr [rax + rax + 0x17002b1c]
02a2c be85ffffff                     mov        esi, 0xffffff85
02a31 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a35 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3a 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a3e 890424                         mov        dword ptr [rsp], eax
02a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a46 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a4f 89442404                       mov        dword ptr [rsp + 4], eax
02a53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a58 48894424f8                     mov        qword ptr [rsp - 8], rax
02a5d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a61 89442408                       mov        dword ptr [rsp + 8], eax
02a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a6f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a73 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a7c 48894424f8                     mov        qword ptr [rsp - 8], rax
02a81 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a85 89442410                       mov        dword ptr [rsp + 0x10], eax
02a89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8e 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a93 48ff742440                     push       qword ptr [rsp + 0x40]
02a98 488f442420                     pop        qword ptr [rsp + 0x20]
02a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02aa6 89442414                       mov        dword ptr [rsp + 0x14], eax
02aaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab4 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02ab8 89442428                       mov        dword ptr [rsp + 0x28], eax
02abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac6 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02acd 8944242c                       mov        dword ptr [rsp + 0x2c], eax
02ad1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad6 48894424f8                     mov        qword ptr [rsp - 8], rax
02adb 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02ae2 89442430                       mov        dword ptr [rsp + 0x30], eax
02ae6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
02af0 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02af7 89442434                       mov        dword ptr [rsp + 0x34], eax
02afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b00 48894424f8                     mov        qword ptr [rsp - 8], rax
02b05 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02b0c 89442448                       mov        dword ptr [rsp + 0x48], eax
02b10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b15 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
02b1d 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
02b25 6690                           nop        
02b27 e834a1b5ff                     call       0x7f1e7f9d7d60
02b2c 0f1f8400242c0018               nop        dword ptr [rax + rax + 0x18002c24]
02b34 bef6ffffff                     mov        esi, 0xfffffff6
02b39 6690                           nop        
02b3b e820a1b5ff                     call       0x7f1e7f9d7d60
02b40 0f1f8400382c0019               nop        dword ptr [rax + rax + 0x19002c38]
02b48 be5d000000                     mov        esi, 0x5d
02b4d 6690                           nop        
02b4f e80ca1b5ff                     call       0x7f1e7f9d7d60
02b54 0f1f84004c2c001a               nop        dword ptr [rax + rax + 0x1a002c4c]
02b5c bef6ffffff                     mov        esi, 0xfffffff6
02b61 8be9                           mov        ebp, ecx
02b63 e8f8a0b5ff                     call       0x7f1e7f9d7d60
02b68 0f1f8400602c001b               nop        dword ptr [rax + rax + 0x1b002c60]
02b70 bef6ffffff                     mov        esi, 0xfffffff6
02b75 418be8                         mov        ebp, r8d
02b78 666690                         nop        
02b7b e8e0a0b5ff                     call       0x7f1e7f9d7d60
02b80 0f1f8400782c001c               nop        dword ptr [rax + rax + 0x1c002c78]
02b88 bef6ffffff                     mov        esi, 0xfffffff6
02b8d 418be9                         mov        ebp, r9d
02b90 666690                         nop        
02b93 e8c8a0b5ff                     call       0x7f1e7f9d7d60
02b98 0f1f8400902c001d               nop        dword ptr [rax + rax + 0x1d002c90]
02ba0 eb00                           jmp        0x7f1e7fe7dca2
02ba2 488bf0                         mov        rsi, rax
02ba5 e9f2deffff                     jmp        0x7f1e7fe7bb9c
02baa 49bac4bbe77f1e7f0000           movabs     r10, 0x7f1e7fe7bbc4
02bb4 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02bbb e92052a9ff                     jmp        0x7f1e7f912ee0
02bc0 e8db1da8ff                     call       0x7f1e7f8ffaa0
02bc5 e964d4ffff                     jmp        0x7f1e7fe7b12e
02bca f4                             hlt        
02bcb f4                             hlt        
02bcc f4                             hlt        
02bcd f4                             hlt        
02bce f4                             hlt        
02bcf f4                             hlt        
