00000 e8fb1d3718                     call       0x7f6aaff4bc80
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
00028 0f85aa2b0000                   jne        0x7f6a97bdca58
0002e 4c8b96e8010000                 mov        r10, qword ptr [rsi + 0x1e8]
00035 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0003a 4c8b96d0010000                 mov        r10, qword ptr [rsi + 0x1d0]
00041 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00046 448b96d0000000                 mov        r10d, dword ptr [rsi + 0xd0]
0004d 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
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
0018f 49bab0e310b06a7f0000           movabs     r10, 0x7f6ab010e3b0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f8412270000                   je         0x7f6a97bdc744
001b2 458b12                         mov        r10d, dword ptr [r10]
001b5 41c1ea0d                       shr        r10d, 0xd
001b9 4181fa05010000                 cmp        r10d, 0x105
001c0 0f8566280000                   jne        0x7f6a97bdc8ac
001c6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001cb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001d3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d8 4d85d2                         test       r10, r10
001db 0f84f3260000                   je         0x7f6a97bdc754
001e1 458b1a                         mov        r11d, dword ptr [r10]
001e4 41c1eb0d                       shr        r11d, 0xd
001e8 4181fb16040000                 cmp        r11d, 0x416
001ef 0f8537280000                   jne        0x7f6a97bdc8ac
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84d9260000                   je         0x7f6a97bdc761
00208 458b12                         mov        r10d, dword ptr [r10]
0020b 41c1ea0d                       shr        r10d, 0xd
0020f 4181fa0a040000                 cmp        r10d, 0x40a
00216 0f8510280000                   jne        0x7f6a97bdc8ac
0021c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00221 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00226 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0022b 4d85d2                         test       r10, r10
0022e 0f84ba260000                   je         0x7f6a97bdc76e
00234 458b1a                         mov        r11d, dword ptr [r10]
00237 41c1eb0d                       shr        r11d, 0xd
0023b 4181fb0d040000                 cmp        r11d, 0x40d
00242 0f85e4270000                   jne        0x7f6a97bdc8ac
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f849d260000                   je         0x7f6a97bdc77b
0025e 458b12                         mov        r10d, dword ptr [r10]
00261 41c1ea0d                       shr        r10d, 0xd
00265 4181fa0d040000                 cmp        r10d, 0x40d
0026c 0f85ba270000                   jne        0x7f6a97bdc8ac
00272 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0027a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0027f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00287 4d85d2                         test       r10, r10
0028a 0f8478260000                   je         0x7f6a97bdc788
00290 458b1a                         mov        r11d, dword ptr [r10]
00293 41c1eb0d                       shr        r11d, 0xd
00297 4181fb0d040000                 cmp        r11d, 0x40d
0029e 0f8588270000                   jne        0x7f6a97bdc8ac
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f845b260000                   je         0x7f6a97bdc795
002ba 458b12                         mov        r10d, dword ptr [r10]
002bd 41c1ea0d                       shr        r10d, 0xd
002c1 4181fa08010000                 cmp        r10d, 0x108
002c8 0f855e270000                   jne        0x7f6a97bdc8ac
002ce 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002d6 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002de 4d85ed                         test       r13, r13
002e1 0f843e260000                   je         0x7f6a97bdc7a5
002e7 458b5d00                       mov        r11d, dword ptr [r13]
002eb 41c1eb0d                       shr        r11d, 0xd
002ef 4181fb07010000                 cmp        r11d, 0x107
002f6 0f8530270000                   jne        0x7f6a97bdc8ac
002fc 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
00304 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00309 4d85d2                         test       r10, r10
0030c 0f8423260000                   je         0x7f6a97bdc7b5
00312 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00317 4d85d2                         test       r10, r10
0031a 0f8415260000                   je         0x7f6a97bdc7b5
00320 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00325 4d85d2                         test       r10, r10
00328 0f8407260000                   je         0x7f6a97bdc7b5
0032e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00336 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0033a 892c24                         mov        dword ptr [rsp], ebp
0033d 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00345 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00349 458d53f9                       lea        r10d, [r11 - 7]
0034d 4585d2                         test       r10d, r10d
00350 0f8cdf250000                   jl         0x7f6a97bdc7b5
00356 4183c3f9                       add        r11d, -7
0035a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00362 e963020000                     jmp        0x7f6a97bda44a
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
0039a 0f8d68100000                   jge        0x7f6a97bdb288
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d19120000                   jge        0x7f6a97bdb46c
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8dfc130000                   jge        0x7f6a97bdb678
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8de9150000                   jge        0x7f6a97bdb88c
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
00476 0f8ef80b0000                   jle        0x7f6a97bdaef4
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f77170000                   jg         0x7f6a97bdba80
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8fb3180000                   jg         0x7f6a97bdbbc8
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f4e1a0000                   jg         0x7f6a97bdbd70
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83e61b0000                   jae        0x7f6a97bdbf18
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f83b4090000                   jae        0x7f6a97bdad0c
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc808                     mov        qword ptr [r8 + r9*8 + 8], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8dc1000000                   jge        0x7f6a97bda43c
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0050f 49c1e830                       shr        r8, 0x30
00513 458bdb                         mov        r11d, r11d
00516 418bf8                         mov        edi, r8d
00519 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00521 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
00529 c44233f7c2                     shrx       r8d, r10d, r9d
0052e 4103f8                         add        edi, r8d
00531 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
00538 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00540 c44233f7ca                     shrx       r9d, r10d, r9d
00545 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
0054d 4183f820                       cmp        r8d, 0x20
00551 0f8d611d0000                   jge        0x7f6a97bdc138
00557 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0055f 49c1e830                       shr        r8, 0x30
00563 458bc0                         mov        r8d, r8d
00566 bf01000000                     mov        edi, 1
0056b 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00572 c4e271f7ff                     shlx       edi, edi, ecx
00577 ffcf                           dec        edi
00579 4123f9                         and        edi, r9d
0057c 4103fb                         add        edi, r11d
0057f 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00586 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
0058e 4183fb20                       cmp        r11d, 0x20
00592 0f8d341e0000                   jge        0x7f6a97bdc24c
00598 41bb01000000                   mov        r11d, 1
0059e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
005a6 c44231f7cb                     shlx       r9d, r11d, r9d
005ab 41ffc9                         dec        r9d
005ae 4523ca                         and        r9d, r10d
005b1 4503c8                         add        r9d, r8d
005b4 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
005bc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005c0 418502                         test       dword ptr [r10], eax
005c3 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005ca 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005d2 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005d7 0f8d7d040000                   jge        0x7f6a97bda8da
005dd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005e2 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e6 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
005ed 238c24b0000000                 and        ecx, dword ptr [rsp + 0xb0]
005f4 458b4204                       mov        r8d, dword ptr [r10 + 4]
005f8 413bc8                         cmp        ecx, r8d
005fb 0f83f9040000                   jae        0x7f6a97bda97a
00601 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00606 418b7b14                       mov        edi, dword ptr [r11 + 0x14]
0060a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00612 44238424b4000000               and        r8d, dword ptr [rsp + 0xb4]
0061a 448b5f04                       mov        r11d, dword ptr [rdi + 4]
0061e 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
00623 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0062b 453bc3                         cmp        r8d, r11d
0062e 0f83cc050000                   jae        0x7f6a97bdaa80
00634 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00639 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063d 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00645 44238c24b8000000               and        r9d, dword ptr [rsp + 0xb8]
0064d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00651 4e8b44c708                     mov        r8, qword ptr [rdi + r8*8 + 8]
00656 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0065e 453bcb                         cmp        r9d, r11d
00661 0f83c9060000                   jae        0x7f6a97bdabb0
00667 4f8b54ca08                     mov        r10, qword ptr [r10 + r9*8 + 8]
0066c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00674 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0067b ffc5                           inc        ebp
0067d 896c2404                       mov        dword ptr [rsp + 4], ebp
00681 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00685 0f8d40040000                   jge        0x7f6a97bda94b
0068b 49c1ea28                       shr        r10, 0x28
0068f 458bda                         mov        r11d, r10d
00692 450fb6db                       movzx      r11d, r11b
00696 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0069e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a6 49c1ea28                       shr        r10, 0x28
006aa 458bd2                         mov        r10d, r10d
006ad 450fb6ca                       movzx      r9d, r10b
006b1 4503cb                         add        r9d, r11d
006b4 4d8bd0                         mov        r10, r8
006b7 49c1ea28                       shr        r10, 0x28
006bb 458bda                         mov        r11d, r10d
006be 450fb6d3                       movzx      r10d, r11b
006c2 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
006ca 4503ca                         add        r9d, r10d
006cd 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006d5 41bb01000000                   mov        r11d, 1
006db 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
006e3 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006eb 49c1ea20                       shr        r10, 0x20
006ef 458bd2                         mov        r10d, r10d
006f2 410fb6ea                       movzx      ebp, r10b
006f6 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006fd 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00705 49c1ea20                       shr        r10, 0x20
00709 458bda                         mov        r11d, r10d
0070c 410fb6eb                       movzx      ebp, r11b
00710 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00717 4d8bd0                         mov        r10, r8
0071a 49c1ea20                       shr        r10, 0x20
0071e 458bd2                         mov        r10d, r10d
00721 410fb6ea                       movzx      ebp, r10b
00725 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
0072c 448bc5                         mov        r8d, ebp
0072f 44038424f8000000               add        r8d, dword ptr [rsp + 0xf8]
00737 44038424fc000000               add        r8d, dword ptr [rsp + 0xfc]
0073f 44038424f4000000               add        r8d, dword ptr [rsp + 0xf4]
00747 4585c0                         test       r8d, r8d
0074a 0f84680a0000                   je         0x7f6a97bdb038
00750 4183f83f                       cmp        r8d, 0x3f
00754 0f8f3a0c0000                   jg         0x7f6a97bdb214
0075a 41ba40000000                   mov        r10d, 0x40
00760 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
00765 453bc2                         cmp        r8d, r10d
00768 7e43                           jle        0x7f6a97bda62d
0076a 458bd8                         mov        r11d, r8d
0076d 452bda                         sub        r11d, r10d
00770 4183fa40                       cmp        r10d, 0x40
00774 0f8d4e1f0000                   jge        0x7f6a97bdc548
0077a 41b901000000                   mov        r9d, 1
00780 c442a9f7d1                     shlx       r10, r9, r10
00785 49ffca                         dec        r10
00788 4c23d3                         and        r10, rbx
0078b c442a1f7ca                     shlx       r9, r10, r11
00790 41ba40000000                   mov        r10d, 0x40
00796 452bd3                         sub        r10d, r11d
00799 c462abf7542438                 shrx       r10, qword ptr [rsp + 0x38], r10
007a0 4d0bca                         or         r9, r10
007a3 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
007ab eb2b                           jmp        0x7f6a97bda658
007ad 452bd0                         sub        r10d, r8d
007b0 c462abf7d3                     shrx       r10, rbx, r10
007b5 4183f840                       cmp        r8d, 0x40
007b9 0f8d151d0000                   jge        0x7f6a97bdc354
007bf 41bb01000000                   mov        r11d, 1
007c5 c442b9f7db                     shlx       r11, r11, r8
007ca 49ffcb                         dec        r11
007cd 4d23da                         and        r11, r10
007d0 4c899c2408010000               mov        qword ptr [rsp + 0x108], r11
007d8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
007dd 4503d8                         add        r11d, r8d
007e0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007e5 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
007ea 4503d0                         add        r10d, r8d
007ed 4489542444                     mov        dword ptr [rsp + 0x44], r10d
007f2 4183fb40                       cmp        r11d, 0x40
007f6 0f8c94fbffff                   jl         0x7f6a97bda210
007fc 4183c3c0                       add        r11d, -0x40
00800 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00805 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00809 83c5f8                         add        ebp, -8
0080c 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00810 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00814 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00818 83c1f0                         add        ecx, -0x10
0081b 83f908                         cmp        ecx, 8
0081e 0f8ce8010000                   jl         0x7f6a97bda88c
00824 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00829 4183c2e8                       add        r10d, -0x18
0082d 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00835 0f822cfbffff                   jb         0x7f6a97bda1e7
0083b bee4ffffff                     mov        esi, 0xffffffe4
00840 48894424f8                     mov        qword ptr [rsp - 8], rax
00845 8b442408                       mov        eax, dword ptr [rsp + 8]
00849 890424                         mov        dword ptr [rsp], eax
0084c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00851 48894424f8                     mov        qword ptr [rsp - 8], rax
00856 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085a 89442404                       mov        dword ptr [rsp + 4], eax
0085e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00863 48ff742410                     push       qword ptr [rsp + 0x10]
00868 488f442408                     pop        qword ptr [rsp + 8]
0086d 48ff742418                     push       qword ptr [rsp + 0x18]
00872 488f442410                     pop        qword ptr [rsp + 0x10]
00877 48894424f8                     mov        qword ptr [rsp - 8], rax
0087c 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00880 89442418                       mov        dword ptr [rsp + 0x18], eax
00884 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00889 48894424f8                     mov        qword ptr [rsp - 8], rax
0088e 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00892 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00896 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089b 48894424f8                     mov        qword ptr [rsp - 8], rax
008a0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a4 89442420                       mov        dword ptr [rsp + 0x20], eax
008a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ad 48894424f8                     mov        qword ptr [rsp - 8], rax
008b2 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008b6 89442424                       mov        dword ptr [rsp + 0x24], eax
008ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008bf 48ff742438                     push       qword ptr [rsp + 0x38]
008c4 488f442428                     pop        qword ptr [rsp + 0x28]
008c9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008ce 48894424f8                     mov        qword ptr [rsp - 8], rax
008d3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008d7 89442434                       mov        dword ptr [rsp + 0x34], eax
008db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e0 48ff742448                     push       qword ptr [rsp + 0x48]
008e5 488f442438                     pop        qword ptr [rsp + 0x38]
008ea 48ff742450                     push       qword ptr [rsp + 0x50]
008ef 488f442440                     pop        qword ptr [rsp + 0x40]
008f4 48ff742458                     push       qword ptr [rsp + 0x58]
008f9 488f442448                     pop        qword ptr [rsp + 0x48]
008fe 48894424f8                     mov        qword ptr [rsp - 8], rax
00903 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090a 89442450                       mov        dword ptr [rsp + 0x50], eax
0090e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00913 48894424f8                     mov        qword ptr [rsp - 8], rax
00918 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0091f 89442454                       mov        dword ptr [rsp + 0x54], eax
00923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00928 48894424f8                     mov        qword ptr [rsp - 8], rax
0092d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00934 89442458                       mov        dword ptr [rsp + 0x58], eax
00938 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00945 488f442460                     pop        qword ptr [rsp + 0x60]
0094a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00952 488f442468                     pop        qword ptr [rsp + 0x68]
00957 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0095f 488f442470                     pop        qword ptr [rsp + 0x70]
00964 48894424f8                     mov        qword ptr [rsp - 8], rax
00969 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00970 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00974 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00979 48894424f8                     mov        qword ptr [rsp - 8], rax
0097e 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00985 89442478                       mov        dword ptr [rsp + 0x78], eax
00989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098e 48894424f8                     mov        qword ptr [rsp - 8], rax
00993 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099a 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0099e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a3 48894424f8                     mov        qword ptr [rsp - 8], rax
009a8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009af 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c3 488f842488000000               pop        qword ptr [rsp + 0x88]
009cb 48894424f8                     mov        qword ptr [rsp - 8], rax
009d0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d7 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e3 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009eb e8f031afff                     call       0x7f6a976cda60
009f0 0f1f8400e80a0001               nop        dword ptr [rax + rax + 0x1000ae8]
009f8 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
00a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a06 e8d53c1418                     call       0x7f6aafd1e560
00a0b f4                             hlt        
00a0c 85c9                           test       ecx, ecx
00a0e 7f08                           jg         0x7f6a97bda898
00a10 4533d2                         xor        r10d, r10d
00a13 e95cf9ffff                     jmp        0x7f6a97bda1f4
00a18 8be9                           mov        ebp, ecx
00a1a 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a22 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a26 90                             nop        
00a27 e8b453b5ff                     call       0x7f6a9772fc60
00a2c 0f1f8400240b0002               nop        dword ptr [rax + rax + 0x2000b24]
00a34 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a39 41c1e003                       shl        r8d, 3
00a3d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a42 41c1e303                       shl        r11d, 3
00a46 452bd8                         sub        r11d, r8d
00a49 4181c3c0000000                 add        r11d, 0xc0
00a50 c462a1f7d0                     shlx       r10, rax, r11
00a55 e91af9ffff                     jmp        0x7f6a97bda1f4
00a5a 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a62 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a6a 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a6f 4d3bd3                         cmp        r10, r11
00a72 7e31                           jle        0x7f6a97bda925
00a74 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a7e 90                             nop        
00a7f e85c53b5ff                     call       0x7f6a9772fc60
00a84 0f1f84007c0b0003               nop        dword ptr [rax + rax + 0x3000b7c]
00a8c 4885c0                         test       rax, rax
00a8f 0f8453200000                   je         0x7f6a97bdc968
00a95 488bf0                         mov        rsi, rax
00a98 4881c430010000                 add        rsp, 0x130
00a9f 5d                             pop        rbp
00aa0 e9bbbaaeff                     jmp        0x7f6a976c63e0
00aa5 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00aaa 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00aaf 0f855b200000                   jne        0x7f6a97bdc990
00ab5 418bc2                         mov        eax, r10d
00ab8 4881c430010000                 add        rsp, 0x130
00abf 5d                             pop        rbp
00ac0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ac4 0f87f8200000                   ja         0x7f6a97bdca42
00aca c3                             ret        
00acb 4533db                         xor        r11d, r11d
00ace 33ed                           xor        ebp, ebp
00ad0 4533d2                         xor        r10d, r10d
00ad3 4533c9                         xor        r9d, r9d
00ad6 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00ade 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00ae5 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00aed 44898c2404010000               mov        dword ptr [rsp + 0x104], r9d
00af5 e9e9fbffff                     jmp        0x7f6a97bda563
00afa bee4ffffff                     mov        esi, 0xffffffe4
00aff 48894424f8                     mov        qword ptr [rsp - 8], rax
00b04 8b442408                       mov        eax, dword ptr [rsp + 8]
00b08 890424                         mov        dword ptr [rsp], eax
00b0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b10 48894424f8                     mov        qword ptr [rsp - 8], rax
00b15 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b19 89442404                       mov        dword ptr [rsp + 4], eax
00b1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b22 48ff742410                     push       qword ptr [rsp + 0x10]
00b27 488f442408                     pop        qword ptr [rsp + 8]
00b2c 48ff742418                     push       qword ptr [rsp + 0x18]
00b31 488f442410                     pop        qword ptr [rsp + 0x10]
00b36 48894424f8                     mov        qword ptr [rsp - 8], rax
00b3b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b3f 89442418                       mov        dword ptr [rsp + 0x18], eax
00b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b48 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b51 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b63 89442420                       mov        dword ptr [rsp + 0x20], eax
00b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b71 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b75 89442424                       mov        dword ptr [rsp + 0x24], eax
00b79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b7e 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b83 48ff742438                     push       qword ptr [rsp + 0x38]
00b88 488f442430                     pop        qword ptr [rsp + 0x30]
00b8d 48894424f8                     mov        qword ptr [rsp - 8], rax
00b92 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b96 89442438                       mov        dword ptr [rsp + 0x38], eax
00b9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9f 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba4 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ba8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb1 48ff742448                     push       qword ptr [rsp + 0x48]
00bb6 488f442440                     pop        qword ptr [rsp + 0x40]
00bbb 48ff742450                     push       qword ptr [rsp + 0x50]
00bc0 488f442448                     pop        qword ptr [rsp + 0x48]
00bc5 48ff742458                     push       qword ptr [rsp + 0x58]
00bca 488f442450                     pop        qword ptr [rsp + 0x50]
00bcf 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bd7 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00bde 90                             nop        
00bdf e8fc2fafff                     call       0x7f6a976cda60
00be4 0f1f8400dc0c0004               nop        dword ptr [rax + rax + 0x4000cdc]
00bec 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
00bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfa e8e13a1418                     call       0x7f6aafd1e560
00bff f4                             hlt        
00c00 bee4ffffff                     mov        esi, 0xffffffe4
00c05 48894424f8                     mov        qword ptr [rsp - 8], rax
00c0a 8b442408                       mov        eax, dword ptr [rsp + 8]
00c0e 890424                         mov        dword ptr [rsp], eax
00c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c16 48894424f8                     mov        qword ptr [rsp - 8], rax
00c1b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c1f 89442404                       mov        dword ptr [rsp + 4], eax
00c23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c28 48ff742410                     push       qword ptr [rsp + 0x10]
00c2d 488f442408                     pop        qword ptr [rsp + 8]
00c32 48ff742418                     push       qword ptr [rsp + 0x18]
00c37 488f442410                     pop        qword ptr [rsp + 0x10]
00c3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c41 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c45 89442418                       mov        dword ptr [rsp + 0x18], eax
00c49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c53 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c60 48894424f8                     mov        qword ptr [rsp - 8], rax
00c65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c69 89442420                       mov        dword ptr [rsp + 0x20], eax
00c6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c72 48894424f8                     mov        qword ptr [rsp - 8], rax
00c77 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c7b 89442424                       mov        dword ptr [rsp + 0x24], eax
00c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c84 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c89 48ff742438                     push       qword ptr [rsp + 0x38]
00c8e 488f442430                     pop        qword ptr [rsp + 0x30]
00c93 48894424f8                     mov        qword ptr [rsp - 8], rax
00c98 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c9c 89442438                       mov        dword ptr [rsp + 0x38], eax
00ca0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ca5 48894424f8                     mov        qword ptr [rsp - 8], rax
00caa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00cae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb7 48ff742448                     push       qword ptr [rsp + 0x48]
00cbc 488f442440                     pop        qword ptr [rsp + 0x40]
00cc1 48ff742450                     push       qword ptr [rsp + 0x50]
00cc6 488f442448                     pop        qword ptr [rsp + 0x48]
00ccb 48ff742458                     push       qword ptr [rsp + 0x58]
00cd0 488f442450                     pop        qword ptr [rsp + 0x50]
00cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
00cda 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ce1 89442458                       mov        dword ptr [rsp + 0x58], eax
00ce5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cea 48894424f8                     mov        qword ptr [rsp - 8], rax
00cef 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cf6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cff 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00d06 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00d0e 90                             nop        
00d0f e8cc2eafff                     call       0x7f6a976cda60
00d14 0f1f84000c0e0005               nop        dword ptr [rax + rax + 0x5000e0c]
00d1c 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
00d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d2a e8b1391418                     call       0x7f6aafd1e560
00d2f f4                             hlt        
00d30 bee4ffffff                     mov        esi, 0xffffffe4
00d35 48894424f8                     mov        qword ptr [rsp - 8], rax
00d3a 8b442408                       mov        eax, dword ptr [rsp + 8]
00d3e 890424                         mov        dword ptr [rsp], eax
00d41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d46 48894424f8                     mov        qword ptr [rsp - 8], rax
00d4b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d4f 89442404                       mov        dword ptr [rsp + 4], eax
00d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d58 48ff742410                     push       qword ptr [rsp + 0x10]
00d5d 488f442408                     pop        qword ptr [rsp + 8]
00d62 48ff742418                     push       qword ptr [rsp + 0x18]
00d67 488f442410                     pop        qword ptr [rsp + 0x10]
00d6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d71 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d75 89442418                       mov        dword ptr [rsp + 0x18], eax
00d79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d7e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d83 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d87 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d90 48894424f8                     mov        qword ptr [rsp - 8], rax
00d95 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d99 89442420                       mov        dword ptr [rsp + 0x20], eax
00d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da2 48894424f8                     mov        qword ptr [rsp - 8], rax
00da7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00dab 89442424                       mov        dword ptr [rsp + 0x24], eax
00daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00db9 48ff742438                     push       qword ptr [rsp + 0x38]
00dbe 488f442430                     pop        qword ptr [rsp + 0x30]
00dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00dcc 89442438                       mov        dword ptr [rsp + 0x38], eax
00dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
00dda 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dde 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00de2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de7 48ff742448                     push       qword ptr [rsp + 0x48]
00dec 488f442440                     pop        qword ptr [rsp + 0x40]
00df1 48ff742450                     push       qword ptr [rsp + 0x50]
00df6 488f442448                     pop        qword ptr [rsp + 0x48]
00dfb 48ff742458                     push       qword ptr [rsp + 0x58]
00e00 488f442450                     pop        qword ptr [rsp + 0x50]
00e05 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00e11 89442458                       mov        dword ptr [rsp + 0x58], eax
00e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e1f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e26 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e2f 48894424f8                     mov        qword ptr [rsp - 8], rax
00e34 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e3b 89442460                       mov        dword ptr [rsp + 0x60], eax
00e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e44 48894424f8                     mov        qword ptr [rsp - 8], rax
00e49 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e50 89442464                       mov        dword ptr [rsp + 0x64], eax
00e54 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e59 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e61 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00e69 90                             nop        
00e6a 90                             nop        
00e6b e8702dafff                     call       0x7f6a976cda60
00e70 0f1f8400680f0006               nop        dword ptr [rax + rax + 0x6000f68]
00e78 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
00e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e86 e855381418                     call       0x7f6aafd1e560
00e8b f4                             hlt        
00e8c bee4ffffff                     mov        esi, 0xffffffe4
00e91 48894424f8                     mov        qword ptr [rsp - 8], rax
00e96 8b442408                       mov        eax, dword ptr [rsp + 8]
00e9a 890424                         mov        dword ptr [rsp], eax
00e9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00eab 89442404                       mov        dword ptr [rsp + 4], eax
00eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb4 48ff742410                     push       qword ptr [rsp + 0x10]
00eb9 488f442408                     pop        qword ptr [rsp + 8]
00ebe 48ff742418                     push       qword ptr [rsp + 0x18]
00ec3 488f442410                     pop        qword ptr [rsp + 0x10]
00ec8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ecd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00ed1 89442418                       mov        dword ptr [rsp + 0x18], eax
00ed5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eda 48894424f8                     mov        qword ptr [rsp - 8], rax
00edf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00ee3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ee7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eec 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ef5 89442420                       mov        dword ptr [rsp + 0x20], eax
00ef9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efe 48894424f8                     mov        qword ptr [rsp - 8], rax
00f03 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f07 89442424                       mov        dword ptr [rsp + 0x24], eax
00f0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f10 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f15 48ff742438                     push       qword ptr [rsp + 0x38]
00f1a 488f442430                     pop        qword ptr [rsp + 0x30]
00f1f 48894424f8                     mov        qword ptr [rsp - 8], rax
00f24 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f28 89442438                       mov        dword ptr [rsp + 0x38], eax
00f2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f31 48894424f8                     mov        qword ptr [rsp - 8], rax
00f36 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f3a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f43 48ff742448                     push       qword ptr [rsp + 0x48]
00f48 488f442440                     pop        qword ptr [rsp + 0x40]
00f4d 48ff742450                     push       qword ptr [rsp + 0x50]
00f52 488f442448                     pop        qword ptr [rsp + 0x48]
00f57 48ff742458                     push       qword ptr [rsp + 0x58]
00f5c 488f442450                     pop        qword ptr [rsp + 0x50]
00f61 48894424f8                     mov        qword ptr [rsp - 8], rax
00f66 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f6d 89442458                       mov        dword ptr [rsp + 0x58], eax
00f71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f76 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f82 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f90 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f97 89442460                       mov        dword ptr [rsp + 0x60], eax
00f9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa0 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00fa8 488f442478                     pop        qword ptr [rsp + 0x78]
00fad 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fb9 89442464                       mov        dword ptr [rsp + 0x64], eax
00fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fce 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fda 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fe6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00ffe 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0100a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01012 488f842490000000               pop        qword ptr [rsp + 0x90]
0101a 48894424f8                     mov        qword ptr [rsp - 8], rax
0101f 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01026 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
0102d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01032 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0103a 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01042 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0104a 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01052 90                             nop        
01053 e8882bafff                     call       0x7f6a976cda60
01058 0f1f840050110007               nop        dword ptr [rax + rax + 0x7001150]
01060 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
0106a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0106e e86d361418                     call       0x7f6aafd1e560
01073 f4                             hlt        
01074 4533c0                         xor        r8d, r8d
01077 4d3bc8                         cmp        r9, r8
0107a bdffffffff                     mov        ebp, 0xffffffff
0107f 7c08                           jl         0x7f6a97bdaf09
01081 400f95c5                       setne      bpl
01085 400fb6ed                       movzx      ebp, bpl
01089 be45ffffff                     mov        esi, 0xffffff45
0108e 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01093 48894424f8                     mov        qword ptr [rsp - 8], rax
01098 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0109f 89442460                       mov        dword ptr [rsp + 0x60], eax
010a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a8 48894424f8                     mov        qword ptr [rsp - 8], rax
010ad 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010b4 89442464                       mov        dword ptr [rsp + 0x64], eax
010b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010bd 48894424f8                     mov        qword ptr [rsp - 8], rax
010c2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010c9 89442468                       mov        dword ptr [rsp + 0x68], eax
010cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d2 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
010da 488f842480000000               pop        qword ptr [rsp + 0x80]
010e2 48894424f8                     mov        qword ptr [rsp - 8], rax
010e7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010ee 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f7 48894424f8                     mov        qword ptr [rsp - 8], rax
010fc 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01103 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0110a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110f 48894424f8                     mov        qword ptr [rsp - 8], rax
01114 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0111b 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01122 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01127 48894424f8                     mov        qword ptr [rsp - 8], rax
0112c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01133 89842490000000                 mov        dword ptr [rsp + 0x90], eax
0113a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0113f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01147 488f842498000000               pop        qword ptr [rsp + 0x98]
0114f 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01157 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0115f 48894424f8                     mov        qword ptr [rsp - 8], rax
01164 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0116b 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01172 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01177 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0117f 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01187 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
0118e 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01196 90                             nop        
01197 e8442aafff                     call       0x7f6a976cda60
0119c 0f1f840094120008               nop        dword ptr [rax + rax + 0x8001294]
011a4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
011ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
011b2 e829351418                     call       0x7f6aafd1e560
011b7 f4                             hlt        
011b8 be45ffffff                     mov        esi, 0xffffff45
011bd 48894424f8                     mov        qword ptr [rsp - 8], rax
011c2 8b442408                       mov        eax, dword ptr [rsp + 8]
011c6 890424                         mov        dword ptr [rsp], eax
011c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ce 48894424f8                     mov        qword ptr [rsp - 8], rax
011d3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011d7 89442404                       mov        dword ptr [rsp + 4], eax
011db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e0 48ff742410                     push       qword ptr [rsp + 0x10]
011e5 488f442408                     pop        qword ptr [rsp + 8]
011ea 48ff742418                     push       qword ptr [rsp + 0x18]
011ef 488f442410                     pop        qword ptr [rsp + 0x10]
011f4 48894424f8                     mov        qword ptr [rsp - 8], rax
011f9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011fd 89442418                       mov        dword ptr [rsp + 0x18], eax
01201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01206 48894424f8                     mov        qword ptr [rsp - 8], rax
0120b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0120f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01213 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01218 48894424f8                     mov        qword ptr [rsp - 8], rax
0121d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01221 89442420                       mov        dword ptr [rsp + 0x20], eax
01225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122a 48894424f8                     mov        qword ptr [rsp - 8], rax
0122f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01233 89442424                       mov        dword ptr [rsp + 0x24], eax
01237 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01241 48ff742438                     push       qword ptr [rsp + 0x38]
01246 488f442430                     pop        qword ptr [rsp + 0x30]
0124b 48894424f8                     mov        qword ptr [rsp - 8], rax
01250 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01254 89442438                       mov        dword ptr [rsp + 0x38], eax
01258 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125d 48894424f8                     mov        qword ptr [rsp - 8], rax
01262 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01266 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0126a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126f 48ff742448                     push       qword ptr [rsp + 0x48]
01274 488f442440                     pop        qword ptr [rsp + 0x40]
01279 48ff742450                     push       qword ptr [rsp + 0x50]
0127e 488f442448                     pop        qword ptr [rsp + 0x48]
01283 48ff742458                     push       qword ptr [rsp + 0x58]
01288 488f442450                     pop        qword ptr [rsp + 0x50]
0128d 48894424f8                     mov        qword ptr [rsp - 8], rax
01292 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01299 89442458                       mov        dword ptr [rsp + 0x58], eax
0129d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a2 48894424f8                     mov        qword ptr [rsp - 8], rax
012a7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012ae 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b7 48894424f8                     mov        qword ptr [rsp - 8], rax
012bc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012c3 89442460                       mov        dword ptr [rsp + 0x60], eax
012c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012d4 488f442468                     pop        qword ptr [rsp + 0x68]
012d9 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012e1 488f442478                     pop        qword ptr [rsp + 0x78]
012e6 48894424f8                     mov        qword ptr [rsp - 8], rax
012eb 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012f2 89442464                       mov        dword ptr [rsp + 0x64], eax
012f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01300 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01307 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0130e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01313 48894424f8                     mov        qword ptr [rsp - 8], rax
01318 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0131f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01326 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132b 48894424f8                     mov        qword ptr [rsp - 8], rax
01330 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01337 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0133e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01343 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0134b 488f842490000000               pop        qword ptr [rsp + 0x90]
01353 48894424f8                     mov        qword ptr [rsp - 8], rax
01358 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0135f 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01366 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136b 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01373 e86828afff                     call       0x7f6a976cda60
01378 0f1f840070140009               nop        dword ptr [rax + rax + 0x9001470]
01380 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
0138a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0138e e84d331418                     call       0x7f6aafd1e560
01393 f4                             hlt        
01394 be45ffffff                     mov        esi, 0xffffff45
01399 48894424f8                     mov        qword ptr [rsp - 8], rax
0139e 8b442408                       mov        eax, dword ptr [rsp + 8]
013a2 890424                         mov        dword ptr [rsp], eax
013a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013aa 48894424f8                     mov        qword ptr [rsp - 8], rax
013af 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013b3 89442404                       mov        dword ptr [rsp + 4], eax
013b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013bc 48ff742410                     push       qword ptr [rsp + 0x10]
013c1 488f442408                     pop        qword ptr [rsp + 8]
013c6 48ff742418                     push       qword ptr [rsp + 0x18]
013cb 488f442410                     pop        qword ptr [rsp + 0x10]
013d0 48894424f8                     mov        qword ptr [rsp - 8], rax
013d5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013d9 89442418                       mov        dword ptr [rsp + 0x18], eax
013dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e2 4489442420                     mov        dword ptr [rsp + 0x20], r8d
013e7 e8f427afff                     call       0x7f6a976cda60
013ec 0f1f8400e414000a               nop        dword ptr [rax + rax + 0xa0014e4]
013f4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
013fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01402 e8d9321418                     call       0x7f6aafd1e560
01407 f4                             hlt        
01408 be45ffffff                     mov        esi, 0xffffff45
0140d 48894424f8                     mov        qword ptr [rsp - 8], rax
01412 8b442408                       mov        eax, dword ptr [rsp + 8]
01416 890424                         mov        dword ptr [rsp], eax
01419 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141e 48894424f8                     mov        qword ptr [rsp - 8], rax
01423 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01427 89442404                       mov        dword ptr [rsp + 4], eax
0142b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01430 48ff742410                     push       qword ptr [rsp + 0x10]
01435 488f442408                     pop        qword ptr [rsp + 8]
0143a 48ff742418                     push       qword ptr [rsp + 0x18]
0143f 488f442410                     pop        qword ptr [rsp + 0x10]
01444 48894424f8                     mov        qword ptr [rsp - 8], rax
01449 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0144d 89442418                       mov        dword ptr [rsp + 0x18], eax
01451 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01456 48894424f8                     mov        qword ptr [rsp - 8], rax
0145b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0145f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01463 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01468 48894424f8                     mov        qword ptr [rsp - 8], rax
0146d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01471 89442420                       mov        dword ptr [rsp + 0x20], eax
01475 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147a 48894424f8                     mov        qword ptr [rsp - 8], rax
0147f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01483 89442424                       mov        dword ptr [rsp + 0x24], eax
01487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01491 48ff742438                     push       qword ptr [rsp + 0x38]
01496 488f442430                     pop        qword ptr [rsp + 0x30]
0149b 48894424f8                     mov        qword ptr [rsp - 8], rax
014a0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014a4 89442438                       mov        dword ptr [rsp + 0x38], eax
014a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ad 48894424f8                     mov        qword ptr [rsp - 8], rax
014b2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014b6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bf 48ff742448                     push       qword ptr [rsp + 0x48]
014c4 488f442440                     pop        qword ptr [rsp + 0x40]
014c9 48ff742450                     push       qword ptr [rsp + 0x50]
014ce 488f442448                     pop        qword ptr [rsp + 0x48]
014d3 48ff742458                     push       qword ptr [rsp + 0x58]
014d8 488f442450                     pop        qword ptr [rsp + 0x50]
014dd 48894424f8                     mov        qword ptr [rsp - 8], rax
014e2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014e9 89442458                       mov        dword ptr [rsp + 0x58], eax
014ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f2 48894424f8                     mov        qword ptr [rsp - 8], rax
014f7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014fe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01507 48894424f8                     mov        qword ptr [rsp - 8], rax
0150c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01513 89442460                       mov        dword ptr [rsp + 0x60], eax
01517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01524 488f442468                     pop        qword ptr [rsp + 0x68]
01529 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01531 488f442470                     pop        qword ptr [rsp + 0x70]
01536 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0153e 488f442478                     pop        qword ptr [rsp + 0x78]
01543 48894424f8                     mov        qword ptr [rsp - 8], rax
01548 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0154f 89442464                       mov        dword ptr [rsp + 0x64], eax
01553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01558 48894424f8                     mov        qword ptr [rsp - 8], rax
0155d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01564 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0156b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01570 48894424f8                     mov        qword ptr [rsp - 8], rax
01575 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0157c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01583 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01588 48894424f8                     mov        qword ptr [rsp - 8], rax
0158d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01594 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0159b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015a8 488f842490000000               pop        qword ptr [rsp + 0x90]
015b0 48894424f8                     mov        qword ptr [rsp - 8], rax
015b5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015bc 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c8 90                             nop        
015c9 90                             nop        
015ca 90                             nop        
015cb e81026afff                     call       0x7f6a976cda60
015d0 0f1f8400c816000b               nop        dword ptr [rax + rax + 0xb0016c8]
015d8 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
015e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015e6 e8f5301418                     call       0x7f6aafd1e560
015eb f4                             hlt        
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 48894424f8                     mov        qword ptr [rsp - 8], rax
015f6 8b442408                       mov        eax, dword ptr [rsp + 8]
015fa 890424                         mov        dword ptr [rsp], eax
015fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01602 48894424f8                     mov        qword ptr [rsp - 8], rax
01607 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0160b 89442404                       mov        dword ptr [rsp + 4], eax
0160f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01614 48ff742410                     push       qword ptr [rsp + 0x10]
01619 488f442408                     pop        qword ptr [rsp + 8]
0161e 48ff742418                     push       qword ptr [rsp + 0x18]
01623 488f442410                     pop        qword ptr [rsp + 0x10]
01628 48894424f8                     mov        qword ptr [rsp - 8], rax
0162d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01631 89442418                       mov        dword ptr [rsp + 0x18], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 48894424f8                     mov        qword ptr [rsp - 8], rax
0163f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01643 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48894424f8                     mov        qword ptr [rsp - 8], rax
01651 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01655 89442420                       mov        dword ptr [rsp + 0x20], eax
01659 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165e 48894424f8                     mov        qword ptr [rsp - 8], rax
01663 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01667 89442424                       mov        dword ptr [rsp + 0x24], eax
0166b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01670 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01675 48ff742438                     push       qword ptr [rsp + 0x38]
0167a 488f442430                     pop        qword ptr [rsp + 0x30]
0167f 48894424f8                     mov        qword ptr [rsp - 8], rax
01684 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01688 89442438                       mov        dword ptr [rsp + 0x38], eax
0168c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01691 48894424f8                     mov        qword ptr [rsp - 8], rax
01696 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0169a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0169e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a3 48ff742448                     push       qword ptr [rsp + 0x48]
016a8 488f442440                     pop        qword ptr [rsp + 0x40]
016ad 48ff742450                     push       qword ptr [rsp + 0x50]
016b2 488f442448                     pop        qword ptr [rsp + 0x48]
016b7 48ff742458                     push       qword ptr [rsp + 0x58]
016bc 488f442450                     pop        qword ptr [rsp + 0x50]
016c1 48894424f8                     mov        qword ptr [rsp - 8], rax
016c6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016cd 89442458                       mov        dword ptr [rsp + 0x58], eax
016d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d6 48894424f8                     mov        qword ptr [rsp - 8], rax
016db 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016e2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016eb 48894424f8                     mov        qword ptr [rsp - 8], rax
016f0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016f7 89442460                       mov        dword ptr [rsp + 0x60], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01708 488f442468                     pop        qword ptr [rsp + 0x68]
0170d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01715 488f442470                     pop        qword ptr [rsp + 0x70]
0171a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01722 488f442478                     pop        qword ptr [rsp + 0x78]
01727 48894424f8                     mov        qword ptr [rsp - 8], rax
0172c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01733 89442464                       mov        dword ptr [rsp + 0x64], eax
01737 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173c 48894424f8                     mov        qword ptr [rsp - 8], rax
01741 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01748 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0174f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01754 48894424f8                     mov        qword ptr [rsp - 8], rax
01759 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01760 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01767 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01778 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0178c 488f842490000000               pop        qword ptr [rsp + 0x90]
01794 48894424f8                     mov        qword ptr [rsp - 8], rax
01799 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
017a0 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ac 48894424f8                     mov        qword ptr [rsp - 8], rax
017b1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017b8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017cc 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017d4 90                             nop        
017d5 90                             nop        
017d6 90                             nop        
017d7 e80424afff                     call       0x7f6a976cda60
017dc 0f1f8400d418000c               nop        dword ptr [rax + rax + 0xc0018d4]
017e4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
017ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
017f2 e8e92e1418                     call       0x7f6aafd1e560
017f7 f4                             hlt        
017f8 be45ffffff                     mov        esi, 0xffffff45
017fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01802 8b442408                       mov        eax, dword ptr [rsp + 8]
01806 890424                         mov        dword ptr [rsp], eax
01809 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180e 48894424f8                     mov        qword ptr [rsp - 8], rax
01813 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01817 89442404                       mov        dword ptr [rsp + 4], eax
0181b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01820 48ff742410                     push       qword ptr [rsp + 0x10]
01825 488f442408                     pop        qword ptr [rsp + 8]
0182a 48ff742418                     push       qword ptr [rsp + 0x18]
0182f 488f442410                     pop        qword ptr [rsp + 0x10]
01834 48894424f8                     mov        qword ptr [rsp - 8], rax
01839 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0183d 89442418                       mov        dword ptr [rsp + 0x18], eax
01841 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01846 48894424f8                     mov        qword ptr [rsp - 8], rax
0184b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0184f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01853 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01858 48894424f8                     mov        qword ptr [rsp - 8], rax
0185d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01861 89442420                       mov        dword ptr [rsp + 0x20], eax
01865 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186a 48894424f8                     mov        qword ptr [rsp - 8], rax
0186f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01873 89442424                       mov        dword ptr [rsp + 0x24], eax
01877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01881 48ff742438                     push       qword ptr [rsp + 0x38]
01886 488f442430                     pop        qword ptr [rsp + 0x30]
0188b 48894424f8                     mov        qword ptr [rsp - 8], rax
01890 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01894 89442438                       mov        dword ptr [rsp + 0x38], eax
01898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189d 48894424f8                     mov        qword ptr [rsp - 8], rax
018a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018af 48ff742448                     push       qword ptr [rsp + 0x48]
018b4 488f442440                     pop        qword ptr [rsp + 0x40]
018b9 48ff742450                     push       qword ptr [rsp + 0x50]
018be 488f442448                     pop        qword ptr [rsp + 0x48]
018c3 48ff742458                     push       qword ptr [rsp + 0x58]
018c8 488f442450                     pop        qword ptr [rsp + 0x50]
018cd 48894424f8                     mov        qword ptr [rsp - 8], rax
018d2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018d9 89442458                       mov        dword ptr [rsp + 0x58], eax
018dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e2 48894424f8                     mov        qword ptr [rsp - 8], rax
018e7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018ee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f7 48894424f8                     mov        qword ptr [rsp - 8], rax
018fc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01903 89442460                       mov        dword ptr [rsp + 0x60], eax
01907 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01914 488f442468                     pop        qword ptr [rsp + 0x68]
01919 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01921 488f442470                     pop        qword ptr [rsp + 0x70]
01926 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0192e 488f442478                     pop        qword ptr [rsp + 0x78]
01933 48894424f8                     mov        qword ptr [rsp - 8], rax
01938 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0193f 89442464                       mov        dword ptr [rsp + 0x64], eax
01943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01948 48894424f8                     mov        qword ptr [rsp - 8], rax
0194d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01954 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48894424f8                     mov        qword ptr [rsp - 8], rax
01965 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0196c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01978 48894424f8                     mov        qword ptr [rsp - 8], rax
0197d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01984 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01998 488f842490000000               pop        qword ptr [rsp + 0x90]
019a0 48894424f8                     mov        qword ptr [rsp - 8], rax
019a5 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019ac 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b8 48894424f8                     mov        qword ptr [rsp - 8], rax
019bd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019c4 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019d8 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019e0 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019e8 90                             nop        
019e9 90                             nop        
019ea 90                             nop        
019eb e8f021afff                     call       0x7f6a976cda60
019f0 0f1f8400e81a000d               nop        dword ptr [rax + rax + 0xd001ae8]
019f8 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
01a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a06 e8d52c1418                     call       0x7f6aafd1e560
01a0b f4                             hlt        
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
01a95 48ff742438                     push       qword ptr [rsp + 0x38]
01a9a 488f442430                     pop        qword ptr [rsp + 0x30]
01a9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01aa8 89442438                       mov        dword ptr [rsp + 0x38], eax
01aac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01aba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01abe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac3 48ff742448                     push       qword ptr [rsp + 0x48]
01ac8 488f442440                     pop        qword ptr [rsp + 0x40]
01acd 48ff742450                     push       qword ptr [rsp + 0x50]
01ad2 488f442448                     pop        qword ptr [rsp + 0x48]
01ad7 48ff742458                     push       qword ptr [rsp + 0x58]
01adc 488f442450                     pop        qword ptr [rsp + 0x50]
01ae1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01aed 89442458                       mov        dword ptr [rsp + 0x58], eax
01af1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af6 48894424f8                     mov        qword ptr [rsp - 8], rax
01afb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b02 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b10 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b17 89442460                       mov        dword ptr [rsp + 0x60], eax
01b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b20 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b28 488f442468                     pop        qword ptr [rsp + 0x68]
01b2d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b35 488f442478                     pop        qword ptr [rsp + 0x78]
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b46 89442464                       mov        dword ptr [rsp + 0x64], eax
01b4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b54 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b5b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b67 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b73 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b84 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b8b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b97 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b9f 488f842490000000               pop        qword ptr [rsp + 0x90]
01ba7 48894424f8                     mov        qword ptr [rsp - 8], rax
01bac 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bb3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbf 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bc7 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bcf 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bd6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bde 90                             nop        
01bdf e8fc1fafff                     call       0x7f6a976cda60
01be4 0f1f8400dc1c000e               nop        dword ptr [rax + rax + 0xe001cdc]
01bec 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
01bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfa e8e12a1418                     call       0x7f6aafd1e560
01bff f4                             hlt        
01c00 be45ffffff                     mov        esi, 0xffffff45
01c05 41b8ffffff7f                   mov        r8d, 0x7fffffff
01c0b 4d3bc8                         cmp        r9, r8
01c0e bdffffffff                     mov        ebp, 0xffffffff
01c13 7c08                           jl         0x7f6a97bdba9d
01c15 400f95c5                       setne      bpl
01c19 400fb6ed                       movzx      ebp, bpl
01c1d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c2e 89442460                       mov        dword ptr [rsp + 0x60], eax
01c32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c37 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c43 89442464                       mov        dword ptr [rsp + 0x64], eax
01c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c51 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c58 89442468                       mov        dword ptr [rsp + 0x68], eax
01c5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c61 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01c69 488f842480000000               pop        qword ptr [rsp + 0x80]
01c71 48894424f8                     mov        qword ptr [rsp - 8], rax
01c76 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c7d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c86 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c92 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01caa 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01cc2 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cce 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cd6 488f842498000000               pop        qword ptr [rsp + 0x98]
01cde 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01ce6 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cee 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01cfa 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01d01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d06 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d0e 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01d16 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01d1d 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d25 90                             nop        
01d26 90                             nop        
01d27 e8b41eafff                     call       0x7f6a976cda60
01d2c 0f1f8400241e000f               nop        dword ptr [rax + rax + 0xf001e24]
01d34 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
01d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d42 e899291418                     call       0x7f6aafd1e560
01d47 f4                             hlt        
01d48 be45ffffff                     mov        esi, 0xffffff45
01d4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d52 8b442408                       mov        eax, dword ptr [rsp + 8]
01d56 890424                         mov        dword ptr [rsp], eax
01d59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d63 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d67 89442404                       mov        dword ptr [rsp + 4], eax
01d6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d70 48ff742410                     push       qword ptr [rsp + 0x10]
01d75 488f442408                     pop        qword ptr [rsp + 8]
01d7a 48ff742418                     push       qword ptr [rsp + 0x18]
01d7f 488f442410                     pop        qword ptr [rsp + 0x10]
01d84 48894424f8                     mov        qword ptr [rsp - 8], rax
01d89 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d8d 89442418                       mov        dword ptr [rsp + 0x18], eax
01d91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d96 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d9f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01da3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da8 48894424f8                     mov        qword ptr [rsp - 8], rax
01dad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01db1 89442420                       mov        dword ptr [rsp + 0x20], eax
01db5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dba 48894424f8                     mov        qword ptr [rsp - 8], rax
01dbf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dc3 89442424                       mov        dword ptr [rsp + 0x24], eax
01dc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dcc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01dd1 48ff742438                     push       qword ptr [rsp + 0x38]
01dd6 488f442430                     pop        qword ptr [rsp + 0x30]
01ddb 48894424f8                     mov        qword ptr [rsp - 8], rax
01de0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01de4 89442438                       mov        dword ptr [rsp + 0x38], eax
01de8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ded 48894424f8                     mov        qword ptr [rsp - 8], rax
01df2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01df6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dff 48ff742448                     push       qword ptr [rsp + 0x48]
01e04 488f442440                     pop        qword ptr [rsp + 0x40]
01e09 48ff742450                     push       qword ptr [rsp + 0x50]
01e0e 488f442448                     pop        qword ptr [rsp + 0x48]
01e13 48ff742458                     push       qword ptr [rsp + 0x58]
01e18 488f442450                     pop        qword ptr [rsp + 0x50]
01e1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e22 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e29 89442458                       mov        dword ptr [rsp + 0x58], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e47 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e53 89442460                       mov        dword ptr [rsp + 0x60], eax
01e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5c 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e61 48894424f8                     mov        qword ptr [rsp - 8], rax
01e66 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e6d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e82 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e93 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e9a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
01eab 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01eb2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01eb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebe 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ec6 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01ecd 90                             nop        
01ece 90                             nop        
01ecf e80c1dafff                     call       0x7f6a976cda60
01ed4 0f1f8400cc1f0010               nop        dword ptr [rax + rax + 0x10001fcc]
01edc 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e8f1271418                     call       0x7f6aafd1e560
01eef f4                             hlt        
01ef0 be45ffffff                     mov        esi, 0xffffff45
01ef5 48894424f8                     mov        qword ptr [rsp - 8], rax
01efa 8b442408                       mov        eax, dword ptr [rsp + 8]
01efe 890424                         mov        dword ptr [rsp], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f0f 89442404                       mov        dword ptr [rsp + 4], eax
01f13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f18 48ff742410                     push       qword ptr [rsp + 0x10]
01f1d 488f442408                     pop        qword ptr [rsp + 8]
01f22 48ff742418                     push       qword ptr [rsp + 0x18]
01f27 488f442410                     pop        qword ptr [rsp + 0x10]
01f2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f35 89442418                       mov        dword ptr [rsp + 0x18], eax
01f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f50 48894424f8                     mov        qword ptr [rsp - 8], rax
01f55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f59 89442420                       mov        dword ptr [rsp + 0x20], eax
01f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f62 48894424f8                     mov        qword ptr [rsp - 8], rax
01f67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f6b 89442424                       mov        dword ptr [rsp + 0x24], eax
01f6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f79 48ff742438                     push       qword ptr [rsp + 0x38]
01f7e 488f442430                     pop        qword ptr [rsp + 0x30]
01f83 48894424f8                     mov        qword ptr [rsp - 8], rax
01f88 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f8c 89442438                       mov        dword ptr [rsp + 0x38], eax
01f90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f95 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa7 48ff742448                     push       qword ptr [rsp + 0x48]
01fac 488f442440                     pop        qword ptr [rsp + 0x40]
01fb1 48ff742450                     push       qword ptr [rsp + 0x50]
01fb6 488f442448                     pop        qword ptr [rsp + 0x48]
01fbb 48ff742458                     push       qword ptr [rsp + 0x58]
01fc0 488f442450                     pop        qword ptr [rsp + 0x50]
01fc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fca 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fd1 89442458                       mov        dword ptr [rsp + 0x58], eax
01fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fda 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fe6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ffb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02004 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02009 48894424f8                     mov        qword ptr [rsp - 8], rax
0200e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02015 89442464                       mov        dword ptr [rsp + 0x64], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 48894424f8                     mov        qword ptr [rsp - 8], rax
02023 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0202a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02031 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02036 48894424f8                     mov        qword ptr [rsp - 8], rax
0203b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02042 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204e 48894424f8                     mov        qword ptr [rsp - 8], rax
02053 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0205a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02061 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02066 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0206e 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02076 90                             nop        
02077 e8641bafff                     call       0x7f6a976cda60
0207c 0f1f840074210011               nop        dword ptr [rax + rax + 0x11002174]
02084 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
0208e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02092 e849261418                     call       0x7f6aafd1e560
02097 f4                             hlt        
02098 be3dffffff                     mov        esi, 0xffffff3d
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442408                       mov        eax, dword ptr [rsp + 8]
020a6 890424                         mov        dword ptr [rsp], eax
020a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ae 48894424f8                     mov        qword ptr [rsp - 8], rax
020b3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020b7 89442404                       mov        dword ptr [rsp + 4], eax
020bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c0 48ff742410                     push       qword ptr [rsp + 0x10]
020c5 488f442408                     pop        qword ptr [rsp + 8]
020ca 48ff742418                     push       qword ptr [rsp + 0x18]
020cf 488f442410                     pop        qword ptr [rsp + 0x10]
020d4 48894424f8                     mov        qword ptr [rsp - 8], rax
020d9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020dd 89442418                       mov        dword ptr [rsp + 0x18], eax
020e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e6 48894424f8                     mov        qword ptr [rsp - 8], rax
020eb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020ef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f8 48894424f8                     mov        qword ptr [rsp - 8], rax
020fd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02101 89442420                       mov        dword ptr [rsp + 0x20], eax
02105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210a 48894424f8                     mov        qword ptr [rsp - 8], rax
0210f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02113 89442424                       mov        dword ptr [rsp + 0x24], eax
02117 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02121 48ff742438                     push       qword ptr [rsp + 0x38]
02126 488f442430                     pop        qword ptr [rsp + 0x30]
0212b 48894424f8                     mov        qword ptr [rsp - 8], rax
02130 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02134 89442438                       mov        dword ptr [rsp + 0x38], eax
02138 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213d 48894424f8                     mov        qword ptr [rsp - 8], rax
02142 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02146 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0214a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214f 48ff742448                     push       qword ptr [rsp + 0x48]
02154 488f442440                     pop        qword ptr [rsp + 0x40]
02159 48ff742450                     push       qword ptr [rsp + 0x50]
0215e 488f442448                     pop        qword ptr [rsp + 0x48]
02163 48ff742458                     push       qword ptr [rsp + 0x58]
02168 488f442450                     pop        qword ptr [rsp + 0x50]
0216d 48894424f8                     mov        qword ptr [rsp - 8], rax
02172 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02179 89442458                       mov        dword ptr [rsp + 0x58], eax
0217d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02182 48894424f8                     mov        qword ptr [rsp - 8], rax
02187 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0218e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02192 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02197 48894424f8                     mov        qword ptr [rsp - 8], rax
0219c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021a3 89442460                       mov        dword ptr [rsp + 0x60], eax
021a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ac 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
021b4 488f442478                     pop        qword ptr [rsp + 0x78]
021b9 48894424f8                     mov        qword ptr [rsp - 8], rax
021be 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021c5 89442464                       mov        dword ptr [rsp + 0x64], eax
021c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ce 48894424f8                     mov        qword ptr [rsp - 8], rax
021d3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021da 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e6 48894424f8                     mov        qword ptr [rsp - 8], rax
021eb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021f2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02203 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0220a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02211 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02216 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0221e 488f842490000000               pop        qword ptr [rsp + 0x90]
02226 48894424f8                     mov        qword ptr [rsp - 8], rax
0222b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02232 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02239 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02246 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0224e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02256 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0225e 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02266 48894424f8                     mov        qword ptr [rsp - 8], rax
0226b 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02272 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227e 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
02285 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0228d 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02295 90                             nop        
02296 90                             nop        
02297 e84419afff                     call       0x7f6a976cda60
0229c 0f1f840094230012               nop        dword ptr [rax + rax + 0x12002394]
022a4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
022ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
022b2 e829241418                     call       0x7f6aafd1e560
022b7 f4                             hlt        
022b8 be45ffffff                     mov        esi, 0xffffff45
022bd 48894424f8                     mov        qword ptr [rsp - 8], rax
022c2 8b442408                       mov        eax, dword ptr [rsp + 8]
022c6 890424                         mov        dword ptr [rsp], eax
022c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ce 48894424f8                     mov        qword ptr [rsp - 8], rax
022d3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022d7 89442404                       mov        dword ptr [rsp + 4], eax
022db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e0 48ff742410                     push       qword ptr [rsp + 0x10]
022e5 488f442408                     pop        qword ptr [rsp + 8]
022ea 48ff742418                     push       qword ptr [rsp + 0x18]
022ef 488f442410                     pop        qword ptr [rsp + 0x10]
022f4 48894424f8                     mov        qword ptr [rsp - 8], rax
022f9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022fd 89442418                       mov        dword ptr [rsp + 0x18], eax
02301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02306 48894424f8                     mov        qword ptr [rsp - 8], rax
0230b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0230f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02313 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02318 48894424f8                     mov        qword ptr [rsp - 8], rax
0231d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02321 89442420                       mov        dword ptr [rsp + 0x20], eax
02325 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232a 48894424f8                     mov        qword ptr [rsp - 8], rax
0232f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02333 89442424                       mov        dword ptr [rsp + 0x24], eax
02337 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02341 48ff742438                     push       qword ptr [rsp + 0x38]
02346 488f442430                     pop        qword ptr [rsp + 0x30]
0234b 48894424f8                     mov        qword ptr [rsp - 8], rax
02350 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02354 89442438                       mov        dword ptr [rsp + 0x38], eax
02358 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235d 48894424f8                     mov        qword ptr [rsp - 8], rax
02362 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02366 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0236a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236f 48ff742448                     push       qword ptr [rsp + 0x48]
02374 488f442440                     pop        qword ptr [rsp + 0x40]
02379 48ff742450                     push       qword ptr [rsp + 0x50]
0237e 488f442448                     pop        qword ptr [rsp + 0x48]
02383 48ff742458                     push       qword ptr [rsp + 0x58]
02388 488f442450                     pop        qword ptr [rsp + 0x50]
0238d 897c2458                       mov        dword ptr [rsp + 0x58], edi
02391 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02399 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
023a1 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023a9 90                             nop        
023aa 90                             nop        
023ab e83018afff                     call       0x7f6a976cda60
023b0 0f1f8400a8240013               nop        dword ptr [rax + rax + 0x130024a8]
023b8 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
023c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023c6 e815231418                     call       0x7f6aafd1e560
023cb f4                             hlt        
023cc be45ffffff                     mov        esi, 0xffffff45
023d1 48894424f8                     mov        qword ptr [rsp - 8], rax
023d6 8b442408                       mov        eax, dword ptr [rsp + 8]
023da 890424                         mov        dword ptr [rsp], eax
023dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e2 48894424f8                     mov        qword ptr [rsp - 8], rax
023e7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023eb 89442404                       mov        dword ptr [rsp + 4], eax
023ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f4 48ff742410                     push       qword ptr [rsp + 0x10]
023f9 488f442408                     pop        qword ptr [rsp + 8]
023fe 48ff742418                     push       qword ptr [rsp + 0x18]
02403 488f442410                     pop        qword ptr [rsp + 0x10]
02408 48894424f8                     mov        qword ptr [rsp - 8], rax
0240d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02411 89442418                       mov        dword ptr [rsp + 0x18], eax
02415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241a 48894424f8                     mov        qword ptr [rsp - 8], rax
0241f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02423 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242c 48894424f8                     mov        qword ptr [rsp - 8], rax
02431 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02435 89442420                       mov        dword ptr [rsp + 0x20], eax
02439 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243e 48894424f8                     mov        qword ptr [rsp - 8], rax
02443 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02447 89442424                       mov        dword ptr [rsp + 0x24], eax
0244b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02450 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02455 48ff742438                     push       qword ptr [rsp + 0x38]
0245a 488f442430                     pop        qword ptr [rsp + 0x30]
0245f 48894424f8                     mov        qword ptr [rsp - 8], rax
02464 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02468 89442438                       mov        dword ptr [rsp + 0x38], eax
0246c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02471 48894424f8                     mov        qword ptr [rsp - 8], rax
02476 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0247a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0247e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02483 48ff742448                     push       qword ptr [rsp + 0x48]
02488 488f442440                     pop        qword ptr [rsp + 0x40]
0248d 48ff742450                     push       qword ptr [rsp + 0x50]
02492 488f442448                     pop        qword ptr [rsp + 0x48]
02497 48ff742458                     push       qword ptr [rsp + 0x58]
0249c 488f442450                     pop        qword ptr [rsp + 0x50]
024a1 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024a9 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024b1 90                             nop        
024b2 90                             nop        
024b3 e82817afff                     call       0x7f6a976cda60
024b8 0f1f8400b0250014               nop        dword ptr [rax + rax + 0x140025b0]
024c0 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
024ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ce e80d221418                     call       0x7f6aafd1e560
024d3 f4                             hlt        
024d4 be45ffffff                     mov        esi, 0xffffff45
024d9 48894424f8                     mov        qword ptr [rsp - 8], rax
024de 8b442408                       mov        eax, dword ptr [rsp + 8]
024e2 890424                         mov        dword ptr [rsp], eax
024e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ea 48894424f8                     mov        qword ptr [rsp - 8], rax
024ef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024f3 89442404                       mov        dword ptr [rsp + 4], eax
024f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024fc 48ff742410                     push       qword ptr [rsp + 0x10]
02501 488f442408                     pop        qword ptr [rsp + 8]
02506 48ff742418                     push       qword ptr [rsp + 0x18]
0250b 488f442410                     pop        qword ptr [rsp + 0x10]
02510 48894424f8                     mov        qword ptr [rsp - 8], rax
02515 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02519 89442418                       mov        dword ptr [rsp + 0x18], eax
0251d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02522 48894424f8                     mov        qword ptr [rsp - 8], rax
02527 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0252b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0252f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02534 48894424f8                     mov        qword ptr [rsp - 8], rax
02539 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0253d 89442420                       mov        dword ptr [rsp + 0x20], eax
02541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02546 48894424f8                     mov        qword ptr [rsp - 8], rax
0254b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0254f 89442424                       mov        dword ptr [rsp + 0x24], eax
02553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02558 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0255d 48ff742438                     push       qword ptr [rsp + 0x38]
02562 488f442430                     pop        qword ptr [rsp + 0x30]
02567 48894424f8                     mov        qword ptr [rsp - 8], rax
0256c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02570 89442438                       mov        dword ptr [rsp + 0x38], eax
02574 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02579 48894424f8                     mov        qword ptr [rsp - 8], rax
0257e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02582 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02586 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0258b 48ff742448                     push       qword ptr [rsp + 0x48]
02590 488f442440                     pop        qword ptr [rsp + 0x40]
02595 48ff742450                     push       qword ptr [rsp + 0x50]
0259a 488f442448                     pop        qword ptr [rsp + 0x48]
0259f 48ff742458                     push       qword ptr [rsp + 0x58]
025a4 488f442450                     pop        qword ptr [rsp + 0x50]
025a9 48894424f8                     mov        qword ptr [rsp - 8], rax
025ae 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
025b5 89442458                       mov        dword ptr [rsp + 0x58], eax
025b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025be 48894424f8                     mov        qword ptr [rsp - 8], rax
025c3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025ca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d3 48894424f8                     mov        qword ptr [rsp - 8], rax
025d8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025df 89442460                       mov        dword ptr [rsp + 0x60], eax
025e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025f0 488f442468                     pop        qword ptr [rsp + 0x68]
025f5 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025fd 488f442470                     pop        qword ptr [rsp + 0x70]
02602 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0260a 488f442478                     pop        qword ptr [rsp + 0x78]
0260f 48894424f8                     mov        qword ptr [rsp - 8], rax
02614 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0261b 89442464                       mov        dword ptr [rsp + 0x64], eax
0261f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02624 48894424f8                     mov        qword ptr [rsp - 8], rax
02629 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02630 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02637 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263c 48894424f8                     mov        qword ptr [rsp - 8], rax
02641 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02648 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0264f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02654 48894424f8                     mov        qword ptr [rsp - 8], rax
02659 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02660 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02667 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02674 488f842490000000               pop        qword ptr [rsp + 0x90]
0267c 48894424f8                     mov        qword ptr [rsp - 8], rax
02681 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02688 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0268f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02694 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0269c 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
026a4 90                             nop        
026a5 90                             nop        
026a6 90                             nop        
026a7 e83415afff                     call       0x7f6a976cda60
026ac 0f1f8400a4270015               nop        dword ptr [rax + rax + 0x150027a4]
026b4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
026be 4883e4f0                       and        rsp, 0xfffffffffffffff0
026c2 e819201418                     call       0x7f6aafd1e560
026c7 f4                             hlt        
026c8 be45ffffff                     mov        esi, 0xffffff45
026cd 48894424f8                     mov        qword ptr [rsp - 8], rax
026d2 8b442408                       mov        eax, dword ptr [rsp + 8]
026d6 890424                         mov        dword ptr [rsp], eax
026d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026de 48894424f8                     mov        qword ptr [rsp - 8], rax
026e3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026e7 89442404                       mov        dword ptr [rsp + 4], eax
026eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f0 48ff742410                     push       qword ptr [rsp + 0x10]
026f5 488f442408                     pop        qword ptr [rsp + 8]
026fa 48ff742418                     push       qword ptr [rsp + 0x18]
026ff 488f442410                     pop        qword ptr [rsp + 0x10]
02704 48894424f8                     mov        qword ptr [rsp - 8], rax
02709 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0270d 89442418                       mov        dword ptr [rsp + 0x18], eax
02711 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02716 48894424f8                     mov        qword ptr [rsp - 8], rax
0271b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0271f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02723 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02728 48894424f8                     mov        qword ptr [rsp - 8], rax
0272d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02731 89442420                       mov        dword ptr [rsp + 0x20], eax
02735 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273a 48894424f8                     mov        qword ptr [rsp - 8], rax
0273f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02743 89442424                       mov        dword ptr [rsp + 0x24], eax
02747 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274c 48ff742438                     push       qword ptr [rsp + 0x38]
02751 488f442430                     pop        qword ptr [rsp + 0x30]
02756 48894424f8                     mov        qword ptr [rsp - 8], rax
0275b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0275f 89442438                       mov        dword ptr [rsp + 0x38], eax
02763 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02768 48894424f8                     mov        qword ptr [rsp - 8], rax
0276d 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02771 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02775 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277a 48ff742448                     push       qword ptr [rsp + 0x48]
0277f 488f442440                     pop        qword ptr [rsp + 0x40]
02784 48ff742450                     push       qword ptr [rsp + 0x50]
02789 488f442448                     pop        qword ptr [rsp + 0x48]
0278e 48ff742458                     push       qword ptr [rsp + 0x58]
02793 488f442450                     pop        qword ptr [rsp + 0x50]
02798 48894424f8                     mov        qword ptr [rsp - 8], rax
0279d 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
027a4 89442458                       mov        dword ptr [rsp + 0x58], eax
027a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ad 48894424f8                     mov        qword ptr [rsp - 8], rax
027b2 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
027b9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c2 48894424f8                     mov        qword ptr [rsp - 8], rax
027c7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
027ce 89442460                       mov        dword ptr [rsp + 0x60], eax
027d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d7 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027df 488f442468                     pop        qword ptr [rsp + 0x68]
027e4 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027ec 488f442470                     pop        qword ptr [rsp + 0x70]
027f1 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
027f9 488f442478                     pop        qword ptr [rsp + 0x78]
027fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02803 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0280a 89442464                       mov        dword ptr [rsp + 0x64], eax
0280e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02813 48894424f8                     mov        qword ptr [rsp - 8], rax
02818 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0281f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02826 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282b 48894424f8                     mov        qword ptr [rsp - 8], rax
02830 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02837 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0283e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02843 48894424f8                     mov        qword ptr [rsp - 8], rax
02848 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0284f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02856 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285b 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02863 488f842490000000               pop        qword ptr [rsp + 0x90]
0286b 48894424f8                     mov        qword ptr [rsp - 8], rax
02870 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02877 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0287e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02883 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0288b 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02893 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0289b 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
028a3 e83813afff                     call       0x7f6a976cda60
028a8 0f1f8400a0290016               nop        dword ptr [rax + rax + 0x160029a0]
028b0 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
028ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
028be e81d1e1418                     call       0x7f6aafd1e560
028c3 f4                             hlt        
028c4 4533d2                         xor        r10d, r10d
028c7 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
028cf e9ffd8ffff                     jmp        0x7f6a97bda053
028d4 4533d2                         xor        r10d, r10d
028d7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028dc e919d9ffff                     jmp        0x7f6a97bda07a
028e1 4533d2                         xor        r10d, r10d
028e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028e9 e938d9ffff                     jmp        0x7f6a97bda0a6
028ee 4533d2                         xor        r10d, r10d
028f1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
028f6 e952d9ffff                     jmp        0x7f6a97bda0cd
028fb 4533d2                         xor        r10d, r10d
028fe 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02903 e977d9ffff                     jmp        0x7f6a97bda0ff
02908 4533d2                         xor        r10d, r10d
0290b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02910 e994d9ffff                     jmp        0x7f6a97bda129
02915 4533d2                         xor        r10d, r10d
02918 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02920 e9b9d9ffff                     jmp        0x7f6a97bda15e
02925 4533d2                         xor        r10d, r10d
02928 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02930 e9cfd9ffff                     jmp        0x7f6a97bda184
02935 bebeffffff                     mov        esi, 0xffffffbe
0293a 48894424f8                     mov        qword ptr [rsp - 8], rax
0293f 8b442408                       mov        eax, dword ptr [rsp + 8]
02943 890424                         mov        dword ptr [rsp], eax
02946 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0294b 48894424f8                     mov        qword ptr [rsp - 8], rax
02950 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02954 89442404                       mov        dword ptr [rsp + 4], eax
02958 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295d 48ff742410                     push       qword ptr [rsp + 0x10]
02962 488f442408                     pop        qword ptr [rsp + 8]
02967 48ff742418                     push       qword ptr [rsp + 0x18]
0296c 488f442410                     pop        qword ptr [rsp + 0x10]
02971 48894424f8                     mov        qword ptr [rsp - 8], rax
02976 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0297a 89442418                       mov        dword ptr [rsp + 0x18], eax
0297e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02983 48894424f8                     mov        qword ptr [rsp - 8], rax
02988 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0298c 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02995 48894424f8                     mov        qword ptr [rsp - 8], rax
0299a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0299e 89442420                       mov        dword ptr [rsp + 0x20], eax
029a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a7 48894424f8                     mov        qword ptr [rsp - 8], rax
029ac 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
029b0 89442424                       mov        dword ptr [rsp + 0x24], eax
029b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b9 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
029be 48ff742438                     push       qword ptr [rsp + 0x38]
029c3 488f442430                     pop        qword ptr [rsp + 0x30]
029c8 48894424f8                     mov        qword ptr [rsp - 8], rax
029cd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029d1 89442438                       mov        dword ptr [rsp + 0x38], eax
029d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029da 48894424f8                     mov        qword ptr [rsp - 8], rax
029df 8b442444                       mov        eax, dword ptr [rsp + 0x44]
029e3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ec 48ff742448                     push       qword ptr [rsp + 0x48]
029f1 488f442440                     pop        qword ptr [rsp + 0x40]
029f6 48ff742450                     push       qword ptr [rsp + 0x50]
029fb 488f442448                     pop        qword ptr [rsp + 0x48]
02a00 48ff742458                     push       qword ptr [rsp + 0x58]
02a05 488f442450                     pop        qword ptr [rsp + 0x50]
02a0a 90                             nop        
02a0b e8d011afff                     call       0x7f6a976cda60
02a10 0f1f8400082b0017               nop        dword ptr [rax + rax + 0x17002b08]
02a18 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02a22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a26 e8b51c1418                     call       0x7f6aafd1e560
02a2b f4                             hlt        
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
02a93 48ff742438                     push       qword ptr [rsp + 0x38]
02a98 488f442420                     pop        qword ptr [rsp + 0x20]
02a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02aa6 89442414                       mov        dword ptr [rsp + 0x14], eax
02aaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab4 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02ab8 89442428                       mov        dword ptr [rsp + 0x28], eax
02abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac1 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02ac6 90                             nop        
02ac7 e81411afff                     call       0x7f6a976cda60
02acc 0f1f8400c42b0018               nop        dword ptr [rax + rax + 0x18002bc4]
02ad4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e8f91b1418                     call       0x7f6aafd1e560
02ae7 f4                             hlt        
02ae8 bef6ffffff                     mov        esi, 0xfffffff6
02aed 90                             nop        
02aee 90                             nop        
02aef e8ec10afff                     call       0x7f6a976cda60
02af4 0f1f8400ec2b0019               nop        dword ptr [rax + rax + 0x19002bec]
02afc 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b0a e8d11b1418                     call       0x7f6aafd1e560
02b0f f4                             hlt        
02b10 be5d000000                     mov        esi, 0x5d
02b15 90                             nop        
02b16 90                             nop        
02b17 e8c410afff                     call       0x7f6a976cda60
02b1c 0f1f8400142c001a               nop        dword ptr [rax + rax + 0x1a002c14]
02b24 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b32 e8a91b1418                     call       0x7f6aafd1e560
02b37 f4                             hlt        
02b38 bef6ffffff                     mov        esi, 0xfffffff6
02b3d 8be9                           mov        ebp, ecx
02b3f e89c10afff                     call       0x7f6a976cda60
02b44 0f1f84003c2c001b               nop        dword ptr [rax + rax + 0x1b002c3c]
02b4c 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5a e8811b1418                     call       0x7f6aafd1e560
02b5f f4                             hlt        
02b60 bef6ffffff                     mov        esi, 0xfffffff6
02b65 418be8                         mov        ebp, r8d
02b68 90                             nop        
02b69 90                             nop        
02b6a 90                             nop        
02b6b e87010afff                     call       0x7f6a976cda60
02b70 0f1f8400682c001c               nop        dword ptr [rax + rax + 0x1c002c68]
02b78 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b86 e8551b1418                     call       0x7f6aafd1e560
02b8b f4                             hlt        
02b8c bef6ffffff                     mov        esi, 0xfffffff6
02b91 418be9                         mov        ebp, r9d
02b94 90                             nop        
02b95 90                             nop        
02b96 90                             nop        
02b97 e84410afff                     call       0x7f6a976cda60
02b9c 0f1f8400942c001d               nop        dword ptr [rax + rax + 0x1d002c94]
02ba4 48bf608c46706a7f0000           movabs     rdi, 0x7f6a70468c60
02bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bb2 e8291b1418                     call       0x7f6aafd1e560
02bb7 f4                             hlt        
02bb8 eb00                           jmp        0x7f6a97bdca3a
02bba 488bf0                         mov        rsi, rax
02bbd e9d6deffff                     jmp        0x7f6a97bda918
02bc2 49ba40a9bd976a7f0000           movabs     r10, 0x7f6a97bda940
02bcc 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02bd3 e90859b5ff                     jmp        0x7f6a97732360
02bd8 e88327b4ff                     call       0x7f6a9771f1e0
02bdd e94cd4ffff                     jmp        0x7f6a97bd9eae
02be2 f4                             hlt        
02be3 f4                             hlt        
02be4 f4                             hlt        
02be5 f4                             hlt        
02be6 f4                             hlt        
02be7 f4                             hlt        
