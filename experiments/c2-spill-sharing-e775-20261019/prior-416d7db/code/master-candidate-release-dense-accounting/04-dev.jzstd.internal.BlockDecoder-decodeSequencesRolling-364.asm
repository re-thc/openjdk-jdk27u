00000 e83bf8a315                     call       0x7f2229899340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f856e290000                   jne        0x7f2213e5c49c
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
0018f 49ba80fa9729227f0000           movabs     r10, 0x7f222997fa80
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f8462250000                   je         0x7f2213e5c214
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fb05010000                 cmp        r11d, 0x105
001c0 0f85a2260000                   jne        0x7f2213e5c368
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8448250000                   je         0x7f2213e5c224
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16040000                 cmp        r10d, 0x416
001ea 0f8578260000                   jne        0x7f2213e5c368
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8429250000                   je         0x7f2213e5c231
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a040000                 cmp        r11d, 0x40a
00216 0f854c260000                   jne        0x7f2213e5c368
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f840f250000                   je         0x7f2213e5c23e
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d040000                 cmp        r10d, 0x40d
0023d 0f8525260000                   jne        0x7f2213e5c368
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f84ed240000                   je         0x7f2213e5c24b
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d040000                 cmp        r11d, 0x40d
0026c 0f85f6250000                   jne        0x7f2213e5c368
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f84d0240000                   je         0x7f2213e5c258
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d040000                 cmp        r10d, 0x40d
00296 0f85cc250000                   jne        0x7f2213e5c368
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84ab240000                   je         0x7f2213e5c265
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fb08010000                 cmp        r11d, 0x108
002c8 0f859a250000                   jne        0x7f2213e5c368
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f8496240000                   je         0x7f2213e5c275
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fa07010000                 cmp        r10d, 0x107
002ee 0f8574250000                   jne        0x7f2213e5c368
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f847b240000                   je         0x7f2213e5c285
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f846d240000                   je         0x7f2213e5c285
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f845f240000                   je         0x7f2213e5c285
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00341 458d53f9                       lea        r10d, [r11 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8c37240000                   jl         0x7f2213e5c285
0034e 4183c3f9                       add        r11d, -7
00352 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0035a e965020000                     jmp        0x7f2213e5a0c4
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
0039a 0f8dbc0f0000                   jge        0x7f2213e5ae5c
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d59110000                   jge        0x7f2213e5b02c
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d28130000                   jge        0x7f2213e5b224
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8dfb140000                   jge        0x7f2213e5b420
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
00478 0f8e8e0b0000                   jle        0x7f2213e5ab0c
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f75160000                   jg         0x7f2213e5b600
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8f94170000                   jg         0x7f2213e5b72c
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f1b190000                   jg         0x7f2213e5b8c0
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f839f1a0000                   jae        0x7f2213e5ba54
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f8365090000                   jae        0x7f2213e5a940
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db8000000                   jge        0x7f2213e5a0b6
004fe 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00512 49c1e830                       shr        r8, 0x30
00516 458bdb                         mov        r11d, r11d
00519 418bf8                         mov        edi, r8d
0051c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00524 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
0052c c44233f7c2                     shrx       r8d, r10d, r9d
00531 4103f8                         add        edi, r8d
00534 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
0053b 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00543 c44233f7ca                     shrx       r9d, r10d, r9d
00548 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054f 83f920                         cmp        ecx, 0x20
00552 0f8d001c0000                   jge        0x7f2213e5bc58
00558 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00560 49c1e830                       shr        r8, 0x30
00564 458bc0                         mov        r8d, r8d
00567 bf01000000                     mov        edi, 1
0056c c4e271f7ff                     shlx       edi, edi, ecx
00571 ffcf                           dec        edi
00573 4123f9                         and        edi, r9d
00576 4103fb                         add        edi, r11d
00579 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00580 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00588 4183fb20                       cmp        r11d, 0x20
0058c 0f8dc61c0000                   jge        0x7f2213e5bd58
00592 41bb01000000                   mov        r11d, 1
00598 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
005a0 c44231f7cb                     shlx       r9d, r11d, r9d
005a5 41ffc9                         dec        r9d
005a8 4523ca                         and        r9d, r10d
005ab 4503c8                         add        r9d, r8d
005ae 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
005b6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005ba 418502                         test       dword ptr [r10], eax
005bd 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c4 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005cc 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005d1 0f8d73040000                   jge        0x7f2213e5a54a
005d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005dc 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e8 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f0 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f4 453bd9                         cmp        r11d, r9d
005f7 0f83ed040000                   jae        0x7f2213e5a5ea
005fd 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00602 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00606 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
0060d 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00614 458b4104                       mov        r8d, dword ptr [r9 + 4]
00618 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0061d 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00625 413bc8                         cmp        ecx, r8d
00628 0f83ae050000                   jae        0x7f2213e5a6dc
0062e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00633 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00637 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063f 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00647 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064b 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00650 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00658 453bd8                         cmp        r11d, r8d
0065b 0f8397060000                   jae        0x7f2213e5a7f8
00661 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00666 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066e 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00675 ffc5                           inc        ebp
00677 896c2404                       mov        dword ptr [rsp + 4], ebp
0067b 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067f 0f8d36040000                   jge        0x7f2213e5a5bb
00685 49c1ea28                       shr        r10, 0x28
00689 458bda                         mov        r11d, r10d
0068c 450fb6db                       movzx      r11d, r11b
00690 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00698 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a0 49c1ea28                       shr        r10, 0x28
006a4 458bd2                         mov        r10d, r10d
006a7 450fb6ca                       movzx      r9d, r10b
006ab 4503cb                         add        r9d, r11d
006ae 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006b6 49c1ea28                       shr        r10, 0x28
006ba 458bda                         mov        r11d, r10d
006bd 450fb6d3                       movzx      r10d, r11b
006c1 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
006c9 4503ca                         add        r9d, r10d
006cc 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006d4 41bb01000000                   mov        r11d, 1
006da 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
006e2 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006ea 49c1ea20                       shr        r10, 0x20
006ee 458bd2                         mov        r10d, r10d
006f1 410fb6ea                       movzx      ebp, r10b
006f5 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006fc 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00704 49c1ea20                       shr        r10, 0x20
00708 458bda                         mov        r11d, r10d
0070b 410fb6eb                       movzx      ebp, r11b
0070f 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00716 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0071e 49c1ea20                       shr        r10, 0x20
00722 458bd2                         mov        r10d, r10d
00725 410fb6ea                       movzx      ebp, r10b
00729 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00730 448bdd                         mov        r11d, ebp
00733 44039c24f8000000               add        r11d, dword ptr [rsp + 0xf8]
0073b 44039c24fc000000               add        r11d, dword ptr [rsp + 0xfc]
00743 44039c24f4000000               add        r11d, dword ptr [rsp + 0xf4]
0074b 4585db                         test       r11d, r11d
0074e 0f84e0090000                   je         0x7f2213e5ac34
00754 4183fb3f                       cmp        r11d, 0x3f
00758 0f8f9e0b0000                   jg         0x7f2213e5adfc
0075e 41ba40000000                   mov        r10d, 0x40
00764 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
00769 453bda                         cmp        r11d, r10d
0076c 7e43                           jle        0x7f2213e5a2b1
0076e 458bc3                         mov        r8d, r11d
00771 452bc2                         sub        r8d, r10d
00774 4183fa40                       cmp        r10d, 0x40
00778 0f8dae1d0000                   jge        0x7f2213e5c02c
0077e 41b901000000                   mov        r9d, 1
00784 c442a9f7d1                     shlx       r10, r9, r10
00789 49ffca                         dec        r10
0078c 4c23d3                         and        r10, rbx
0078f c442b9f7ca                     shlx       r9, r10, r8
00794 41ba40000000                   mov        r10d, 0x40
0079a 452bd0                         sub        r10d, r8d
0079d c462abf7542438                 shrx       r10, qword ptr [rsp + 0x38], r10
007a4 4d0bca                         or         r9, r10
007a7 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
007af eb2b                           jmp        0x7f2213e5a2dc
007b1 452bd3                         sub        r10d, r11d
007b4 c462abf7d3                     shrx       r10, rbx, r10
007b9 4183fb40                       cmp        r11d, 0x40
007bd 0f8d891b0000                   jge        0x7f2213e5be4c
007c3 41b801000000                   mov        r8d, 1
007c9 c442a1f7c0                     shlx       r8, r8, r11
007ce 49ffc8                         dec        r8
007d1 4d23c2                         and        r8, r10
007d4 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007dc 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
007e1 4503c3                         add        r8d, r11d
007e4 4489442440                     mov        dword ptr [rsp + 0x40], r8d
007e9 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
007ee 4503d3                         add        r10d, r11d
007f1 4489542444                     mov        dword ptr [rsp + 0x44], r10d
007f6 4183f840                       cmp        r8d, 0x40
007fa 0f8c90fbffff                   jl         0x7f2213e59e90
00800 458d58c0                       lea        r11d, [r8 - 0x40]
00804 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00809 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080d 83c5f8                         add        ebp, -8
00810 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00814 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00818 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081c 83c1f0                         add        ecx, -0x10
0081f 83f908                         cmp        ecx, 8
00822 0f8cd4010000                   jl         0x7f2213e5a4fc
00828 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082d 4183c2e8                       add        r10d, -0x18
00831 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00839 0f8220fbffff                   jb         0x7f2213e59e5f
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
008c3 48ff742438                     push       qword ptr [rsp + 0x38]
008c8 488f442428                     pop        qword ptr [rsp + 0x28]
008cd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008d2 48894424f8                     mov        qword ptr [rsp - 8], rax
008d7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008db 89442434                       mov        dword ptr [rsp + 0x34], eax
008df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e4 48ff742448                     push       qword ptr [rsp + 0x48]
008e9 488f442438                     pop        qword ptr [rsp + 0x38]
008ee 48ff742450                     push       qword ptr [rsp + 0x50]
008f3 488f442440                     pop        qword ptr [rsp + 0x40]
008f8 48ff742458                     push       qword ptr [rsp + 0x58]
008fd 488f442448                     pop        qword ptr [rsp + 0x48]
00902 48894424f8                     mov        qword ptr [rsp - 8], rax
00907 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090e 89442450                       mov        dword ptr [rsp + 0x50], eax
00912 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00917 48894424f8                     mov        qword ptr [rsp - 8], rax
0091c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00923 89442454                       mov        dword ptr [rsp + 0x54], eax
00927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092c 48894424f8                     mov        qword ptr [rsp - 8], rax
00931 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00938 89442458                       mov        dword ptr [rsp + 0x58], eax
0093c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00941 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00949 488f442460                     pop        qword ptr [rsp + 0x60]
0094e 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00956 488f442468                     pop        qword ptr [rsp + 0x68]
0095b 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00963 488f442470                     pop        qword ptr [rsp + 0x70]
00968 48894424f8                     mov        qword ptr [rsp - 8], rax
0096d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00974 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097d 48894424f8                     mov        qword ptr [rsp - 8], rax
00982 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00989 89442478                       mov        dword ptr [rsp + 0x78], eax
0098d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00992 48894424f8                     mov        qword ptr [rsp - 8], rax
00997 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099e 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a7 48894424f8                     mov        qword ptr [rsp - 8], rax
009ac 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009b3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bf 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c7 488f842488000000               pop        qword ptr [rsp + 0x88]
009cf 48894424f8                     mov        qword ptr [rsp - 8], rax
009d4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009db 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e7 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009ef e86c91b6ff                     call       0x7f22139c3660
009f4 0f1f8400ec0a0001               nop        dword ptr [rax + rax + 0x1000aec]
009fc 85c9                           test       ecx, ecx
009fe 7f08                           jg         0x7f2213e5a508
00a00 4533d2                         xor        r10d, r10d
00a03 e964f9ffff                     jmp        0x7f2213e59e6c
00a08 8be9                           mov        ebp, ecx
00a0a 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a12 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a16 90                             nop        
00a17 e84413aaff                     call       0x7f22138fb860
00a1c 0f1f8400140b0002               nop        dword ptr [rax + rax + 0x2000b14]
00a24 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a29 41c1e003                       shl        r8d, 3
00a2d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a32 41c1e303                       shl        r11d, 3
00a36 452bd8                         sub        r11d, r8d
00a39 4181c3c0000000                 add        r11d, 0xc0
00a40 c462a1f7d0                     shlx       r10, rax, r11
00a45 e922f9ffff                     jmp        0x7f2213e59e6c
00a4a 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a52 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a5a 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a5f 4d3bd3                         cmp        r10, r11
00a62 7e31                           jle        0x7f2213e5a595
00a64 48be702274e200000000           movabs     rsi, 0xe2742270
00a6e 90                             nop        
00a6f e8ec12aaff                     call       0x7f22138fb860
00a74 0f1f84006c0b0003               nop        dword ptr [rax + rax + 0x3000b6c]
00a7c 4885c0                         test       rax, rax
00a7f 0f848b1e0000                   je         0x7f2213e5c410
00a85 488bf0                         mov        rsi, rax
00a88 4881c430010000                 add        rsp, 0x130
00a8f 5d                             pop        rbp
00a90 e9cbb6b6ff                     jmp        0x7f22139c5c60
00a95 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a9a 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a9f 0f857f1e0000                   jne        0x7f2213e5c424
00aa5 418bc2                         mov        eax, r10d
00aa8 4881c430010000                 add        rsp, 0x130
00aaf 5d                             pop        rbp
00ab0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ab4 0f87cc1e0000                   ja         0x7f2213e5c486
00aba c3                             ret        
00abb 4533d2                         xor        r10d, r10d
00abe 4533c0                         xor        r8d, r8d
00ac1 4533db                         xor        r11d, r11d
00ac4 33c9                           xor        ecx, ecx
00ac6 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ace 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00ad6 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00ade 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00ae5 e9f8fbffff                     jmp        0x7f2213e5a1e2
00aea bee4ffffff                     mov        esi, 0xffffffe4
00aef 48894424f8                     mov        qword ptr [rsp - 8], rax
00af4 8b442408                       mov        eax, dword ptr [rsp + 8]
00af8 890424                         mov        dword ptr [rsp], eax
00afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b00 48894424f8                     mov        qword ptr [rsp - 8], rax
00b05 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b09 89442404                       mov        dword ptr [rsp + 4], eax
00b0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b12 48ff742410                     push       qword ptr [rsp + 0x10]
00b17 488f442408                     pop        qword ptr [rsp + 8]
00b1c 48ff742418                     push       qword ptr [rsp + 0x18]
00b21 488f442410                     pop        qword ptr [rsp + 0x10]
00b26 48894424f8                     mov        qword ptr [rsp - 8], rax
00b2b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b2f 89442418                       mov        dword ptr [rsp + 0x18], eax
00b33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b38 48894424f8                     mov        qword ptr [rsp - 8], rax
00b3d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b41 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b53 89442420                       mov        dword ptr [rsp + 0x20], eax
00b57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b61 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b65 89442424                       mov        dword ptr [rsp + 0x24], eax
00b69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6e 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b73 48ff742438                     push       qword ptr [rsp + 0x38]
00b78 488f442430                     pop        qword ptr [rsp + 0x30]
00b7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00b82 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b86 89442438                       mov        dword ptr [rsp + 0x38], eax
00b8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b8f 48894424f8                     mov        qword ptr [rsp - 8], rax
00b94 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b98 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba1 48ff742448                     push       qword ptr [rsp + 0x48]
00ba6 488f442440                     pop        qword ptr [rsp + 0x40]
00bab 48ff742450                     push       qword ptr [rsp + 0x50]
00bb0 488f442448                     pop        qword ptr [rsp + 0x48]
00bb5 48ff742458                     push       qword ptr [rsp + 0x58]
00bba 488f442450                     pop        qword ptr [rsp + 0x50]
00bbf 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bc7 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bcf e88c8fb6ff                     call       0x7f22139c3660
00bd4 0f1f8400cc0c0004               nop        dword ptr [rax + rax + 0x4000ccc]
00bdc bee4ffffff                     mov        esi, 0xffffffe4
00be1 48894424f8                     mov        qword ptr [rsp - 8], rax
00be6 8b442408                       mov        eax, dword ptr [rsp + 8]
00bea 890424                         mov        dword ptr [rsp], eax
00bed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bf2 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00bfb 89442404                       mov        dword ptr [rsp + 4], eax
00bff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c04 48ff742410                     push       qword ptr [rsp + 0x10]
00c09 488f442408                     pop        qword ptr [rsp + 8]
00c0e 48ff742418                     push       qword ptr [rsp + 0x18]
00c13 488f442410                     pop        qword ptr [rsp + 0x10]
00c18 48894424f8                     mov        qword ptr [rsp - 8], rax
00c1d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c21 89442418                       mov        dword ptr [rsp + 0x18], eax
00c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c2f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c33 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c41 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c45 89442420                       mov        dword ptr [rsp + 0x20], eax
00c49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c53 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c57 89442424                       mov        dword ptr [rsp + 0x24], eax
00c5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c60 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c65 48ff742438                     push       qword ptr [rsp + 0x38]
00c6a 488f442430                     pop        qword ptr [rsp + 0x30]
00c6f 48894424f8                     mov        qword ptr [rsp - 8], rax
00c74 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c78 89442438                       mov        dword ptr [rsp + 0x38], eax
00c7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c81 48894424f8                     mov        qword ptr [rsp - 8], rax
00c86 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c8a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c93 48ff742448                     push       qword ptr [rsp + 0x48]
00c98 488f442440                     pop        qword ptr [rsp + 0x40]
00c9d 48ff742450                     push       qword ptr [rsp + 0x50]
00ca2 488f442448                     pop        qword ptr [rsp + 0x48]
00ca7 48ff742458                     push       qword ptr [rsp + 0x58]
00cac 488f442450                     pop        qword ptr [rsp + 0x50]
00cb1 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cbd 89442458                       mov        dword ptr [rsp + 0x58], eax
00cc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc6 48894424f8                     mov        qword ptr [rsp - 8], rax
00ccb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cd2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cdb 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00ce3 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00cea 90                             nop        
00ceb e8708eb6ff                     call       0x7f22139c3660
00cf0 0f1f8400e80d0005               nop        dword ptr [rax + rax + 0x5000de8]
00cf8 bee4ffffff                     mov        esi, 0xffffffe4
00cfd 48894424f8                     mov        qword ptr [rsp - 8], rax
00d02 8b442408                       mov        eax, dword ptr [rsp + 8]
00d06 890424                         mov        dword ptr [rsp], eax
00d09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d13 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d17 89442404                       mov        dword ptr [rsp + 4], eax
00d1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d20 48ff742410                     push       qword ptr [rsp + 0x10]
00d25 488f442408                     pop        qword ptr [rsp + 8]
00d2a 48ff742418                     push       qword ptr [rsp + 0x18]
00d2f 488f442410                     pop        qword ptr [rsp + 0x10]
00d34 48894424f8                     mov        qword ptr [rsp - 8], rax
00d39 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d3d 89442418                       mov        dword ptr [rsp + 0x18], eax
00d41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d46 48894424f8                     mov        qword ptr [rsp - 8], rax
00d4b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d4f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d58 48894424f8                     mov        qword ptr [rsp - 8], rax
00d5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d61 89442420                       mov        dword ptr [rsp + 0x20], eax
00d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d6a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d6f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d73 89442424                       mov        dword ptr [rsp + 0x24], eax
00d77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d7c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d81 48ff742438                     push       qword ptr [rsp + 0x38]
00d86 488f442430                     pop        qword ptr [rsp + 0x30]
00d8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00d90 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d94 89442438                       mov        dword ptr [rsp + 0x38], eax
00d98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9d 48894424f8                     mov        qword ptr [rsp - 8], rax
00da2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00da6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00daf 48ff742448                     push       qword ptr [rsp + 0x48]
00db4 488f442440                     pop        qword ptr [rsp + 0x40]
00db9 48ff742450                     push       qword ptr [rsp + 0x50]
00dbe 488f442448                     pop        qword ptr [rsp + 0x48]
00dc3 48ff742458                     push       qword ptr [rsp + 0x58]
00dc8 488f442450                     pop        qword ptr [rsp + 0x50]
00dcd 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00dd9 89442458                       mov        dword ptr [rsp + 0x58], eax
00ddd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de2 48894424f8                     mov        qword ptr [rsp - 8], rax
00de7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00dee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00df2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df7 48894424f8                     mov        qword ptr [rsp - 8], rax
00dfc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e03 89442460                       mov        dword ptr [rsp + 0x60], eax
00e07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e11 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e18 89442464                       mov        dword ptr [rsp + 0x64], eax
00e1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e21 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e29 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e31 6690                           nop        
00e33 e8288db6ff                     call       0x7f22139c3660
00e38 0f1f8400300f0006               nop        dword ptr [rax + rax + 0x6000f30]
00e40 bee4ffffff                     mov        esi, 0xffffffe4
00e45 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4a 8b442408                       mov        eax, dword ptr [rsp + 8]
00e4e 890424                         mov        dword ptr [rsp], eax
00e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e56 48894424f8                     mov        qword ptr [rsp - 8], rax
00e5b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e5f 89442404                       mov        dword ptr [rsp + 4], eax
00e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e68 48ff742410                     push       qword ptr [rsp + 0x10]
00e6d 488f442408                     pop        qword ptr [rsp + 8]
00e72 48ff742418                     push       qword ptr [rsp + 0x18]
00e77 488f442410                     pop        qword ptr [rsp + 0x10]
00e7c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e81 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e85 89442418                       mov        dword ptr [rsp + 0x18], eax
00e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e93 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e97 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ea9 89442420                       mov        dword ptr [rsp + 0x20], eax
00ead 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb2 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ebb 89442424                       mov        dword ptr [rsp + 0x24], eax
00ebf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ec9 48ff742438                     push       qword ptr [rsp + 0x38]
00ece 488f442430                     pop        qword ptr [rsp + 0x30]
00ed3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00edc 89442438                       mov        dword ptr [rsp + 0x38], eax
00ee0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee5 48894424f8                     mov        qword ptr [rsp - 8], rax
00eea 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00eee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ef2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef7 48ff742448                     push       qword ptr [rsp + 0x48]
00efc 488f442440                     pop        qword ptr [rsp + 0x40]
00f01 48ff742450                     push       qword ptr [rsp + 0x50]
00f06 488f442448                     pop        qword ptr [rsp + 0x48]
00f0b 48ff742458                     push       qword ptr [rsp + 0x58]
00f10 488f442450                     pop        qword ptr [rsp + 0x50]
00f15 48894424f8                     mov        qword ptr [rsp - 8], rax
00f1a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f21 89442458                       mov        dword ptr [rsp + 0x58], eax
00f25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f2a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f36 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3f 48894424f8                     mov        qword ptr [rsp - 8], rax
00f44 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f4b 89442460                       mov        dword ptr [rsp + 0x60], eax
00f4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f54 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00f59 48894424f8                     mov        qword ptr [rsp - 8], rax
00f5e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f65 89442464                       mov        dword ptr [rsp + 0x64], eax
00f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f6e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f73 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f7a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f86 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f92 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00faa 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fbe 488f842490000000               pop        qword ptr [rsp + 0x90]
00fc6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcb 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fd2 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fde 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fe6 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00fee 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00ff6 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00ffe 90                             nop        
00fff e85c8bb6ff                     call       0x7f22139c3660
01004 0f1f8400fc100007               nop        dword ptr [rax + rax + 0x70010fc]
0100c 33c9                           xor        ecx, ecx
0100e 4c3bc9                         cmp        r9, rcx
01011 bdffffffff                     mov        ebp, 0xffffffff
01016 7c08                           jl         0x7f2213e5ab20
01018 400f95c5                       setne      bpl
0101c 400fb6ed                       movzx      ebp, bpl
01020 be45ffffff                     mov        esi, 0xffffff45
01025 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0102a 48894424f8                     mov        qword ptr [rsp - 8], rax
0102f 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01036 89442460                       mov        dword ptr [rsp + 0x60], eax
0103a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103f 48894424f8                     mov        qword ptr [rsp - 8], rax
01044 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0104b 89442464                       mov        dword ptr [rsp + 0x64], eax
0104f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01054 48894424f8                     mov        qword ptr [rsp - 8], rax
01059 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01060 89442468                       mov        dword ptr [rsp + 0x68], eax
01064 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01069 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01071 48894424f8                     mov        qword ptr [rsp - 8], rax
01076 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0107d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01081 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01086 48894424f8                     mov        qword ptr [rsp - 8], rax
0108b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01092 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109e 48894424f8                     mov        qword ptr [rsp - 8], rax
010a3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010aa 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b6 48894424f8                     mov        qword ptr [rsp - 8], rax
010bb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010c2 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ce 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010d6 488f842498000000               pop        qword ptr [rsp + 0x98]
010de 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010e6 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010ee 48894424f8                     mov        qword ptr [rsp - 8], rax
010f3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
010fa 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01101 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01106 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0110e 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01116 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0111e 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01126 90                             nop        
01127 e8348ab6ff                     call       0x7f22139c3660
0112c 0f1f840024120008               nop        dword ptr [rax + rax + 0x8001224]
01134 be45ffffff                     mov        esi, 0xffffff45
01139 48894424f8                     mov        qword ptr [rsp - 8], rax
0113e 8b442408                       mov        eax, dword ptr [rsp + 8]
01142 890424                         mov        dword ptr [rsp], eax
01145 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0114a 48894424f8                     mov        qword ptr [rsp - 8], rax
0114f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01153 89442404                       mov        dword ptr [rsp + 4], eax
01157 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0115c 48ff742410                     push       qword ptr [rsp + 0x10]
01161 488f442408                     pop        qword ptr [rsp + 8]
01166 48ff742418                     push       qword ptr [rsp + 0x18]
0116b 488f442410                     pop        qword ptr [rsp + 0x10]
01170 48894424f8                     mov        qword ptr [rsp - 8], rax
01175 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01179 89442418                       mov        dword ptr [rsp + 0x18], eax
0117d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01182 48894424f8                     mov        qword ptr [rsp - 8], rax
01187 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0118b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0118f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01194 48894424f8                     mov        qword ptr [rsp - 8], rax
01199 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0119d 89442420                       mov        dword ptr [rsp + 0x20], eax
011a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a6 48894424f8                     mov        qword ptr [rsp - 8], rax
011ab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011af 89442424                       mov        dword ptr [rsp + 0x24], eax
011b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011bd 48ff742438                     push       qword ptr [rsp + 0x38]
011c2 488f442430                     pop        qword ptr [rsp + 0x30]
011c7 48894424f8                     mov        qword ptr [rsp - 8], rax
011cc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011d0 89442438                       mov        dword ptr [rsp + 0x38], eax
011d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d9 48894424f8                     mov        qword ptr [rsp - 8], rax
011de 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011e2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011eb 48ff742448                     push       qword ptr [rsp + 0x48]
011f0 488f442440                     pop        qword ptr [rsp + 0x40]
011f5 48ff742450                     push       qword ptr [rsp + 0x50]
011fa 488f442448                     pop        qword ptr [rsp + 0x48]
011ff 48ff742458                     push       qword ptr [rsp + 0x58]
01204 488f442450                     pop        qword ptr [rsp + 0x50]
01209 48894424f8                     mov        qword ptr [rsp - 8], rax
0120e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01215 89442458                       mov        dword ptr [rsp + 0x58], eax
01219 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121e 48894424f8                     mov        qword ptr [rsp - 8], rax
01223 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0122a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0122e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01233 48894424f8                     mov        qword ptr [rsp - 8], rax
01238 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0123f 89442460                       mov        dword ptr [rsp + 0x60], eax
01243 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01248 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01250 488f442468                     pop        qword ptr [rsp + 0x68]
01255 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0125d 488f442478                     pop        qword ptr [rsp + 0x78]
01262 48894424f8                     mov        qword ptr [rsp - 8], rax
01267 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0126e 89442464                       mov        dword ptr [rsp + 0x64], eax
01272 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01277 48894424f8                     mov        qword ptr [rsp - 8], rax
0127c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01283 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0128a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128f 48894424f8                     mov        qword ptr [rsp - 8], rax
01294 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0129b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a7 48894424f8                     mov        qword ptr [rsp - 8], rax
012ac 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012b3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bf 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012c7 488f842490000000               pop        qword ptr [rsp + 0x90]
012cf 48894424f8                     mov        qword ptr [rsp - 8], rax
012d4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012db 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012e7 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
012ef e86c88b6ff                     call       0x7f22139c3660
012f4 0f1f8400ec130009               nop        dword ptr [rax + rax + 0x90013ec]
012fc be45ffffff                     mov        esi, 0xffffff45
01301 48894424f8                     mov        qword ptr [rsp - 8], rax
01306 8b442408                       mov        eax, dword ptr [rsp + 8]
0130a 890424                         mov        dword ptr [rsp], eax
0130d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01312 48894424f8                     mov        qword ptr [rsp - 8], rax
01317 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0131b 89442404                       mov        dword ptr [rsp + 4], eax
0131f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01324 48ff742410                     push       qword ptr [rsp + 0x10]
01329 488f442408                     pop        qword ptr [rsp + 8]
0132e 48ff742418                     push       qword ptr [rsp + 0x18]
01333 488f442410                     pop        qword ptr [rsp + 0x10]
01338 48894424f8                     mov        qword ptr [rsp - 8], rax
0133d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01341 89442418                       mov        dword ptr [rsp + 0x18], eax
01345 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0134a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0134f e80c88b6ff                     call       0x7f22139c3660
01354 0f1f84004c14000a               nop        dword ptr [rax + rax + 0xa00144c]
0135c be45ffffff                     mov        esi, 0xffffff45
01361 48894424f8                     mov        qword ptr [rsp - 8], rax
01366 8b442408                       mov        eax, dword ptr [rsp + 8]
0136a 890424                         mov        dword ptr [rsp], eax
0136d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01372 48894424f8                     mov        qword ptr [rsp - 8], rax
01377 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0137b 89442404                       mov        dword ptr [rsp + 4], eax
0137f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01384 48ff742410                     push       qword ptr [rsp + 0x10]
01389 488f442408                     pop        qword ptr [rsp + 8]
0138e 48ff742418                     push       qword ptr [rsp + 0x18]
01393 488f442410                     pop        qword ptr [rsp + 0x10]
01398 48894424f8                     mov        qword ptr [rsp - 8], rax
0139d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013a1 89442418                       mov        dword ptr [rsp + 0x18], eax
013a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013aa 48894424f8                     mov        qword ptr [rsp - 8], rax
013af 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013b3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013bc 48894424f8                     mov        qword ptr [rsp - 8], rax
013c1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013c5 89442420                       mov        dword ptr [rsp + 0x20], eax
013c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ce 48894424f8                     mov        qword ptr [rsp - 8], rax
013d3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013d7 89442424                       mov        dword ptr [rsp + 0x24], eax
013db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013e5 48ff742438                     push       qword ptr [rsp + 0x38]
013ea 488f442430                     pop        qword ptr [rsp + 0x30]
013ef 48894424f8                     mov        qword ptr [rsp - 8], rax
013f4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
013f8 89442438                       mov        dword ptr [rsp + 0x38], eax
013fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01401 48894424f8                     mov        qword ptr [rsp - 8], rax
01406 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0140a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0140e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01413 48ff742448                     push       qword ptr [rsp + 0x48]
01418 488f442440                     pop        qword ptr [rsp + 0x40]
0141d 48ff742450                     push       qword ptr [rsp + 0x50]
01422 488f442448                     pop        qword ptr [rsp + 0x48]
01427 48ff742458                     push       qword ptr [rsp + 0x58]
0142c 488f442450                     pop        qword ptr [rsp + 0x50]
01431 48894424f8                     mov        qword ptr [rsp - 8], rax
01436 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0143d 89442458                       mov        dword ptr [rsp + 0x58], eax
01441 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01446 48894424f8                     mov        qword ptr [rsp - 8], rax
0144b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01452 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01456 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145b 48894424f8                     mov        qword ptr [rsp - 8], rax
01460 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01467 89442460                       mov        dword ptr [rsp + 0x60], eax
0146b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01470 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01478 488f442468                     pop        qword ptr [rsp + 0x68]
0147d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01485 488f442470                     pop        qword ptr [rsp + 0x70]
0148a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01492 488f442478                     pop        qword ptr [rsp + 0x78]
01497 48894424f8                     mov        qword ptr [rsp - 8], rax
0149c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014a3 89442464                       mov        dword ptr [rsp + 0x64], eax
014a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ac 48894424f8                     mov        qword ptr [rsp - 8], rax
014b1 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014b8 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c4 48894424f8                     mov        qword ptr [rsp - 8], rax
014c9 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014d0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014dc 48894424f8                     mov        qword ptr [rsp - 8], rax
014e1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014e8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
014fc 488f842490000000               pop        qword ptr [rsp + 0x90]
01504 48894424f8                     mov        qword ptr [rsp - 8], rax
01509 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01510 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151c 666690                         nop        
0151f e83c86b6ff                     call       0x7f22139c3660
01524 0f1f84001c16000b               nop        dword ptr [rax + rax + 0xb00161c]
0152c be45ffffff                     mov        esi, 0xffffff45
01531 48894424f8                     mov        qword ptr [rsp - 8], rax
01536 8b442408                       mov        eax, dword ptr [rsp + 8]
0153a 890424                         mov        dword ptr [rsp], eax
0153d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01542 48894424f8                     mov        qword ptr [rsp - 8], rax
01547 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0154b 89442404                       mov        dword ptr [rsp + 4], eax
0154f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01554 48ff742410                     push       qword ptr [rsp + 0x10]
01559 488f442408                     pop        qword ptr [rsp + 8]
0155e 48ff742418                     push       qword ptr [rsp + 0x18]
01563 488f442410                     pop        qword ptr [rsp + 0x10]
01568 48894424f8                     mov        qword ptr [rsp - 8], rax
0156d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01571 89442418                       mov        dword ptr [rsp + 0x18], eax
01575 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157a 48894424f8                     mov        qword ptr [rsp - 8], rax
0157f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01583 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01587 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158c 48894424f8                     mov        qword ptr [rsp - 8], rax
01591 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01595 89442420                       mov        dword ptr [rsp + 0x20], eax
01599 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159e 48894424f8                     mov        qword ptr [rsp - 8], rax
015a3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015a7 89442424                       mov        dword ptr [rsp + 0x24], eax
015ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015b5 48ff742438                     push       qword ptr [rsp + 0x38]
015ba 488f442430                     pop        qword ptr [rsp + 0x30]
015bf 48894424f8                     mov        qword ptr [rsp - 8], rax
015c4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015c8 89442438                       mov        dword ptr [rsp + 0x38], eax
015cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d1 48894424f8                     mov        qword ptr [rsp - 8], rax
015d6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015da 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e3 48ff742448                     push       qword ptr [rsp + 0x48]
015e8 488f442440                     pop        qword ptr [rsp + 0x40]
015ed 48ff742450                     push       qword ptr [rsp + 0x50]
015f2 488f442448                     pop        qword ptr [rsp + 0x48]
015f7 48ff742458                     push       qword ptr [rsp + 0x58]
015fc 488f442450                     pop        qword ptr [rsp + 0x50]
01601 48894424f8                     mov        qword ptr [rsp - 8], rax
01606 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0160d 89442458                       mov        dword ptr [rsp + 0x58], eax
01611 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01616 48894424f8                     mov        qword ptr [rsp - 8], rax
0161b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01622 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01626 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162b 48894424f8                     mov        qword ptr [rsp - 8], rax
01630 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01637 89442460                       mov        dword ptr [rsp + 0x60], eax
0163b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01640 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01648 488f442468                     pop        qword ptr [rsp + 0x68]
0164d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01655 488f442470                     pop        qword ptr [rsp + 0x70]
0165a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01662 488f442478                     pop        qword ptr [rsp + 0x78]
01667 48894424f8                     mov        qword ptr [rsp - 8], rax
0166c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01673 89442464                       mov        dword ptr [rsp + 0x64], eax
01677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167c 48894424f8                     mov        qword ptr [rsp - 8], rax
01681 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01688 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0168f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01694 48894424f8                     mov        qword ptr [rsp - 8], rax
01699 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016a0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ac 48894424f8                     mov        qword ptr [rsp - 8], rax
016b1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016b8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016cc 488f842490000000               pop        qword ptr [rsp + 0x90]
016d4 48894424f8                     mov        qword ptr [rsp - 8], rax
016d9 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016e0 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ec 48894424f8                     mov        qword ptr [rsp - 8], rax
016f1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
016f8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
016ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01704 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0170c 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01714 666690                         nop        
01717 e84484b6ff                     call       0x7f22139c3660
0171c 0f1f84001418000c               nop        dword ptr [rax + rax + 0xc001814]
01724 be45ffffff                     mov        esi, 0xffffff45
01729 48894424f8                     mov        qword ptr [rsp - 8], rax
0172e 8b442408                       mov        eax, dword ptr [rsp + 8]
01732 890424                         mov        dword ptr [rsp], eax
01735 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173a 48894424f8                     mov        qword ptr [rsp - 8], rax
0173f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01743 89442404                       mov        dword ptr [rsp + 4], eax
01747 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174c 48ff742410                     push       qword ptr [rsp + 0x10]
01751 488f442408                     pop        qword ptr [rsp + 8]
01756 48ff742418                     push       qword ptr [rsp + 0x18]
0175b 488f442410                     pop        qword ptr [rsp + 0x10]
01760 48894424f8                     mov        qword ptr [rsp - 8], rax
01765 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01769 89442418                       mov        dword ptr [rsp + 0x18], eax
0176d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0177b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 48894424f8                     mov        qword ptr [rsp - 8], rax
01789 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0178d 89442420                       mov        dword ptr [rsp + 0x20], eax
01791 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01796 48894424f8                     mov        qword ptr [rsp - 8], rax
0179b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0179f 89442424                       mov        dword ptr [rsp + 0x24], eax
017a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017ad 48ff742438                     push       qword ptr [rsp + 0x38]
017b2 488f442430                     pop        qword ptr [rsp + 0x30]
017b7 48894424f8                     mov        qword ptr [rsp - 8], rax
017bc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017c0 89442438                       mov        dword ptr [rsp + 0x38], eax
017c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c9 48894424f8                     mov        qword ptr [rsp - 8], rax
017ce 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017d2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017db 48ff742448                     push       qword ptr [rsp + 0x48]
017e0 488f442440                     pop        qword ptr [rsp + 0x40]
017e5 48ff742450                     push       qword ptr [rsp + 0x50]
017ea 488f442448                     pop        qword ptr [rsp + 0x48]
017ef 48ff742458                     push       qword ptr [rsp + 0x58]
017f4 488f442450                     pop        qword ptr [rsp + 0x50]
017f9 48894424f8                     mov        qword ptr [rsp - 8], rax
017fe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01805 89442458                       mov        dword ptr [rsp + 0x58], eax
01809 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180e 48894424f8                     mov        qword ptr [rsp - 8], rax
01813 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0181a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0181e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01823 48894424f8                     mov        qword ptr [rsp - 8], rax
01828 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0182f 89442460                       mov        dword ptr [rsp + 0x60], eax
01833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01838 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01840 488f442468                     pop        qword ptr [rsp + 0x68]
01845 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0184d 488f442470                     pop        qword ptr [rsp + 0x70]
01852 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0185a 488f442478                     pop        qword ptr [rsp + 0x78]
0185f 48894424f8                     mov        qword ptr [rsp - 8], rax
01864 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0186b 89442464                       mov        dword ptr [rsp + 0x64], eax
0186f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01874 48894424f8                     mov        qword ptr [rsp - 8], rax
01879 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01880 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48894424f8                     mov        qword ptr [rsp - 8], rax
01891 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01898 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 48894424f8                     mov        qword ptr [rsp - 8], rax
018a9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018b0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018c4 488f842490000000               pop        qword ptr [rsp + 0x90]
018cc 48894424f8                     mov        qword ptr [rsp - 8], rax
018d1 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018d8 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e4 48894424f8                     mov        qword ptr [rsp - 8], rax
018e9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018f0 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
018f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01904 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
0190b 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01913 e84882b6ff                     call       0x7f22139c3660
01918 0f1f8400101a000d               nop        dword ptr [rax + rax + 0xd001a10]
01920 be45ffffff                     mov        esi, 0xffffff45
01925 48894424f8                     mov        qword ptr [rsp - 8], rax
0192a 8b442408                       mov        eax, dword ptr [rsp + 8]
0192e 890424                         mov        dword ptr [rsp], eax
01931 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01936 48894424f8                     mov        qword ptr [rsp - 8], rax
0193b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0193f 89442404                       mov        dword ptr [rsp + 4], eax
01943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01948 48ff742410                     push       qword ptr [rsp + 0x10]
0194d 488f442408                     pop        qword ptr [rsp + 8]
01952 48ff742418                     push       qword ptr [rsp + 0x18]
01957 488f442410                     pop        qword ptr [rsp + 0x10]
0195c 48894424f8                     mov        qword ptr [rsp - 8], rax
01961 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01965 89442418                       mov        dword ptr [rsp + 0x18], eax
01969 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196e 48894424f8                     mov        qword ptr [rsp - 8], rax
01973 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01977 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48894424f8                     mov        qword ptr [rsp - 8], rax
01985 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01989 89442420                       mov        dword ptr [rsp + 0x20], eax
0198d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01992 48894424f8                     mov        qword ptr [rsp - 8], rax
01997 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0199b 89442424                       mov        dword ptr [rsp + 0x24], eax
0199f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019a9 48ff742438                     push       qword ptr [rsp + 0x38]
019ae 488f442430                     pop        qword ptr [rsp + 0x30]
019b3 48894424f8                     mov        qword ptr [rsp - 8], rax
019b8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019bc 89442438                       mov        dword ptr [rsp + 0x38], eax
019c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c5 48894424f8                     mov        qword ptr [rsp - 8], rax
019ca 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019ce 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d7 48ff742448                     push       qword ptr [rsp + 0x48]
019dc 488f442440                     pop        qword ptr [rsp + 0x40]
019e1 48ff742450                     push       qword ptr [rsp + 0x50]
019e6 488f442448                     pop        qword ptr [rsp + 0x48]
019eb 48ff742458                     push       qword ptr [rsp + 0x58]
019f0 488f442450                     pop        qword ptr [rsp + 0x50]
019f5 48894424f8                     mov        qword ptr [rsp - 8], rax
019fa 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a01 89442458                       mov        dword ptr [rsp + 0x58], eax
01a05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a16 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a24 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a2b 89442460                       mov        dword ptr [rsp + 0x60], eax
01a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a34 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a3c 488f442468                     pop        qword ptr [rsp + 0x68]
01a41 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a49 488f442478                     pop        qword ptr [rsp + 0x78]
01a4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a53 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a5a 89442464                       mov        dword ptr [rsp + 0x64], eax
01a5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a63 48894424f8                     mov        qword ptr [rsp - 8], rax
01a68 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a6f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a80 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a87 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48894424f8                     mov        qword ptr [rsp - 8], rax
01a98 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01a9f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01aa6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aab 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ab3 488f842490000000               pop        qword ptr [rsp + 0x90]
01abb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ac7 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ace 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad3 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01adb 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01ae2 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01ae9 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01af1 6690                           nop        
01af3 e86880b6ff                     call       0x7f22139c3660
01af8 0f1f8400f01b000e               nop        dword ptr [rax + rax + 0xe001bf0]
01b00 be45ffffff                     mov        esi, 0xffffff45
01b05 b9ffffff7f                     mov        ecx, 0x7fffffff
01b0a 4c3bc9                         cmp        r9, rcx
01b0d bdffffffff                     mov        ebp, 0xffffffff
01b12 7c08                           jl         0x7f2213e5b61c
01b14 400f95c5                       setne      bpl
01b18 400fb6ed                       movzx      ebp, bpl
01b1c 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b21 48894424f8                     mov        qword ptr [rsp - 8], rax
01b26 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b2d 89442460                       mov        dword ptr [rsp + 0x60], eax
01b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b36 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b42 89442464                       mov        dword ptr [rsp + 0x64], eax
01b46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b50 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b57 89442468                       mov        dword ptr [rsp + 0x68], eax
01b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b60 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01b68 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b74 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b82 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b89 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b95 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9a 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01ba1 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bad 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb2 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bb9 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01bc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc5 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bcd 488f842498000000               pop        qword ptr [rsp + 0x98]
01bd5 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bdd 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01be5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bea 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bf1 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01bf8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfd 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c05 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01c0d 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01c15 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c1d 6690                           nop        
01c1f e83c7fb6ff                     call       0x7f22139c3660
01c24 0f1f84001c1d000f               nop        dword ptr [rax + rax + 0xf001d1c]
01c2c be45ffffff                     mov        esi, 0xffffff45
01c31 48894424f8                     mov        qword ptr [rsp - 8], rax
01c36 8b442408                       mov        eax, dword ptr [rsp + 8]
01c3a 890424                         mov        dword ptr [rsp], eax
01c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c42 48894424f8                     mov        qword ptr [rsp - 8], rax
01c47 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c4b 89442404                       mov        dword ptr [rsp + 4], eax
01c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c54 48ff742410                     push       qword ptr [rsp + 0x10]
01c59 488f442408                     pop        qword ptr [rsp + 8]
01c5e 48ff742418                     push       qword ptr [rsp + 0x18]
01c63 488f442410                     pop        qword ptr [rsp + 0x10]
01c68 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c71 89442418                       mov        dword ptr [rsp + 0x18], eax
01c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c83 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c91 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c95 89442420                       mov        dword ptr [rsp + 0x20], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ca7 89442424                       mov        dword ptr [rsp + 0x24], eax
01cab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01cb5 48ff742438                     push       qword ptr [rsp + 0x38]
01cba 488f442430                     pop        qword ptr [rsp + 0x30]
01cbf 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01cc8 89442438                       mov        dword ptr [rsp + 0x38], eax
01ccc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cda 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce3 48ff742448                     push       qword ptr [rsp + 0x48]
01ce8 488f442440                     pop        qword ptr [rsp + 0x40]
01ced 48ff742450                     push       qword ptr [rsp + 0x50]
01cf2 488f442448                     pop        qword ptr [rsp + 0x48]
01cf7 48ff742458                     push       qword ptr [rsp + 0x58]
01cfc 488f442450                     pop        qword ptr [rsp + 0x50]
01d01 48894424f8                     mov        qword ptr [rsp - 8], rax
01d06 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d0d 89442458                       mov        dword ptr [rsp + 0x58], eax
01d11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d16 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d22 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d30 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d37 89442460                       mov        dword ptr [rsp + 0x60], eax
01d3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d40 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01d45 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d51 89442464                       mov        dword ptr [rsp + 0x64], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d66 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d7e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01d96 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01daa 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01db2 90                             nop        
01db3 e8a87db6ff                     call       0x7f22139c3660
01db8 0f1f8400b01e0010               nop        dword ptr [rax + rax + 0x10001eb0]
01dc0 be45ffffff                     mov        esi, 0xffffff45
01dc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dca 8b442408                       mov        eax, dword ptr [rsp + 8]
01dce 890424                         mov        dword ptr [rsp], eax
01dd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01ddf 89442404                       mov        dword ptr [rsp + 4], eax
01de3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de8 48ff742410                     push       qword ptr [rsp + 0x10]
01ded 488f442408                     pop        qword ptr [rsp + 8]
01df2 48ff742418                     push       qword ptr [rsp + 0x18]
01df7 488f442410                     pop        qword ptr [rsp + 0x10]
01dfc 48894424f8                     mov        qword ptr [rsp - 8], rax
01e01 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e05 89442418                       mov        dword ptr [rsp + 0x18], eax
01e09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e13 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e17 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e20 48894424f8                     mov        qword ptr [rsp - 8], rax
01e25 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e29 89442420                       mov        dword ptr [rsp + 0x20], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e3b 89442424                       mov        dword ptr [rsp + 0x24], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e49 48ff742438                     push       qword ptr [rsp + 0x38]
01e4e 488f442430                     pop        qword ptr [rsp + 0x30]
01e53 48894424f8                     mov        qword ptr [rsp - 8], rax
01e58 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e5c 89442438                       mov        dword ptr [rsp + 0x38], eax
01e60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e65 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e6e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e77 48ff742448                     push       qword ptr [rsp + 0x48]
01e7c 488f442440                     pop        qword ptr [rsp + 0x40]
01e81 48ff742450                     push       qword ptr [rsp + 0x50]
01e86 488f442448                     pop        qword ptr [rsp + 0x48]
01e8b 48ff742458                     push       qword ptr [rsp + 0x58]
01e90 488f442450                     pop        qword ptr [rsp + 0x50]
01e95 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ea1 89442458                       mov        dword ptr [rsp + 0x58], eax
01ea5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eaa 48894424f8                     mov        qword ptr [rsp - 8], rax
01eaf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01eb6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01eba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ecb 89442460                       mov        dword ptr [rsp + 0x60], eax
01ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed4 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ed9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ede 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ee5 89442464                       mov        dword ptr [rsp + 0x64], eax
01ee9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01efa 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f12 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f23 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f2a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f36 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f3e 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01f46 90                             nop        
01f47 e8147cb6ff                     call       0x7f22139c3660
01f4c 0f1f840044200011               nop        dword ptr [rax + rax + 0x11002044]
01f54 be3dffffff                     mov        esi, 0xffffff3d
01f59 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5e 8b442408                       mov        eax, dword ptr [rsp + 8]
01f62 890424                         mov        dword ptr [rsp], eax
01f65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f73 89442404                       mov        dword ptr [rsp + 4], eax
01f77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7c 48ff742410                     push       qword ptr [rsp + 0x10]
01f81 488f442408                     pop        qword ptr [rsp + 8]
01f86 48ff742418                     push       qword ptr [rsp + 0x18]
01f8b 488f442410                     pop        qword ptr [rsp + 0x10]
01f90 48894424f8                     mov        qword ptr [rsp - 8], rax
01f95 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f99 89442418                       mov        dword ptr [rsp + 0x18], eax
01f9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fab 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01faf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fbd 89442420                       mov        dword ptr [rsp + 0x20], eax
01fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fcf 89442424                       mov        dword ptr [rsp + 0x24], eax
01fd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01fdd 48ff742438                     push       qword ptr [rsp + 0x38]
01fe2 488f442430                     pop        qword ptr [rsp + 0x30]
01fe7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fec 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ff0 89442438                       mov        dword ptr [rsp + 0x38], eax
01ff4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02002 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02006 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200b 48ff742448                     push       qword ptr [rsp + 0x48]
02010 488f442440                     pop        qword ptr [rsp + 0x40]
02015 48ff742450                     push       qword ptr [rsp + 0x50]
0201a 488f442448                     pop        qword ptr [rsp + 0x48]
0201f 48ff742458                     push       qword ptr [rsp + 0x58]
02024 488f442450                     pop        qword ptr [rsp + 0x50]
02029 48894424f8                     mov        qword ptr [rsp - 8], rax
0202e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02035 89442458                       mov        dword ptr [rsp + 0x58], eax
02039 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203e 48894424f8                     mov        qword ptr [rsp - 8], rax
02043 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0204a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0204e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02053 48894424f8                     mov        qword ptr [rsp - 8], rax
02058 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0205f 89442460                       mov        dword ptr [rsp + 0x60], eax
02063 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02068 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
0206d 48894424f8                     mov        qword ptr [rsp - 8], rax
02072 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02079 89442464                       mov        dword ptr [rsp + 0x64], eax
0207d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02082 48894424f8                     mov        qword ptr [rsp - 8], rax
02087 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0208e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02095 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209a 48894424f8                     mov        qword ptr [rsp - 8], rax
0209f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020a6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b2 48894424f8                     mov        qword ptr [rsp - 8], rax
020b7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020be 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020d2 488f842490000000               pop        qword ptr [rsp + 0x90]
020da 48894424f8                     mov        qword ptr [rsp - 8], rax
020df 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
020e6 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
020ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
020fa 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02102 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0210a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02112 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0211a 48894424f8                     mov        qword ptr [rsp - 8], rax
0211f 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02126 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
0212d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02132 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0213a 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02142 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
0214a 90                             nop        
0214b e8107ab6ff                     call       0x7f22139c3660
02150 0f1f840048220012               nop        dword ptr [rax + rax + 0x12002248]
02158 be45ffffff                     mov        esi, 0xffffff45
0215d 48894424f8                     mov        qword ptr [rsp - 8], rax
02162 8b442408                       mov        eax, dword ptr [rsp + 8]
02166 890424                         mov        dword ptr [rsp], eax
02169 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216e 48894424f8                     mov        qword ptr [rsp - 8], rax
02173 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02177 89442404                       mov        dword ptr [rsp + 4], eax
0217b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02180 48ff742410                     push       qword ptr [rsp + 0x10]
02185 488f442408                     pop        qword ptr [rsp + 8]
0218a 48ff742418                     push       qword ptr [rsp + 0x18]
0218f 488f442410                     pop        qword ptr [rsp + 0x10]
02194 48894424f8                     mov        qword ptr [rsp - 8], rax
02199 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0219d 89442418                       mov        dword ptr [rsp + 0x18], eax
021a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a6 48894424f8                     mov        qword ptr [rsp - 8], rax
021ab 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021af 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b8 48894424f8                     mov        qword ptr [rsp - 8], rax
021bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021c1 89442420                       mov        dword ptr [rsp + 0x20], eax
021c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ca 48894424f8                     mov        qword ptr [rsp - 8], rax
021cf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021d3 89442424                       mov        dword ptr [rsp + 0x24], eax
021d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021dc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
021e1 48ff742438                     push       qword ptr [rsp + 0x38]
021e6 488f442430                     pop        qword ptr [rsp + 0x30]
021eb 48894424f8                     mov        qword ptr [rsp - 8], rax
021f0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021f4 89442438                       mov        dword ptr [rsp + 0x38], eax
021f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02202 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02206 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0220a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220f 48ff742448                     push       qword ptr [rsp + 0x48]
02214 488f442440                     pop        qword ptr [rsp + 0x40]
02219 48ff742450                     push       qword ptr [rsp + 0x50]
0221e 488f442448                     pop        qword ptr [rsp + 0x48]
02223 48ff742458                     push       qword ptr [rsp + 0x58]
02228 488f442450                     pop        qword ptr [rsp + 0x50]
0222d 897c2458                       mov        dword ptr [rsp + 0x58], edi
02231 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02239 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
02241 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02249 6690                           nop        
0224b e81079b6ff                     call       0x7f22139c3660
02250 0f1f840048230013               nop        dword ptr [rax + rax + 0x13002348]
02258 be45ffffff                     mov        esi, 0xffffff45
0225d 48894424f8                     mov        qword ptr [rsp - 8], rax
02262 8b442408                       mov        eax, dword ptr [rsp + 8]
02266 890424                         mov        dword ptr [rsp], eax
02269 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0226e 48894424f8                     mov        qword ptr [rsp - 8], rax
02273 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02277 89442404                       mov        dword ptr [rsp + 4], eax
0227b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02280 48ff742410                     push       qword ptr [rsp + 0x10]
02285 488f442408                     pop        qword ptr [rsp + 8]
0228a 48ff742418                     push       qword ptr [rsp + 0x18]
0228f 488f442410                     pop        qword ptr [rsp + 0x10]
02294 48894424f8                     mov        qword ptr [rsp - 8], rax
02299 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0229d 89442418                       mov        dword ptr [rsp + 0x18], eax
022a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a6 48894424f8                     mov        qword ptr [rsp - 8], rax
022ab 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022af 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b8 48894424f8                     mov        qword ptr [rsp - 8], rax
022bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022c1 89442420                       mov        dword ptr [rsp + 0x20], eax
022c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ca 48894424f8                     mov        qword ptr [rsp - 8], rax
022cf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022d3 89442424                       mov        dword ptr [rsp + 0x24], eax
022d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
022e1 48ff742438                     push       qword ptr [rsp + 0x38]
022e6 488f442430                     pop        qword ptr [rsp + 0x30]
022eb 48894424f8                     mov        qword ptr [rsp - 8], rax
022f0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022f4 89442438                       mov        dword ptr [rsp + 0x38], eax
022f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02302 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02306 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0230a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230f 48ff742448                     push       qword ptr [rsp + 0x48]
02314 488f442440                     pop        qword ptr [rsp + 0x40]
02319 48ff742450                     push       qword ptr [rsp + 0x50]
0231e 488f442448                     pop        qword ptr [rsp + 0x48]
02323 48ff742458                     push       qword ptr [rsp + 0x58]
02328 488f442450                     pop        qword ptr [rsp + 0x50]
0232d 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02335 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0233d 6690                           nop        
0233f e81c78b6ff                     call       0x7f22139c3660
02344 0f1f84003c240014               nop        dword ptr [rax + rax + 0x1400243c]
0234c be45ffffff                     mov        esi, 0xffffff45
02351 48894424f8                     mov        qword ptr [rsp - 8], rax
02356 8b442408                       mov        eax, dword ptr [rsp + 8]
0235a 890424                         mov        dword ptr [rsp], eax
0235d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02362 48894424f8                     mov        qword ptr [rsp - 8], rax
02367 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0236b 89442404                       mov        dword ptr [rsp + 4], eax
0236f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02374 48ff742410                     push       qword ptr [rsp + 0x10]
02379 488f442408                     pop        qword ptr [rsp + 8]
0237e 48ff742418                     push       qword ptr [rsp + 0x18]
02383 488f442410                     pop        qword ptr [rsp + 0x10]
02388 48894424f8                     mov        qword ptr [rsp - 8], rax
0238d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02391 89442418                       mov        dword ptr [rsp + 0x18], eax
02395 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0239a 48894424f8                     mov        qword ptr [rsp - 8], rax
0239f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023a3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ac 48894424f8                     mov        qword ptr [rsp - 8], rax
023b1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023b5 89442420                       mov        dword ptr [rsp + 0x20], eax
023b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023be 48894424f8                     mov        qword ptr [rsp - 8], rax
023c3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023c7 89442424                       mov        dword ptr [rsp + 0x24], eax
023cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
023d5 48ff742438                     push       qword ptr [rsp + 0x38]
023da 488f442430                     pop        qword ptr [rsp + 0x30]
023df 48894424f8                     mov        qword ptr [rsp - 8], rax
023e4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023e8 89442438                       mov        dword ptr [rsp + 0x38], eax
023ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f1 48894424f8                     mov        qword ptr [rsp - 8], rax
023f6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023fa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02403 48ff742448                     push       qword ptr [rsp + 0x48]
02408 488f442440                     pop        qword ptr [rsp + 0x40]
0240d 48ff742450                     push       qword ptr [rsp + 0x50]
02412 488f442448                     pop        qword ptr [rsp + 0x48]
02417 48ff742458                     push       qword ptr [rsp + 0x58]
0241c 488f442450                     pop        qword ptr [rsp + 0x50]
02421 48894424f8                     mov        qword ptr [rsp - 8], rax
02426 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0242d 89442458                       mov        dword ptr [rsp + 0x58], eax
02431 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02436 48894424f8                     mov        qword ptr [rsp - 8], rax
0243b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02442 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02446 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244b 48894424f8                     mov        qword ptr [rsp - 8], rax
02450 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02457 89442460                       mov        dword ptr [rsp + 0x60], eax
0245b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02460 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02468 488f442468                     pop        qword ptr [rsp + 0x68]
0246d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02475 488f442470                     pop        qword ptr [rsp + 0x70]
0247a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02482 488f442478                     pop        qword ptr [rsp + 0x78]
02487 48894424f8                     mov        qword ptr [rsp - 8], rax
0248c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02493 89442464                       mov        dword ptr [rsp + 0x64], eax
02497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249c 48894424f8                     mov        qword ptr [rsp - 8], rax
024a1 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024a8 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b4 48894424f8                     mov        qword ptr [rsp - 8], rax
024b9 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024c0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024cc 48894424f8                     mov        qword ptr [rsp - 8], rax
024d1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024d8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
024ec 488f842490000000               pop        qword ptr [rsp + 0x90]
024f4 48894424f8                     mov        qword ptr [rsp - 8], rax
024f9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02500 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02514 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0251c 666690                         nop        
0251f e83c76b6ff                     call       0x7f22139c3660
02524 0f1f84001c260015               nop        dword ptr [rax + rax + 0x1500261c]
0252c be45ffffff                     mov        esi, 0xffffff45
02531 48894424f8                     mov        qword ptr [rsp - 8], rax
02536 8b442408                       mov        eax, dword ptr [rsp + 8]
0253a 890424                         mov        dword ptr [rsp], eax
0253d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02542 48894424f8                     mov        qword ptr [rsp - 8], rax
02547 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0254b 89442404                       mov        dword ptr [rsp + 4], eax
0254f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02554 48ff742410                     push       qword ptr [rsp + 0x10]
02559 488f442408                     pop        qword ptr [rsp + 8]
0255e 48ff742418                     push       qword ptr [rsp + 0x18]
02563 488f442410                     pop        qword ptr [rsp + 0x10]
02568 48894424f8                     mov        qword ptr [rsp - 8], rax
0256d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02571 89442418                       mov        dword ptr [rsp + 0x18], eax
02575 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257a 48894424f8                     mov        qword ptr [rsp - 8], rax
0257f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02583 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02587 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0258c 48894424f8                     mov        qword ptr [rsp - 8], rax
02591 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02595 89442420                       mov        dword ptr [rsp + 0x20], eax
02599 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259e 48894424f8                     mov        qword ptr [rsp - 8], rax
025a3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
025a7 89442424                       mov        dword ptr [rsp + 0x24], eax
025ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b0 48ff742438                     push       qword ptr [rsp + 0x38]
025b5 488f442430                     pop        qword ptr [rsp + 0x30]
025ba 48894424f8                     mov        qword ptr [rsp - 8], rax
025bf 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025c3 89442438                       mov        dword ptr [rsp + 0x38], eax
025c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025cc 48894424f8                     mov        qword ptr [rsp - 8], rax
025d1 8b442444                       mov        eax, dword ptr [rsp + 0x44]
025d5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025de 48ff742448                     push       qword ptr [rsp + 0x48]
025e3 488f442440                     pop        qword ptr [rsp + 0x40]
025e8 48ff742450                     push       qword ptr [rsp + 0x50]
025ed 488f442448                     pop        qword ptr [rsp + 0x48]
025f2 48ff742458                     push       qword ptr [rsp + 0x58]
025f7 488f442450                     pop        qword ptr [rsp + 0x50]
025fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02601 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02608 89442458                       mov        dword ptr [rsp + 0x58], eax
0260c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02611 48894424f8                     mov        qword ptr [rsp - 8], rax
02616 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0261d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02621 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02626 48894424f8                     mov        qword ptr [rsp - 8], rax
0262b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02632 89442460                       mov        dword ptr [rsp + 0x60], eax
02636 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02643 488f442468                     pop        qword ptr [rsp + 0x68]
02648 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02650 488f442470                     pop        qword ptr [rsp + 0x70]
02655 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0265d 488f442478                     pop        qword ptr [rsp + 0x78]
02662 48894424f8                     mov        qword ptr [rsp - 8], rax
02667 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0266e 89442464                       mov        dword ptr [rsp + 0x64], eax
02672 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02677 48894424f8                     mov        qword ptr [rsp - 8], rax
0267c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02683 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0268a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268f 48894424f8                     mov        qword ptr [rsp - 8], rax
02694 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0269b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
026a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a7 48894424f8                     mov        qword ptr [rsp - 8], rax
026ac 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
026b3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
026ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026bf 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026c7 488f842490000000               pop        qword ptr [rsp + 0x90]
026cf 48894424f8                     mov        qword ptr [rsp - 8], rax
026d4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
026db 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
026e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e7 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
026ef 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
026f7 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
026ff 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02707 e85474b6ff                     call       0x7f22139c3660
0270c 0f1f840004280016               nop        dword ptr [rax + rax + 0x16002804]
02714 4533d2                         xor        r10d, r10d
02717 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
0271f e9aadaffff                     jmp        0x7f2213e59cce
02724 4533d2                         xor        r10d, r10d
02727 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0272c e9c9daffff                     jmp        0x7f2213e59cfa
02731 4533d2                         xor        r10d, r10d
02734 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02739 e9e3daffff                     jmp        0x7f2213e59d21
0273e 4533d2                         xor        r10d, r10d
02741 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02746 e902dbffff                     jmp        0x7f2213e59d4d
0274b 4533d2                         xor        r10d, r10d
0274e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02753 e91fdbffff                     jmp        0x7f2213e59d77
02758 4533d2                         xor        r10d, r10d
0275b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02760 e944dbffff                     jmp        0x7f2213e59da9
02765 4533d2                         xor        r10d, r10d
02768 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02770 e961dbffff                     jmp        0x7f2213e59dd6
02775 4533d2                         xor        r10d, r10d
02778 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02780 e977dbffff                     jmp        0x7f2213e59dfc
02785 bebeffffff                     mov        esi, 0xffffffbe
0278a 48894424f8                     mov        qword ptr [rsp - 8], rax
0278f 8b442408                       mov        eax, dword ptr [rsp + 8]
02793 890424                         mov        dword ptr [rsp], eax
02796 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279b 48894424f8                     mov        qword ptr [rsp - 8], rax
027a0 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
027a4 89442404                       mov        dword ptr [rsp + 4], eax
027a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ad 48ff742410                     push       qword ptr [rsp + 0x10]
027b2 488f442408                     pop        qword ptr [rsp + 8]
027b7 48ff742418                     push       qword ptr [rsp + 0x18]
027bc 488f442410                     pop        qword ptr [rsp + 0x10]
027c1 48894424f8                     mov        qword ptr [rsp - 8], rax
027c6 8b442420                       mov        eax, dword ptr [rsp + 0x20]
027ca 89442418                       mov        dword ptr [rsp + 0x18], eax
027ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d3 48894424f8                     mov        qword ptr [rsp - 8], rax
027d8 8b442424                       mov        eax, dword ptr [rsp + 0x24]
027dc 8944241c                       mov        dword ptr [rsp + 0x1c], eax
027e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ea 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027ee 89442420                       mov        dword ptr [rsp + 0x20], eax
027f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f7 48894424f8                     mov        qword ptr [rsp - 8], rax
027fc 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02800 89442424                       mov        dword ptr [rsp + 0x24], eax
02804 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02809 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0280e 48ff742438                     push       qword ptr [rsp + 0x38]
02813 488f442430                     pop        qword ptr [rsp + 0x30]
02818 48894424f8                     mov        qword ptr [rsp - 8], rax
0281d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02821 89442438                       mov        dword ptr [rsp + 0x38], eax
02825 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282a 48894424f8                     mov        qword ptr [rsp - 8], rax
0282f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02833 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02837 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283c 48ff742448                     push       qword ptr [rsp + 0x48]
02841 488f442440                     pop        qword ptr [rsp + 0x40]
02846 48ff742450                     push       qword ptr [rsp + 0x50]
0284b 488f442448                     pop        qword ptr [rsp + 0x48]
02850 48ff742458                     push       qword ptr [rsp + 0x58]
02855 488f442450                     pop        qword ptr [rsp + 0x50]
0285a 90                             nop        
0285b e80073b6ff                     call       0x7f22139c3660
02860 0f1f840058290017               nop        dword ptr [rax + rax + 0x17002958]
02868 be85ffffff                     mov        esi, 0xffffff85
0286d 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02871 48894424f8                     mov        qword ptr [rsp - 8], rax
02876 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0287a 890424                         mov        dword ptr [rsp], eax
0287d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02882 48894424f8                     mov        qword ptr [rsp - 8], rax
02887 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0288b 89442404                       mov        dword ptr [rsp + 4], eax
0288f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02894 48894424f8                     mov        qword ptr [rsp - 8], rax
02899 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0289d 89442408                       mov        dword ptr [rsp + 8], eax
028a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a6 48894424f8                     mov        qword ptr [rsp - 8], rax
028ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028af 8944240c                       mov        dword ptr [rsp + 0xc], eax
028b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b8 48894424f8                     mov        qword ptr [rsp - 8], rax
028bd 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
028c1 89442410                       mov        dword ptr [rsp + 0x10], eax
028c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ca 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
028cf 48ff742438                     push       qword ptr [rsp + 0x38]
028d4 488f442420                     pop        qword ptr [rsp + 0x20]
028d9 48894424f8                     mov        qword ptr [rsp - 8], rax
028de 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028e2 89442414                       mov        dword ptr [rsp + 0x14], eax
028e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028eb 48894424f8                     mov        qword ptr [rsp - 8], rax
028f0 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028f4 89442428                       mov        dword ptr [rsp + 0x28], eax
028f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028fd 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02902 90                             nop        
02903 e85872b6ff                     call       0x7f22139c3660
02908 0f1f8400002a0018               nop        dword ptr [rax + rax + 0x18002a00]
02910 bef6ffffff                     mov        esi, 0xfffffff6
02915 6690                           nop        
02917 e84472b6ff                     call       0x7f22139c3660
0291c 0f1f8400142a0019               nop        dword ptr [rax + rax + 0x19002a14]
02924 be5d000000                     mov        esi, 0x5d
02929 6690                           nop        
0292b e83072b6ff                     call       0x7f22139c3660
02930 0f1f8400282a001a               nop        dword ptr [rax + rax + 0x1a002a28]
02938 bef6ffffff                     mov        esi, 0xfffffff6
0293d 418beb                         mov        ebp, r11d
02940 666690                         nop        
02943 e81872b6ff                     call       0x7f22139c3660
02948 0f1f8400402a001b               nop        dword ptr [rax + rax + 0x1b002a40]
02950 bef6ffffff                     mov        esi, 0xfffffff6
02955 8be9                           mov        ebp, ecx
02957 e80472b6ff                     call       0x7f22139c3660
0295c 0f1f8400542a001c               nop        dword ptr [rax + rax + 0x1c002a54]
02964 bef6ffffff                     mov        esi, 0xfffffff6
02969 418beb                         mov        ebp, r11d
0296c 666690                         nop        
0296f e8ec71b6ff                     call       0x7f22139c3660
02974 0f1f84006c2a001d               nop        dword ptr [rax + rax + 0x1d002a6c]
0297c eb00                           jmp        0x7f2213e5c47e
0297e 488bf0                         mov        rsi, rax
02981 e902e1ffff                     jmp        0x7f2213e5a588
02986 49bab0a5e513227f0000           movabs     r10, 0x7f2213e5a5b0
02990 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02997 e9441aaaff                     jmp        0x7f22138fdee0
0299c e8ffe5a8ff                     call       0x7f22138eaaa0
029a1 e988d6ffff                     jmp        0x7f2213e59b2e
029a6 f4                             hlt        
029a7 f4                             hlt        
