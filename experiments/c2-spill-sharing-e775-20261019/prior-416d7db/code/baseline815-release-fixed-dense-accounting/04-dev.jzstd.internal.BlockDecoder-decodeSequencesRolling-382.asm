00000 e8bbb94219                     call       0x7fd1dd29b740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec20010000                 sub        rsp, 0x120
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f859a2b0000                   jne        0x7fd1c3e72948
0002e 4c8baee8010000                 mov        r13, qword ptr [rsi + 0x1e8]
00035 4c8bb6d0010000                 mov        r14, qword ptr [rsi + 0x1d0]
0003c 448b96d0000000                 mov        r10d, dword ptr [rsi + 0xd0]
00043 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
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
00184 49ba00a737ddd17f0000           movabs     r10, 0x7fd1dd37a700
0018e 41ffd2                         call       r10
00191 0f1f840000000000               nop        dword ptr [rax + rax]
00199 4d85ed                         test       r13, r13
0019c 0f841a270000                   je         0x7fd1c3e7263c
001a2 458b5504                       mov        r10d, dword ptr [r13 + 4]
001a6 41c1ea0a                       shr        r10d, 0xa
001aa 4181fa05020000                 cmp        r10d, 0x205
001b1 0f857d280000                   jne        0x7fd1c3e727b4
001b7 4d8bd5                         mov        r10, r13
001ba 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
001c2 4d85f6                         test       r14, r14
001c5 0f8401270000                   je         0x7fd1c3e7264c
001cb 458b5e04                       mov        r11d, dword ptr [r14 + 4]
001cf 41c1eb0a                       shr        r11d, 0xa
001d3 4181fb0e080000                 cmp        r11d, 0x80e
001da 0f8554280000                   jne        0x7fd1c3e727b4
001e0 4d8bd6                         mov        r10, r14
001e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001ed 4d85d2                         test       r10, r10
001f0 0f84e3260000                   je         0x7fd1c3e72659
001f6 458b5204                       mov        r10d, dword ptr [r10 + 4]
001fa 41c1ea0a                       shr        r10d, 0xa
001fe 4181fa16060000                 cmp        r10d, 0x616
00205 0f8529280000                   jne        0x7fd1c3e727b4
0020b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00210 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00215 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0021a 4d85d2                         test       r10, r10
0021d 0f84c3260000                   je         0x7fd1c3e72666
00223 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00227 41c1eb0a                       shr        r11d, 0xa
0022b 4181fb1c060000                 cmp        r11d, 0x61c
00232 0f85fc270000                   jne        0x7fd1c3e727b4
00238 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0023d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00242 4d85d2                         test       r10, r10
00245 0f84a8260000                   je         0x7fd1c3e72673
0024b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0024f 41c1ea0a                       shr        r10d, 0xa
00253 4181fa1c060000                 cmp        r10d, 0x61c
0025a 0f85d4270000                   jne        0x7fd1c3e727b4
00260 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00265 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0026a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0026f 4d85d2                         test       r10, r10
00272 0f8488260000                   je         0x7fd1c3e72680
00278 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027c 41c1eb0a                       shr        r11d, 0xa
00280 4181fb1c060000                 cmp        r11d, 0x61c
00287 0f85a7270000                   jne        0x7fd1c3e727b4
0028d 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00295 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0029d 4d85d2                         test       r10, r10
002a0 0f846a260000                   je         0x7fd1c3e72690
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 41c1ea0a                       shr        r10d, 0xa
002ae 4181fa08020000                 cmp        r10d, 0x208
002b5 0f8579270000                   jne        0x7fd1c3e727b4
002bb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
002c3 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002cb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002d0 4d85d2                         test       r10, r10
002d3 0f8447260000                   je         0x7fd1c3e726a0
002d9 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002dd 41c1eb0a                       shr        r11d, 0xa
002e1 4181fb07020000                 cmp        r11d, 0x207
002e8 0f8546270000                   jne        0x7fd1c3e727b4
002ee 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
002f6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002fb 4d85d2                         test       r10, r10
002fe 0f842c260000                   je         0x7fd1c3e726b0
00304 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00309 4d85d2                         test       r10, r10
0030c 0f841e260000                   je         0x7fd1c3e726b0
00312 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0031a 4d85d2                         test       r10, r10
0031d 0f840d260000                   je         0x7fd1c3e726b0
00323 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032b 418b6a08                       mov        ebp, dword ptr [r10 + 8]
0032f 892c24                         mov        dword ptr [rsp], ebp
00332 4c8b942408010000               mov        r10, qword ptr [rsp + 0x108]
0033a 458b5208                       mov        r10d, dword ptr [r10 + 8]
0033e 458d5af9                       lea        r11d, [r10 - 7]
00342 4585db                         test       r11d, r11d
00345 0f8ce5250000                   jl         0x7fd1c3e726b0
0034b 4183c2f9                       add        r10d, -7
0034f 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00357 e96e020000                     jmp        0x7fd1c3e7034a
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
0039a 0f8dd4100000                   jge        0x7fd1c3e711f4
003a0 c462d3f79c2400010000           shrx       r11, qword ptr [rsp + 0x100], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942400010000               and        r10, qword ptr [rsp + 0x100]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d69120000                   jge        0x7fd1c3e713bc
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d30140000                   jge        0x7fd1c3e715ac
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8de9150000                   jge        0x7fd1c3e7178c
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
00476 0f8e5c0c0000                   jle        0x7fd1c3e70e58
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f5f170000                   jg         0x7fd1c3e71968
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8fcf180000                   jg         0x7fd1c3e71ae4
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f6a1a0000                   jg         0x7fd1c3e71c8c
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83021c0000                   jae        0x7fd1c3e71e34
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f83300a0000                   jae        0x7fd1c3e70c88
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc810                     mov        qword ptr [r8 + r9*8 + 0x10], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8dc1000000                   jge        0x7fd1c3e7033c
004fb 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
0050f 49c1e830                       shr        r8, 0x30
00513 458bdb                         mov        r11d, r11d
00516 418bf8                         mov        edi, r8d
00519 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00521 44038424e8000000               add        r8d, dword ptr [rsp + 0xe8]
00529 c4423bf7ca                     shrx       r9d, r10d, r8d
0052e 4103f9                         add        edi, r9d
00531 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
00538 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00540 c4423bf7ca                     shrx       r9d, r10d, r8d
00545 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0054d 4183f820                       cmp        r8d, 0x20
00551 0f8d651d0000                   jge        0x7fd1c3e7203c
00557 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0055f 49c1e830                       shr        r8, 0x30
00563 458bc0                         mov        r8d, r8d
00566 bf01000000                     mov        edi, 1
0056b 8b8c24e8000000                 mov        ecx, dword ptr [rsp + 0xe8]
00572 c4e271f7ff                     shlx       edi, edi, ecx
00577 ffcf                           dec        edi
00579 4123f9                         and        edi, r9d
0057c 4103fb                         add        edi, r11d
0057f 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00586 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
0058e 4183f920                       cmp        r9d, 0x20
00592 0f8d501e0000                   jge        0x7fd1c3e72168
00598 41b901000000                   mov        r9d, 1
0059e 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
005a6 c44221f7c9                     shlx       r9d, r9d, r11d
005ab 41ffc9                         dec        r9d
005ae 4523ca                         and        r9d, r10d
005b1 4503c8                         add        r9d, r8d
005b4 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
005bc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005c0 418502                         test       dword ptr [r10], eax
005c3 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005ca 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005d2 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005d7 0f8d89040000                   jge        0x7fd1c3e707e6
005dd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
005e2 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
005e6 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
005ed 238c24a0000000                 and        ecx, dword ptr [rsp + 0xa0]
005f4 458b5a08                       mov        r11d, dword ptr [r10 + 8]
005f8 413bcb                         cmp        ecx, r11d
005fb 0f8307050000                   jae        0x7fd1c3e70888
00601 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00606 418b7b18                       mov        edi, dword ptr [r11 + 0x18]
0060a 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00612 44238424a4000000               and        r8d, dword ptr [rsp + 0xa4]
0061a 448b5f08                       mov        r11d, dword ptr [rdi + 8]
0061e 4d8b54ca10                     mov        r10, qword ptr [r10 + rcx*8 + 0x10]
00623 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0062b 453bc3                         cmp        r8d, r11d
0062e 0f8310060000                   jae        0x7fd1c3e709c4
00634 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0063c 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
00640 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00648 44238c24a8000000               and        r9d, dword ptr [rsp + 0xa8]
00650 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00654 4e8b44c710                     mov        r8, qword ptr [rdi + r8*8 + 0x10]
00659 4c898424c0000000               mov        qword ptr [rsp + 0xc0], r8
00661 453bcb                         cmp        r9d, r11d
00664 0f8322070000                   jae        0x7fd1c3e70b0c
0066a 4f8b54ca10                     mov        r10, qword ptr [r10 + r9*8 + 0x10]
0066f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00677 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0067e ffc5                           inc        ebp
00680 896c2404                       mov        dword ptr [rsp + 4], ebp
00684 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00688 0f8d49040000                   jge        0x7fd1c3e70857
0068e 49c1ea28                       shr        r10, 0x28
00692 458bd2                         mov        r10d, r10d
00695 450fb6d2                       movzx      r10d, r10b
00699 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
006a1 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006a9 49c1ea28                       shr        r10, 0x28
006ad 458bda                         mov        r11d, r10d
006b0 450fb6cb                       movzx      r9d, r11b
006b4 44038c24e8000000               add        r9d, dword ptr [rsp + 0xe8]
006bc 4d8bd0                         mov        r10, r8
006bf 49c1ea28                       shr        r10, 0x28
006c3 458bd2                         mov        r10d, r10d
006c6 450fb6da                       movzx      r11d, r10b
006ca 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
006d2 4503cb                         add        r9d, r11d
006d5 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
006dd 41ba01000000                   mov        r10d, 1
006e3 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
006eb 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006f3 49c1ea20                       shr        r10, 0x20
006f7 458bda                         mov        r11d, r10d
006fa 410fb6eb                       movzx      ebp, r11b
006fe 89ac24ac000000                 mov        dword ptr [rsp + 0xac], ebp
00705 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0070d 49c1ea20                       shr        r10, 0x20
00711 458bd2                         mov        r10d, r10d
00714 410fb6ea                       movzx      ebp, r10b
00718 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
0071f 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00727 49c1ea20                       shr        r10, 0x20
0072b 458bda                         mov        r11d, r10d
0072e 410fb6eb                       movzx      ebp, r11b
00732 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00739 448bc5                         mov        r8d, ebp
0073c 44038424ac000000               add        r8d, dword ptr [rsp + 0xac]
00744 44038424f4000000               add        r8d, dword ptr [rsp + 0xf4]
0074c 44038424f0000000               add        r8d, dword ptr [rsp + 0xf0]
00754 4585c0                         test       r8d, r8d
00757 0f84f30a0000                   je         0x7fd1c3e70fd0
0075d 4183f83f                       cmp        r8d, 0x3f
00761 0f8fad0c0000                   jg         0x7fd1c3e71194
00767 41ba40000000                   mov        r10d, 0x40
0076d 442b542448                     sub        r10d, dword ptr [rsp + 0x48]
00772 453bc2                         cmp        r8d, r10d
00775 7e43                           jle        0x7fd1c3e7053a
00777 458bd8                         mov        r11d, r8d
0077a 452bda                         sub        r11d, r10d
0077d 4183fa40                       cmp        r10d, 0x40
00781 0f8d511f0000                   jge        0x7fd1c3e72458
00787 41b901000000                   mov        r9d, 1
0078d c442a9f7d1                     shlx       r10, r9, r10
00792 49ffca                         dec        r10
00795 4c23d3                         and        r10, rbx
00798 c4c2a1f7ca                     shlx       rcx, r10, r11
0079d 41b940000000                   mov        r9d, 0x40
007a3 452bcb                         sub        r9d, r11d
007a6 c462b3f7542440                 shrx       r10, qword ptr [rsp + 0x40], r9
007ad 490bca                         or         rcx, r10
007b0 48898c2400010000               mov        qword ptr [rsp + 0x100], rcx
007b8 eb2b                           jmp        0x7fd1c3e70565
007ba 452bd0                         sub        r10d, r8d
007bd c462abf7d3                     shrx       r10, rbx, r10
007c2 4183f840                       cmp        r8d, 0x40
007c6 0f8d341d0000                   jge        0x7fd1c3e72280
007cc 41bb01000000                   mov        r11d, 1
007d2 c442b9f7db                     shlx       r11, r11, r8
007d7 49ffcb                         dec        r11
007da 4d23da                         and        r11, r10
007dd 4c899c2400010000               mov        qword ptr [rsp + 0x100], r11
007e5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
007ea 4503d0                         add        r10d, r8d
007ed 4489542448                     mov        dword ptr [rsp + 0x48], r10d
007f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
007f7 4503d8                         add        r11d, r8d
007fa 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
007ff 4183fa40                       cmp        r10d, 0x40
00803 0f8c87fbffff                   jl         0x7fd1c3e70110
00809 458d5ac0                       lea        r11d, [r10 - 0x40]
0080d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00812 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00816 83c5f8                         add        ebp, -8
00819 896c2430                       mov        dword ptr [rsp + 0x30], ebp
0081d 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00821 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00825 83c1f0                         add        ecx, -0x10
00828 83f908                         cmp        ecx, 8
0082b 0f8ce7010000                   jl         0x7fd1c3e70798
00831 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00836 4183c2e8                       add        r10d, -0x18
0083a 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00842 0f8214fbffff                   jb         0x7fd1c3e700dc
00848 bee4ffffff                     mov        esi, 0xffffffe4
0084d 48894424f8                     mov        qword ptr [rsp - 8], rax
00852 8b442408                       mov        eax, dword ptr [rsp + 8]
00856 890424                         mov        dword ptr [rsp], eax
00859 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0085e 48894424f8                     mov        qword ptr [rsp - 8], rax
00863 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00867 89442404                       mov        dword ptr [rsp + 4], eax
0086b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00870 48ff742410                     push       qword ptr [rsp + 0x10]
00875 488f442408                     pop        qword ptr [rsp + 8]
0087a 48ff742418                     push       qword ptr [rsp + 0x18]
0087f 488f442410                     pop        qword ptr [rsp + 0x10]
00884 48894424f8                     mov        qword ptr [rsp - 8], rax
00889 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0088d 89442418                       mov        dword ptr [rsp + 0x18], eax
00891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00896 48894424f8                     mov        qword ptr [rsp - 8], rax
0089b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0089f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
008a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a8 48894424f8                     mov        qword ptr [rsp - 8], rax
008ad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008b1 89442420                       mov        dword ptr [rsp + 0x20], eax
008b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ba 48894424f8                     mov        qword ptr [rsp - 8], rax
008bf 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008c3 89442424                       mov        dword ptr [rsp + 0x24], eax
008c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008cc 48ff742440                     push       qword ptr [rsp + 0x40]
008d1 488f442428                     pop        qword ptr [rsp + 0x28]
008d6 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008db 48894424f8                     mov        qword ptr [rsp - 8], rax
008e0 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
008e4 89442434                       mov        dword ptr [rsp + 0x34], eax
008e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ed 48ff742450                     push       qword ptr [rsp + 0x50]
008f2 488f442438                     pop        qword ptr [rsp + 0x38]
008f7 48ff742458                     push       qword ptr [rsp + 0x58]
008fc 488f442440                     pop        qword ptr [rsp + 0x40]
00901 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00909 488f442448                     pop        qword ptr [rsp + 0x48]
0090e 48894424f8                     mov        qword ptr [rsp - 8], rax
00913 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0091a 89442450                       mov        dword ptr [rsp + 0x50], eax
0091e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00923 48894424f8                     mov        qword ptr [rsp - 8], rax
00928 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0092f 89442454                       mov        dword ptr [rsp + 0x54], eax
00933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00938 48894424f8                     mov        qword ptr [rsp - 8], rax
0093d 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00944 89442458                       mov        dword ptr [rsp + 0x58], eax
00948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0094d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00955 488f442460                     pop        qword ptr [rsp + 0x60]
0095a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00962 488f442468                     pop        qword ptr [rsp + 0x68]
00967 48ffb42498000000               push       qword ptr [rsp + 0x98]
0096f 488f442470                     pop        qword ptr [rsp + 0x70]
00974 48894424f8                     mov        qword ptr [rsp - 8], rax
00979 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00980 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00984 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00989 48894424f8                     mov        qword ptr [rsp - 8], rax
0098e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00995 89442478                       mov        dword ptr [rsp + 0x78], eax
00999 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099e 48894424f8                     mov        qword ptr [rsp - 8], rax
009a3 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
009aa 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b3 48894424f8                     mov        qword ptr [rsp - 8], rax
009b8 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
009bf 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009cb 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009d3 488f842488000000               pop        qword ptr [rsp + 0x88]
009db 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009e3 488f842490000000               pop        qword ptr [rsp + 0x90]
009eb 48894424f8                     mov        qword ptr [rsp - 8], rax
009f0 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
009f7 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
009fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a03 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00a0b e8d02fadff                     call       0x7fd1c3943760
00a10 0f1f8400080b0001               nop        dword ptr [rax + rax + 0x1000b08]
00a18 85c9                           test       ecx, ecx
00a1a 7f08                           jg         0x7fd1c3e707a4
00a1c 4533d2                         xor        r10d, r10d
00a1f e945f9ffff                     jmp        0x7fd1c3e700e9
00a24 8be9                           mov        ebp, ecx
00a26 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
00a2e 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a32 90                             nop        
00a33 e8a800aaff                     call       0x7fd1c3910860
00a38 0f1f8400300b0002               nop        dword ptr [rax + rax + 0x2000b30]
00a40 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a45 41c1e303                       shl        r11d, 3
00a49 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a4e 41c1e203                       shl        r10d, 3
00a52 452bd3                         sub        r10d, r11d
00a55 4181c2c0000000                 add        r10d, 0xc0
00a5c c462a9f7d0                     shlx       r10, rax, r10
00a61 e903f9ffff                     jmp        0x7fd1c3e700e9
00a66 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00a6e 4c03942498000000               add        r10, qword ptr [rsp + 0x98]
00a76 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a7b 4d3bd3                         cmp        r10, r11
00a7e 7e31                           jle        0x7fd1c3e70831
00a80 48be88367ce200000000           movabs     rsi, 0xe27c3688
00a8a 90                             nop        
00a8b e85000aaff                     call       0x7fd1c3910860
00a90 0f1f8400880b0003               nop        dword ptr [rax + rax + 0x3000b88]
00a98 4885c0                         test       rax, rax
00a9b 0f849b200000                   je         0x7fd1c3e728bc
00aa1 488bf0                         mov        rsi, rax
00aa4 4881c420010000                 add        rsp, 0x120
00aab 5d                             pop        rbp
00aac e92f82adff                     jmp        0x7fd1c3948a60
00ab1 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00ab6 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00abb 0f858f200000                   jne        0x7fd1c3e728d0
00ac1 418bc2                         mov        eax, r10d
00ac4 4881c420010000                 add        rsp, 0x120
00acb 5d                             pop        rbp
00acc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ad0 0f87dc200000                   ja         0x7fd1c3e72932
00ad6 c3                             ret        
00ad7 4533db                         xor        r11d, r11d
00ada 4533d2                         xor        r10d, r10d
00add 4533c9                         xor        r9d, r9d
00ae0 4533c0                         xor        r8d, r8d
00ae3 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00aeb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00af3 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
00afb 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
00b03 e9e3fbffff                     jmp        0x7fd1c3e7046b
00b08 bee4ffffff                     mov        esi, 0xffffffe4
00b0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00b12 8b442408                       mov        eax, dword ptr [rsp + 8]
00b16 890424                         mov        dword ptr [rsp], eax
00b19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b1e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b23 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b27 89442404                       mov        dword ptr [rsp + 4], eax
00b2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b30 48ff742410                     push       qword ptr [rsp + 0x10]
00b35 488f442408                     pop        qword ptr [rsp + 8]
00b3a 48ff742418                     push       qword ptr [rsp + 0x18]
00b3f 488f442410                     pop        qword ptr [rsp + 0x10]
00b44 48894424f8                     mov        qword ptr [rsp - 8], rax
00b49 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b4d 89442418                       mov        dword ptr [rsp + 0x18], eax
00b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b56 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b5f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b68 48894424f8                     mov        qword ptr [rsp - 8], rax
00b6d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b71 89442420                       mov        dword ptr [rsp + 0x20], eax
00b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b83 89442424                       mov        dword ptr [rsp + 0x24], eax
00b87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b8c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b91 48ff742440                     push       qword ptr [rsp + 0x40]
00b96 488f442430                     pop        qword ptr [rsp + 0x30]
00b9b 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00ba4 89442438                       mov        dword ptr [rsp + 0x38], eax
00ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bad 48894424f8                     mov        qword ptr [rsp - 8], rax
00bb2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00bb6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bbf 48ff742450                     push       qword ptr [rsp + 0x50]
00bc4 488f442440                     pop        qword ptr [rsp + 0x40]
00bc9 48ff742458                     push       qword ptr [rsp + 0x58]
00bce 488f442448                     pop        qword ptr [rsp + 0x48]
00bd3 48894424f8                     mov        qword ptr [rsp - 8], rax
00bd8 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00bdf 89442458                       mov        dword ptr [rsp + 0x58], eax
00be3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00be8 48894424f8                     mov        qword ptr [rsp - 8], rax
00bed 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00bf4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00bf8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bfd 48894424f8                     mov        qword ptr [rsp - 8], rax
00c02 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00c09 89442460                       mov        dword ptr [rsp + 0x60], eax
00c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c12 48894424f8                     mov        qword ptr [rsp - 8], rax
00c17 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00c1e 89442464                       mov        dword ptr [rsp + 0x64], eax
00c22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c27 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00c2f 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00c36 90                             nop        
00c37 e8a42dadff                     call       0x7fd1c3943760
00c3c 0f1f8400340d0004               nop        dword ptr [rax + rax + 0x4000d34]
00c44 bee4ffffff                     mov        esi, 0xffffffe4
00c49 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4e 8b442408                       mov        eax, dword ptr [rsp + 8]
00c52 890424                         mov        dword ptr [rsp], eax
00c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c63 89442404                       mov        dword ptr [rsp + 4], eax
00c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c6c 48ff742410                     push       qword ptr [rsp + 0x10]
00c71 488f442408                     pop        qword ptr [rsp + 8]
00c76 48ff742418                     push       qword ptr [rsp + 0x18]
00c7b 488f442410                     pop        qword ptr [rsp + 0x10]
00c80 48894424f8                     mov        qword ptr [rsp - 8], rax
00c85 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c89 89442418                       mov        dword ptr [rsp + 0x18], eax
00c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c92 48894424f8                     mov        qword ptr [rsp - 8], rax
00c97 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c9b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00cad 89442420                       mov        dword ptr [rsp + 0x20], eax
00cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cbb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00cbf 89442424                       mov        dword ptr [rsp + 0x24], eax
00cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ccd 48ff742440                     push       qword ptr [rsp + 0x40]
00cd2 488f442430                     pop        qword ptr [rsp + 0x30]
00cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
00cdc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00ce0 89442438                       mov        dword ptr [rsp + 0x38], eax
00ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cee 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00cf2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cfb 48ff742450                     push       qword ptr [rsp + 0x50]
00d00 488f442440                     pop        qword ptr [rsp + 0x40]
00d05 48ff742458                     push       qword ptr [rsp + 0x58]
00d0a 488f442448                     pop        qword ptr [rsp + 0x48]
00d0f 48894424f8                     mov        qword ptr [rsp - 8], rax
00d14 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00d1b 89442458                       mov        dword ptr [rsp + 0x58], eax
00d1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d24 48894424f8                     mov        qword ptr [rsp - 8], rax
00d29 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00d30 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d39 48894424f8                     mov        qword ptr [rsp - 8], rax
00d3e 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00d45 89442460                       mov        dword ptr [rsp + 0x60], eax
00d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4e 48ffb42498000000               push       qword ptr [rsp + 0x98]
00d56 488f442478                     pop        qword ptr [rsp + 0x78]
00d5b 48894424f8                     mov        qword ptr [rsp - 8], rax
00d60 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00d67 89442464                       mov        dword ptr [rsp + 0x64], eax
00d6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d70 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00d77 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00d7f e85c2cadff                     call       0x7fd1c3943760
00d84 0f1f84007c0e0005               nop        dword ptr [rax + rax + 0x5000e7c]
00d8c bee4ffffff                     mov        esi, 0xffffffe4
00d91 48894424f8                     mov        qword ptr [rsp - 8], rax
00d96 8b442408                       mov        eax, dword ptr [rsp + 8]
00d9a 890424                         mov        dword ptr [rsp], eax
00d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da2 48894424f8                     mov        qword ptr [rsp - 8], rax
00da7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00dab 89442404                       mov        dword ptr [rsp + 4], eax
00daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db4 48ff742410                     push       qword ptr [rsp + 0x10]
00db9 488f442408                     pop        qword ptr [rsp + 8]
00dbe 48ff742418                     push       qword ptr [rsp + 0x18]
00dc3 488f442410                     pop        qword ptr [rsp + 0x10]
00dc8 48894424f8                     mov        qword ptr [rsp - 8], rax
00dcd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00dd1 89442418                       mov        dword ptr [rsp + 0x18], eax
00dd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dda 48894424f8                     mov        qword ptr [rsp - 8], rax
00ddf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00de3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00de7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dec 48894424f8                     mov        qword ptr [rsp - 8], rax
00df1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00df5 89442420                       mov        dword ptr [rsp + 0x20], eax
00df9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dfe 48894424f8                     mov        qword ptr [rsp - 8], rax
00e03 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00e07 89442424                       mov        dword ptr [rsp + 0x24], eax
00e0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e10 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00e15 48ff742440                     push       qword ptr [rsp + 0x40]
00e1a 488f442430                     pop        qword ptr [rsp + 0x30]
00e1f 48894424f8                     mov        qword ptr [rsp - 8], rax
00e24 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00e28 89442438                       mov        dword ptr [rsp + 0x38], eax
00e2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e31 48894424f8                     mov        qword ptr [rsp - 8], rax
00e36 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00e3a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e43 48ff742450                     push       qword ptr [rsp + 0x50]
00e48 488f442440                     pop        qword ptr [rsp + 0x40]
00e4d 48ff742458                     push       qword ptr [rsp + 0x58]
00e52 488f442448                     pop        qword ptr [rsp + 0x48]
00e57 48894424f8                     mov        qword ptr [rsp - 8], rax
00e5c 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00e63 89442458                       mov        dword ptr [rsp + 0x58], eax
00e67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e71 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00e78 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e81 48894424f8                     mov        qword ptr [rsp - 8], rax
00e86 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00e8d 89442460                       mov        dword ptr [rsp + 0x60], eax
00e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e96 48ffb42498000000               push       qword ptr [rsp + 0x98]
00e9e 488f442478                     pop        qword ptr [rsp + 0x78]
00ea3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea8 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00eaf 89442464                       mov        dword ptr [rsp + 0x64], eax
00eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ebd 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00ec4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00ecb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ed0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed5 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00edc 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ee3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee8 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ef0 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00ef8 666690                         nop        
00efb e8e02aadff                     call       0x7fd1c3943760
00f00 0f1f8400f80f0006               nop        dword ptr [rax + rax + 0x6000ff8]
00f08 bee4ffffff                     mov        esi, 0xffffffe4
00f0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f12 8b442408                       mov        eax, dword ptr [rsp + 8]
00f16 890424                         mov        dword ptr [rsp], eax
00f19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f23 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00f27 89442404                       mov        dword ptr [rsp + 4], eax
00f2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f30 48ff742410                     push       qword ptr [rsp + 0x10]
00f35 488f442408                     pop        qword ptr [rsp + 8]
00f3a 48ff742418                     push       qword ptr [rsp + 0x18]
00f3f 488f442410                     pop        qword ptr [rsp + 0x10]
00f44 48894424f8                     mov        qword ptr [rsp - 8], rax
00f49 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00f4d 89442418                       mov        dword ptr [rsp + 0x18], eax
00f51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f56 48894424f8                     mov        qword ptr [rsp - 8], rax
00f5b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00f5f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00f63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f68 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f71 89442420                       mov        dword ptr [rsp + 0x20], eax
00f75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f83 89442424                       mov        dword ptr [rsp + 0x24], eax
00f87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f91 48ff742440                     push       qword ptr [rsp + 0x40]
00f96 488f442430                     pop        qword ptr [rsp + 0x30]
00f9b 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00fa4 89442438                       mov        dword ptr [rsp + 0x38], eax
00fa8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fad 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00fb6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00fba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fbf 48ff742450                     push       qword ptr [rsp + 0x50]
00fc4 488f442440                     pop        qword ptr [rsp + 0x40]
00fc9 48ff742458                     push       qword ptr [rsp + 0x58]
00fce 488f442448                     pop        qword ptr [rsp + 0x48]
00fd3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00fdb 488f442450                     pop        qword ptr [rsp + 0x50]
00fe0 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00fec 89442458                       mov        dword ptr [rsp + 0x58], eax
00ff0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff5 48894424f8                     mov        qword ptr [rsp - 8], rax
00ffa 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01001 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0100a 48894424f8                     mov        qword ptr [rsp - 8], rax
0100f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01016 89442460                       mov        dword ptr [rsp + 0x60], eax
0101a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0101f 48ffb42498000000               push       qword ptr [rsp + 0x98]
01027 488f442478                     pop        qword ptr [rsp + 0x78]
0102c 48894424f8                     mov        qword ptr [rsp - 8], rax
01031 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01038 89442464                       mov        dword ptr [rsp + 0x64], eax
0103c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01041 48894424f8                     mov        qword ptr [rsp - 8], rax
01046 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0104d 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01054 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01059 48894424f8                     mov        qword ptr [rsp - 8], rax
0105e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01065 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0106c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01071 48894424f8                     mov        qword ptr [rsp - 8], rax
01076 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0107d 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01084 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01089 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01091 488f842490000000               pop        qword ptr [rsp + 0x90]
01099 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010a1 488f842498000000               pop        qword ptr [rsp + 0x98]
010a9 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
010b1 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
010b9 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
010c1 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
010c9 6690                           nop        
010cb e81029adff                     call       0x7fd1c3943760
010d0 0f1f8400c8110007               nop        dword ptr [rax + rax + 0x70011c8]
010d8 4533c0                         xor        r8d, r8d
010db 4d3bc8                         cmp        r9, r8
010de bdffffffff                     mov        ebp, 0xffffffff
010e3 7c08                           jl         0x7fd1c3e70e6d
010e5 400f95c5                       setne      bpl
010e9 400fb6ed                       movzx      ebp, bpl
010ed be45ffffff                     mov        esi, 0xffffff45
010f2 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
010f7 48ff742440                     push       qword ptr [rsp + 0x40]
010fc 488f442438                     pop        qword ptr [rsp + 0x38]
01101 48894424f8                     mov        qword ptr [rsp - 8], rax
01106 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0110a 89442440                       mov        dword ptr [rsp + 0x40], eax
0110e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01113 48894424f8                     mov        qword ptr [rsp - 8], rax
01118 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0111c 89442444                       mov        dword ptr [rsp + 0x44], eax
01120 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01125 48ff742450                     push       qword ptr [rsp + 0x50]
0112a 488f442448                     pop        qword ptr [rsp + 0x48]
0112f 48ff742458                     push       qword ptr [rsp + 0x58]
01134 488f442450                     pop        qword ptr [rsp + 0x50]
01139 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01141 488f442458                     pop        qword ptr [rsp + 0x58]
01146 48894424f8                     mov        qword ptr [rsp - 8], rax
0114b 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01152 89442460                       mov        dword ptr [rsp + 0x60], eax
01156 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0115b 48894424f8                     mov        qword ptr [rsp - 8], rax
01160 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01167 89442464                       mov        dword ptr [rsp + 0x64], eax
0116b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01170 48894424f8                     mov        qword ptr [rsp - 8], rax
01175 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0117c 89442468                       mov        dword ptr [rsp + 0x68], eax
01180 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01185 48ffb42498000000               push       qword ptr [rsp + 0x98]
0118d 488f842480000000               pop        qword ptr [rsp + 0x80]
01195 48894424f8                     mov        qword ptr [rsp - 8], rax
0119a 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
011a1 8944246c                       mov        dword ptr [rsp + 0x6c], eax
011a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011aa 48894424f8                     mov        qword ptr [rsp - 8], rax
011af 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
011b6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
011bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c2 48894424f8                     mov        qword ptr [rsp - 8], rax
011c7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
011ce 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
011d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011da 48894424f8                     mov        qword ptr [rsp - 8], rax
011df 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
011e6 89842490000000                 mov        dword ptr [rsp + 0x90], eax
011ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f2 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
011fa 488f842498000000               pop        qword ptr [rsp + 0x98]
01202 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0120a 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01212 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
0121a 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01222 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0122a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01232 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01239 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01241 6690                           nop        
01243 e89827adff                     call       0x7fd1c3943760
01248 0f1f840040130008               nop        dword ptr [rax + rax + 0x8001340]
01250 be45ffffff                     mov        esi, 0xffffff45
01255 48894424f8                     mov        qword ptr [rsp - 8], rax
0125a 8b442408                       mov        eax, dword ptr [rsp + 8]
0125e 890424                         mov        dword ptr [rsp], eax
01261 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01266 48894424f8                     mov        qword ptr [rsp - 8], rax
0126b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0126f 89442404                       mov        dword ptr [rsp + 4], eax
01273 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01278 48ff742410                     push       qword ptr [rsp + 0x10]
0127d 488f442408                     pop        qword ptr [rsp + 8]
01282 48ff742418                     push       qword ptr [rsp + 0x18]
01287 488f442410                     pop        qword ptr [rsp + 0x10]
0128c 48894424f8                     mov        qword ptr [rsp - 8], rax
01291 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01295 89442418                       mov        dword ptr [rsp + 0x18], eax
01299 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129e 48894424f8                     mov        qword ptr [rsp - 8], rax
012a3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
012a7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
012ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b0 48894424f8                     mov        qword ptr [rsp - 8], rax
012b5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012b9 89442420                       mov        dword ptr [rsp + 0x20], eax
012bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c2 48894424f8                     mov        qword ptr [rsp - 8], rax
012c7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
012cb 89442424                       mov        dword ptr [rsp + 0x24], eax
012cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
012d9 48ff742440                     push       qword ptr [rsp + 0x40]
012de 488f442430                     pop        qword ptr [rsp + 0x30]
012e3 48894424f8                     mov        qword ptr [rsp - 8], rax
012e8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
012ec 89442438                       mov        dword ptr [rsp + 0x38], eax
012f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f5 48894424f8                     mov        qword ptr [rsp - 8], rax
012fa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012fe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01302 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01307 48ff742450                     push       qword ptr [rsp + 0x50]
0130c 488f442440                     pop        qword ptr [rsp + 0x40]
01311 48ff742458                     push       qword ptr [rsp + 0x58]
01316 488f442448                     pop        qword ptr [rsp + 0x48]
0131b 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01323 488f442450                     pop        qword ptr [rsp + 0x50]
01328 48894424f8                     mov        qword ptr [rsp - 8], rax
0132d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01334 89442458                       mov        dword ptr [rsp + 0x58], eax
01338 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133d 48894424f8                     mov        qword ptr [rsp - 8], rax
01342 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01349 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0134d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01352 48894424f8                     mov        qword ptr [rsp - 8], rax
01357 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0135e 89442460                       mov        dword ptr [rsp + 0x60], eax
01362 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01367 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0136f 488f442468                     pop        qword ptr [rsp + 0x68]
01374 48ffb42498000000               push       qword ptr [rsp + 0x98]
0137c 488f442478                     pop        qword ptr [rsp + 0x78]
01381 48894424f8                     mov        qword ptr [rsp - 8], rax
01386 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0138d 89442464                       mov        dword ptr [rsp + 0x64], eax
01391 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01396 48894424f8                     mov        qword ptr [rsp - 8], rax
0139b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
013a2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
013a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ae 48894424f8                     mov        qword ptr [rsp - 8], rax
013b3 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
013ba 89842484000000                 mov        dword ptr [rsp + 0x84], eax
013c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c6 48894424f8                     mov        qword ptr [rsp - 8], rax
013cb 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
013d2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
013d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013de 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
013e6 488f842490000000               pop        qword ptr [rsp + 0x90]
013ee 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
013f6 488f842498000000               pop        qword ptr [rsp + 0x98]
013fe 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01406 90                             nop        
01407 e8d425adff                     call       0x7fd1c3943760
0140c 0f1f840004150009               nop        dword ptr [rax + rax + 0x9001504]
01414 be45ffffff                     mov        esi, 0xffffff45
01419 48894424f8                     mov        qword ptr [rsp - 8], rax
0141e 8b442408                       mov        eax, dword ptr [rsp + 8]
01422 890424                         mov        dword ptr [rsp], eax
01425 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142a 48894424f8                     mov        qword ptr [rsp - 8], rax
0142f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01433 89442404                       mov        dword ptr [rsp + 4], eax
01437 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143c 48ff742410                     push       qword ptr [rsp + 0x10]
01441 488f442408                     pop        qword ptr [rsp + 8]
01446 48ff742418                     push       qword ptr [rsp + 0x18]
0144b 488f442410                     pop        qword ptr [rsp + 0x10]
01450 48894424f8                     mov        qword ptr [rsp - 8], rax
01455 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01459 89442418                       mov        dword ptr [rsp + 0x18], eax
0145d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01462 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01467 e87425adff                     call       0x7fd1c3943760
0146c 0f1f84006415000a               nop        dword ptr [rax + rax + 0xa001564]
01474 be45ffffff                     mov        esi, 0xffffff45
01479 48894424f8                     mov        qword ptr [rsp - 8], rax
0147e 8b442408                       mov        eax, dword ptr [rsp + 8]
01482 890424                         mov        dword ptr [rsp], eax
01485 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148a 48894424f8                     mov        qword ptr [rsp - 8], rax
0148f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01493 89442404                       mov        dword ptr [rsp + 4], eax
01497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149c 48ff742410                     push       qword ptr [rsp + 0x10]
014a1 488f442408                     pop        qword ptr [rsp + 8]
014a6 48ff742418                     push       qword ptr [rsp + 0x18]
014ab 488f442410                     pop        qword ptr [rsp + 0x10]
014b0 48894424f8                     mov        qword ptr [rsp - 8], rax
014b5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
014b9 89442418                       mov        dword ptr [rsp + 0x18], eax
014bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c2 48894424f8                     mov        qword ptr [rsp - 8], rax
014c7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
014cb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
014cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d4 48894424f8                     mov        qword ptr [rsp - 8], rax
014d9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014dd 89442420                       mov        dword ptr [rsp + 0x20], eax
014e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
014ef 89442424                       mov        dword ptr [rsp + 0x24], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
014fd 48ff742440                     push       qword ptr [rsp + 0x40]
01502 488f442430                     pop        qword ptr [rsp + 0x30]
01507 48894424f8                     mov        qword ptr [rsp - 8], rax
0150c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01510 89442438                       mov        dword ptr [rsp + 0x38], eax
01514 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01519 48894424f8                     mov        qword ptr [rsp - 8], rax
0151e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01522 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152b 48ff742450                     push       qword ptr [rsp + 0x50]
01530 488f442440                     pop        qword ptr [rsp + 0x40]
01535 48ff742458                     push       qword ptr [rsp + 0x58]
0153a 488f442448                     pop        qword ptr [rsp + 0x48]
0153f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01547 488f442450                     pop        qword ptr [rsp + 0x50]
0154c 48894424f8                     mov        qword ptr [rsp - 8], rax
01551 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01558 89442458                       mov        dword ptr [rsp + 0x58], eax
0155c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01561 48894424f8                     mov        qword ptr [rsp - 8], rax
01566 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0156d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01571 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01576 48894424f8                     mov        qword ptr [rsp - 8], rax
0157b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01582 89442460                       mov        dword ptr [rsp + 0x60], eax
01586 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01593 488f442468                     pop        qword ptr [rsp + 0x68]
01598 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
015a0 488f442470                     pop        qword ptr [rsp + 0x70]
015a5 48ffb42498000000               push       qword ptr [rsp + 0x98]
015ad 488f442478                     pop        qword ptr [rsp + 0x78]
015b2 48894424f8                     mov        qword ptr [rsp - 8], rax
015b7 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
015be 89442464                       mov        dword ptr [rsp + 0x64], eax
015c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c7 48894424f8                     mov        qword ptr [rsp - 8], rax
015cc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
015d3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 48894424f8                     mov        qword ptr [rsp - 8], rax
015e4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
015eb 89842484000000                 mov        dword ptr [rsp + 0x84], eax
015f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f7 48894424f8                     mov        qword ptr [rsp - 8], rax
015fc 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01603 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0160a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160f 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01617 488f842490000000               pop        qword ptr [rsp + 0x90]
0161f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01627 488f842498000000               pop        qword ptr [rsp + 0x98]
0162f e8ac23adff                     call       0x7fd1c3943760
01634 0f1f84002c17000b               nop        dword ptr [rax + rax + 0xb00172c]
0163c be45ffffff                     mov        esi, 0xffffff45
01641 48894424f8                     mov        qword ptr [rsp - 8], rax
01646 8b442408                       mov        eax, dword ptr [rsp + 8]
0164a 890424                         mov        dword ptr [rsp], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0165b 89442404                       mov        dword ptr [rsp + 4], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48ff742410                     push       qword ptr [rsp + 0x10]
01669 488f442408                     pop        qword ptr [rsp + 8]
0166e 48ff742418                     push       qword ptr [rsp + 0x18]
01673 488f442410                     pop        qword ptr [rsp + 0x10]
01678 48894424f8                     mov        qword ptr [rsp - 8], rax
0167d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01681 89442418                       mov        dword ptr [rsp + 0x18], eax
01685 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168a 48894424f8                     mov        qword ptr [rsp - 8], rax
0168f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01693 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01697 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169c 48894424f8                     mov        qword ptr [rsp - 8], rax
016a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016a5 89442420                       mov        dword ptr [rsp + 0x20], eax
016a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ae 48894424f8                     mov        qword ptr [rsp - 8], rax
016b3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
016b7 89442424                       mov        dword ptr [rsp + 0x24], eax
016bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
016c5 48ff742440                     push       qword ptr [rsp + 0x40]
016ca 488f442430                     pop        qword ptr [rsp + 0x30]
016cf 48894424f8                     mov        qword ptr [rsp - 8], rax
016d4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016d8 89442438                       mov        dword ptr [rsp + 0x38], eax
016dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e1 48894424f8                     mov        qword ptr [rsp - 8], rax
016e6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
016ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f3 48ff742450                     push       qword ptr [rsp + 0x50]
016f8 488f442440                     pop        qword ptr [rsp + 0x40]
016fd 48ff742458                     push       qword ptr [rsp + 0x58]
01702 488f442448                     pop        qword ptr [rsp + 0x48]
01707 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0170f 488f442450                     pop        qword ptr [rsp + 0x50]
01714 48894424f8                     mov        qword ptr [rsp - 8], rax
01719 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01720 89442458                       mov        dword ptr [rsp + 0x58], eax
01724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01729 48894424f8                     mov        qword ptr [rsp - 8], rax
0172e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01735 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01739 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173e 48894424f8                     mov        qword ptr [rsp - 8], rax
01743 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0174a 89442460                       mov        dword ptr [rsp + 0x60], eax
0174e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01753 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0175b 488f442468                     pop        qword ptr [rsp + 0x68]
01760 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01768 488f442470                     pop        qword ptr [rsp + 0x70]
0176d 48ffb42498000000               push       qword ptr [rsp + 0x98]
01775 488f442478                     pop        qword ptr [rsp + 0x78]
0177a 48894424f8                     mov        qword ptr [rsp - 8], rax
0177f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01786 89442464                       mov        dword ptr [rsp + 0x64], eax
0178a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178f 48894424f8                     mov        qword ptr [rsp - 8], rax
01794 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0179b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
017a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a7 48894424f8                     mov        qword ptr [rsp - 8], rax
017ac 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
017b3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
017ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bf 48894424f8                     mov        qword ptr [rsp - 8], rax
017c4 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
017cb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
017d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d7 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
017df 488f842490000000               pop        qword ptr [rsp + 0x90]
017e7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
017ef 488f842498000000               pop        qword ptr [rsp + 0x98]
017f7 48894424f8                     mov        qword ptr [rsp - 8], rax
017fc 8b8424f4000000                 mov        eax, dword ptr [rsp + 0xf4]
01803 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
0180a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180f 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01817 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0181f e8bc21adff                     call       0x7fd1c3943760
01824 0f1f84001c19000c               nop        dword ptr [rax + rax + 0xc00191c]
0182c be45ffffff                     mov        esi, 0xffffff45
01831 48894424f8                     mov        qword ptr [rsp - 8], rax
01836 8b442408                       mov        eax, dword ptr [rsp + 8]
0183a 890424                         mov        dword ptr [rsp], eax
0183d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01842 48894424f8                     mov        qword ptr [rsp - 8], rax
01847 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0184b 89442404                       mov        dword ptr [rsp + 4], eax
0184f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01854 48ff742410                     push       qword ptr [rsp + 0x10]
01859 488f442408                     pop        qword ptr [rsp + 8]
0185e 48ff742418                     push       qword ptr [rsp + 0x18]
01863 488f442410                     pop        qword ptr [rsp + 0x10]
01868 48894424f8                     mov        qword ptr [rsp - 8], rax
0186d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01871 89442418                       mov        dword ptr [rsp + 0x18], eax
01875 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187a 48894424f8                     mov        qword ptr [rsp - 8], rax
0187f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01883 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48894424f8                     mov        qword ptr [rsp - 8], rax
01891 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01895 89442420                       mov        dword ptr [rsp + 0x20], eax
01899 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189e 48894424f8                     mov        qword ptr [rsp - 8], rax
018a3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
018a7 89442424                       mov        dword ptr [rsp + 0x24], eax
018ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
018b5 48ff742440                     push       qword ptr [rsp + 0x40]
018ba 488f442430                     pop        qword ptr [rsp + 0x30]
018bf 48894424f8                     mov        qword ptr [rsp - 8], rax
018c4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018c8 89442438                       mov        dword ptr [rsp + 0x38], eax
018cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d1 48894424f8                     mov        qword ptr [rsp - 8], rax
018d6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018da 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e3 48ff742450                     push       qword ptr [rsp + 0x50]
018e8 488f442440                     pop        qword ptr [rsp + 0x40]
018ed 48ff742458                     push       qword ptr [rsp + 0x58]
018f2 488f442448                     pop        qword ptr [rsp + 0x48]
018f7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
018ff 488f442450                     pop        qword ptr [rsp + 0x50]
01904 48894424f8                     mov        qword ptr [rsp - 8], rax
01909 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01910 89442458                       mov        dword ptr [rsp + 0x58], eax
01914 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01919 48894424f8                     mov        qword ptr [rsp - 8], rax
0191e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01925 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0193a 89442460                       mov        dword ptr [rsp + 0x60], eax
0193e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01943 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0194b 488f442468                     pop        qword ptr [rsp + 0x68]
01950 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01958 488f442470                     pop        qword ptr [rsp + 0x70]
0195d 48ffb42498000000               push       qword ptr [rsp + 0x98]
01965 488f442478                     pop        qword ptr [rsp + 0x78]
0196a 48894424f8                     mov        qword ptr [rsp - 8], rax
0196f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01976 89442464                       mov        dword ptr [rsp + 0x64], eax
0197a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197f 48894424f8                     mov        qword ptr [rsp - 8], rax
01984 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0198b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01992 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01997 48894424f8                     mov        qword ptr [rsp - 8], rax
0199c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
019a3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
019aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019af 48894424f8                     mov        qword ptr [rsp - 8], rax
019b4 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
019bb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
019c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c7 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
019cf 488f842490000000               pop        qword ptr [rsp + 0x90]
019d7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019df 488f842498000000               pop        qword ptr [rsp + 0x98]
019e7 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019ef 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019f7 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019ff e8dc1fadff                     call       0x7fd1c3943760
01a04 0f1f8400fc1a000d               nop        dword ptr [rax + rax + 0xd001afc]
01a0c be45ffffff                     mov        esi, 0xffffff45
01a11 48894424f8                     mov        qword ptr [rsp - 8], rax
01a16 8b442408                       mov        eax, dword ptr [rsp + 8]
01a1a 890424                         mov        dword ptr [rsp], eax
01a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a2b 89442404                       mov        dword ptr [rsp + 4], eax
01a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a34 48ff742410                     push       qword ptr [rsp + 0x10]
01a39 488f442408                     pop        qword ptr [rsp + 8]
01a3e 48ff742418                     push       qword ptr [rsp + 0x18]
01a43 488f442410                     pop        qword ptr [rsp + 0x10]
01a48 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a51 89442418                       mov        dword ptr [rsp + 0x18], eax
01a55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a75 89442420                       mov        dword ptr [rsp + 0x20], eax
01a79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a87 89442424                       mov        dword ptr [rsp + 0x24], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a95 48ff742440                     push       qword ptr [rsp + 0x40]
01a9a 488f442430                     pop        qword ptr [rsp + 0x30]
01a9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01aa8 89442438                       mov        dword ptr [rsp + 0x38], eax
01aac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01aba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01abe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac3 48ff742450                     push       qword ptr [rsp + 0x50]
01ac8 488f442440                     pop        qword ptr [rsp + 0x40]
01acd 48ff742458                     push       qword ptr [rsp + 0x58]
01ad2 488f442448                     pop        qword ptr [rsp + 0x48]
01ad7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01adf 488f442450                     pop        qword ptr [rsp + 0x50]
01ae4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01af0 89442458                       mov        dword ptr [rsp + 0x58], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 48894424f8                     mov        qword ptr [rsp - 8], rax
01afe 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01b05 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b13 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01b1a 89442460                       mov        dword ptr [rsp + 0x60], eax
01b1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b23 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b2b 488f442468                     pop        qword ptr [rsp + 0x68]
01b30 48ffb42498000000               push       qword ptr [rsp + 0x98]
01b38 488f442478                     pop        qword ptr [rsp + 0x78]
01b3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b42 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01b49 89442464                       mov        dword ptr [rsp + 0x64], eax
01b4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b52 48894424f8                     mov        qword ptr [rsp - 8], rax
01b57 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b5e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b76 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b82 48894424f8                     mov        qword ptr [rsp - 8], rax
01b87 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b8e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9a 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01ba2 488f842490000000               pop        qword ptr [rsp + 0x90]
01baa 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bb2 488f842498000000               pop        qword ptr [rsp + 0x98]
01bba 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bc2 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bca 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bd1 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bd9 6690                           nop        
01bdb e8001eadff                     call       0x7fd1c3943760
01be0 0f1f8400d81c000e               nop        dword ptr [rax + rax + 0xe001cd8]
01be8 be45ffffff                     mov        esi, 0xffffff45
01bed 41b8ffffff7f                   mov        r8d, 0x7fffffff
01bf3 4d3bc8                         cmp        r9, r8
01bf6 bdffffffff                     mov        ebp, 0xffffffff
01bfb 7c08                           jl         0x7fd1c3e71985
01bfd 400f95c5                       setne      bpl
01c01 400fb6ed                       movzx      ebp, bpl
01c05 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c0a 48ff742440                     push       qword ptr [rsp + 0x40]
01c0f 488f442438                     pop        qword ptr [rsp + 0x38]
01c14 48894424f8                     mov        qword ptr [rsp - 8], rax
01c19 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c1d 89442440                       mov        dword ptr [rsp + 0x40], eax
01c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c26 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01c2f 89442444                       mov        dword ptr [rsp + 0x44], eax
01c33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c38 48ff742450                     push       qword ptr [rsp + 0x50]
01c3d 488f442448                     pop        qword ptr [rsp + 0x48]
01c42 48ff742458                     push       qword ptr [rsp + 0x58]
01c47 488f442450                     pop        qword ptr [rsp + 0x50]
01c4c 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01c54 488f442458                     pop        qword ptr [rsp + 0x58]
01c59 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5e 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c65 89442460                       mov        dword ptr [rsp + 0x60], eax
01c69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c73 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01c7a 89442464                       mov        dword ptr [rsp + 0x64], eax
01c7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c83 48894424f8                     mov        qword ptr [rsp - 8], rax
01c88 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01c8f 89442468                       mov        dword ptr [rsp + 0x68], eax
01c93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c98 48ffb42498000000               push       qword ptr [rsp + 0x98]
01ca0 488f842480000000               pop        qword ptr [rsp + 0x80]
01ca8 48894424f8                     mov        qword ptr [rsp - 8], rax
01cad 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01cb4 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01cb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cc9 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01cd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ce1 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01ce8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ced 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf2 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01cf9 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01d00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d05 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01d0d 488f842498000000               pop        qword ptr [rsp + 0x98]
01d15 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01d1d 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01d25 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01d2d 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01d35 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d3d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01d45 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01d4c 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d54 666690                         nop        
01d57 e8841cadff                     call       0x7fd1c3943760
01d5c 0f1f8400541e000f               nop        dword ptr [rax + rax + 0xf001e54]
01d64 be45ffffff                     mov        esi, 0xffffff45
01d69 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6e 8b442408                       mov        eax, dword ptr [rsp + 8]
01d72 890424                         mov        dword ptr [rsp], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d83 89442404                       mov        dword ptr [rsp + 4], eax
01d87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8c 48ff742410                     push       qword ptr [rsp + 0x10]
01d91 488f442408                     pop        qword ptr [rsp + 8]
01d96 48ff742418                     push       qword ptr [rsp + 0x18]
01d9b 488f442410                     pop        qword ptr [rsp + 0x10]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01da9 89442418                       mov        dword ptr [rsp + 0x18], eax
01dad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db2 48894424f8                     mov        qword ptr [rsp - 8], rax
01db7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01dbb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01dbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dcd 89442420                       mov        dword ptr [rsp + 0x20], eax
01dd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ddf 89442424                       mov        dword ptr [rsp + 0x24], eax
01de3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ded 48ff742440                     push       qword ptr [rsp + 0x40]
01df2 488f442430                     pop        qword ptr [rsp + 0x30]
01df7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e00 89442438                       mov        dword ptr [rsp + 0x38], eax
01e04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e09 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01e12 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1b 48ff742450                     push       qword ptr [rsp + 0x50]
01e20 488f442440                     pop        qword ptr [rsp + 0x40]
01e25 48ff742458                     push       qword ptr [rsp + 0x58]
01e2a 488f442448                     pop        qword ptr [rsp + 0x48]
01e2f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01e37 488f442450                     pop        qword ptr [rsp + 0x50]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01e48 89442458                       mov        dword ptr [rsp + 0x58], eax
01e4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e51 48894424f8                     mov        qword ptr [rsp - 8], rax
01e56 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01e5d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e66 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01e72 89442460                       mov        dword ptr [rsp + 0x60], eax
01e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7b 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e80 48894424f8                     mov        qword ptr [rsp - 8], rax
01e85 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01e8c 89442464                       mov        dword ptr [rsp + 0x64], eax
01e90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e95 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ea1 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01ea8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ead 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01eb9 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01ec0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eca 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01ed1 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ed8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edd 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01ee5 488f842490000000               pop        qword ptr [rsp + 0x90]
01eed 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ef5 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01efc 666690                         nop        
01eff e8dc1aadff                     call       0x7fd1c3943760
01f04 0f1f8400fc1f0010               nop        dword ptr [rax + rax + 0x10001ffc]
01f0c be45ffffff                     mov        esi, 0xffffff45
01f11 48894424f8                     mov        qword ptr [rsp - 8], rax
01f16 8b442408                       mov        eax, dword ptr [rsp + 8]
01f1a 890424                         mov        dword ptr [rsp], eax
01f1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f22 48894424f8                     mov        qword ptr [rsp - 8], rax
01f27 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f2b 89442404                       mov        dword ptr [rsp + 4], eax
01f2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f34 48ff742410                     push       qword ptr [rsp + 0x10]
01f39 488f442408                     pop        qword ptr [rsp + 8]
01f3e 48ff742418                     push       qword ptr [rsp + 0x18]
01f43 488f442410                     pop        qword ptr [rsp + 0x10]
01f48 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f51 89442418                       mov        dword ptr [rsp + 0x18], eax
01f55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f75 89442420                       mov        dword ptr [rsp + 0x20], eax
01f79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f83 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f87 89442424                       mov        dword ptr [rsp + 0x24], eax
01f8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f90 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f95 48ff742440                     push       qword ptr [rsp + 0x40]
01f9a 488f442430                     pop        qword ptr [rsp + 0x30]
01f9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01fa8 89442438                       mov        dword ptr [rsp + 0x38], eax
01fac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01fba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc3 48ff742450                     push       qword ptr [rsp + 0x50]
01fc8 488f442440                     pop        qword ptr [rsp + 0x40]
01fcd 48ff742458                     push       qword ptr [rsp + 0x58]
01fd2 488f442448                     pop        qword ptr [rsp + 0x48]
01fd7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01fdf 488f442450                     pop        qword ptr [rsp + 0x50]
01fe4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ff0 89442458                       mov        dword ptr [rsp + 0x58], eax
01ff4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffe 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02005 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02009 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200e 48894424f8                     mov        qword ptr [rsp - 8], rax
02013 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0201a 89442460                       mov        dword ptr [rsp + 0x60], eax
0201e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02023 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02028 48894424f8                     mov        qword ptr [rsp - 8], rax
0202d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02034 89442464                       mov        dword ptr [rsp + 0x64], eax
02038 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203d 48894424f8                     mov        qword ptr [rsp - 8], rax
02042 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02049 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02050 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02055 48894424f8                     mov        qword ptr [rsp - 8], rax
0205a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02061 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02068 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206d 48894424f8                     mov        qword ptr [rsp - 8], rax
02072 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02079 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02080 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02085 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0208d 488f842490000000               pop        qword ptr [rsp + 0x90]
02095 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0209d 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
020a5 6690                           nop        
020a7 e83419adff                     call       0x7fd1c3943760
020ac 0f1f8400a4210011               nop        dword ptr [rax + rax + 0x110021a4]
020b4 be3dffffff                     mov        esi, 0xffffff3d
020b9 48894424f8                     mov        qword ptr [rsp - 8], rax
020be 8b442408                       mov        eax, dword ptr [rsp + 8]
020c2 890424                         mov        dword ptr [rsp], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48894424f8                     mov        qword ptr [rsp - 8], rax
020cf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020d3 89442404                       mov        dword ptr [rsp + 4], eax
020d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020dc 48ff742410                     push       qword ptr [rsp + 0x10]
020e1 488f442408                     pop        qword ptr [rsp + 8]
020e6 48ff742418                     push       qword ptr [rsp + 0x18]
020eb 488f442410                     pop        qword ptr [rsp + 0x10]
020f0 48894424f8                     mov        qword ptr [rsp - 8], rax
020f5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020f9 89442418                       mov        dword ptr [rsp + 0x18], eax
020fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02102 48894424f8                     mov        qword ptr [rsp - 8], rax
02107 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0210b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0210f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02114 48894424f8                     mov        qword ptr [rsp - 8], rax
02119 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0211d 89442420                       mov        dword ptr [rsp + 0x20], eax
02121 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02126 48894424f8                     mov        qword ptr [rsp - 8], rax
0212b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0212f 89442424                       mov        dword ptr [rsp + 0x24], eax
02133 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02138 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0213d 48ff742440                     push       qword ptr [rsp + 0x40]
02142 488f442430                     pop        qword ptr [rsp + 0x30]
02147 48894424f8                     mov        qword ptr [rsp - 8], rax
0214c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02150 89442438                       mov        dword ptr [rsp + 0x38], eax
02154 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02159 48894424f8                     mov        qword ptr [rsp - 8], rax
0215e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02162 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02166 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216b 48ff742450                     push       qword ptr [rsp + 0x50]
02170 488f442440                     pop        qword ptr [rsp + 0x40]
02175 48ff742458                     push       qword ptr [rsp + 0x58]
0217a 488f442448                     pop        qword ptr [rsp + 0x48]
0217f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
02187 488f442450                     pop        qword ptr [rsp + 0x50]
0218c 48894424f8                     mov        qword ptr [rsp - 8], rax
02191 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02198 89442458                       mov        dword ptr [rsp + 0x58], eax
0219c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a1 48894424f8                     mov        qword ptr [rsp - 8], rax
021a6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
021ad 8944245c                       mov        dword ptr [rsp + 0x5c], eax
021b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b6 48894424f8                     mov        qword ptr [rsp - 8], rax
021bb 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
021c2 89442460                       mov        dword ptr [rsp + 0x60], eax
021c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021cb 48ffb42498000000               push       qword ptr [rsp + 0x98]
021d3 488f442478                     pop        qword ptr [rsp + 0x78]
021d8 48894424f8                     mov        qword ptr [rsp - 8], rax
021dd 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
021e4 89442464                       mov        dword ptr [rsp + 0x64], eax
021e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ed 48894424f8                     mov        qword ptr [rsp - 8], rax
021f2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021f9 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02200 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02205 48894424f8                     mov        qword ptr [rsp - 8], rax
0220a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02211 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02218 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221d 48894424f8                     mov        qword ptr [rsp - 8], rax
02222 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02229 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02230 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02235 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0223d 488f842490000000               pop        qword ptr [rsp + 0x90]
02245 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0224d 488f842498000000               pop        qword ptr [rsp + 0x98]
02255 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0225d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02265 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0226d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02275 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0227d 48894424f8                     mov        qword ptr [rsp - 8], rax
02282 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02289 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02290 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02295 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
0229c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
022a4 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
022ac 666690                         nop        
022af e82c17adff                     call       0x7fd1c3943760
022b4 0f1f8400ac230012               nop        dword ptr [rax + rax + 0x120023ac]
022bc be45ffffff                     mov        esi, 0xffffff45
022c1 48894424f8                     mov        qword ptr [rsp - 8], rax
022c6 8b442408                       mov        eax, dword ptr [rsp + 8]
022ca 890424                         mov        dword ptr [rsp], eax
022cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d2 48894424f8                     mov        qword ptr [rsp - 8], rax
022d7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022db 89442404                       mov        dword ptr [rsp + 4], eax
022df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e4 48ff742410                     push       qword ptr [rsp + 0x10]
022e9 488f442408                     pop        qword ptr [rsp + 8]
022ee 48ff742418                     push       qword ptr [rsp + 0x18]
022f3 488f442410                     pop        qword ptr [rsp + 0x10]
022f8 48894424f8                     mov        qword ptr [rsp - 8], rax
022fd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02301 89442418                       mov        dword ptr [rsp + 0x18], eax
02305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230a 48894424f8                     mov        qword ptr [rsp - 8], rax
0230f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02313 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02317 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231c 48894424f8                     mov        qword ptr [rsp - 8], rax
02321 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02325 89442420                       mov        dword ptr [rsp + 0x20], eax
02329 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232e 48894424f8                     mov        qword ptr [rsp - 8], rax
02333 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02337 89442424                       mov        dword ptr [rsp + 0x24], eax
0233b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02340 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02345 48ff742440                     push       qword ptr [rsp + 0x40]
0234a 488f442430                     pop        qword ptr [rsp + 0x30]
0234f 48894424f8                     mov        qword ptr [rsp - 8], rax
02354 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02358 89442438                       mov        dword ptr [rsp + 0x38], eax
0235c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02361 48894424f8                     mov        qword ptr [rsp - 8], rax
02366 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0236a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0236e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02373 48ff742450                     push       qword ptr [rsp + 0x50]
02378 488f442440                     pop        qword ptr [rsp + 0x40]
0237d 48ff742458                     push       qword ptr [rsp + 0x58]
02382 488f442448                     pop        qword ptr [rsp + 0x48]
02387 897c2458                       mov        dword ptr [rsp + 0x58], edi
0238b 48ffb42498000000               push       qword ptr [rsp + 0x98]
02393 488f442470                     pop        qword ptr [rsp + 0x70]
02398 48894424f8                     mov        qword ptr [rsp - 8], rax
0239d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
023a4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
023a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ad 48894424f8                     mov        qword ptr [rsp - 8], rax
023b2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
023b9 89442478                       mov        dword ptr [rsp + 0x78], eax
023bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c2 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
023ca 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
023d2 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023da 90                             nop        
023db e80016adff                     call       0x7fd1c3943760
023e0 0f1f8400d8240013               nop        dword ptr [rax + rax + 0x130024d8]
023e8 be45ffffff                     mov        esi, 0xffffff45
023ed 48894424f8                     mov        qword ptr [rsp - 8], rax
023f2 8b442408                       mov        eax, dword ptr [rsp + 8]
023f6 890424                         mov        dword ptr [rsp], eax
023f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02403 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02407 89442404                       mov        dword ptr [rsp + 4], eax
0240b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02410 48ff742410                     push       qword ptr [rsp + 0x10]
02415 488f442408                     pop        qword ptr [rsp + 8]
0241a 48ff742418                     push       qword ptr [rsp + 0x18]
0241f 488f442410                     pop        qword ptr [rsp + 0x10]
02424 48894424f8                     mov        qword ptr [rsp - 8], rax
02429 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0242d 89442418                       mov        dword ptr [rsp + 0x18], eax
02431 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02436 48894424f8                     mov        qword ptr [rsp - 8], rax
0243b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0243f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02443 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02448 48894424f8                     mov        qword ptr [rsp - 8], rax
0244d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02451 89442420                       mov        dword ptr [rsp + 0x20], eax
02455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245a 48894424f8                     mov        qword ptr [rsp - 8], rax
0245f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02463 89442424                       mov        dword ptr [rsp + 0x24], eax
02467 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02471 48ff742440                     push       qword ptr [rsp + 0x40]
02476 488f442430                     pop        qword ptr [rsp + 0x30]
0247b 48894424f8                     mov        qword ptr [rsp - 8], rax
02480 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02484 89442438                       mov        dword ptr [rsp + 0x38], eax
02488 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248d 48894424f8                     mov        qword ptr [rsp - 8], rax
02492 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02496 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0249a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249f 48ff742450                     push       qword ptr [rsp + 0x50]
024a4 488f442440                     pop        qword ptr [rsp + 0x40]
024a9 48ff742458                     push       qword ptr [rsp + 0x58]
024ae 488f442448                     pop        qword ptr [rsp + 0x48]
024b3 897c2458                       mov        dword ptr [rsp + 0x58], edi
024b7 48894424f8                     mov        qword ptr [rsp - 8], rax
024bc 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
024c3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024cc 48894424f8                     mov        qword ptr [rsp - 8], rax
024d1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
024d8 89442478                       mov        dword ptr [rsp + 0x78], eax
024dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e1 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024e9 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024f1 6690                           nop        
024f3 e8e814adff                     call       0x7fd1c3943760
024f8 0f1f8400f0250014               nop        dword ptr [rax + rax + 0x140025f0]
02500 be45ffffff                     mov        esi, 0xffffff45
02505 48894424f8                     mov        qword ptr [rsp - 8], rax
0250a 8b442408                       mov        eax, dword ptr [rsp + 8]
0250e 890424                         mov        dword ptr [rsp], eax
02511 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02516 48894424f8                     mov        qword ptr [rsp - 8], rax
0251b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0251f 89442404                       mov        dword ptr [rsp + 4], eax
02523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02528 48ff742410                     push       qword ptr [rsp + 0x10]
0252d 488f442408                     pop        qword ptr [rsp + 8]
02532 48ff742418                     push       qword ptr [rsp + 0x18]
02537 488f442410                     pop        qword ptr [rsp + 0x10]
0253c 48894424f8                     mov        qword ptr [rsp - 8], rax
02541 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02545 89442418                       mov        dword ptr [rsp + 0x18], eax
02549 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254e 48894424f8                     mov        qword ptr [rsp - 8], rax
02553 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02557 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0255b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02560 48894424f8                     mov        qword ptr [rsp - 8], rax
02565 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02569 89442420                       mov        dword ptr [rsp + 0x20], eax
0256d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02572 48894424f8                     mov        qword ptr [rsp - 8], rax
02577 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0257b 89442424                       mov        dword ptr [rsp + 0x24], eax
0257f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02584 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02589 48ff742440                     push       qword ptr [rsp + 0x40]
0258e 488f442430                     pop        qword ptr [rsp + 0x30]
02593 48894424f8                     mov        qword ptr [rsp - 8], rax
02598 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0259c 89442438                       mov        dword ptr [rsp + 0x38], eax
025a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a5 48894424f8                     mov        qword ptr [rsp - 8], rax
025aa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
025ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b7 48ff742450                     push       qword ptr [rsp + 0x50]
025bc 488f442440                     pop        qword ptr [rsp + 0x40]
025c1 48ff742458                     push       qword ptr [rsp + 0x58]
025c6 488f442448                     pop        qword ptr [rsp + 0x48]
025cb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
025d3 488f442450                     pop        qword ptr [rsp + 0x50]
025d8 48894424f8                     mov        qword ptr [rsp - 8], rax
025dd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
025e4 89442458                       mov        dword ptr [rsp + 0x58], eax
025e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ed 48894424f8                     mov        qword ptr [rsp - 8], rax
025f2 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
025f9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02602 48894424f8                     mov        qword ptr [rsp - 8], rax
02607 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0260e 89442460                       mov        dword ptr [rsp + 0x60], eax
02612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02617 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0261f 488f442468                     pop        qword ptr [rsp + 0x68]
02624 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0262c 488f442470                     pop        qword ptr [rsp + 0x70]
02631 48ffb42498000000               push       qword ptr [rsp + 0x98]
02639 488f442478                     pop        qword ptr [rsp + 0x78]
0263e 48894424f8                     mov        qword ptr [rsp - 8], rax
02643 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0264a 89442464                       mov        dword ptr [rsp + 0x64], eax
0264e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02653 48894424f8                     mov        qword ptr [rsp - 8], rax
02658 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0265f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02666 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266b 48894424f8                     mov        qword ptr [rsp - 8], rax
02670 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02677 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0267e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02683 48894424f8                     mov        qword ptr [rsp - 8], rax
02688 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0268f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02696 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269b 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
026a3 488f842490000000               pop        qword ptr [rsp + 0x90]
026ab 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026b3 488f842498000000               pop        qword ptr [rsp + 0x98]
026bb 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
026c3 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
026cb e81013adff                     call       0x7fd1c3943760
026d0 0f1f8400c8270015               nop        dword ptr [rax + rax + 0x150027c8]
026d8 be45ffffff                     mov        esi, 0xffffff45
026dd 48894424f8                     mov        qword ptr [rsp - 8], rax
026e2 8b442408                       mov        eax, dword ptr [rsp + 8]
026e6 890424                         mov        dword ptr [rsp], eax
026e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ee 48894424f8                     mov        qword ptr [rsp - 8], rax
026f3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026f7 89442404                       mov        dword ptr [rsp + 4], eax
026fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02700 48ff742410                     push       qword ptr [rsp + 0x10]
02705 488f442408                     pop        qword ptr [rsp + 8]
0270a 48ff742418                     push       qword ptr [rsp + 0x18]
0270f 488f442410                     pop        qword ptr [rsp + 0x10]
02714 48894424f8                     mov        qword ptr [rsp - 8], rax
02719 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0271d 89442418                       mov        dword ptr [rsp + 0x18], eax
02721 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02726 48894424f8                     mov        qword ptr [rsp - 8], rax
0272b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0272f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02738 48894424f8                     mov        qword ptr [rsp - 8], rax
0273d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02741 89442420                       mov        dword ptr [rsp + 0x20], eax
02745 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274a 48894424f8                     mov        qword ptr [rsp - 8], rax
0274f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02753 89442424                       mov        dword ptr [rsp + 0x24], eax
02757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275c 48ff742440                     push       qword ptr [rsp + 0x40]
02761 488f442430                     pop        qword ptr [rsp + 0x30]
02766 48894424f8                     mov        qword ptr [rsp - 8], rax
0276b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0276f 89442438                       mov        dword ptr [rsp + 0x38], eax
02773 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02778 48894424f8                     mov        qword ptr [rsp - 8], rax
0277d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02781 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02785 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278a 48ff742450                     push       qword ptr [rsp + 0x50]
0278f 488f442440                     pop        qword ptr [rsp + 0x40]
02794 48ff742458                     push       qword ptr [rsp + 0x58]
02799 488f442448                     pop        qword ptr [rsp + 0x48]
0279e 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
027a6 488f442450                     pop        qword ptr [rsp + 0x50]
027ab 48894424f8                     mov        qword ptr [rsp - 8], rax
027b0 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
027b7 89442458                       mov        dword ptr [rsp + 0x58], eax
027bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c0 48894424f8                     mov        qword ptr [rsp - 8], rax
027c5 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
027cc 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d5 48894424f8                     mov        qword ptr [rsp - 8], rax
027da 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
027e1 89442460                       mov        dword ptr [rsp + 0x60], eax
027e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ea 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027f2 488f442468                     pop        qword ptr [rsp + 0x68]
027f7 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027ff 488f442470                     pop        qword ptr [rsp + 0x70]
02804 48ffb42498000000               push       qword ptr [rsp + 0x98]
0280c 488f442478                     pop        qword ptr [rsp + 0x78]
02811 48894424f8                     mov        qword ptr [rsp - 8], rax
02816 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0281d 89442464                       mov        dword ptr [rsp + 0x64], eax
02821 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02826 48894424f8                     mov        qword ptr [rsp - 8], rax
0282b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02832 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0284a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02856 48894424f8                     mov        qword ptr [rsp - 8], rax
0285b 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02862 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0286e 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02876 488f842490000000               pop        qword ptr [rsp + 0x90]
0287e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02886 488f842498000000               pop        qword ptr [rsp + 0x98]
0288e 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
02896 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0289e 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
028a6 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
028ae 90                             nop        
028af e82c11adff                     call       0x7fd1c3943760
028b4 0f1f8400ac290016               nop        dword ptr [rax + rax + 0x160029ac]
028bc 4533d2                         xor        r10d, r10d
028bf 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
028c7 e9f6d8ffff                     jmp        0x7fd1c3e6ff42
028cc 4533d2                         xor        r10d, r10d
028cf 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028d4 e90fd9ffff                     jmp        0x7fd1c3e6ff68
028d9 4533d2                         xor        r10d, r10d
028dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028e1 e92fd9ffff                     jmp        0x7fd1c3e6ff95
028e6 4533d2                         xor        r10d, r10d
028e9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028ee e94ad9ffff                     jmp        0x7fd1c3e6ffbd
028f3 4533d2                         xor        r10d, r10d
028f6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028fb e96ad9ffff                     jmp        0x7fd1c3e6ffea
02900 4533d2                         xor        r10d, r10d
02903 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0290b e985d9ffff                     jmp        0x7fd1c3e70015
02910 4533d2                         xor        r10d, r10d
02913 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0291b e9abd9ffff                     jmp        0x7fd1c3e7004b
02920 4533d2                         xor        r10d, r10d
02923 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0292b e9c6d9ffff                     jmp        0x7fd1c3e70076
02930 bebeffffff                     mov        esi, 0xffffffbe
02935 48894424f8                     mov        qword ptr [rsp - 8], rax
0293a 8b442408                       mov        eax, dword ptr [rsp + 8]
0293e 890424                         mov        dword ptr [rsp], eax
02941 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02946 48894424f8                     mov        qword ptr [rsp - 8], rax
0294b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0294f 89442404                       mov        dword ptr [rsp + 4], eax
02953 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02958 48ff742410                     push       qword ptr [rsp + 0x10]
0295d 488f442408                     pop        qword ptr [rsp + 8]
02962 48ff742418                     push       qword ptr [rsp + 0x18]
02967 488f442410                     pop        qword ptr [rsp + 0x10]
0296c 48894424f8                     mov        qword ptr [rsp - 8], rax
02971 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02975 89442418                       mov        dword ptr [rsp + 0x18], eax
02979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297e 48894424f8                     mov        qword ptr [rsp - 8], rax
02983 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02987 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0298b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02990 48894424f8                     mov        qword ptr [rsp - 8], rax
02995 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02999 89442420                       mov        dword ptr [rsp + 0x20], eax
0299d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a2 48894424f8                     mov        qword ptr [rsp - 8], rax
029a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
029ab 89442424                       mov        dword ptr [rsp + 0x24], eax
029af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
029b9 48ff742440                     push       qword ptr [rsp + 0x40]
029be 488f442430                     pop        qword ptr [rsp + 0x30]
029c3 48894424f8                     mov        qword ptr [rsp - 8], rax
029c8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
029cc 89442438                       mov        dword ptr [rsp + 0x38], eax
029d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029d5 48894424f8                     mov        qword ptr [rsp - 8], rax
029da 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
029de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e7 48ff742450                     push       qword ptr [rsp + 0x50]
029ec 488f442440                     pop        qword ptr [rsp + 0x40]
029f1 48ff742458                     push       qword ptr [rsp + 0x58]
029f6 488f442448                     pop        qword ptr [rsp + 0x48]
029fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02a00 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02a07 89442458                       mov        dword ptr [rsp + 0x58], eax
02a0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a10 48894424f8                     mov        qword ptr [rsp - 8], rax
02a15 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02a1c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a25 6690                           nop        
02a27 e8b40fadff                     call       0x7fd1c3943760
02a2c 0f1f8400242b0017               nop        dword ptr [rax + rax + 0x17002b24]
02a34 be85ffffff                     mov        esi, 0xffffff85
02a39 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a3d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a42 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a46 890424                         mov        dword ptr [rsp], eax
02a49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a53 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a57 89442404                       mov        dword ptr [rsp + 4], eax
02a5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a60 48894424f8                     mov        qword ptr [rsp - 8], rax
02a65 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a69 89442408                       mov        dword ptr [rsp + 8], eax
02a6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a72 48894424f8                     mov        qword ptr [rsp - 8], rax
02a77 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a7b 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a84 48894424f8                     mov        qword ptr [rsp - 8], rax
02a89 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a8d 89442410                       mov        dword ptr [rsp + 0x10], eax
02a91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a96 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a9b 48ff742440                     push       qword ptr [rsp + 0x40]
02aa0 488f442420                     pop        qword ptr [rsp + 0x20]
02aa5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aaa 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02aae 89442414                       mov        dword ptr [rsp + 0x14], eax
02ab2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab7 48894424f8                     mov        qword ptr [rsp - 8], rax
02abc 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02ac0 89442428                       mov        dword ptr [rsp + 0x28], eax
02ac4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac9 48894424f8                     mov        qword ptr [rsp - 8], rax
02ace 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02ad5 8944242c                       mov        dword ptr [rsp + 0x2c], eax
02ad9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ade 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae3 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02aea 89442430                       mov        dword ptr [rsp + 0x30], eax
02aee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af3 48894424f8                     mov        qword ptr [rsp - 8], rax
02af8 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02aff 89442434                       mov        dword ptr [rsp + 0x34], eax
02b03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b08 48894424f8                     mov        qword ptr [rsp - 8], rax
02b0d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02b14 89442448                       mov        dword ptr [rsp + 0x48], eax
02b18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b1d 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
02b25 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
02b2d 6690                           nop        
02b2f e8ac0eadff                     call       0x7fd1c3943760
02b34 0f1f84002c2c0018               nop        dword ptr [rax + rax + 0x18002c2c]
02b3c bef6ffffff                     mov        esi, 0xfffffff6
02b41 6690                           nop        
02b43 e8980eadff                     call       0x7fd1c3943760
02b48 0f1f8400402c0019               nop        dword ptr [rax + rax + 0x19002c40]
02b50 be5d000000                     mov        esi, 0x5d
02b55 6690                           nop        
02b57 e8840eadff                     call       0x7fd1c3943760
02b5c 0f1f8400542c001a               nop        dword ptr [rax + rax + 0x1a002c54]
02b64 bef6ffffff                     mov        esi, 0xfffffff6
02b69 8be9                           mov        ebp, ecx
02b6b e8700eadff                     call       0x7fd1c3943760
02b70 0f1f8400682c001b               nop        dword ptr [rax + rax + 0x1b002c68]
02b78 bef6ffffff                     mov        esi, 0xfffffff6
02b7d 418be8                         mov        ebp, r8d
02b80 666690                         nop        
02b83 e8580eadff                     call       0x7fd1c3943760
02b88 0f1f8400802c001c               nop        dword ptr [rax + rax + 0x1c002c80]
02b90 bef6ffffff                     mov        esi, 0xfffffff6
02b95 418be9                         mov        ebp, r9d
02b98 666690                         nop        
02b9b e8400eadff                     call       0x7fd1c3943760
02ba0 0f1f8400982c001d               nop        dword ptr [rax + rax + 0x1d002c98]
02ba8 eb00                           jmp        0x7fd1c3e7292a
02baa 488bf0                         mov        rsi, rax
02bad e9f2deffff                     jmp        0x7fd1c3e70824
02bb2 49ba4c08e7c3d17f0000           movabs     r10, 0x7fd1c3e7084c
02bbc 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02bc3 e99805aaff                     jmp        0x7fd1c3912ee0
02bc8 e853d1a8ff                     call       0x7fd1c38ffaa0
02bcd e95cd4ffff                     jmp        0x7fd1c3e6fdae
02bd2 f4                             hlt        
02bd3 f4                             hlt        
02bd4 f4                             hlt        
02bd5 f4                             hlt        
02bd6 f4                             hlt        
02bd7 f4                             hlt        
