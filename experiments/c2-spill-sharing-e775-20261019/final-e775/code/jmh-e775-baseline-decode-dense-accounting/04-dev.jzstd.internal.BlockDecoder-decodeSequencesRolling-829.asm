00000 e87bd6ca15                     call       0x7f77bdb28580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85a6270000                   jne        0x7f77a7e7d6d4
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
0018f 49bac0ecc0bd777f0000           movabs     r10, 0x7f77bdc0ecc0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f849a230000                   je         0x7f77a7e7d44c
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbe4050000                 cmp        r11d, 0x5e4
001c0 0f85da240000                   jne        0x7f77a7e7d5a0
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8480230000                   je         0x7f77a7e7d45c
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa2d420000                 cmp        r10d, 0x422d
001ea 0f85b0240000                   jne        0x7f77a7e7d5a0
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8461230000                   je         0x7f77a7e7d469
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb39420000                 cmp        r11d, 0x4239
00216 0f8584240000                   jne        0x7f77a7e7d5a0
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f8447230000                   je         0x7f77a7e7d476
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa3c420000                 cmp        r10d, 0x423c
0023d 0f855d240000                   jne        0x7f77a7e7d5a0
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8425230000                   je         0x7f77a7e7d483
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb3c420000                 cmp        r11d, 0x423c
0026c 0f852e240000                   jne        0x7f77a7e7d5a0
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8408230000                   je         0x7f77a7e7d490
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa3c420000                 cmp        r10d, 0x423c
00296 0f8504240000                   jne        0x7f77a7e7d5a0
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84e3220000                   je         0x7f77a7e7d49d
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbe7050000                 cmp        r11d, 0x5e7
002c8 0f85d2230000                   jne        0x7f77a7e7d5a0
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f84ce220000                   je         0x7f77a7e7d4ad
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fae6050000                 cmp        r10d, 0x5e6
002ee 0f85ac230000                   jne        0x7f77a7e7d5a0
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f84b3220000                   je         0x7f77a7e7d4bd
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f84a5220000                   je         0x7f77a7e7d4bd
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f8497220000                   je         0x7f77a7e7d4bd
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d50f9                       lea        r10d, [r8 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8c6f220000                   jl         0x7f77a7e7d4bd
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e961020000                     jmp        0x7f77a7e7b4c0
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
0039a 0f8dc80f0000                   jge        0x7f77a7e7c268
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d65110000                   jge        0x7f77a7e7c438
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d34130000                   jge        0x7f77a7e7c630
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bf9                           mov        edi, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8d0d150000                   jge        0x7f77a7e7c830
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
00477 0f8e930b0000                   jle        0x7f77a7e7bf10
0047d 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
00484 0f8f86160000                   jg         0x7f77a7e7ca10
0048a 4181fbffff0100                 cmp        r11d, 0x1ffff
00491 0f8fad170000                   jg         0x7f77a7e7cb44
00497 4181f9ffff0300                 cmp        r9d, 0x3ffff
0049e 0f8f34190000                   jg         0x7f77a7e7ccd8
004a4 8bc9                           mov        ecx, ecx
004a6 81f900000010                   cmp        ecx, 0x10000000
004ac 0f83ba1a0000                   jae        0x7f77a7e7ce6c
004b2 48c1e712                       shl        rdi, 0x12
004b6 4c63c1                         movsxd     r8, ecx
004b9 4d63db                         movsxd     r11, r11d
004bc 49c1e024                       shl        r8, 0x24
004c0 4c0bc7                         or         r8, rdi
004c3 4d0bc3                         or         r8, r11
004c6 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004ce 443b0c24                       cmp        r9d, dword ptr [rsp]
004d2 0f8364090000                   jae        0x7f77a7e7bd3c
004d8 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e0 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
004e8 4f8944d908                     mov        qword ptr [r9 + r11*8 + 8], r8
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8db7000000                   jge        0x7f77a7e7b4b2
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
0050f 49c1e930                       shr        r9, 0x30
00513 458bc3                         mov        r8d, r11d
00516 418bf9                         mov        edi, r9d
00519 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00521 c44233f7da                     shrx       r11d, r10d, r9d
00526 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
0052d 038c24bc000000                 add        ecx, dword ptr [rsp + 0xbc]
00534 c44273f7ca                     shrx       r9d, r10d, ecx
00539 4103f9                         add        edi, r9d
0053c 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
00543 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054a 83f920                         cmp        ecx, 0x20
0054d 0f8d1d1c0000                   jge        0x7f77a7e7d070
00553 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0055b 49c1e930                       shr        r9, 0x30
0055f 418bc9                         mov        ecx, r9d
00562 ba01000000                     mov        edx, 1
00567 8bbc24bc000000                 mov        edi, dword ptr [rsp + 0xbc]
0056e c46241f7ca                     shlx       r9d, edx, edi
00573 41ffc9                         dec        r9d
00576 4523cb                         and        r9d, r11d
00579 4503c8                         add        r9d, r8d
0057c 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00584 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
0058c 4183fb20                       cmp        r11d, 0x20
00590 0f8dda1c0000                   jge        0x7f77a7e7d170
00596 41b901000000                   mov        r9d, 1
0059c c44221f7d9                     shlx       r11d, r9d, r11d
005a1 41ffcb                         dec        r11d
005a4 4523da                         and        r11d, r10d
005a7 4403d9                         add        r11d, ecx
005aa 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
005b2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b6 418502                         test       dword ptr [r10], eax
005b9 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c0 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005c8 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005cd 0f8d6f040000                   jge        0x7f77a7e7b942
005d3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d8 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005dc 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e4 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005ec 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f0 453bd9                         cmp        r11d, r9d
005f3 0f83eb040000                   jae        0x7f77a7e7b9e4
005f9 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
005fe 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00602 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00609 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00610 458b4104                       mov        r8d, dword ptr [r9 + 4]
00614 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00619 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00621 413bc8                         cmp        ecx, r8d
00624 0f83ae050000                   jae        0x7f77a7e7bad8
0062a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0062f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00633 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063b 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00643 458b4204                       mov        r8d, dword ptr [r10 + 4]
00647 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
0064c 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00654 453bd8                         cmp        r11d, r8d
00657 0f8397060000                   jae        0x7f77a7e7bbf4
0065d 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00662 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066a 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00671 ffc5                           inc        ebp
00673 896c2404                       mov        dword ptr [rsp + 4], ebp
00677 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067b 0f8d34040000                   jge        0x7f77a7e7b9b5
00681 49c1ea28                       shr        r10, 0x28
00685 458bda                         mov        r11d, r10d
00688 450fb6db                       movzx      r11d, r11b
0068c 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00694 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0069c 49c1ea28                       shr        r10, 0x28
006a0 458bd2                         mov        r10d, r10d
006a3 450fb6c2                       movzx      r8d, r10b
006a7 4503c3                         add        r8d, r11d
006aa 4d8bd1                         mov        r10, r9
006ad 49c1ea28                       shr        r10, 0x28
006b1 458bda                         mov        r11d, r10d
006b4 450fb6d3                       movzx      r10d, r11b
006b8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
006c0 4503c2                         add        r8d, r10d
006c3 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
006cb 41bb01000000                   mov        r11d, 1
006d1 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
006d9 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006e1 49c1ea20                       shr        r10, 0x20
006e5 458bd2                         mov        r10d, r10d
006e8 410fb6ea                       movzx      ebp, r10b
006ec 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006f3 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006fb 49c1ea20                       shr        r10, 0x20
006ff 458bda                         mov        r11d, r10d
00702 410fb6eb                       movzx      ebp, r11b
00706 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
0070d 4d8bd1                         mov        r10, r9
00710 49c1ea20                       shr        r10, 0x20
00714 458bd2                         mov        r10d, r10d
00717 410fb6ea                       movzx      ebp, r10b
0071b 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00722 448bd5                         mov        r10d, ebp
00725 44039424f8000000               add        r10d, dword ptr [rsp + 0xf8]
0072d 44039424fc000000               add        r10d, dword ptr [rsp + 0xfc]
00735 44039424f4000000               add        r10d, dword ptr [rsp + 0xf4]
0073d 4585d2                         test       r10d, r10d
00740 0f84fa090000                   je         0x7f77a7e7c040
00746 4183fa3f                       cmp        r10d, 0x3f
0074a 0f8fb80b0000                   jg         0x7f77a7e7c208
00750 41b840000000                   mov        r8d, 0x40
00756 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
0075b 453bd0                         cmp        r10d, r8d
0075e 7e43                           jle        0x7f77a7e7b6a3
00760 458bda                         mov        r11d, r10d
00763 452bd8                         sub        r11d, r8d
00766 4183f840                       cmp        r8d, 0x40
0076a 0f8df41b0000                   jge        0x7f77a7e7d264
00770 41b901000000                   mov        r9d, 1
00776 c442b9f7c1                     shlx       r8, r9, r8
0077b 49ffc8                         dec        r8
0077e 4c23c3                         and        r8, rbx
00781 c442a1f7c8                     shlx       r9, r8, r11
00786 41b840000000                   mov        r8d, 0x40
0078c 452bc3                         sub        r8d, r11d
0078f c462bbf75c2438                 shrx       r11, qword ptr [rsp + 0x38], r8
00796 4d0bcb                         or         r9, r11
00799 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
007a1 eb21                           jmp        0x7f77a7e7b6c4
007a3 41bb01000000                   mov        r11d, 1
007a9 c442a9f7db                     shlx       r11, r11, r10
007ae 452bc2                         sub        r8d, r10d
007b1 c462bbf7c3                     shrx       r8, rbx, r8
007b6 49ffcb                         dec        r11
007b9 4d23c3                         and        r8, r11
007bc 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007c4 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
007c9 4503c2                         add        r8d, r10d
007cc 4489442440                     mov        dword ptr [rsp + 0x40], r8d
007d1 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
007d6 4503da                         add        r11d, r10d
007d9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
007de 4183f840                       cmp        r8d, 0x40
007e2 0f8ca8fbffff                   jl         0x7f77a7e7b290
007e8 458d50c0                       lea        r10d, [r8 - 0x40]
007ec 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007f1 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007f5 83c5f8                         add        ebp, -8
007f8 896c2430                       mov        dword ptr [rsp + 0x30], ebp
007fc 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00800 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00804 83c1f0                         add        ecx, -0x10
00807 83f908                         cmp        ecx, 8
0080a 0f8ce4010000                   jl         0x7f77a7e7b8f4
00810 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00815 4183c2e8                       add        r10d, -0x18
00819 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00821 0f8238fbffff                   jb         0x7f77a7e7b25f
00827 bee4ffffff                     mov        esi, 0xffffffe4
0082c 48894424f8                     mov        qword ptr [rsp - 8], rax
00831 8b442408                       mov        eax, dword ptr [rsp + 8]
00835 890424                         mov        dword ptr [rsp], eax
00838 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0083d 48894424f8                     mov        qword ptr [rsp - 8], rax
00842 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00846 89442404                       mov        dword ptr [rsp + 4], eax
0084a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0084f 48ff742410                     push       qword ptr [rsp + 0x10]
00854 488f442408                     pop        qword ptr [rsp + 8]
00859 48ff742418                     push       qword ptr [rsp + 0x18]
0085e 488f442410                     pop        qword ptr [rsp + 0x10]
00863 48894424f8                     mov        qword ptr [rsp - 8], rax
00868 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0086c 89442418                       mov        dword ptr [rsp + 0x18], eax
00870 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00875 48894424f8                     mov        qword ptr [rsp - 8], rax
0087a 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0087e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00882 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00887 48894424f8                     mov        qword ptr [rsp - 8], rax
0088c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00890 89442420                       mov        dword ptr [rsp + 0x20], eax
00894 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00899 48894424f8                     mov        qword ptr [rsp - 8], rax
0089e 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008a2 89442424                       mov        dword ptr [rsp + 0x24], eax
008a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ab 48ff742438                     push       qword ptr [rsp + 0x38]
008b0 488f442428                     pop        qword ptr [rsp + 0x28]
008b5 48894424f8                     mov        qword ptr [rsp - 8], rax
008ba 8b442440                       mov        eax, dword ptr [rsp + 0x40]
008be 89442430                       mov        dword ptr [rsp + 0x30], eax
008c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c7 48894424f8                     mov        qword ptr [rsp - 8], rax
008cc 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008d0 89442434                       mov        dword ptr [rsp + 0x34], eax
008d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008d9 48ff742448                     push       qword ptr [rsp + 0x48]
008de 488f442438                     pop        qword ptr [rsp + 0x38]
008e3 48ff742450                     push       qword ptr [rsp + 0x50]
008e8 488f442440                     pop        qword ptr [rsp + 0x40]
008ed 48ff742458                     push       qword ptr [rsp + 0x58]
008f2 488f442448                     pop        qword ptr [rsp + 0x48]
008f7 48894424f8                     mov        qword ptr [rsp - 8], rax
008fc 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00903 89442450                       mov        dword ptr [rsp + 0x50], eax
00907 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0090c 48894424f8                     mov        qword ptr [rsp - 8], rax
00911 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00918 89442454                       mov        dword ptr [rsp + 0x54], eax
0091c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00921 48894424f8                     mov        qword ptr [rsp - 8], rax
00926 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0092d 89442458                       mov        dword ptr [rsp + 0x58], eax
00931 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00936 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0093e 488f442460                     pop        qword ptr [rsp + 0x60]
00943 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0094b 488f442468                     pop        qword ptr [rsp + 0x68]
00950 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00958 488f442470                     pop        qword ptr [rsp + 0x70]
0095d 48894424f8                     mov        qword ptr [rsp - 8], rax
00962 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00969 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0096d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00972 48894424f8                     mov        qword ptr [rsp - 8], rax
00977 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0097e 89442478                       mov        dword ptr [rsp + 0x78], eax
00982 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00987 48894424f8                     mov        qword ptr [rsp - 8], rax
0098c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00993 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099c 48894424f8                     mov        qword ptr [rsp - 8], rax
009a1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009a8 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009bc 488f842488000000               pop        qword ptr [rsp + 0x88]
009c4 48894424f8                     mov        qword ptr [rsp - 8], rax
009c9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d0 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009dc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009e4 666690                         nop        
009e7 e87485b4ff                     call       0x7f77a79c3e60
009ec 0f1f8400e40a0001               nop        dword ptr [rax + rax + 0x1000ae4]
009f4 85c9                           test       ecx, ecx
009f6 7f08                           jg         0x7f77a7e7b900
009f8 4533d2                         xor        r10d, r10d
009fb e96cf9ffff                     jmp        0x7f77a7e7b26c
00a00 8be9                           mov        ebp, ecx
00a02 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a0a 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a0e 90                             nop        
00a0f e84cefa7ff                     call       0x7f77a78fa860
00a14 0f1f84000c0b0002               nop        dword ptr [rax + rax + 0x2000b0c]
00a1c 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a21 41c1e003                       shl        r8d, 3
00a25 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a2a 41c1e303                       shl        r11d, 3
00a2e 452bd8                         sub        r11d, r8d
00a31 4181c3c0000000                 add        r11d, 0xc0
00a38 c462a1f7d0                     shlx       r10, rax, r11
00a3d e92af9ffff                     jmp        0x7f77a7e7b26c
00a42 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a4a 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a52 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a57 4d3bd3                         cmp        r10, r11
00a5a 7f26                           jg         0x7f77a7e7b982
00a5c 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a61 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a66 0f85f01c0000                   jne        0x7f77a7e7d65c
00a6c 418bc2                         mov        eax, r10d
00a6f 4881c430010000                 add        rsp, 0x130
00a76 5d                             pop        rbp
00a77 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a7b 0f873d1d0000                   ja         0x7f77a7e7d6be
00a81 c3                             ret        
00a82 48bef00dbce200000000           movabs     rsi, 0xe2bc0df0
00a8c 666690                         nop        
00a8f e8cceea7ff                     call       0x7f77a78fa860
00a94 0f1f84008c0b0003               nop        dword ptr [rax + rax + 0x3000b8c]
00a9c 4885c0                         test       rax, rax
00a9f 0f84a31c0000                   je         0x7f77a7e7d648
00aa5 488bf0                         mov        rsi, rax
00aa8 4881c430010000                 add        rsp, 0x130
00aaf 5d                             pop        rbp
00ab0 e92ba6b4ff                     jmp        0x7f77a79c5fe0
00ab5 4533d2                         xor        r10d, r10d
00ab8 4533c0                         xor        r8d, r8d
00abb 4533db                         xor        r11d, r11d
00abe 33c9                           xor        ecx, ecx
00ac0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ac8 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00ad0 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00ad8 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00adf e9f5fbffff                     jmp        0x7f77a7e7b5d9
00ae4 bee4ffffff                     mov        esi, 0xffffffe4
00ae9 48894424f8                     mov        qword ptr [rsp - 8], rax
00aee 8b442408                       mov        eax, dword ptr [rsp + 8]
00af2 890424                         mov        dword ptr [rsp], eax
00af5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00afa 48894424f8                     mov        qword ptr [rsp - 8], rax
00aff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b03 89442404                       mov        dword ptr [rsp + 4], eax
00b07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b0c 48ff742410                     push       qword ptr [rsp + 0x10]
00b11 488f442408                     pop        qword ptr [rsp + 8]
00b16 48ff742418                     push       qword ptr [rsp + 0x18]
00b1b 488f442410                     pop        qword ptr [rsp + 0x10]
00b20 48894424f8                     mov        qword ptr [rsp - 8], rax
00b25 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b29 89442418                       mov        dword ptr [rsp + 0x18], eax
00b2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b32 48894424f8                     mov        qword ptr [rsp - 8], rax
00b37 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b3b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b44 48894424f8                     mov        qword ptr [rsp - 8], rax
00b49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b4d 89442420                       mov        dword ptr [rsp + 0x20], eax
00b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b56 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b5f 89442424                       mov        dword ptr [rsp + 0x24], eax
00b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b68 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b6d 48ff742438                     push       qword ptr [rsp + 0x38]
00b72 488f442430                     pop        qword ptr [rsp + 0x30]
00b77 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b80 89442438                       mov        dword ptr [rsp + 0x38], eax
00b84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b89 48894424f8                     mov        qword ptr [rsp - 8], rax
00b8e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b92 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9b 48ff742448                     push       qword ptr [rsp + 0x48]
00ba0 488f442440                     pop        qword ptr [rsp + 0x40]
00ba5 48ff742450                     push       qword ptr [rsp + 0x50]
00baa 488f442448                     pop        qword ptr [rsp + 0x48]
00baf 48ff742458                     push       qword ptr [rsp + 0x58]
00bb4 488f442450                     pop        qword ptr [rsp + 0x50]
00bb9 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bc1 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bc9 6690                           nop        
00bcb e89083b4ff                     call       0x7f77a79c3e60
00bd0 0f1f8400c80c0004               nop        dword ptr [rax + rax + 0x4000cc8]
00bd8 bee4ffffff                     mov        esi, 0xffffffe4
00bdd 48894424f8                     mov        qword ptr [rsp - 8], rax
00be2 8b442408                       mov        eax, dword ptr [rsp + 8]
00be6 890424                         mov        dword ptr [rsp], eax
00be9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bee 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00bf7 89442404                       mov        dword ptr [rsp + 4], eax
00bfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c00 48ff742410                     push       qword ptr [rsp + 0x10]
00c05 488f442408                     pop        qword ptr [rsp + 8]
00c0a 48ff742418                     push       qword ptr [rsp + 0x18]
00c0f 488f442410                     pop        qword ptr [rsp + 0x10]
00c14 48894424f8                     mov        qword ptr [rsp - 8], rax
00c19 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c1d 89442418                       mov        dword ptr [rsp + 0x18], eax
00c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c26 48894424f8                     mov        qword ptr [rsp - 8], rax
00c2b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c2f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c38 48894424f8                     mov        qword ptr [rsp - 8], rax
00c3d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c41 89442420                       mov        dword ptr [rsp + 0x20], eax
00c45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c53 89442424                       mov        dword ptr [rsp + 0x24], eax
00c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c61 48ff742438                     push       qword ptr [rsp + 0x38]
00c66 488f442430                     pop        qword ptr [rsp + 0x30]
00c6b 48894424f8                     mov        qword ptr [rsp - 8], rax
00c70 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c74 89442438                       mov        dword ptr [rsp + 0x38], eax
00c78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00c82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c86 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c8f 48ff742448                     push       qword ptr [rsp + 0x48]
00c94 488f442440                     pop        qword ptr [rsp + 0x40]
00c99 48ff742450                     push       qword ptr [rsp + 0x50]
00c9e 488f442448                     pop        qword ptr [rsp + 0x48]
00ca3 48ff742458                     push       qword ptr [rsp + 0x58]
00ca8 488f442450                     pop        qword ptr [rsp + 0x50]
00cad 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cb9 89442458                       mov        dword ptr [rsp + 0x58], eax
00cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00cc7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cce 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cd7 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00cdf 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00ce6 90                             nop        
00ce7 e87482b4ff                     call       0x7f77a79c3e60
00cec 0f1f8400e40d0005               nop        dword ptr [rax + rax + 0x5000de4]
00cf4 bee4ffffff                     mov        esi, 0xffffffe4
00cf9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfe 8b442408                       mov        eax, dword ptr [rsp + 8]
00d02 890424                         mov        dword ptr [rsp], eax
00d05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d13 89442404                       mov        dword ptr [rsp + 4], eax
00d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d1c 48ff742410                     push       qword ptr [rsp + 0x10]
00d21 488f442408                     pop        qword ptr [rsp + 8]
00d26 48ff742418                     push       qword ptr [rsp + 0x18]
00d2b 488f442410                     pop        qword ptr [rsp + 0x10]
00d30 48894424f8                     mov        qword ptr [rsp - 8], rax
00d35 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d39 89442418                       mov        dword ptr [rsp + 0x18], eax
00d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d42 48894424f8                     mov        qword ptr [rsp - 8], rax
00d47 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d4b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d54 48894424f8                     mov        qword ptr [rsp - 8], rax
00d59 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d5d 89442420                       mov        dword ptr [rsp + 0x20], eax
00d61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d66 48894424f8                     mov        qword ptr [rsp - 8], rax
00d6b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d6f 89442424                       mov        dword ptr [rsp + 0x24], eax
00d73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d78 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d7d 48ff742438                     push       qword ptr [rsp + 0x38]
00d82 488f442430                     pop        qword ptr [rsp + 0x30]
00d87 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d90 89442438                       mov        dword ptr [rsp + 0x38], eax
00d94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d99 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00da2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00da6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dab 48ff742448                     push       qword ptr [rsp + 0x48]
00db0 488f442440                     pop        qword ptr [rsp + 0x40]
00db5 48ff742450                     push       qword ptr [rsp + 0x50]
00dba 488f442448                     pop        qword ptr [rsp + 0x48]
00dbf 48ff742458                     push       qword ptr [rsp + 0x58]
00dc4 488f442450                     pop        qword ptr [rsp + 0x50]
00dc9 48894424f8                     mov        qword ptr [rsp - 8], rax
00dce 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00dd5 89442458                       mov        dword ptr [rsp + 0x58], eax
00dd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dde 48894424f8                     mov        qword ptr [rsp - 8], rax
00de3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00dea 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00dee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df3 48894424f8                     mov        qword ptr [rsp - 8], rax
00df8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00dff 89442460                       mov        dword ptr [rsp + 0x60], eax
00e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e08 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e14 89442464                       mov        dword ptr [rsp + 0x64], eax
00e18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e25 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e2d 6690                           nop        
00e2f e82c81b4ff                     call       0x7f77a79c3e60
00e34 0f1f84002c0f0006               nop        dword ptr [rax + rax + 0x6000f2c]
00e3c bee4ffffff                     mov        esi, 0xffffffe4
00e41 48894424f8                     mov        qword ptr [rsp - 8], rax
00e46 8b442408                       mov        eax, dword ptr [rsp + 8]
00e4a 890424                         mov        dword ptr [rsp], eax
00e4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e52 48894424f8                     mov        qword ptr [rsp - 8], rax
00e57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e5b 89442404                       mov        dword ptr [rsp + 4], eax
00e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e64 48ff742410                     push       qword ptr [rsp + 0x10]
00e69 488f442408                     pop        qword ptr [rsp + 8]
00e6e 48ff742418                     push       qword ptr [rsp + 0x18]
00e73 488f442410                     pop        qword ptr [rsp + 0x10]
00e78 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e81 89442418                       mov        dword ptr [rsp + 0x18], eax
00e85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ea5 89442420                       mov        dword ptr [rsp + 0x20], eax
00ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eae 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00eb7 89442424                       mov        dword ptr [rsp + 0x24], eax
00ebb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ec5 48ff742438                     push       qword ptr [rsp + 0x38]
00eca 488f442430                     pop        qword ptr [rsp + 0x30]
00ecf 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ed8 89442438                       mov        dword ptr [rsp + 0x38], eax
00edc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00eea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00eee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef3 48ff742448                     push       qword ptr [rsp + 0x48]
00ef8 488f442440                     pop        qword ptr [rsp + 0x40]
00efd 48ff742450                     push       qword ptr [rsp + 0x50]
00f02 488f442448                     pop        qword ptr [rsp + 0x48]
00f07 48ff742458                     push       qword ptr [rsp + 0x58]
00f0c 488f442450                     pop        qword ptr [rsp + 0x50]
00f11 48894424f8                     mov        qword ptr [rsp - 8], rax
00f16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f1d 89442458                       mov        dword ptr [rsp + 0x58], eax
00f21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f26 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f47 89442460                       mov        dword ptr [rsp + 0x60], eax
00f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f50 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00f58 488f442478                     pop        qword ptr [rsp + 0x78]
00f5d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f62 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f69 89442464                       mov        dword ptr [rsp + 0x64], eax
00f6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f72 48894424f8                     mov        qword ptr [rsp - 8], rax
00f77 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f7e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f96 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fba 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fc2 488f842490000000               pop        qword ptr [rsp + 0x90]
00fca 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcf 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fd6 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fea 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00ff2 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00ffa 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
01002 90                             nop        
01003 e8587fb4ff                     call       0x7f77a79c3e60
01008 0f1f840000110007               nop        dword ptr [rax + rax + 0x7001100]
01010 4533c0                         xor        r8d, r8d
01013 493bc8                         cmp        rcx, r8
01016 bdffffffff                     mov        ebp, 0xffffffff
0101b 7c08                           jl         0x7f77a7e7bf25
0101d 400f95c5                       setne      bpl
01021 400fb6ed                       movzx      ebp, bpl
01025 be45ffffff                     mov        esi, 0xffffff45
0102a 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0102f 48894424f8                     mov        qword ptr [rsp - 8], rax
01034 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0103b 89442460                       mov        dword ptr [rsp + 0x60], eax
0103f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01044 48894424f8                     mov        qword ptr [rsp - 8], rax
01049 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01050 89442464                       mov        dword ptr [rsp + 0x64], eax
01054 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01059 48894424f8                     mov        qword ptr [rsp - 8], rax
0105e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01065 89442468                       mov        dword ptr [rsp + 0x68], eax
01069 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0106e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01076 488f842480000000               pop        qword ptr [rsp + 0x80]
0107e 48894424f8                     mov        qword ptr [rsp - 8], rax
01083 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0108a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0108e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01093 48894424f8                     mov        qword ptr [rsp - 8], rax
01098 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0109f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ab 48894424f8                     mov        qword ptr [rsp - 8], rax
010b0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010b7 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c3 48894424f8                     mov        qword ptr [rsp - 8], rax
010c8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010cf 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010db 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010e3 488f842498000000               pop        qword ptr [rsp + 0x98]
010eb 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010f3 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01100 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01107 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0110e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01113 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0111b 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01123 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0112b 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01133 e8287eb4ff                     call       0x7f77a79c3e60
01138 0f1f840030120008               nop        dword ptr [rax + rax + 0x8001230]
01140 be45ffffff                     mov        esi, 0xffffff45
01145 48894424f8                     mov        qword ptr [rsp - 8], rax
0114a 8b442408                       mov        eax, dword ptr [rsp + 8]
0114e 890424                         mov        dword ptr [rsp], eax
01151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01156 48894424f8                     mov        qword ptr [rsp - 8], rax
0115b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0115f 89442404                       mov        dword ptr [rsp + 4], eax
01163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01168 48ff742410                     push       qword ptr [rsp + 0x10]
0116d 488f442408                     pop        qword ptr [rsp + 8]
01172 48ff742418                     push       qword ptr [rsp + 0x18]
01177 488f442410                     pop        qword ptr [rsp + 0x10]
0117c 48894424f8                     mov        qword ptr [rsp - 8], rax
01181 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01185 89442418                       mov        dword ptr [rsp + 0x18], eax
01189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118e 48894424f8                     mov        qword ptr [rsp - 8], rax
01193 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01197 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0119b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a0 48894424f8                     mov        qword ptr [rsp - 8], rax
011a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011a9 89442420                       mov        dword ptr [rsp + 0x20], eax
011ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b2 48894424f8                     mov        qword ptr [rsp - 8], rax
011b7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011bb 89442424                       mov        dword ptr [rsp + 0x24], eax
011bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011c9 48ff742438                     push       qword ptr [rsp + 0x38]
011ce 488f442430                     pop        qword ptr [rsp + 0x30]
011d3 48894424f8                     mov        qword ptr [rsp - 8], rax
011d8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011dc 89442438                       mov        dword ptr [rsp + 0x38], eax
011e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e5 48894424f8                     mov        qword ptr [rsp - 8], rax
011ea 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011ee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f7 48ff742448                     push       qword ptr [rsp + 0x48]
011fc 488f442440                     pop        qword ptr [rsp + 0x40]
01201 48ff742450                     push       qword ptr [rsp + 0x50]
01206 488f442448                     pop        qword ptr [rsp + 0x48]
0120b 48ff742458                     push       qword ptr [rsp + 0x58]
01210 488f442450                     pop        qword ptr [rsp + 0x50]
01215 48894424f8                     mov        qword ptr [rsp - 8], rax
0121a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01221 89442458                       mov        dword ptr [rsp + 0x58], eax
01225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122a 48894424f8                     mov        qword ptr [rsp - 8], rax
0122f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01236 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0123a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123f 48894424f8                     mov        qword ptr [rsp - 8], rax
01244 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0124b 89442460                       mov        dword ptr [rsp + 0x60], eax
0124f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01254 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0125c 488f442468                     pop        qword ptr [rsp + 0x68]
01261 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01269 488f442478                     pop        qword ptr [rsp + 0x78]
0126e 48894424f8                     mov        qword ptr [rsp - 8], rax
01273 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0127a 89442464                       mov        dword ptr [rsp + 0x64], eax
0127e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01283 48894424f8                     mov        qword ptr [rsp - 8], rax
01288 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0128f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01296 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129b 48894424f8                     mov        qword ptr [rsp - 8], rax
012a0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012a7 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b3 48894424f8                     mov        qword ptr [rsp - 8], rax
012b8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012bf 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012d3 488f842490000000               pop        qword ptr [rsp + 0x90]
012db 48894424f8                     mov        qword ptr [rsp - 8], rax
012e0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012e7 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f3 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
012fb e8607cb4ff                     call       0x7f77a79c3e60
01300 0f1f8400f8130009               nop        dword ptr [rax + rax + 0x90013f8]
01308 be45ffffff                     mov        esi, 0xffffff45
0130d 48894424f8                     mov        qword ptr [rsp - 8], rax
01312 8b442408                       mov        eax, dword ptr [rsp + 8]
01316 890424                         mov        dword ptr [rsp], eax
01319 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131e 48894424f8                     mov        qword ptr [rsp - 8], rax
01323 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01327 89442404                       mov        dword ptr [rsp + 4], eax
0132b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01330 48ff742410                     push       qword ptr [rsp + 0x10]
01335 488f442408                     pop        qword ptr [rsp + 8]
0133a 48ff742418                     push       qword ptr [rsp + 0x18]
0133f 488f442410                     pop        qword ptr [rsp + 0x10]
01344 48894424f8                     mov        qword ptr [rsp - 8], rax
01349 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0134d 89442418                       mov        dword ptr [rsp + 0x18], eax
01351 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01356 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0135b e8007cb4ff                     call       0x7f77a79c3e60
01360 0f1f84005814000a               nop        dword ptr [rax + rax + 0xa001458]
01368 be45ffffff                     mov        esi, 0xffffff45
0136d 48894424f8                     mov        qword ptr [rsp - 8], rax
01372 8b442408                       mov        eax, dword ptr [rsp + 8]
01376 890424                         mov        dword ptr [rsp], eax
01379 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137e 48894424f8                     mov        qword ptr [rsp - 8], rax
01383 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01387 89442404                       mov        dword ptr [rsp + 4], eax
0138b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01390 48ff742410                     push       qword ptr [rsp + 0x10]
01395 488f442408                     pop        qword ptr [rsp + 8]
0139a 48ff742418                     push       qword ptr [rsp + 0x18]
0139f 488f442410                     pop        qword ptr [rsp + 0x10]
013a4 48894424f8                     mov        qword ptr [rsp - 8], rax
013a9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013ad 89442418                       mov        dword ptr [rsp + 0x18], eax
013b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b6 48894424f8                     mov        qword ptr [rsp - 8], rax
013bb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013bf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c8 48894424f8                     mov        qword ptr [rsp - 8], rax
013cd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013d1 89442420                       mov        dword ptr [rsp + 0x20], eax
013d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013da 48894424f8                     mov        qword ptr [rsp - 8], rax
013df 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013e3 89442424                       mov        dword ptr [rsp + 0x24], eax
013e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ec 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013f1 48ff742438                     push       qword ptr [rsp + 0x38]
013f6 488f442430                     pop        qword ptr [rsp + 0x30]
013fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01400 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01404 89442438                       mov        dword ptr [rsp + 0x38], eax
01408 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140d 48894424f8                     mov        qword ptr [rsp - 8], rax
01412 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01416 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0141a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141f 48ff742448                     push       qword ptr [rsp + 0x48]
01424 488f442440                     pop        qword ptr [rsp + 0x40]
01429 48ff742450                     push       qword ptr [rsp + 0x50]
0142e 488f442448                     pop        qword ptr [rsp + 0x48]
01433 48ff742458                     push       qword ptr [rsp + 0x58]
01438 488f442450                     pop        qword ptr [rsp + 0x50]
0143d 48894424f8                     mov        qword ptr [rsp - 8], rax
01442 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01449 89442458                       mov        dword ptr [rsp + 0x58], eax
0144d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01452 48894424f8                     mov        qword ptr [rsp - 8], rax
01457 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0145e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01462 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01467 48894424f8                     mov        qword ptr [rsp - 8], rax
0146c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01473 89442460                       mov        dword ptr [rsp + 0x60], eax
01477 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01484 488f442468                     pop        qword ptr [rsp + 0x68]
01489 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01491 488f442470                     pop        qword ptr [rsp + 0x70]
01496 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0149e 488f442478                     pop        qword ptr [rsp + 0x78]
014a3 48894424f8                     mov        qword ptr [rsp - 8], rax
014a8 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014af 89442464                       mov        dword ptr [rsp + 0x64], eax
014b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b8 48894424f8                     mov        qword ptr [rsp - 8], rax
014bd 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014c4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d0 48894424f8                     mov        qword ptr [rsp - 8], rax
014d5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014dc 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ed 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014f4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01500 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01508 488f842490000000               pop        qword ptr [rsp + 0x90]
01510 48894424f8                     mov        qword ptr [rsp - 8], rax
01515 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0151c 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01528 666690                         nop        
0152b e8307ab4ff                     call       0x7f77a79c3e60
01530 0f1f84002816000b               nop        dword ptr [rax + rax + 0xb001628]
01538 be45ffffff                     mov        esi, 0xffffff45
0153d 48894424f8                     mov        qword ptr [rsp - 8], rax
01542 8b442408                       mov        eax, dword ptr [rsp + 8]
01546 890424                         mov        dword ptr [rsp], eax
01549 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154e 48894424f8                     mov        qword ptr [rsp - 8], rax
01553 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01557 89442404                       mov        dword ptr [rsp + 4], eax
0155b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01560 48ff742410                     push       qword ptr [rsp + 0x10]
01565 488f442408                     pop        qword ptr [rsp + 8]
0156a 48ff742418                     push       qword ptr [rsp + 0x18]
0156f 488f442410                     pop        qword ptr [rsp + 0x10]
01574 48894424f8                     mov        qword ptr [rsp - 8], rax
01579 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0157d 89442418                       mov        dword ptr [rsp + 0x18], eax
01581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0158f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 48894424f8                     mov        qword ptr [rsp - 8], rax
0159d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015a1 89442420                       mov        dword ptr [rsp + 0x20], eax
015a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015aa 48894424f8                     mov        qword ptr [rsp - 8], rax
015af 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015b3 89442424                       mov        dword ptr [rsp + 0x24], eax
015b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015c1 48ff742438                     push       qword ptr [rsp + 0x38]
015c6 488f442430                     pop        qword ptr [rsp + 0x30]
015cb 48894424f8                     mov        qword ptr [rsp - 8], rax
015d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015d4 89442438                       mov        dword ptr [rsp + 0x38], eax
015d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015dd 48894424f8                     mov        qword ptr [rsp - 8], rax
015e2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015e6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ef 48ff742448                     push       qword ptr [rsp + 0x48]
015f4 488f442440                     pop        qword ptr [rsp + 0x40]
015f9 48ff742450                     push       qword ptr [rsp + 0x50]
015fe 488f442448                     pop        qword ptr [rsp + 0x48]
01603 48ff742458                     push       qword ptr [rsp + 0x58]
01608 488f442450                     pop        qword ptr [rsp + 0x50]
0160d 48894424f8                     mov        qword ptr [rsp - 8], rax
01612 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01619 89442458                       mov        dword ptr [rsp + 0x58], eax
0161d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0162e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01637 48894424f8                     mov        qword ptr [rsp - 8], rax
0163c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01643 89442460                       mov        dword ptr [rsp + 0x60], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01654 488f442468                     pop        qword ptr [rsp + 0x68]
01659 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01661 488f442470                     pop        qword ptr [rsp + 0x70]
01666 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0166e 488f442478                     pop        qword ptr [rsp + 0x78]
01673 48894424f8                     mov        qword ptr [rsp - 8], rax
01678 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0167f 89442464                       mov        dword ptr [rsp + 0x64], eax
01683 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01688 48894424f8                     mov        qword ptr [rsp - 8], rax
0168d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01694 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0169b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a0 48894424f8                     mov        qword ptr [rsp - 8], rax
016a5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016ac 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b8 48894424f8                     mov        qword ptr [rsp - 8], rax
016bd 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016c4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016d8 488f842490000000               pop        qword ptr [rsp + 0x90]
016e0 48894424f8                     mov        qword ptr [rsp - 8], rax
016e5 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016ec 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f8 48894424f8                     mov        qword ptr [rsp - 8], rax
016fd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01704 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0170b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01710 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01718 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01720 666690                         nop        
01723 e83878b4ff                     call       0x7f77a79c3e60
01728 0f1f84002018000c               nop        dword ptr [rax + rax + 0xc001820]
01730 be45ffffff                     mov        esi, 0xffffff45
01735 48894424f8                     mov        qword ptr [rsp - 8], rax
0173a 8b442408                       mov        eax, dword ptr [rsp + 8]
0173e 890424                         mov        dword ptr [rsp], eax
01741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01746 48894424f8                     mov        qword ptr [rsp - 8], rax
0174b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0174f 89442404                       mov        dword ptr [rsp + 4], eax
01753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01758 48ff742410                     push       qword ptr [rsp + 0x10]
0175d 488f442408                     pop        qword ptr [rsp + 8]
01762 48ff742418                     push       qword ptr [rsp + 0x18]
01767 488f442410                     pop        qword ptr [rsp + 0x10]
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01775 89442418                       mov        dword ptr [rsp + 0x18], eax
01779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177e 48894424f8                     mov        qword ptr [rsp - 8], rax
01783 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01787 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0178b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01790 48894424f8                     mov        qword ptr [rsp - 8], rax
01795 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01799 89442420                       mov        dword ptr [rsp + 0x20], eax
0179d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a2 48894424f8                     mov        qword ptr [rsp - 8], rax
017a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
017ab 89442424                       mov        dword ptr [rsp + 0x24], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017b9 48ff742438                     push       qword ptr [rsp + 0x38]
017be 488f442430                     pop        qword ptr [rsp + 0x30]
017c3 48894424f8                     mov        qword ptr [rsp - 8], rax
017c8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017cc 89442438                       mov        dword ptr [rsp + 0x38], eax
017d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d5 48894424f8                     mov        qword ptr [rsp - 8], rax
017da 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e7 48ff742448                     push       qword ptr [rsp + 0x48]
017ec 488f442440                     pop        qword ptr [rsp + 0x40]
017f1 48ff742450                     push       qword ptr [rsp + 0x50]
017f6 488f442448                     pop        qword ptr [rsp + 0x48]
017fb 48ff742458                     push       qword ptr [rsp + 0x58]
01800 488f442450                     pop        qword ptr [rsp + 0x50]
01805 48894424f8                     mov        qword ptr [rsp - 8], rax
0180a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01811 89442458                       mov        dword ptr [rsp + 0x58], eax
01815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181a 48894424f8                     mov        qword ptr [rsp - 8], rax
0181f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01826 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0182a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182f 48894424f8                     mov        qword ptr [rsp - 8], rax
01834 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0183b 89442460                       mov        dword ptr [rsp + 0x60], eax
0183f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01844 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0184c 488f442468                     pop        qword ptr [rsp + 0x68]
01851 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01859 488f442470                     pop        qword ptr [rsp + 0x70]
0185e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01866 488f442478                     pop        qword ptr [rsp + 0x78]
0186b 48894424f8                     mov        qword ptr [rsp - 8], rax
01870 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01877 89442464                       mov        dword ptr [rsp + 0x64], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 48894424f8                     mov        qword ptr [rsp - 8], rax
01885 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0188c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01893 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01898 48894424f8                     mov        qword ptr [rsp - 8], rax
0189d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
018a4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
018ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b0 48894424f8                     mov        qword ptr [rsp - 8], rax
018b5 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018bc 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c8 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018d0 488f842490000000               pop        qword ptr [rsp + 0x90]
018d8 48894424f8                     mov        qword ptr [rsp - 8], rax
018dd 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018e4 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f0 48894424f8                     mov        qword ptr [rsp - 8], rax
018f5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018fc 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01910 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01918 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
01920 666690                         nop        
01923 e83876b4ff                     call       0x7f77a79c3e60
01928 0f1f8400201a000d               nop        dword ptr [rax + rax + 0xd001a20]
01930 be45ffffff                     mov        esi, 0xffffff45
01935 48894424f8                     mov        qword ptr [rsp - 8], rax
0193a 8b442408                       mov        eax, dword ptr [rsp + 8]
0193e 890424                         mov        dword ptr [rsp], eax
01941 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01946 48894424f8                     mov        qword ptr [rsp - 8], rax
0194b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0194f 89442404                       mov        dword ptr [rsp + 4], eax
01953 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01958 48ff742410                     push       qword ptr [rsp + 0x10]
0195d 488f442408                     pop        qword ptr [rsp + 8]
01962 48ff742418                     push       qword ptr [rsp + 0x18]
01967 488f442410                     pop        qword ptr [rsp + 0x10]
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01975 89442418                       mov        dword ptr [rsp + 0x18], eax
01979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197e 48894424f8                     mov        qword ptr [rsp - 8], rax
01983 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01987 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48894424f8                     mov        qword ptr [rsp - 8], rax
01995 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01999 89442420                       mov        dword ptr [rsp + 0x20], eax
0199d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a2 48894424f8                     mov        qword ptr [rsp - 8], rax
019a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
019ab 89442424                       mov        dword ptr [rsp + 0x24], eax
019af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019b9 48ff742438                     push       qword ptr [rsp + 0x38]
019be 488f442430                     pop        qword ptr [rsp + 0x30]
019c3 48894424f8                     mov        qword ptr [rsp - 8], rax
019c8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019cc 89442438                       mov        dword ptr [rsp + 0x38], eax
019d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d5 48894424f8                     mov        qword ptr [rsp - 8], rax
019da 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e7 48ff742448                     push       qword ptr [rsp + 0x48]
019ec 488f442440                     pop        qword ptr [rsp + 0x40]
019f1 48ff742450                     push       qword ptr [rsp + 0x50]
019f6 488f442448                     pop        qword ptr [rsp + 0x48]
019fb 48ff742458                     push       qword ptr [rsp + 0x58]
01a00 488f442450                     pop        qword ptr [rsp + 0x50]
01a05 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a11 89442458                       mov        dword ptr [rsp + 0x58], eax
01a15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a26 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a34 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a3b 89442460                       mov        dword ptr [rsp + 0x60], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a4c 488f442468                     pop        qword ptr [rsp + 0x68]
01a51 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a59 488f442478                     pop        qword ptr [rsp + 0x78]
01a5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a63 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a6a 89442464                       mov        dword ptr [rsp + 0x64], eax
01a6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a73 48894424f8                     mov        qword ptr [rsp - 8], rax
01a78 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a7f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a90 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a97 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01aaf 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ac3 488f842490000000               pop        qword ptr [rsp + 0x90]
01acb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ad7 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ade 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae3 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01aeb 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01af3 89bc24bc000000                 mov        dword ptr [rsp + 0xbc], edi
01afa 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b02 90                             nop        
01b03 e85874b4ff                     call       0x7f77a79c3e60
01b08 0f1f8400001c000e               nop        dword ptr [rax + rax + 0xe001c00]
01b10 41b8ffffff7f                   mov        r8d, 0x7fffffff
01b16 493bc8                         cmp        rcx, r8
01b19 bdffffffff                     mov        ebp, 0xffffffff
01b1e 7c08                           jl         0x7f77a7e7ca28
01b20 400f95c5                       setne      bpl
01b24 400fb6ed                       movzx      ebp, bpl
01b28 be45ffffff                     mov        esi, 0xffffff45
01b2d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b3e 89442460                       mov        dword ptr [rsp + 0x60], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b53 89442464                       mov        dword ptr [rsp + 0x64], eax
01b57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b61 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b68 89442468                       mov        dword ptr [rsp + 0x68], eax
01b6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b71 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b79 488f842480000000               pop        qword ptr [rsp + 0x80]
01b81 48894424f8                     mov        qword ptr [rsp - 8], rax
01b86 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b8d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b96 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ba2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ba9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bae 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01bba 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bd2 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bde 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01be6 488f842498000000               pop        qword ptr [rsp + 0x98]
01bee 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bf6 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01bfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01c03 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01c0a 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c16 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c1e 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01c26 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01c2e 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01c36 90                             nop        
01c37 e82473b4ff                     call       0x7f77a79c3e60
01c3c 0f1f8400341d000f               nop        dword ptr [rax + rax + 0xf001d34]
01c44 be45ffffff                     mov        esi, 0xffffff45
01c49 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4e 8b442408                       mov        eax, dword ptr [rsp + 8]
01c52 890424                         mov        dword ptr [rsp], eax
01c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c63 89442404                       mov        dword ptr [rsp + 4], eax
01c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6c 48ff742410                     push       qword ptr [rsp + 0x10]
01c71 488f442408                     pop        qword ptr [rsp + 8]
01c76 48ff742418                     push       qword ptr [rsp + 0x18]
01c7b 488f442410                     pop        qword ptr [rsp + 0x10]
01c80 48894424f8                     mov        qword ptr [rsp - 8], rax
01c85 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c89 89442418                       mov        dword ptr [rsp + 0x18], eax
01c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c92 48894424f8                     mov        qword ptr [rsp - 8], rax
01c97 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c9b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cad 89442420                       mov        dword ptr [rsp + 0x20], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01cbf 89442424                       mov        dword ptr [rsp + 0x24], eax
01cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ccd 48ff742438                     push       qword ptr [rsp + 0x38]
01cd2 488f442430                     pop        qword ptr [rsp + 0x30]
01cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ce0 89442438                       mov        dword ptr [rsp + 0x38], eax
01ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cf2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfb 48ff742448                     push       qword ptr [rsp + 0x48]
01d00 488f442440                     pop        qword ptr [rsp + 0x40]
01d05 48ff742450                     push       qword ptr [rsp + 0x50]
01d0a 488f442448                     pop        qword ptr [rsp + 0x48]
01d0f 48ff742458                     push       qword ptr [rsp + 0x58]
01d14 488f442450                     pop        qword ptr [rsp + 0x50]
01d19 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d25 89442458                       mov        dword ptr [rsp + 0x58], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d33 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d3a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 48894424f8                     mov        qword ptr [rsp - 8], rax
01d48 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d4f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d58 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d62 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d69 89442464                       mov        dword ptr [rsp + 0x64], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d7e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d96 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da2 48894424f8                     mov        qword ptr [rsp - 8], rax
01da7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01dae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01db5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dba 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01dc2 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01dca 90                             nop        
01dcb e89071b4ff                     call       0x7f77a79c3e60
01dd0 0f1f8400c81e0010               nop        dword ptr [rax + rax + 0x10001ec8]
01dd8 be45ffffff                     mov        esi, 0xffffff45
01ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
01de2 8b442408                       mov        eax, dword ptr [rsp + 8]
01de6 890424                         mov        dword ptr [rsp], eax
01de9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dee 48894424f8                     mov        qword ptr [rsp - 8], rax
01df3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01df7 89442404                       mov        dword ptr [rsp + 4], eax
01dfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e00 48ff742410                     push       qword ptr [rsp + 0x10]
01e05 488f442408                     pop        qword ptr [rsp + 8]
01e0a 48ff742418                     push       qword ptr [rsp + 0x18]
01e0f 488f442410                     pop        qword ptr [rsp + 0x10]
01e14 48894424f8                     mov        qword ptr [rsp - 8], rax
01e19 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e1d 89442418                       mov        dword ptr [rsp + 0x18], eax
01e21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e26 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e2f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e38 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e41 89442420                       mov        dword ptr [rsp + 0x20], eax
01e45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e53 89442424                       mov        dword ptr [rsp + 0x24], eax
01e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e61 48ff742438                     push       qword ptr [rsp + 0x38]
01e66 488f442430                     pop        qword ptr [rsp + 0x30]
01e6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e70 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e74 89442438                       mov        dword ptr [rsp + 0x38], eax
01e78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e86 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8f 48ff742448                     push       qword ptr [rsp + 0x48]
01e94 488f442440                     pop        qword ptr [rsp + 0x40]
01e99 48ff742450                     push       qword ptr [rsp + 0x50]
01e9e 488f442448                     pop        qword ptr [rsp + 0x48]
01ea3 48ff742458                     push       qword ptr [rsp + 0x58]
01ea8 488f442450                     pop        qword ptr [rsp + 0x50]
01ead 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01eb9 89442458                       mov        dword ptr [rsp + 0x58], eax
01ebd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ece 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ed2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed7 48894424f8                     mov        qword ptr [rsp - 8], rax
01edc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ee3 89442460                       mov        dword ptr [rsp + 0x60], eax
01ee7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eec 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01efd 89442464                       mov        dword ptr [rsp + 0x64], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f12 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f23 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f2a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f36 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f42 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f56 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01f5e 90                             nop        
01f5f e8fc6fb4ff                     call       0x7f77a79c3e60
01f64 0f1f84005c200011               nop        dword ptr [rax + rax + 0x1100205c]
01f6c be3dffffff                     mov        esi, 0xffffff3d
01f71 48894424f8                     mov        qword ptr [rsp - 8], rax
01f76 8b442408                       mov        eax, dword ptr [rsp + 8]
01f7a 890424                         mov        dword ptr [rsp], eax
01f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f82 48894424f8                     mov        qword ptr [rsp - 8], rax
01f87 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f8b 89442404                       mov        dword ptr [rsp + 4], eax
01f8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f94 48ff742410                     push       qword ptr [rsp + 0x10]
01f99 488f442408                     pop        qword ptr [rsp + 8]
01f9e 48ff742418                     push       qword ptr [rsp + 0x18]
01fa3 488f442410                     pop        qword ptr [rsp + 0x10]
01fa8 48894424f8                     mov        qword ptr [rsp - 8], rax
01fad 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01fb1 89442418                       mov        dword ptr [rsp + 0x18], eax
01fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fba 48894424f8                     mov        qword ptr [rsp - 8], rax
01fbf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fc3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fcc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fd5 89442420                       mov        dword ptr [rsp + 0x20], eax
01fd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fde 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fe7 89442424                       mov        dword ptr [rsp + 0x24], eax
01feb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ff5 48ff742438                     push       qword ptr [rsp + 0x38]
01ffa 488f442430                     pop        qword ptr [rsp + 0x30]
01fff 48894424f8                     mov        qword ptr [rsp - 8], rax
02004 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02008 89442438                       mov        dword ptr [rsp + 0x38], eax
0200c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02011 48894424f8                     mov        qword ptr [rsp - 8], rax
02016 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0201a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0201e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02023 48ff742448                     push       qword ptr [rsp + 0x48]
02028 488f442440                     pop        qword ptr [rsp + 0x40]
0202d 48ff742450                     push       qword ptr [rsp + 0x50]
02032 488f442448                     pop        qword ptr [rsp + 0x48]
02037 48ff742458                     push       qword ptr [rsp + 0x58]
0203c 488f442450                     pop        qword ptr [rsp + 0x50]
02041 48894424f8                     mov        qword ptr [rsp - 8], rax
02046 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0204d 89442458                       mov        dword ptr [rsp + 0x58], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 48894424f8                     mov        qword ptr [rsp - 8], rax
0205b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02062 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02066 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206b 48894424f8                     mov        qword ptr [rsp - 8], rax
02070 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02077 89442460                       mov        dword ptr [rsp + 0x60], eax
0207b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02080 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02085 48894424f8                     mov        qword ptr [rsp - 8], rax
0208a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02091 89442464                       mov        dword ptr [rsp + 0x64], eax
02095 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209a 48894424f8                     mov        qword ptr [rsp - 8], rax
0209f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
020a6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
020ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b2 48894424f8                     mov        qword ptr [rsp - 8], rax
020b7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020be 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48894424f8                     mov        qword ptr [rsp - 8], rax
020cf 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020d6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020ea 488f842490000000               pop        qword ptr [rsp + 0x90]
020f2 48894424f8                     mov        qword ptr [rsp - 8], rax
020f7 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
020fe 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02112 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0211a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02122 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0212a 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02132 48894424f8                     mov        qword ptr [rsp - 8], rax
02137 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0213e 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02145 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02152 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
0215a 898c24d8000000                 mov        dword ptr [rsp + 0xd8], ecx
02161 6690                           nop        
02163 e8f86db4ff                     call       0x7f77a79c3e60
02168 0f1f840060220012               nop        dword ptr [rax + rax + 0x12002260]
02170 be45ffffff                     mov        esi, 0xffffff45
02175 48894424f8                     mov        qword ptr [rsp - 8], rax
0217a 8b442408                       mov        eax, dword ptr [rsp + 8]
0217e 890424                         mov        dword ptr [rsp], eax
02181 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02186 48894424f8                     mov        qword ptr [rsp - 8], rax
0218b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0218f 89442404                       mov        dword ptr [rsp + 4], eax
02193 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02198 48ff742410                     push       qword ptr [rsp + 0x10]
0219d 488f442408                     pop        qword ptr [rsp + 8]
021a2 48ff742418                     push       qword ptr [rsp + 0x18]
021a7 488f442410                     pop        qword ptr [rsp + 0x10]
021ac 48894424f8                     mov        qword ptr [rsp - 8], rax
021b1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
021b5 89442418                       mov        dword ptr [rsp + 0x18], eax
021b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021be 48894424f8                     mov        qword ptr [rsp - 8], rax
021c3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021c7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d0 48894424f8                     mov        qword ptr [rsp - 8], rax
021d5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021d9 89442420                       mov        dword ptr [rsp + 0x20], eax
021dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e2 48894424f8                     mov        qword ptr [rsp - 8], rax
021e7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021eb 89442424                       mov        dword ptr [rsp + 0x24], eax
021ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
021f9 48ff742438                     push       qword ptr [rsp + 0x38]
021fe 488f442430                     pop        qword ptr [rsp + 0x30]
02203 48894424f8                     mov        qword ptr [rsp - 8], rax
02208 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0220c 89442438                       mov        dword ptr [rsp + 0x38], eax
02210 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02215 48894424f8                     mov        qword ptr [rsp - 8], rax
0221a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0221e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02222 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02227 48ff742448                     push       qword ptr [rsp + 0x48]
0222c 488f442440                     pop        qword ptr [rsp + 0x40]
02231 48ff742450                     push       qword ptr [rsp + 0x50]
02236 488f442448                     pop        qword ptr [rsp + 0x48]
0223b 48ff742458                     push       qword ptr [rsp + 0x58]
02240 488f442450                     pop        qword ptr [rsp + 0x50]
02245 897c2458                       mov        dword ptr [rsp + 0x58], edi
02249 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02251 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02259 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02261 6690                           nop        
02263 e8f86cb4ff                     call       0x7f77a79c3e60
02268 0f1f840060230013               nop        dword ptr [rax + rax + 0x13002360]
02270 be45ffffff                     mov        esi, 0xffffff45
02275 48894424f8                     mov        qword ptr [rsp - 8], rax
0227a 8b442408                       mov        eax, dword ptr [rsp + 8]
0227e 890424                         mov        dword ptr [rsp], eax
02281 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02286 48894424f8                     mov        qword ptr [rsp - 8], rax
0228b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0228f 89442404                       mov        dword ptr [rsp + 4], eax
02293 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02298 48ff742410                     push       qword ptr [rsp + 0x10]
0229d 488f442408                     pop        qword ptr [rsp + 8]
022a2 48ff742418                     push       qword ptr [rsp + 0x18]
022a7 488f442410                     pop        qword ptr [rsp + 0x10]
022ac 48894424f8                     mov        qword ptr [rsp - 8], rax
022b1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022b5 89442418                       mov        dword ptr [rsp + 0x18], eax
022b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022be 48894424f8                     mov        qword ptr [rsp - 8], rax
022c3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022c7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d0 48894424f8                     mov        qword ptr [rsp - 8], rax
022d5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022d9 89442420                       mov        dword ptr [rsp + 0x20], eax
022dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e2 48894424f8                     mov        qword ptr [rsp - 8], rax
022e7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022eb 89442424                       mov        dword ptr [rsp + 0x24], eax
022ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
022f9 48ff742438                     push       qword ptr [rsp + 0x38]
022fe 488f442430                     pop        qword ptr [rsp + 0x30]
02303 48894424f8                     mov        qword ptr [rsp - 8], rax
02308 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0230c 89442438                       mov        dword ptr [rsp + 0x38], eax
02310 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02315 48894424f8                     mov        qword ptr [rsp - 8], rax
0231a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0231e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02322 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02327 48ff742448                     push       qword ptr [rsp + 0x48]
0232c 488f442440                     pop        qword ptr [rsp + 0x40]
02331 48ff742450                     push       qword ptr [rsp + 0x50]
02336 488f442448                     pop        qword ptr [rsp + 0x48]
0233b 48ff742458                     push       qword ptr [rsp + 0x58]
02340 488f442450                     pop        qword ptr [rsp + 0x50]
02345 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
0234c 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02354 666690                         nop        
02357 e8046cb4ff                     call       0x7f77a79c3e60
0235c 0f1f840054240014               nop        dword ptr [rax + rax + 0x14002454]
02364 be45ffffff                     mov        esi, 0xffffff45
02369 48894424f8                     mov        qword ptr [rsp - 8], rax
0236e 8b442408                       mov        eax, dword ptr [rsp + 8]
02372 890424                         mov        dword ptr [rsp], eax
02375 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0237a 48894424f8                     mov        qword ptr [rsp - 8], rax
0237f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02383 89442404                       mov        dword ptr [rsp + 4], eax
02387 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238c 48ff742410                     push       qword ptr [rsp + 0x10]
02391 488f442408                     pop        qword ptr [rsp + 8]
02396 48ff742418                     push       qword ptr [rsp + 0x18]
0239b 488f442410                     pop        qword ptr [rsp + 0x10]
023a0 48894424f8                     mov        qword ptr [rsp - 8], rax
023a5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023a9 89442418                       mov        dword ptr [rsp + 0x18], eax
023ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b2 48894424f8                     mov        qword ptr [rsp - 8], rax
023b7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023bb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c4 48894424f8                     mov        qword ptr [rsp - 8], rax
023c9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023cd 89442420                       mov        dword ptr [rsp + 0x20], eax
023d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d6 48894424f8                     mov        qword ptr [rsp - 8], rax
023db 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023df 89442424                       mov        dword ptr [rsp + 0x24], eax
023e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e8 48ff742438                     push       qword ptr [rsp + 0x38]
023ed 488f442430                     pop        qword ptr [rsp + 0x30]
023f2 48894424f8                     mov        qword ptr [rsp - 8], rax
023f7 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023fb 89442438                       mov        dword ptr [rsp + 0x38], eax
023ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02404 48894424f8                     mov        qword ptr [rsp - 8], rax
02409 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0240d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02411 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02416 48ff742448                     push       qword ptr [rsp + 0x48]
0241b 488f442440                     pop        qword ptr [rsp + 0x40]
02420 48ff742450                     push       qword ptr [rsp + 0x50]
02425 488f442448                     pop        qword ptr [rsp + 0x48]
0242a 48ff742458                     push       qword ptr [rsp + 0x58]
0242f 488f442450                     pop        qword ptr [rsp + 0x50]
02434 48894424f8                     mov        qword ptr [rsp - 8], rax
02439 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02440 89442458                       mov        dword ptr [rsp + 0x58], eax
02444 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02449 48894424f8                     mov        qword ptr [rsp - 8], rax
0244e 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02455 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02459 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245e 48894424f8                     mov        qword ptr [rsp - 8], rax
02463 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0246a 89442460                       mov        dword ptr [rsp + 0x60], eax
0246e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02473 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0247b 488f442468                     pop        qword ptr [rsp + 0x68]
02480 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02488 488f442470                     pop        qword ptr [rsp + 0x70]
0248d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02495 488f442478                     pop        qword ptr [rsp + 0x78]
0249a 48894424f8                     mov        qword ptr [rsp - 8], rax
0249f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
024a6 89442464                       mov        dword ptr [rsp + 0x64], eax
024aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024af 48894424f8                     mov        qword ptr [rsp - 8], rax
024b4 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024bb 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c7 48894424f8                     mov        qword ptr [rsp - 8], rax
024cc 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024d3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024df 48894424f8                     mov        qword ptr [rsp - 8], rax
024e4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024eb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
024ff 488f842490000000               pop        qword ptr [rsp + 0x90]
02507 48894424f8                     mov        qword ptr [rsp - 8], rax
0250c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02513 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0251a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
02527 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0252f 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
02537 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0253f e81c6ab4ff                     call       0x7f77a79c3e60
02544 0f1f84003c260015               nop        dword ptr [rax + rax + 0x1500263c]
0254c 4533d2                         xor        r10d, r10d
0254f 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
02557 e972dcffff                     jmp        0x7f77a7e7b0ce
0255c 4533d2                         xor        r10d, r10d
0255f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02564 e991dcffff                     jmp        0x7f77a7e7b0fa
02569 4533d2                         xor        r10d, r10d
0256c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02571 e9abdcffff                     jmp        0x7f77a7e7b121
02576 4533d2                         xor        r10d, r10d
02579 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0257e e9cadcffff                     jmp        0x7f77a7e7b14d
02583 4533d2                         xor        r10d, r10d
02586 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0258b e9e7dcffff                     jmp        0x7f77a7e7b177
02590 4533d2                         xor        r10d, r10d
02593 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02598 e90cddffff                     jmp        0x7f77a7e7b1a9
0259d 4533d2                         xor        r10d, r10d
025a0 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
025a8 e929ddffff                     jmp        0x7f77a7e7b1d6
025ad 4533d2                         xor        r10d, r10d
025b0 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
025b8 e93fddffff                     jmp        0x7f77a7e7b1fc
025bd bebeffffff                     mov        esi, 0xffffffbe
025c2 48894424f8                     mov        qword ptr [rsp - 8], rax
025c7 8b442408                       mov        eax, dword ptr [rsp + 8]
025cb 890424                         mov        dword ptr [rsp], eax
025ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d3 48894424f8                     mov        qword ptr [rsp - 8], rax
025d8 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
025dc 89442404                       mov        dword ptr [rsp + 4], eax
025e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e5 48ff742410                     push       qword ptr [rsp + 0x10]
025ea 488f442408                     pop        qword ptr [rsp + 8]
025ef 48ff742418                     push       qword ptr [rsp + 0x18]
025f4 488f442410                     pop        qword ptr [rsp + 0x10]
025f9 48894424f8                     mov        qword ptr [rsp - 8], rax
025fe 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02602 89442418                       mov        dword ptr [rsp + 0x18], eax
02606 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260b 48894424f8                     mov        qword ptr [rsp - 8], rax
02610 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02614 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02618 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261d 48894424f8                     mov        qword ptr [rsp - 8], rax
02622 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02626 89442420                       mov        dword ptr [rsp + 0x20], eax
0262a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0262f 48894424f8                     mov        qword ptr [rsp - 8], rax
02634 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02638 89442424                       mov        dword ptr [rsp + 0x24], eax
0263c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02641 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02646 48ff742438                     push       qword ptr [rsp + 0x38]
0264b 488f442430                     pop        qword ptr [rsp + 0x30]
02650 48894424f8                     mov        qword ptr [rsp - 8], rax
02655 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02659 89442438                       mov        dword ptr [rsp + 0x38], eax
0265d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02662 48894424f8                     mov        qword ptr [rsp - 8], rax
02667 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0266b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0266f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02674 48ff742448                     push       qword ptr [rsp + 0x48]
02679 488f442440                     pop        qword ptr [rsp + 0x40]
0267e 48ff742450                     push       qword ptr [rsp + 0x50]
02683 488f442448                     pop        qword ptr [rsp + 0x48]
02688 48ff742458                     push       qword ptr [rsp + 0x58]
0268d 488f442450                     pop        qword ptr [rsp + 0x50]
02692 90                             nop        
02693 e8c868b4ff                     call       0x7f77a79c3e60
02698 0f1f840090270016               nop        dword ptr [rax + rax + 0x16002790]
026a0 be85ffffff                     mov        esi, 0xffffff85
026a5 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
026a9 48894424f8                     mov        qword ptr [rsp - 8], rax
026ae 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026b2 890424                         mov        dword ptr [rsp], eax
026b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ba 48894424f8                     mov        qword ptr [rsp - 8], rax
026bf 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026c3 89442404                       mov        dword ptr [rsp + 4], eax
026c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026cc 48894424f8                     mov        qword ptr [rsp - 8], rax
026d1 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026d5 89442408                       mov        dword ptr [rsp + 8], eax
026d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026de 48894424f8                     mov        qword ptr [rsp - 8], rax
026e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
026eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f0 48894424f8                     mov        qword ptr [rsp - 8], rax
026f5 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026f9 89442410                       mov        dword ptr [rsp + 0x10], eax
026fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02702 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02707 48ff742438                     push       qword ptr [rsp + 0x38]
0270c 488f442420                     pop        qword ptr [rsp + 0x20]
02711 48894424f8                     mov        qword ptr [rsp - 8], rax
02716 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0271a 89442414                       mov        dword ptr [rsp + 0x14], eax
0271e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02723 48894424f8                     mov        qword ptr [rsp - 8], rax
02728 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0272c 89442428                       mov        dword ptr [rsp + 0x28], eax
02730 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02735 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0273a 90                             nop        
0273b e82068b4ff                     call       0x7f77a79c3e60
02740 0f1f840038280017               nop        dword ptr [rax + rax + 0x17002838]
02748 bef6ffffff                     mov        esi, 0xfffffff6
0274d 6690                           nop        
0274f e80c68b4ff                     call       0x7f77a79c3e60
02754 0f1f84004c280018               nop        dword ptr [rax + rax + 0x1800284c]
0275c be5d000000                     mov        esi, 0x5d
02761 6690                           nop        
02763 e8f867b4ff                     call       0x7f77a79c3e60
02768 0f1f840060280019               nop        dword ptr [rax + rax + 0x19002860]
02770 bef6ffffff                     mov        esi, 0xfffffff6
02775 418beb                         mov        ebp, r11d
02778 666690                         nop        
0277b e8e067b4ff                     call       0x7f77a79c3e60
02780 0f1f84007828001a               nop        dword ptr [rax + rax + 0x1a002878]
02788 bef6ffffff                     mov        esi, 0xfffffff6
0278d 8be9                           mov        ebp, ecx
0278f e8cc67b4ff                     call       0x7f77a79c3e60
02794 0f1f84008c28001b               nop        dword ptr [rax + rax + 0x1b00288c]
0279c bef6ffffff                     mov        esi, 0xfffffff6
027a1 418beb                         mov        ebp, r11d
027a4 666690                         nop        
027a7 e8b467b4ff                     call       0x7f77a79c3e60
027ac 0f1f8400a428001c               nop        dword ptr [rax + rax + 0x1c0028a4]
027b4 eb00                           jmp        0x7f77a7e7d6b6
027b6 488bf0                         mov        rsi, rax
027b9 e9eae2ffff                     jmp        0x7f77a7e7b9a8
027be 49ba77b9e7a7777f0000           movabs     r10, 0x7f77a7e7b977
027c8 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
027cf e90cf8a7ff                     jmp        0x7f77a78fcee0
027d4 e8c7c3a6ff                     call       0x7f77a78e9aa0
027d9 e950d8ffff                     jmp        0x7f77a7e7af2e
027de f4                             hlt        
027df f4                             hlt        
