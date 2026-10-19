00000 e87b178b18                     call       0x7fd34c70b280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f859a290000                   jne        0x7fd333e5c4c8
0002e 4c8b96e8010000                 mov        r10, qword ptr [rsi + 0x1e8]
00035 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0003a 4c8b96d0010000                 mov        r10, qword ptr [rsi + 0x1d0]
00041 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00046 448b9ed0000000                 mov        r11d, dword ptr [rsi + 0xd0]
0004d 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
00055 4c8b96c8010000                 mov        r10, qword ptr [rsi + 0x1c8]
0005c 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00061 4c8b9660010000                 mov        r10, qword ptr [rsi + 0x160]
00068 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0006d 4c8b9658010000                 mov        r10, qword ptr [rsi + 0x158]
00074 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0007c 4c8b9650010000                 mov        r10, qword ptr [rsi + 0x150]
00083 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0008b 4c8b9610010000                 mov        r10, qword ptr [rsi + 0x110]
00092 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0009a 4c8bae08010000                 mov        r13, qword ptr [rsi + 0x108]
000a1 448b96e0010000                 mov        r10d, dword ptr [rsi + 0x1e0]
000a8 4489542408                     mov        dword ptr [rsp + 8], r10d
000ad 448b9ed8010000                 mov        r11d, dword ptr [rsi + 0x1d8]
000b4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
000b9 448b96c0010000                 mov        r10d, dword ptr [rsi + 0x1c0]
000c0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
000c5 448b9eb8010000                 mov        r11d, dword ptr [rsi + 0x1b8]
000cc 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
000d1 448b96a0010000                 mov        r10d, dword ptr [rsi + 0x1a0]
000d8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000dd 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000e4 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000eb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
000f0 448b9670010000                 mov        r10d, dword ptr [rsi + 0x170]
000f7 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000fc 448b9e68010000                 mov        r11d, dword ptr [rsi + 0x168]
00103 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00108 448b9628010000                 mov        r10d, dword ptr [rsi + 0x128]
0010f 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00117 448b9e20010000                 mov        r11d, dword ptr [rsi + 0x120]
0011e 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00126 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0012d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00135 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
0013c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00144 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
0014b 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00153 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
0015a 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00162 448b9ee0000000                 mov        r11d, dword ptr [rsi + 0xe0]
00169 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00171 448b96d8000000                 mov        r10d, dword ptr [rsi + 0xd8]
00178 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00180 448b9e98010000                 mov        r11d, dword ptr [rsi + 0x198]
00187 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0018c 488bfe                         mov        rdi, rsi
0018f 49bac0197f4cd37f0000           movabs     r10, 0x7fd34c7f19c0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f848e250000                   je         0x7fd333e5c240
001b2 458b12                         mov        r10d, dword ptr [r10]
001b5 41c1ea0d                       shr        r10d, 0xd
001b9 4181fa05010000                 cmp        r10d, 0x105
001c0 0f85ce260000                   jne        0x7fd333e5c394
001c6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001cb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001d3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d8 4d85d2                         test       r10, r10
001db 0f846f250000                   je         0x7fd333e5c250
001e1 458b1a                         mov        r11d, dword ptr [r10]
001e4 41c1eb0d                       shr        r11d, 0xd
001e8 4181fb16040000                 cmp        r11d, 0x416
001ef 0f859f260000                   jne        0x7fd333e5c394
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8455250000                   je         0x7fd333e5c25d
00208 458b12                         mov        r10d, dword ptr [r10]
0020b 41c1ea0d                       shr        r10d, 0xd
0020f 4181fa0a040000                 cmp        r10d, 0x40a
00216 0f8578260000                   jne        0x7fd333e5c394
0021c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00221 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00226 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0022b 4d85d2                         test       r10, r10
0022e 0f8436250000                   je         0x7fd333e5c26a
00234 458b1a                         mov        r11d, dword ptr [r10]
00237 41c1eb0d                       shr        r11d, 0xd
0023b 4181fb0d040000                 cmp        r11d, 0x40d
00242 0f854c260000                   jne        0x7fd333e5c394
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8419250000                   je         0x7fd333e5c277
0025e 458b12                         mov        r10d, dword ptr [r10]
00261 41c1ea0d                       shr        r10d, 0xd
00265 4181fa0d040000                 cmp        r10d, 0x40d
0026c 0f8522260000                   jne        0x7fd333e5c394
00272 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0027a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0027f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00287 4d85d2                         test       r10, r10
0028a 0f84f4240000                   je         0x7fd333e5c284
00290 458b1a                         mov        r11d, dword ptr [r10]
00293 41c1eb0d                       shr        r11d, 0xd
00297 4181fb0d040000                 cmp        r11d, 0x40d
0029e 0f85f0250000                   jne        0x7fd333e5c394
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84d7240000                   je         0x7fd333e5c291
002ba 458b12                         mov        r10d, dword ptr [r10]
002bd 41c1ea0d                       shr        r10d, 0xd
002c1 4181fa08010000                 cmp        r10d, 0x108
002c8 0f85c6250000                   jne        0x7fd333e5c394
002ce 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002d6 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002de 4d85ed                         test       r13, r13
002e1 0f84ba240000                   je         0x7fd333e5c2a1
002e7 458b5d00                       mov        r11d, dword ptr [r13]
002eb 41c1eb0d                       shr        r11d, 0xd
002ef 4181fb07010000                 cmp        r11d, 0x107
002f6 0f8598250000                   jne        0x7fd333e5c394
002fc 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
00304 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00309 4d85d2                         test       r10, r10
0030c 0f849f240000                   je         0x7fd333e5c2b1
00312 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00317 4d85d2                         test       r10, r10
0031a 0f8491240000                   je         0x7fd333e5c2b1
00320 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00325 4d85d2                         test       r10, r10
00328 0f8483240000                   je         0x7fd333e5c2b1
0032e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00336 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0033a 892c24                         mov        dword ptr [rsp], ebp
0033d 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00345 458b4204                       mov        r8d, dword ptr [r10 + 4]
00349 458d58f9                       lea        r11d, [r8 - 7]
0034d 4585db                         test       r11d, r11d
00350 0f8c5b240000                   jl         0x7fd333e5c2b1
00356 4183c0f9                       add        r8d, -7
0035a 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
00362 e95a020000                     jmp        0x7fd333e5a0c1
00367 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
0036f 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00374 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00379 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0037e 48894424f8                     mov        qword ptr [rsp - 8], rax
00383 8b442430                       mov        eax, dword ptr [rsp + 0x30]
00387 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0038b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00390 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8dd40f0000                   jge        0x7fd333e5ae74
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d71110000                   jge        0x7fd333e5b044
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d40130000                   jge        0x7fd333e5b23c
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8d19150000                   jge        0x7fd333e5b43c
00423 41b901000000                   mov        r9d, 1
00429 c442d1f7c9                     shlx       r9, r9, rbp
0042e 49ffc9                         dec        r9
00431 4d23cb                         and        r9, r11
00434 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0043c 458bdb                         mov        r11d, r11d
0043f 4403d9                         add        r11d, ecx
00442 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
0044a 8bc9                           mov        ecx, ecx
0044c 4103c8                         add        ecx, r8d
0044f 4963fb                         movsxd     rdi, r11d
00452 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0045a 458bc0                         mov        r8d, r8d
0045d 4d03c8                         add        r9, r8
00460 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00468 4c03c7                         add        r8, rdi
0046b 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
00473 4d85c9                         test       r9, r9
00476 0f8ea00b0000                   jle        0x7fd333e5ab1c
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f93160000                   jg         0x7fd333e5b61c
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8fbb170000                   jg         0x7fd333e5b750
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f42190000                   jg         0x7fd333e5b8e4
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83c61a0000                   jae        0x7fd333e5ba78
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f8370090000                   jae        0x7fd333e5a948
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc808                     mov        qword ptr [r8 + r9*8 + 8], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8db8000000                   jge        0x7fd333e5a0b3
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0050f 49c1e830                       shr        r8, 0x30
00513 458bdb                         mov        r11d, r11d
00516 418bc8                         mov        ecx, r8d
00519 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
00521 44038424bc000000               add        r8d, dword ptr [rsp + 0xbc]
00529 c4423bf7ca                     shrx       r9d, r10d, r8d
0052e 4103c9                         add        ecx, r9d
00531 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
00538 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
00540 c4423bf7ca                     shrx       r9d, r10d, r8d
00545 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
0054d 4183f820                       cmp        r8d, 0x20
00551 0f8d2d1c0000                   jge        0x7fd333e5bc84
00557 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0055f 49c1e830                       shr        r8, 0x30
00563 458bc0                         mov        r8d, r8d
00566 ba01000000                     mov        edx, 1
0056b 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00572 c4e271f7ca                     shlx       ecx, edx, ecx
00577 ffc9                           dec        ecx
00579 4123c9                         and        ecx, r9d
0057c 4103cb                         add        ecx, r11d
0057f 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00586 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
0058e 4183f920                       cmp        r9d, 0x20
00592 0f8dec1c0000                   jge        0x7fd333e5bd84
00598 b901000000                     mov        ecx, 1
0059d c46231f7d9                     shlx       r11d, ecx, r9d
005a2 41ffcb                         dec        r11d
005a5 4523da                         and        r11d, r10d
005a8 4503d8                         add        r11d, r8d
005ab 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
005b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b7 418502                         test       dword ptr [r10], eax
005ba 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c1 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005c9 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005ce 0f8d7a040000                   jge        0x7fd333e5a54e
005d4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d9 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005dd 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
005e4 238c24b0000000                 and        ecx, dword ptr [rsp + 0xb0]
005eb 458b5a04                       mov        r11d, dword ptr [r10 + 4]
005ef 413bcb                         cmp        ecx, r11d
005f2 0f83f8040000                   jae        0x7fd333e5a5f0
005f8 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
005fd 418b7b14                       mov        edi, dword ptr [r11 + 0x14]
00601 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00609 44238424b4000000               and        r8d, dword ptr [rsp + 0xb4]
00611 448b5f04                       mov        r11d, dword ptr [rdi + 4]
00615 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0061a 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00622 453bc3                         cmp        r8d, r11d
00625 0f83b9050000                   jae        0x7fd333e5a6e4
0062b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00630 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00634 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
0063c 44238c24b8000000               and        r9d, dword ptr [rsp + 0xb8]
00644 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00648 4e8b44c708                     mov        r8, qword ptr [rdi + r8*8 + 8]
0064d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
00655 453bcb                         cmp        r9d, r11d
00658 0f83a2060000                   jae        0x7fd333e5a800
0065e 4f8b54ca08                     mov        r10, qword ptr [r10 + r9*8 + 8]
00663 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066b 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00672 ffc5                           inc        ebp
00674 896c2404                       mov        dword ptr [rsp + 4], ebp
00678 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067c 0f8d3d040000                   jge        0x7fd333e5a5bf
00682 49c1ea28                       shr        r10, 0x28
00686 458bd2                         mov        r10d, r10d
00689 450fb6d2                       movzx      r10d, r10b
0068d 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00695 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0069d 49c1ea28                       shr        r10, 0x28
006a1 458bda                         mov        r11d, r10d
006a4 450fb6c3                       movzx      r8d, r11b
006a8 44038424bc000000               add        r8d, dword ptr [rsp + 0xbc]
006b0 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006b8 49c1ea28                       shr        r10, 0x28
006bc 458bd2                         mov        r10d, r10d
006bf 450fb6da                       movzx      r11d, r10b
006c3 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
006cb 4503c3                         add        r8d, r11d
006ce 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
006d6 41ba01000000                   mov        r10d, 1
006dc 4489942404010000               mov        dword ptr [rsp + 0x104], r10d
006e4 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006ec 49c1ea20                       shr        r10, 0x20
006f0 458bda                         mov        r11d, r10d
006f3 410fb6eb                       movzx      ebp, r11b
006f7 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006fe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00706 49c1ea20                       shr        r10, 0x20
0070a 458bd2                         mov        r10d, r10d
0070d 410fb6ea                       movzx      ebp, r10b
00711 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00718 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00720 49c1ea20                       shr        r10, 0x20
00724 458bda                         mov        r11d, r10d
00727 410fb6eb                       movzx      ebp, r11b
0072b 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00732 448bc5                         mov        r8d, ebp
00735 44038424f8000000               add        r8d, dword ptr [rsp + 0xf8]
0073d 44038424fc000000               add        r8d, dword ptr [rsp + 0xfc]
00745 44038424f4000000               add        r8d, dword ptr [rsp + 0xf4]
0074d 4585c0                         test       r8d, r8d
00750 0f84f6090000                   je         0x7fd333e5ac4c
00756 4183f83f                       cmp        r8d, 0x3f
0075a 0f8fb40b0000                   jg         0x7fd333e5ae14
00760 41ba40000000                   mov        r10d, 0x40
00766 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
0076b 453bc2                         cmp        r8d, r10d
0076e 7e43                           jle        0x7fd333e5a2b3
00770 458bd8                         mov        r11d, r8d
00773 452bda                         sub        r11d, r10d
00776 4183fa40                       cmp        r10d, 0x40
0077a 0f8dd81d0000                   jge        0x7fd333e5c058
00780 41b901000000                   mov        r9d, 1
00786 c442a9f7d1                     shlx       r10, r9, r10
0078b 49ffca                         dec        r10
0078e 4c23d3                         and        r10, rbx
00791 c4c2a1f7ca                     shlx       rcx, r10, r11
00796 41b940000000                   mov        r9d, 0x40
0079c 452bcb                         sub        r9d, r11d
0079f c462b3f7542438                 shrx       r10, qword ptr [rsp + 0x38], r9
007a6 490bca                         or         rcx, r10
007a9 48898c2408010000               mov        qword ptr [rsp + 0x108], rcx
007b1 eb2b                           jmp        0x7fd333e5a2de
007b3 452bd0                         sub        r10d, r8d
007b6 c462abf7d3                     shrx       r10, rbx, r10
007bb 4183f840                       cmp        r8d, 0x40
007bf 0f8db31b0000                   jge        0x7fd333e5be78
007c5 41bb01000000                   mov        r11d, 1
007cb c442b9f7db                     shlx       r11, r11, r8
007d0 49ffcb                         dec        r11
007d3 4d23da                         and        r11, r10
007d6 4c899c2408010000               mov        qword ptr [rsp + 0x108], r11
007de 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
007e3 4503d0                         add        r10d, r8d
007e6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007eb 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
007f0 4503d8                         add        r11d, r8d
007f3 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
007f8 4183fa40                       cmp        r10d, 0x40
007fc 0f8c8efbffff                   jl         0x7fd333e59e90
00802 458d5ac0                       lea        r11d, [r10 - 0x40]
00806 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0080b 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080f 83c5f8                         add        ebp, -8
00812 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00816 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0081a 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081e 83c1f0                         add        ecx, -0x10
00821 83f908                         cmp        ecx, 8
00824 0f8cd6010000                   jl         0x7fd333e5a500
0082a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082f 4183c2e8                       add        r10d, -0x18
00833 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0083b 0f8226fbffff                   jb         0x7fd333e59e67
00841 bee4ffffff                     mov        esi, 0xffffffe4
00846 48894424f8                     mov        qword ptr [rsp - 8], rax
0084b 8b442408                       mov        eax, dword ptr [rsp + 8]
0084f 890424                         mov        dword ptr [rsp], eax
00852 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00857 48894424f8                     mov        qword ptr [rsp - 8], rax
0085c 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00860 89442404                       mov        dword ptr [rsp + 4], eax
00864 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00869 48ff742410                     push       qword ptr [rsp + 0x10]
0086e 488f442408                     pop        qword ptr [rsp + 8]
00873 48ff742418                     push       qword ptr [rsp + 0x18]
00878 488f442410                     pop        qword ptr [rsp + 0x10]
0087d 48894424f8                     mov        qword ptr [rsp - 8], rax
00882 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00886 89442418                       mov        dword ptr [rsp + 0x18], eax
0088a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088f 48894424f8                     mov        qword ptr [rsp - 8], rax
00894 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00898 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0089c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a1 48894424f8                     mov        qword ptr [rsp - 8], rax
008a6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008aa 89442420                       mov        dword ptr [rsp + 0x20], eax
008ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b3 48894424f8                     mov        qword ptr [rsp - 8], rax
008b8 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008bc 89442424                       mov        dword ptr [rsp + 0x24], eax
008c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c5 48ff742438                     push       qword ptr [rsp + 0x38]
008ca 488f442428                     pop        qword ptr [rsp + 0x28]
008cf 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008d4 48894424f8                     mov        qword ptr [rsp - 8], rax
008d9 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008dd 89442434                       mov        dword ptr [rsp + 0x34], eax
008e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e6 48ff742448                     push       qword ptr [rsp + 0x48]
008eb 488f442438                     pop        qword ptr [rsp + 0x38]
008f0 48ff742450                     push       qword ptr [rsp + 0x50]
008f5 488f442440                     pop        qword ptr [rsp + 0x40]
008fa 48ff742458                     push       qword ptr [rsp + 0x58]
008ff 488f442448                     pop        qword ptr [rsp + 0x48]
00904 48894424f8                     mov        qword ptr [rsp - 8], rax
00909 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00910 89442450                       mov        dword ptr [rsp + 0x50], eax
00914 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00919 48894424f8                     mov        qword ptr [rsp - 8], rax
0091e 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00925 89442454                       mov        dword ptr [rsp + 0x54], eax
00929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092e 48894424f8                     mov        qword ptr [rsp - 8], rax
00933 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0093a 89442458                       mov        dword ptr [rsp + 0x58], eax
0093e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00943 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0094b 488f442460                     pop        qword ptr [rsp + 0x60]
00950 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00958 488f442468                     pop        qword ptr [rsp + 0x68]
0095d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00965 488f442470                     pop        qword ptr [rsp + 0x70]
0096a 48894424f8                     mov        qword ptr [rsp - 8], rax
0096f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00976 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0097a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097f 48894424f8                     mov        qword ptr [rsp - 8], rax
00984 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0098b 89442478                       mov        dword ptr [rsp + 0x78], eax
0098f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00994 48894424f8                     mov        qword ptr [rsp - 8], rax
00999 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
009a0 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a9 48894424f8                     mov        qword ptr [rsp - 8], rax
009ae 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009b5 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009c1 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c9 488f842488000000               pop        qword ptr [rsp + 0x88]
009d1 48894424f8                     mov        qword ptr [rsp - 8], rax
009d6 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009dd 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e9 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009f1 6690                           nop        
009f3 e86891b6ff                     call       0x7fd3339c3660
009f8 0f1f8400f00a0001               nop        dword ptr [rax + rax + 0x1000af0]
00a00 85c9                           test       ecx, ecx
00a02 7f08                           jg         0x7fd333e5a50c
00a04 4533d2                         xor        r10d, r10d
00a07 e968f9ffff                     jmp        0x7fd333e59e74
00a0c 8be9                           mov        ebp, ecx
00a0e 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a16 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a1a 90                             nop        
00a1b e84013aaff                     call       0x7fd3338fb860
00a20 0f1f8400180b0002               nop        dword ptr [rax + rax + 0x2000b18]
00a28 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a2d 41c1e303                       shl        r11d, 3
00a31 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a36 41c1e203                       shl        r10d, 3
00a3a 452bd3                         sub        r10d, r11d
00a3d 4181c2c0000000                 add        r10d, 0xc0
00a44 c462a9f7d0                     shlx       r10, rax, r10
00a49 e926f9ffff                     jmp        0x7fd333e59e74
00a4e 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a56 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a5e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a63 4d3bd3                         cmp        r10, r11
00a66 7e31                           jle        0x7fd333e5a599
00a68 48be702274e200000000           movabs     rsi, 0xe2742270
00a72 90                             nop        
00a73 e8e812aaff                     call       0x7fd3338fb860
00a78 0f1f8400700b0003               nop        dword ptr [rax + rax + 0x3000b70]
00a80 4885c0                         test       rax, rax
00a83 0f84b31e0000                   je         0x7fd333e5c43c
00a89 488bf0                         mov        rsi, rax
00a8c 4881c430010000                 add        rsp, 0x130
00a93 5d                             pop        rbp
00a94 e947efb6ff                     jmp        0x7fd3339c94e0
00a99 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a9e 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00aa3 0f85a71e0000                   jne        0x7fd333e5c450
00aa9 418bc2                         mov        eax, r10d
00aac 4881c430010000                 add        rsp, 0x130
00ab3 5d                             pop        rbp
00ab4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ab8 0f87f41e0000                   ja         0x7fd333e5c4b2
00abe c3                             ret        
00abf 4533db                         xor        r11d, r11d
00ac2 4533d2                         xor        r10d, r10d
00ac5 4533c9                         xor        r9d, r9d
00ac8 4533c0                         xor        r8d, r8d
00acb 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00ad3 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00adb 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
00ae3 4489842404010000               mov        dword ptr [rsp + 0x104], r8d
00aeb e9f4fbffff                     jmp        0x7fd333e5a1e4
00af0 bee4ffffff                     mov        esi, 0xffffffe4
00af5 48894424f8                     mov        qword ptr [rsp - 8], rax
00afa 8b442408                       mov        eax, dword ptr [rsp + 8]
00afe 890424                         mov        dword ptr [rsp], eax
00b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b06 48894424f8                     mov        qword ptr [rsp - 8], rax
00b0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b0f 89442404                       mov        dword ptr [rsp + 4], eax
00b13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b18 48ff742410                     push       qword ptr [rsp + 0x10]
00b1d 488f442408                     pop        qword ptr [rsp + 8]
00b22 48ff742418                     push       qword ptr [rsp + 0x18]
00b27 488f442410                     pop        qword ptr [rsp + 0x10]
00b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b35 89442418                       mov        dword ptr [rsp + 0x18], eax
00b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b50 48894424f8                     mov        qword ptr [rsp - 8], rax
00b55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b59 89442420                       mov        dword ptr [rsp + 0x20], eax
00b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b62 48894424f8                     mov        qword ptr [rsp - 8], rax
00b67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b6b 89442424                       mov        dword ptr [rsp + 0x24], eax
00b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b79 48ff742438                     push       qword ptr [rsp + 0x38]
00b7e 488f442430                     pop        qword ptr [rsp + 0x30]
00b83 48894424f8                     mov        qword ptr [rsp - 8], rax
00b88 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b8c 89442438                       mov        dword ptr [rsp + 0x38], eax
00b90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b95 48894424f8                     mov        qword ptr [rsp - 8], rax
00b9a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ba2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba7 48ff742448                     push       qword ptr [rsp + 0x48]
00bac 488f442440                     pop        qword ptr [rsp + 0x40]
00bb1 48ff742450                     push       qword ptr [rsp + 0x50]
00bb6 488f442448                     pop        qword ptr [rsp + 0x48]
00bbb 48ff742458                     push       qword ptr [rsp + 0x58]
00bc0 488f442450                     pop        qword ptr [rsp + 0x50]
00bc5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bcd 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00bd4 666690                         nop        
00bd7 e8848fb6ff                     call       0x7fd3339c3660
00bdc 0f1f8400d40c0004               nop        dword ptr [rax + rax + 0x4000cd4]
00be4 bee4ffffff                     mov        esi, 0xffffffe4
00be9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bee 8b442408                       mov        eax, dword ptr [rsp + 8]
00bf2 890424                         mov        dword ptr [rsp], eax
00bf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
00bff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c03 89442404                       mov        dword ptr [rsp + 4], eax
00c07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c0c 48ff742410                     push       qword ptr [rsp + 0x10]
00c11 488f442408                     pop        qword ptr [rsp + 8]
00c16 48ff742418                     push       qword ptr [rsp + 0x18]
00c1b 488f442410                     pop        qword ptr [rsp + 0x10]
00c20 48894424f8                     mov        qword ptr [rsp - 8], rax
00c25 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c29 89442418                       mov        dword ptr [rsp + 0x18], eax
00c2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c32 48894424f8                     mov        qword ptr [rsp - 8], rax
00c37 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c3b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c44 48894424f8                     mov        qword ptr [rsp - 8], rax
00c49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c4d 89442420                       mov        dword ptr [rsp + 0x20], eax
00c51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c56 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c5f 89442424                       mov        dword ptr [rsp + 0x24], eax
00c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c68 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c6d 48ff742438                     push       qword ptr [rsp + 0x38]
00c72 488f442430                     pop        qword ptr [rsp + 0x30]
00c77 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c80 89442438                       mov        dword ptr [rsp + 0x38], eax
00c84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c89 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c92 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c9b 48ff742448                     push       qword ptr [rsp + 0x48]
00ca0 488f442440                     pop        qword ptr [rsp + 0x40]
00ca5 48ff742450                     push       qword ptr [rsp + 0x50]
00caa 488f442448                     pop        qword ptr [rsp + 0x48]
00caf 48ff742458                     push       qword ptr [rsp + 0x58]
00cb4 488f442450                     pop        qword ptr [rsp + 0x50]
00cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cbe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cc5 89442458                       mov        dword ptr [rsp + 0x58], eax
00cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cce 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cda 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce3 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00cea 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00cf2 90                             nop        
00cf3 e8688eb6ff                     call       0x7fd3339c3660
00cf8 0f1f8400f00d0005               nop        dword ptr [rax + rax + 0x5000df0]
00d00 bee4ffffff                     mov        esi, 0xffffffe4
00d05 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0a 8b442408                       mov        eax, dword ptr [rsp + 8]
00d0e 890424                         mov        dword ptr [rsp], eax
00d11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d16 48894424f8                     mov        qword ptr [rsp - 8], rax
00d1b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d1f 89442404                       mov        dword ptr [rsp + 4], eax
00d23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d28 48ff742410                     push       qword ptr [rsp + 0x10]
00d2d 488f442408                     pop        qword ptr [rsp + 8]
00d32 48ff742418                     push       qword ptr [rsp + 0x18]
00d37 488f442410                     pop        qword ptr [rsp + 0x10]
00d3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d41 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d45 89442418                       mov        dword ptr [rsp + 0x18], eax
00d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d53 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d60 48894424f8                     mov        qword ptr [rsp - 8], rax
00d65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d69 89442420                       mov        dword ptr [rsp + 0x20], eax
00d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d72 48894424f8                     mov        qword ptr [rsp - 8], rax
00d77 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d7b 89442424                       mov        dword ptr [rsp + 0x24], eax
00d7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d84 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d89 48ff742438                     push       qword ptr [rsp + 0x38]
00d8e 488f442430                     pop        qword ptr [rsp + 0x30]
00d93 48894424f8                     mov        qword ptr [rsp - 8], rax
00d98 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d9c 89442438                       mov        dword ptr [rsp + 0x38], eax
00da0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da5 48894424f8                     mov        qword ptr [rsp - 8], rax
00daa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00db2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db7 48ff742448                     push       qword ptr [rsp + 0x48]
00dbc 488f442440                     pop        qword ptr [rsp + 0x40]
00dc1 48ff742450                     push       qword ptr [rsp + 0x50]
00dc6 488f442448                     pop        qword ptr [rsp + 0x48]
00dcb 48ff742458                     push       qword ptr [rsp + 0x58]
00dd0 488f442450                     pop        qword ptr [rsp + 0x50]
00dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
00dda 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00de1 89442458                       mov        dword ptr [rsp + 0x58], eax
00de5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dea 48894424f8                     mov        qword ptr [rsp - 8], rax
00def 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00df6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dff 48894424f8                     mov        qword ptr [rsp - 8], rax
00e04 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e0b 89442460                       mov        dword ptr [rsp + 0x60], eax
00e0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e14 48894424f8                     mov        qword ptr [rsp - 8], rax
00e19 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e20 89442464                       mov        dword ptr [rsp + 0x64], eax
00e24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e29 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e31 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00e39 6690                           nop        
00e3b e8208db6ff                     call       0x7fd3339c3660
00e40 0f1f8400380f0006               nop        dword ptr [rax + rax + 0x6000f38]
00e48 bee4ffffff                     mov        esi, 0xffffffe4
00e4d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e52 8b442408                       mov        eax, dword ptr [rsp + 8]
00e56 890424                         mov        dword ptr [rsp], eax
00e59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e63 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e67 89442404                       mov        dword ptr [rsp + 4], eax
00e6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e70 48ff742410                     push       qword ptr [rsp + 0x10]
00e75 488f442408                     pop        qword ptr [rsp + 8]
00e7a 48ff742418                     push       qword ptr [rsp + 0x18]
00e7f 488f442410                     pop        qword ptr [rsp + 0x10]
00e84 48894424f8                     mov        qword ptr [rsp - 8], rax
00e89 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e8d 89442418                       mov        dword ptr [rsp + 0x18], eax
00e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e96 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e9f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ea3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ead 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00eb1 89442420                       mov        dword ptr [rsp + 0x20], eax
00eb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eba 48894424f8                     mov        qword ptr [rsp - 8], rax
00ebf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ec3 89442424                       mov        dword ptr [rsp + 0x24], eax
00ec7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ecc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ed1 48ff742438                     push       qword ptr [rsp + 0x38]
00ed6 488f442430                     pop        qword ptr [rsp + 0x30]
00edb 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ee4 89442438                       mov        dword ptr [rsp + 0x38], eax
00ee8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eed 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ef6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00efa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eff 48ff742448                     push       qword ptr [rsp + 0x48]
00f04 488f442440                     pop        qword ptr [rsp + 0x40]
00f09 48ff742450                     push       qword ptr [rsp + 0x50]
00f0e 488f442448                     pop        qword ptr [rsp + 0x48]
00f13 48ff742458                     push       qword ptr [rsp + 0x58]
00f18 488f442450                     pop        qword ptr [rsp + 0x50]
00f1d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f22 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f29 89442458                       mov        dword ptr [rsp + 0x58], eax
00f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f32 48894424f8                     mov        qword ptr [rsp - 8], rax
00f37 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f47 48894424f8                     mov        qword ptr [rsp - 8], rax
00f4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f53 89442460                       mov        dword ptr [rsp + 0x60], eax
00f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f5c 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00f64 488f442478                     pop        qword ptr [rsp + 0x78]
00f69 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f75 89442464                       mov        dword ptr [rsp + 0x64], eax
00f79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f7e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f83 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f8a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f96 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fa2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fae 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fba 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fce 488f842490000000               pop        qword ptr [rsp + 0x90]
00fd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdb 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fe2 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fee 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00ff6 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00ffe 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01006 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0100e 90                             nop        
0100f e84c8bb6ff                     call       0x7fd3339c3660
01014 0f1f84000c110007               nop        dword ptr [rax + rax + 0x700110c]
0101c 4533c0                         xor        r8d, r8d
0101f 4d3bc8                         cmp        r9, r8
01022 bdffffffff                     mov        ebp, 0xffffffff
01027 7c08                           jl         0x7fd333e5ab31
01029 400f95c5                       setne      bpl
0102d 400fb6ed                       movzx      ebp, bpl
01031 be45ffffff                     mov        esi, 0xffffff45
01036 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0103b 48894424f8                     mov        qword ptr [rsp - 8], rax
01040 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01047 89442460                       mov        dword ptr [rsp + 0x60], eax
0104b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01050 48894424f8                     mov        qword ptr [rsp - 8], rax
01055 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0105c 89442464                       mov        dword ptr [rsp + 0x64], eax
01060 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01065 48894424f8                     mov        qword ptr [rsp - 8], rax
0106a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01071 89442468                       mov        dword ptr [rsp + 0x68], eax
01075 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0107a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01082 488f842480000000               pop        qword ptr [rsp + 0x80]
0108a 48894424f8                     mov        qword ptr [rsp - 8], rax
0108f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01096 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0109a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109f 48894424f8                     mov        qword ptr [rsp - 8], rax
010a4 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010ab 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b7 48894424f8                     mov        qword ptr [rsp - 8], rax
010bc 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010c3 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010cf 48894424f8                     mov        qword ptr [rsp - 8], rax
010d4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010db 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010ef 488f842498000000               pop        qword ptr [rsp + 0x98]
010f7 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010ff 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01107 48894424f8                     mov        qword ptr [rsp - 8], rax
0110c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01113 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0111a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111f 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01127 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0112f 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01136 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0113e 90                             nop        
0113f e81c8ab6ff                     call       0x7fd3339c3660
01144 0f1f84003c120008               nop        dword ptr [rax + rax + 0x800123c]
0114c be45ffffff                     mov        esi, 0xffffff45
01151 48894424f8                     mov        qword ptr [rsp - 8], rax
01156 8b442408                       mov        eax, dword ptr [rsp + 8]
0115a 890424                         mov        dword ptr [rsp], eax
0115d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01162 48894424f8                     mov        qword ptr [rsp - 8], rax
01167 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0116b 89442404                       mov        dword ptr [rsp + 4], eax
0116f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01174 48ff742410                     push       qword ptr [rsp + 0x10]
01179 488f442408                     pop        qword ptr [rsp + 8]
0117e 48ff742418                     push       qword ptr [rsp + 0x18]
01183 488f442410                     pop        qword ptr [rsp + 0x10]
01188 48894424f8                     mov        qword ptr [rsp - 8], rax
0118d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01191 89442418                       mov        dword ptr [rsp + 0x18], eax
01195 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0119a 48894424f8                     mov        qword ptr [rsp - 8], rax
0119f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
011a3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
011a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ac 48894424f8                     mov        qword ptr [rsp - 8], rax
011b1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011b5 89442420                       mov        dword ptr [rsp + 0x20], eax
011b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011be 48894424f8                     mov        qword ptr [rsp - 8], rax
011c3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011c7 89442424                       mov        dword ptr [rsp + 0x24], eax
011cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011d5 48ff742438                     push       qword ptr [rsp + 0x38]
011da 488f442430                     pop        qword ptr [rsp + 0x30]
011df 48894424f8                     mov        qword ptr [rsp - 8], rax
011e4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011e8 89442438                       mov        dword ptr [rsp + 0x38], eax
011ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f1 48894424f8                     mov        qword ptr [rsp - 8], rax
011f6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011fa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01203 48ff742448                     push       qword ptr [rsp + 0x48]
01208 488f442440                     pop        qword ptr [rsp + 0x40]
0120d 48ff742450                     push       qword ptr [rsp + 0x50]
01212 488f442448                     pop        qword ptr [rsp + 0x48]
01217 48ff742458                     push       qword ptr [rsp + 0x58]
0121c 488f442450                     pop        qword ptr [rsp + 0x50]
01221 48894424f8                     mov        qword ptr [rsp - 8], rax
01226 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0122d 89442458                       mov        dword ptr [rsp + 0x58], eax
01231 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01236 48894424f8                     mov        qword ptr [rsp - 8], rax
0123b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01242 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01246 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124b 48894424f8                     mov        qword ptr [rsp - 8], rax
01250 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01257 89442460                       mov        dword ptr [rsp + 0x60], eax
0125b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01260 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01268 488f442468                     pop        qword ptr [rsp + 0x68]
0126d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01275 488f442478                     pop        qword ptr [rsp + 0x78]
0127a 48894424f8                     mov        qword ptr [rsp - 8], rax
0127f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01286 89442464                       mov        dword ptr [rsp + 0x64], eax
0128a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128f 48894424f8                     mov        qword ptr [rsp - 8], rax
01294 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0129b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
012a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a7 48894424f8                     mov        qword ptr [rsp - 8], rax
012ac 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012b3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bf 48894424f8                     mov        qword ptr [rsp - 8], rax
012c4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012cb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012df 488f842490000000               pop        qword ptr [rsp + 0x90]
012e7 48894424f8                     mov        qword ptr [rsp - 8], rax
012ec 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012f3 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ff 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01307 e85488b6ff                     call       0x7fd3339c3660
0130c 0f1f840004140009               nop        dword ptr [rax + rax + 0x9001404]
01314 be45ffffff                     mov        esi, 0xffffff45
01319 48894424f8                     mov        qword ptr [rsp - 8], rax
0131e 8b442408                       mov        eax, dword ptr [rsp + 8]
01322 890424                         mov        dword ptr [rsp], eax
01325 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132a 48894424f8                     mov        qword ptr [rsp - 8], rax
0132f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01333 89442404                       mov        dword ptr [rsp + 4], eax
01337 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133c 48ff742410                     push       qword ptr [rsp + 0x10]
01341 488f442408                     pop        qword ptr [rsp + 8]
01346 48ff742418                     push       qword ptr [rsp + 0x18]
0134b 488f442410                     pop        qword ptr [rsp + 0x10]
01350 48894424f8                     mov        qword ptr [rsp - 8], rax
01355 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01359 89442418                       mov        dword ptr [rsp + 0x18], eax
0135d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01362 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01367 e8f487b6ff                     call       0x7fd3339c3660
0136c 0f1f84006414000a               nop        dword ptr [rax + rax + 0xa001464]
01374 be45ffffff                     mov        esi, 0xffffff45
01379 48894424f8                     mov        qword ptr [rsp - 8], rax
0137e 8b442408                       mov        eax, dword ptr [rsp + 8]
01382 890424                         mov        dword ptr [rsp], eax
01385 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0138a 48894424f8                     mov        qword ptr [rsp - 8], rax
0138f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01393 89442404                       mov        dword ptr [rsp + 4], eax
01397 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139c 48ff742410                     push       qword ptr [rsp + 0x10]
013a1 488f442408                     pop        qword ptr [rsp + 8]
013a6 48ff742418                     push       qword ptr [rsp + 0x18]
013ab 488f442410                     pop        qword ptr [rsp + 0x10]
013b0 48894424f8                     mov        qword ptr [rsp - 8], rax
013b5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013b9 89442418                       mov        dword ptr [rsp + 0x18], eax
013bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c2 48894424f8                     mov        qword ptr [rsp - 8], rax
013c7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013cb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d4 48894424f8                     mov        qword ptr [rsp - 8], rax
013d9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013dd 89442420                       mov        dword ptr [rsp + 0x20], eax
013e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e6 48894424f8                     mov        qword ptr [rsp - 8], rax
013eb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013ef 89442424                       mov        dword ptr [rsp + 0x24], eax
013f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013fd 48ff742438                     push       qword ptr [rsp + 0x38]
01402 488f442430                     pop        qword ptr [rsp + 0x30]
01407 48894424f8                     mov        qword ptr [rsp - 8], rax
0140c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01410 89442438                       mov        dword ptr [rsp + 0x38], eax
01414 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01419 48894424f8                     mov        qword ptr [rsp - 8], rax
0141e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01422 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142b 48ff742448                     push       qword ptr [rsp + 0x48]
01430 488f442440                     pop        qword ptr [rsp + 0x40]
01435 48ff742450                     push       qword ptr [rsp + 0x50]
0143a 488f442448                     pop        qword ptr [rsp + 0x48]
0143f 48ff742458                     push       qword ptr [rsp + 0x58]
01444 488f442450                     pop        qword ptr [rsp + 0x50]
01449 48894424f8                     mov        qword ptr [rsp - 8], rax
0144e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01455 89442458                       mov        dword ptr [rsp + 0x58], eax
01459 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145e 48894424f8                     mov        qword ptr [rsp - 8], rax
01463 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0146a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0146e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01473 48894424f8                     mov        qword ptr [rsp - 8], rax
01478 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0147f 89442460                       mov        dword ptr [rsp + 0x60], eax
01483 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01488 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01490 488f442468                     pop        qword ptr [rsp + 0x68]
01495 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0149d 488f442470                     pop        qword ptr [rsp + 0x70]
014a2 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
014aa 488f442478                     pop        qword ptr [rsp + 0x78]
014af 48894424f8                     mov        qword ptr [rsp - 8], rax
014b4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014bb 89442464                       mov        dword ptr [rsp + 0x64], eax
014bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c4 48894424f8                     mov        qword ptr [rsp - 8], rax
014c9 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014d0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014dc 48894424f8                     mov        qword ptr [rsp - 8], rax
014e1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014e8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f4 48894424f8                     mov        qword ptr [rsp - 8], rax
014f9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01500 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01514 488f842490000000               pop        qword ptr [rsp + 0x90]
0151c 48894424f8                     mov        qword ptr [rsp - 8], rax
01521 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01528 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0152f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01534 666690                         nop        
01537 e82486b6ff                     call       0x7fd3339c3660
0153c 0f1f84003416000b               nop        dword ptr [rax + rax + 0xb001634]
01544 be45ffffff                     mov        esi, 0xffffff45
01549 48894424f8                     mov        qword ptr [rsp - 8], rax
0154e 8b442408                       mov        eax, dword ptr [rsp + 8]
01552 890424                         mov        dword ptr [rsp], eax
01555 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155a 48894424f8                     mov        qword ptr [rsp - 8], rax
0155f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01563 89442404                       mov        dword ptr [rsp + 4], eax
01567 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156c 48ff742410                     push       qword ptr [rsp + 0x10]
01571 488f442408                     pop        qword ptr [rsp + 8]
01576 48ff742418                     push       qword ptr [rsp + 0x18]
0157b 488f442410                     pop        qword ptr [rsp + 0x10]
01580 48894424f8                     mov        qword ptr [rsp - 8], rax
01585 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01589 89442418                       mov        dword ptr [rsp + 0x18], eax
0158d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01592 48894424f8                     mov        qword ptr [rsp - 8], rax
01597 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0159b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0159f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a4 48894424f8                     mov        qword ptr [rsp - 8], rax
015a9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015ad 89442420                       mov        dword ptr [rsp + 0x20], eax
015b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b6 48894424f8                     mov        qword ptr [rsp - 8], rax
015bb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015bf 89442424                       mov        dword ptr [rsp + 0x24], eax
015c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015cd 48ff742438                     push       qword ptr [rsp + 0x38]
015d2 488f442430                     pop        qword ptr [rsp + 0x30]
015d7 48894424f8                     mov        qword ptr [rsp - 8], rax
015dc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015e0 89442438                       mov        dword ptr [rsp + 0x38], eax
015e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e9 48894424f8                     mov        qword ptr [rsp - 8], rax
015ee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fb 48ff742448                     push       qword ptr [rsp + 0x48]
01600 488f442440                     pop        qword ptr [rsp + 0x40]
01605 48ff742450                     push       qword ptr [rsp + 0x50]
0160a 488f442448                     pop        qword ptr [rsp + 0x48]
0160f 48ff742458                     push       qword ptr [rsp + 0x58]
01614 488f442450                     pop        qword ptr [rsp + 0x50]
01619 48894424f8                     mov        qword ptr [rsp - 8], rax
0161e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01625 89442458                       mov        dword ptr [rsp + 0x58], eax
01629 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162e 48894424f8                     mov        qword ptr [rsp - 8], rax
01633 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0163a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0163e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01643 48894424f8                     mov        qword ptr [rsp - 8], rax
01648 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0164f 89442460                       mov        dword ptr [rsp + 0x60], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01660 488f442468                     pop        qword ptr [rsp + 0x68]
01665 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0166d 488f442470                     pop        qword ptr [rsp + 0x70]
01672 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0167a 488f442478                     pop        qword ptr [rsp + 0x78]
0167f 48894424f8                     mov        qword ptr [rsp - 8], rax
01684 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0168b 89442464                       mov        dword ptr [rsp + 0x64], eax
0168f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01694 48894424f8                     mov        qword ptr [rsp - 8], rax
01699 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
016a0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
016a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ac 48894424f8                     mov        qword ptr [rsp - 8], rax
016b1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016b8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c4 48894424f8                     mov        qword ptr [rsp - 8], rax
016c9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016d0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016dc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016e4 488f842490000000               pop        qword ptr [rsp + 0x90]
016ec 48894424f8                     mov        qword ptr [rsp - 8], rax
016f1 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016f8 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01704 48894424f8                     mov        qword ptr [rsp - 8], rax
01709 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01710 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01717 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171c 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01724 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0172c 666690                         nop        
0172f e82c84b6ff                     call       0x7fd3339c3660
01734 0f1f84002c18000c               nop        dword ptr [rax + rax + 0xc00182c]
0173c be45ffffff                     mov        esi, 0xffffff45
01741 48894424f8                     mov        qword ptr [rsp - 8], rax
01746 8b442408                       mov        eax, dword ptr [rsp + 8]
0174a 890424                         mov        dword ptr [rsp], eax
0174d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01752 48894424f8                     mov        qword ptr [rsp - 8], rax
01757 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0175b 89442404                       mov        dword ptr [rsp + 4], eax
0175f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01764 48ff742410                     push       qword ptr [rsp + 0x10]
01769 488f442408                     pop        qword ptr [rsp + 8]
0176e 48ff742418                     push       qword ptr [rsp + 0x18]
01773 488f442410                     pop        qword ptr [rsp + 0x10]
01778 48894424f8                     mov        qword ptr [rsp - 8], rax
0177d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01781 89442418                       mov        dword ptr [rsp + 0x18], eax
01785 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178a 48894424f8                     mov        qword ptr [rsp - 8], rax
0178f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01793 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01797 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179c 48894424f8                     mov        qword ptr [rsp - 8], rax
017a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017a5 89442420                       mov        dword ptr [rsp + 0x20], eax
017a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ae 48894424f8                     mov        qword ptr [rsp - 8], rax
017b3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
017b7 89442424                       mov        dword ptr [rsp + 0x24], eax
017bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017c5 48ff742438                     push       qword ptr [rsp + 0x38]
017ca 488f442430                     pop        qword ptr [rsp + 0x30]
017cf 48894424f8                     mov        qword ptr [rsp - 8], rax
017d4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017d8 89442438                       mov        dword ptr [rsp + 0x38], eax
017dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e1 48894424f8                     mov        qword ptr [rsp - 8], rax
017e6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f3 48ff742448                     push       qword ptr [rsp + 0x48]
017f8 488f442440                     pop        qword ptr [rsp + 0x40]
017fd 48ff742450                     push       qword ptr [rsp + 0x50]
01802 488f442448                     pop        qword ptr [rsp + 0x48]
01807 48ff742458                     push       qword ptr [rsp + 0x58]
0180c 488f442450                     pop        qword ptr [rsp + 0x50]
01811 48894424f8                     mov        qword ptr [rsp - 8], rax
01816 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0181d 89442458                       mov        dword ptr [rsp + 0x58], eax
01821 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01826 48894424f8                     mov        qword ptr [rsp - 8], rax
0182b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01832 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01836 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183b 48894424f8                     mov        qword ptr [rsp - 8], rax
01840 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01847 89442460                       mov        dword ptr [rsp + 0x60], eax
0184b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01850 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01858 488f442468                     pop        qword ptr [rsp + 0x68]
0185d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01865 488f442470                     pop        qword ptr [rsp + 0x70]
0186a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01872 488f442478                     pop        qword ptr [rsp + 0x78]
01877 48894424f8                     mov        qword ptr [rsp - 8], rax
0187c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01883 89442464                       mov        dword ptr [rsp + 0x64], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48894424f8                     mov        qword ptr [rsp - 8], rax
01891 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01898 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 48894424f8                     mov        qword ptr [rsp - 8], rax
018a9 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
018b0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
018b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bc 48894424f8                     mov        qword ptr [rsp - 8], rax
018c1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018c8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018dc 488f842490000000               pop        qword ptr [rsp + 0x90]
018e4 48894424f8                     mov        qword ptr [rsp - 8], rax
018e9 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018f0 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01901 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01908 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0190f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01914 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0191c 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01924 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
0192c 666690                         nop        
0192f e82c82b6ff                     call       0x7fd3339c3660
01934 0f1f84002c1a000d               nop        dword ptr [rax + rax + 0xd001a2c]
0193c be45ffffff                     mov        esi, 0xffffff45
01941 48894424f8                     mov        qword ptr [rsp - 8], rax
01946 8b442408                       mov        eax, dword ptr [rsp + 8]
0194a 890424                         mov        dword ptr [rsp], eax
0194d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0195b 89442404                       mov        dword ptr [rsp + 4], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48ff742410                     push       qword ptr [rsp + 0x10]
01969 488f442408                     pop        qword ptr [rsp + 8]
0196e 48ff742418                     push       qword ptr [rsp + 0x18]
01973 488f442410                     pop        qword ptr [rsp + 0x10]
01978 48894424f8                     mov        qword ptr [rsp - 8], rax
0197d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01981 89442418                       mov        dword ptr [rsp + 0x18], eax
01985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198a 48894424f8                     mov        qword ptr [rsp - 8], rax
0198f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01993 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199c 48894424f8                     mov        qword ptr [rsp - 8], rax
019a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019a5 89442420                       mov        dword ptr [rsp + 0x20], eax
019a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ae 48894424f8                     mov        qword ptr [rsp - 8], rax
019b3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
019b7 89442424                       mov        dword ptr [rsp + 0x24], eax
019bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019c5 48ff742438                     push       qword ptr [rsp + 0x38]
019ca 488f442430                     pop        qword ptr [rsp + 0x30]
019cf 48894424f8                     mov        qword ptr [rsp - 8], rax
019d4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019d8 89442438                       mov        dword ptr [rsp + 0x38], eax
019dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e1 48894424f8                     mov        qword ptr [rsp - 8], rax
019e6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f3 48ff742448                     push       qword ptr [rsp + 0x48]
019f8 488f442440                     pop        qword ptr [rsp + 0x40]
019fd 48ff742450                     push       qword ptr [rsp + 0x50]
01a02 488f442448                     pop        qword ptr [rsp + 0x48]
01a07 48ff742458                     push       qword ptr [rsp + 0x58]
01a0c 488f442450                     pop        qword ptr [rsp + 0x50]
01a11 48894424f8                     mov        qword ptr [rsp - 8], rax
01a16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a1d 89442458                       mov        dword ptr [rsp + 0x58], eax
01a21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a26 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a47 89442460                       mov        dword ptr [rsp + 0x60], eax
01a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a50 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a58 488f442468                     pop        qword ptr [rsp + 0x68]
01a5d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a65 488f442478                     pop        qword ptr [rsp + 0x78]
01a6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a76 89442464                       mov        dword ptr [rsp + 0x64], eax
01a7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a84 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a8b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a97 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01aa3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01aaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01abb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ac2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01acf 488f842490000000               pop        qword ptr [rsp + 0x90]
01ad7 48894424f8                     mov        qword ptr [rsp - 8], rax
01adc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ae3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01aea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aef 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01af7 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01aff 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01b06 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b0e 90                             nop        
01b0f e84c80b6ff                     call       0x7fd3339c3660
01b14 0f1f84000c1c000e               nop        dword ptr [rax + rax + 0xe001c0c]
01b1c be45ffffff                     mov        esi, 0xffffff45
01b21 41b8ffffff7f                   mov        r8d, 0x7fffffff
01b27 4d3bc8                         cmp        r9, r8
01b2a bdffffffff                     mov        ebp, 0xffffffff
01b2f 7c08                           jl         0x7fd333e5b639
01b31 400f95c5                       setne      bpl
01b35 400fb6ed                       movzx      ebp, bpl
01b39 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b4a 89442460                       mov        dword ptr [rsp + 0x60], eax
01b4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b53 48894424f8                     mov        qword ptr [rsp - 8], rax
01b58 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b5f 89442464                       mov        dword ptr [rsp + 0x64], eax
01b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b68 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b74 89442468                       mov        dword ptr [rsp + 0x68], eax
01b78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b85 488f842480000000               pop        qword ptr [rsp + 0x80]
01b8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b92 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b99 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01bae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01bb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bba 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01bc6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bcd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bde 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bea 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bf2 488f842498000000               pop        qword ptr [rsp + 0x98]
01bfa 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01c02 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01c0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0f 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01c16 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01c1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c22 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c2a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01c32 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01c39 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c41 6690                           nop        
01c43 e8187fb6ff                     call       0x7fd3339c3660
01c48 0f1f8400401d000f               nop        dword ptr [rax + rax + 0xf001d40]
01c50 be45ffffff                     mov        esi, 0xffffff45
01c55 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5a 8b442408                       mov        eax, dword ptr [rsp + 8]
01c5e 890424                         mov        dword ptr [rsp], eax
01c61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c66 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c6f 89442404                       mov        dword ptr [rsp + 4], eax
01c73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c78 48ff742410                     push       qword ptr [rsp + 0x10]
01c7d 488f442408                     pop        qword ptr [rsp + 8]
01c82 48ff742418                     push       qword ptr [rsp + 0x18]
01c87 488f442410                     pop        qword ptr [rsp + 0x10]
01c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c91 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c95 89442418                       mov        dword ptr [rsp + 0x18], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01ca7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01cab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cb9 89442420                       mov        dword ptr [rsp + 0x20], eax
01cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ccb 89442424                       mov        dword ptr [rsp + 0x24], eax
01ccf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01cd9 48ff742438                     push       qword ptr [rsp + 0x38]
01cde 488f442430                     pop        qword ptr [rsp + 0x30]
01ce3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01cec 89442438                       mov        dword ptr [rsp + 0x38], eax
01cf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cfe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d07 48ff742448                     push       qword ptr [rsp + 0x48]
01d0c 488f442440                     pop        qword ptr [rsp + 0x40]
01d11 48ff742450                     push       qword ptr [rsp + 0x50]
01d16 488f442448                     pop        qword ptr [rsp + 0x48]
01d1b 48ff742458                     push       qword ptr [rsp + 0x58]
01d20 488f442450                     pop        qword ptr [rsp + 0x50]
01d25 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d31 89442458                       mov        dword ptr [rsp + 0x58], eax
01d35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d46 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d54 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d5b 89442460                       mov        dword ptr [rsp + 0x60], eax
01d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d64 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01d69 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d75 89442464                       mov        dword ptr [rsp + 0x64], eax
01d79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d83 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d8a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d96 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01da2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dae 48894424f8                     mov        qword ptr [rsp - 8], rax
01db3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01dba 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01dc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc6 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01dce 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01dd5 6690                           nop        
01dd7 e8847db6ff                     call       0x7fd3339c3660
01ddc 0f1f8400d41e0010               nop        dword ptr [rax + rax + 0x10001ed4]
01de4 be45ffffff                     mov        esi, 0xffffff45
01de9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dee 8b442408                       mov        eax, dword ptr [rsp + 8]
01df2 890424                         mov        dword ptr [rsp], eax
01df5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01dff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01e03 89442404                       mov        dword ptr [rsp + 4], eax
01e07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0c 48ff742410                     push       qword ptr [rsp + 0x10]
01e11 488f442408                     pop        qword ptr [rsp + 8]
01e16 48ff742418                     push       qword ptr [rsp + 0x18]
01e1b 488f442410                     pop        qword ptr [rsp + 0x10]
01e20 48894424f8                     mov        qword ptr [rsp - 8], rax
01e25 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e29 89442418                       mov        dword ptr [rsp + 0x18], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e3b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e4d 89442420                       mov        dword ptr [rsp + 0x20], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e5f 89442424                       mov        dword ptr [rsp + 0x24], eax
01e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e68 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e6d 48ff742438                     push       qword ptr [rsp + 0x38]
01e72 488f442430                     pop        qword ptr [rsp + 0x30]
01e77 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e80 89442438                       mov        dword ptr [rsp + 0x38], eax
01e84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e89 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e92 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9b 48ff742448                     push       qword ptr [rsp + 0x48]
01ea0 488f442440                     pop        qword ptr [rsp + 0x40]
01ea5 48ff742450                     push       qword ptr [rsp + 0x50]
01eaa 488f442448                     pop        qword ptr [rsp + 0x48]
01eaf 48ff742458                     push       qword ptr [rsp + 0x58]
01eb4 488f442450                     pop        qword ptr [rsp + 0x50]
01eb9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ebe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ec5 89442458                       mov        dword ptr [rsp + 0x58], eax
01ec9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ece 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01eda 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ede 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01eef 89442460                       mov        dword ptr [rsp + 0x60], eax
01ef3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef8 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01efd 48894424f8                     mov        qword ptr [rsp - 8], rax
01f02 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01f09 89442464                       mov        dword ptr [rsp + 0x64], eax
01f0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f12 48894424f8                     mov        qword ptr [rsp - 8], rax
01f17 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f1e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f36 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f42 48894424f8                     mov        qword ptr [rsp - 8], rax
01f47 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f4e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f62 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01f6a 90                             nop        
01f6b e8f07bb6ff                     call       0x7fd3339c3660
01f70 0f1f840068200011               nop        dword ptr [rax + rax + 0x11002068]
01f78 be3dffffff                     mov        esi, 0xffffff3d
01f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f82 8b442408                       mov        eax, dword ptr [rsp + 8]
01f86 890424                         mov        dword ptr [rsp], eax
01f89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f93 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f97 89442404                       mov        dword ptr [rsp + 4], eax
01f9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa0 48ff742410                     push       qword ptr [rsp + 0x10]
01fa5 488f442408                     pop        qword ptr [rsp + 8]
01faa 48ff742418                     push       qword ptr [rsp + 0x18]
01faf 488f442410                     pop        qword ptr [rsp + 0x10]
01fb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01fbd 89442418                       mov        dword ptr [rsp + 0x18], eax
01fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fcf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fe1 89442420                       mov        dword ptr [rsp + 0x20], eax
01fe5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fea 48894424f8                     mov        qword ptr [rsp - 8], rax
01fef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ff3 89442424                       mov        dword ptr [rsp + 0x24], eax
01ff7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ffc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02001 48ff742438                     push       qword ptr [rsp + 0x38]
02006 488f442430                     pop        qword ptr [rsp + 0x30]
0200b 48894424f8                     mov        qword ptr [rsp - 8], rax
02010 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02014 89442438                       mov        dword ptr [rsp + 0x38], eax
02018 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201d 48894424f8                     mov        qword ptr [rsp - 8], rax
02022 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02026 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0202a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202f 48ff742448                     push       qword ptr [rsp + 0x48]
02034 488f442440                     pop        qword ptr [rsp + 0x40]
02039 48ff742450                     push       qword ptr [rsp + 0x50]
0203e 488f442448                     pop        qword ptr [rsp + 0x48]
02043 48ff742458                     push       qword ptr [rsp + 0x58]
02048 488f442450                     pop        qword ptr [rsp + 0x50]
0204d 48894424f8                     mov        qword ptr [rsp - 8], rax
02052 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02059 89442458                       mov        dword ptr [rsp + 0x58], eax
0205d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02062 48894424f8                     mov        qword ptr [rsp - 8], rax
02067 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0206e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02072 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02077 48894424f8                     mov        qword ptr [rsp - 8], rax
0207c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02083 89442460                       mov        dword ptr [rsp + 0x60], eax
02087 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208c 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02094 488f442478                     pop        qword ptr [rsp + 0x78]
02099 48894424f8                     mov        qword ptr [rsp - 8], rax
0209e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
020a5 89442464                       mov        dword ptr [rsp + 0x64], eax
020a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ae 48894424f8                     mov        qword ptr [rsp - 8], rax
020b3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
020ba 89842480000000                 mov        dword ptr [rsp + 0x80], eax
020c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c6 48894424f8                     mov        qword ptr [rsp - 8], rax
020cb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020d2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020de 48894424f8                     mov        qword ptr [rsp - 8], rax
020e3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020ea 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020fe 488f842490000000               pop        qword ptr [rsp + 0x90]
02106 48894424f8                     mov        qword ptr [rsp - 8], rax
0210b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02112 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02119 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02126 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0212e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02136 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0213e 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02146 48894424f8                     mov        qword ptr [rsp - 8], rax
0214b 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02152 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215e 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
02165 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0216d 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02175 6690                           nop        
02177 e8e479b6ff                     call       0x7fd3339c3660
0217c 0f1f840074220012               nop        dword ptr [rax + rax + 0x12002274]
02184 be45ffffff                     mov        esi, 0xffffff45
02189 48894424f8                     mov        qword ptr [rsp - 8], rax
0218e 8b442408                       mov        eax, dword ptr [rsp + 8]
02192 890424                         mov        dword ptr [rsp], eax
02195 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219a 48894424f8                     mov        qword ptr [rsp - 8], rax
0219f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
021a3 89442404                       mov        dword ptr [rsp + 4], eax
021a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ac 48ff742410                     push       qword ptr [rsp + 0x10]
021b1 488f442408                     pop        qword ptr [rsp + 8]
021b6 48ff742418                     push       qword ptr [rsp + 0x18]
021bb 488f442410                     pop        qword ptr [rsp + 0x10]
021c0 48894424f8                     mov        qword ptr [rsp - 8], rax
021c5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
021c9 89442418                       mov        dword ptr [rsp + 0x18], eax
021cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d2 48894424f8                     mov        qword ptr [rsp - 8], rax
021d7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021db 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e4 48894424f8                     mov        qword ptr [rsp - 8], rax
021e9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021ed 89442420                       mov        dword ptr [rsp + 0x20], eax
021f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f6 48894424f8                     mov        qword ptr [rsp - 8], rax
021fb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021ff 89442424                       mov        dword ptr [rsp + 0x24], eax
02203 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02208 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0220d 48ff742438                     push       qword ptr [rsp + 0x38]
02212 488f442430                     pop        qword ptr [rsp + 0x30]
02217 48894424f8                     mov        qword ptr [rsp - 8], rax
0221c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02220 89442438                       mov        dword ptr [rsp + 0x38], eax
02224 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02229 48894424f8                     mov        qword ptr [rsp - 8], rax
0222e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02232 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02236 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223b 48ff742448                     push       qword ptr [rsp + 0x48]
02240 488f442440                     pop        qword ptr [rsp + 0x40]
02245 48ff742450                     push       qword ptr [rsp + 0x50]
0224a 488f442448                     pop        qword ptr [rsp + 0x48]
0224f 48ff742458                     push       qword ptr [rsp + 0x58]
02254 488f442450                     pop        qword ptr [rsp + 0x50]
02259 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0225d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02265 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0226d 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02275 6690                           nop        
02277 e8e478b6ff                     call       0x7fd3339c3660
0227c 0f1f840074230013               nop        dword ptr [rax + rax + 0x13002374]
02284 be45ffffff                     mov        esi, 0xffffff45
02289 48894424f8                     mov        qword ptr [rsp - 8], rax
0228e 8b442408                       mov        eax, dword ptr [rsp + 8]
02292 890424                         mov        dword ptr [rsp], eax
02295 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229a 48894424f8                     mov        qword ptr [rsp - 8], rax
0229f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022a3 89442404                       mov        dword ptr [rsp + 4], eax
022a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ac 48ff742410                     push       qword ptr [rsp + 0x10]
022b1 488f442408                     pop        qword ptr [rsp + 8]
022b6 48ff742418                     push       qword ptr [rsp + 0x18]
022bb 488f442410                     pop        qword ptr [rsp + 0x10]
022c0 48894424f8                     mov        qword ptr [rsp - 8], rax
022c5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022c9 89442418                       mov        dword ptr [rsp + 0x18], eax
022cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d2 48894424f8                     mov        qword ptr [rsp - 8], rax
022d7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022db 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e4 48894424f8                     mov        qword ptr [rsp - 8], rax
022e9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022ed 89442420                       mov        dword ptr [rsp + 0x20], eax
022f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f6 48894424f8                     mov        qword ptr [rsp - 8], rax
022fb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022ff 89442424                       mov        dword ptr [rsp + 0x24], eax
02303 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02308 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0230d 48ff742438                     push       qword ptr [rsp + 0x38]
02312 488f442430                     pop        qword ptr [rsp + 0x30]
02317 48894424f8                     mov        qword ptr [rsp - 8], rax
0231c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02320 89442438                       mov        dword ptr [rsp + 0x38], eax
02324 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02329 48894424f8                     mov        qword ptr [rsp - 8], rax
0232e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02332 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02336 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233b 48ff742448                     push       qword ptr [rsp + 0x48]
02340 488f442440                     pop        qword ptr [rsp + 0x40]
02345 48ff742450                     push       qword ptr [rsp + 0x50]
0234a 488f442448                     pop        qword ptr [rsp + 0x48]
0234f 48ff742458                     push       qword ptr [rsp + 0x58]
02354 488f442450                     pop        qword ptr [rsp + 0x50]
02359 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02361 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02369 6690                           nop        
0236b e8f077b6ff                     call       0x7fd3339c3660
02370 0f1f840068240014               nop        dword ptr [rax + rax + 0x14002468]
02378 be45ffffff                     mov        esi, 0xffffff45
0237d 48894424f8                     mov        qword ptr [rsp - 8], rax
02382 8b442408                       mov        eax, dword ptr [rsp + 8]
02386 890424                         mov        dword ptr [rsp], eax
02389 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238e 48894424f8                     mov        qword ptr [rsp - 8], rax
02393 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02397 89442404                       mov        dword ptr [rsp + 4], eax
0239b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a0 48ff742410                     push       qword ptr [rsp + 0x10]
023a5 488f442408                     pop        qword ptr [rsp + 8]
023aa 48ff742418                     push       qword ptr [rsp + 0x18]
023af 488f442410                     pop        qword ptr [rsp + 0x10]
023b4 48894424f8                     mov        qword ptr [rsp - 8], rax
023b9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023bd 89442418                       mov        dword ptr [rsp + 0x18], eax
023c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c6 48894424f8                     mov        qword ptr [rsp - 8], rax
023cb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d8 48894424f8                     mov        qword ptr [rsp - 8], rax
023dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023e1 89442420                       mov        dword ptr [rsp + 0x20], eax
023e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ea 48894424f8                     mov        qword ptr [rsp - 8], rax
023ef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023f3 89442424                       mov        dword ptr [rsp + 0x24], eax
023f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02401 48ff742438                     push       qword ptr [rsp + 0x38]
02406 488f442430                     pop        qword ptr [rsp + 0x30]
0240b 48894424f8                     mov        qword ptr [rsp - 8], rax
02410 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02414 89442438                       mov        dword ptr [rsp + 0x38], eax
02418 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241d 48894424f8                     mov        qword ptr [rsp - 8], rax
02422 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02426 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0242a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242f 48ff742448                     push       qword ptr [rsp + 0x48]
02434 488f442440                     pop        qword ptr [rsp + 0x40]
02439 48ff742450                     push       qword ptr [rsp + 0x50]
0243e 488f442448                     pop        qword ptr [rsp + 0x48]
02443 48ff742458                     push       qword ptr [rsp + 0x58]
02448 488f442450                     pop        qword ptr [rsp + 0x50]
0244d 48894424f8                     mov        qword ptr [rsp - 8], rax
02452 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02459 89442458                       mov        dword ptr [rsp + 0x58], eax
0245d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02462 48894424f8                     mov        qword ptr [rsp - 8], rax
02467 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0246e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02472 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02477 48894424f8                     mov        qword ptr [rsp - 8], rax
0247c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02483 89442460                       mov        dword ptr [rsp + 0x60], eax
02487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02494 488f442468                     pop        qword ptr [rsp + 0x68]
02499 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
024a1 488f442470                     pop        qword ptr [rsp + 0x70]
024a6 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
024ae 488f442478                     pop        qword ptr [rsp + 0x78]
024b3 48894424f8                     mov        qword ptr [rsp - 8], rax
024b8 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
024bf 89442464                       mov        dword ptr [rsp + 0x64], eax
024c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c8 48894424f8                     mov        qword ptr [rsp - 8], rax
024cd 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024d4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e0 48894424f8                     mov        qword ptr [rsp - 8], rax
024e5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024ec 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f8 48894424f8                     mov        qword ptr [rsp - 8], rax
024fd 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02504 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0250b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02510 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02518 488f842490000000               pop        qword ptr [rsp + 0x90]
02520 48894424f8                     mov        qword ptr [rsp - 8], rax
02525 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0252c 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02538 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02540 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02548 666690                         nop        
0254b e81076b6ff                     call       0x7fd3339c3660
02550 0f1f840048260015               nop        dword ptr [rax + rax + 0x15002648]
02558 be45ffffff                     mov        esi, 0xffffff45
0255d 48894424f8                     mov        qword ptr [rsp - 8], rax
02562 8b442408                       mov        eax, dword ptr [rsp + 8]
02566 890424                         mov        dword ptr [rsp], eax
02569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256e 48894424f8                     mov        qword ptr [rsp - 8], rax
02573 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02577 89442404                       mov        dword ptr [rsp + 4], eax
0257b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02580 48ff742410                     push       qword ptr [rsp + 0x10]
02585 488f442408                     pop        qword ptr [rsp + 8]
0258a 48ff742418                     push       qword ptr [rsp + 0x18]
0258f 488f442410                     pop        qword ptr [rsp + 0x10]
02594 48894424f8                     mov        qword ptr [rsp - 8], rax
02599 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0259d 89442418                       mov        dword ptr [rsp + 0x18], eax
025a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a6 48894424f8                     mov        qword ptr [rsp - 8], rax
025ab 8b442424                       mov        eax, dword ptr [rsp + 0x24]
025af 8944241c                       mov        dword ptr [rsp + 0x1c], eax
025b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b8 48894424f8                     mov        qword ptr [rsp - 8], rax
025bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025c1 89442420                       mov        dword ptr [rsp + 0x20], eax
025c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ca 48894424f8                     mov        qword ptr [rsp - 8], rax
025cf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
025d3 89442424                       mov        dword ptr [rsp + 0x24], eax
025d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025dc 48ff742438                     push       qword ptr [rsp + 0x38]
025e1 488f442430                     pop        qword ptr [rsp + 0x30]
025e6 48894424f8                     mov        qword ptr [rsp - 8], rax
025eb 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025ef 89442438                       mov        dword ptr [rsp + 0x38], eax
025f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f8 48894424f8                     mov        qword ptr [rsp - 8], rax
025fd 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02601 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02605 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260a 48ff742448                     push       qword ptr [rsp + 0x48]
0260f 488f442440                     pop        qword ptr [rsp + 0x40]
02614 48ff742450                     push       qword ptr [rsp + 0x50]
02619 488f442448                     pop        qword ptr [rsp + 0x48]
0261e 48ff742458                     push       qword ptr [rsp + 0x58]
02623 488f442450                     pop        qword ptr [rsp + 0x50]
02628 48894424f8                     mov        qword ptr [rsp - 8], rax
0262d 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02634 89442458                       mov        dword ptr [rsp + 0x58], eax
02638 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263d 48894424f8                     mov        qword ptr [rsp - 8], rax
02642 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02649 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0264d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02652 48894424f8                     mov        qword ptr [rsp - 8], rax
02657 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0265e 89442460                       mov        dword ptr [rsp + 0x60], eax
02662 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02667 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0266f 488f442468                     pop        qword ptr [rsp + 0x68]
02674 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0267c 488f442470                     pop        qword ptr [rsp + 0x70]
02681 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02689 488f442478                     pop        qword ptr [rsp + 0x78]
0268e 48894424f8                     mov        qword ptr [rsp - 8], rax
02693 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0269a 89442464                       mov        dword ptr [rsp + 0x64], eax
0269e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a3 48894424f8                     mov        qword ptr [rsp - 8], rax
026a8 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
026af 89842480000000                 mov        dword ptr [rsp + 0x80], eax
026b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026bb 48894424f8                     mov        qword ptr [rsp - 8], rax
026c0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
026c7 89842484000000                 mov        dword ptr [rsp + 0x84], eax
026ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d3 48894424f8                     mov        qword ptr [rsp - 8], rax
026d8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
026df 89842488000000                 mov        dword ptr [rsp + 0x88], eax
026e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026eb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026f3 488f842490000000               pop        qword ptr [rsp + 0x90]
026fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02700 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02707 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0270e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02713 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0271b 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02723 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0272b 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02733 e82874b6ff                     call       0x7fd3339c3660
02738 0f1f840030280016               nop        dword ptr [rax + rax + 0x16002830]
02740 4533d2                         xor        r10d, r10d
02743 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
0274b e983daffff                     jmp        0x7fd333e59cd3
02750 4533d2                         xor        r10d, r10d
02753 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02758 e99ddaffff                     jmp        0x7fd333e59cfa
0275d 4533d2                         xor        r10d, r10d
02760 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02765 e9bcdaffff                     jmp        0x7fd333e59d26
0276a 4533d2                         xor        r10d, r10d
0276d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02772 e9d6daffff                     jmp        0x7fd333e59d4d
02777 4533d2                         xor        r10d, r10d
0277a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0277f e9fbdaffff                     jmp        0x7fd333e59d7f
02784 4533d2                         xor        r10d, r10d
02787 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0278c e918dbffff                     jmp        0x7fd333e59da9
02791 4533d2                         xor        r10d, r10d
02794 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0279c e93ddbffff                     jmp        0x7fd333e59dde
027a1 4533d2                         xor        r10d, r10d
027a4 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
027ac e953dbffff                     jmp        0x7fd333e59e04
027b1 bebeffffff                     mov        esi, 0xffffffbe
027b6 48894424f8                     mov        qword ptr [rsp - 8], rax
027bb 8b442408                       mov        eax, dword ptr [rsp + 8]
027bf 890424                         mov        dword ptr [rsp], eax
027c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c7 48894424f8                     mov        qword ptr [rsp - 8], rax
027cc 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
027d0 89442404                       mov        dword ptr [rsp + 4], eax
027d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d9 48ff742410                     push       qword ptr [rsp + 0x10]
027de 488f442408                     pop        qword ptr [rsp + 8]
027e3 48ff742418                     push       qword ptr [rsp + 0x18]
027e8 488f442410                     pop        qword ptr [rsp + 0x10]
027ed 48894424f8                     mov        qword ptr [rsp - 8], rax
027f2 8b442420                       mov        eax, dword ptr [rsp + 0x20]
027f6 89442418                       mov        dword ptr [rsp + 0x18], eax
027fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02804 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02808 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0280c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02811 48894424f8                     mov        qword ptr [rsp - 8], rax
02816 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0281a 89442420                       mov        dword ptr [rsp + 0x20], eax
0281e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02823 48894424f8                     mov        qword ptr [rsp - 8], rax
02828 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0282c 89442424                       mov        dword ptr [rsp + 0x24], eax
02830 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02835 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0283a 48ff742438                     push       qword ptr [rsp + 0x38]
0283f 488f442430                     pop        qword ptr [rsp + 0x30]
02844 48894424f8                     mov        qword ptr [rsp - 8], rax
02849 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0284d 89442438                       mov        dword ptr [rsp + 0x38], eax
02851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02856 48894424f8                     mov        qword ptr [rsp - 8], rax
0285b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0285f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02868 48ff742448                     push       qword ptr [rsp + 0x48]
0286d 488f442440                     pop        qword ptr [rsp + 0x40]
02872 48ff742450                     push       qword ptr [rsp + 0x50]
02877 488f442448                     pop        qword ptr [rsp + 0x48]
0287c 48ff742458                     push       qword ptr [rsp + 0x58]
02881 488f442450                     pop        qword ptr [rsp + 0x50]
02886 90                             nop        
02887 e8d472b6ff                     call       0x7fd3339c3660
0288c 0f1f840084290017               nop        dword ptr [rax + rax + 0x17002984]
02894 be85ffffff                     mov        esi, 0xffffff85
02899 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
0289d 48894424f8                     mov        qword ptr [rsp - 8], rax
028a2 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
028a6 890424                         mov        dword ptr [rsp], eax
028a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ae 48894424f8                     mov        qword ptr [rsp - 8], rax
028b3 8b442420                       mov        eax, dword ptr [rsp + 0x20]
028b7 89442404                       mov        dword ptr [rsp + 4], eax
028bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c0 48894424f8                     mov        qword ptr [rsp - 8], rax
028c5 8b442424                       mov        eax, dword ptr [rsp + 0x24]
028c9 89442408                       mov        dword ptr [rsp + 8], eax
028cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d2 48894424f8                     mov        qword ptr [rsp - 8], rax
028d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028db 8944240c                       mov        dword ptr [rsp + 0xc], eax
028df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e4 48894424f8                     mov        qword ptr [rsp - 8], rax
028e9 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
028ed 89442410                       mov        dword ptr [rsp + 0x10], eax
028f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f6 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
028fb 48ff742438                     push       qword ptr [rsp + 0x38]
02900 488f442420                     pop        qword ptr [rsp + 0x20]
02905 48894424f8                     mov        qword ptr [rsp - 8], rax
0290a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0290e 89442414                       mov        dword ptr [rsp + 0x14], eax
02912 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02917 48894424f8                     mov        qword ptr [rsp - 8], rax
0291c 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02920 89442428                       mov        dword ptr [rsp + 0x28], eax
02924 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02929 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0292e 90                             nop        
0292f e82c72b6ff                     call       0x7fd3339c3660
02934 0f1f84002c2a0018               nop        dword ptr [rax + rax + 0x18002a2c]
0293c bef6ffffff                     mov        esi, 0xfffffff6
02941 6690                           nop        
02943 e81872b6ff                     call       0x7fd3339c3660
02948 0f1f8400402a0019               nop        dword ptr [rax + rax + 0x19002a40]
02950 be5d000000                     mov        esi, 0x5d
02955 6690                           nop        
02957 e80472b6ff                     call       0x7fd3339c3660
0295c 0f1f8400542a001a               nop        dword ptr [rax + rax + 0x1a002a54]
02964 bef6ffffff                     mov        esi, 0xfffffff6
02969 8be9                           mov        ebp, ecx
0296b e8f071b6ff                     call       0x7fd3339c3660
02970 0f1f8400682a001b               nop        dword ptr [rax + rax + 0x1b002a68]
02978 bef6ffffff                     mov        esi, 0xfffffff6
0297d 418be8                         mov        ebp, r8d
02980 666690                         nop        
02983 e8d871b6ff                     call       0x7fd3339c3660
02988 0f1f8400802a001c               nop        dword ptr [rax + rax + 0x1c002a80]
02990 bef6ffffff                     mov        esi, 0xfffffff6
02995 418be9                         mov        ebp, r9d
02998 666690                         nop        
0299b e8c071b6ff                     call       0x7fd3339c3660
029a0 0f1f8400982a001d               nop        dword ptr [rax + rax + 0x1d002a98]
029a8 eb00                           jmp        0x7fd333e5c4aa
029aa 488bf0                         mov        rsi, rax
029ad e9dae0ffff                     jmp        0x7fd333e5a58c
029b2 49bab4a5e533d37f0000           movabs     r10, 0x7fd333e5a5b4
029bc 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
029c3 e9181aaaff                     jmp        0x7fd3338fdee0
029c8 e8d3e5a8ff                     call       0x7fd3338eaaa0
029cd e95cd6ffff                     jmp        0x7fd333e59b2e
029d2 f4                             hlt        
029d3 f4                             hlt        
029d4 f4                             hlt        
029d5 f4                             hlt        
029d6 f4                             hlt        
029d7 f4                             hlt        
