00000 e8fb515a18                     call       0x7f3dd0173c80
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
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85b62b0000                   jne        0x7f3db7bd1664
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
0018f 49bab06333d03d7f0000           movabs     r10, 0x7f3dd03363b0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f841e270000                   je         0x7f3db7bd1350
001b2 458b12                         mov        r10d, dword ptr [r10]
001b5 41c1ea0d                       shr        r10d, 0xd
001b9 4181fa05010000                 cmp        r10d, 0x105
001c0 0f8572280000                   jne        0x7f3db7bd14b8
001c6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001cb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001d3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d8 4d85d2                         test       r10, r10
001db 0f84ff260000                   je         0x7f3db7bd1360
001e1 458b1a                         mov        r11d, dword ptr [r10]
001e4 41c1eb0d                       shr        r11d, 0xd
001e8 4181fb16040000                 cmp        r11d, 0x416
001ef 0f8543280000                   jne        0x7f3db7bd14b8
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84e5260000                   je         0x7f3db7bd136d
00208 458b12                         mov        r10d, dword ptr [r10]
0020b 41c1ea0d                       shr        r10d, 0xd
0020f 4181fa0a040000                 cmp        r10d, 0x40a
00216 0f851c280000                   jne        0x7f3db7bd14b8
0021c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00221 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00226 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0022b 4d85d2                         test       r10, r10
0022e 0f84c6260000                   je         0x7f3db7bd137a
00234 458b1a                         mov        r11d, dword ptr [r10]
00237 41c1eb0d                       shr        r11d, 0xd
0023b 4181fb0d040000                 cmp        r11d, 0x40d
00242 0f85f0270000                   jne        0x7f3db7bd14b8
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f84a9260000                   je         0x7f3db7bd1387
0025e 458b12                         mov        r10d, dword ptr [r10]
00261 41c1ea0d                       shr        r10d, 0xd
00265 4181fa0d040000                 cmp        r10d, 0x40d
0026c 0f85c6270000                   jne        0x7f3db7bd14b8
00272 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0027a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0027f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00287 4d85d2                         test       r10, r10
0028a 0f8484260000                   je         0x7f3db7bd1394
00290 458b1a                         mov        r11d, dword ptr [r10]
00293 41c1eb0d                       shr        r11d, 0xd
00297 4181fb0d040000                 cmp        r11d, 0x40d
0029e 0f8594270000                   jne        0x7f3db7bd14b8
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f8467260000                   je         0x7f3db7bd13a1
002ba 458b12                         mov        r10d, dword ptr [r10]
002bd 41c1ea0d                       shr        r10d, 0xd
002c1 4181fa08010000                 cmp        r10d, 0x108
002c8 0f856a270000                   jne        0x7f3db7bd14b8
002ce 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002d6 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002de 4d85ed                         test       r13, r13
002e1 0f844a260000                   je         0x7f3db7bd13b1
002e7 458b5d00                       mov        r11d, dword ptr [r13]
002eb 41c1eb0d                       shr        r11d, 0xd
002ef 4181fb07010000                 cmp        r11d, 0x107
002f6 0f853c270000                   jne        0x7f3db7bd14b8
002fc 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
00304 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00309 4d85d2                         test       r10, r10
0030c 0f842f260000                   je         0x7f3db7bd13c1
00312 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00317 4d85d2                         test       r10, r10
0031a 0f8421260000                   je         0x7f3db7bd13c1
00320 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00325 4d85d2                         test       r10, r10
00328 0f8413260000                   je         0x7f3db7bd13c1
0032e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00336 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0033a 892c24                         mov        dword ptr [rsp], ebp
0033d 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00345 458b4204                       mov        r8d, dword ptr [r10 + 4]
00349 458d58f9                       lea        r11d, [r8 - 7]
0034d 4585db                         test       r11d, r11d
00350 0f8ceb250000                   jl         0x7f3db7bd13c1
00356 4183c0f9                       add        r8d, -7
0035a 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
00362 e95a020000                     jmp        0x7f3db7bcf041
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
0039a 0f8d74100000                   jge        0x7f3db7bcfe94
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d25120000                   jge        0x7f3db7bd0078
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d08140000                   jge        0x7f3db7bd0284
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8df5150000                   jge        0x7f3db7bd0498
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
00476 0f8e040c0000                   jle        0x7f3db7bcfb00
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f83170000                   jg         0x7f3db7bd068c
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8fbf180000                   jg         0x7f3db7bd07d4
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f5a1a0000                   jg         0x7f3db7bd097c
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83f21b0000                   jae        0x7f3db7bd0b24
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f83c0090000                   jae        0x7f3db7bcf918
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc808                     mov        qword ptr [r8 + r9*8 + 8], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8db8000000                   jge        0x7f3db7bcf033
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
00551 0f8d6d1d0000                   jge        0x7f3db7bd0d44
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
00592 0f8d401e0000                   jge        0x7f3db7bd0e58
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
005ce 0f8d8e040000                   jge        0x7f3db7bcf4e2
005d4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d9 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005dd 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
005e4 238c24b0000000                 and        ecx, dword ptr [rsp + 0xb0]
005eb 458b5a04                       mov        r11d, dword ptr [r10 + 4]
005ef 413bcb                         cmp        ecx, r11d
005f2 0f830c050000                   jae        0x7f3db7bcf584
005f8 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
005fd 418b7b14                       mov        edi, dword ptr [r11 + 0x14]
00601 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00609 44238424b4000000               and        r8d, dword ptr [rsp + 0xb4]
00611 448b5f04                       mov        r11d, dword ptr [rdi + 4]
00615 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0061a 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00622 453bc3                         cmp        r8d, r11d
00625 0f83e1050000                   jae        0x7f3db7bcf68c
0062b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00630 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00634 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
0063c 44238c24b8000000               and        r9d, dword ptr [rsp + 0xb8]
00644 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00648 4e8b44c708                     mov        r8, qword ptr [rdi + r8*8 + 8]
0064d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
00655 453bcb                         cmp        r9d, r11d
00658 0f83de060000                   jae        0x7f3db7bcf7bc
0065e 4f8b54ca08                     mov        r10, qword ptr [r10 + r9*8 + 8]
00663 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066b 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00672 ffc5                           inc        ebp
00674 896c2404                       mov        dword ptr [rsp + 4], ebp
00678 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067c 0f8d51040000                   jge        0x7f3db7bcf553
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
00750 0f846e0a0000                   je         0x7f3db7bcfc44
00756 4183f83f                       cmp        r8d, 0x3f
0075a 0f8f400c0000                   jg         0x7f3db7bcfe20
00760 41ba40000000                   mov        r10d, 0x40
00766 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
0076b 453bc2                         cmp        r8d, r10d
0076e 7e43                           jle        0x7f3db7bcf233
00770 458bd8                         mov        r11d, r8d
00773 452bda                         sub        r11d, r10d
00776 4183fa40                       cmp        r10d, 0x40
0077a 0f8d541f0000                   jge        0x7f3db7bd1154
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
007b1 eb2b                           jmp        0x7f3db7bcf25e
007b3 452bd0                         sub        r10d, r8d
007b6 c462abf7d3                     shrx       r10, rbx, r10
007bb 4183f840                       cmp        r8d, 0x40
007bf 0f8d1b1d0000                   jge        0x7f3db7bd0f60
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
007fc 0f8c8efbffff                   jl         0x7f3db7bcee10
00802 458d5ac0                       lea        r11d, [r10 - 0x40]
00806 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0080b 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080f 83c5f8                         add        ebp, -8
00812 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00816 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0081a 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081e 83c1f0                         add        ecx, -0x10
00821 83f908                         cmp        ecx, 8
00824 0f8cea010000                   jl         0x7f3db7bcf494
0082a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082f 4183c2e8                       add        r10d, -0x18
00833 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0083b 0f8226fbffff                   jb         0x7f3db7bcede7
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
009f1 90                             nop        
009f2 90                             nop        
009f3 e8e8e5afff                     call       0x7f3db76cda60
009f8 0f1f8400f00a0001               nop        dword ptr [rax + rax + 0x1000af0]
00a00 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
00a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0e e8cd703718                     call       0x7f3dcff46560
00a13 f4                             hlt        
00a14 85c9                           test       ecx, ecx
00a16 7f08                           jg         0x7f3db7bcf4a0
00a18 4533d2                         xor        r10d, r10d
00a1b e954f9ffff                     jmp        0x7f3db7bcedf4
00a20 8be9                           mov        ebp, ecx
00a22 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a2a 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a2e 90                             nop        
00a2f e8ac07b6ff                     call       0x7f3db772fc60
00a34 0f1f84002c0b0002               nop        dword ptr [rax + rax + 0x2000b2c]
00a3c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a41 41c1e303                       shl        r11d, 3
00a45 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a4a 41c1e203                       shl        r10d, 3
00a4e 452bd3                         sub        r10d, r11d
00a51 4181c2c0000000                 add        r10d, 0xc0
00a58 c462a9f7d0                     shlx       r10, rax, r10
00a5d e912f9ffff                     jmp        0x7f3db7bcedf4
00a62 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a6a 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a72 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a77 4d3bd3                         cmp        r10, r11
00a7a 7e31                           jle        0x7f3db7bcf52d
00a7c 48be402474e200000000           movabs     rsi, 0xe2742440
00a86 90                             nop        
00a87 e85407b6ff                     call       0x7f3db772fc60
00a8c 0f1f8400840b0003               nop        dword ptr [rax + rax + 0x3000b84]
00a94 4885c0                         test       rax, rax
00a97 0f8457200000                   je         0x7f3db7bd1574
00a9d 488bf0                         mov        rsi, rax
00aa0 4881c430010000                 add        rsp, 0x130
00aa7 5d                             pop        rbp
00aa8 e9339eafff                     jmp        0x7f3db76c9360
00aad 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00ab2 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00ab7 0f855f200000                   jne        0x7f3db7bd159c
00abd 418bc2                         mov        eax, r10d
00ac0 4881c430010000                 add        rsp, 0x130
00ac7 5d                             pop        rbp
00ac8 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00acc 0f87fc200000                   ja         0x7f3db7bd164e
00ad2 c3                             ret        
00ad3 4533db                         xor        r11d, r11d
00ad6 4533d2                         xor        r10d, r10d
00ad9 4533c9                         xor        r9d, r9d
00adc 4533c0                         xor        r8d, r8d
00adf 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00ae7 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00aef 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
00af7 4489842404010000               mov        dword ptr [rsp + 0x104], r8d
00aff e9e0fbffff                     jmp        0x7f3db7bcf164
00b04 bee4ffffff                     mov        esi, 0xffffffe4
00b09 48894424f8                     mov        qword ptr [rsp - 8], rax
00b0e 8b442408                       mov        eax, dword ptr [rsp + 8]
00b12 890424                         mov        dword ptr [rsp], eax
00b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b23 89442404                       mov        dword ptr [rsp + 4], eax
00b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b2c 48ff742410                     push       qword ptr [rsp + 0x10]
00b31 488f442408                     pop        qword ptr [rsp + 8]
00b36 48ff742418                     push       qword ptr [rsp + 0x18]
00b3b 488f442410                     pop        qword ptr [rsp + 0x10]
00b40 48894424f8                     mov        qword ptr [rsp - 8], rax
00b45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b49 89442418                       mov        dword ptr [rsp + 0x18], eax
00b4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b52 48894424f8                     mov        qword ptr [rsp - 8], rax
00b57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b64 48894424f8                     mov        qword ptr [rsp - 8], rax
00b69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b6d 89442420                       mov        dword ptr [rsp + 0x20], eax
00b71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b76 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b7f 89442424                       mov        dword ptr [rsp + 0x24], eax
00b83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b8d 48ff742438                     push       qword ptr [rsp + 0x38]
00b92 488f442430                     pop        qword ptr [rsp + 0x30]
00b97 48894424f8                     mov        qword ptr [rsp - 8], rax
00b9c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ba0 89442438                       mov        dword ptr [rsp + 0x38], eax
00ba4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00bb2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bbb 48ff742448                     push       qword ptr [rsp + 0x48]
00bc0 488f442440                     pop        qword ptr [rsp + 0x40]
00bc5 48ff742450                     push       qword ptr [rsp + 0x50]
00bca 488f442448                     pop        qword ptr [rsp + 0x48]
00bcf 48ff742458                     push       qword ptr [rsp + 0x58]
00bd4 488f442450                     pop        qword ptr [rsp + 0x50]
00bd9 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00be1 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00be8 90                             nop        
00be9 90                             nop        
00bea 90                             nop        
00beb e8f0e3afff                     call       0x7f3db76cda60
00bf0 0f1f8400e80c0004               nop        dword ptr [rax + rax + 0x4000ce8]
00bf8 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
00c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c06 e8d56e3718                     call       0x7f3dcff46560
00c0b f4                             hlt        
00c0c bee4ffffff                     mov        esi, 0xffffffe4
00c11 48894424f8                     mov        qword ptr [rsp - 8], rax
00c16 8b442408                       mov        eax, dword ptr [rsp + 8]
00c1a 890424                         mov        dword ptr [rsp], eax
00c1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c22 48894424f8                     mov        qword ptr [rsp - 8], rax
00c27 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c2b 89442404                       mov        dword ptr [rsp + 4], eax
00c2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c34 48ff742410                     push       qword ptr [rsp + 0x10]
00c39 488f442408                     pop        qword ptr [rsp + 8]
00c3e 48ff742418                     push       qword ptr [rsp + 0x18]
00c43 488f442410                     pop        qword ptr [rsp + 0x10]
00c48 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c51 89442418                       mov        dword ptr [rsp + 0x18], eax
00c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c75 89442420                       mov        dword ptr [rsp + 0x20], eax
00c79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c83 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c87 89442424                       mov        dword ptr [rsp + 0x24], eax
00c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c90 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c95 48ff742438                     push       qword ptr [rsp + 0x38]
00c9a 488f442430                     pop        qword ptr [rsp + 0x30]
00c9f 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ca8 89442438                       mov        dword ptr [rsp + 0x38], eax
00cac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb1 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00cba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc3 48ff742448                     push       qword ptr [rsp + 0x48]
00cc8 488f442440                     pop        qword ptr [rsp + 0x40]
00ccd 48ff742450                     push       qword ptr [rsp + 0x50]
00cd2 488f442448                     pop        qword ptr [rsp + 0x48]
00cd7 48ff742458                     push       qword ptr [rsp + 0x58]
00cdc 488f442450                     pop        qword ptr [rsp + 0x50]
00ce1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ce6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ced 89442458                       mov        dword ptr [rsp + 0x58], eax
00cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00d02 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0b 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00d12 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00d1a 90                             nop        
00d1b e8c0e2afff                     call       0x7f3db76cda60
00d20 0f1f8400180e0005               nop        dword ptr [rax + rax + 0x5000e18]
00d28 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
00d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d36 e8a56d3718                     call       0x7f3dcff46560
00d3b f4                             hlt        
00d3c bee4ffffff                     mov        esi, 0xffffffe4
00d41 48894424f8                     mov        qword ptr [rsp - 8], rax
00d46 8b442408                       mov        eax, dword ptr [rsp + 8]
00d4a 890424                         mov        dword ptr [rsp], eax
00d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d52 48894424f8                     mov        qword ptr [rsp - 8], rax
00d57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d5b 89442404                       mov        dword ptr [rsp + 4], eax
00d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d64 48ff742410                     push       qword ptr [rsp + 0x10]
00d69 488f442408                     pop        qword ptr [rsp + 8]
00d6e 48ff742418                     push       qword ptr [rsp + 0x18]
00d73 488f442410                     pop        qword ptr [rsp + 0x10]
00d78 48894424f8                     mov        qword ptr [rsp - 8], rax
00d7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d81 89442418                       mov        dword ptr [rsp + 0x18], eax
00d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00da1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00da5 89442420                       mov        dword ptr [rsp + 0x20], eax
00da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dae 48894424f8                     mov        qword ptr [rsp - 8], rax
00db3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00db7 89442424                       mov        dword ptr [rsp + 0x24], eax
00dbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dc0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00dc5 48ff742438                     push       qword ptr [rsp + 0x38]
00dca 488f442430                     pop        qword ptr [rsp + 0x30]
00dcf 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00dd8 89442438                       mov        dword ptr [rsp + 0x38], eax
00ddc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de1 48894424f8                     mov        qword ptr [rsp - 8], rax
00de6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00dee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df3 48ff742448                     push       qword ptr [rsp + 0x48]
00df8 488f442440                     pop        qword ptr [rsp + 0x40]
00dfd 48ff742450                     push       qword ptr [rsp + 0x50]
00e02 488f442448                     pop        qword ptr [rsp + 0x48]
00e07 48ff742458                     push       qword ptr [rsp + 0x58]
00e0c 488f442450                     pop        qword ptr [rsp + 0x50]
00e11 48894424f8                     mov        qword ptr [rsp - 8], rax
00e16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00e1d 89442458                       mov        dword ptr [rsp + 0x58], eax
00e21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e26 48894424f8                     mov        qword ptr [rsp - 8], rax
00e2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
00e40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e47 89442460                       mov        dword ptr [rsp + 0x60], eax
00e4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e50 48894424f8                     mov        qword ptr [rsp - 8], rax
00e55 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e5c 89442464                       mov        dword ptr [rsp + 0x64], eax
00e60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e65 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e6d 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00e75 90                             nop        
00e76 90                             nop        
00e77 e864e1afff                     call       0x7f3db76cda60
00e7c 0f1f8400740f0006               nop        dword ptr [rax + rax + 0x6000f74]
00e84 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
00e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e92 e8496c3718                     call       0x7f3dcff46560
00e97 f4                             hlt        
00e98 bee4ffffff                     mov        esi, 0xffffffe4
00e9d 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea2 8b442408                       mov        eax, dword ptr [rsp + 8]
00ea6 890424                         mov        dword ptr [rsp], eax
00ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eae 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00eb7 89442404                       mov        dword ptr [rsp + 4], eax
00ebb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec0 48ff742410                     push       qword ptr [rsp + 0x10]
00ec5 488f442408                     pop        qword ptr [rsp + 8]
00eca 48ff742418                     push       qword ptr [rsp + 0x18]
00ecf 488f442410                     pop        qword ptr [rsp + 0x10]
00ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00edd 89442418                       mov        dword ptr [rsp + 0x18], eax
00ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee6 48894424f8                     mov        qword ptr [rsp - 8], rax
00eeb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00eef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ef3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef8 48894424f8                     mov        qword ptr [rsp - 8], rax
00efd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f01 89442420                       mov        dword ptr [rsp + 0x20], eax
00f05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f13 89442424                       mov        dword ptr [rsp + 0x24], eax
00f17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f21 48ff742438                     push       qword ptr [rsp + 0x38]
00f26 488f442430                     pop        qword ptr [rsp + 0x30]
00f2b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f30 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f34 89442438                       mov        dword ptr [rsp + 0x38], eax
00f38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f42 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f46 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4f 48ff742448                     push       qword ptr [rsp + 0x48]
00f54 488f442440                     pop        qword ptr [rsp + 0x40]
00f59 48ff742450                     push       qword ptr [rsp + 0x50]
00f5e 488f442448                     pop        qword ptr [rsp + 0x48]
00f63 48ff742458                     push       qword ptr [rsp + 0x58]
00f68 488f442450                     pop        qword ptr [rsp + 0x50]
00f6d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f72 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f79 89442458                       mov        dword ptr [rsp + 0x58], eax
00f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f82 48894424f8                     mov        qword ptr [rsp - 8], rax
00f87 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f8e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f97 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00fa3 89442460                       mov        dword ptr [rsp + 0x60], eax
00fa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fac 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00fb4 488f442478                     pop        qword ptr [rsp + 0x78]
00fb9 48894424f8                     mov        qword ptr [rsp - 8], rax
00fbe 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fc5 89442464                       mov        dword ptr [rsp + 0x64], eax
00fc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fce 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fda 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe6 48894424f8                     mov        qword ptr [rsp - 8], rax
00feb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00ff2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ff9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffe 48894424f8                     mov        qword ptr [rsp - 8], rax
01003 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0100a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01011 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01016 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0101e 488f842490000000               pop        qword ptr [rsp + 0x90]
01026 48894424f8                     mov        qword ptr [rsp - 8], rax
0102b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01032 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01039 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01046 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0104e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01056 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0105e 90                             nop        
0105f e87cdfafff                     call       0x7f3db76cda60
01064 0f1f84005c110007               nop        dword ptr [rax + rax + 0x700115c]
0106c 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01076 4883e4f0                       and        rsp, 0xfffffffffffffff0
0107a e8616a3718                     call       0x7f3dcff46560
0107f f4                             hlt        
01080 4533c0                         xor        r8d, r8d
01083 4d3bc8                         cmp        r9, r8
01086 bdffffffff                     mov        ebp, 0xffffffff
0108b 7c08                           jl         0x7f3db7bcfb15
0108d 400f95c5                       setne      bpl
01091 400fb6ed                       movzx      ebp, bpl
01095 be45ffffff                     mov        esi, 0xffffff45
0109a 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0109f 48894424f8                     mov        qword ptr [rsp - 8], rax
010a4 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
010ab 89442460                       mov        dword ptr [rsp + 0x60], eax
010af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b4 48894424f8                     mov        qword ptr [rsp - 8], rax
010b9 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010c0 89442464                       mov        dword ptr [rsp + 0x64], eax
010c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c9 48894424f8                     mov        qword ptr [rsp - 8], rax
010ce 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010d5 89442468                       mov        dword ptr [rsp + 0x68], eax
010d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010de 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
010e6 488f842480000000               pop        qword ptr [rsp + 0x80]
010ee 48894424f8                     mov        qword ptr [rsp - 8], rax
010f3 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010fa 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01103 48894424f8                     mov        qword ptr [rsp - 8], rax
01108 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0110f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01116 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111b 48894424f8                     mov        qword ptr [rsp - 8], rax
01120 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01127 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
0112e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01133 48894424f8                     mov        qword ptr [rsp - 8], rax
01138 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0113f 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01146 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0114b 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01153 488f842498000000               pop        qword ptr [rsp + 0x98]
0115b 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01163 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0116b 48894424f8                     mov        qword ptr [rsp - 8], rax
01170 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01177 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0117e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01183 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0118b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01193 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
0119a 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
011a2 90                             nop        
011a3 e838deafff                     call       0x7f3db76cda60
011a8 0f1f8400a0120008               nop        dword ptr [rax + rax + 0x80012a0]
011b0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
011ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
011be e81d693718                     call       0x7f3dcff46560
011c3 f4                             hlt        
011c4 be45ffffff                     mov        esi, 0xffffff45
011c9 48894424f8                     mov        qword ptr [rsp - 8], rax
011ce 8b442408                       mov        eax, dword ptr [rsp + 8]
011d2 890424                         mov        dword ptr [rsp], eax
011d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011da 48894424f8                     mov        qword ptr [rsp - 8], rax
011df 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011e3 89442404                       mov        dword ptr [rsp + 4], eax
011e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ec 48ff742410                     push       qword ptr [rsp + 0x10]
011f1 488f442408                     pop        qword ptr [rsp + 8]
011f6 48ff742418                     push       qword ptr [rsp + 0x18]
011fb 488f442410                     pop        qword ptr [rsp + 0x10]
01200 48894424f8                     mov        qword ptr [rsp - 8], rax
01205 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01209 89442418                       mov        dword ptr [rsp + 0x18], eax
0120d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01212 48894424f8                     mov        qword ptr [rsp - 8], rax
01217 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0121b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0121f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01224 48894424f8                     mov        qword ptr [rsp - 8], rax
01229 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0122d 89442420                       mov        dword ptr [rsp + 0x20], eax
01231 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01236 48894424f8                     mov        qword ptr [rsp - 8], rax
0123b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0123f 89442424                       mov        dword ptr [rsp + 0x24], eax
01243 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01248 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0124d 48ff742438                     push       qword ptr [rsp + 0x38]
01252 488f442430                     pop        qword ptr [rsp + 0x30]
01257 48894424f8                     mov        qword ptr [rsp - 8], rax
0125c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01260 89442438                       mov        dword ptr [rsp + 0x38], eax
01264 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01269 48894424f8                     mov        qword ptr [rsp - 8], rax
0126e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01272 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01276 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0127b 48ff742448                     push       qword ptr [rsp + 0x48]
01280 488f442440                     pop        qword ptr [rsp + 0x40]
01285 48ff742450                     push       qword ptr [rsp + 0x50]
0128a 488f442448                     pop        qword ptr [rsp + 0x48]
0128f 48ff742458                     push       qword ptr [rsp + 0x58]
01294 488f442450                     pop        qword ptr [rsp + 0x50]
01299 48894424f8                     mov        qword ptr [rsp - 8], rax
0129e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
012a5 89442458                       mov        dword ptr [rsp + 0x58], eax
012a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ae 48894424f8                     mov        qword ptr [rsp - 8], rax
012b3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012ba 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c3 48894424f8                     mov        qword ptr [rsp - 8], rax
012c8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012cf 89442460                       mov        dword ptr [rsp + 0x60], eax
012d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012e0 488f442468                     pop        qword ptr [rsp + 0x68]
012e5 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012ed 488f442478                     pop        qword ptr [rsp + 0x78]
012f2 48894424f8                     mov        qword ptr [rsp - 8], rax
012f7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012fe 89442464                       mov        dword ptr [rsp + 0x64], eax
01302 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01307 48894424f8                     mov        qword ptr [rsp - 8], rax
0130c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01313 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0131a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131f 48894424f8                     mov        qword ptr [rsp - 8], rax
01324 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0132b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01332 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01337 48894424f8                     mov        qword ptr [rsp - 8], rax
0133c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01343 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0134a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0134f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01357 488f842490000000               pop        qword ptr [rsp + 0x90]
0135f 48894424f8                     mov        qword ptr [rsp - 8], rax
01364 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0136b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01372 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01377 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
0137f e85cdcafff                     call       0x7f3db76cda60
01384 0f1f84007c140009               nop        dword ptr [rax + rax + 0x900147c]
0138c 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01396 4883e4f0                       and        rsp, 0xfffffffffffffff0
0139a e841673718                     call       0x7f3dcff46560
0139f f4                             hlt        
013a0 be45ffffff                     mov        esi, 0xffffff45
013a5 48894424f8                     mov        qword ptr [rsp - 8], rax
013aa 8b442408                       mov        eax, dword ptr [rsp + 8]
013ae 890424                         mov        dword ptr [rsp], eax
013b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b6 48894424f8                     mov        qword ptr [rsp - 8], rax
013bb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013bf 89442404                       mov        dword ptr [rsp + 4], eax
013c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c8 48ff742410                     push       qword ptr [rsp + 0x10]
013cd 488f442408                     pop        qword ptr [rsp + 8]
013d2 48ff742418                     push       qword ptr [rsp + 0x18]
013d7 488f442410                     pop        qword ptr [rsp + 0x10]
013dc 48894424f8                     mov        qword ptr [rsp - 8], rax
013e1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013e5 89442418                       mov        dword ptr [rsp + 0x18], eax
013e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ee 4489442420                     mov        dword ptr [rsp + 0x20], r8d
013f3 e8e8dbafff                     call       0x7f3db76cda60
013f8 0f1f8400f014000a               nop        dword ptr [rax + rax + 0xa0014f0]
01400 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
0140a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0140e e8cd663718                     call       0x7f3dcff46560
01413 f4                             hlt        
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
01462 48894424f8                     mov        qword ptr [rsp - 8], rax
01467 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0146b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0146f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01474 48894424f8                     mov        qword ptr [rsp - 8], rax
01479 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0147d 89442420                       mov        dword ptr [rsp + 0x20], eax
01481 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01486 48894424f8                     mov        qword ptr [rsp - 8], rax
0148b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0148f 89442424                       mov        dword ptr [rsp + 0x24], eax
01493 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01498 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0149d 48ff742438                     push       qword ptr [rsp + 0x38]
014a2 488f442430                     pop        qword ptr [rsp + 0x30]
014a7 48894424f8                     mov        qword ptr [rsp - 8], rax
014ac 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014b0 89442438                       mov        dword ptr [rsp + 0x38], eax
014b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b9 48894424f8                     mov        qword ptr [rsp - 8], rax
014be 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014c2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014cb 48ff742448                     push       qword ptr [rsp + 0x48]
014d0 488f442440                     pop        qword ptr [rsp + 0x40]
014d5 48ff742450                     push       qword ptr [rsp + 0x50]
014da 488f442448                     pop        qword ptr [rsp + 0x48]
014df 48ff742458                     push       qword ptr [rsp + 0x58]
014e4 488f442450                     pop        qword ptr [rsp + 0x50]
014e9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ee 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014f5 89442458                       mov        dword ptr [rsp + 0x58], eax
014f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01503 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0150a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0150e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01513 48894424f8                     mov        qword ptr [rsp - 8], rax
01518 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0151f 89442460                       mov        dword ptr [rsp + 0x60], eax
01523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01528 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01530 488f442468                     pop        qword ptr [rsp + 0x68]
01535 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0153d 488f442470                     pop        qword ptr [rsp + 0x70]
01542 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0154a 488f442478                     pop        qword ptr [rsp + 0x78]
0154f 48894424f8                     mov        qword ptr [rsp - 8], rax
01554 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0155b 89442464                       mov        dword ptr [rsp + 0x64], eax
0155f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01570 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157c 48894424f8                     mov        qword ptr [rsp - 8], rax
01581 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01588 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0158f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01594 48894424f8                     mov        qword ptr [rsp - 8], rax
01599 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
015a0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
015a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ac 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015b4 488f842490000000               pop        qword ptr [rsp + 0x90]
015bc 48894424f8                     mov        qword ptr [rsp - 8], rax
015c1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015c8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d4 90                             nop        
015d5 90                             nop        
015d6 90                             nop        
015d7 e804daafff                     call       0x7f3db76cda60
015dc 0f1f8400d416000b               nop        dword ptr [rax + rax + 0xb0016d4]
015e4 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
015ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
015f2 e8e9643718                     call       0x7f3dcff46560
015f7 f4                             hlt        
015f8 be45ffffff                     mov        esi, 0xffffff45
015fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01602 8b442408                       mov        eax, dword ptr [rsp + 8]
01606 890424                         mov        dword ptr [rsp], eax
01609 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160e 48894424f8                     mov        qword ptr [rsp - 8], rax
01613 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01617 89442404                       mov        dword ptr [rsp + 4], eax
0161b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01620 48ff742410                     push       qword ptr [rsp + 0x10]
01625 488f442408                     pop        qword ptr [rsp + 8]
0162a 48ff742418                     push       qword ptr [rsp + 0x18]
0162f 488f442410                     pop        qword ptr [rsp + 0x10]
01634 48894424f8                     mov        qword ptr [rsp - 8], rax
01639 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0163d 89442418                       mov        dword ptr [rsp + 0x18], eax
01641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0164f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 48894424f8                     mov        qword ptr [rsp - 8], rax
0165d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01661 89442420                       mov        dword ptr [rsp + 0x20], eax
01665 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166a 48894424f8                     mov        qword ptr [rsp - 8], rax
0166f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01673 89442424                       mov        dword ptr [rsp + 0x24], eax
01677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01681 48ff742438                     push       qword ptr [rsp + 0x38]
01686 488f442430                     pop        qword ptr [rsp + 0x30]
0168b 48894424f8                     mov        qword ptr [rsp - 8], rax
01690 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01694 89442438                       mov        dword ptr [rsp + 0x38], eax
01698 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169d 48894424f8                     mov        qword ptr [rsp - 8], rax
016a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
016a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016af 48ff742448                     push       qword ptr [rsp + 0x48]
016b4 488f442440                     pop        qword ptr [rsp + 0x40]
016b9 48ff742450                     push       qword ptr [rsp + 0x50]
016be 488f442448                     pop        qword ptr [rsp + 0x48]
016c3 48ff742458                     push       qword ptr [rsp + 0x58]
016c8 488f442450                     pop        qword ptr [rsp + 0x50]
016cd 48894424f8                     mov        qword ptr [rsp - 8], rax
016d2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016d9 89442458                       mov        dword ptr [rsp + 0x58], eax
016dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e2 48894424f8                     mov        qword ptr [rsp - 8], rax
016e7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016ee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f7 48894424f8                     mov        qword ptr [rsp - 8], rax
016fc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01703 89442460                       mov        dword ptr [rsp + 0x60], eax
01707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01714 488f442468                     pop        qword ptr [rsp + 0x68]
01719 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01721 488f442470                     pop        qword ptr [rsp + 0x70]
01726 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0172e 488f442478                     pop        qword ptr [rsp + 0x78]
01733 48894424f8                     mov        qword ptr [rsp - 8], rax
01738 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0173f 89442464                       mov        dword ptr [rsp + 0x64], eax
01743 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01748 48894424f8                     mov        qword ptr [rsp - 8], rax
0174d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01754 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0175b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01760 48894424f8                     mov        qword ptr [rsp - 8], rax
01765 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0176c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01773 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01778 48894424f8                     mov        qword ptr [rsp - 8], rax
0177d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01784 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0178b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01790 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01798 488f842490000000               pop        qword ptr [rsp + 0x90]
017a0 48894424f8                     mov        qword ptr [rsp - 8], rax
017a5 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
017ac 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b8 48894424f8                     mov        qword ptr [rsp - 8], rax
017bd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017c4 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d0 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017d8 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017e0 90                             nop        
017e1 90                             nop        
017e2 90                             nop        
017e3 e8f8d7afff                     call       0x7f3db76cda60
017e8 0f1f8400e018000c               nop        dword ptr [rax + rax + 0xc0018e0]
017f0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
017fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fe e8dd623718                     call       0x7f3dcff46560
01803 f4                             hlt        
01804 be45ffffff                     mov        esi, 0xffffff45
01809 48894424f8                     mov        qword ptr [rsp - 8], rax
0180e 8b442408                       mov        eax, dword ptr [rsp + 8]
01812 890424                         mov        dword ptr [rsp], eax
01815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181a 48894424f8                     mov        qword ptr [rsp - 8], rax
0181f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01823 89442404                       mov        dword ptr [rsp + 4], eax
01827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182c 48ff742410                     push       qword ptr [rsp + 0x10]
01831 488f442408                     pop        qword ptr [rsp + 8]
01836 48ff742418                     push       qword ptr [rsp + 0x18]
0183b 488f442410                     pop        qword ptr [rsp + 0x10]
01840 48894424f8                     mov        qword ptr [rsp - 8], rax
01845 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01849 89442418                       mov        dword ptr [rsp + 0x18], eax
0184d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01852 48894424f8                     mov        qword ptr [rsp - 8], rax
01857 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0185b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0185f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01864 48894424f8                     mov        qword ptr [rsp - 8], rax
01869 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0186d 89442420                       mov        dword ptr [rsp + 0x20], eax
01871 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01876 48894424f8                     mov        qword ptr [rsp - 8], rax
0187b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0187f 89442424                       mov        dword ptr [rsp + 0x24], eax
01883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01888 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0188d 48ff742438                     push       qword ptr [rsp + 0x38]
01892 488f442430                     pop        qword ptr [rsp + 0x30]
01897 48894424f8                     mov        qword ptr [rsp - 8], rax
0189c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018a0 89442438                       mov        dword ptr [rsp + 0x38], eax
018a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018b2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bb 48ff742448                     push       qword ptr [rsp + 0x48]
018c0 488f442440                     pop        qword ptr [rsp + 0x40]
018c5 48ff742450                     push       qword ptr [rsp + 0x50]
018ca 488f442448                     pop        qword ptr [rsp + 0x48]
018cf 48ff742458                     push       qword ptr [rsp + 0x58]
018d4 488f442450                     pop        qword ptr [rsp + 0x50]
018d9 48894424f8                     mov        qword ptr [rsp - 8], rax
018de 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018e5 89442458                       mov        dword ptr [rsp + 0x58], eax
018e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ee 48894424f8                     mov        qword ptr [rsp - 8], rax
018f3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018fa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01903 48894424f8                     mov        qword ptr [rsp - 8], rax
01908 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0190f 89442460                       mov        dword ptr [rsp + 0x60], eax
01913 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01918 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01920 488f442468                     pop        qword ptr [rsp + 0x68]
01925 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0192d 488f442470                     pop        qword ptr [rsp + 0x70]
01932 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0193a 488f442478                     pop        qword ptr [rsp + 0x78]
0193f 48894424f8                     mov        qword ptr [rsp - 8], rax
01944 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0194b 89442464                       mov        dword ptr [rsp + 0x64], eax
0194f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01960 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01978 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 48894424f8                     mov        qword ptr [rsp - 8], rax
01989 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01990 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019a4 488f842490000000               pop        qword ptr [rsp + 0x90]
019ac 48894424f8                     mov        qword ptr [rsp - 8], rax
019b1 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019b8 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c4 48894424f8                     mov        qword ptr [rsp - 8], rax
019c9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019d0 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019e4 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019ec 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019f4 90                             nop        
019f5 90                             nop        
019f6 90                             nop        
019f7 e8e4d5afff                     call       0x7f3db76cda60
019fc 0f1f8400f41a000d               nop        dword ptr [rax + rax + 0xd001af4]
01a04 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01a0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a12 e8c9603718                     call       0x7f3dcff46560
01a17 f4                             hlt        
01a18 be45ffffff                     mov        esi, 0xffffff45
01a1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a22 8b442408                       mov        eax, dword ptr [rsp + 8]
01a26 890424                         mov        dword ptr [rsp], eax
01a29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a33 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a37 89442404                       mov        dword ptr [rsp + 4], eax
01a3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a40 48ff742410                     push       qword ptr [rsp + 0x10]
01a45 488f442408                     pop        qword ptr [rsp + 8]
01a4a 48ff742418                     push       qword ptr [rsp + 0x18]
01a4f 488f442410                     pop        qword ptr [rsp + 0x10]
01a54 48894424f8                     mov        qword ptr [rsp - 8], rax
01a59 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a5d 89442418                       mov        dword ptr [rsp + 0x18], eax
01a61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a66 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a6f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a78 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a81 89442420                       mov        dword ptr [rsp + 0x20], eax
01a85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a93 89442424                       mov        dword ptr [rsp + 0x24], eax
01a97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01aa1 48ff742438                     push       qword ptr [rsp + 0x38]
01aa6 488f442430                     pop        qword ptr [rsp + 0x30]
01aab 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ab4 89442438                       mov        dword ptr [rsp + 0x38], eax
01ab8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ac6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01acf 48ff742448                     push       qword ptr [rsp + 0x48]
01ad4 488f442440                     pop        qword ptr [rsp + 0x40]
01ad9 48ff742450                     push       qword ptr [rsp + 0x50]
01ade 488f442448                     pop        qword ptr [rsp + 0x48]
01ae3 48ff742458                     push       qword ptr [rsp + 0x58]
01ae8 488f442450                     pop        qword ptr [rsp + 0x50]
01aed 48894424f8                     mov        qword ptr [rsp - 8], rax
01af2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01af9 89442458                       mov        dword ptr [rsp + 0x58], eax
01afd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b02 48894424f8                     mov        qword ptr [rsp - 8], rax
01b07 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b0e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b17 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b23 89442460                       mov        dword ptr [rsp + 0x60], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b34 488f442468                     pop        qword ptr [rsp + 0x68]
01b39 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b41 488f442478                     pop        qword ptr [rsp + 0x78]
01b46 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b52 89442464                       mov        dword ptr [rsp + 0x64], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b60 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b67 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b73 48894424f8                     mov        qword ptr [rsp - 8], rax
01b78 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b7f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b90 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b97 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bab 488f842490000000               pop        qword ptr [rsp + 0x90]
01bb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb8 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bbf 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01bc6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcb 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bd3 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bdb 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01be2 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bea 90                             nop        
01beb e8f0d3afff                     call       0x7f3db76cda60
01bf0 0f1f8400e81c000e               nop        dword ptr [rax + rax + 0xe001ce8]
01bf8 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e8d55e3718                     call       0x7f3dcff46560
01c0b f4                             hlt        
01c0c be45ffffff                     mov        esi, 0xffffff45
01c11 41b8ffffff7f                   mov        r8d, 0x7fffffff
01c17 4d3bc8                         cmp        r9, r8
01c1a bdffffffff                     mov        ebp, 0xffffffff
01c1f 7c08                           jl         0x7f3db7bd06a9
01c21 400f95c5                       setne      bpl
01c25 400fb6ed                       movzx      ebp, bpl
01c29 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c33 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c3a 89442460                       mov        dword ptr [rsp + 0x60], eax
01c3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c43 48894424f8                     mov        qword ptr [rsp - 8], rax
01c48 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c4f 89442464                       mov        dword ptr [rsp + 0x64], eax
01c53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c58 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c64 89442468                       mov        dword ptr [rsp + 0x68], eax
01c68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01c75 488f842480000000               pop        qword ptr [rsp + 0x80]
01c7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c82 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c89 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c92 48894424f8                     mov        qword ptr [rsp - 8], rax
01c97 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c9e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ca5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01caa 48894424f8                     mov        qword ptr [rsp - 8], rax
01caf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01cb6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01cce 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cda 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ce2 488f842498000000               pop        qword ptr [rsp + 0x98]
01cea 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cf2 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01d06 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01d0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d12 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d1a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01d22 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01d29 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d31 90                             nop        
01d32 90                             nop        
01d33 e8a8d2afff                     call       0x7f3db76cda60
01d38 0f1f8400301e000f               nop        dword ptr [rax + rax + 0xf001e30]
01d40 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01d4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4e e88d5d3718                     call       0x7f3dcff46560
01d53 f4                             hlt        
01d54 be45ffffff                     mov        esi, 0xffffff45
01d59 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5e 8b442408                       mov        eax, dword ptr [rsp + 8]
01d62 890424                         mov        dword ptr [rsp], eax
01d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d73 89442404                       mov        dword ptr [rsp + 4], eax
01d77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7c 48ff742410                     push       qword ptr [rsp + 0x10]
01d81 488f442408                     pop        qword ptr [rsp + 8]
01d86 48ff742418                     push       qword ptr [rsp + 0x18]
01d8b 488f442410                     pop        qword ptr [rsp + 0x10]
01d90 48894424f8                     mov        qword ptr [rsp - 8], rax
01d95 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d99 89442418                       mov        dword ptr [rsp + 0x18], eax
01d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da2 48894424f8                     mov        qword ptr [rsp - 8], rax
01da7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01dab 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db4 48894424f8                     mov        qword ptr [rsp - 8], rax
01db9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dbd 89442420                       mov        dword ptr [rsp + 0x20], eax
01dc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dcb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dcf 89442424                       mov        dword ptr [rsp + 0x24], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ddd 48ff742438                     push       qword ptr [rsp + 0x38]
01de2 488f442430                     pop        qword ptr [rsp + 0x30]
01de7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dec 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01df0 89442438                       mov        dword ptr [rsp + 0x38], eax
01df4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e02 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0b 48ff742448                     push       qword ptr [rsp + 0x48]
01e10 488f442440                     pop        qword ptr [rsp + 0x40]
01e15 48ff742450                     push       qword ptr [rsp + 0x50]
01e1a 488f442448                     pop        qword ptr [rsp + 0x48]
01e1f 48ff742458                     push       qword ptr [rsp + 0x58]
01e24 488f442450                     pop        qword ptr [rsp + 0x50]
01e29 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e35 89442458                       mov        dword ptr [rsp + 0x58], eax
01e39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e43 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e4a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e53 48894424f8                     mov        qword ptr [rsp - 8], rax
01e58 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5f 89442460                       mov        dword ptr [rsp + 0x60], eax
01e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e68 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e72 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e79 89442464                       mov        dword ptr [rsp + 0x64], eax
01e7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e82 48894424f8                     mov        qword ptr [rsp - 8], rax
01e87 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e8e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01ea6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01ead 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ebe 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eca 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ed2 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01ed9 90                             nop        
01eda 90                             nop        
01edb e800d1afff                     call       0x7f3db76cda60
01ee0 0f1f8400d81f0010               nop        dword ptr [rax + rax + 0x10001fd8]
01ee8 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
01ef2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ef6 e8e55b3718                     call       0x7f3dcff46560
01efb f4                             hlt        
01efc be45ffffff                     mov        esi, 0xffffff45
01f01 48894424f8                     mov        qword ptr [rsp - 8], rax
01f06 8b442408                       mov        eax, dword ptr [rsp + 8]
01f0a 890424                         mov        dword ptr [rsp], eax
01f0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f12 48894424f8                     mov        qword ptr [rsp - 8], rax
01f17 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f1b 89442404                       mov        dword ptr [rsp + 4], eax
01f1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f24 48ff742410                     push       qword ptr [rsp + 0x10]
01f29 488f442408                     pop        qword ptr [rsp + 8]
01f2e 48ff742418                     push       qword ptr [rsp + 0x18]
01f33 488f442410                     pop        qword ptr [rsp + 0x10]
01f38 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f41 89442418                       mov        dword ptr [rsp + 0x18], eax
01f45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f53 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f61 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f65 89442420                       mov        dword ptr [rsp + 0x20], eax
01f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f73 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f77 89442424                       mov        dword ptr [rsp + 0x24], eax
01f7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f80 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f85 48ff742438                     push       qword ptr [rsp + 0x38]
01f8a 488f442430                     pop        qword ptr [rsp + 0x30]
01f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f94 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f98 89442438                       mov        dword ptr [rsp + 0x38], eax
01f9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01faa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb3 48ff742448                     push       qword ptr [rsp + 0x48]
01fb8 488f442440                     pop        qword ptr [rsp + 0x40]
01fbd 48ff742450                     push       qword ptr [rsp + 0x50]
01fc2 488f442448                     pop        qword ptr [rsp + 0x48]
01fc7 48ff742458                     push       qword ptr [rsp + 0x58]
01fcc 488f442450                     pop        qword ptr [rsp + 0x50]
01fd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fdd 89442458                       mov        dword ptr [rsp + 0x58], eax
01fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe6 48894424f8                     mov        qword ptr [rsp - 8], rax
01feb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ff2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ff6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ffb 48894424f8                     mov        qword ptr [rsp - 8], rax
02000 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02007 89442460                       mov        dword ptr [rsp + 0x60], eax
0200b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02010 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02015 48894424f8                     mov        qword ptr [rsp - 8], rax
0201a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02021 89442464                       mov        dword ptr [rsp + 0x64], eax
02025 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202a 48894424f8                     mov        qword ptr [rsp - 8], rax
0202f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02036 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0203d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02042 48894424f8                     mov        qword ptr [rsp - 8], rax
02047 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0204e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02055 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205a 48894424f8                     mov        qword ptr [rsp - 8], rax
0205f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02066 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0206d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02072 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0207a 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02082 90                             nop        
02083 e858cfafff                     call       0x7f3db76cda60
02088 0f1f840080210011               nop        dword ptr [rax + rax + 0x11002180]
02090 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
0209a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209e e83d5a3718                     call       0x7f3dcff46560
020a3 f4                             hlt        
020a4 be3dffffff                     mov        esi, 0xffffff3d
020a9 48894424f8                     mov        qword ptr [rsp - 8], rax
020ae 8b442408                       mov        eax, dword ptr [rsp + 8]
020b2 890424                         mov        dword ptr [rsp], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020c3 89442404                       mov        dword ptr [rsp + 4], eax
020c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020cc 48ff742410                     push       qword ptr [rsp + 0x10]
020d1 488f442408                     pop        qword ptr [rsp + 8]
020d6 48ff742418                     push       qword ptr [rsp + 0x18]
020db 488f442410                     pop        qword ptr [rsp + 0x10]
020e0 48894424f8                     mov        qword ptr [rsp - 8], rax
020e5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020e9 89442418                       mov        dword ptr [rsp + 0x18], eax
020ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f2 48894424f8                     mov        qword ptr [rsp - 8], rax
020f7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020fb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02104 48894424f8                     mov        qword ptr [rsp - 8], rax
02109 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0210d 89442420                       mov        dword ptr [rsp + 0x20], eax
02111 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02116 48894424f8                     mov        qword ptr [rsp - 8], rax
0211b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0211f 89442424                       mov        dword ptr [rsp + 0x24], eax
02123 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02128 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0212d 48ff742438                     push       qword ptr [rsp + 0x38]
02132 488f442430                     pop        qword ptr [rsp + 0x30]
02137 48894424f8                     mov        qword ptr [rsp - 8], rax
0213c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02140 89442438                       mov        dword ptr [rsp + 0x38], eax
02144 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02149 48894424f8                     mov        qword ptr [rsp - 8], rax
0214e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02152 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02156 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215b 48ff742448                     push       qword ptr [rsp + 0x48]
02160 488f442440                     pop        qword ptr [rsp + 0x40]
02165 48ff742450                     push       qword ptr [rsp + 0x50]
0216a 488f442448                     pop        qword ptr [rsp + 0x48]
0216f 48ff742458                     push       qword ptr [rsp + 0x58]
02174 488f442450                     pop        qword ptr [rsp + 0x50]
02179 48894424f8                     mov        qword ptr [rsp - 8], rax
0217e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02185 89442458                       mov        dword ptr [rsp + 0x58], eax
02189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218e 48894424f8                     mov        qword ptr [rsp - 8], rax
02193 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0219a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0219e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a3 48894424f8                     mov        qword ptr [rsp - 8], rax
021a8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021af 89442460                       mov        dword ptr [rsp + 0x60], eax
021b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b8 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
021c0 488f442478                     pop        qword ptr [rsp + 0x78]
021c5 48894424f8                     mov        qword ptr [rsp - 8], rax
021ca 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021d1 89442464                       mov        dword ptr [rsp + 0x64], eax
021d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021da 48894424f8                     mov        qword ptr [rsp - 8], rax
021df 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021e6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f2 48894424f8                     mov        qword ptr [rsp - 8], rax
021f7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021fe 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02205 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220a 48894424f8                     mov        qword ptr [rsp - 8], rax
0220f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02216 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0221d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02222 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0222a 488f842490000000               pop        qword ptr [rsp + 0x90]
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0223e 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02245 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02252 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0225a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02262 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0226a 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02272 48894424f8                     mov        qword ptr [rsp - 8], rax
02277 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0227e 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02285 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228a 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
02291 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02299 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
022a1 90                             nop        
022a2 90                             nop        
022a3 e838cdafff                     call       0x7f3db76cda60
022a8 0f1f8400a0230012               nop        dword ptr [rax + rax + 0x120023a0]
022b0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
022ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
022be e81d583718                     call       0x7f3dcff46560
022c3 f4                             hlt        
022c4 be45ffffff                     mov        esi, 0xffffff45
022c9 48894424f8                     mov        qword ptr [rsp - 8], rax
022ce 8b442408                       mov        eax, dword ptr [rsp + 8]
022d2 890424                         mov        dword ptr [rsp], eax
022d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022da 48894424f8                     mov        qword ptr [rsp - 8], rax
022df 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022e3 89442404                       mov        dword ptr [rsp + 4], eax
022e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ec 48ff742410                     push       qword ptr [rsp + 0x10]
022f1 488f442408                     pop        qword ptr [rsp + 8]
022f6 48ff742418                     push       qword ptr [rsp + 0x18]
022fb 488f442410                     pop        qword ptr [rsp + 0x10]
02300 48894424f8                     mov        qword ptr [rsp - 8], rax
02305 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02309 89442418                       mov        dword ptr [rsp + 0x18], eax
0230d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02312 48894424f8                     mov        qword ptr [rsp - 8], rax
02317 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0231b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0231f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02324 48894424f8                     mov        qword ptr [rsp - 8], rax
02329 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0232d 89442420                       mov        dword ptr [rsp + 0x20], eax
02331 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02336 48894424f8                     mov        qword ptr [rsp - 8], rax
0233b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0233f 89442424                       mov        dword ptr [rsp + 0x24], eax
02343 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02348 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0234d 48ff742438                     push       qword ptr [rsp + 0x38]
02352 488f442430                     pop        qword ptr [rsp + 0x30]
02357 48894424f8                     mov        qword ptr [rsp - 8], rax
0235c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02360 89442438                       mov        dword ptr [rsp + 0x38], eax
02364 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02369 48894424f8                     mov        qword ptr [rsp - 8], rax
0236e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02372 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02376 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0237b 48ff742448                     push       qword ptr [rsp + 0x48]
02380 488f442440                     pop        qword ptr [rsp + 0x40]
02385 48ff742450                     push       qword ptr [rsp + 0x50]
0238a 488f442448                     pop        qword ptr [rsp + 0x48]
0238f 48ff742458                     push       qword ptr [rsp + 0x58]
02394 488f442450                     pop        qword ptr [rsp + 0x50]
02399 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0239d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
023a5 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
023ad 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023b5 90                             nop        
023b6 90                             nop        
023b7 e824ccafff                     call       0x7f3db76cda60
023bc 0f1f8400b4240013               nop        dword ptr [rax + rax + 0x130024b4]
023c4 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
023ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
023d2 e809573718                     call       0x7f3dcff46560
023d7 f4                             hlt        
023d8 be45ffffff                     mov        esi, 0xffffff45
023dd 48894424f8                     mov        qword ptr [rsp - 8], rax
023e2 8b442408                       mov        eax, dword ptr [rsp + 8]
023e6 890424                         mov        dword ptr [rsp], eax
023e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ee 48894424f8                     mov        qword ptr [rsp - 8], rax
023f3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023f7 89442404                       mov        dword ptr [rsp + 4], eax
023fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02400 48ff742410                     push       qword ptr [rsp + 0x10]
02405 488f442408                     pop        qword ptr [rsp + 8]
0240a 48ff742418                     push       qword ptr [rsp + 0x18]
0240f 488f442410                     pop        qword ptr [rsp + 0x10]
02414 48894424f8                     mov        qword ptr [rsp - 8], rax
02419 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0241d 89442418                       mov        dword ptr [rsp + 0x18], eax
02421 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02426 48894424f8                     mov        qword ptr [rsp - 8], rax
0242b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0242f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02433 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02438 48894424f8                     mov        qword ptr [rsp - 8], rax
0243d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02441 89442420                       mov        dword ptr [rsp + 0x20], eax
02445 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244a 48894424f8                     mov        qword ptr [rsp - 8], rax
0244f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02453 89442424                       mov        dword ptr [rsp + 0x24], eax
02457 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02461 48ff742438                     push       qword ptr [rsp + 0x38]
02466 488f442430                     pop        qword ptr [rsp + 0x30]
0246b 48894424f8                     mov        qword ptr [rsp - 8], rax
02470 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02474 89442438                       mov        dword ptr [rsp + 0x38], eax
02478 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247d 48894424f8                     mov        qword ptr [rsp - 8], rax
02482 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02486 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0248a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248f 48ff742448                     push       qword ptr [rsp + 0x48]
02494 488f442440                     pop        qword ptr [rsp + 0x40]
02499 48ff742450                     push       qword ptr [rsp + 0x50]
0249e 488f442448                     pop        qword ptr [rsp + 0x48]
024a3 48ff742458                     push       qword ptr [rsp + 0x58]
024a8 488f442450                     pop        qword ptr [rsp + 0x50]
024ad 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024b5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024bd 90                             nop        
024be 90                             nop        
024bf e81ccbafff                     call       0x7f3db76cda60
024c4 0f1f8400bc250014               nop        dword ptr [rax + rax + 0x140025bc]
024cc 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
024d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
024da e801563718                     call       0x7f3dcff46560
024df f4                             hlt        
024e0 be45ffffff                     mov        esi, 0xffffff45
024e5 48894424f8                     mov        qword ptr [rsp - 8], rax
024ea 8b442408                       mov        eax, dword ptr [rsp + 8]
024ee 890424                         mov        dword ptr [rsp], eax
024f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f6 48894424f8                     mov        qword ptr [rsp - 8], rax
024fb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024ff 89442404                       mov        dword ptr [rsp + 4], eax
02503 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02508 48ff742410                     push       qword ptr [rsp + 0x10]
0250d 488f442408                     pop        qword ptr [rsp + 8]
02512 48ff742418                     push       qword ptr [rsp + 0x18]
02517 488f442410                     pop        qword ptr [rsp + 0x10]
0251c 48894424f8                     mov        qword ptr [rsp - 8], rax
02521 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02525 89442418                       mov        dword ptr [rsp + 0x18], eax
02529 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252e 48894424f8                     mov        qword ptr [rsp - 8], rax
02533 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02537 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0253b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02540 48894424f8                     mov        qword ptr [rsp - 8], rax
02545 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02549 89442420                       mov        dword ptr [rsp + 0x20], eax
0254d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02552 48894424f8                     mov        qword ptr [rsp - 8], rax
02557 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0255b 89442424                       mov        dword ptr [rsp + 0x24], eax
0255f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02564 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02569 48ff742438                     push       qword ptr [rsp + 0x38]
0256e 488f442430                     pop        qword ptr [rsp + 0x30]
02573 48894424f8                     mov        qword ptr [rsp - 8], rax
02578 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0257c 89442438                       mov        dword ptr [rsp + 0x38], eax
02580 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02585 48894424f8                     mov        qword ptr [rsp - 8], rax
0258a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0258e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02592 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02597 48ff742448                     push       qword ptr [rsp + 0x48]
0259c 488f442440                     pop        qword ptr [rsp + 0x40]
025a1 48ff742450                     push       qword ptr [rsp + 0x50]
025a6 488f442448                     pop        qword ptr [rsp + 0x48]
025ab 48ff742458                     push       qword ptr [rsp + 0x58]
025b0 488f442450                     pop        qword ptr [rsp + 0x50]
025b5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
025c1 89442458                       mov        dword ptr [rsp + 0x58], eax
025c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ca 48894424f8                     mov        qword ptr [rsp - 8], rax
025cf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025d6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025df 48894424f8                     mov        qword ptr [rsp - 8], rax
025e4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025eb 89442460                       mov        dword ptr [rsp + 0x60], eax
025ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f4 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025fc 488f442468                     pop        qword ptr [rsp + 0x68]
02601 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02609 488f442470                     pop        qword ptr [rsp + 0x70]
0260e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02616 488f442478                     pop        qword ptr [rsp + 0x78]
0261b 48894424f8                     mov        qword ptr [rsp - 8], rax
02620 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02627 89442464                       mov        dword ptr [rsp + 0x64], eax
0262b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02630 48894424f8                     mov        qword ptr [rsp - 8], rax
02635 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0263c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02648 48894424f8                     mov        qword ptr [rsp - 8], rax
0264d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02654 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0265b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02660 48894424f8                     mov        qword ptr [rsp - 8], rax
02665 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0266c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02673 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02678 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02680 488f842490000000               pop        qword ptr [rsp + 0x90]
02688 48894424f8                     mov        qword ptr [rsp - 8], rax
0268d 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02694 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0269b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a0 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
026a8 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
026b0 90                             nop        
026b1 90                             nop        
026b2 90                             nop        
026b3 e828c9afff                     call       0x7f3db76cda60
026b8 0f1f8400b0270015               nop        dword ptr [rax + rax + 0x150027b0]
026c0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
026ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ce e80d543718                     call       0x7f3dcff46560
026d3 f4                             hlt        
026d4 be45ffffff                     mov        esi, 0xffffff45
026d9 48894424f8                     mov        qword ptr [rsp - 8], rax
026de 8b442408                       mov        eax, dword ptr [rsp + 8]
026e2 890424                         mov        dword ptr [rsp], eax
026e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ea 48894424f8                     mov        qword ptr [rsp - 8], rax
026ef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026f3 89442404                       mov        dword ptr [rsp + 4], eax
026f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fc 48ff742410                     push       qword ptr [rsp + 0x10]
02701 488f442408                     pop        qword ptr [rsp + 8]
02706 48ff742418                     push       qword ptr [rsp + 0x18]
0270b 488f442410                     pop        qword ptr [rsp + 0x10]
02710 48894424f8                     mov        qword ptr [rsp - 8], rax
02715 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02719 89442418                       mov        dword ptr [rsp + 0x18], eax
0271d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02722 48894424f8                     mov        qword ptr [rsp - 8], rax
02727 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0272b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0272f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02734 48894424f8                     mov        qword ptr [rsp - 8], rax
02739 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0273d 89442420                       mov        dword ptr [rsp + 0x20], eax
02741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02746 48894424f8                     mov        qword ptr [rsp - 8], rax
0274b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0274f 89442424                       mov        dword ptr [rsp + 0x24], eax
02753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02758 48ff742438                     push       qword ptr [rsp + 0x38]
0275d 488f442430                     pop        qword ptr [rsp + 0x30]
02762 48894424f8                     mov        qword ptr [rsp - 8], rax
02767 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0276b 89442438                       mov        dword ptr [rsp + 0x38], eax
0276f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02774 48894424f8                     mov        qword ptr [rsp - 8], rax
02779 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0277d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02781 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02786 48ff742448                     push       qword ptr [rsp + 0x48]
0278b 488f442440                     pop        qword ptr [rsp + 0x40]
02790 48ff742450                     push       qword ptr [rsp + 0x50]
02795 488f442448                     pop        qword ptr [rsp + 0x48]
0279a 48ff742458                     push       qword ptr [rsp + 0x58]
0279f 488f442450                     pop        qword ptr [rsp + 0x50]
027a4 48894424f8                     mov        qword ptr [rsp - 8], rax
027a9 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
027b0 89442458                       mov        dword ptr [rsp + 0x58], eax
027b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b9 48894424f8                     mov        qword ptr [rsp - 8], rax
027be 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
027c5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ce 48894424f8                     mov        qword ptr [rsp - 8], rax
027d3 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
027da 89442460                       mov        dword ptr [rsp + 0x60], eax
027de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e3 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027eb 488f442468                     pop        qword ptr [rsp + 0x68]
027f0 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027f8 488f442470                     pop        qword ptr [rsp + 0x70]
027fd 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02805 488f442478                     pop        qword ptr [rsp + 0x78]
0280a 48894424f8                     mov        qword ptr [rsp - 8], rax
0280f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02816 89442464                       mov        dword ptr [rsp + 0x64], eax
0281a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281f 48894424f8                     mov        qword ptr [rsp - 8], rax
02824 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0282b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02832 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02837 48894424f8                     mov        qword ptr [rsp - 8], rax
0283c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02843 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0284a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284f 48894424f8                     mov        qword ptr [rsp - 8], rax
02854 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0285b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02862 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02867 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0286f 488f842490000000               pop        qword ptr [rsp + 0x90]
02877 48894424f8                     mov        qword ptr [rsp - 8], rax
0287c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02883 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0288a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0288f 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
02897 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0289f 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
028a7 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
028af e82cc7afff                     call       0x7f3db76cda60
028b4 0f1f8400ac290016               nop        dword ptr [rax + rax + 0x160029ac]
028bc 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
028c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ca e811523718                     call       0x7f3dcff46560
028cf f4                             hlt        
028d0 4533d2                         xor        r10d, r10d
028d3 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
028db e9f3d8ffff                     jmp        0x7f3db7bcec53
028e0 4533d2                         xor        r10d, r10d
028e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028e8 e90dd9ffff                     jmp        0x7f3db7bcec7a
028ed 4533d2                         xor        r10d, r10d
028f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028f5 e92cd9ffff                     jmp        0x7f3db7bceca6
028fa 4533d2                         xor        r10d, r10d
028fd 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02902 e946d9ffff                     jmp        0x7f3db7bceccd
02907 4533d2                         xor        r10d, r10d
0290a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0290f e96bd9ffff                     jmp        0x7f3db7bcecff
02914 4533d2                         xor        r10d, r10d
02917 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0291c e988d9ffff                     jmp        0x7f3db7bced29
02921 4533d2                         xor        r10d, r10d
02924 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0292c e9add9ffff                     jmp        0x7f3db7bced5e
02931 4533d2                         xor        r10d, r10d
02934 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0293c e9c3d9ffff                     jmp        0x7f3db7bced84
02941 bebeffffff                     mov        esi, 0xffffffbe
02946 48894424f8                     mov        qword ptr [rsp - 8], rax
0294b 8b442408                       mov        eax, dword ptr [rsp + 8]
0294f 890424                         mov        dword ptr [rsp], eax
02952 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02957 48894424f8                     mov        qword ptr [rsp - 8], rax
0295c 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02960 89442404                       mov        dword ptr [rsp + 4], eax
02964 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02969 48ff742410                     push       qword ptr [rsp + 0x10]
0296e 488f442408                     pop        qword ptr [rsp + 8]
02973 48ff742418                     push       qword ptr [rsp + 0x18]
02978 488f442410                     pop        qword ptr [rsp + 0x10]
0297d 48894424f8                     mov        qword ptr [rsp - 8], rax
02982 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02986 89442418                       mov        dword ptr [rsp + 0x18], eax
0298a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0298f 48894424f8                     mov        qword ptr [rsp - 8], rax
02994 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02998 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0299c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a1 48894424f8                     mov        qword ptr [rsp - 8], rax
029a6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029aa 89442420                       mov        dword ptr [rsp + 0x20], eax
029ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b3 48894424f8                     mov        qword ptr [rsp - 8], rax
029b8 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
029bc 89442424                       mov        dword ptr [rsp + 0x24], eax
029c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c5 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
029ca 48ff742438                     push       qword ptr [rsp + 0x38]
029cf 488f442430                     pop        qword ptr [rsp + 0x30]
029d4 48894424f8                     mov        qword ptr [rsp - 8], rax
029d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029dd 89442438                       mov        dword ptr [rsp + 0x38], eax
029e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e6 48894424f8                     mov        qword ptr [rsp - 8], rax
029eb 8b442444                       mov        eax, dword ptr [rsp + 0x44]
029ef 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f8 48ff742448                     push       qword ptr [rsp + 0x48]
029fd 488f442440                     pop        qword ptr [rsp + 0x40]
02a02 48ff742450                     push       qword ptr [rsp + 0x50]
02a07 488f442448                     pop        qword ptr [rsp + 0x48]
02a0c 48ff742458                     push       qword ptr [rsp + 0x58]
02a11 488f442450                     pop        qword ptr [rsp + 0x50]
02a16 90                             nop        
02a17 e8c4c5afff                     call       0x7f3db76cda60
02a1c 0f1f8400142b0017               nop        dword ptr [rax + rax + 0x17002b14]
02a24 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02a2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a32 e8a9503718                     call       0x7f3dcff46560
02a37 f4                             hlt        
02a38 be85ffffff                     mov        esi, 0xffffff85
02a3d 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a41 48894424f8                     mov        qword ptr [rsp - 8], rax
02a46 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a4a 890424                         mov        dword ptr [rsp], eax
02a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a52 48894424f8                     mov        qword ptr [rsp - 8], rax
02a57 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a5b 89442404                       mov        dword ptr [rsp + 4], eax
02a5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a64 48894424f8                     mov        qword ptr [rsp - 8], rax
02a69 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a6d 89442408                       mov        dword ptr [rsp + 8], eax
02a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a76 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a7f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a88 48894424f8                     mov        qword ptr [rsp - 8], rax
02a8d 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a91 89442410                       mov        dword ptr [rsp + 0x10], eax
02a95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a9a 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a9f 48ff742438                     push       qword ptr [rsp + 0x38]
02aa4 488f442420                     pop        qword ptr [rsp + 0x20]
02aa9 48894424f8                     mov        qword ptr [rsp - 8], rax
02aae 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02ab2 89442414                       mov        dword ptr [rsp + 0x14], eax
02ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02abb 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac0 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02ac4 89442428                       mov        dword ptr [rsp + 0x28], eax
02ac8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02acd 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02ad2 90                             nop        
02ad3 e808c5afff                     call       0x7f3db76cda60
02ad8 0f1f8400d02b0018               nop        dword ptr [rax + rax + 0x18002bd0]
02ae0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aee e8ed4f3718                     call       0x7f3dcff46560
02af3 f4                             hlt        
02af4 bef6ffffff                     mov        esi, 0xfffffff6
02af9 90                             nop        
02afa 90                             nop        
02afb e8e0c4afff                     call       0x7f3db76cda60
02b00 0f1f8400f82b0019               nop        dword ptr [rax + rax + 0x19002bf8]
02b08 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b16 e8c54f3718                     call       0x7f3dcff46560
02b1b f4                             hlt        
02b1c be5d000000                     mov        esi, 0x5d
02b21 90                             nop        
02b22 90                             nop        
02b23 e8b8c4afff                     call       0x7f3db76cda60
02b28 0f1f8400202c001a               nop        dword ptr [rax + rax + 0x1a002c20]
02b30 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02b3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3e e89d4f3718                     call       0x7f3dcff46560
02b43 f4                             hlt        
02b44 bef6ffffff                     mov        esi, 0xfffffff6
02b49 8be9                           mov        ebp, ecx
02b4b e890c4afff                     call       0x7f3db76cda60
02b50 0f1f8400482c001b               nop        dword ptr [rax + rax + 0x1b002c48]
02b58 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b66 e8754f3718                     call       0x7f3dcff46560
02b6b f4                             hlt        
02b6c bef6ffffff                     mov        esi, 0xfffffff6
02b71 418be8                         mov        ebp, r8d
02b74 90                             nop        
02b75 90                             nop        
02b76 90                             nop        
02b77 e864c4afff                     call       0x7f3db76cda60
02b7c 0f1f8400742c001c               nop        dword ptr [rax + rax + 0x1c002c74]
02b84 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02b8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b92 e8494f3718                     call       0x7f3dcff46560
02b97 f4                             hlt        
02b98 bef6ffffff                     mov        esi, 0xfffffff6
02b9d 418be9                         mov        ebp, r9d
02ba0 90                             nop        
02ba1 90                             nop        
02ba2 90                             nop        
02ba3 e838c4afff                     call       0x7f3db76cda60
02ba8 0f1f8400a02c001d               nop        dword ptr [rax + rax + 0x1d002ca0]
02bb0 48bf401027903d7f0000           movabs     rdi, 0x7f3d90271040
02bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bbe e81d4f3718                     call       0x7f3dcff46560
02bc3 f4                             hlt        
02bc4 eb00                           jmp        0x7f3db7bd1646
02bc6 488bf0                         mov        rsi, rax
02bc9 e9d2deffff                     jmp        0x7f3db7bcf520
02bce 49ba48f5bcb73d7f0000           movabs     r10, 0x7f3db7bcf548
02bd8 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02bdf e9fc0cb6ff                     jmp        0x7f3db7732360
02be4 e877dbb4ff                     call       0x7f3db771f1e0
02be9 e940d4ffff                     jmp        0x7f3db7bceaae
02bee f4                             hlt        
02bef f4                             hlt        
