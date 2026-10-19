00000 e87bf1e717                     call       0x7f56c7a4dc00
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
00028 0f858a2b0000                   jne        0x7f56afbd1638
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
0018f 49ba7003c1c7567f0000           movabs     r10, 0x7f56c7c10370
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f84f2260000                   je         0x7f56afbd1324
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fb05010000                 cmp        r11d, 0x105
001c0 0f8546280000                   jne        0x7f56afbd148c
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f84d8260000                   je         0x7f56afbd1334
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16040000                 cmp        r10d, 0x416
001ea 0f851c280000                   jne        0x7f56afbd148c
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84b9260000                   je         0x7f56afbd1341
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a040000                 cmp        r11d, 0x40a
00216 0f85f0270000                   jne        0x7f56afbd148c
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f849f260000                   je         0x7f56afbd134e
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d040000                 cmp        r10d, 0x40d
0023d 0f85c9270000                   jne        0x7f56afbd148c
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f847d260000                   je         0x7f56afbd135b
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d040000                 cmp        r11d, 0x40d
0026c 0f859a270000                   jne        0x7f56afbd148c
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8460260000                   je         0x7f56afbd1368
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d040000                 cmp        r10d, 0x40d
00296 0f8570270000                   jne        0x7f56afbd148c
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f843b260000                   je         0x7f56afbd1375
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fb08010000                 cmp        r11d, 0x108
002c8 0f853e270000                   jne        0x7f56afbd148c
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f8426260000                   je         0x7f56afbd1385
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fa07010000                 cmp        r10d, 0x107
002ee 0f8518270000                   jne        0x7f56afbd148c
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f840b260000                   je         0x7f56afbd1395
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f84fd250000                   je         0x7f56afbd1395
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f84ef250000                   je         0x7f56afbd1395
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00341 458d53f9                       lea        r10d, [r11 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8cc7250000                   jl         0x7f56afbd1395
0034e 4183c3f9                       add        r11d, -7
00352 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0035a e965020000                     jmp        0x7f56afbcf044
0035f 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
00367 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0036c 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00371 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00376 48894424f8                     mov        qword ptr [rsp - 8], rax
0037b 8b442430                       mov        eax, dword ptr [rsp + 0x30]
0037f 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00383 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00388 90                             nop        
00389 90                             nop        
0038a 90                             nop        
0038b 90                             nop        
0038c 90                             nop        
0038d 90                             nop        
0038e 90                             nop        
0038f 90                             nop        
00390 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8d5c100000                   jge        0x7f56afbcfe7c
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d0d120000                   jge        0x7f56afbd0060
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8df0130000                   jge        0x7f56afbd026c
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8dd7150000                   jge        0x7f56afbd047c
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
00478 0f8ef20b0000                   jle        0x7f56afbcfaf0
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f65170000                   jg         0x7f56afbd0670
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8f98180000                   jg         0x7f56afbd07b0
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f331a0000                   jg         0x7f56afbd0958
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83cb1b0000                   jae        0x7f56afbd0b00
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83b5090000                   jae        0x7f56afbcf910
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db8000000                   jge        0x7f56afbcf036
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
00552 0f8d401d0000                   jge        0x7f56afbd0d18
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
0058c 0f8d1a1e0000                   jge        0x7f56afbd0e2c
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
005d1 0f8d87040000                   jge        0x7f56afbcf4de
005d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005dc 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e8 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f0 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f4 453bd9                         cmp        r11d, r9d
005f7 0f8301050000                   jae        0x7f56afbcf57e
005fd 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00602 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00606 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
0060d 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00614 458b4104                       mov        r8d, dword ptr [r9 + 4]
00618 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0061d 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00625 413bc8                         cmp        ecx, r8d
00628 0f83d6050000                   jae        0x7f56afbcf684
0062e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00633 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00637 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063f 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00647 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064b 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00650 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00658 453bd8                         cmp        r11d, r8d
0065b 0f83d3060000                   jae        0x7f56afbcf7b4
00661 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00666 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066e 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00675 ffc5                           inc        ebp
00677 896c2404                       mov        dword ptr [rsp + 4], ebp
0067b 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067f 0f8d4a040000                   jge        0x7f56afbcf54f
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
0074e 0f84580a0000                   je         0x7f56afbcfc2c
00754 4183fb3f                       cmp        r11d, 0x3f
00758 0f8f2a0c0000                   jg         0x7f56afbcfe08
0075e 41ba40000000                   mov        r10d, 0x40
00764 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
00769 453bda                         cmp        r11d, r10d
0076c 7e43                           jle        0x7f56afbcf231
0076e 458bc3                         mov        r8d, r11d
00771 452bc2                         sub        r8d, r10d
00774 4183fa40                       cmp        r10d, 0x40
00778 0f8d2a1f0000                   jge        0x7f56afbd1128
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
007af eb2b                           jmp        0x7f56afbcf25c
007b1 452bd3                         sub        r10d, r11d
007b4 c462abf7d3                     shrx       r10, rbx, r10
007b9 4183fb40                       cmp        r11d, 0x40
007bd 0f8df11c0000                   jge        0x7f56afbd0f34
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
007fa 0f8c90fbffff                   jl         0x7f56afbcee10
00800 458d58c0                       lea        r11d, [r8 - 0x40]
00804 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00809 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080d 83c5f8                         add        ebp, -8
00810 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00814 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00818 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081c 83c1f0                         add        ecx, -0x10
0081f 83f908                         cmp        ecx, 8
00822 0f8ce8010000                   jl         0x7f56afbcf490
00828 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082d 4183c2e8                       add        r10d, -0x18
00831 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00839 0f8220fbffff                   jb         0x7f56afbceddf
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
009ef e8ece5afff                     call       0x7f56af6cda60
009f4 0f1f8400ec0a0001               nop        dword ptr [rax + rax + 0x1000aec]
009fc 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
00a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0a e85110c517                     call       0x7f56c78204e0
00a0f f4                             hlt        
00a10 85c9                           test       ecx, ecx
00a12 7f08                           jg         0x7f56afbcf49c
00a14 4533d2                         xor        r10d, r10d
00a17 e950f9ffff                     jmp        0x7f56afbcedec
00a1c 8be9                           mov        ebp, ecx
00a1e 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a26 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a2a 90                             nop        
00a2b e8b007b6ff                     call       0x7f56af72fc60
00a30 0f1f8400280b0002               nop        dword ptr [rax + rax + 0x2000b28]
00a38 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a3d 41c1e003                       shl        r8d, 3
00a41 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a46 41c1e303                       shl        r11d, 3
00a4a 452bd8                         sub        r11d, r8d
00a4d 4181c3c0000000                 add        r11d, 0xc0
00a54 c462a1f7d0                     shlx       r10, rax, r11
00a59 e90ef9ffff                     jmp        0x7f56afbcedec
00a5e 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a66 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a6e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a73 4d3bd3                         cmp        r10, r11
00a76 7e31                           jle        0x7f56afbcf529
00a78 48be302474e200000000           movabs     rsi, 0xe2742430
00a82 90                             nop        
00a83 e85807b6ff                     call       0x7f56af72fc60
00a88 0f1f8400800b0003               nop        dword ptr [rax + rax + 0x3000b80]
00a90 4885c0                         test       rax, rax
00a93 0f842f200000                   je         0x7f56afbd1548
00a99 488bf0                         mov        rsi, rax
00a9c 4881c430010000                 add        rsp, 0x130
00aa3 5d                             pop        rbp
00aa4 e9379eafff                     jmp        0x7f56af6c9360
00aa9 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00aae 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00ab3 0f8537200000                   jne        0x7f56afbd1570
00ab9 418bc2                         mov        eax, r10d
00abc 4881c430010000                 add        rsp, 0x130
00ac3 5d                             pop        rbp
00ac4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ac8 0f87d4200000                   ja         0x7f56afbd1622
00ace c3                             ret        
00acf 4533d2                         xor        r10d, r10d
00ad2 4533c0                         xor        r8d, r8d
00ad5 4533db                         xor        r11d, r11d
00ad8 33c9                           xor        ecx, ecx
00ada 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ae2 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00aea 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00af2 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00af9 e9e4fbffff                     jmp        0x7f56afbcf162
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
00b87 48ff742438                     push       qword ptr [rsp + 0x38]
00b8c 488f442430                     pop        qword ptr [rsp + 0x30]
00b91 48894424f8                     mov        qword ptr [rsp - 8], rax
00b96 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b9a 89442438                       mov        dword ptr [rsp + 0x38], eax
00b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba8 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00bac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb5 48ff742448                     push       qword ptr [rsp + 0x48]
00bba 488f442440                     pop        qword ptr [rsp + 0x40]
00bbf 48ff742450                     push       qword ptr [rsp + 0x50]
00bc4 488f442448                     pop        qword ptr [rsp + 0x48]
00bc9 48ff742458                     push       qword ptr [rsp + 0x58]
00bce 488f442450                     pop        qword ptr [rsp + 0x50]
00bd3 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bdb 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00be3 e8f8e3afff                     call       0x7f56af6cda60
00be8 0f1f8400e00c0004               nop        dword ptr [rax + rax + 0x4000ce0]
00bf0 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
00bfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfe e85d0ec517                     call       0x7f56c78204e0
00c03 f4                             hlt        
00c04 bee4ffffff                     mov        esi, 0xffffffe4
00c09 48894424f8                     mov        qword ptr [rsp - 8], rax
00c0e 8b442408                       mov        eax, dword ptr [rsp + 8]
00c12 890424                         mov        dword ptr [rsp], eax
00c15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c23 89442404                       mov        dword ptr [rsp + 4], eax
00c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c2c 48ff742410                     push       qword ptr [rsp + 0x10]
00c31 488f442408                     pop        qword ptr [rsp + 8]
00c36 48ff742418                     push       qword ptr [rsp + 0x18]
00c3b 488f442410                     pop        qword ptr [rsp + 0x10]
00c40 48894424f8                     mov        qword ptr [rsp - 8], rax
00c45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c49 89442418                       mov        dword ptr [rsp + 0x18], eax
00c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c52 48894424f8                     mov        qword ptr [rsp - 8], rax
00c57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c64 48894424f8                     mov        qword ptr [rsp - 8], rax
00c69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c6d 89442420                       mov        dword ptr [rsp + 0x20], eax
00c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c76 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c7f 89442424                       mov        dword ptr [rsp + 0x24], eax
00c83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c8d 48ff742438                     push       qword ptr [rsp + 0x38]
00c92 488f442430                     pop        qword ptr [rsp + 0x30]
00c97 48894424f8                     mov        qword ptr [rsp - 8], rax
00c9c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ca0 89442438                       mov        dword ptr [rsp + 0x38], eax
00ca4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ca9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00cb2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cbb 48ff742448                     push       qword ptr [rsp + 0x48]
00cc0 488f442440                     pop        qword ptr [rsp + 0x40]
00cc5 48ff742450                     push       qword ptr [rsp + 0x50]
00cca 488f442448                     pop        qword ptr [rsp + 0x48]
00ccf 48ff742458                     push       qword ptr [rsp + 0x58]
00cd4 488f442450                     pop        qword ptr [rsp + 0x50]
00cd9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cde 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ce5 89442458                       mov        dword ptr [rsp + 0x58], eax
00ce9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cee 48894424f8                     mov        qword ptr [rsp - 8], rax
00cf3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cfa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cfe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d03 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d0b 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d12 90                             nop        
00d13 e8c8e2afff                     call       0x7f56af6cda60
00d18 0f1f8400100e0005               nop        dword ptr [rax + rax + 0x5000e10]
00d20 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
00d2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d2e e82d0dc517                     call       0x7f56c78204e0
00d33 f4                             hlt        
00d34 bee4ffffff                     mov        esi, 0xffffffe4
00d39 48894424f8                     mov        qword ptr [rsp - 8], rax
00d3e 8b442408                       mov        eax, dword ptr [rsp + 8]
00d42 890424                         mov        dword ptr [rsp], eax
00d45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d4f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d53 89442404                       mov        dword ptr [rsp + 4], eax
00d57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d5c 48ff742410                     push       qword ptr [rsp + 0x10]
00d61 488f442408                     pop        qword ptr [rsp + 8]
00d66 48ff742418                     push       qword ptr [rsp + 0x18]
00d6b 488f442410                     pop        qword ptr [rsp + 0x10]
00d70 48894424f8                     mov        qword ptr [rsp - 8], rax
00d75 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d79 89442418                       mov        dword ptr [rsp + 0x18], eax
00d7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d82 48894424f8                     mov        qword ptr [rsp - 8], rax
00d87 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d8b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d94 48894424f8                     mov        qword ptr [rsp - 8], rax
00d99 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d9d 89442420                       mov        dword ptr [rsp + 0x20], eax
00da1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da6 48894424f8                     mov        qword ptr [rsp - 8], rax
00dab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00daf 89442424                       mov        dword ptr [rsp + 0x24], eax
00db3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00dbd 48ff742438                     push       qword ptr [rsp + 0x38]
00dc2 488f442430                     pop        qword ptr [rsp + 0x30]
00dc7 48894424f8                     mov        qword ptr [rsp - 8], rax
00dcc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00dd0 89442438                       mov        dword ptr [rsp + 0x38], eax
00dd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd9 48894424f8                     mov        qword ptr [rsp - 8], rax
00dde 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00de2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00de6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00deb 48ff742448                     push       qword ptr [rsp + 0x48]
00df0 488f442440                     pop        qword ptr [rsp + 0x40]
00df5 48ff742450                     push       qword ptr [rsp + 0x50]
00dfa 488f442448                     pop        qword ptr [rsp + 0x48]
00dff 48ff742458                     push       qword ptr [rsp + 0x58]
00e04 488f442450                     pop        qword ptr [rsp + 0x50]
00e09 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00e15 89442458                       mov        dword ptr [rsp + 0x58], eax
00e19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e23 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e2a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e33 48894424f8                     mov        qword ptr [rsp - 8], rax
00e38 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e3f 89442460                       mov        dword ptr [rsp + 0x60], eax
00e43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e48 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e54 89442464                       mov        dword ptr [rsp + 0x64], eax
00e58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e65 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e6d 90                             nop        
00e6e 90                             nop        
00e6f e86ce1afff                     call       0x7f56af6cda60
00e74 0f1f84006c0f0006               nop        dword ptr [rax + rax + 0x6000f6c]
00e7c 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
00e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e8a e8d10bc517                     call       0x7f56c78204e0
00e8f f4                             hlt        
00e90 bee4ffffff                     mov        esi, 0xffffffe4
00e95 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9a 8b442408                       mov        eax, dword ptr [rsp + 8]
00e9e 890424                         mov        dword ptr [rsp], eax
00ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
00eab 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00eaf 89442404                       mov        dword ptr [rsp + 4], eax
00eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb8 48ff742410                     push       qword ptr [rsp + 0x10]
00ebd 488f442408                     pop        qword ptr [rsp + 8]
00ec2 48ff742418                     push       qword ptr [rsp + 0x18]
00ec7 488f442410                     pop        qword ptr [rsp + 0x10]
00ecc 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00ed5 89442418                       mov        dword ptr [rsp + 0x18], eax
00ed9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ede 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00ee7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00eeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ef9 89442420                       mov        dword ptr [rsp + 0x20], eax
00efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f02 48894424f8                     mov        qword ptr [rsp - 8], rax
00f07 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f0b 89442424                       mov        dword ptr [rsp + 0x24], eax
00f0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f14 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f19 48ff742438                     push       qword ptr [rsp + 0x38]
00f1e 488f442430                     pop        qword ptr [rsp + 0x30]
00f23 48894424f8                     mov        qword ptr [rsp - 8], rax
00f28 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f2c 89442438                       mov        dword ptr [rsp + 0x38], eax
00f30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f35 48894424f8                     mov        qword ptr [rsp - 8], rax
00f3a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f3e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f47 48ff742448                     push       qword ptr [rsp + 0x48]
00f4c 488f442440                     pop        qword ptr [rsp + 0x40]
00f51 48ff742450                     push       qword ptr [rsp + 0x50]
00f56 488f442448                     pop        qword ptr [rsp + 0x48]
00f5b 48ff742458                     push       qword ptr [rsp + 0x58]
00f60 488f442450                     pop        qword ptr [rsp + 0x50]
00f65 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f71 89442458                       mov        dword ptr [rsp + 0x58], eax
00f75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f86 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
00f94 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f9b 89442460                       mov        dword ptr [rsp + 0x60], eax
00f9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa4 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00fa9 48894424f8                     mov        qword ptr [rsp - 8], rax
00fae 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fb5 89442464                       mov        dword ptr [rsp + 0x64], eax
00fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fca 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fe2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fee 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00ffa 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01001 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01006 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0100e 488f842490000000               pop        qword ptr [rsp + 0x90]
01016 48894424f8                     mov        qword ptr [rsp - 8], rax
0101b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01022 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01029 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0102e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01036 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0103e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01046 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0104e 90                             nop        
0104f e88cdfafff                     call       0x7f56af6cda60
01054 0f1f84004c110007               nop        dword ptr [rax + rax + 0x700114c]
0105c 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
01066 4883e4f0                       and        rsp, 0xfffffffffffffff0
0106a e8f109c517                     call       0x7f56c78204e0
0106f f4                             hlt        
01070 33c9                           xor        ecx, ecx
01072 4c3bc9                         cmp        r9, rcx
01075 bdffffffff                     mov        ebp, 0xffffffff
0107a 7c08                           jl         0x7f56afbcfb04
0107c 400f95c5                       setne      bpl
01080 400fb6ed                       movzx      ebp, bpl
01084 be45ffffff                     mov        esi, 0xffffff45
01089 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0108e 48894424f8                     mov        qword ptr [rsp - 8], rax
01093 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0109a 89442460                       mov        dword ptr [rsp + 0x60], eax
0109e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a3 48894424f8                     mov        qword ptr [rsp - 8], rax
010a8 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010af 89442464                       mov        dword ptr [rsp + 0x64], eax
010b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b8 48894424f8                     mov        qword ptr [rsp - 8], rax
010bd 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010c4 89442468                       mov        dword ptr [rsp + 0x68], eax
010c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010cd 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
010d5 48894424f8                     mov        qword ptr [rsp - 8], rax
010da 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010e1 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ea 48894424f8                     mov        qword ptr [rsp - 8], rax
010ef 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010f6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01102 48894424f8                     mov        qword ptr [rsp - 8], rax
01107 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0110e 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01115 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111a 48894424f8                     mov        qword ptr [rsp - 8], rax
0111f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01126 89842490000000                 mov        dword ptr [rsp + 0x90], eax
0112d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01132 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0113a 488f842498000000               pop        qword ptr [rsp + 0x98]
01142 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
0114a 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01152 48894424f8                     mov        qword ptr [rsp - 8], rax
01157 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0115e 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01165 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0116a 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01172 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0117a 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01182 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0118a 90                             nop        
0118b e850deafff                     call       0x7f56af6cda60
01190 0f1f840088120008               nop        dword ptr [rax + rax + 0x8001288]
01198 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
011a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
011a6 e8b508c517                     call       0x7f56c78204e0
011ab f4                             hlt        
011ac be45ffffff                     mov        esi, 0xffffff45
011b1 48894424f8                     mov        qword ptr [rsp - 8], rax
011b6 8b442408                       mov        eax, dword ptr [rsp + 8]
011ba 890424                         mov        dword ptr [rsp], eax
011bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c2 48894424f8                     mov        qword ptr [rsp - 8], rax
011c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011cb 89442404                       mov        dword ptr [rsp + 4], eax
011cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d4 48ff742410                     push       qword ptr [rsp + 0x10]
011d9 488f442408                     pop        qword ptr [rsp + 8]
011de 48ff742418                     push       qword ptr [rsp + 0x18]
011e3 488f442410                     pop        qword ptr [rsp + 0x10]
011e8 48894424f8                     mov        qword ptr [rsp - 8], rax
011ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011f1 89442418                       mov        dword ptr [rsp + 0x18], eax
011f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011fa 48894424f8                     mov        qword ptr [rsp - 8], rax
011ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01203 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01207 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0120c 48894424f8                     mov        qword ptr [rsp - 8], rax
01211 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01215 89442420                       mov        dword ptr [rsp + 0x20], eax
01219 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121e 48894424f8                     mov        qword ptr [rsp - 8], rax
01223 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01227 89442424                       mov        dword ptr [rsp + 0x24], eax
0122b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01230 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01235 48ff742438                     push       qword ptr [rsp + 0x38]
0123a 488f442430                     pop        qword ptr [rsp + 0x30]
0123f 48894424f8                     mov        qword ptr [rsp - 8], rax
01244 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01248 89442438                       mov        dword ptr [rsp + 0x38], eax
0124c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01251 48894424f8                     mov        qword ptr [rsp - 8], rax
01256 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0125a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0125e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01263 48ff742448                     push       qword ptr [rsp + 0x48]
01268 488f442440                     pop        qword ptr [rsp + 0x40]
0126d 48ff742450                     push       qword ptr [rsp + 0x50]
01272 488f442448                     pop        qword ptr [rsp + 0x48]
01277 48ff742458                     push       qword ptr [rsp + 0x58]
0127c 488f442450                     pop        qword ptr [rsp + 0x50]
01281 48894424f8                     mov        qword ptr [rsp - 8], rax
01286 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0128d 89442458                       mov        dword ptr [rsp + 0x58], eax
01291 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01296 48894424f8                     mov        qword ptr [rsp - 8], rax
0129b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012a2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ab 48894424f8                     mov        qword ptr [rsp - 8], rax
012b0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012b7 89442460                       mov        dword ptr [rsp + 0x60], eax
012bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c0 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012c8 488f442468                     pop        qword ptr [rsp + 0x68]
012cd 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012d5 488f442478                     pop        qword ptr [rsp + 0x78]
012da 48894424f8                     mov        qword ptr [rsp - 8], rax
012df 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012e6 89442464                       mov        dword ptr [rsp + 0x64], eax
012ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ef 48894424f8                     mov        qword ptr [rsp - 8], rax
012f4 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
012fb 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01302 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01307 48894424f8                     mov        qword ptr [rsp - 8], rax
0130c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01313 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0131a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131f 48894424f8                     mov        qword ptr [rsp - 8], rax
01324 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0132b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01332 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01337 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0133f 488f842490000000               pop        qword ptr [rsp + 0x90]
01347 48894424f8                     mov        qword ptr [rsp - 8], rax
0134c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01353 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0135a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
01367 e874dcafff                     call       0x7f56af6cda60
0136c 0f1f840064140009               nop        dword ptr [rax + rax + 0x9001464]
01374 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
0137e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01382 e8d906c517                     call       0x7f56c78204e0
01387 f4                             hlt        
01388 be45ffffff                     mov        esi, 0xffffff45
0138d 48894424f8                     mov        qword ptr [rsp - 8], rax
01392 8b442408                       mov        eax, dword ptr [rsp + 8]
01396 890424                         mov        dword ptr [rsp], eax
01399 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139e 48894424f8                     mov        qword ptr [rsp - 8], rax
013a3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013a7 89442404                       mov        dword ptr [rsp + 4], eax
013ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b0 48ff742410                     push       qword ptr [rsp + 0x10]
013b5 488f442408                     pop        qword ptr [rsp + 8]
013ba 48ff742418                     push       qword ptr [rsp + 0x18]
013bf 488f442410                     pop        qword ptr [rsp + 0x10]
013c4 48894424f8                     mov        qword ptr [rsp - 8], rax
013c9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013cd 89442418                       mov        dword ptr [rsp + 0x18], eax
013d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013db e800dcafff                     call       0x7f56af6cda60
013e0 0f1f8400d814000a               nop        dword ptr [rax + rax + 0xa0014d8]
013e8 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
013f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
013f6 e86506c517                     call       0x7f56c78204e0
013fb f4                             hlt        
013fc be45ffffff                     mov        esi, 0xffffff45
01401 48894424f8                     mov        qword ptr [rsp - 8], rax
01406 8b442408                       mov        eax, dword ptr [rsp + 8]
0140a 890424                         mov        dword ptr [rsp], eax
0140d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01412 48894424f8                     mov        qword ptr [rsp - 8], rax
01417 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0141b 89442404                       mov        dword ptr [rsp + 4], eax
0141f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01424 48ff742410                     push       qword ptr [rsp + 0x10]
01429 488f442408                     pop        qword ptr [rsp + 8]
0142e 48ff742418                     push       qword ptr [rsp + 0x18]
01433 488f442410                     pop        qword ptr [rsp + 0x10]
01438 48894424f8                     mov        qword ptr [rsp - 8], rax
0143d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01441 89442418                       mov        dword ptr [rsp + 0x18], eax
01445 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144a 48894424f8                     mov        qword ptr [rsp - 8], rax
0144f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01453 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01457 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145c 48894424f8                     mov        qword ptr [rsp - 8], rax
01461 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01465 89442420                       mov        dword ptr [rsp + 0x20], eax
01469 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146e 48894424f8                     mov        qword ptr [rsp - 8], rax
01473 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01477 89442424                       mov        dword ptr [rsp + 0x24], eax
0147b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01480 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01485 48ff742438                     push       qword ptr [rsp + 0x38]
0148a 488f442430                     pop        qword ptr [rsp + 0x30]
0148f 48894424f8                     mov        qword ptr [rsp - 8], rax
01494 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01498 89442438                       mov        dword ptr [rsp + 0x38], eax
0149c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a1 48894424f8                     mov        qword ptr [rsp - 8], rax
014a6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014aa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b3 48ff742448                     push       qword ptr [rsp + 0x48]
014b8 488f442440                     pop        qword ptr [rsp + 0x40]
014bd 48ff742450                     push       qword ptr [rsp + 0x50]
014c2 488f442448                     pop        qword ptr [rsp + 0x48]
014c7 48ff742458                     push       qword ptr [rsp + 0x58]
014cc 488f442450                     pop        qword ptr [rsp + 0x50]
014d1 48894424f8                     mov        qword ptr [rsp - 8], rax
014d6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014dd 89442458                       mov        dword ptr [rsp + 0x58], eax
014e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014f2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01500 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01507 89442460                       mov        dword ptr [rsp + 0x60], eax
0150b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01510 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01518 488f442468                     pop        qword ptr [rsp + 0x68]
0151d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01525 488f442470                     pop        qword ptr [rsp + 0x70]
0152a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01532 488f442478                     pop        qword ptr [rsp + 0x78]
01537 48894424f8                     mov        qword ptr [rsp - 8], rax
0153c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01543 89442464                       mov        dword ptr [rsp + 0x64], eax
01547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154c 48894424f8                     mov        qword ptr [rsp - 8], rax
01551 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01558 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0155f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01570 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157c 48894424f8                     mov        qword ptr [rsp - 8], rax
01581 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01588 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0158f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01594 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0159c 488f842490000000               pop        qword ptr [rsp + 0x90]
015a4 48894424f8                     mov        qword ptr [rsp - 8], rax
015a9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015b0 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bc 90                             nop        
015bd 90                             nop        
015be 90                             nop        
015bf e81cdaafff                     call       0x7f56af6cda60
015c4 0f1f8400bc16000b               nop        dword ptr [rax + rax + 0xb0016bc]
015cc 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
015d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015da e88104c517                     call       0x7f56c78204e0
015df f4                             hlt        
015e0 be45ffffff                     mov        esi, 0xffffff45
015e5 48894424f8                     mov        qword ptr [rsp - 8], rax
015ea 8b442408                       mov        eax, dword ptr [rsp + 8]
015ee 890424                         mov        dword ptr [rsp], eax
015f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f6 48894424f8                     mov        qword ptr [rsp - 8], rax
015fb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
015ff 89442404                       mov        dword ptr [rsp + 4], eax
01603 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01608 48ff742410                     push       qword ptr [rsp + 0x10]
0160d 488f442408                     pop        qword ptr [rsp + 8]
01612 48ff742418                     push       qword ptr [rsp + 0x18]
01617 488f442410                     pop        qword ptr [rsp + 0x10]
0161c 48894424f8                     mov        qword ptr [rsp - 8], rax
01621 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01625 89442418                       mov        dword ptr [rsp + 0x18], eax
01629 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162e 48894424f8                     mov        qword ptr [rsp - 8], rax
01633 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01637 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0163b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01640 48894424f8                     mov        qword ptr [rsp - 8], rax
01645 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01649 89442420                       mov        dword ptr [rsp + 0x20], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0165b 89442424                       mov        dword ptr [rsp + 0x24], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01669 48ff742438                     push       qword ptr [rsp + 0x38]
0166e 488f442430                     pop        qword ptr [rsp + 0x30]
01673 48894424f8                     mov        qword ptr [rsp - 8], rax
01678 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0167c 89442438                       mov        dword ptr [rsp + 0x38], eax
01680 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01685 48894424f8                     mov        qword ptr [rsp - 8], rax
0168a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0168e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01692 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01697 48ff742448                     push       qword ptr [rsp + 0x48]
0169c 488f442440                     pop        qword ptr [rsp + 0x40]
016a1 48ff742450                     push       qword ptr [rsp + 0x50]
016a6 488f442448                     pop        qword ptr [rsp + 0x48]
016ab 48ff742458                     push       qword ptr [rsp + 0x58]
016b0 488f442450                     pop        qword ptr [rsp + 0x50]
016b5 48894424f8                     mov        qword ptr [rsp - 8], rax
016ba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016c1 89442458                       mov        dword ptr [rsp + 0x58], eax
016c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ca 48894424f8                     mov        qword ptr [rsp - 8], rax
016cf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016d6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016df 48894424f8                     mov        qword ptr [rsp - 8], rax
016e4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016eb 89442460                       mov        dword ptr [rsp + 0x60], eax
016ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f4 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
016fc 488f442468                     pop        qword ptr [rsp + 0x68]
01701 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01709 488f442470                     pop        qword ptr [rsp + 0x70]
0170e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01716 488f442478                     pop        qword ptr [rsp + 0x78]
0171b 48894424f8                     mov        qword ptr [rsp - 8], rax
01720 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01727 89442464                       mov        dword ptr [rsp + 0x64], eax
0172b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01730 48894424f8                     mov        qword ptr [rsp - 8], rax
01735 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0173c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01743 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01748 48894424f8                     mov        qword ptr [rsp - 8], rax
0174d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01754 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0175b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01760 48894424f8                     mov        qword ptr [rsp - 8], rax
01765 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0176c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01773 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01778 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01780 488f842490000000               pop        qword ptr [rsp + 0x90]
01788 48894424f8                     mov        qword ptr [rsp - 8], rax
0178d 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
01794 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
0179b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a0 48894424f8                     mov        qword ptr [rsp - 8], rax
017a5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017ac 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b8 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017c0 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017c8 90                             nop        
017c9 90                             nop        
017ca 90                             nop        
017cb e810d8afff                     call       0x7f56af6cda60
017d0 0f1f8400c818000c               nop        dword ptr [rax + rax + 0xc0018c8]
017d8 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
017e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017e6 e87502c517                     call       0x7f56c78204e0
017eb f4                             hlt        
017ec be45ffffff                     mov        esi, 0xffffff45
017f1 48894424f8                     mov        qword ptr [rsp - 8], rax
017f6 8b442408                       mov        eax, dword ptr [rsp + 8]
017fa 890424                         mov        dword ptr [rsp], eax
017fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01802 48894424f8                     mov        qword ptr [rsp - 8], rax
01807 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0180b 89442404                       mov        dword ptr [rsp + 4], eax
0180f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01814 48ff742410                     push       qword ptr [rsp + 0x10]
01819 488f442408                     pop        qword ptr [rsp + 8]
0181e 48ff742418                     push       qword ptr [rsp + 0x18]
01823 488f442410                     pop        qword ptr [rsp + 0x10]
01828 48894424f8                     mov        qword ptr [rsp - 8], rax
0182d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01831 89442418                       mov        dword ptr [rsp + 0x18], eax
01835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01843 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 48894424f8                     mov        qword ptr [rsp - 8], rax
01851 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01855 89442420                       mov        dword ptr [rsp + 0x20], eax
01859 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185e 48894424f8                     mov        qword ptr [rsp - 8], rax
01863 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01867 89442424                       mov        dword ptr [rsp + 0x24], eax
0186b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01870 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01875 48ff742438                     push       qword ptr [rsp + 0x38]
0187a 488f442430                     pop        qword ptr [rsp + 0x30]
0187f 48894424f8                     mov        qword ptr [rsp - 8], rax
01884 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01888 89442438                       mov        dword ptr [rsp + 0x38], eax
0188c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01891 48894424f8                     mov        qword ptr [rsp - 8], rax
01896 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0189a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0189e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a3 48ff742448                     push       qword ptr [rsp + 0x48]
018a8 488f442440                     pop        qword ptr [rsp + 0x40]
018ad 48ff742450                     push       qword ptr [rsp + 0x50]
018b2 488f442448                     pop        qword ptr [rsp + 0x48]
018b7 48ff742458                     push       qword ptr [rsp + 0x58]
018bc 488f442450                     pop        qword ptr [rsp + 0x50]
018c1 48894424f8                     mov        qword ptr [rsp - 8], rax
018c6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018cd 89442458                       mov        dword ptr [rsp + 0x58], eax
018d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d6 48894424f8                     mov        qword ptr [rsp - 8], rax
018db 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018e2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018eb 48894424f8                     mov        qword ptr [rsp - 8], rax
018f0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018f7 89442460                       mov        dword ptr [rsp + 0x60], eax
018fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01900 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01908 488f442468                     pop        qword ptr [rsp + 0x68]
0190d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01915 488f442470                     pop        qword ptr [rsp + 0x70]
0191a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01922 488f442478                     pop        qword ptr [rsp + 0x78]
01927 48894424f8                     mov        qword ptr [rsp - 8], rax
0192c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01933 89442464                       mov        dword ptr [rsp + 0x64], eax
01937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193c 48894424f8                     mov        qword ptr [rsp - 8], rax
01941 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01948 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0194f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01960 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01978 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0198c 488f842490000000               pop        qword ptr [rsp + 0x90]
01994 48894424f8                     mov        qword ptr [rsp - 8], rax
01999 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019a0 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ac 48894424f8                     mov        qword ptr [rsp - 8], rax
019b1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019b8 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c4 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019cc 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019d3 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019db e800d6afff                     call       0x7f56af6cda60
019e0 0f1f8400d81a000d               nop        dword ptr [rax + rax + 0xd001ad8]
019e8 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
019f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f6 e86500c517                     call       0x7f56c78204e0
019fb f4                             hlt        
019fc be45ffffff                     mov        esi, 0xffffff45
01a01 48894424f8                     mov        qword ptr [rsp - 8], rax
01a06 8b442408                       mov        eax, dword ptr [rsp + 8]
01a0a 890424                         mov        dword ptr [rsp], eax
01a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a12 48894424f8                     mov        qword ptr [rsp - 8], rax
01a17 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a1b 89442404                       mov        dword ptr [rsp + 4], eax
01a1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a24 48ff742410                     push       qword ptr [rsp + 0x10]
01a29 488f442408                     pop        qword ptr [rsp + 8]
01a2e 48ff742418                     push       qword ptr [rsp + 0x18]
01a33 488f442410                     pop        qword ptr [rsp + 0x10]
01a38 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a41 89442418                       mov        dword ptr [rsp + 0x18], eax
01a45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a53 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a61 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a65 89442420                       mov        dword ptr [rsp + 0x20], eax
01a69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a73 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a77 89442424                       mov        dword ptr [rsp + 0x24], eax
01a7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a80 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a85 48ff742438                     push       qword ptr [rsp + 0x38]
01a8a 488f442430                     pop        qword ptr [rsp + 0x30]
01a8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a94 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a98 89442438                       mov        dword ptr [rsp + 0x38], eax
01a9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa1 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01aaa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab3 48ff742448                     push       qword ptr [rsp + 0x48]
01ab8 488f442440                     pop        qword ptr [rsp + 0x40]
01abd 48ff742450                     push       qword ptr [rsp + 0x50]
01ac2 488f442448                     pop        qword ptr [rsp + 0x48]
01ac7 48ff742458                     push       qword ptr [rsp + 0x58]
01acc 488f442450                     pop        qword ptr [rsp + 0x50]
01ad1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01add 89442458                       mov        dword ptr [rsp + 0x58], eax
01ae1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01af2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01af6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afb 48894424f8                     mov        qword ptr [rsp - 8], rax
01b00 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b07 89442460                       mov        dword ptr [rsp + 0x60], eax
01b0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b10 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b18 488f442468                     pop        qword ptr [rsp + 0x68]
01b1d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b25 488f442478                     pop        qword ptr [rsp + 0x78]
01b2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b36 89442464                       mov        dword ptr [rsp + 0x64], eax
01b3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b44 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b4b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b57 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b63 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b74 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b7b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b87 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b8f 488f842490000000               pop        qword ptr [rsp + 0x90]
01b97 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ba3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01baa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01baf 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bb7 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01bbe 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bc5 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bcd 90                             nop        
01bce 90                             nop        
01bcf e80cd4afff                     call       0x7f56af6cda60
01bd4 0f1f8400cc1c000e               nop        dword ptr [rax + rax + 0xe001ccc]
01bdc 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
01be6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bea e871fec417                     call       0x7f56c78204e0
01bef f4                             hlt        
01bf0 be45ffffff                     mov        esi, 0xffffff45
01bf5 b9ffffff7f                     mov        ecx, 0x7fffffff
01bfa 4c3bc9                         cmp        r9, rcx
01bfd bdffffffff                     mov        ebp, 0xffffffff
01c02 7c08                           jl         0x7f56afbd068c
01c04 400f95c5                       setne      bpl
01c08 400fb6ed                       movzx      ebp, bpl
01c0c 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c11 48894424f8                     mov        qword ptr [rsp - 8], rax
01c16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c1d 89442460                       mov        dword ptr [rsp + 0x60], eax
01c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c26 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c32 89442464                       mov        dword ptr [rsp + 0x64], eax
01c36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c47 89442468                       mov        dword ptr [rsp + 0x68], eax
01c4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c50 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c58 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c64 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c72 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c79 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c85 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8a 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01c91 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01c98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca2 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ca9 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb5 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cbd 488f842498000000               pop        qword ptr [rsp + 0x98]
01cc5 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01ccd 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ce1 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01ce8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ced 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01cf5 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01cfd 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01d05 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d0d 90                             nop        
01d0e 90                             nop        
01d0f e8ccd2afff                     call       0x7f56af6cda60
01d14 0f1f84000c1e000f               nop        dword ptr [rax + rax + 0xf001e0c]
01d1c 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
01d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d2a e831fdc417                     call       0x7f56c78204e0
01d2f f4                             hlt        
01d30 be45ffffff                     mov        esi, 0xffffff45
01d35 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3a 8b442408                       mov        eax, dword ptr [rsp + 8]
01d3e 890424                         mov        dword ptr [rsp], eax
01d41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d46 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d4f 89442404                       mov        dword ptr [rsp + 4], eax
01d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d58 48ff742410                     push       qword ptr [rsp + 0x10]
01d5d 488f442408                     pop        qword ptr [rsp + 8]
01d62 48ff742418                     push       qword ptr [rsp + 0x18]
01d67 488f442410                     pop        qword ptr [rsp + 0x10]
01d6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d71 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d75 89442418                       mov        dword ptr [rsp + 0x18], eax
01d79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d83 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d87 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d90 48894424f8                     mov        qword ptr [rsp - 8], rax
01d95 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d99 89442420                       mov        dword ptr [rsp + 0x20], eax
01d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da2 48894424f8                     mov        qword ptr [rsp - 8], rax
01da7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dab 89442424                       mov        dword ptr [rsp + 0x24], eax
01daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01db9 48ff742438                     push       qword ptr [rsp + 0x38]
01dbe 488f442430                     pop        qword ptr [rsp + 0x30]
01dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01dcc 89442438                       mov        dword ptr [rsp + 0x38], eax
01dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dda 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01dde 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01de2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de7 48ff742448                     push       qword ptr [rsp + 0x48]
01dec 488f442440                     pop        qword ptr [rsp + 0x40]
01df1 48ff742450                     push       qword ptr [rsp + 0x50]
01df6 488f442448                     pop        qword ptr [rsp + 0x48]
01dfb 48ff742458                     push       qword ptr [rsp + 0x58]
01e00 488f442450                     pop        qword ptr [rsp + 0x50]
01e05 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e11 89442458                       mov        dword ptr [rsp + 0x58], eax
01e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e26 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e34 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e3b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e49 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e55 89442464                       mov        dword ptr [rsp + 0x64], eax
01e59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e63 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e6a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e82 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e93 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01e9a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea6 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01eae 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01eb6 90                             nop        
01eb7 e824d1afff                     call       0x7f56af6cda60
01ebc 0f1f8400b41f0010               nop        dword ptr [rax + rax + 0x10001fb4]
01ec4 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
01ece 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed2 e889fbc417                     call       0x7f56c78204e0
01ed7 f4                             hlt        
01ed8 be45ffffff                     mov        esi, 0xffffff45
01edd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee2 8b442408                       mov        eax, dword ptr [rsp + 8]
01ee6 890424                         mov        dword ptr [rsp], eax
01ee9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01ef7 89442404                       mov        dword ptr [rsp + 4], eax
01efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f00 48ff742410                     push       qword ptr [rsp + 0x10]
01f05 488f442408                     pop        qword ptr [rsp + 8]
01f0a 48ff742418                     push       qword ptr [rsp + 0x18]
01f0f 488f442410                     pop        qword ptr [rsp + 0x10]
01f14 48894424f8                     mov        qword ptr [rsp - 8], rax
01f19 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f1d 89442418                       mov        dword ptr [rsp + 0x18], eax
01f21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f26 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f2f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f38 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f41 89442420                       mov        dword ptr [rsp + 0x20], eax
01f45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f53 89442424                       mov        dword ptr [rsp + 0x24], eax
01f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f61 48ff742438                     push       qword ptr [rsp + 0x38]
01f66 488f442430                     pop        qword ptr [rsp + 0x30]
01f6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f70 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f74 89442438                       mov        dword ptr [rsp + 0x38], eax
01f78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f86 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8f 48ff742448                     push       qword ptr [rsp + 0x48]
01f94 488f442440                     pop        qword ptr [rsp + 0x40]
01f99 48ff742450                     push       qword ptr [rsp + 0x50]
01f9e 488f442448                     pop        qword ptr [rsp + 0x48]
01fa3 48ff742458                     push       qword ptr [rsp + 0x58]
01fa8 488f442450                     pop        qword ptr [rsp + 0x50]
01fad 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fb9 89442458                       mov        dword ptr [rsp + 0x58], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fce 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01fe3 89442460                       mov        dword ptr [rsp + 0x60], eax
01fe7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fec 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ff1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ffd 89442464                       mov        dword ptr [rsp + 0x64], eax
02001 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02006 48894424f8                     mov        qword ptr [rsp - 8], rax
0200b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02012 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 48894424f8                     mov        qword ptr [rsp - 8], rax
02023 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0202a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02031 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02036 48894424f8                     mov        qword ptr [rsp - 8], rax
0203b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02042 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02056 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
0205e 90                             nop        
0205f e87ccfafff                     call       0x7f56af6cda60
02064 0f1f84005c210011               nop        dword ptr [rax + rax + 0x1100215c]
0206c 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02076 4883e4f0                       and        rsp, 0xfffffffffffffff0
0207a e8e1f9c417                     call       0x7f56c78204e0
0207f f4                             hlt        
02080 be3dffffff                     mov        esi, 0xffffff3d
02085 48894424f8                     mov        qword ptr [rsp - 8], rax
0208a 8b442408                       mov        eax, dword ptr [rsp + 8]
0208e 890424                         mov        dword ptr [rsp], eax
02091 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02096 48894424f8                     mov        qword ptr [rsp - 8], rax
0209b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0209f 89442404                       mov        dword ptr [rsp + 4], eax
020a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a8 48ff742410                     push       qword ptr [rsp + 0x10]
020ad 488f442408                     pop        qword ptr [rsp + 8]
020b2 48ff742418                     push       qword ptr [rsp + 0x18]
020b7 488f442410                     pop        qword ptr [rsp + 0x10]
020bc 48894424f8                     mov        qword ptr [rsp - 8], rax
020c1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020c5 89442418                       mov        dword ptr [rsp + 0x18], eax
020c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ce 48894424f8                     mov        qword ptr [rsp - 8], rax
020d3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020d7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e0 48894424f8                     mov        qword ptr [rsp - 8], rax
020e5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e9 89442420                       mov        dword ptr [rsp + 0x20], eax
020ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f2 48894424f8                     mov        qword ptr [rsp - 8], rax
020f7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
020fb 89442424                       mov        dword ptr [rsp + 0x24], eax
020ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02104 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02109 48ff742438                     push       qword ptr [rsp + 0x38]
0210e 488f442430                     pop        qword ptr [rsp + 0x30]
02113 48894424f8                     mov        qword ptr [rsp - 8], rax
02118 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0211c 89442438                       mov        dword ptr [rsp + 0x38], eax
02120 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02125 48894424f8                     mov        qword ptr [rsp - 8], rax
0212a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0212e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02132 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02137 48ff742448                     push       qword ptr [rsp + 0x48]
0213c 488f442440                     pop        qword ptr [rsp + 0x40]
02141 48ff742450                     push       qword ptr [rsp + 0x50]
02146 488f442448                     pop        qword ptr [rsp + 0x48]
0214b 48ff742458                     push       qword ptr [rsp + 0x58]
02150 488f442450                     pop        qword ptr [rsp + 0x50]
02155 48894424f8                     mov        qword ptr [rsp - 8], rax
0215a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02161 89442458                       mov        dword ptr [rsp + 0x58], eax
02165 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216a 48894424f8                     mov        qword ptr [rsp - 8], rax
0216f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02176 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0217a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217f 48894424f8                     mov        qword ptr [rsp - 8], rax
02184 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0218b 89442460                       mov        dword ptr [rsp + 0x60], eax
0218f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02194 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02199 48894424f8                     mov        qword ptr [rsp - 8], rax
0219e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021a5 89442464                       mov        dword ptr [rsp + 0x64], eax
021a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ae 48894424f8                     mov        qword ptr [rsp - 8], rax
021b3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021ba 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021d2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
021ea 89842488000000                 mov        dword ptr [rsp + 0x88], eax
021f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
021fe 488f842490000000               pop        qword ptr [rsp + 0x90]
02206 48894424f8                     mov        qword ptr [rsp - 8], rax
0220b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02212 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02219 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02226 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0222e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02236 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0223e 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02246 48894424f8                     mov        qword ptr [rsp - 8], rax
0224b 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02252 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02259 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0225e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02266 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0226e 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02276 90                             nop        
02277 e864cdafff                     call       0x7f56af6cda60
0227c 0f1f840074230012               nop        dword ptr [rax + rax + 0x12002374]
02284 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
0228e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02292 e8c9f7c417                     call       0x7f56c78204e0
02297 f4                             hlt        
02298 be45ffffff                     mov        esi, 0xffffff45
0229d 48894424f8                     mov        qword ptr [rsp - 8], rax
022a2 8b442408                       mov        eax, dword ptr [rsp + 8]
022a6 890424                         mov        dword ptr [rsp], eax
022a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ae 48894424f8                     mov        qword ptr [rsp - 8], rax
022b3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022b7 89442404                       mov        dword ptr [rsp + 4], eax
022bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c0 48ff742410                     push       qword ptr [rsp + 0x10]
022c5 488f442408                     pop        qword ptr [rsp + 8]
022ca 48ff742418                     push       qword ptr [rsp + 0x18]
022cf 488f442410                     pop        qword ptr [rsp + 0x10]
022d4 48894424f8                     mov        qword ptr [rsp - 8], rax
022d9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022dd 89442418                       mov        dword ptr [rsp + 0x18], eax
022e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e6 48894424f8                     mov        qword ptr [rsp - 8], rax
022eb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022ef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f8 48894424f8                     mov        qword ptr [rsp - 8], rax
022fd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02301 89442420                       mov        dword ptr [rsp + 0x20], eax
02305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230a 48894424f8                     mov        qword ptr [rsp - 8], rax
0230f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02313 89442424                       mov        dword ptr [rsp + 0x24], eax
02317 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02321 48ff742438                     push       qword ptr [rsp + 0x38]
02326 488f442430                     pop        qword ptr [rsp + 0x30]
0232b 48894424f8                     mov        qword ptr [rsp - 8], rax
02330 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02334 89442438                       mov        dword ptr [rsp + 0x38], eax
02338 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233d 48894424f8                     mov        qword ptr [rsp - 8], rax
02342 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02346 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0234a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0234f 48ff742448                     push       qword ptr [rsp + 0x48]
02354 488f442440                     pop        qword ptr [rsp + 0x40]
02359 48ff742450                     push       qword ptr [rsp + 0x50]
0235e 488f442448                     pop        qword ptr [rsp + 0x48]
02363 48ff742458                     push       qword ptr [rsp + 0x58]
02368 488f442450                     pop        qword ptr [rsp + 0x50]
0236d 897c2458                       mov        dword ptr [rsp + 0x58], edi
02371 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02379 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
02381 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02389 90                             nop        
0238a 90                             nop        
0238b e850ccafff                     call       0x7f56af6cda60
02390 0f1f840088240013               nop        dword ptr [rax + rax + 0x13002488]
02398 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
023a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023a6 e8b5f6c417                     call       0x7f56c78204e0
023ab f4                             hlt        
023ac be45ffffff                     mov        esi, 0xffffff45
023b1 48894424f8                     mov        qword ptr [rsp - 8], rax
023b6 8b442408                       mov        eax, dword ptr [rsp + 8]
023ba 890424                         mov        dword ptr [rsp], eax
023bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c2 48894424f8                     mov        qword ptr [rsp - 8], rax
023c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023cb 89442404                       mov        dword ptr [rsp + 4], eax
023cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d4 48ff742410                     push       qword ptr [rsp + 0x10]
023d9 488f442408                     pop        qword ptr [rsp + 8]
023de 48ff742418                     push       qword ptr [rsp + 0x18]
023e3 488f442410                     pop        qword ptr [rsp + 0x10]
023e8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023f1 89442418                       mov        dword ptr [rsp + 0x18], eax
023f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fa 48894424f8                     mov        qword ptr [rsp - 8], rax
023ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02403 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240c 48894424f8                     mov        qword ptr [rsp - 8], rax
02411 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02415 89442420                       mov        dword ptr [rsp + 0x20], eax
02419 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241e 48894424f8                     mov        qword ptr [rsp - 8], rax
02423 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02427 89442424                       mov        dword ptr [rsp + 0x24], eax
0242b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02430 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02435 48ff742438                     push       qword ptr [rsp + 0x38]
0243a 488f442430                     pop        qword ptr [rsp + 0x30]
0243f 48894424f8                     mov        qword ptr [rsp - 8], rax
02444 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02448 89442438                       mov        dword ptr [rsp + 0x38], eax
0244c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02451 48894424f8                     mov        qword ptr [rsp - 8], rax
02456 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0245a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0245e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02463 48ff742448                     push       qword ptr [rsp + 0x48]
02468 488f442440                     pop        qword ptr [rsp + 0x40]
0246d 48ff742450                     push       qword ptr [rsp + 0x50]
02472 488f442448                     pop        qword ptr [rsp + 0x48]
02477 48ff742458                     push       qword ptr [rsp + 0x58]
0247c 488f442450                     pop        qword ptr [rsp + 0x50]
02481 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02489 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02491 90                             nop        
02492 90                             nop        
02493 e848cbafff                     call       0x7f56af6cda60
02498 0f1f840090250014               nop        dword ptr [rax + rax + 0x14002590]
024a0 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
024aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ae e8adf5c417                     call       0x7f56c78204e0
024b3 f4                             hlt        
024b4 be45ffffff                     mov        esi, 0xffffff45
024b9 48894424f8                     mov        qword ptr [rsp - 8], rax
024be 8b442408                       mov        eax, dword ptr [rsp + 8]
024c2 890424                         mov        dword ptr [rsp], eax
024c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ca 48894424f8                     mov        qword ptr [rsp - 8], rax
024cf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024d3 89442404                       mov        dword ptr [rsp + 4], eax
024d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024dc 48ff742410                     push       qword ptr [rsp + 0x10]
024e1 488f442408                     pop        qword ptr [rsp + 8]
024e6 48ff742418                     push       qword ptr [rsp + 0x18]
024eb 488f442410                     pop        qword ptr [rsp + 0x10]
024f0 48894424f8                     mov        qword ptr [rsp - 8], rax
024f5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
024f9 89442418                       mov        dword ptr [rsp + 0x18], eax
024fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02502 48894424f8                     mov        qword ptr [rsp - 8], rax
02507 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0250b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0250f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02514 48894424f8                     mov        qword ptr [rsp - 8], rax
02519 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0251d 89442420                       mov        dword ptr [rsp + 0x20], eax
02521 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02526 48894424f8                     mov        qword ptr [rsp - 8], rax
0252b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0252f 89442424                       mov        dword ptr [rsp + 0x24], eax
02533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02538 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0253d 48ff742438                     push       qword ptr [rsp + 0x38]
02542 488f442430                     pop        qword ptr [rsp + 0x30]
02547 48894424f8                     mov        qword ptr [rsp - 8], rax
0254c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02550 89442438                       mov        dword ptr [rsp + 0x38], eax
02554 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02559 48894424f8                     mov        qword ptr [rsp - 8], rax
0255e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02562 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02566 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256b 48ff742448                     push       qword ptr [rsp + 0x48]
02570 488f442440                     pop        qword ptr [rsp + 0x40]
02575 48ff742450                     push       qword ptr [rsp + 0x50]
0257a 488f442448                     pop        qword ptr [rsp + 0x48]
0257f 48ff742458                     push       qword ptr [rsp + 0x58]
02584 488f442450                     pop        qword ptr [rsp + 0x50]
02589 48894424f8                     mov        qword ptr [rsp - 8], rax
0258e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02595 89442458                       mov        dword ptr [rsp + 0x58], eax
02599 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259e 48894424f8                     mov        qword ptr [rsp - 8], rax
025a3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025aa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b3 48894424f8                     mov        qword ptr [rsp - 8], rax
025b8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025bf 89442460                       mov        dword ptr [rsp + 0x60], eax
025c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025d0 488f442468                     pop        qword ptr [rsp + 0x68]
025d5 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025dd 488f442470                     pop        qword ptr [rsp + 0x70]
025e2 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
025ea 488f442478                     pop        qword ptr [rsp + 0x78]
025ef 48894424f8                     mov        qword ptr [rsp - 8], rax
025f4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
025fb 89442464                       mov        dword ptr [rsp + 0x64], eax
025ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02604 48894424f8                     mov        qword ptr [rsp - 8], rax
02609 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02610 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02617 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261c 48894424f8                     mov        qword ptr [rsp - 8], rax
02621 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02628 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0262f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02634 48894424f8                     mov        qword ptr [rsp - 8], rax
02639 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02640 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02654 488f842490000000               pop        qword ptr [rsp + 0x90]
0265c 48894424f8                     mov        qword ptr [rsp - 8], rax
02661 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02668 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0266f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02674 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0267c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02684 90                             nop        
02685 90                             nop        
02686 90                             nop        
02687 e854c9afff                     call       0x7f56af6cda60
0268c 0f1f840084270015               nop        dword ptr [rax + rax + 0x15002784]
02694 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
0269e 4883e4f0                       and        rsp, 0xfffffffffffffff0
026a2 e8b9f3c417                     call       0x7f56c78204e0
026a7 f4                             hlt        
026a8 be45ffffff                     mov        esi, 0xffffff45
026ad 48894424f8                     mov        qword ptr [rsp - 8], rax
026b2 8b442408                       mov        eax, dword ptr [rsp + 8]
026b6 890424                         mov        dword ptr [rsp], eax
026b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026be 48894424f8                     mov        qword ptr [rsp - 8], rax
026c3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026c7 89442404                       mov        dword ptr [rsp + 4], eax
026cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d0 48ff742410                     push       qword ptr [rsp + 0x10]
026d5 488f442408                     pop        qword ptr [rsp + 8]
026da 48ff742418                     push       qword ptr [rsp + 0x18]
026df 488f442410                     pop        qword ptr [rsp + 0x10]
026e4 48894424f8                     mov        qword ptr [rsp - 8], rax
026e9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026ed 89442418                       mov        dword ptr [rsp + 0x18], eax
026f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f6 48894424f8                     mov        qword ptr [rsp - 8], rax
026fb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026ff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02703 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02708 48894424f8                     mov        qword ptr [rsp - 8], rax
0270d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02711 89442420                       mov        dword ptr [rsp + 0x20], eax
02715 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271a 48894424f8                     mov        qword ptr [rsp - 8], rax
0271f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02723 89442424                       mov        dword ptr [rsp + 0x24], eax
02727 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0272c 48ff742438                     push       qword ptr [rsp + 0x38]
02731 488f442430                     pop        qword ptr [rsp + 0x30]
02736 48894424f8                     mov        qword ptr [rsp - 8], rax
0273b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0273f 89442438                       mov        dword ptr [rsp + 0x38], eax
02743 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02748 48894424f8                     mov        qword ptr [rsp - 8], rax
0274d 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02751 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02755 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275a 48ff742448                     push       qword ptr [rsp + 0x48]
0275f 488f442440                     pop        qword ptr [rsp + 0x40]
02764 48ff742450                     push       qword ptr [rsp + 0x50]
02769 488f442448                     pop        qword ptr [rsp + 0x48]
0276e 48ff742458                     push       qword ptr [rsp + 0x58]
02773 488f442450                     pop        qword ptr [rsp + 0x50]
02778 48894424f8                     mov        qword ptr [rsp - 8], rax
0277d 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02784 89442458                       mov        dword ptr [rsp + 0x58], eax
02788 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278d 48894424f8                     mov        qword ptr [rsp - 8], rax
02792 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02799 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0279d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a2 48894424f8                     mov        qword ptr [rsp - 8], rax
027a7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
027ae 89442460                       mov        dword ptr [rsp + 0x60], eax
027b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b7 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027bf 488f442468                     pop        qword ptr [rsp + 0x68]
027c4 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027cc 488f442470                     pop        qword ptr [rsp + 0x70]
027d1 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
027d9 488f442478                     pop        qword ptr [rsp + 0x78]
027de 48894424f8                     mov        qword ptr [rsp - 8], rax
027e3 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
027ea 89442464                       mov        dword ptr [rsp + 0x64], eax
027ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f3 48894424f8                     mov        qword ptr [rsp - 8], rax
027f8 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
027ff 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02806 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0280b 48894424f8                     mov        qword ptr [rsp - 8], rax
02810 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02817 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0281e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02823 48894424f8                     mov        qword ptr [rsp - 8], rax
02828 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0282f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02836 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283b 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02843 488f842490000000               pop        qword ptr [rsp + 0x90]
0284b 48894424f8                     mov        qword ptr [rsp - 8], rax
02850 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02857 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0285e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02863 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0286b 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
02873 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0287b 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02883 e858c7afff                     call       0x7f56af6cda60
02888 0f1f840080290016               nop        dword ptr [rax + rax + 0x16002980]
02890 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
0289a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0289e e8bdf1c417                     call       0x7f56c78204e0
028a3 f4                             hlt        
028a4 4533d2                         xor        r10d, r10d
028a7 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
028af e91ad9ffff                     jmp        0x7f56afbcec4e
028b4 4533d2                         xor        r10d, r10d
028b7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028bc e939d9ffff                     jmp        0x7f56afbcec7a
028c1 4533d2                         xor        r10d, r10d
028c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028c9 e953d9ffff                     jmp        0x7f56afbceca1
028ce 4533d2                         xor        r10d, r10d
028d1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
028d6 e972d9ffff                     jmp        0x7f56afbceccd
028db 4533d2                         xor        r10d, r10d
028de 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028e3 e98fd9ffff                     jmp        0x7f56afbcecf7
028e8 4533d2                         xor        r10d, r10d
028eb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028f0 e9b4d9ffff                     jmp        0x7f56afbced29
028f5 4533d2                         xor        r10d, r10d
028f8 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02900 e9d1d9ffff                     jmp        0x7f56afbced56
02905 4533d2                         xor        r10d, r10d
02908 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02910 e9e7d9ffff                     jmp        0x7f56afbced7c
02915 bebeffffff                     mov        esi, 0xffffffbe
0291a 48894424f8                     mov        qword ptr [rsp - 8], rax
0291f 8b442408                       mov        eax, dword ptr [rsp + 8]
02923 890424                         mov        dword ptr [rsp], eax
02926 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292b 48894424f8                     mov        qword ptr [rsp - 8], rax
02930 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02934 89442404                       mov        dword ptr [rsp + 4], eax
02938 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293d 48ff742410                     push       qword ptr [rsp + 0x10]
02942 488f442408                     pop        qword ptr [rsp + 8]
02947 48ff742418                     push       qword ptr [rsp + 0x18]
0294c 488f442410                     pop        qword ptr [rsp + 0x10]
02951 48894424f8                     mov        qword ptr [rsp - 8], rax
02956 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0295a 89442418                       mov        dword ptr [rsp + 0x18], eax
0295e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02963 48894424f8                     mov        qword ptr [rsp - 8], rax
02968 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0296c 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02970 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02975 48894424f8                     mov        qword ptr [rsp - 8], rax
0297a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0297e 89442420                       mov        dword ptr [rsp + 0x20], eax
02982 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02987 48894424f8                     mov        qword ptr [rsp - 8], rax
0298c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02990 89442424                       mov        dword ptr [rsp + 0x24], eax
02994 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02999 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0299e 48ff742438                     push       qword ptr [rsp + 0x38]
029a3 488f442430                     pop        qword ptr [rsp + 0x30]
029a8 48894424f8                     mov        qword ptr [rsp - 8], rax
029ad 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029b1 89442438                       mov        dword ptr [rsp + 0x38], eax
029b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ba 48894424f8                     mov        qword ptr [rsp - 8], rax
029bf 8b442444                       mov        eax, dword ptr [rsp + 0x44]
029c3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cc 48ff742448                     push       qword ptr [rsp + 0x48]
029d1 488f442440                     pop        qword ptr [rsp + 0x40]
029d6 48ff742450                     push       qword ptr [rsp + 0x50]
029db 488f442448                     pop        qword ptr [rsp + 0x48]
029e0 48ff742458                     push       qword ptr [rsp + 0x58]
029e5 488f442450                     pop        qword ptr [rsp + 0x50]
029ea 90                             nop        
029eb e8f0c5afff                     call       0x7f56af6cda60
029f0 0f1f8400e82a0017               nop        dword ptr [rax + rax + 0x17002ae8]
029f8 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a06 e855f0c417                     call       0x7f56c78204e0
02a0b f4                             hlt        
02a0c be85ffffff                     mov        esi, 0xffffff85
02a11 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a15 48894424f8                     mov        qword ptr [rsp - 8], rax
02a1a 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a1e 890424                         mov        dword ptr [rsp], eax
02a21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a26 48894424f8                     mov        qword ptr [rsp - 8], rax
02a2b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a2f 89442404                       mov        dword ptr [rsp + 4], eax
02a33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a38 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a41 89442408                       mov        dword ptr [rsp + 8], eax
02a45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a53 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5c 48894424f8                     mov        qword ptr [rsp - 8], rax
02a61 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a65 89442410                       mov        dword ptr [rsp + 0x10], eax
02a69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6e 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a73 48ff742438                     push       qword ptr [rsp + 0x38]
02a78 488f442420                     pop        qword ptr [rsp + 0x20]
02a7d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a82 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a86 89442414                       mov        dword ptr [rsp + 0x14], eax
02a8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8f 48894424f8                     mov        qword ptr [rsp - 8], rax
02a94 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02a98 89442428                       mov        dword ptr [rsp + 0x28], eax
02a9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa1 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02aa6 90                             nop        
02aa7 e834c5afff                     call       0x7f56af6cda60
02aac 0f1f8400a42b0018               nop        dword ptr [rax + rax + 0x18002ba4]
02ab4 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02abe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ac2 e899efc417                     call       0x7f56c78204e0
02ac7 f4                             hlt        
02ac8 bef6ffffff                     mov        esi, 0xfffffff6
02acd 90                             nop        
02ace 90                             nop        
02acf e80cc5afff                     call       0x7f56af6cda60
02ad4 0f1f8400cc2b0019               nop        dword ptr [rax + rax + 0x19002bcc]
02adc 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02ae6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aea e871efc417                     call       0x7f56c78204e0
02aef f4                             hlt        
02af0 be5d000000                     mov        esi, 0x5d
02af5 90                             nop        
02af6 90                             nop        
02af7 e8e4c4afff                     call       0x7f56af6cda60
02afc 0f1f8400f42b001a               nop        dword ptr [rax + rax + 0x1a002bf4]
02b04 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02b0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b12 e849efc417                     call       0x7f56c78204e0
02b17 f4                             hlt        
02b18 bef6ffffff                     mov        esi, 0xfffffff6
02b1d 418beb                         mov        ebp, r11d
02b20 90                             nop        
02b21 90                             nop        
02b22 90                             nop        
02b23 e8b8c4afff                     call       0x7f56af6cda60
02b28 0f1f8400202c001b               nop        dword ptr [rax + rax + 0x1b002c20]
02b30 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02b3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3e e81defc417                     call       0x7f56c78204e0
02b43 f4                             hlt        
02b44 bef6ffffff                     mov        esi, 0xfffffff6
02b49 8be9                           mov        ebp, ecx
02b4b e890c4afff                     call       0x7f56af6cda60
02b50 0f1f8400482c001c               nop        dword ptr [rax + rax + 0x1c002c48]
02b58 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b66 e8f5eec417                     call       0x7f56c78204e0
02b6b f4                             hlt        
02b6c bef6ffffff                     mov        esi, 0xfffffff6
02b71 418beb                         mov        ebp, r11d
02b74 90                             nop        
02b75 90                             nop        
02b76 90                             nop        
02b77 e864c4afff                     call       0x7f56af6cda60
02b7c 0f1f8400742c001d               nop        dword ptr [rax + rax + 0x1d002c74]
02b84 48bf50142788567f0000           movabs     rdi, 0x7f5688271450
02b8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b92 e8c9eec417                     call       0x7f56c78204e0
02b97 f4                             hlt        
02b98 eb00                           jmp        0x7f56afbd161a
02b9a 488bf0                         mov        rsi, rax
02b9d e9fadeffff                     jmp        0x7f56afbcf51c
02ba2 49ba44f5bcaf567f0000           movabs     r10, 0x7f56afbcf544
02bac 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02bb3 e9280db6ff                     jmp        0x7f56af732360
02bb8 e8a3dbb4ff                     call       0x7f56af71f1e0
02bbd e96cd4ffff                     jmp        0x7f56afbceaae
02bc2 f4                             hlt        
02bc3 f4                             hlt        
02bc4 f4                             hlt        
02bc5 f4                             hlt        
02bc6 f4                             hlt        
02bc7 f4                             hlt        
