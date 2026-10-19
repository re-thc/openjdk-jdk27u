00000 e8fbf67215                     call       0x7fc021593580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85ae270000                   jne        0x7fc00be6665c
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
000a1 448b9ee0010000                 mov        r11d, dword ptr [rsi + 0x1e0]
000a8 44895c2408                     mov        dword ptr [rsp + 8], r11d
000ad 448b96d8010000                 mov        r10d, dword ptr [rsi + 0x1d8]
000b4 448954240c                     mov        dword ptr [rsp + 0xc], r10d
000b9 448b9ec0010000                 mov        r11d, dword ptr [rsi + 0x1c0]
000c0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
000c5 448b96b8010000                 mov        r10d, dword ptr [rsi + 0x1b8]
000cc 4489542424                     mov        dword ptr [rsp + 0x24], r10d
000d1 448b9ea0010000                 mov        r11d, dword ptr [rsi + 0x1a0]
000d8 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000dd 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000e4 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000eb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
000f0 448b9e70010000                 mov        r11d, dword ptr [rsi + 0x170]
000f7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
000fc 448b9668010000                 mov        r10d, dword ptr [rsi + 0x168]
00103 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00108 448b9e28010000                 mov        r11d, dword ptr [rsi + 0x128]
0010f 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00117 448b9620010000                 mov        r10d, dword ptr [rsi + 0x120]
0011e 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00126 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0012d 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00135 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
0013c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00144 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
0014b 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00153 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
0015a 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00162 448b96e0000000                 mov        r10d, dword ptr [rsi + 0xe0]
00169 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00171 448b9ed8000000                 mov        r11d, dword ptr [rsi + 0xd8]
00178 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00180 448b9698010000                 mov        r10d, dword ptr [rsi + 0x198]
00187 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0018c 488bfe                         mov        rdi, rsi
0018f 49bac09c6721c07f0000           movabs     r10, 0x7fc021679cc0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f84a2230000                   je         0x7fc00be663d4
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbe4050000                 cmp        r11d, 0x5e4
001c0 0f85e2240000                   jne        0x7fc00be66528
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8488230000                   je         0x7fc00be663e4
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f85b8240000                   jne        0x7fc00be66528
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8469230000                   je         0x7fc00be663f1
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f858c240000                   jne        0x7fc00be66528
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f844f230000                   je         0x7fc00be663fe
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f8565240000                   jne        0x7fc00be66528
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f842d230000                   je         0x7fc00be6640b
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f8536240000                   jne        0x7fc00be66528
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8410230000                   je         0x7fc00be66418
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f850c240000                   jne        0x7fc00be66528
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84eb220000                   je         0x7fc00be66425
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbe7050000                 cmp        r11d, 0x5e7
002c8 0f85da230000                   jne        0x7fc00be66528
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f84d6220000                   je         0x7fc00be66435
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fae6050000                 cmp        r10d, 0x5e6
002ee 0f85b4230000                   jne        0x7fc00be66528
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f84bb220000                   je         0x7fc00be66445
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f84ad220000                   je         0x7fc00be66445
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f849f220000                   je         0x7fc00be66445
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00341 458d5af9                       lea        r11d, [r10 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8c77220000                   jl         0x7fc00be66445
0034e 4183c2f9                       add        r10d, -7
00352 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0035a e968020000                     jmp        0x7fc00be64447
0035f 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
00367 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0036c 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00371 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00376 48894424f8                     mov        qword ptr [rsp - 8], rax
0037b 8b442430                       mov        eax, dword ptr [rsp + 0x30]
0037f 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00383 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00388 0f1f840000000000               nop        dword ptr [rax + rax]
00390 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8dd00f0000                   jge        0x7fc00be651f0
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d6d110000                   jge        0x7fc00be653c0
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d3c130000                   jge        0x7fc00be655b8
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bf9                           mov        edi, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8d15150000                   jge        0x7fc00be657b8
00423 41b901000000                   mov        r9d, 1
00429 c4c2d1f7c9                     shlx       rcx, r9, rbp
0042e 48ffc9                         dec        rcx
00431 4923cb                         and        rcx, r11
00434 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0043c 458bcb                         mov        r9d, r11d
0043f 4403cf                         add        r9d, edi
00442 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0044a 458bdb                         mov        r11d, r11d
0044d 4503d8                         add        r11d, r8d
00450 4963f9                         movsxd     rdi, r9d
00453 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0045b 458bc0                         mov        r8d, r8d
0045e 4903c8                         add        rcx, r8
00461 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00469 4c03c7                         add        r8, rdi
0046c 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
00474 4885c9                         test       rcx, rcx
00477 0f8e9b0b0000                   jle        0x7fc00be64e98
0047d 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
00484 0f8f8e160000                   jg         0x7fc00be65998
0048a 4181fbffff0100                 cmp        r11d, 0x1ffff
00491 0f8fb5170000                   jg         0x7fc00be65acc
00497 4181f9ffff0300                 cmp        r9d, 0x3ffff
0049e 0f8f3c190000                   jg         0x7fc00be65c60
004a4 8bc9                           mov        ecx, ecx
004a6 81f900000010                   cmp        ecx, 0x10000000
004ac 0f83c21a0000                   jae        0x7fc00be65df4
004b2 48c1e712                       shl        rdi, 0x12
004b6 4c63c1                         movsxd     r8, ecx
004b9 4d63db                         movsxd     r11, r11d
004bc 49c1e024                       shl        r8, 0x24
004c0 4c0bc7                         or         r8, rdi
004c3 4d0bc3                         or         r8, r11
004c6 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004ce 443b0c24                       cmp        r9d, dword ptr [rsp]
004d2 0f836c090000                   jae        0x7fc00be64cc4
004d8 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e0 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
004e8 4f8944d908                     mov        qword ptr [r9 + r11*8 + 8], r8
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8dbe000000                   jge        0x7fc00be64439
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
0050f 49c1e930                       shr        r9, 0x30
00513 458bc3                         mov        r8d, r11d
00516 418bd1                         mov        edx, r9d
00519 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00521 c44223f7da                     shrx       r11d, r10d, r11d
00526 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
0052d 038c24bc000000                 add        ecx, dword ptr [rsp + 0xbc]
00534 c44273f7ca                     shrx       r9d, r10d, ecx
00539 4103d1                         add        edx, r9d
0053c 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
00543 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054a 83f920                         cmp        ecx, 0x20
0054d 0f8d251c0000                   jge        0x7fc00be65ff8
00553 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0055b 49c1e930                       shr        r9, 0x30
0055f 418bc9                         mov        ecx, r9d
00562 41b901000000                   mov        r9d, 1
00568 8bbc24bc000000                 mov        edi, dword ptr [rsp + 0xbc]
0056f c4c241f7f9                     shlx       edi, r9d, edi
00574 ffcf                           dec        edi
00576 4123fb                         and        edi, r11d
00579 4103f8                         add        edi, r8d
0057c 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00583 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0058b 4183f820                       cmp        r8d, 0x20
0058f 0f8de31c0000                   jge        0x7fc00be660f8
00595 41b801000000                   mov        r8d, 1
0059b 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
005a3 c44221f7c0                     shlx       r8d, r8d, r11d
005a8 41ffc8                         dec        r8d
005ab 4523c2                         and        r8d, r10d
005ae 4403c1                         add        r8d, ecx
005b1 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
005b9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005bd 418502                         test       dword ptr [r10], eax
005c0 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c7 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005cf 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005d4 0f8d70040000                   jge        0x7fc00be648ca
005da 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005df 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005eb 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f3 458b4204                       mov        r8d, dword ptr [r10 + 4]
005f7 453bd8                         cmp        r11d, r8d
005fa 0f83ec040000                   jae        0x7fc00be6496c
00600 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00605 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00609 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00610 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00617 458b4104                       mov        r8d, dword ptr [r9 + 4]
0061b 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00620 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00628 413bc8                         cmp        ecx, r8d
0062b 0f83af050000                   jae        0x7fc00be64a60
00631 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00636 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063a 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00642 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0064a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064e 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00653 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0065b 453bd8                         cmp        r11d, r8d
0065e 0f8398060000                   jae        0x7fc00be64b7c
00664 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00669 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00671 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00678 ffc5                           inc        ebp
0067a 896c2404                       mov        dword ptr [rsp + 4], ebp
0067e 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00682 0f8d35040000                   jge        0x7fc00be6493d
00688 49c1ea28                       shr        r10, 0x28
0068c 458bd2                         mov        r10d, r10d
0068f 450fb6d2                       movzx      r10d, r10b
00693 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0069b 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a3 49c1ea28                       shr        r10, 0x28
006a7 458bda                         mov        r11d, r10d
006aa 450fb6cb                       movzx      r9d, r11b
006ae 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
006b6 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006be 49c1ea28                       shr        r10, 0x28
006c2 458bd2                         mov        r10d, r10d
006c5 450fb6da                       movzx      r11d, r10b
006c9 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
006d1 4503cb                         add        r9d, r11d
006d4 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006dc 41ba01000000                   mov        r10d, 1
006e2 4489942404010000               mov        dword ptr [rsp + 0x104], r10d
006ea 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006f2 49c1ea20                       shr        r10, 0x20
006f6 458bda                         mov        r11d, r10d
006f9 410fb6eb                       movzx      ebp, r11b
006fd 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00704 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0070c 49c1ea20                       shr        r10, 0x20
00710 458bd2                         mov        r10d, r10d
00713 410fb6ea                       movzx      ebp, r10b
00717 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
0071e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00726 49c1ea20                       shr        r10, 0x20
0072a 458bda                         mov        r11d, r10d
0072d 410fb6eb                       movzx      ebp, r11b
00731 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00738 448bd5                         mov        r10d, ebp
0073b 44039424f8000000               add        r10d, dword ptr [rsp + 0xf8]
00743 44039424fc000000               add        r10d, dword ptr [rsp + 0xfc]
0074b 44039424f4000000               add        r10d, dword ptr [rsp + 0xf4]
00753 4585d2                         test       r10d, r10d
00756 0f84ec090000                   je         0x7fc00be64fc8
0075c 4183fa3f                       cmp        r10d, 0x3f
00760 0f8faa0b0000                   jg         0x7fc00be65190
00766 41b840000000                   mov        r8d, 0x40
0076c 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
00771 453bd0                         cmp        r10d, r8d
00774 7e43                           jle        0x7fc00be64639
00776 458bda                         mov        r11d, r10d
00779 452bd8                         sub        r11d, r8d
0077c 4183f840                       cmp        r8d, 0x40
00780 0f8de61b0000                   jge        0x7fc00be661ec
00786 41b901000000                   mov        r9d, 1
0078c c442b9f7c1                     shlx       r8, r9, r8
00791 49ffc8                         dec        r8
00794 4c23c3                         and        r8, rbx
00797 c442a1f7c0                     shlx       r8, r8, r11
0079c 41b940000000                   mov        r9d, 0x40
007a2 452bcb                         sub        r9d, r11d
007a5 c462b3f75c2438                 shrx       r11, qword ptr [rsp + 0x38], r9
007ac 4d0bc3                         or         r8, r11
007af 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007b7 eb21                           jmp        0x7fc00be6465a
007b9 41bb01000000                   mov        r11d, 1
007bf c442a9f7db                     shlx       r11, r11, r10
007c4 452bc2                         sub        r8d, r10d
007c7 c462bbf7c3                     shrx       r8, rbx, r8
007cc 49ffcb                         dec        r11
007cf 4d23c3                         and        r8, r11
007d2 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007da 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
007df 4503da                         add        r11d, r10d
007e2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007e7 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
007ec 4503c2                         add        r8d, r10d
007ef 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007f4 4183fb40                       cmp        r11d, 0x40
007f8 0f8c92fbffff                   jl         0x7fc00be64210
007fe 458d53c0                       lea        r10d, [r11 - 0x40]
00802 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00807 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080b 83c5f8                         add        ebp, -8
0080e 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00812 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00816 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081a 83c1f0                         add        ecx, -0x10
0081d 83f908                         cmp        ecx, 8
00820 0f8cd6010000                   jl         0x7fc00be6487c
00826 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082b 4183c2e8                       add        r10d, -0x18
0082f 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00837 0f8222fbffff                   jb         0x7fc00be641df
0083d bee4ffffff                     mov        esi, 0xffffffe4
00842 48894424f8                     mov        qword ptr [rsp - 8], rax
00847 8b442408                       mov        eax, dword ptr [rsp + 8]
0084b 890424                         mov        dword ptr [rsp], eax
0084e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00853 48894424f8                     mov        qword ptr [rsp - 8], rax
00858 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085c 89442404                       mov        dword ptr [rsp + 4], eax
00860 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00865 48ff742410                     push       qword ptr [rsp + 0x10]
0086a 488f442408                     pop        qword ptr [rsp + 8]
0086f 48ff742418                     push       qword ptr [rsp + 0x18]
00874 488f442410                     pop        qword ptr [rsp + 0x10]
00879 48894424f8                     mov        qword ptr [rsp - 8], rax
0087e 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00882 89442418                       mov        dword ptr [rsp + 0x18], eax
00886 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088b 48894424f8                     mov        qword ptr [rsp - 8], rax
00890 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00894 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089d 48894424f8                     mov        qword ptr [rsp - 8], rax
008a2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a6 89442420                       mov        dword ptr [rsp + 0x20], eax
008aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008af 48894424f8                     mov        qword ptr [rsp - 8], rax
008b4 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008b8 89442424                       mov        dword ptr [rsp + 0x24], eax
008bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c1 48ff742438                     push       qword ptr [rsp + 0x38]
008c6 488f442428                     pop        qword ptr [rsp + 0x28]
008cb 48894424f8                     mov        qword ptr [rsp - 8], rax
008d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
008d4 89442430                       mov        dword ptr [rsp + 0x30], eax
008d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008dd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008e2 48ff742448                     push       qword ptr [rsp + 0x48]
008e7 488f442438                     pop        qword ptr [rsp + 0x38]
008ec 48ff742450                     push       qword ptr [rsp + 0x50]
008f1 488f442440                     pop        qword ptr [rsp + 0x40]
008f6 48ff742458                     push       qword ptr [rsp + 0x58]
008fb 488f442448                     pop        qword ptr [rsp + 0x48]
00900 48894424f8                     mov        qword ptr [rsp - 8], rax
00905 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090c 89442450                       mov        dword ptr [rsp + 0x50], eax
00910 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00915 48894424f8                     mov        qword ptr [rsp - 8], rax
0091a 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00921 89442454                       mov        dword ptr [rsp + 0x54], eax
00925 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092a 48894424f8                     mov        qword ptr [rsp - 8], rax
0092f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00936 89442458                       mov        dword ptr [rsp + 0x58], eax
0093a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00947 488f442460                     pop        qword ptr [rsp + 0x60]
0094c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00954 488f442468                     pop        qword ptr [rsp + 0x68]
00959 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00961 488f442470                     pop        qword ptr [rsp + 0x70]
00966 48894424f8                     mov        qword ptr [rsp - 8], rax
0096b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00972 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097b 48894424f8                     mov        qword ptr [rsp - 8], rax
00980 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00987 89442478                       mov        dword ptr [rsp + 0x78], eax
0098b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00990 48894424f8                     mov        qword ptr [rsp - 8], rax
00995 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099c 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a5 48894424f8                     mov        qword ptr [rsp - 8], rax
009aa 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009b1 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bd 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c5 488f842488000000               pop        qword ptr [rsp + 0x88]
009cd 48894424f8                     mov        qword ptr [rsp - 8], rax
009d2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d9 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009ed 6690                           nop        
009ef e8ecedb5ff                     call       0x7fc00b9c3660
009f4 0f1f8400ec0a0001               nop        dword ptr [rax + rax + 0x1000aec]
009fc 85c9                           test       ecx, ecx
009fe 7f08                           jg         0x7fc00be64888
00a00 4533d2                         xor        r10d, r10d
00a03 e964f9ffff                     jmp        0x7fc00be641ec
00a08 8be9                           mov        ebp, ecx
00a0a 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a12 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a16 90                             nop        
00a17 e8c46fa9ff                     call       0x7fc00b8fb860
00a1c 0f1f8400140b0002               nop        dword ptr [rax + rax + 0x2000b14]
00a24 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a29 41c1e303                       shl        r11d, 3
00a2d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a32 41c1e203                       shl        r10d, 3
00a36 452bd3                         sub        r10d, r11d
00a39 4181c2c0000000                 add        r10d, 0xc0
00a40 c462a9f7d0                     shlx       r10, rax, r10
00a45 e922f9ffff                     jmp        0x7fc00be641ec
00a4a 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a52 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a5a 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a5f 4d3bd3                         cmp        r10, r11
00a62 7f26                           jg         0x7fc00be6490a
00a64 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a69 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a6e 0f85f01c0000                   jne        0x7fc00be665e4
00a74 418bc2                         mov        eax, r10d
00a77 4881c430010000                 add        rsp, 0x130
00a7e 5d                             pop        rbp
00a7f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a83 0f873d1d0000                   ja         0x7fc00be66646
00a89 c3                             ret        
00a8a 48bed85429e300000000           movabs     rsi, 0xe32954d8
00a94 666690                         nop        
00a97 e8446fa9ff                     call       0x7fc00b8fb860
00a9c 0f1f8400940b0003               nop        dword ptr [rax + rax + 0x3000b94]
00aa4 4885c0                         test       rax, rax
00aa7 0f84a31c0000                   je         0x7fc00be665d0
00aad 488bf0                         mov        rsi, rax
00ab0 4881c430010000                 add        rsp, 0x130
00ab7 5d                             pop        rbp
00ab8 e9236cb6ff                     jmp        0x7fc00b9cb560
00abd 4533d2                         xor        r10d, r10d
00ac0 33ed                           xor        ebp, ebp
00ac2 4533c0                         xor        r8d, r8d
00ac5 4533db                         xor        r11d, r11d
00ac8 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ad0 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00ad7 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00adf 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00ae7 e9fefbffff                     jmp        0x7fc00be6456a
00aec bee4ffffff                     mov        esi, 0xffffffe4
00af1 48894424f8                     mov        qword ptr [rsp - 8], rax
00af6 8b442408                       mov        eax, dword ptr [rsp + 8]
00afa 890424                         mov        dword ptr [rsp], eax
00afd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b02 48894424f8                     mov        qword ptr [rsp - 8], rax
00b07 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b0b 89442404                       mov        dword ptr [rsp + 4], eax
00b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b14 48ff742410                     push       qword ptr [rsp + 0x10]
00b19 488f442408                     pop        qword ptr [rsp + 8]
00b1e 48ff742418                     push       qword ptr [rsp + 0x18]
00b23 488f442410                     pop        qword ptr [rsp + 0x10]
00b28 48894424f8                     mov        qword ptr [rsp - 8], rax
00b2d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b31 89442418                       mov        dword ptr [rsp + 0x18], eax
00b35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b3f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b43 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b4c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b51 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b55 89442420                       mov        dword ptr [rsp + 0x20], eax
00b59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b63 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b67 89442424                       mov        dword ptr [rsp + 0x24], eax
00b6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b70 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b75 48ff742438                     push       qword ptr [rsp + 0x38]
00b7a 488f442430                     pop        qword ptr [rsp + 0x30]
00b7f 48894424f8                     mov        qword ptr [rsp - 8], rax
00b84 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b88 89442438                       mov        dword ptr [rsp + 0x38], eax
00b8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b91 48894424f8                     mov        qword ptr [rsp - 8], rax
00b96 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b9a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba3 48ff742448                     push       qword ptr [rsp + 0x48]
00ba8 488f442440                     pop        qword ptr [rsp + 0x40]
00bad 48ff742450                     push       qword ptr [rsp + 0x50]
00bb2 488f442448                     pop        qword ptr [rsp + 0x48]
00bb7 48ff742458                     push       qword ptr [rsp + 0x58]
00bbc 488f442450                     pop        qword ptr [rsp + 0x50]
00bc1 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bc9 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bd1 6690                           nop        
00bd3 e808ecb5ff                     call       0x7fc00b9c3660
00bd8 0f1f8400d00c0004               nop        dword ptr [rax + rax + 0x4000cd0]
00be0 bee4ffffff                     mov        esi, 0xffffffe4
00be5 48894424f8                     mov        qword ptr [rsp - 8], rax
00bea 8b442408                       mov        eax, dword ptr [rsp + 8]
00bee 890424                         mov        dword ptr [rsp], eax
00bf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bf6 48894424f8                     mov        qword ptr [rsp - 8], rax
00bfb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00bff 89442404                       mov        dword ptr [rsp + 4], eax
00c03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c08 48ff742410                     push       qword ptr [rsp + 0x10]
00c0d 488f442408                     pop        qword ptr [rsp + 8]
00c12 48ff742418                     push       qword ptr [rsp + 0x18]
00c17 488f442410                     pop        qword ptr [rsp + 0x10]
00c1c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c21 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c25 89442418                       mov        dword ptr [rsp + 0x18], eax
00c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c33 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c37 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c40 48894424f8                     mov        qword ptr [rsp - 8], rax
00c45 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c49 89442420                       mov        dword ptr [rsp + 0x20], eax
00c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c52 48894424f8                     mov        qword ptr [rsp - 8], rax
00c57 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c5b 89442424                       mov        dword ptr [rsp + 0x24], eax
00c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c64 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c69 48ff742438                     push       qword ptr [rsp + 0x38]
00c6e 488f442430                     pop        qword ptr [rsp + 0x30]
00c73 48894424f8                     mov        qword ptr [rsp - 8], rax
00c78 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c7c 89442438                       mov        dword ptr [rsp + 0x38], eax
00c80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c85 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c8e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c97 48ff742448                     push       qword ptr [rsp + 0x48]
00c9c 488f442440                     pop        qword ptr [rsp + 0x40]
00ca1 48ff742450                     push       qword ptr [rsp + 0x50]
00ca6 488f442448                     pop        qword ptr [rsp + 0x48]
00cab 48ff742458                     push       qword ptr [rsp + 0x58]
00cb0 488f442450                     pop        qword ptr [rsp + 0x50]
00cb5 48894424f8                     mov        qword ptr [rsp - 8], rax
00cba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cc1 89442458                       mov        dword ptr [rsp + 0x58], eax
00cc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cca 48894424f8                     mov        qword ptr [rsp - 8], rax
00ccf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cd6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cdf 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00ce7 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00cee 90                             nop        
00cef e8eceab5ff                     call       0x7fc00b9c3660
00cf4 0f1f8400ec0d0005               nop        dword ptr [rax + rax + 0x5000dec]
00cfc bee4ffffff                     mov        esi, 0xffffffe4
00d01 48894424f8                     mov        qword ptr [rsp - 8], rax
00d06 8b442408                       mov        eax, dword ptr [rsp + 8]
00d0a 890424                         mov        dword ptr [rsp], eax
00d0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d12 48894424f8                     mov        qword ptr [rsp - 8], rax
00d17 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d1b 89442404                       mov        dword ptr [rsp + 4], eax
00d1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d24 48ff742410                     push       qword ptr [rsp + 0x10]
00d29 488f442408                     pop        qword ptr [rsp + 8]
00d2e 48ff742418                     push       qword ptr [rsp + 0x18]
00d33 488f442410                     pop        qword ptr [rsp + 0x10]
00d38 48894424f8                     mov        qword ptr [rsp - 8], rax
00d3d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d41 89442418                       mov        dword ptr [rsp + 0x18], eax
00d45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d4f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d53 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d5c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d61 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d65 89442420                       mov        dword ptr [rsp + 0x20], eax
00d69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d6e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d73 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d77 89442424                       mov        dword ptr [rsp + 0x24], eax
00d7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d80 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d85 48ff742438                     push       qword ptr [rsp + 0x38]
00d8a 488f442430                     pop        qword ptr [rsp + 0x30]
00d8f 48894424f8                     mov        qword ptr [rsp - 8], rax
00d94 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d98 89442438                       mov        dword ptr [rsp + 0x38], eax
00d9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da1 48894424f8                     mov        qword ptr [rsp - 8], rax
00da6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00daa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00dae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db3 48ff742448                     push       qword ptr [rsp + 0x48]
00db8 488f442440                     pop        qword ptr [rsp + 0x40]
00dbd 48ff742450                     push       qword ptr [rsp + 0x50]
00dc2 488f442448                     pop        qword ptr [rsp + 0x48]
00dc7 48ff742458                     push       qword ptr [rsp + 0x58]
00dcc 488f442450                     pop        qword ptr [rsp + 0x50]
00dd1 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ddd 89442458                       mov        dword ptr [rsp + 0x58], eax
00de1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de6 48894424f8                     mov        qword ptr [rsp - 8], rax
00deb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00df2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00df6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dfb 48894424f8                     mov        qword ptr [rsp - 8], rax
00e00 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e07 89442460                       mov        dword ptr [rsp + 0x60], eax
00e0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e10 48894424f8                     mov        qword ptr [rsp - 8], rax
00e15 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e1c 89442464                       mov        dword ptr [rsp + 0x64], eax
00e20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e25 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e2d 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e35 6690                           nop        
00e37 e8a4e9b5ff                     call       0x7fc00b9c3660
00e3c 0f1f8400340f0006               nop        dword ptr [rax + rax + 0x6000f34]
00e44 bee4ffffff                     mov        esi, 0xffffffe4
00e49 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4e 8b442408                       mov        eax, dword ptr [rsp + 8]
00e52 890424                         mov        dword ptr [rsp], eax
00e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e5f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e63 89442404                       mov        dword ptr [rsp + 4], eax
00e67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e6c 48ff742410                     push       qword ptr [rsp + 0x10]
00e71 488f442408                     pop        qword ptr [rsp + 8]
00e76 48ff742418                     push       qword ptr [rsp + 0x18]
00e7b 488f442410                     pop        qword ptr [rsp + 0x10]
00e80 48894424f8                     mov        qword ptr [rsp - 8], rax
00e85 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e89 89442418                       mov        dword ptr [rsp + 0x18], eax
00e8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e92 48894424f8                     mov        qword ptr [rsp - 8], rax
00e97 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e9b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ead 89442420                       mov        dword ptr [rsp + 0x20], eax
00eb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb6 48894424f8                     mov        qword ptr [rsp - 8], rax
00ebb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ebf 89442424                       mov        dword ptr [rsp + 0x24], eax
00ec3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ecd 48ff742438                     push       qword ptr [rsp + 0x38]
00ed2 488f442430                     pop        qword ptr [rsp + 0x30]
00ed7 48894424f8                     mov        qword ptr [rsp - 8], rax
00edc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ee0 89442438                       mov        dword ptr [rsp + 0x38], eax
00ee4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee9 48894424f8                     mov        qword ptr [rsp - 8], rax
00eee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ef2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efb 48ff742448                     push       qword ptr [rsp + 0x48]
00f00 488f442440                     pop        qword ptr [rsp + 0x40]
00f05 48ff742450                     push       qword ptr [rsp + 0x50]
00f0a 488f442448                     pop        qword ptr [rsp + 0x48]
00f0f 48ff742458                     push       qword ptr [rsp + 0x58]
00f14 488f442450                     pop        qword ptr [rsp + 0x50]
00f19 48894424f8                     mov        qword ptr [rsp - 8], rax
00f1e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f25 89442458                       mov        dword ptr [rsp + 0x58], eax
00f29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f2e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f33 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f3a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f43 48894424f8                     mov        qword ptr [rsp - 8], rax
00f48 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f4f 89442460                       mov        dword ptr [rsp + 0x60], eax
00f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f58 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00f60 488f442478                     pop        qword ptr [rsp + 0x78]
00f65 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f71 89442464                       mov        dword ptr [rsp + 0x64], eax
00f75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f86 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f92 48894424f8                     mov        qword ptr [rsp - 8], rax
00f97 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f9e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00faa 48894424f8                     mov        qword ptr [rsp - 8], rax
00faf 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fb6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fca 488f842490000000               pop        qword ptr [rsp + 0x90]
00fd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd7 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fde 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fe5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fea 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00ff2 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00ffa 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01002 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
0100a 90                             nop        
0100b e8d0e7b5ff                     call       0x7fc00b9c3660
01010 0f1f840008110007               nop        dword ptr [rax + rax + 0x7001108]
01018 4533c0                         xor        r8d, r8d
0101b 493bc8                         cmp        rcx, r8
0101e bdffffffff                     mov        ebp, 0xffffffff
01023 7c08                           jl         0x7fc00be64ead
01025 400f95c5                       setne      bpl
01029 400fb6ed                       movzx      ebp, bpl
0102d be45ffffff                     mov        esi, 0xffffff45
01032 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01037 48894424f8                     mov        qword ptr [rsp - 8], rax
0103c 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01043 89442460                       mov        dword ptr [rsp + 0x60], eax
01047 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0104c 48894424f8                     mov        qword ptr [rsp - 8], rax
01051 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01058 89442464                       mov        dword ptr [rsp + 0x64], eax
0105c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01061 48894424f8                     mov        qword ptr [rsp - 8], rax
01066 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0106d 89442468                       mov        dword ptr [rsp + 0x68], eax
01071 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01076 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0107e 488f842480000000               pop        qword ptr [rsp + 0x80]
01086 48894424f8                     mov        qword ptr [rsp - 8], rax
0108b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01092 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01096 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109b 48894424f8                     mov        qword ptr [rsp - 8], rax
010a0 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010a7 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b3 48894424f8                     mov        qword ptr [rsp - 8], rax
010b8 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010bf 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010cb 48894424f8                     mov        qword ptr [rsp - 8], rax
010d0 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010d7 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010eb 488f842498000000               pop        qword ptr [rsp + 0x98]
010f3 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010fb 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01103 48894424f8                     mov        qword ptr [rsp - 8], rax
01108 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0110f 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01116 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111b 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01123 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0112b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01133 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
0113b e8a0e6b5ff                     call       0x7fc00b9c3660
01140 0f1f840038120008               nop        dword ptr [rax + rax + 0x8001238]
01148 be45ffffff                     mov        esi, 0xffffff45
0114d 48894424f8                     mov        qword ptr [rsp - 8], rax
01152 8b442408                       mov        eax, dword ptr [rsp + 8]
01156 890424                         mov        dword ptr [rsp], eax
01159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0115e 48894424f8                     mov        qword ptr [rsp - 8], rax
01163 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01167 89442404                       mov        dword ptr [rsp + 4], eax
0116b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01170 48ff742410                     push       qword ptr [rsp + 0x10]
01175 488f442408                     pop        qword ptr [rsp + 8]
0117a 48ff742418                     push       qword ptr [rsp + 0x18]
0117f 488f442410                     pop        qword ptr [rsp + 0x10]
01184 48894424f8                     mov        qword ptr [rsp - 8], rax
01189 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0118d 89442418                       mov        dword ptr [rsp + 0x18], eax
01191 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01196 48894424f8                     mov        qword ptr [rsp - 8], rax
0119b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0119f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
011a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a8 48894424f8                     mov        qword ptr [rsp - 8], rax
011ad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011b1 89442420                       mov        dword ptr [rsp + 0x20], eax
011b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ba 48894424f8                     mov        qword ptr [rsp - 8], rax
011bf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011c3 89442424                       mov        dword ptr [rsp + 0x24], eax
011c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011cc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011d1 48ff742438                     push       qword ptr [rsp + 0x38]
011d6 488f442430                     pop        qword ptr [rsp + 0x30]
011db 48894424f8                     mov        qword ptr [rsp - 8], rax
011e0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011e4 89442438                       mov        dword ptr [rsp + 0x38], eax
011e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ed 48894424f8                     mov        qword ptr [rsp - 8], rax
011f2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011f6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ff 48ff742448                     push       qword ptr [rsp + 0x48]
01204 488f442440                     pop        qword ptr [rsp + 0x40]
01209 48ff742450                     push       qword ptr [rsp + 0x50]
0120e 488f442448                     pop        qword ptr [rsp + 0x48]
01213 48ff742458                     push       qword ptr [rsp + 0x58]
01218 488f442450                     pop        qword ptr [rsp + 0x50]
0121d 48894424f8                     mov        qword ptr [rsp - 8], rax
01222 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01229 89442458                       mov        dword ptr [rsp + 0x58], eax
0122d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01232 48894424f8                     mov        qword ptr [rsp - 8], rax
01237 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0123e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01242 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01247 48894424f8                     mov        qword ptr [rsp - 8], rax
0124c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01253 89442460                       mov        dword ptr [rsp + 0x60], eax
01257 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01264 488f442468                     pop        qword ptr [rsp + 0x68]
01269 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01271 488f442478                     pop        qword ptr [rsp + 0x78]
01276 48894424f8                     mov        qword ptr [rsp - 8], rax
0127b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01282 89442464                       mov        dword ptr [rsp + 0x64], eax
01286 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128b 48894424f8                     mov        qword ptr [rsp - 8], rax
01290 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01297 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0129e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a3 48894424f8                     mov        qword ptr [rsp - 8], rax
012a8 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012af 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bb 48894424f8                     mov        qword ptr [rsp - 8], rax
012c0 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012c7 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012db 488f842490000000               pop        qword ptr [rsp + 0x90]
012e3 48894424f8                     mov        qword ptr [rsp - 8], rax
012e8 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012ef 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fb 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01303 e8d8e4b5ff                     call       0x7fc00b9c3660
01308 0f1f840000140009               nop        dword ptr [rax + rax + 0x9001400]
01310 be45ffffff                     mov        esi, 0xffffff45
01315 48894424f8                     mov        qword ptr [rsp - 8], rax
0131a 8b442408                       mov        eax, dword ptr [rsp + 8]
0131e 890424                         mov        dword ptr [rsp], eax
01321 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01326 48894424f8                     mov        qword ptr [rsp - 8], rax
0132b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0132f 89442404                       mov        dword ptr [rsp + 4], eax
01333 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01338 48ff742410                     push       qword ptr [rsp + 0x10]
0133d 488f442408                     pop        qword ptr [rsp + 8]
01342 48ff742418                     push       qword ptr [rsp + 0x18]
01347 488f442410                     pop        qword ptr [rsp + 0x10]
0134c 48894424f8                     mov        qword ptr [rsp - 8], rax
01351 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01355 89442418                       mov        dword ptr [rsp + 0x18], eax
01359 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01363 e878e4b5ff                     call       0x7fc00b9c3660
01368 0f1f84006014000a               nop        dword ptr [rax + rax + 0xa001460]
01370 be45ffffff                     mov        esi, 0xffffff45
01375 48894424f8                     mov        qword ptr [rsp - 8], rax
0137a 8b442408                       mov        eax, dword ptr [rsp + 8]
0137e 890424                         mov        dword ptr [rsp], eax
01381 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01386 48894424f8                     mov        qword ptr [rsp - 8], rax
0138b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0138f 89442404                       mov        dword ptr [rsp + 4], eax
01393 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01398 48ff742410                     push       qword ptr [rsp + 0x10]
0139d 488f442408                     pop        qword ptr [rsp + 8]
013a2 48ff742418                     push       qword ptr [rsp + 0x18]
013a7 488f442410                     pop        qword ptr [rsp + 0x10]
013ac 48894424f8                     mov        qword ptr [rsp - 8], rax
013b1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013b5 89442418                       mov        dword ptr [rsp + 0x18], eax
013b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013be 48894424f8                     mov        qword ptr [rsp - 8], rax
013c3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013c7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d0 48894424f8                     mov        qword ptr [rsp - 8], rax
013d5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013d9 89442420                       mov        dword ptr [rsp + 0x20], eax
013dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e2 48894424f8                     mov        qword ptr [rsp - 8], rax
013e7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013eb 89442424                       mov        dword ptr [rsp + 0x24], eax
013ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013f9 48ff742438                     push       qword ptr [rsp + 0x38]
013fe 488f442430                     pop        qword ptr [rsp + 0x30]
01403 48894424f8                     mov        qword ptr [rsp - 8], rax
01408 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0140c 89442438                       mov        dword ptr [rsp + 0x38], eax
01410 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01415 48894424f8                     mov        qword ptr [rsp - 8], rax
0141a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0141e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01422 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01427 48ff742448                     push       qword ptr [rsp + 0x48]
0142c 488f442440                     pop        qword ptr [rsp + 0x40]
01431 48ff742450                     push       qword ptr [rsp + 0x50]
01436 488f442448                     pop        qword ptr [rsp + 0x48]
0143b 48ff742458                     push       qword ptr [rsp + 0x58]
01440 488f442450                     pop        qword ptr [rsp + 0x50]
01445 48894424f8                     mov        qword ptr [rsp - 8], rax
0144a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01451 89442458                       mov        dword ptr [rsp + 0x58], eax
01455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145a 48894424f8                     mov        qword ptr [rsp - 8], rax
0145f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01466 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0146a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146f 48894424f8                     mov        qword ptr [rsp - 8], rax
01474 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0147b 89442460                       mov        dword ptr [rsp + 0x60], eax
0147f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01484 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0148c 488f442468                     pop        qword ptr [rsp + 0x68]
01491 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01499 488f442470                     pop        qword ptr [rsp + 0x70]
0149e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
014a6 488f442478                     pop        qword ptr [rsp + 0x78]
014ab 48894424f8                     mov        qword ptr [rsp - 8], rax
014b0 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014b7 89442464                       mov        dword ptr [rsp + 0x64], eax
014bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014cc 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d8 48894424f8                     mov        qword ptr [rsp - 8], rax
014dd 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014e4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f0 48894424f8                     mov        qword ptr [rsp - 8], rax
014f5 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014fc 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01503 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01508 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01510 488f842490000000               pop        qword ptr [rsp + 0x90]
01518 48894424f8                     mov        qword ptr [rsp - 8], rax
0151d 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01524 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0152b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01530 666690                         nop        
01533 e8a8e2b5ff                     call       0x7fc00b9c3660
01538 0f1f84003016000b               nop        dword ptr [rax + rax + 0xb001630]
01540 be45ffffff                     mov        esi, 0xffffff45
01545 48894424f8                     mov        qword ptr [rsp - 8], rax
0154a 8b442408                       mov        eax, dword ptr [rsp + 8]
0154e 890424                         mov        dword ptr [rsp], eax
01551 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01556 48894424f8                     mov        qword ptr [rsp - 8], rax
0155b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0155f 89442404                       mov        dword ptr [rsp + 4], eax
01563 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01568 48ff742410                     push       qword ptr [rsp + 0x10]
0156d 488f442408                     pop        qword ptr [rsp + 8]
01572 48ff742418                     push       qword ptr [rsp + 0x18]
01577 488f442410                     pop        qword ptr [rsp + 0x10]
0157c 48894424f8                     mov        qword ptr [rsp - 8], rax
01581 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01585 89442418                       mov        dword ptr [rsp + 0x18], eax
01589 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158e 48894424f8                     mov        qword ptr [rsp - 8], rax
01593 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01597 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0159b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a0 48894424f8                     mov        qword ptr [rsp - 8], rax
015a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015a9 89442420                       mov        dword ptr [rsp + 0x20], eax
015ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b2 48894424f8                     mov        qword ptr [rsp - 8], rax
015b7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015bb 89442424                       mov        dword ptr [rsp + 0x24], eax
015bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015c9 48ff742438                     push       qword ptr [rsp + 0x38]
015ce 488f442430                     pop        qword ptr [rsp + 0x30]
015d3 48894424f8                     mov        qword ptr [rsp - 8], rax
015d8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015dc 89442438                       mov        dword ptr [rsp + 0x38], eax
015e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e5 48894424f8                     mov        qword ptr [rsp - 8], rax
015ea 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015ee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f7 48ff742448                     push       qword ptr [rsp + 0x48]
015fc 488f442440                     pop        qword ptr [rsp + 0x40]
01601 48ff742450                     push       qword ptr [rsp + 0x50]
01606 488f442448                     pop        qword ptr [rsp + 0x48]
0160b 48ff742458                     push       qword ptr [rsp + 0x58]
01610 488f442450                     pop        qword ptr [rsp + 0x50]
01615 48894424f8                     mov        qword ptr [rsp - 8], rax
0161a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01621 89442458                       mov        dword ptr [rsp + 0x58], eax
01625 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162a 48894424f8                     mov        qword ptr [rsp - 8], rax
0162f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01636 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0163a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163f 48894424f8                     mov        qword ptr [rsp - 8], rax
01644 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0164b 89442460                       mov        dword ptr [rsp + 0x60], eax
0164f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01654 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0165c 488f442468                     pop        qword ptr [rsp + 0x68]
01661 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01669 488f442470                     pop        qword ptr [rsp + 0x70]
0166e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01676 488f442478                     pop        qword ptr [rsp + 0x78]
0167b 48894424f8                     mov        qword ptr [rsp - 8], rax
01680 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01687 89442464                       mov        dword ptr [rsp + 0x64], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 48894424f8                     mov        qword ptr [rsp - 8], rax
01695 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0169c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
016a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a8 48894424f8                     mov        qword ptr [rsp - 8], rax
016ad 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016b4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c0 48894424f8                     mov        qword ptr [rsp - 8], rax
016c5 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016cc 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d8 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016e0 488f842490000000               pop        qword ptr [rsp + 0x90]
016e8 48894424f8                     mov        qword ptr [rsp - 8], rax
016ed 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016f4 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 48894424f8                     mov        qword ptr [rsp - 8], rax
01705 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0170c 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01713 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01718 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01720 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01728 666690                         nop        
0172b e8b0e0b5ff                     call       0x7fc00b9c3660
01730 0f1f84002818000c               nop        dword ptr [rax + rax + 0xc001828]
01738 be45ffffff                     mov        esi, 0xffffff45
0173d 48894424f8                     mov        qword ptr [rsp - 8], rax
01742 8b442408                       mov        eax, dword ptr [rsp + 8]
01746 890424                         mov        dword ptr [rsp], eax
01749 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174e 48894424f8                     mov        qword ptr [rsp - 8], rax
01753 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01757 89442404                       mov        dword ptr [rsp + 4], eax
0175b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01760 48ff742410                     push       qword ptr [rsp + 0x10]
01765 488f442408                     pop        qword ptr [rsp + 8]
0176a 48ff742418                     push       qword ptr [rsp + 0x18]
0176f 488f442410                     pop        qword ptr [rsp + 0x10]
01774 48894424f8                     mov        qword ptr [rsp - 8], rax
01779 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0177d 89442418                       mov        dword ptr [rsp + 0x18], eax
01781 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01786 48894424f8                     mov        qword ptr [rsp - 8], rax
0178b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0178f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01793 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01798 48894424f8                     mov        qword ptr [rsp - 8], rax
0179d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017a1 89442420                       mov        dword ptr [rsp + 0x20], eax
017a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017aa 48894424f8                     mov        qword ptr [rsp - 8], rax
017af 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
017b3 89442424                       mov        dword ptr [rsp + 0x24], eax
017b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017c1 48ff742438                     push       qword ptr [rsp + 0x38]
017c6 488f442430                     pop        qword ptr [rsp + 0x30]
017cb 48894424f8                     mov        qword ptr [rsp - 8], rax
017d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017d4 89442438                       mov        dword ptr [rsp + 0x38], eax
017d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017dd 48894424f8                     mov        qword ptr [rsp - 8], rax
017e2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017e6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ef 48ff742448                     push       qword ptr [rsp + 0x48]
017f4 488f442440                     pop        qword ptr [rsp + 0x40]
017f9 48ff742450                     push       qword ptr [rsp + 0x50]
017fe 488f442448                     pop        qword ptr [rsp + 0x48]
01803 48ff742458                     push       qword ptr [rsp + 0x58]
01808 488f442450                     pop        qword ptr [rsp + 0x50]
0180d 48894424f8                     mov        qword ptr [rsp - 8], rax
01812 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01819 89442458                       mov        dword ptr [rsp + 0x58], eax
0181d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01822 48894424f8                     mov        qword ptr [rsp - 8], rax
01827 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0182e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01832 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01837 48894424f8                     mov        qword ptr [rsp - 8], rax
0183c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01843 89442460                       mov        dword ptr [rsp + 0x60], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01854 488f442468                     pop        qword ptr [rsp + 0x68]
01859 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01861 488f442470                     pop        qword ptr [rsp + 0x70]
01866 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0186e 488f442478                     pop        qword ptr [rsp + 0x78]
01873 48894424f8                     mov        qword ptr [rsp - 8], rax
01878 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0187f 89442464                       mov        dword ptr [rsp + 0x64], eax
01883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01888 48894424f8                     mov        qword ptr [rsp - 8], rax
0188d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01894 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0189b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a0 48894424f8                     mov        qword ptr [rsp - 8], rax
018a5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
018ac 89842484000000                 mov        dword ptr [rsp + 0x84], eax
018b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b8 48894424f8                     mov        qword ptr [rsp - 8], rax
018bd 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018c4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018d8 488f842490000000               pop        qword ptr [rsp + 0x90]
018e0 48894424f8                     mov        qword ptr [rsp - 8], rax
018e5 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018ec 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f8 48894424f8                     mov        qword ptr [rsp - 8], rax
018fd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01904 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0190b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01910 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01918 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01920 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
01928 666690                         nop        
0192b e8b0deb5ff                     call       0x7fc00b9c3660
01930 0f1f8400281a000d               nop        dword ptr [rax + rax + 0xd001a28]
01938 be45ffffff                     mov        esi, 0xffffff45
0193d 48894424f8                     mov        qword ptr [rsp - 8], rax
01942 8b442408                       mov        eax, dword ptr [rsp + 8]
01946 890424                         mov        dword ptr [rsp], eax
01949 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194e 48894424f8                     mov        qword ptr [rsp - 8], rax
01953 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01957 89442404                       mov        dword ptr [rsp + 4], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48ff742410                     push       qword ptr [rsp + 0x10]
01965 488f442408                     pop        qword ptr [rsp + 8]
0196a 48ff742418                     push       qword ptr [rsp + 0x18]
0196f 488f442410                     pop        qword ptr [rsp + 0x10]
01974 48894424f8                     mov        qword ptr [rsp - 8], rax
01979 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0197d 89442418                       mov        dword ptr [rsp + 0x18], eax
01981 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01986 48894424f8                     mov        qword ptr [rsp - 8], rax
0198b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0198f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01998 48894424f8                     mov        qword ptr [rsp - 8], rax
0199d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019a1 89442420                       mov        dword ptr [rsp + 0x20], eax
019a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019aa 48894424f8                     mov        qword ptr [rsp - 8], rax
019af 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
019b3 89442424                       mov        dword ptr [rsp + 0x24], eax
019b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019bc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019c1 48ff742438                     push       qword ptr [rsp + 0x38]
019c6 488f442430                     pop        qword ptr [rsp + 0x30]
019cb 48894424f8                     mov        qword ptr [rsp - 8], rax
019d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019d4 89442438                       mov        dword ptr [rsp + 0x38], eax
019d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dd 48894424f8                     mov        qword ptr [rsp - 8], rax
019e2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019e6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ef 48ff742448                     push       qword ptr [rsp + 0x48]
019f4 488f442440                     pop        qword ptr [rsp + 0x40]
019f9 48ff742450                     push       qword ptr [rsp + 0x50]
019fe 488f442448                     pop        qword ptr [rsp + 0x48]
01a03 48ff742458                     push       qword ptr [rsp + 0x58]
01a08 488f442450                     pop        qword ptr [rsp + 0x50]
01a0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a12 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a19 89442458                       mov        dword ptr [rsp + 0x58], eax
01a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a2e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a37 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a43 89442460                       mov        dword ptr [rsp + 0x60], eax
01a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a54 488f442468                     pop        qword ptr [rsp + 0x68]
01a59 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a61 488f442478                     pop        qword ptr [rsp + 0x78]
01a66 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a72 89442464                       mov        dword ptr [rsp + 0x64], eax
01a76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a80 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a87 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48894424f8                     mov        qword ptr [rsp - 8], rax
01a98 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a9f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01aa6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aab 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab0 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ab7 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01abe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01acb 488f842490000000               pop        qword ptr [rsp + 0x90]
01ad3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad8 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01adf 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ae6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aeb 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01af3 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01afb 89bc24bc000000                 mov        dword ptr [rsp + 0xbc], edi
01b02 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b0a 90                             nop        
01b0b e8d0dcb5ff                     call       0x7fc00b9c3660
01b10 0f1f8400081c000e               nop        dword ptr [rax + rax + 0xe001c08]
01b18 41b8ffffff7f                   mov        r8d, 0x7fffffff
01b1e 493bc8                         cmp        rcx, r8
01b21 bdffffffff                     mov        ebp, 0xffffffff
01b26 7c08                           jl         0x7fc00be659b0
01b28 400f95c5                       setne      bpl
01b2c 400fb6ed                       movzx      ebp, bpl
01b30 be45ffffff                     mov        esi, 0xffffff45
01b35 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b46 89442460                       mov        dword ptr [rsp + 0x60], eax
01b4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b54 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b5b 89442464                       mov        dword ptr [rsp + 0x64], eax
01b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b64 48894424f8                     mov        qword ptr [rsp - 8], rax
01b69 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b70 89442468                       mov        dword ptr [rsp + 0x68], eax
01b74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b79 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b81 488f842480000000               pop        qword ptr [rsp + 0x80]
01b89 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b95 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01baa 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01bb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01bc2 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bce 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bda 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01be1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bee 488f842498000000               pop        qword ptr [rsp + 0x98]
01bf6 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bfe 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01c06 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01c12 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c26 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01c2e 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01c36 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01c3e 90                             nop        
01c3f e89cdbb5ff                     call       0x7fc00b9c3660
01c44 0f1f84003c1d000f               nop        dword ptr [rax + rax + 0xf001d3c]
01c4c be45ffffff                     mov        esi, 0xffffff45
01c51 48894424f8                     mov        qword ptr [rsp - 8], rax
01c56 8b442408                       mov        eax, dword ptr [rsp + 8]
01c5a 890424                         mov        dword ptr [rsp], eax
01c5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c62 48894424f8                     mov        qword ptr [rsp - 8], rax
01c67 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c6b 89442404                       mov        dword ptr [rsp + 4], eax
01c6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c74 48ff742410                     push       qword ptr [rsp + 0x10]
01c79 488f442408                     pop        qword ptr [rsp + 8]
01c7e 48ff742418                     push       qword ptr [rsp + 0x18]
01c83 488f442410                     pop        qword ptr [rsp + 0x10]
01c88 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c91 89442418                       mov        dword ptr [rsp + 0x18], eax
01c95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01ca3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01ca7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cac 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cb5 89442420                       mov        dword ptr [rsp + 0x20], eax
01cb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01cc7 89442424                       mov        dword ptr [rsp + 0x24], eax
01ccb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01cd5 48ff742438                     push       qword ptr [rsp + 0x38]
01cda 488f442430                     pop        qword ptr [rsp + 0x30]
01cdf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ce8 89442438                       mov        dword ptr [rsp + 0x38], eax
01cec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cfa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cfe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d03 48ff742448                     push       qword ptr [rsp + 0x48]
01d08 488f442440                     pop        qword ptr [rsp + 0x40]
01d0d 48ff742450                     push       qword ptr [rsp + 0x50]
01d12 488f442448                     pop        qword ptr [rsp + 0x48]
01d17 48ff742458                     push       qword ptr [rsp + 0x58]
01d1c 488f442450                     pop        qword ptr [rsp + 0x50]
01d21 48894424f8                     mov        qword ptr [rsp - 8], rax
01d26 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d2d 89442458                       mov        dword ptr [rsp + 0x58], eax
01d31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d36 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d42 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d50 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d57 89442460                       mov        dword ptr [rsp + 0x60], eax
01d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d60 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01d65 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d71 89442464                       mov        dword ptr [rsp + 0x64], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d86 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d92 48894424f8                     mov        qword ptr [rsp - 8], rax
01d97 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d9e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daa 48894424f8                     mov        qword ptr [rsp - 8], rax
01daf 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01db6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01dbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01dca 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01dd2 90                             nop        
01dd3 e808dab5ff                     call       0x7fc00b9c3660
01dd8 0f1f8400d01e0010               nop        dword ptr [rax + rax + 0x10001ed0]
01de0 be45ffffff                     mov        esi, 0xffffff45
01de5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dea 8b442408                       mov        eax, dword ptr [rsp + 8]
01dee 890424                         mov        dword ptr [rsp], eax
01df1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01dff 89442404                       mov        dword ptr [rsp + 4], eax
01e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e08 48ff742410                     push       qword ptr [rsp + 0x10]
01e0d 488f442408                     pop        qword ptr [rsp + 8]
01e12 48ff742418                     push       qword ptr [rsp + 0x18]
01e17 488f442410                     pop        qword ptr [rsp + 0x10]
01e1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e21 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e25 89442418                       mov        dword ptr [rsp + 0x18], eax
01e29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e33 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e37 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e40 48894424f8                     mov        qword ptr [rsp - 8], rax
01e45 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e49 89442420                       mov        dword ptr [rsp + 0x20], eax
01e4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e52 48894424f8                     mov        qword ptr [rsp - 8], rax
01e57 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e5b 89442424                       mov        dword ptr [rsp + 0x24], eax
01e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e64 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e69 48ff742438                     push       qword ptr [rsp + 0x38]
01e6e 488f442430                     pop        qword ptr [rsp + 0x30]
01e73 48894424f8                     mov        qword ptr [rsp - 8], rax
01e78 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e7c 89442438                       mov        dword ptr [rsp + 0x38], eax
01e80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e85 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e8e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e97 48ff742448                     push       qword ptr [rsp + 0x48]
01e9c 488f442440                     pop        qword ptr [rsp + 0x40]
01ea1 48ff742450                     push       qword ptr [rsp + 0x50]
01ea6 488f442448                     pop        qword ptr [rsp + 0x48]
01eab 48ff742458                     push       qword ptr [rsp + 0x58]
01eb0 488f442450                     pop        qword ptr [rsp + 0x50]
01eb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ec1 89442458                       mov        dword ptr [rsp + 0x58], eax
01ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eca 48894424f8                     mov        qword ptr [rsp - 8], rax
01ecf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ed6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01eda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01eeb 89442460                       mov        dword ptr [rsp + 0x60], eax
01eef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef4 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01ef9 48894424f8                     mov        qword ptr [rsp - 8], rax
01efe 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01f05 89442464                       mov        dword ptr [rsp + 0x64], eax
01f09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f13 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f1a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f26 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f32 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f43 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f4a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f56 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f5e 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01f66 90                             nop        
01f67 e874d8b5ff                     call       0x7fc00b9c3660
01f6c 0f1f840064200011               nop        dword ptr [rax + rax + 0x11002064]
01f74 be3dffffff                     mov        esi, 0xffffff3d
01f79 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7e 8b442408                       mov        eax, dword ptr [rsp + 8]
01f82 890424                         mov        dword ptr [rsp], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f93 89442404                       mov        dword ptr [rsp + 4], eax
01f97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9c 48ff742410                     push       qword ptr [rsp + 0x10]
01fa1 488f442408                     pop        qword ptr [rsp + 8]
01fa6 48ff742418                     push       qword ptr [rsp + 0x18]
01fab 488f442410                     pop        qword ptr [rsp + 0x10]
01fb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01fb9 89442418                       mov        dword ptr [rsp + 0x18], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fcb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fdd 89442420                       mov        dword ptr [rsp + 0x20], eax
01fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe6 48894424f8                     mov        qword ptr [rsp - 8], rax
01feb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fef 89442424                       mov        dword ptr [rsp + 0x24], eax
01ff3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ffd 48ff742438                     push       qword ptr [rsp + 0x38]
02002 488f442430                     pop        qword ptr [rsp + 0x30]
02007 48894424f8                     mov        qword ptr [rsp - 8], rax
0200c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02010 89442438                       mov        dword ptr [rsp + 0x38], eax
02014 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02019 48894424f8                     mov        qword ptr [rsp - 8], rax
0201e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02022 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02026 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202b 48ff742448                     push       qword ptr [rsp + 0x48]
02030 488f442440                     pop        qword ptr [rsp + 0x40]
02035 48ff742450                     push       qword ptr [rsp + 0x50]
0203a 488f442448                     pop        qword ptr [rsp + 0x48]
0203f 48ff742458                     push       qword ptr [rsp + 0x58]
02044 488f442450                     pop        qword ptr [rsp + 0x50]
02049 48894424f8                     mov        qword ptr [rsp - 8], rax
0204e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02055 89442458                       mov        dword ptr [rsp + 0x58], eax
02059 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205e 48894424f8                     mov        qword ptr [rsp - 8], rax
02063 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0206a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0206e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02073 48894424f8                     mov        qword ptr [rsp - 8], rax
02078 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0207f 89442460                       mov        dword ptr [rsp + 0x60], eax
02083 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02088 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0208d 48894424f8                     mov        qword ptr [rsp - 8], rax
02092 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02099 89442464                       mov        dword ptr [rsp + 0x64], eax
0209d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a2 48894424f8                     mov        qword ptr [rsp - 8], rax
020a7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
020ae 89842480000000                 mov        dword ptr [rsp + 0x80], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020c6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d2 48894424f8                     mov        qword ptr [rsp - 8], rax
020d7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020de 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ea 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020f2 488f842490000000               pop        qword ptr [rsp + 0x90]
020fa 48894424f8                     mov        qword ptr [rsp - 8], rax
020ff 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02106 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
0210d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02112 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0211a 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02122 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0212a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02132 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0213a 48894424f8                     mov        qword ptr [rsp - 8], rax
0213f 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02146 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
0214d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02152 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0215a 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
02162 898c24d8000000                 mov        dword ptr [rsp + 0xd8], ecx
02169 6690                           nop        
0216b e870d6b5ff                     call       0x7fc00b9c3660
02170 0f1f840068220012               nop        dword ptr [rax + rax + 0x12002268]
02178 be45ffffff                     mov        esi, 0xffffff45
0217d 48894424f8                     mov        qword ptr [rsp - 8], rax
02182 8b442408                       mov        eax, dword ptr [rsp + 8]
02186 890424                         mov        dword ptr [rsp], eax
02189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218e 48894424f8                     mov        qword ptr [rsp - 8], rax
02193 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02197 89442404                       mov        dword ptr [rsp + 4], eax
0219b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a0 48ff742410                     push       qword ptr [rsp + 0x10]
021a5 488f442408                     pop        qword ptr [rsp + 8]
021aa 48ff742418                     push       qword ptr [rsp + 0x18]
021af 488f442410                     pop        qword ptr [rsp + 0x10]
021b4 48894424f8                     mov        qword ptr [rsp - 8], rax
021b9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
021bd 89442418                       mov        dword ptr [rsp + 0x18], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d8 48894424f8                     mov        qword ptr [rsp - 8], rax
021dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021e1 89442420                       mov        dword ptr [rsp + 0x20], eax
021e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ea 48894424f8                     mov        qword ptr [rsp - 8], rax
021ef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021f3 89442424                       mov        dword ptr [rsp + 0x24], eax
021f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02201 48ff742438                     push       qword ptr [rsp + 0x38]
02206 488f442430                     pop        qword ptr [rsp + 0x30]
0220b 48894424f8                     mov        qword ptr [rsp - 8], rax
02210 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02214 89442438                       mov        dword ptr [rsp + 0x38], eax
02218 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221d 48894424f8                     mov        qword ptr [rsp - 8], rax
02222 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02226 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0222a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222f 48ff742448                     push       qword ptr [rsp + 0x48]
02234 488f442440                     pop        qword ptr [rsp + 0x40]
02239 48ff742450                     push       qword ptr [rsp + 0x50]
0223e 488f442448                     pop        qword ptr [rsp + 0x48]
02243 48ff742458                     push       qword ptr [rsp + 0x58]
02248 488f442450                     pop        qword ptr [rsp + 0x50]
0224d 89542458                       mov        dword ptr [rsp + 0x58], edx
02251 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02259 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02261 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02269 6690                           nop        
0226b e870d5b5ff                     call       0x7fc00b9c3660
02270 0f1f840068230013               nop        dword ptr [rax + rax + 0x13002368]
02278 be45ffffff                     mov        esi, 0xffffff45
0227d 48894424f8                     mov        qword ptr [rsp - 8], rax
02282 8b442408                       mov        eax, dword ptr [rsp + 8]
02286 890424                         mov        dword ptr [rsp], eax
02289 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228e 48894424f8                     mov        qword ptr [rsp - 8], rax
02293 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02297 89442404                       mov        dword ptr [rsp + 4], eax
0229b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a0 48ff742410                     push       qword ptr [rsp + 0x10]
022a5 488f442408                     pop        qword ptr [rsp + 8]
022aa 48ff742418                     push       qword ptr [rsp + 0x18]
022af 488f442410                     pop        qword ptr [rsp + 0x10]
022b4 48894424f8                     mov        qword ptr [rsp - 8], rax
022b9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022bd 89442418                       mov        dword ptr [rsp + 0x18], eax
022c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c6 48894424f8                     mov        qword ptr [rsp - 8], rax
022cb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d8 48894424f8                     mov        qword ptr [rsp - 8], rax
022dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022e1 89442420                       mov        dword ptr [rsp + 0x20], eax
022e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ea 48894424f8                     mov        qword ptr [rsp - 8], rax
022ef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022f3 89442424                       mov        dword ptr [rsp + 0x24], eax
022f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02301 48ff742438                     push       qword ptr [rsp + 0x38]
02306 488f442430                     pop        qword ptr [rsp + 0x30]
0230b 48894424f8                     mov        qword ptr [rsp - 8], rax
02310 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02314 89442438                       mov        dword ptr [rsp + 0x38], eax
02318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02326 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 48ff742448                     push       qword ptr [rsp + 0x48]
02334 488f442440                     pop        qword ptr [rsp + 0x40]
02339 48ff742450                     push       qword ptr [rsp + 0x50]
0233e 488f442448                     pop        qword ptr [rsp + 0x48]
02343 48ff742458                     push       qword ptr [rsp + 0x58]
02348 488f442450                     pop        qword ptr [rsp + 0x50]
0234d 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02354 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0235c 666690                         nop        
0235f e87cd4b5ff                     call       0x7fc00b9c3660
02364 0f1f84005c240014               nop        dword ptr [rax + rax + 0x1400245c]
0236c be45ffffff                     mov        esi, 0xffffff45
02371 48894424f8                     mov        qword ptr [rsp - 8], rax
02376 8b442408                       mov        eax, dword ptr [rsp + 8]
0237a 890424                         mov        dword ptr [rsp], eax
0237d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02382 48894424f8                     mov        qword ptr [rsp - 8], rax
02387 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0238b 89442404                       mov        dword ptr [rsp + 4], eax
0238f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02394 48ff742410                     push       qword ptr [rsp + 0x10]
02399 488f442408                     pop        qword ptr [rsp + 8]
0239e 48ff742418                     push       qword ptr [rsp + 0x18]
023a3 488f442410                     pop        qword ptr [rsp + 0x10]
023a8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ad 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023b1 89442418                       mov        dword ptr [rsp + 0x18], eax
023b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ba 48894424f8                     mov        qword ptr [rsp - 8], rax
023bf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023c3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023cc 48894424f8                     mov        qword ptr [rsp - 8], rax
023d1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023d5 89442420                       mov        dword ptr [rsp + 0x20], eax
023d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023de 48894424f8                     mov        qword ptr [rsp - 8], rax
023e3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023e7 89442424                       mov        dword ptr [rsp + 0x24], eax
023eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f0 48ff742438                     push       qword ptr [rsp + 0x38]
023f5 488f442430                     pop        qword ptr [rsp + 0x30]
023fa 48894424f8                     mov        qword ptr [rsp - 8], rax
023ff 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02403 89442438                       mov        dword ptr [rsp + 0x38], eax
02407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240c 48894424f8                     mov        qword ptr [rsp - 8], rax
02411 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02415 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02419 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241e 48ff742448                     push       qword ptr [rsp + 0x48]
02423 488f442440                     pop        qword ptr [rsp + 0x40]
02428 48ff742450                     push       qword ptr [rsp + 0x50]
0242d 488f442448                     pop        qword ptr [rsp + 0x48]
02432 48ff742458                     push       qword ptr [rsp + 0x58]
02437 488f442450                     pop        qword ptr [rsp + 0x50]
0243c 48894424f8                     mov        qword ptr [rsp - 8], rax
02441 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02448 89442458                       mov        dword ptr [rsp + 0x58], eax
0244c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02451 48894424f8                     mov        qword ptr [rsp - 8], rax
02456 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0245d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02461 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02466 48894424f8                     mov        qword ptr [rsp - 8], rax
0246b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02472 89442460                       mov        dword ptr [rsp + 0x60], eax
02476 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02483 488f442468                     pop        qword ptr [rsp + 0x68]
02488 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02490 488f442470                     pop        qword ptr [rsp + 0x70]
02495 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0249d 488f442478                     pop        qword ptr [rsp + 0x78]
024a2 48894424f8                     mov        qword ptr [rsp - 8], rax
024a7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
024ae 89442464                       mov        dword ptr [rsp + 0x64], eax
024b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b7 48894424f8                     mov        qword ptr [rsp - 8], rax
024bc 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024c3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024cf 48894424f8                     mov        qword ptr [rsp - 8], rax
024d4 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024db 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e7 48894424f8                     mov        qword ptr [rsp - 8], rax
024ec 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024f3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ff 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02507 488f842490000000               pop        qword ptr [rsp + 0x90]
0250f 48894424f8                     mov        qword ptr [rsp - 8], rax
02514 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0251b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02522 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02527 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0252f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02537 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0253f 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
02547 e894d2b5ff                     call       0x7fc00b9c3660
0254c 0f1f840044260015               nop        dword ptr [rax + rax + 0x15002644]
02554 4533d2                         xor        r10d, r10d
02557 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
0255f e96adcffff                     jmp        0x7fc00be6404e
02564 4533d2                         xor        r10d, r10d
02567 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0256c e989dcffff                     jmp        0x7fc00be6407a
02571 4533d2                         xor        r10d, r10d
02574 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02579 e9a3dcffff                     jmp        0x7fc00be640a1
0257e 4533d2                         xor        r10d, r10d
02581 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02586 e9c2dcffff                     jmp        0x7fc00be640cd
0258b 4533d2                         xor        r10d, r10d
0258e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02593 e9dfdcffff                     jmp        0x7fc00be640f7
02598 4533d2                         xor        r10d, r10d
0259b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
025a0 e904ddffff                     jmp        0x7fc00be64129
025a5 4533d2                         xor        r10d, r10d
025a8 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
025b0 e921ddffff                     jmp        0x7fc00be64156
025b5 4533d2                         xor        r10d, r10d
025b8 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
025c0 e937ddffff                     jmp        0x7fc00be6417c
025c5 bebeffffff                     mov        esi, 0xffffffbe
025ca 48894424f8                     mov        qword ptr [rsp - 8], rax
025cf 8b442408                       mov        eax, dword ptr [rsp + 8]
025d3 890424                         mov        dword ptr [rsp], eax
025d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025db 48894424f8                     mov        qword ptr [rsp - 8], rax
025e0 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
025e4 89442404                       mov        dword ptr [rsp + 4], eax
025e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ed 48ff742410                     push       qword ptr [rsp + 0x10]
025f2 488f442408                     pop        qword ptr [rsp + 8]
025f7 48ff742418                     push       qword ptr [rsp + 0x18]
025fc 488f442410                     pop        qword ptr [rsp + 0x10]
02601 48894424f8                     mov        qword ptr [rsp - 8], rax
02606 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0260a 89442418                       mov        dword ptr [rsp + 0x18], eax
0260e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02613 48894424f8                     mov        qword ptr [rsp - 8], rax
02618 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0261c 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02620 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02625 48894424f8                     mov        qword ptr [rsp - 8], rax
0262a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0262e 89442420                       mov        dword ptr [rsp + 0x20], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 48894424f8                     mov        qword ptr [rsp - 8], rax
0263c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02640 89442424                       mov        dword ptr [rsp + 0x24], eax
02644 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02649 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0264e 48ff742438                     push       qword ptr [rsp + 0x38]
02653 488f442430                     pop        qword ptr [rsp + 0x30]
02658 48894424f8                     mov        qword ptr [rsp - 8], rax
0265d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02661 89442438                       mov        dword ptr [rsp + 0x38], eax
02665 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266a 48894424f8                     mov        qword ptr [rsp - 8], rax
0266f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02673 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267c 48ff742448                     push       qword ptr [rsp + 0x48]
02681 488f442440                     pop        qword ptr [rsp + 0x40]
02686 48ff742450                     push       qword ptr [rsp + 0x50]
0268b 488f442448                     pop        qword ptr [rsp + 0x48]
02690 48ff742458                     push       qword ptr [rsp + 0x58]
02695 488f442450                     pop        qword ptr [rsp + 0x50]
0269a 90                             nop        
0269b e840d1b5ff                     call       0x7fc00b9c3660
026a0 0f1f840098270016               nop        dword ptr [rax + rax + 0x16002798]
026a8 be85ffffff                     mov        esi, 0xffffff85
026ad 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
026b1 48894424f8                     mov        qword ptr [rsp - 8], rax
026b6 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026ba 890424                         mov        dword ptr [rsp], eax
026bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c2 48894424f8                     mov        qword ptr [rsp - 8], rax
026c7 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026cb 89442404                       mov        dword ptr [rsp + 4], eax
026cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d4 48894424f8                     mov        qword ptr [rsp - 8], rax
026d9 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026dd 89442408                       mov        dword ptr [rsp + 8], eax
026e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e6 48894424f8                     mov        qword ptr [rsp - 8], rax
026eb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026ef 8944240c                       mov        dword ptr [rsp + 0xc], eax
026f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f8 48894424f8                     mov        qword ptr [rsp - 8], rax
026fd 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02701 89442410                       mov        dword ptr [rsp + 0x10], eax
02705 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270a 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
0270f 48ff742438                     push       qword ptr [rsp + 0x38]
02714 488f442420                     pop        qword ptr [rsp + 0x20]
02719 48894424f8                     mov        qword ptr [rsp - 8], rax
0271e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02722 89442414                       mov        dword ptr [rsp + 0x14], eax
02726 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0272b 48894424f8                     mov        qword ptr [rsp - 8], rax
02730 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02734 89442428                       mov        dword ptr [rsp + 0x28], eax
02738 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273d 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02742 90                             nop        
02743 e898d0b5ff                     call       0x7fc00b9c3660
02748 0f1f840040280017               nop        dword ptr [rax + rax + 0x17002840]
02750 bef6ffffff                     mov        esi, 0xfffffff6
02755 6690                           nop        
02757 e884d0b5ff                     call       0x7fc00b9c3660
0275c 0f1f840054280018               nop        dword ptr [rax + rax + 0x18002854]
02764 be5d000000                     mov        esi, 0x5d
02769 6690                           nop        
0276b e870d0b5ff                     call       0x7fc00b9c3660
02770 0f1f840068280019               nop        dword ptr [rax + rax + 0x19002868]
02778 bef6ffffff                     mov        esi, 0xfffffff6
0277d 418beb                         mov        ebp, r11d
02780 666690                         nop        
02783 e858d0b5ff                     call       0x7fc00b9c3660
02788 0f1f84008028001a               nop        dword ptr [rax + rax + 0x1a002880]
02790 bef6ffffff                     mov        esi, 0xfffffff6
02795 8be9                           mov        ebp, ecx
02797 e844d0b5ff                     call       0x7fc00b9c3660
0279c 0f1f84009428001b               nop        dword ptr [rax + rax + 0x1b002894]
027a4 bef6ffffff                     mov        esi, 0xfffffff6
027a9 418beb                         mov        ebp, r11d
027ac 666690                         nop        
027af e82cd0b5ff                     call       0x7fc00b9c3660
027b4 0f1f8400ac28001c               nop        dword ptr [rax + rax + 0x1c0028ac]
027bc eb00                           jmp        0x7fc00be6663e
027be 488bf0                         mov        rsi, rax
027c1 e9eae2ffff                     jmp        0x7fc00be64930
027c6 49baff48e60bc07f0000           movabs     r10, 0x7fc00be648ff
027d0 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
027d7 e98478a9ff                     jmp        0x7fc00b8fdee0
027dc e83f44a8ff                     call       0x7fc00b8eaaa0
027e1 e948d8ffff                     jmp        0x7fc00be63eae
027e6 f4                             hlt        
027e7 f4                             hlt        
