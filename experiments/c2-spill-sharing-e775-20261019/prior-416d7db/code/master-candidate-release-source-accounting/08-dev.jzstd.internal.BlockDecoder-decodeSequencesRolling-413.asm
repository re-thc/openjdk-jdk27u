00000 e8bb088715                     call       0x7f4ec56d5340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8566290000                   jne        0x7f4eafe67414
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
0018f 49ba80ba7bc54e7f0000           movabs     r10, 0x7f4ec57bba80
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f845a250000                   je         0x7f4eafe6718c
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fb05010000                 cmp        r11d, 0x105
001c0 0f859a260000                   jne        0x7f4eafe672e0
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8440250000                   je         0x7f4eafe6719c
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16040000                 cmp        r10d, 0x416
001ea 0f8570260000                   jne        0x7f4eafe672e0
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8421250000                   je         0x7f4eafe671a9
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a040000                 cmp        r11d, 0x40a
00216 0f8544260000                   jne        0x7f4eafe672e0
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f8407250000                   je         0x7f4eafe671b6
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d040000                 cmp        r10d, 0x40d
0023d 0f851d260000                   jne        0x7f4eafe672e0
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f84e5240000                   je         0x7f4eafe671c3
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d040000                 cmp        r11d, 0x40d
0026c 0f85ee250000                   jne        0x7f4eafe672e0
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f84c8240000                   je         0x7f4eafe671d0
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d040000                 cmp        r10d, 0x40d
00296 0f85c4250000                   jne        0x7f4eafe672e0
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84a3240000                   je         0x7f4eafe671dd
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fb08010000                 cmp        r11d, 0x108
002c8 0f8592250000                   jne        0x7f4eafe672e0
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f848e240000                   je         0x7f4eafe671ed
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fa07010000                 cmp        r10d, 0x107
002ee 0f856c250000                   jne        0x7f4eafe672e0
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f8473240000                   je         0x7f4eafe671fd
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8465240000                   je         0x7f4eafe671fd
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f8457240000                   je         0x7f4eafe671fd
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d58f9                       lea        r11d, [r8 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8c2f240000                   jl         0x7f4eafe671fd
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e95c020000                     jmp        0x7f4eafe6503b
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
0039a 0f8da40f0000                   jge        0x7f4eafe65dc4
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d41110000                   jge        0x7f4eafe65f94
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d10130000                   jge        0x7f4eafe6618c
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8de3140000                   jge        0x7f4eafe66388
00425 41b801000000                   mov        r8d, 1
0042b c442d1f7c8                     shlx       r9, r8, rbp
00430 49ffc9                         dec        r9
00433 4d23cb                         and        r9, r11
00436 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0043e 458bc3                         mov        r8d, r11d
00441 4403c1                         add        r8d, ecx
00444 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0044c 458bdb                         mov        r11d, r11d
0044f 4403df                         add        r11d, edi
00452 4963c8                         movsxd     rcx, r8d
00455 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
0045d 8bff                           mov        edi, edi
0045f 4c03cf                         add        r9, rdi
00462 488bbc24a8000000               mov        rdi, qword ptr [rsp + 0xa8]
0046a 4803f9                         add        rdi, rcx
0046d 4889bc24a8000000               mov        qword ptr [rsp + 0xa8], rdi
00475 4d85c9                         test       r9, r9
00478 0f8e760b0000                   jle        0x7f4eafe65a74
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f5d160000                   jg         0x7f4eafe66568
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8f7c170000                   jg         0x7f4eafe66694
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f03190000                   jg         0x7f4eafe66828
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83871a0000                   jae        0x7f4eafe669bc
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f834d090000                   jae        0x7f4eafe658a8
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8daf000000                   jge        0x7f4eafe6502d
004fe 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00512 49c1e830                       shr        r8, 0x30
00516 458bdb                         mov        r11d, r11d
00519 418bc8                         mov        ecx, r8d
0051c 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
00524 44038424bc000000               add        r8d, dword ptr [rsp + 0xbc]
0052c c4423bf7ca                     shrx       r9d, r10d, r8d
00531 4103c9                         add        ecx, r9d
00534 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
0053b 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
00543 c4423bf7ca                     shrx       r9d, r10d, r8d
00548 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054f 83f920                         cmp        ecx, 0x20
00552 0f8de81b0000                   jge        0x7f4eafe66bc0
00558 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00560 49c1e830                       shr        r8, 0x30
00564 458bc0                         mov        r8d, r8d
00567 ba01000000                     mov        edx, 1
0056c c4e271f7ca                     shlx       ecx, edx, ecx
00571 ffc9                           dec        ecx
00573 4123c9                         and        ecx, r9d
00576 4103cb                         add        ecx, r11d
00579 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00580 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00588 4183f920                       cmp        r9d, 0x20
0058c 0f8dbe1c0000                   jge        0x7f4eafe66cd0
00592 b901000000                     mov        ecx, 1
00597 c46231f7d9                     shlx       r11d, ecx, r9d
0059c 41ffcb                         dec        r11d
0059f 4523da                         and        r11d, r10d
005a2 4503d8                         add        r11d, r8d
005a5 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
005ad 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b1 418502                         test       dword ptr [r10], eax
005b4 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005bb 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005c3 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005c8 0f8d64040000                   jge        0x7f4eafe654b2
005ce 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d3 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005d7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005df 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005e7 458b4204                       mov        r8d, dword ptr [r10 + 4]
005eb 453bd8                         cmp        r11d, r8d
005ee 0f83de040000                   jae        0x7f4eafe65552
005f4 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
005f9 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
005fd 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00604 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
0060b 458b4104                       mov        r8d, dword ptr [r9 + 4]
0060f 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00614 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0061c 413bc8                         cmp        ecx, r8d
0061f 0f839f050000                   jae        0x7f4eafe65644
00625 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0062a 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0062e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00636 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0063e 458b4204                       mov        r8d, dword ptr [r10 + 4]
00642 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00647 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0064f 453bd8                         cmp        r11d, r8d
00652 0f8388060000                   jae        0x7f4eafe65760
00658 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0065d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00665 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0066c ffc5                           inc        ebp
0066e 896c2404                       mov        dword ptr [rsp + 4], ebp
00672 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00676 0f8d27040000                   jge        0x7f4eafe65523
0067c 49c1ea28                       shr        r10, 0x28
00680 458bd2                         mov        r10d, r10d
00683 450fb6d2                       movzx      r10d, r10b
00687 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0068f 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00697 49c1ea28                       shr        r10, 0x28
0069b 458bda                         mov        r11d, r10d
0069e 450fb6c3                       movzx      r8d, r11b
006a2 44038424bc000000               add        r8d, dword ptr [rsp + 0xbc]
006aa 4d8bd1                         mov        r10, r9
006ad 49c1ea28                       shr        r10, 0x28
006b1 458bd2                         mov        r10d, r10d
006b4 450fb6da                       movzx      r11d, r10b
006b8 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
006c0 4503c3                         add        r8d, r11d
006c3 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
006cb 41ba01000000                   mov        r10d, 1
006d1 4489942404010000               mov        dword ptr [rsp + 0x104], r10d
006d9 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006e1 49c1ea20                       shr        r10, 0x20
006e5 458bda                         mov        r11d, r10d
006e8 410fb6eb                       movzx      ebp, r11b
006ec 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006f3 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006fb 49c1ea20                       shr        r10, 0x20
006ff 458bd2                         mov        r10d, r10d
00702 410fb6ea                       movzx      ebp, r10b
00706 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
0070d 4d8bd1                         mov        r10, r9
00710 49c1ea20                       shr        r10, 0x20
00714 458bda                         mov        r11d, r10d
00717 410fb6eb                       movzx      ebp, r11b
0071b 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00722 448bdd                         mov        r11d, ebp
00725 44039c24f8000000               add        r11d, dword ptr [rsp + 0xf8]
0072d 44039c24fc000000               add        r11d, dword ptr [rsp + 0xfc]
00735 44039c24f4000000               add        r11d, dword ptr [rsp + 0xf4]
0073d 4585db                         test       r11d, r11d
00740 0f84d6090000                   je         0x7f4eafe65b9c
00746 4183fb3f                       cmp        r11d, 0x3f
0074a 0f8f940b0000                   jg         0x7f4eafe65d64
00750 41ba40000000                   mov        r10d, 0x40
00756 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
0075b 453bda                         cmp        r11d, r10d
0075e 7e43                           jle        0x7f4eafe65223
00760 458bc3                         mov        r8d, r11d
00763 452bc2                         sub        r8d, r10d
00766 4183fa40                       cmp        r10d, 0x40
0076a 0f8db41d0000                   jge        0x7f4eafe66fa4
00770 41b901000000                   mov        r9d, 1
00776 c442a9f7d1                     shlx       r10, r9, r10
0077b 49ffca                         dec        r10
0077e 4c23d3                         and        r10, rbx
00781 c4c2b9f7ca                     shlx       rcx, r10, r8
00786 41b940000000                   mov        r9d, 0x40
0078c 452bc8                         sub        r9d, r8d
0078f c462b3f7542438                 shrx       r10, qword ptr [rsp + 0x38], r9
00796 490bca                         or         rcx, r10
00799 48898c2408010000               mov        qword ptr [rsp + 0x108], rcx
007a1 eb2b                           jmp        0x7f4eafe6524e
007a3 452bd3                         sub        r10d, r11d
007a6 c462abf7d3                     shrx       r10, rbx, r10
007ab 4183fb40                       cmp        r11d, 0x40
007af 0f8d8f1b0000                   jge        0x7f4eafe66dc4
007b5 41b801000000                   mov        r8d, 1
007bb c442a1f7c0                     shlx       r8, r8, r11
007c0 49ffc8                         dec        r8
007c3 4d23c2                         and        r8, r10
007c6 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007ce 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
007d3 4503d3                         add        r10d, r11d
007d6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007db 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
007e0 4503c3                         add        r8d, r11d
007e3 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007e8 4183fa40                       cmp        r10d, 0x40
007ec 0f8c9efbffff                   jl         0x7f4eafe64e10
007f2 458d5ac0                       lea        r11d, [r10 - 0x40]
007f6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007fb 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007ff 83c5f8                         add        ebp, -8
00802 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00806 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0080a 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0080e 83c1f0                         add        ecx, -0x10
00811 83f908                         cmp        ecx, 8
00814 0f8cca010000                   jl         0x7f4eafe65464
0081a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0081f 4183c2e8                       add        r10d, -0x18
00823 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0082b 0f822efbffff                   jb         0x7f4eafe64ddf
00831 bee4ffffff                     mov        esi, 0xffffffe4
00836 48894424f8                     mov        qword ptr [rsp - 8], rax
0083b 8b442408                       mov        eax, dword ptr [rsp + 8]
0083f 890424                         mov        dword ptr [rsp], eax
00842 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00847 48894424f8                     mov        qword ptr [rsp - 8], rax
0084c 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00850 89442404                       mov        dword ptr [rsp + 4], eax
00854 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00859 48ff742410                     push       qword ptr [rsp + 0x10]
0085e 488f442408                     pop        qword ptr [rsp + 8]
00863 48ff742418                     push       qword ptr [rsp + 0x18]
00868 488f442410                     pop        qword ptr [rsp + 0x10]
0086d 48894424f8                     mov        qword ptr [rsp - 8], rax
00872 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00876 89442418                       mov        dword ptr [rsp + 0x18], eax
0087a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0087f 48894424f8                     mov        qword ptr [rsp - 8], rax
00884 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00888 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0088c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00891 48894424f8                     mov        qword ptr [rsp - 8], rax
00896 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0089a 89442420                       mov        dword ptr [rsp + 0x20], eax
0089e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a3 48894424f8                     mov        qword ptr [rsp - 8], rax
008a8 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008ac 89442424                       mov        dword ptr [rsp + 0x24], eax
008b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b5 48ff742438                     push       qword ptr [rsp + 0x38]
008ba 488f442428                     pop        qword ptr [rsp + 0x28]
008bf 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008c4 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008c9 48ff742448                     push       qword ptr [rsp + 0x48]
008ce 488f442438                     pop        qword ptr [rsp + 0x38]
008d3 48ff742450                     push       qword ptr [rsp + 0x50]
008d8 488f442440                     pop        qword ptr [rsp + 0x40]
008dd 48ff742458                     push       qword ptr [rsp + 0x58]
008e2 488f442448                     pop        qword ptr [rsp + 0x48]
008e7 48894424f8                     mov        qword ptr [rsp - 8], rax
008ec 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
008f3 89442450                       mov        dword ptr [rsp + 0x50], eax
008f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008fc 48894424f8                     mov        qword ptr [rsp - 8], rax
00901 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00908 89442454                       mov        dword ptr [rsp + 0x54], eax
0090c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00911 48894424f8                     mov        qword ptr [rsp - 8], rax
00916 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0091d 89442458                       mov        dword ptr [rsp + 0x58], eax
00921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00926 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0092e 488f442460                     pop        qword ptr [rsp + 0x60]
00933 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0093b 488f442468                     pop        qword ptr [rsp + 0x68]
00940 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00948 488f442470                     pop        qword ptr [rsp + 0x70]
0094d 48894424f8                     mov        qword ptr [rsp - 8], rax
00952 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00959 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0095d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00962 48894424f8                     mov        qword ptr [rsp - 8], rax
00967 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0096e 89442478                       mov        dword ptr [rsp + 0x78], eax
00972 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00977 48894424f8                     mov        qword ptr [rsp - 8], rax
0097c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00983 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098c 48894424f8                     mov        qword ptr [rsp - 8], rax
00991 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00998 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0099f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009ac 488f842488000000               pop        qword ptr [rsp + 0x88]
009b4 48894424f8                     mov        qword ptr [rsp - 8], rax
009b9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009c0 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009cc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009d4 666690                         nop        
009d7 e804e2b5ff                     call       0x7f4eaf9c3660
009dc 0f1f8400d40a0001               nop        dword ptr [rax + rax + 0x1000ad4]
009e4 85c9                           test       ecx, ecx
009e6 7f08                           jg         0x7f4eafe65470
009e8 4533d2                         xor        r10d, r10d
009eb e97cf9ffff                     jmp        0x7f4eafe64dec
009f0 8be9                           mov        ebp, ecx
009f2 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
009fa 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
009fe 90                             nop        
009ff e8dc63a9ff                     call       0x7f4eaf8fb860
00a04 0f1f8400fc0a0002               nop        dword ptr [rax + rax + 0x2000afc]
00a0c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a11 41c1e303                       shl        r11d, 3
00a15 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a1a 41c1e203                       shl        r10d, 3
00a1e 452bd3                         sub        r10d, r11d
00a21 4181c2c0000000                 add        r10d, 0xc0
00a28 c462a9f7d0                     shlx       r10, rax, r10
00a2d e93af9ffff                     jmp        0x7f4eafe64dec
00a32 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a3a 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a42 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a47 4d3bd3                         cmp        r10, r11
00a4a 7e31                           jle        0x7f4eafe654fd
00a4c 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a56 90                             nop        
00a57 e88463a9ff                     call       0x7f4eaf8fb860
00a5c 0f1f8400540b0003               nop        dword ptr [rax + rax + 0x3000b54]
00a64 4885c0                         test       rax, rax
00a67 0f849b1e0000                   je         0x7f4eafe67388
00a6d 488bf0                         mov        rsi, rax
00a70 4881c430010000                 add        rsp, 0x130
00a77 5d                             pop        rbp
00a78 e9630db6ff                     jmp        0x7f4eaf9c6260
00a7d 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a82 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a87 0f858f1e0000                   jne        0x7f4eafe6739c
00a8d 418bc2                         mov        eax, r10d
00a90 4881c430010000                 add        rsp, 0x130
00a97 5d                             pop        rbp
00a98 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a9c 0f87dc1e0000                   ja         0x7f4eafe673fe
00aa2 c3                             ret        
00aa3 4533d2                         xor        r10d, r10d
00aa6 33ed                           xor        ebp, ebp
00aa8 4533c0                         xor        r8d, r8d
00aab 4533db                         xor        r11d, r11d
00aae 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ab6 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00abd 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00ac5 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00acd e907fcffff                     jmp        0x7f4eafe65159
00ad2 bee4ffffff                     mov        esi, 0xffffffe4
00ad7 48894424f8                     mov        qword ptr [rsp - 8], rax
00adc 8b442408                       mov        eax, dword ptr [rsp + 8]
00ae0 890424                         mov        dword ptr [rsp], eax
00ae3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ae8 48894424f8                     mov        qword ptr [rsp - 8], rax
00aed 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00af1 89442404                       mov        dword ptr [rsp + 4], eax
00af5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00afa 48ff742410                     push       qword ptr [rsp + 0x10]
00aff 488f442408                     pop        qword ptr [rsp + 8]
00b04 48ff742418                     push       qword ptr [rsp + 0x18]
00b09 488f442410                     pop        qword ptr [rsp + 0x10]
00b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b13 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b17 89442418                       mov        dword ptr [rsp + 0x18], eax
00b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b20 48894424f8                     mov        qword ptr [rsp - 8], rax
00b25 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b29 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b32 48894424f8                     mov        qword ptr [rsp - 8], rax
00b37 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b3b 89442420                       mov        dword ptr [rsp + 0x20], eax
00b3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b44 48894424f8                     mov        qword ptr [rsp - 8], rax
00b49 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b4d 89442424                       mov        dword ptr [rsp + 0x24], eax
00b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b56 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b5b 48ff742438                     push       qword ptr [rsp + 0x38]
00b60 488f442430                     pop        qword ptr [rsp + 0x30]
00b65 48894424f8                     mov        qword ptr [rsp - 8], rax
00b6a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b6e 89442438                       mov        dword ptr [rsp + 0x38], eax
00b72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b77 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7c 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b80 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b89 48ff742448                     push       qword ptr [rsp + 0x48]
00b8e 488f442440                     pop        qword ptr [rsp + 0x40]
00b93 48ff742450                     push       qword ptr [rsp + 0x50]
00b98 488f442448                     pop        qword ptr [rsp + 0x48]
00b9d 48ff742458                     push       qword ptr [rsp + 0x58]
00ba2 488f442450                     pop        qword ptr [rsp + 0x50]
00ba7 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00baf 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bb7 e824e0b5ff                     call       0x7f4eaf9c3660
00bbc 0f1f8400b40c0004               nop        dword ptr [rax + rax + 0x4000cb4]
00bc4 bee4ffffff                     mov        esi, 0xffffffe4
00bc9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bce 8b442408                       mov        eax, dword ptr [rsp + 8]
00bd2 890424                         mov        dword ptr [rsp], eax
00bd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bda 48894424f8                     mov        qword ptr [rsp - 8], rax
00bdf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00be3 89442404                       mov        dword ptr [rsp + 4], eax
00be7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bec 48ff742410                     push       qword ptr [rsp + 0x10]
00bf1 488f442408                     pop        qword ptr [rsp + 8]
00bf6 48ff742418                     push       qword ptr [rsp + 0x18]
00bfb 488f442410                     pop        qword ptr [rsp + 0x10]
00c00 48894424f8                     mov        qword ptr [rsp - 8], rax
00c05 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c09 89442418                       mov        dword ptr [rsp + 0x18], eax
00c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c12 48894424f8                     mov        qword ptr [rsp - 8], rax
00c17 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c1b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c24 48894424f8                     mov        qword ptr [rsp - 8], rax
00c29 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c2d 89442420                       mov        dword ptr [rsp + 0x20], eax
00c31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c36 48894424f8                     mov        qword ptr [rsp - 8], rax
00c3b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c3f 89442424                       mov        dword ptr [rsp + 0x24], eax
00c43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c48 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c4d 48ff742438                     push       qword ptr [rsp + 0x38]
00c52 488f442430                     pop        qword ptr [rsp + 0x30]
00c57 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c60 89442438                       mov        dword ptr [rsp + 0x38], eax
00c64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c69 48894424f8                     mov        qword ptr [rsp - 8], rax
00c6e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c72 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7b 48ff742448                     push       qword ptr [rsp + 0x48]
00c80 488f442440                     pop        qword ptr [rsp + 0x40]
00c85 48ff742450                     push       qword ptr [rsp + 0x50]
00c8a 488f442448                     pop        qword ptr [rsp + 0x48]
00c8f 48ff742458                     push       qword ptr [rsp + 0x58]
00c94 488f442450                     pop        qword ptr [rsp + 0x50]
00c99 48894424f8                     mov        qword ptr [rsp - 8], rax
00c9e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ca5 89442458                       mov        dword ptr [rsp + 0x58], eax
00ca9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cae 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cba 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc3 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00ccb 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00cd2 90                             nop        
00cd3 e808dfb5ff                     call       0x7f4eaf9c3660
00cd8 0f1f8400d00d0005               nop        dword ptr [rax + rax + 0x5000dd0]
00ce0 bee4ffffff                     mov        esi, 0xffffffe4
00ce5 48894424f8                     mov        qword ptr [rsp - 8], rax
00cea 8b442408                       mov        eax, dword ptr [rsp + 8]
00cee 890424                         mov        dword ptr [rsp], eax
00cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00cff 89442404                       mov        dword ptr [rsp + 4], eax
00d03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d08 48ff742410                     push       qword ptr [rsp + 0x10]
00d0d 488f442408                     pop        qword ptr [rsp + 8]
00d12 48ff742418                     push       qword ptr [rsp + 0x18]
00d17 488f442410                     pop        qword ptr [rsp + 0x10]
00d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d21 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d25 89442418                       mov        dword ptr [rsp + 0x18], eax
00d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d33 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d37 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d40 48894424f8                     mov        qword ptr [rsp - 8], rax
00d45 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d49 89442420                       mov        dword ptr [rsp + 0x20], eax
00d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d52 48894424f8                     mov        qword ptr [rsp - 8], rax
00d57 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d5b 89442424                       mov        dword ptr [rsp + 0x24], eax
00d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d64 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d69 48ff742438                     push       qword ptr [rsp + 0x38]
00d6e 488f442430                     pop        qword ptr [rsp + 0x30]
00d73 48894424f8                     mov        qword ptr [rsp - 8], rax
00d78 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d7c 89442438                       mov        dword ptr [rsp + 0x38], eax
00d80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d85 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00d8e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00d92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d97 48ff742448                     push       qword ptr [rsp + 0x48]
00d9c 488f442440                     pop        qword ptr [rsp + 0x40]
00da1 48ff742450                     push       qword ptr [rsp + 0x50]
00da6 488f442448                     pop        qword ptr [rsp + 0x48]
00dab 48ff742458                     push       qword ptr [rsp + 0x58]
00db0 488f442450                     pop        qword ptr [rsp + 0x50]
00db5 48894424f8                     mov        qword ptr [rsp - 8], rax
00dba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00dc1 89442458                       mov        dword ptr [rsp + 0x58], eax
00dc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dca 48894424f8                     mov        qword ptr [rsp - 8], rax
00dcf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00dd6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00dda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ddf 48894424f8                     mov        qword ptr [rsp - 8], rax
00de4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00deb 89442460                       mov        dword ptr [rsp + 0x60], eax
00def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df4 48894424f8                     mov        qword ptr [rsp - 8], rax
00df9 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e00 89442464                       mov        dword ptr [rsp + 0x64], eax
00e04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e09 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e11 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e19 6690                           nop        
00e1b e8c0ddb5ff                     call       0x7f4eaf9c3660
00e20 0f1f8400180f0006               nop        dword ptr [rax + rax + 0x6000f18]
00e28 bee4ffffff                     mov        esi, 0xffffffe4
00e2d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e32 8b442408                       mov        eax, dword ptr [rsp + 8]
00e36 890424                         mov        dword ptr [rsp], eax
00e39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e43 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e47 89442404                       mov        dword ptr [rsp + 4], eax
00e4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e50 48ff742410                     push       qword ptr [rsp + 0x10]
00e55 488f442408                     pop        qword ptr [rsp + 8]
00e5a 48ff742418                     push       qword ptr [rsp + 0x18]
00e5f 488f442410                     pop        qword ptr [rsp + 0x10]
00e64 48894424f8                     mov        qword ptr [rsp - 8], rax
00e69 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e6d 89442418                       mov        dword ptr [rsp + 0x18], eax
00e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e76 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e7f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e88 48894424f8                     mov        qword ptr [rsp - 8], rax
00e8d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e91 89442420                       mov        dword ptr [rsp + 0x20], eax
00e95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e9a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ea3 89442424                       mov        dword ptr [rsp + 0x24], eax
00ea7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00eb1 48ff742438                     push       qword ptr [rsp + 0x38]
00eb6 488f442430                     pop        qword ptr [rsp + 0x30]
00ebb 48894424f8                     mov        qword ptr [rsp - 8], rax
00ec0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ec4 89442438                       mov        dword ptr [rsp + 0x38], eax
00ec8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ecd 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ed6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00eda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00edf 48ff742448                     push       qword ptr [rsp + 0x48]
00ee4 488f442440                     pop        qword ptr [rsp + 0x40]
00ee9 48ff742450                     push       qword ptr [rsp + 0x50]
00eee 488f442448                     pop        qword ptr [rsp + 0x48]
00ef3 48ff742458                     push       qword ptr [rsp + 0x58]
00ef8 488f442450                     pop        qword ptr [rsp + 0x50]
00efd 48894424f8                     mov        qword ptr [rsp - 8], rax
00f02 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f09 89442458                       mov        dword ptr [rsp + 0x58], eax
00f0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f12 48894424f8                     mov        qword ptr [rsp - 8], rax
00f17 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f1e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f27 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f33 89442460                       mov        dword ptr [rsp + 0x60], eax
00f37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00f41 48894424f8                     mov        qword ptr [rsp - 8], rax
00f46 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f4d 89442464                       mov        dword ptr [rsp + 0x64], eax
00f51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f56 48894424f8                     mov        qword ptr [rsp - 8], rax
00f5b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f62 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f6e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f73 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f7a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f86 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00f92 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00f99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f9e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fa6 488f842490000000               pop        qword ptr [rsp + 0x90]
00fae 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fba 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc6 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fce 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00fd6 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00fde 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00fe6 90                             nop        
00fe7 e8f4dbb5ff                     call       0x7f4eaf9c3660
00fec 0f1f8400e4100007               nop        dword ptr [rax + rax + 0x70010e4]
00ff4 33c9                           xor        ecx, ecx
00ff6 4c3bc9                         cmp        r9, rcx
00ff9 bdffffffff                     mov        ebp, 0xffffffff
00ffe 7c08                           jl         0x7f4eafe65a88
01000 400f95c5                       setne      bpl
01004 400fb6ed                       movzx      ebp, bpl
01008 be45ffffff                     mov        esi, 0xffffff45
0100d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01012 48894424f8                     mov        qword ptr [rsp - 8], rax
01017 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0101e 89442460                       mov        dword ptr [rsp + 0x60], eax
01022 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01027 48894424f8                     mov        qword ptr [rsp - 8], rax
0102c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01033 89442464                       mov        dword ptr [rsp + 0x64], eax
01037 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103c 48894424f8                     mov        qword ptr [rsp - 8], rax
01041 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01048 89442468                       mov        dword ptr [rsp + 0x68], eax
0104c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01051 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01059 48894424f8                     mov        qword ptr [rsp - 8], rax
0105e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01065 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01069 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0106e 48894424f8                     mov        qword ptr [rsp - 8], rax
01073 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0107a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01081 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01086 48894424f8                     mov        qword ptr [rsp - 8], rax
0108b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01092 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109e 48894424f8                     mov        qword ptr [rsp - 8], rax
010a3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010aa 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010be 488f842498000000               pop        qword ptr [rsp + 0x98]
010c6 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010ce 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010d6 48894424f8                     mov        qword ptr [rsp - 8], rax
010db 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
010e2 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
010e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ee 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
010f6 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
010fe 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01106 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0110e 90                             nop        
0110f e8ccdab5ff                     call       0x7f4eaf9c3660
01114 0f1f84000c120008               nop        dword ptr [rax + rax + 0x800120c]
0111c be45ffffff                     mov        esi, 0xffffff45
01121 48894424f8                     mov        qword ptr [rsp - 8], rax
01126 8b442408                       mov        eax, dword ptr [rsp + 8]
0112a 890424                         mov        dword ptr [rsp], eax
0112d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01132 48894424f8                     mov        qword ptr [rsp - 8], rax
01137 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0113b 89442404                       mov        dword ptr [rsp + 4], eax
0113f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01144 48ff742410                     push       qword ptr [rsp + 0x10]
01149 488f442408                     pop        qword ptr [rsp + 8]
0114e 48ff742418                     push       qword ptr [rsp + 0x18]
01153 488f442410                     pop        qword ptr [rsp + 0x10]
01158 48894424f8                     mov        qword ptr [rsp - 8], rax
0115d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01161 89442418                       mov        dword ptr [rsp + 0x18], eax
01165 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0116a 48894424f8                     mov        qword ptr [rsp - 8], rax
0116f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01173 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01177 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117c 48894424f8                     mov        qword ptr [rsp - 8], rax
01181 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01185 89442420                       mov        dword ptr [rsp + 0x20], eax
01189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118e 48894424f8                     mov        qword ptr [rsp - 8], rax
01193 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01197 89442424                       mov        dword ptr [rsp + 0x24], eax
0119b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011a5 48ff742438                     push       qword ptr [rsp + 0x38]
011aa 488f442430                     pop        qword ptr [rsp + 0x30]
011af 48894424f8                     mov        qword ptr [rsp - 8], rax
011b4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011b8 89442438                       mov        dword ptr [rsp + 0x38], eax
011bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c1 48894424f8                     mov        qword ptr [rsp - 8], rax
011c6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011ca 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d3 48ff742448                     push       qword ptr [rsp + 0x48]
011d8 488f442440                     pop        qword ptr [rsp + 0x40]
011dd 48ff742450                     push       qword ptr [rsp + 0x50]
011e2 488f442448                     pop        qword ptr [rsp + 0x48]
011e7 48ff742458                     push       qword ptr [rsp + 0x58]
011ec 488f442450                     pop        qword ptr [rsp + 0x50]
011f1 48894424f8                     mov        qword ptr [rsp - 8], rax
011f6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
011fd 89442458                       mov        dword ptr [rsp + 0x58], eax
01201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01206 48894424f8                     mov        qword ptr [rsp - 8], rax
0120b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01212 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01216 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121b 48894424f8                     mov        qword ptr [rsp - 8], rax
01220 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01227 89442460                       mov        dword ptr [rsp + 0x60], eax
0122b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01230 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01238 488f442468                     pop        qword ptr [rsp + 0x68]
0123d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01245 488f442478                     pop        qword ptr [rsp + 0x78]
0124a 48894424f8                     mov        qword ptr [rsp - 8], rax
0124f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01256 89442464                       mov        dword ptr [rsp + 0x64], eax
0125a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125f 48894424f8                     mov        qword ptr [rsp - 8], rax
01264 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0126b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01272 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01277 48894424f8                     mov        qword ptr [rsp - 8], rax
0127c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01283 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0128a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128f 48894424f8                     mov        qword ptr [rsp - 8], rax
01294 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0129b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012af 488f842490000000               pop        qword ptr [rsp + 0x90]
012b7 48894424f8                     mov        qword ptr [rsp - 8], rax
012bc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012c3 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cf 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
012d7 e804d9b5ff                     call       0x7f4eaf9c3660
012dc 0f1f8400d4130009               nop        dword ptr [rax + rax + 0x90013d4]
012e4 be45ffffff                     mov        esi, 0xffffff45
012e9 48894424f8                     mov        qword ptr [rsp - 8], rax
012ee 8b442408                       mov        eax, dword ptr [rsp + 8]
012f2 890424                         mov        dword ptr [rsp], eax
012f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fa 48894424f8                     mov        qword ptr [rsp - 8], rax
012ff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01303 89442404                       mov        dword ptr [rsp + 4], eax
01307 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130c 48ff742410                     push       qword ptr [rsp + 0x10]
01311 488f442408                     pop        qword ptr [rsp + 8]
01316 48ff742418                     push       qword ptr [rsp + 0x18]
0131b 488f442410                     pop        qword ptr [rsp + 0x10]
01320 48894424f8                     mov        qword ptr [rsp - 8], rax
01325 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01329 89442418                       mov        dword ptr [rsp + 0x18], eax
0132d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01332 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01337 e8a4d8b5ff                     call       0x7f4eaf9c3660
0133c 0f1f84003414000a               nop        dword ptr [rax + rax + 0xa001434]
01344 be45ffffff                     mov        esi, 0xffffff45
01349 48894424f8                     mov        qword ptr [rsp - 8], rax
0134e 8b442408                       mov        eax, dword ptr [rsp + 8]
01352 890424                         mov        dword ptr [rsp], eax
01355 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135a 48894424f8                     mov        qword ptr [rsp - 8], rax
0135f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01363 89442404                       mov        dword ptr [rsp + 4], eax
01367 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136c 48ff742410                     push       qword ptr [rsp + 0x10]
01371 488f442408                     pop        qword ptr [rsp + 8]
01376 48ff742418                     push       qword ptr [rsp + 0x18]
0137b 488f442410                     pop        qword ptr [rsp + 0x10]
01380 48894424f8                     mov        qword ptr [rsp - 8], rax
01385 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01389 89442418                       mov        dword ptr [rsp + 0x18], eax
0138d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01392 48894424f8                     mov        qword ptr [rsp - 8], rax
01397 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0139b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0139f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a4 48894424f8                     mov        qword ptr [rsp - 8], rax
013a9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013ad 89442420                       mov        dword ptr [rsp + 0x20], eax
013b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b6 48894424f8                     mov        qword ptr [rsp - 8], rax
013bb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013bf 89442424                       mov        dword ptr [rsp + 0x24], eax
013c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013cd 48ff742438                     push       qword ptr [rsp + 0x38]
013d2 488f442430                     pop        qword ptr [rsp + 0x30]
013d7 48894424f8                     mov        qword ptr [rsp - 8], rax
013dc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
013e0 89442438                       mov        dword ptr [rsp + 0x38], eax
013e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
013f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fb 48ff742448                     push       qword ptr [rsp + 0x48]
01400 488f442440                     pop        qword ptr [rsp + 0x40]
01405 48ff742450                     push       qword ptr [rsp + 0x50]
0140a 488f442448                     pop        qword ptr [rsp + 0x48]
0140f 48ff742458                     push       qword ptr [rsp + 0x58]
01414 488f442450                     pop        qword ptr [rsp + 0x50]
01419 48894424f8                     mov        qword ptr [rsp - 8], rax
0141e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01425 89442458                       mov        dword ptr [rsp + 0x58], eax
01429 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142e 48894424f8                     mov        qword ptr [rsp - 8], rax
01433 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0143a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0143e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01443 48894424f8                     mov        qword ptr [rsp - 8], rax
01448 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0144f 89442460                       mov        dword ptr [rsp + 0x60], eax
01453 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01458 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01460 488f442468                     pop        qword ptr [rsp + 0x68]
01465 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0146d 488f442470                     pop        qword ptr [rsp + 0x70]
01472 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0147a 488f442478                     pop        qword ptr [rsp + 0x78]
0147f 48894424f8                     mov        qword ptr [rsp - 8], rax
01484 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0148b 89442464                       mov        dword ptr [rsp + 0x64], eax
0148f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01494 48894424f8                     mov        qword ptr [rsp - 8], rax
01499 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014a0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ac 48894424f8                     mov        qword ptr [rsp - 8], rax
014b1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014b8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c4 48894424f8                     mov        qword ptr [rsp - 8], rax
014c9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014d0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014dc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
014e4 488f842490000000               pop        qword ptr [rsp + 0x90]
014ec 48894424f8                     mov        qword ptr [rsp - 8], rax
014f1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
014f8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
014ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01504 666690                         nop        
01507 e8d4d6b5ff                     call       0x7f4eaf9c3660
0150c 0f1f84000416000b               nop        dword ptr [rax + rax + 0xb001604]
01514 be45ffffff                     mov        esi, 0xffffff45
01519 48894424f8                     mov        qword ptr [rsp - 8], rax
0151e 8b442408                       mov        eax, dword ptr [rsp + 8]
01522 890424                         mov        dword ptr [rsp], eax
01525 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152a 48894424f8                     mov        qword ptr [rsp - 8], rax
0152f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01533 89442404                       mov        dword ptr [rsp + 4], eax
01537 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153c 48ff742410                     push       qword ptr [rsp + 0x10]
01541 488f442408                     pop        qword ptr [rsp + 8]
01546 48ff742418                     push       qword ptr [rsp + 0x18]
0154b 488f442410                     pop        qword ptr [rsp + 0x10]
01550 48894424f8                     mov        qword ptr [rsp - 8], rax
01555 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01559 89442418                       mov        dword ptr [rsp + 0x18], eax
0155d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01562 48894424f8                     mov        qword ptr [rsp - 8], rax
01567 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0156b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0156f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01574 48894424f8                     mov        qword ptr [rsp - 8], rax
01579 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0157d 89442420                       mov        dword ptr [rsp + 0x20], eax
01581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0158f 89442424                       mov        dword ptr [rsp + 0x24], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0159d 48ff742438                     push       qword ptr [rsp + 0x38]
015a2 488f442430                     pop        qword ptr [rsp + 0x30]
015a7 48894424f8                     mov        qword ptr [rsp - 8], rax
015ac 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015b0 89442438                       mov        dword ptr [rsp + 0x38], eax
015b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b9 48894424f8                     mov        qword ptr [rsp - 8], rax
015be 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015c2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cb 48ff742448                     push       qword ptr [rsp + 0x48]
015d0 488f442440                     pop        qword ptr [rsp + 0x40]
015d5 48ff742450                     push       qword ptr [rsp + 0x50]
015da 488f442448                     pop        qword ptr [rsp + 0x48]
015df 48ff742458                     push       qword ptr [rsp + 0x58]
015e4 488f442450                     pop        qword ptr [rsp + 0x50]
015e9 48894424f8                     mov        qword ptr [rsp - 8], rax
015ee 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
015f5 89442458                       mov        dword ptr [rsp + 0x58], eax
015f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01603 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0160a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0160e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01613 48894424f8                     mov        qword ptr [rsp - 8], rax
01618 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0161f 89442460                       mov        dword ptr [rsp + 0x60], eax
01623 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01628 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01630 488f442468                     pop        qword ptr [rsp + 0x68]
01635 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0163d 488f442470                     pop        qword ptr [rsp + 0x70]
01642 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0164a 488f442478                     pop        qword ptr [rsp + 0x78]
0164f 48894424f8                     mov        qword ptr [rsp - 8], rax
01654 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0165b 89442464                       mov        dword ptr [rsp + 0x64], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01670 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167c 48894424f8                     mov        qword ptr [rsp - 8], rax
01681 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01688 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0168f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01694 48894424f8                     mov        qword ptr [rsp - 8], rax
01699 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016a0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ac 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016b4 488f842490000000               pop        qword ptr [rsp + 0x90]
016bc 48894424f8                     mov        qword ptr [rsp - 8], rax
016c1 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016c8 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d4 48894424f8                     mov        qword ptr [rsp - 8], rax
016d9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
016e0 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
016e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ec 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
016f4 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
016fc 666690                         nop        
016ff e8dcd4b5ff                     call       0x7f4eaf9c3660
01704 0f1f8400fc17000c               nop        dword ptr [rax + rax + 0xc0017fc]
0170c be45ffffff                     mov        esi, 0xffffff45
01711 48894424f8                     mov        qword ptr [rsp - 8], rax
01716 8b442408                       mov        eax, dword ptr [rsp + 8]
0171a 890424                         mov        dword ptr [rsp], eax
0171d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01722 48894424f8                     mov        qword ptr [rsp - 8], rax
01727 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0172b 89442404                       mov        dword ptr [rsp + 4], eax
0172f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01734 48ff742410                     push       qword ptr [rsp + 0x10]
01739 488f442408                     pop        qword ptr [rsp + 8]
0173e 48ff742418                     push       qword ptr [rsp + 0x18]
01743 488f442410                     pop        qword ptr [rsp + 0x10]
01748 48894424f8                     mov        qword ptr [rsp - 8], rax
0174d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01751 89442418                       mov        dword ptr [rsp + 0x18], eax
01755 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175a 48894424f8                     mov        qword ptr [rsp - 8], rax
0175f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01763 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01767 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01775 89442420                       mov        dword ptr [rsp + 0x20], eax
01779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177e 48894424f8                     mov        qword ptr [rsp - 8], rax
01783 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01787 89442424                       mov        dword ptr [rsp + 0x24], eax
0178b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01790 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01795 48ff742438                     push       qword ptr [rsp + 0x38]
0179a 488f442430                     pop        qword ptr [rsp + 0x30]
0179f 48894424f8                     mov        qword ptr [rsp - 8], rax
017a4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017a8 89442438                       mov        dword ptr [rsp + 0x38], eax
017ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b1 48894424f8                     mov        qword ptr [rsp - 8], rax
017b6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017ba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c3 48ff742448                     push       qword ptr [rsp + 0x48]
017c8 488f442440                     pop        qword ptr [rsp + 0x40]
017cd 48ff742450                     push       qword ptr [rsp + 0x50]
017d2 488f442448                     pop        qword ptr [rsp + 0x48]
017d7 48ff742458                     push       qword ptr [rsp + 0x58]
017dc 488f442450                     pop        qword ptr [rsp + 0x50]
017e1 48894424f8                     mov        qword ptr [rsp - 8], rax
017e6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
017ed 89442458                       mov        dword ptr [rsp + 0x58], eax
017f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f6 48894424f8                     mov        qword ptr [rsp - 8], rax
017fb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01802 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01806 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180b 48894424f8                     mov        qword ptr [rsp - 8], rax
01810 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01817 89442460                       mov        dword ptr [rsp + 0x60], eax
0181b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01820 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01828 488f442468                     pop        qword ptr [rsp + 0x68]
0182d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01835 488f442470                     pop        qword ptr [rsp + 0x70]
0183a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01842 488f442478                     pop        qword ptr [rsp + 0x78]
01847 48894424f8                     mov        qword ptr [rsp - 8], rax
0184c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01853 89442464                       mov        dword ptr [rsp + 0x64], eax
01857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01868 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0186f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01874 48894424f8                     mov        qword ptr [rsp - 8], rax
01879 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01880 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48894424f8                     mov        qword ptr [rsp - 8], rax
01891 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01898 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018ac 488f842490000000               pop        qword ptr [rsp + 0x90]
018b4 48894424f8                     mov        qword ptr [rsp - 8], rax
018b9 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018c0 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cc 48894424f8                     mov        qword ptr [rsp - 8], rax
018d1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018d8 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
018df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e4 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
018ec 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
018f3 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
018fb e8e0d2b5ff                     call       0x7f4eaf9c3660
01900 0f1f8400f819000d               nop        dword ptr [rax + rax + 0xd0019f8]
01908 be45ffffff                     mov        esi, 0xffffff45
0190d 48894424f8                     mov        qword ptr [rsp - 8], rax
01912 8b442408                       mov        eax, dword ptr [rsp + 8]
01916 890424                         mov        dword ptr [rsp], eax
01919 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191e 48894424f8                     mov        qword ptr [rsp - 8], rax
01923 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01927 89442404                       mov        dword ptr [rsp + 4], eax
0192b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01930 48ff742410                     push       qword ptr [rsp + 0x10]
01935 488f442408                     pop        qword ptr [rsp + 8]
0193a 48ff742418                     push       qword ptr [rsp + 0x18]
0193f 488f442410                     pop        qword ptr [rsp + 0x10]
01944 48894424f8                     mov        qword ptr [rsp - 8], rax
01949 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0194d 89442418                       mov        dword ptr [rsp + 0x18], eax
01951 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01956 48894424f8                     mov        qword ptr [rsp - 8], rax
0195b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0195f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01963 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01968 48894424f8                     mov        qword ptr [rsp - 8], rax
0196d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01971 89442420                       mov        dword ptr [rsp + 0x20], eax
01975 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197a 48894424f8                     mov        qword ptr [rsp - 8], rax
0197f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01983 89442424                       mov        dword ptr [rsp + 0x24], eax
01987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01991 48ff742438                     push       qword ptr [rsp + 0x38]
01996 488f442430                     pop        qword ptr [rsp + 0x30]
0199b 48894424f8                     mov        qword ptr [rsp - 8], rax
019a0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019a4 89442438                       mov        dword ptr [rsp + 0x38], eax
019a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ad 48894424f8                     mov        qword ptr [rsp - 8], rax
019b2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019b6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019bf 48ff742448                     push       qword ptr [rsp + 0x48]
019c4 488f442440                     pop        qword ptr [rsp + 0x40]
019c9 48ff742450                     push       qword ptr [rsp + 0x50]
019ce 488f442448                     pop        qword ptr [rsp + 0x48]
019d3 48ff742458                     push       qword ptr [rsp + 0x58]
019d8 488f442450                     pop        qword ptr [rsp + 0x50]
019dd 48894424f8                     mov        qword ptr [rsp - 8], rax
019e2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
019e9 89442458                       mov        dword ptr [rsp + 0x58], eax
019ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f2 48894424f8                     mov        qword ptr [rsp - 8], rax
019f7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
019fe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a07 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a13 89442460                       mov        dword ptr [rsp + 0x60], eax
01a17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a24 488f442468                     pop        qword ptr [rsp + 0x68]
01a29 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a31 488f442478                     pop        qword ptr [rsp + 0x78]
01a36 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a42 89442464                       mov        dword ptr [rsp + 0x64], eax
01a46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a50 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a57 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a63 48894424f8                     mov        qword ptr [rsp - 8], rax
01a68 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a6f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a80 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01a87 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01a9b 488f842490000000               pop        qword ptr [rsp + 0x90]
01aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa8 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01aaf 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abb 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ac3 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01aca 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01ad1 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01ad9 6690                           nop        
01adb e800d1b5ff                     call       0x7f4eaf9c3660
01ae0 0f1f8400d81b000e               nop        dword ptr [rax + rax + 0xe001bd8]
01ae8 be45ffffff                     mov        esi, 0xffffff45
01aed b9ffffff7f                     mov        ecx, 0x7fffffff
01af2 4c3bc9                         cmp        r9, rcx
01af5 bdffffffff                     mov        ebp, 0xffffffff
01afa 7c08                           jl         0x7f4eafe66584
01afc 400f95c5                       setne      bpl
01b00 400fb6ed                       movzx      ebp, bpl
01b04 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b09 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b15 89442460                       mov        dword ptr [rsp + 0x60], eax
01b19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b23 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b2a 89442464                       mov        dword ptr [rsp + 0x64], eax
01b2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b33 48894424f8                     mov        qword ptr [rsp - 8], rax
01b38 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b3f 89442468                       mov        dword ptr [rsp + 0x68], eax
01b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b48 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01b50 48894424f8                     mov        qword ptr [rsp - 8], rax
01b55 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b5c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b65 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6a 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b71 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b82 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b89 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01b90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b95 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9a 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ba1 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bad 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bb5 488f842498000000               pop        qword ptr [rsp + 0x98]
01bbd 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bc5 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01bcd 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bd9 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01be0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01bed 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01bf5 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01bfd 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c05 6690                           nop        
01c07 e8d4cfb5ff                     call       0x7f4eaf9c3660
01c0c 0f1f8400041d000f               nop        dword ptr [rax + rax + 0xf001d04]
01c14 be45ffffff                     mov        esi, 0xffffff45
01c19 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1e 8b442408                       mov        eax, dword ptr [rsp + 8]
01c22 890424                         mov        dword ptr [rsp], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c33 89442404                       mov        dword ptr [rsp + 4], eax
01c37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3c 48ff742410                     push       qword ptr [rsp + 0x10]
01c41 488f442408                     pop        qword ptr [rsp + 8]
01c46 48ff742418                     push       qword ptr [rsp + 0x18]
01c4b 488f442410                     pop        qword ptr [rsp + 0x10]
01c50 48894424f8                     mov        qword ptr [rsp - 8], rax
01c55 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c59 89442418                       mov        dword ptr [rsp + 0x18], eax
01c5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c62 48894424f8                     mov        qword ptr [rsp - 8], rax
01c67 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c6b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c74 48894424f8                     mov        qword ptr [rsp - 8], rax
01c79 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c7d 89442420                       mov        dword ptr [rsp + 0x20], eax
01c81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c86 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01c8f 89442424                       mov        dword ptr [rsp + 0x24], eax
01c93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c98 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01c9d 48ff742438                     push       qword ptr [rsp + 0x38]
01ca2 488f442430                     pop        qword ptr [rsp + 0x30]
01ca7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cac 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01cb0 89442438                       mov        dword ptr [rsp + 0x38], eax
01cb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cc2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cc6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccb 48ff742448                     push       qword ptr [rsp + 0x48]
01cd0 488f442440                     pop        qword ptr [rsp + 0x40]
01cd5 48ff742450                     push       qword ptr [rsp + 0x50]
01cda 488f442448                     pop        qword ptr [rsp + 0x48]
01cdf 48ff742458                     push       qword ptr [rsp + 0x58]
01ce4 488f442450                     pop        qword ptr [rsp + 0x50]
01ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cee 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01cf5 89442458                       mov        dword ptr [rsp + 0x58], eax
01cf9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01d03 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d0a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d13 48894424f8                     mov        qword ptr [rsp - 8], rax
01d18 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d1f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d28 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01d2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d32 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d39 89442464                       mov        dword ptr [rsp + 0x64], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d4e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d66 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01d7e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01d92 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01d9a 90                             nop        
01d9b e840ceb5ff                     call       0x7f4eaf9c3660
01da0 0f1f8400981e0010               nop        dword ptr [rax + rax + 0x10001e98]
01da8 be45ffffff                     mov        esi, 0xffffff45
01dad 48894424f8                     mov        qword ptr [rsp - 8], rax
01db2 8b442408                       mov        eax, dword ptr [rsp + 8]
01db6 890424                         mov        dword ptr [rsp], eax
01db9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01dc7 89442404                       mov        dword ptr [rsp + 4], eax
01dcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd0 48ff742410                     push       qword ptr [rsp + 0x10]
01dd5 488f442408                     pop        qword ptr [rsp + 8]
01dda 48ff742418                     push       qword ptr [rsp + 0x18]
01ddf 488f442410                     pop        qword ptr [rsp + 0x10]
01de4 48894424f8                     mov        qword ptr [rsp - 8], rax
01de9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01ded 89442418                       mov        dword ptr [rsp + 0x18], eax
01df1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01dff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e08 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e11 89442420                       mov        dword ptr [rsp + 0x20], eax
01e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e23 89442424                       mov        dword ptr [rsp + 0x24], eax
01e27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e31 48ff742438                     push       qword ptr [rsp + 0x38]
01e36 488f442430                     pop        qword ptr [rsp + 0x30]
01e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e40 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e44 89442438                       mov        dword ptr [rsp + 0x38], eax
01e48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e52 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e56 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5f 48ff742448                     push       qword ptr [rsp + 0x48]
01e64 488f442440                     pop        qword ptr [rsp + 0x40]
01e69 48ff742450                     push       qword ptr [rsp + 0x50]
01e6e 488f442448                     pop        qword ptr [rsp + 0x48]
01e73 48ff742458                     push       qword ptr [rsp + 0x58]
01e78 488f442450                     pop        qword ptr [rsp + 0x50]
01e7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e82 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e89 89442458                       mov        dword ptr [rsp + 0x58], eax
01e8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e92 48894424f8                     mov        qword ptr [rsp - 8], rax
01e97 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e9e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ea2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea7 48894424f8                     mov        qword ptr [rsp - 8], rax
01eac 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01eb3 89442460                       mov        dword ptr [rsp + 0x60], eax
01eb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebc 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ec1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ecd 89442464                       mov        dword ptr [rsp + 0x64], eax
01ed1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed6 48894424f8                     mov        qword ptr [rsp - 8], rax
01edb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ee2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01ee9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01efa 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f12 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f26 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01f2e 90                             nop        
01f2f e8acccb5ff                     call       0x7f4eaf9c3660
01f34 0f1f84002c200011               nop        dword ptr [rax + rax + 0x1100202c]
01f3c be3dffffff                     mov        esi, 0xffffff3d
01f41 48894424f8                     mov        qword ptr [rsp - 8], rax
01f46 8b442408                       mov        eax, dword ptr [rsp + 8]
01f4a 890424                         mov        dword ptr [rsp], eax
01f4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f52 48894424f8                     mov        qword ptr [rsp - 8], rax
01f57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f5b 89442404                       mov        dword ptr [rsp + 4], eax
01f5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f64 48ff742410                     push       qword ptr [rsp + 0x10]
01f69 488f442408                     pop        qword ptr [rsp + 8]
01f6e 48ff742418                     push       qword ptr [rsp + 0x18]
01f73 488f442410                     pop        qword ptr [rsp + 0x10]
01f78 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f81 89442418                       mov        dword ptr [rsp + 0x18], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fa5 89442420                       mov        dword ptr [rsp + 0x20], eax
01fa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fae 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fb7 89442424                       mov        dword ptr [rsp + 0x24], eax
01fbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01fc5 48ff742438                     push       qword ptr [rsp + 0x38]
01fca 488f442430                     pop        qword ptr [rsp + 0x30]
01fcf 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01fd8 89442438                       mov        dword ptr [rsp + 0x38], eax
01fdc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01fea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff3 48ff742448                     push       qword ptr [rsp + 0x48]
01ff8 488f442440                     pop        qword ptr [rsp + 0x40]
01ffd 48ff742450                     push       qword ptr [rsp + 0x50]
02002 488f442448                     pop        qword ptr [rsp + 0x48]
02007 48ff742458                     push       qword ptr [rsp + 0x58]
0200c 488f442450                     pop        qword ptr [rsp + 0x50]
02011 48894424f8                     mov        qword ptr [rsp - 8], rax
02016 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0201d 89442458                       mov        dword ptr [rsp + 0x58], eax
02021 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02026 48894424f8                     mov        qword ptr [rsp - 8], rax
0202b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02032 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203b 48894424f8                     mov        qword ptr [rsp - 8], rax
02040 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02047 89442460                       mov        dword ptr [rsp + 0x60], eax
0204b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02050 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02055 48894424f8                     mov        qword ptr [rsp - 8], rax
0205a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02061 89442464                       mov        dword ptr [rsp + 0x64], eax
02065 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206a 48894424f8                     mov        qword ptr [rsp - 8], rax
0206f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02076 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0207d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02082 48894424f8                     mov        qword ptr [rsp - 8], rax
02087 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0208e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02095 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209a 48894424f8                     mov        qword ptr [rsp - 8], rax
0209f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020a6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020ba 488f842490000000               pop        qword ptr [rsp + 0x90]
020c2 48894424f8                     mov        qword ptr [rsp - 8], rax
020c7 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
020ce 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
020d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020da 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
020e2 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
020ea 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
020f2 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
020fa 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02102 48894424f8                     mov        qword ptr [rsp - 8], rax
02107 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0210e 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02115 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02122 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0212a 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02132 90                             nop        
02133 e8a8cab5ff                     call       0x7f4eaf9c3660
02138 0f1f840030220012               nop        dword ptr [rax + rax + 0x12002230]
02140 be45ffffff                     mov        esi, 0xffffff45
02145 48894424f8                     mov        qword ptr [rsp - 8], rax
0214a 8b442408                       mov        eax, dword ptr [rsp + 8]
0214e 890424                         mov        dword ptr [rsp], eax
02151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02156 48894424f8                     mov        qword ptr [rsp - 8], rax
0215b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0215f 89442404                       mov        dword ptr [rsp + 4], eax
02163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02168 48ff742410                     push       qword ptr [rsp + 0x10]
0216d 488f442408                     pop        qword ptr [rsp + 8]
02172 48ff742418                     push       qword ptr [rsp + 0x18]
02177 488f442410                     pop        qword ptr [rsp + 0x10]
0217c 48894424f8                     mov        qword ptr [rsp - 8], rax
02181 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02185 89442418                       mov        dword ptr [rsp + 0x18], eax
02189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218e 48894424f8                     mov        qword ptr [rsp - 8], rax
02193 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02197 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0219b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a0 48894424f8                     mov        qword ptr [rsp - 8], rax
021a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021a9 89442420                       mov        dword ptr [rsp + 0x20], eax
021ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b2 48894424f8                     mov        qword ptr [rsp - 8], rax
021b7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021bb 89442424                       mov        dword ptr [rsp + 0x24], eax
021bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
021c9 48ff742438                     push       qword ptr [rsp + 0x38]
021ce 488f442430                     pop        qword ptr [rsp + 0x30]
021d3 48894424f8                     mov        qword ptr [rsp - 8], rax
021d8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021dc 89442438                       mov        dword ptr [rsp + 0x38], eax
021e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e5 48894424f8                     mov        qword ptr [rsp - 8], rax
021ea 8b442444                       mov        eax, dword ptr [rsp + 0x44]
021ee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
021f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f7 48ff742448                     push       qword ptr [rsp + 0x48]
021fc 488f442440                     pop        qword ptr [rsp + 0x40]
02201 48ff742450                     push       qword ptr [rsp + 0x50]
02206 488f442448                     pop        qword ptr [rsp + 0x48]
0220b 48ff742458                     push       qword ptr [rsp + 0x58]
02210 488f442450                     pop        qword ptr [rsp + 0x50]
02215 48894424f8                     mov        qword ptr [rsp - 8], rax
0221a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02221 89442458                       mov        dword ptr [rsp + 0x58], eax
02225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222a 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02232 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0223a 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02242 90                             nop        
02243 e898c9b5ff                     call       0x7f4eaf9c3660
02248 0f1f840040230013               nop        dword ptr [rax + rax + 0x13002340]
02250 be45ffffff                     mov        esi, 0xffffff45
02255 48894424f8                     mov        qword ptr [rsp - 8], rax
0225a 8b442408                       mov        eax, dword ptr [rsp + 8]
0225e 890424                         mov        dword ptr [rsp], eax
02261 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02266 48894424f8                     mov        qword ptr [rsp - 8], rax
0226b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0226f 89442404                       mov        dword ptr [rsp + 4], eax
02273 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02278 48ff742410                     push       qword ptr [rsp + 0x10]
0227d 488f442408                     pop        qword ptr [rsp + 8]
02282 48ff742418                     push       qword ptr [rsp + 0x18]
02287 488f442410                     pop        qword ptr [rsp + 0x10]
0228c 48894424f8                     mov        qword ptr [rsp - 8], rax
02291 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02295 89442418                       mov        dword ptr [rsp + 0x18], eax
02299 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229e 48894424f8                     mov        qword ptr [rsp - 8], rax
022a3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022a7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b0 48894424f8                     mov        qword ptr [rsp - 8], rax
022b5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022b9 89442420                       mov        dword ptr [rsp + 0x20], eax
022bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c2 48894424f8                     mov        qword ptr [rsp - 8], rax
022c7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022cb 89442424                       mov        dword ptr [rsp + 0x24], eax
022cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
022d9 48ff742438                     push       qword ptr [rsp + 0x38]
022de 488f442430                     pop        qword ptr [rsp + 0x30]
022e3 48894424f8                     mov        qword ptr [rsp - 8], rax
022e8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022ec 89442438                       mov        dword ptr [rsp + 0x38], eax
022f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f5 48894424f8                     mov        qword ptr [rsp - 8], rax
022fa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
022fe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02302 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02307 48ff742448                     push       qword ptr [rsp + 0x48]
0230c 488f442440                     pop        qword ptr [rsp + 0x40]
02311 48ff742450                     push       qword ptr [rsp + 0x50]
02316 488f442448                     pop        qword ptr [rsp + 0x48]
0231b 48ff742458                     push       qword ptr [rsp + 0x58]
02320 488f442450                     pop        qword ptr [rsp + 0x50]
02325 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0232d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02335 6690                           nop        
02337 e8a4c8b5ff                     call       0x7f4eaf9c3660
0233c 0f1f840034240014               nop        dword ptr [rax + rax + 0x14002434]
02344 be45ffffff                     mov        esi, 0xffffff45
02349 48894424f8                     mov        qword ptr [rsp - 8], rax
0234e 8b442408                       mov        eax, dword ptr [rsp + 8]
02352 890424                         mov        dword ptr [rsp], eax
02355 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235a 48894424f8                     mov        qword ptr [rsp - 8], rax
0235f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02363 89442404                       mov        dword ptr [rsp + 4], eax
02367 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236c 48ff742410                     push       qword ptr [rsp + 0x10]
02371 488f442408                     pop        qword ptr [rsp + 8]
02376 48ff742418                     push       qword ptr [rsp + 0x18]
0237b 488f442410                     pop        qword ptr [rsp + 0x10]
02380 48894424f8                     mov        qword ptr [rsp - 8], rax
02385 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02389 89442418                       mov        dword ptr [rsp + 0x18], eax
0238d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02392 48894424f8                     mov        qword ptr [rsp - 8], rax
02397 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0239b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0239f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a4 48894424f8                     mov        qword ptr [rsp - 8], rax
023a9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023ad 89442420                       mov        dword ptr [rsp + 0x20], eax
023b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b6 48894424f8                     mov        qword ptr [rsp - 8], rax
023bb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023bf 89442424                       mov        dword ptr [rsp + 0x24], eax
023c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
023cd 48ff742438                     push       qword ptr [rsp + 0x38]
023d2 488f442430                     pop        qword ptr [rsp + 0x30]
023d7 48894424f8                     mov        qword ptr [rsp - 8], rax
023dc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023e0 89442438                       mov        dword ptr [rsp + 0x38], eax
023e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e9 48894424f8                     mov        qword ptr [rsp - 8], rax
023ee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fb 48ff742448                     push       qword ptr [rsp + 0x48]
02400 488f442440                     pop        qword ptr [rsp + 0x40]
02405 48ff742450                     push       qword ptr [rsp + 0x50]
0240a 488f442448                     pop        qword ptr [rsp + 0x48]
0240f 48ff742458                     push       qword ptr [rsp + 0x58]
02414 488f442450                     pop        qword ptr [rsp + 0x50]
02419 48894424f8                     mov        qword ptr [rsp - 8], rax
0241e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02425 89442458                       mov        dword ptr [rsp + 0x58], eax
02429 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242e 48894424f8                     mov        qword ptr [rsp - 8], rax
02433 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0243a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0243e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02443 48894424f8                     mov        qword ptr [rsp - 8], rax
02448 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0244f 89442460                       mov        dword ptr [rsp + 0x60], eax
02453 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02458 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02460 488f442468                     pop        qword ptr [rsp + 0x68]
02465 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0246d 488f442470                     pop        qword ptr [rsp + 0x70]
02472 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0247a 488f442478                     pop        qword ptr [rsp + 0x78]
0247f 48894424f8                     mov        qword ptr [rsp - 8], rax
02484 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0248b 89442464                       mov        dword ptr [rsp + 0x64], eax
0248f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02494 48894424f8                     mov        qword ptr [rsp - 8], rax
02499 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024a0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ac 48894424f8                     mov        qword ptr [rsp - 8], rax
024b1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024b8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c4 48894424f8                     mov        qword ptr [rsp - 8], rax
024c9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024d0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024dc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
024e4 488f842490000000               pop        qword ptr [rsp + 0x90]
024ec 48894424f8                     mov        qword ptr [rsp - 8], rax
024f1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
024f8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
024ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02504 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0250c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02514 666690                         nop        
02517 e8c4c6b5ff                     call       0x7f4eaf9c3660
0251c 0f1f840014260015               nop        dword ptr [rax + rax + 0x15002614]
02524 be45ffffff                     mov        esi, 0xffffff45
02529 48894424f8                     mov        qword ptr [rsp - 8], rax
0252e 8b442408                       mov        eax, dword ptr [rsp + 8]
02532 890424                         mov        dword ptr [rsp], eax
02535 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253a 48894424f8                     mov        qword ptr [rsp - 8], rax
0253f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02543 89442404                       mov        dword ptr [rsp + 4], eax
02547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254c 48ff742410                     push       qword ptr [rsp + 0x10]
02551 488f442408                     pop        qword ptr [rsp + 8]
02556 48ff742418                     push       qword ptr [rsp + 0x18]
0255b 488f442410                     pop        qword ptr [rsp + 0x10]
02560 48894424f8                     mov        qword ptr [rsp - 8], rax
02565 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02569 89442418                       mov        dword ptr [rsp + 0x18], eax
0256d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02572 48894424f8                     mov        qword ptr [rsp - 8], rax
02577 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0257b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0257f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02584 48894424f8                     mov        qword ptr [rsp - 8], rax
02589 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0258d 89442420                       mov        dword ptr [rsp + 0x20], eax
02591 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02596 48894424f8                     mov        qword ptr [rsp - 8], rax
0259b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0259f 89442424                       mov        dword ptr [rsp + 0x24], eax
025a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a8 48ff742438                     push       qword ptr [rsp + 0x38]
025ad 488f442430                     pop        qword ptr [rsp + 0x30]
025b2 48894424f8                     mov        qword ptr [rsp - 8], rax
025b7 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025bb 89442438                       mov        dword ptr [rsp + 0x38], eax
025bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c4 48894424f8                     mov        qword ptr [rsp - 8], rax
025c9 8b442444                       mov        eax, dword ptr [rsp + 0x44]
025cd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d6 48ff742448                     push       qword ptr [rsp + 0x48]
025db 488f442440                     pop        qword ptr [rsp + 0x40]
025e0 48ff742450                     push       qword ptr [rsp + 0x50]
025e5 488f442448                     pop        qword ptr [rsp + 0x48]
025ea 48ff742458                     push       qword ptr [rsp + 0x58]
025ef 488f442450                     pop        qword ptr [rsp + 0x50]
025f4 48894424f8                     mov        qword ptr [rsp - 8], rax
025f9 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02600 89442458                       mov        dword ptr [rsp + 0x58], eax
02604 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02609 48894424f8                     mov        qword ptr [rsp - 8], rax
0260e 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02615 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02619 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261e 48894424f8                     mov        qword ptr [rsp - 8], rax
02623 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0262a 89442460                       mov        dword ptr [rsp + 0x60], eax
0262e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02633 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0263b 488f442468                     pop        qword ptr [rsp + 0x68]
02640 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02648 488f442470                     pop        qword ptr [rsp + 0x70]
0264d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02655 488f442478                     pop        qword ptr [rsp + 0x78]
0265a 48894424f8                     mov        qword ptr [rsp - 8], rax
0265f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02666 89442464                       mov        dword ptr [rsp + 0x64], eax
0266a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266f 48894424f8                     mov        qword ptr [rsp - 8], rax
02674 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0267b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02682 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02687 48894424f8                     mov        qword ptr [rsp - 8], rax
0268c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02693 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0269a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269f 48894424f8                     mov        qword ptr [rsp - 8], rax
026a4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
026ab 89842488000000                 mov        dword ptr [rsp + 0x88], eax
026b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026bf 488f842490000000               pop        qword ptr [rsp + 0x90]
026c7 48894424f8                     mov        qword ptr [rsp - 8], rax
026cc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
026d3 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
026da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026df 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
026e7 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
026ef 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
026f7 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
026ff e8dcc4b5ff                     call       0x7f4eaf9c3660
02704 0f1f8400fc270016               nop        dword ptr [rax + rax + 0x160027fc]
0270c 4533d2                         xor        r10d, r10d
0270f 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
02717 e9b2daffff                     jmp        0x7f4eafe64c4e
0271c 4533d2                         xor        r10d, r10d
0271f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02724 e9d1daffff                     jmp        0x7f4eafe64c7a
02729 4533d2                         xor        r10d, r10d
0272c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02731 e9ebdaffff                     jmp        0x7f4eafe64ca1
02736 4533d2                         xor        r10d, r10d
02739 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0273e e90adbffff                     jmp        0x7f4eafe64ccd
02743 4533d2                         xor        r10d, r10d
02746 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0274b e927dbffff                     jmp        0x7f4eafe64cf7
02750 4533d2                         xor        r10d, r10d
02753 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02758 e94cdbffff                     jmp        0x7f4eafe64d29
0275d 4533d2                         xor        r10d, r10d
02760 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02768 e969dbffff                     jmp        0x7f4eafe64d56
0276d 4533d2                         xor        r10d, r10d
02770 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02778 e97fdbffff                     jmp        0x7f4eafe64d7c
0277d bebeffffff                     mov        esi, 0xffffffbe
02782 48894424f8                     mov        qword ptr [rsp - 8], rax
02787 8b442408                       mov        eax, dword ptr [rsp + 8]
0278b 890424                         mov        dword ptr [rsp], eax
0278e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02793 48894424f8                     mov        qword ptr [rsp - 8], rax
02798 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0279c 89442404                       mov        dword ptr [rsp + 4], eax
027a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a5 48ff742410                     push       qword ptr [rsp + 0x10]
027aa 488f442408                     pop        qword ptr [rsp + 8]
027af 48ff742418                     push       qword ptr [rsp + 0x18]
027b4 488f442410                     pop        qword ptr [rsp + 0x10]
027b9 48894424f8                     mov        qword ptr [rsp - 8], rax
027be 8b442420                       mov        eax, dword ptr [rsp + 0x20]
027c2 89442418                       mov        dword ptr [rsp + 0x18], eax
027c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cb 48894424f8                     mov        qword ptr [rsp - 8], rax
027d0 8b442424                       mov        eax, dword ptr [rsp + 0x24]
027d4 8944241c                       mov        dword ptr [rsp + 0x1c], eax
027d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027dd 48894424f8                     mov        qword ptr [rsp - 8], rax
027e2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027e6 89442420                       mov        dword ptr [rsp + 0x20], eax
027ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ef 48894424f8                     mov        qword ptr [rsp - 8], rax
027f4 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
027f8 89442424                       mov        dword ptr [rsp + 0x24], eax
027fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02801 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02806 48ff742438                     push       qword ptr [rsp + 0x38]
0280b 488f442430                     pop        qword ptr [rsp + 0x30]
02810 48894424f8                     mov        qword ptr [rsp - 8], rax
02815 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02819 89442438                       mov        dword ptr [rsp + 0x38], eax
0281d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02822 48894424f8                     mov        qword ptr [rsp - 8], rax
02827 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0282b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0282f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02834 48ff742448                     push       qword ptr [rsp + 0x48]
02839 488f442440                     pop        qword ptr [rsp + 0x40]
0283e 48ff742450                     push       qword ptr [rsp + 0x50]
02843 488f442448                     pop        qword ptr [rsp + 0x48]
02848 48ff742458                     push       qword ptr [rsp + 0x58]
0284d 488f442450                     pop        qword ptr [rsp + 0x50]
02852 90                             nop        
02853 e888c3b5ff                     call       0x7f4eaf9c3660
02858 0f1f840050290017               nop        dword ptr [rax + rax + 0x17002950]
02860 be85ffffff                     mov        esi, 0xffffff85
02865 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02869 48894424f8                     mov        qword ptr [rsp - 8], rax
0286e 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02872 890424                         mov        dword ptr [rsp], eax
02875 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0287a 48894424f8                     mov        qword ptr [rsp - 8], rax
0287f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02883 89442404                       mov        dword ptr [rsp + 4], eax
02887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0288c 48894424f8                     mov        qword ptr [rsp - 8], rax
02891 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02895 89442408                       mov        dword ptr [rsp + 8], eax
02899 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289e 48894424f8                     mov        qword ptr [rsp - 8], rax
028a3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028a7 8944240c                       mov        dword ptr [rsp + 0xc], eax
028ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b0 48894424f8                     mov        qword ptr [rsp - 8], rax
028b5 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
028b9 89442410                       mov        dword ptr [rsp + 0x10], eax
028bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c2 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
028c7 48ff742438                     push       qword ptr [rsp + 0x38]
028cc 488f442420                     pop        qword ptr [rsp + 0x20]
028d1 48894424f8                     mov        qword ptr [rsp - 8], rax
028d6 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028da 89442414                       mov        dword ptr [rsp + 0x14], eax
028de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e3 48894424f8                     mov        qword ptr [rsp - 8], rax
028e8 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028ec 89442428                       mov        dword ptr [rsp + 0x28], eax
028f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f5 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
028fa 90                             nop        
028fb e8e0c2b5ff                     call       0x7f4eaf9c3660
02900 0f1f8400f8290018               nop        dword ptr [rax + rax + 0x180029f8]
02908 bef6ffffff                     mov        esi, 0xfffffff6
0290d 6690                           nop        
0290f e8ccc2b5ff                     call       0x7f4eaf9c3660
02914 0f1f84000c2a0019               nop        dword ptr [rax + rax + 0x19002a0c]
0291c be5d000000                     mov        esi, 0x5d
02921 6690                           nop        
02923 e8b8c2b5ff                     call       0x7f4eaf9c3660
02928 0f1f8400202a001a               nop        dword ptr [rax + rax + 0x1a002a20]
02930 bef6ffffff                     mov        esi, 0xfffffff6
02935 418beb                         mov        ebp, r11d
02938 666690                         nop        
0293b e8a0c2b5ff                     call       0x7f4eaf9c3660
02940 0f1f8400382a001b               nop        dword ptr [rax + rax + 0x1b002a38]
02948 bef6ffffff                     mov        esi, 0xfffffff6
0294d 8be9                           mov        ebp, ecx
0294f e88cc2b5ff                     call       0x7f4eaf9c3660
02954 0f1f84004c2a001c               nop        dword ptr [rax + rax + 0x1c002a4c]
0295c bef6ffffff                     mov        esi, 0xfffffff6
02961 418beb                         mov        ebp, r11d
02964 666690                         nop        
02967 e874c2b5ff                     call       0x7f4eaf9c3660
0296c 0f1f8400642a001d               nop        dword ptr [rax + rax + 0x1d002a64]
02974 eb00                           jmp        0x7f4eafe673f6
02976 488bf0                         mov        rsi, rax
02979 e9f2e0ffff                     jmp        0x7f4eafe654f0
0297e 49ba1855e6af4e7f0000           movabs     r10, 0x7f4eafe65518
02988 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0298f e9cc6aa9ff                     jmp        0x7f4eaf8fdee0
02994 e88736a8ff                     call       0x7f4eaf8eaaa0
02999 e990d6ffff                     jmp        0x7f4eafe64aae
0299e f4                             hlt        
0299f f4                             hlt        
