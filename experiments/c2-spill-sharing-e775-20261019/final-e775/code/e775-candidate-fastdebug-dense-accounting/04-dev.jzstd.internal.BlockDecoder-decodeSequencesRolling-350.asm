00000 e87bca3c17                     call       0x7ff8eef9a300
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
00028 0f8592290000                   jne        0x7ff8d7bd0240
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
0018f 49ba70ca15eff87f0000           movabs     r10, 0x7ff8ef15ca70
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f84fa240000                   je         0x7ff8d7bcff2c
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbf9060000                 cmp        r11d, 0x6f9
001c0 0f854e260000                   jne        0x7ff8d7bd0094
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f84e0240000                   je         0x7ff8d7bcff3c
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f8524260000                   jne        0x7ff8d7bd0094
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84c1240000                   je         0x7ff8d7bcff49
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f85f8250000                   jne        0x7ff8d7bd0094
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f84a7240000                   je         0x7ff8d7bcff56
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f85d1250000                   jne        0x7ff8d7bd0094
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8485240000                   je         0x7ff8d7bcff63
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f85a2250000                   jne        0x7ff8d7bd0094
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8468240000                   je         0x7ff8d7bcff70
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f8578250000                   jne        0x7ff8d7bd0094
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f8443240000                   je         0x7ff8d7bcff7d
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbfc060000                 cmp        r11d, 0x6fc
002c8 0f8546250000                   jne        0x7ff8d7bd0094
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f842e240000                   je         0x7ff8d7bcff8d
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fafb060000                 cmp        r10d, 0x6fb
002ee 0f8520250000                   jne        0x7ff8d7bd0094
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f8413240000                   je         0x7ff8d7bcff9d
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8405240000                   je         0x7ff8d7bcff9d
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f84f7230000                   je         0x7ff8d7bcff9d
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d50f9                       lea        r10d, [r8 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8ccf230000                   jl         0x7ff8d7bcff9d
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e964020000                     jmp        0x7ff8d7bcde43
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
0039a 0f8d58100000                   jge        0x7ff8d7bcec78
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d09120000                   jge        0x7ff8d7bcee5c
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8dec130000                   jge        0x7ff8d7bcf068
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8dd3150000                   jge        0x7ff8d7bcf278
00425 41b801000000                   mov        r8d, 1
0042b c442d1f7c8                     shlx       r9, r8, rbp
00430 49ffc9                         dec        r9
00433 4d23cb                         and        r9, r11
00436 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0043e 458bdb                         mov        r11d, r11d
00441 4403d9                         add        r11d, ecx
00444 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0044c 458bc0                         mov        r8d, r8d
0044f 4403c7                         add        r8d, edi
00452 4963cb                         movsxd     rcx, r11d
00455 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
0045d 8bff                           mov        edi, edi
0045f 4c03cf                         add        r9, rdi
00462 488bbc24a8000000               mov        rdi, qword ptr [rsp + 0xa8]
0046a 4803f9                         add        rdi, rcx
0046d 4889bc24a8000000               mov        qword ptr [rsp + 0xa8], rdi
00475 4d85c9                         test       r9, r9
00478 0f8eee0b0000                   jle        0x7ff8d7bce8ec
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f61170000                   jg         0x7ff8d7bcf46c
0048b 4181f8ffff0100                 cmp        r8d, 0x1ffff
00492 0f8f94180000                   jg         0x7ff8d7bcf5ac
00498 4181fbffff0300                 cmp        r11d, 0x3ffff
0049f 0f8f2f1a0000                   jg         0x7ff8d7bcf754
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83c71b0000                   jae        0x7ff8d7bcf8fc
004b5 48c1e112                       shl        rcx, 0x12
004b9 4d63d9                         movsxd     r11, r9d
004bc 4d63c0                         movsxd     r8, r8d
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83b1090000                   jae        0x7ff8d7bce70c
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db7000000                   jge        0x7ff8d7bcde35
004fe 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00512 49c1e930                       shr        r9, 0x30
00516 458bc3                         mov        r8d, r11d
00519 418bf9                         mov        edi, r9d
0051c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00524 c44233f7da                     shrx       r11d, r10d, r9d
00529 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
00530 038c24bc000000                 add        ecx, dword ptr [rsp + 0xbc]
00537 c44273f7ca                     shrx       r9d, r10d, ecx
0053c 4103f9                         add        edi, r9d
0053f 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
00546 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054d 83f920                         cmp        ecx, 0x20
00550 0f8d3e1d0000                   jge        0x7ff8d7bcfb14
00556 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0055e 49c1e930                       shr        r9, 0x30
00562 418bc9                         mov        ecx, r9d
00565 ba01000000                     mov        edx, 1
0056a 8bbc24bc000000                 mov        edi, dword ptr [rsp + 0xbc]
00571 c46241f7ca                     shlx       r9d, edx, edi
00576 41ffc9                         dec        r9d
00579 4523cb                         and        r9d, r11d
0057c 4503c8                         add        r9d, r8d
0057f 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00587 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
0058f 4183fb20                       cmp        r11d, 0x20
00593 0f8d0f1e0000                   jge        0x7ff8d7bcfc28
00599 41b901000000                   mov        r9d, 1
0059f c44221f7d9                     shlx       r11d, r9d, r11d
005a4 41ffcb                         dec        r11d
005a7 4523da                         and        r11d, r10d
005aa 4403d9                         add        r11d, ecx
005ad 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
005b5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005b9 418502                         test       dword ptr [r10], eax
005bc 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c3 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005cb 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005d0 0f8d80040000                   jge        0x7ff8d7bce2d6
005d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005db 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005df 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e7 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005ef 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f3 453bd9                         cmp        r11d, r9d
005f6 0f83fc040000                   jae        0x7ff8d7bce378
005fc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00601 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00605 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
0060c 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00613 458b4104                       mov        r8d, dword ptr [r9 + 4]
00617 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0061c 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00624 413bc8                         cmp        ecx, r8d
00627 0f83d3050000                   jae        0x7ff8d7bce480
0062d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00632 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00636 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063e 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00646 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064a 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
0064f 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00657 453bd8                         cmp        r11d, r8d
0065a 0f83d0060000                   jae        0x7ff8d7bce5b0
00660 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00665 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066d 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00674 ffc5                           inc        ebp
00676 896c2404                       mov        dword ptr [rsp + 4], ebp
0067a 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067e 0f8d45040000                   jge        0x7ff8d7bce349
00684 49c1ea28                       shr        r10, 0x28
00688 458bda                         mov        r11d, r10d
0068b 450fb6db                       movzx      r11d, r11b
0068f 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00697 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0069f 49c1ea28                       shr        r10, 0x28
006a3 458bd2                         mov        r10d, r10d
006a6 450fb6c2                       movzx      r8d, r10b
006aa 4503c3                         add        r8d, r11d
006ad 4d8bd1                         mov        r10, r9
006b0 49c1ea28                       shr        r10, 0x28
006b4 458bda                         mov        r11d, r10d
006b7 450fb6d3                       movzx      r10d, r11b
006bb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
006c3 4503c2                         add        r8d, r10d
006c6 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
006ce 41bb01000000                   mov        r11d, 1
006d4 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
006dc 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006e4 49c1ea20                       shr        r10, 0x20
006e8 458bd2                         mov        r10d, r10d
006eb 410fb6ea                       movzx      ebp, r10b
006ef 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006f6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006fe 49c1ea20                       shr        r10, 0x20
00702 458bda                         mov        r11d, r10d
00705 410fb6eb                       movzx      ebp, r11b
00709 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00710 4d8bd1                         mov        r10, r9
00713 49c1ea20                       shr        r10, 0x20
00717 458bd2                         mov        r10d, r10d
0071a 410fb6ea                       movzx      ebp, r10b
0071e 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00725 448bd5                         mov        r10d, ebp
00728 44039424f8000000               add        r10d, dword ptr [rsp + 0xf8]
00730 44039424fc000000               add        r10d, dword ptr [rsp + 0xfc]
00738 44039424f4000000               add        r10d, dword ptr [rsp + 0xf4]
00740 4585d2                         test       r10d, r10d
00743 0f845f0a0000                   je         0x7ff8d7bcea28
00749 4183fa3f                       cmp        r10d, 0x3f
0074d 0f8f310c0000                   jg         0x7ff8d7bcec04
00753 41b840000000                   mov        r8d, 0x40
00759 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
0075e 453bd0                         cmp        r10d, r8d
00761 7e43                           jle        0x7ff8d7bce026
00763 458bda                         mov        r11d, r10d
00766 452bd8                         sub        r11d, r8d
00769 4183f840                       cmp        r8d, 0x40
0076d 0f8d3d1d0000                   jge        0x7ff8d7bcfd30
00773 41b901000000                   mov        r9d, 1
00779 c442b9f7c1                     shlx       r8, r9, r8
0077e 49ffc8                         dec        r8
00781 4c23c3                         and        r8, rbx
00784 c442a1f7c8                     shlx       r9, r8, r11
00789 41b840000000                   mov        r8d, 0x40
0078f 452bc3                         sub        r8d, r11d
00792 c462bbf75c2438                 shrx       r11, qword ptr [rsp + 0x38], r8
00799 4d0bcb                         or         r9, r11
0079c 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
007a4 eb21                           jmp        0x7ff8d7bce047
007a6 41bb01000000                   mov        r11d, 1
007ac c442a9f7db                     shlx       r11, r11, r10
007b1 452bc2                         sub        r8d, r10d
007b4 c462bbf7c3                     shrx       r8, rbx, r8
007b9 49ffcb                         dec        r11
007bc 4d23c3                         and        r8, r11
007bf 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007c7 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
007cc 4503c2                         add        r8d, r10d
007cf 4489442440                     mov        dword ptr [rsp + 0x40], r8d
007d4 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
007d9 4503da                         add        r11d, r10d
007dc 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
007e1 4183f840                       cmp        r8d, 0x40
007e5 0f8ca5fbffff                   jl         0x7ff8d7bcdc10
007eb 458d50c0                       lea        r10d, [r8 - 0x40]
007ef 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007f4 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007f8 83c5f8                         add        ebp, -8
007fb 896c2430                       mov        dword ptr [rsp + 0x30], ebp
007ff 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00803 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00807 83c1f0                         add        ecx, -0x10
0080a 83f908                         cmp        ecx, 8
0080d 0f8cf5010000                   jl         0x7ff8d7bce288
00813 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00818 4183c2e8                       add        r10d, -0x18
0081c 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00824 0f8235fbffff                   jb         0x7ff8d7bcdbdf
0082a bee4ffffff                     mov        esi, 0xffffffe4
0082f 48894424f8                     mov        qword ptr [rsp - 8], rax
00834 8b442408                       mov        eax, dword ptr [rsp + 8]
00838 890424                         mov        dword ptr [rsp], eax
0083b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00840 48894424f8                     mov        qword ptr [rsp - 8], rax
00845 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00849 89442404                       mov        dword ptr [rsp + 4], eax
0084d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00852 48ff742410                     push       qword ptr [rsp + 0x10]
00857 488f442408                     pop        qword ptr [rsp + 8]
0085c 48ff742418                     push       qword ptr [rsp + 0x18]
00861 488f442410                     pop        qword ptr [rsp + 0x10]
00866 48894424f8                     mov        qword ptr [rsp - 8], rax
0086b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0086f 89442418                       mov        dword ptr [rsp + 0x18], eax
00873 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00878 48894424f8                     mov        qword ptr [rsp - 8], rax
0087d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00881 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00885 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088a 48894424f8                     mov        qword ptr [rsp - 8], rax
0088f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00893 89442420                       mov        dword ptr [rsp + 0x20], eax
00897 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089c 48894424f8                     mov        qword ptr [rsp - 8], rax
008a1 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008a5 89442424                       mov        dword ptr [rsp + 0x24], eax
008a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ae 48ff742438                     push       qword ptr [rsp + 0x38]
008b3 488f442428                     pop        qword ptr [rsp + 0x28]
008b8 48894424f8                     mov        qword ptr [rsp - 8], rax
008bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
008c1 89442430                       mov        dword ptr [rsp + 0x30], eax
008c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ca 48894424f8                     mov        qword ptr [rsp - 8], rax
008cf 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008d3 89442434                       mov        dword ptr [rsp + 0x34], eax
008d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008dc 48ff742448                     push       qword ptr [rsp + 0x48]
008e1 488f442438                     pop        qword ptr [rsp + 0x38]
008e6 48ff742450                     push       qword ptr [rsp + 0x50]
008eb 488f442440                     pop        qword ptr [rsp + 0x40]
008f0 48ff742458                     push       qword ptr [rsp + 0x58]
008f5 488f442448                     pop        qword ptr [rsp + 0x48]
008fa 48894424f8                     mov        qword ptr [rsp - 8], rax
008ff 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00906 89442450                       mov        dword ptr [rsp + 0x50], eax
0090a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0090f 48894424f8                     mov        qword ptr [rsp - 8], rax
00914 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0091b 89442454                       mov        dword ptr [rsp + 0x54], eax
0091f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00924 48894424f8                     mov        qword ptr [rsp - 8], rax
00929 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00930 89442458                       mov        dword ptr [rsp + 0x58], eax
00934 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00939 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00941 488f442460                     pop        qword ptr [rsp + 0x60]
00946 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0094e 488f442468                     pop        qword ptr [rsp + 0x68]
00953 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0095b 488f442470                     pop        qword ptr [rsp + 0x70]
00960 48894424f8                     mov        qword ptr [rsp - 8], rax
00965 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0096c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00970 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00975 48894424f8                     mov        qword ptr [rsp - 8], rax
0097a 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00981 89442478                       mov        dword ptr [rsp + 0x78], eax
00985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098a 48894424f8                     mov        qword ptr [rsp - 8], rax
0098f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00996 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0099a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099f 48894424f8                     mov        qword ptr [rsp - 8], rax
009a4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009ab 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009bf 488f842488000000               pop        qword ptr [rsp + 0x88]
009c7 48894424f8                     mov        qword ptr [rsp - 8], rax
009cc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d3 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009df 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009e7 e8f4f7afff                     call       0x7ff8d76cda60
009ec 0f1f8400e40a0001               nop        dword ptr [rax + rax + 0x1000ae4]
009f4 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
009fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a02 e859e91917                     call       0x7ff8eed6cbe0
00a07 f4                             hlt        
00a08 85c9                           test       ecx, ecx
00a0a 7f08                           jg         0x7ff8d7bce294
00a0c 4533d2                         xor        r10d, r10d
00a0f e958f9ffff                     jmp        0x7ff8d7bcdbec
00a14 8be9                           mov        ebp, ecx
00a16 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a1e 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a22 90                             nop        
00a23 e8b819b6ff                     call       0x7ff8d772fc60
00a28 0f1f8400200b0002               nop        dword ptr [rax + rax + 0x2000b20]
00a30 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a35 41c1e003                       shl        r8d, 3
00a39 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a3e 41c1e303                       shl        r11d, 3
00a42 452bd8                         sub        r11d, r8d
00a45 4181c3c0000000                 add        r11d, 0xc0
00a4c c462a1f7d0                     shlx       r10, rax, r11
00a51 e916f9ffff                     jmp        0x7ff8d7bcdbec
00a56 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a5e 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a66 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a6b 4d3bd3                         cmp        r10, r11
00a6e 7f26                           jg         0x7ff8d7bce316
00a70 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a75 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a7a 0f85781e0000                   jne        0x7ff8d7bd0178
00a80 418bc2                         mov        eax, r10d
00a83 4881c430010000                 add        rsp, 0x130
00a8a 5d                             pop        rbp
00a8b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a8f 0f87151f0000                   ja         0x7ff8d7bd022a
00a95 c3                             ret        
00a96 48be68b172e200000000           movabs     rsi, 0xe272b168
00aa0 90                             nop        
00aa1 90                             nop        
00aa2 90                             nop        
00aa3 e83819b6ff                     call       0x7ff8d772fc60
00aa8 0f1f8400a00b0003               nop        dword ptr [rax + rax + 0x3000ba0]
00ab0 4885c0                         test       rax, rax
00ab3 0f84171e0000                   je         0x7ff8d7bd0150
00ab9 488bf0                         mov        rsi, rax
00abc 4881c430010000                 add        rsp, 0x130
00ac3 5d                             pop        rbp
00ac4 e91778afff                     jmp        0x7ff8d76c5b60
00ac9 4533d2                         xor        r10d, r10d
00acc 4533c0                         xor        r8d, r8d
00acf 4533db                         xor        r11d, r11d
00ad2 33c9                           xor        ecx, ecx
00ad4 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00adc 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00ae4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00aec 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00af3 e9e4fbffff                     jmp        0x7ff8d7bcdf5c
00af8 bee4ffffff                     mov        esi, 0xffffffe4
00afd 48894424f8                     mov        qword ptr [rsp - 8], rax
00b02 8b442408                       mov        eax, dword ptr [rsp + 8]
00b06 890424                         mov        dword ptr [rsp], eax
00b09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b13 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b17 89442404                       mov        dword ptr [rsp + 4], eax
00b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b20 48ff742410                     push       qword ptr [rsp + 0x10]
00b25 488f442408                     pop        qword ptr [rsp + 8]
00b2a 48ff742418                     push       qword ptr [rsp + 0x18]
00b2f 488f442410                     pop        qword ptr [rsp + 0x10]
00b34 48894424f8                     mov        qword ptr [rsp - 8], rax
00b39 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b3d 89442418                       mov        dword ptr [rsp + 0x18], eax
00b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b46 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b4f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b58 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b61 89442420                       mov        dword ptr [rsp + 0x20], eax
00b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b6f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b73 89442424                       mov        dword ptr [rsp + 0x24], eax
00b77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b7c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b81 48ff742438                     push       qword ptr [rsp + 0x38]
00b86 488f442430                     pop        qword ptr [rsp + 0x30]
00b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00b90 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b94 89442438                       mov        dword ptr [rsp + 0x38], eax
00b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9d 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ba6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00baa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00baf 48ff742448                     push       qword ptr [rsp + 0x48]
00bb4 488f442440                     pop        qword ptr [rsp + 0x40]
00bb9 48ff742450                     push       qword ptr [rsp + 0x50]
00bbe 488f442448                     pop        qword ptr [rsp + 0x48]
00bc3 48ff742458                     push       qword ptr [rsp + 0x58]
00bc8 488f442450                     pop        qword ptr [rsp + 0x50]
00bcd 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bd5 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bdd 90                             nop        
00bde 90                             nop        
00bdf e8fcf5afff                     call       0x7ff8d76cda60
00be4 0f1f8400dc0c0004               nop        dword ptr [rax + rax + 0x4000cdc]
00bec 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
00bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfa e861e71917                     call       0x7ff8eed6cbe0
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
00cff 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d07 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d0e 90                             nop        
00d0f e8ccf4afff                     call       0x7ff8d76cda60
00d14 0f1f84000c0e0005               nop        dword ptr [rax + rax + 0x5000e0c]
00d1c 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
00d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d2a e831e61917                     call       0x7ff8eed6cbe0
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
00e61 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e69 90                             nop        
00e6a 90                             nop        
00e6b e870f3afff                     call       0x7ff8d76cda60
00e70 0f1f8400680f0006               nop        dword ptr [rax + rax + 0x6000f68]
00e78 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
00e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e86 e8d5e41917                     call       0x7ff8eed6cbe0
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
00fa0 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00fa5 48894424f8                     mov        qword ptr [rsp - 8], rax
00faa 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fb1 89442464                       mov        dword ptr [rsp + 0x64], eax
00fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fba 48894424f8                     mov        qword ptr [rsp - 8], rax
00fbf 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fc6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fcd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fde 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fe5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fea 48894424f8                     mov        qword ptr [rsp - 8], rax
00fef 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00ff6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00ffd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01002 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0100a 488f842490000000               pop        qword ptr [rsp + 0x90]
01012 48894424f8                     mov        qword ptr [rsp - 8], rax
01017 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0101e 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01025 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0102a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01032 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0103a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01042 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0104a 90                             nop        
0104b e890f1afff                     call       0x7ff8d76cda60
01050 0f1f840048110007               nop        dword ptr [rax + rax + 0x7001148]
01058 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
01062 4883e4f0                       and        rsp, 0xfffffffffffffff0
01066 e8f5e21917                     call       0x7ff8eed6cbe0
0106b f4                             hlt        
0106c 33c9                           xor        ecx, ecx
0106e 4c3bc9                         cmp        r9, rcx
01071 bdffffffff                     mov        ebp, 0xffffffff
01076 7c08                           jl         0x7ff8d7bce900
01078 400f95c5                       setne      bpl
0107c 400fb6ed                       movzx      ebp, bpl
01080 be45ffffff                     mov        esi, 0xffffff45
01085 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0108a 48894424f8                     mov        qword ptr [rsp - 8], rax
0108f 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01096 89442460                       mov        dword ptr [rsp + 0x60], eax
0109a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109f 48894424f8                     mov        qword ptr [rsp - 8], rax
010a4 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010ab 89442464                       mov        dword ptr [rsp + 0x64], eax
010af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b4 48894424f8                     mov        qword ptr [rsp - 8], rax
010b9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010c0 89442468                       mov        dword ptr [rsp + 0x68], eax
010c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c9 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
010d1 48894424f8                     mov        qword ptr [rsp - 8], rax
010d6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010dd 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e6 48894424f8                     mov        qword ptr [rsp - 8], rax
010eb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010f2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01103 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0110a 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01111 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01116 48894424f8                     mov        qword ptr [rsp - 8], rax
0111b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01122 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01129 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0112e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01136 488f842498000000               pop        qword ptr [rsp + 0x98]
0113e 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01146 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0114e 48894424f8                     mov        qword ptr [rsp - 8], rax
01153 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0115a 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01161 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01166 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0116e 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01176 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0117e 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01186 90                             nop        
01187 e854f0afff                     call       0x7ff8d76cda60
0118c 0f1f840084120008               nop        dword ptr [rax + rax + 0x8001284]
01194 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0119e 4883e4f0                       and        rsp, 0xfffffffffffffff0
011a2 e8b9e11917                     call       0x7ff8eed6cbe0
011a7 f4                             hlt        
011a8 be45ffffff                     mov        esi, 0xffffff45
011ad 48894424f8                     mov        qword ptr [rsp - 8], rax
011b2 8b442408                       mov        eax, dword ptr [rsp + 8]
011b6 890424                         mov        dword ptr [rsp], eax
011b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011be 48894424f8                     mov        qword ptr [rsp - 8], rax
011c3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011c7 89442404                       mov        dword ptr [rsp + 4], eax
011cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d0 48ff742410                     push       qword ptr [rsp + 0x10]
011d5 488f442408                     pop        qword ptr [rsp + 8]
011da 48ff742418                     push       qword ptr [rsp + 0x18]
011df 488f442410                     pop        qword ptr [rsp + 0x10]
011e4 48894424f8                     mov        qword ptr [rsp - 8], rax
011e9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011ed 89442418                       mov        dword ptr [rsp + 0x18], eax
011f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f6 48894424f8                     mov        qword ptr [rsp - 8], rax
011fb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
011ff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01203 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01208 48894424f8                     mov        qword ptr [rsp - 8], rax
0120d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01211 89442420                       mov        dword ptr [rsp + 0x20], eax
01215 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121a 48894424f8                     mov        qword ptr [rsp - 8], rax
0121f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01223 89442424                       mov        dword ptr [rsp + 0x24], eax
01227 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01231 48ff742438                     push       qword ptr [rsp + 0x38]
01236 488f442430                     pop        qword ptr [rsp + 0x30]
0123b 48894424f8                     mov        qword ptr [rsp - 8], rax
01240 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01244 89442438                       mov        dword ptr [rsp + 0x38], eax
01248 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124d 48894424f8                     mov        qword ptr [rsp - 8], rax
01252 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01256 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0125a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125f 48ff742448                     push       qword ptr [rsp + 0x48]
01264 488f442440                     pop        qword ptr [rsp + 0x40]
01269 48ff742450                     push       qword ptr [rsp + 0x50]
0126e 488f442448                     pop        qword ptr [rsp + 0x48]
01273 48ff742458                     push       qword ptr [rsp + 0x58]
01278 488f442450                     pop        qword ptr [rsp + 0x50]
0127d 48894424f8                     mov        qword ptr [rsp - 8], rax
01282 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01289 89442458                       mov        dword ptr [rsp + 0x58], eax
0128d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01292 48894424f8                     mov        qword ptr [rsp - 8], rax
01297 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0129e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a7 48894424f8                     mov        qword ptr [rsp - 8], rax
012ac 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012b3 89442460                       mov        dword ptr [rsp + 0x60], eax
012b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012c4 488f442468                     pop        qword ptr [rsp + 0x68]
012c9 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012d1 488f442478                     pop        qword ptr [rsp + 0x78]
012d6 48894424f8                     mov        qword ptr [rsp - 8], rax
012db 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012e2 89442464                       mov        dword ptr [rsp + 0x64], eax
012e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012eb 48894424f8                     mov        qword ptr [rsp - 8], rax
012f0 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
012f7 89842480000000                 mov        dword ptr [rsp + 0x80], eax
012fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01303 48894424f8                     mov        qword ptr [rsp - 8], rax
01308 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0130f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01316 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131b 48894424f8                     mov        qword ptr [rsp - 8], rax
01320 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01327 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0132e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01333 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0133b 488f842490000000               pop        qword ptr [rsp + 0x90]
01343 48894424f8                     mov        qword ptr [rsp - 8], rax
01348 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0134f 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01356 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0135b 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01363 e878eeafff                     call       0x7ff8d76cda60
01368 0f1f840060140009               nop        dword ptr [rax + rax + 0x9001460]
01370 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0137a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0137e e8dddf1917                     call       0x7ff8eed6cbe0
01383 f4                             hlt        
01384 be45ffffff                     mov        esi, 0xffffff45
01389 48894424f8                     mov        qword ptr [rsp - 8], rax
0138e 8b442408                       mov        eax, dword ptr [rsp + 8]
01392 890424                         mov        dword ptr [rsp], eax
01395 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139a 48894424f8                     mov        qword ptr [rsp - 8], rax
0139f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013a3 89442404                       mov        dword ptr [rsp + 4], eax
013a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ac 48ff742410                     push       qword ptr [rsp + 0x10]
013b1 488f442408                     pop        qword ptr [rsp + 8]
013b6 48ff742418                     push       qword ptr [rsp + 0x18]
013bb 488f442410                     pop        qword ptr [rsp + 0x10]
013c0 48894424f8                     mov        qword ptr [rsp - 8], rax
013c5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013c9 89442418                       mov        dword ptr [rsp + 0x18], eax
013cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013d7 e804eeafff                     call       0x7ff8d76cda60
013dc 0f1f8400d414000a               nop        dword ptr [rax + rax + 0xa0014d4]
013e4 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
013ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
013f2 e869df1917                     call       0x7ff8eed6cbe0
013f7 f4                             hlt        
013f8 be45ffffff                     mov        esi, 0xffffff45
013fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01402 8b442408                       mov        eax, dword ptr [rsp + 8]
01406 890424                         mov        dword ptr [rsp], eax
01409 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140e 48894424f8                     mov        qword ptr [rsp - 8], rax
01413 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01417 89442404                       mov        dword ptr [rsp + 4], eax
0141b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01420 48ff742410                     push       qword ptr [rsp + 0x10]
01425 488f442408                     pop        qword ptr [rsp + 8]
0142a 48ff742418                     push       qword ptr [rsp + 0x18]
0142f 488f442410                     pop        qword ptr [rsp + 0x10]
01434 48894424f8                     mov        qword ptr [rsp - 8], rax
01439 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0143d 89442418                       mov        dword ptr [rsp + 0x18], eax
01441 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01446 48894424f8                     mov        qword ptr [rsp - 8], rax
0144b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0144f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01453 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01458 48894424f8                     mov        qword ptr [rsp - 8], rax
0145d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01461 89442420                       mov        dword ptr [rsp + 0x20], eax
01465 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146a 48894424f8                     mov        qword ptr [rsp - 8], rax
0146f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01473 89442424                       mov        dword ptr [rsp + 0x24], eax
01477 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01481 48ff742438                     push       qword ptr [rsp + 0x38]
01486 488f442430                     pop        qword ptr [rsp + 0x30]
0148b 48894424f8                     mov        qword ptr [rsp - 8], rax
01490 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01494 89442438                       mov        dword ptr [rsp + 0x38], eax
01498 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149d 48894424f8                     mov        qword ptr [rsp - 8], rax
014a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014af 48ff742448                     push       qword ptr [rsp + 0x48]
014b4 488f442440                     pop        qword ptr [rsp + 0x40]
014b9 48ff742450                     push       qword ptr [rsp + 0x50]
014be 488f442448                     pop        qword ptr [rsp + 0x48]
014c3 48ff742458                     push       qword ptr [rsp + 0x58]
014c8 488f442450                     pop        qword ptr [rsp + 0x50]
014cd 48894424f8                     mov        qword ptr [rsp - 8], rax
014d2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014d9 89442458                       mov        dword ptr [rsp + 0x58], eax
014dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e2 48894424f8                     mov        qword ptr [rsp - 8], rax
014e7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014ee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f7 48894424f8                     mov        qword ptr [rsp - 8], rax
014fc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01503 89442460                       mov        dword ptr [rsp + 0x60], eax
01507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01514 488f442468                     pop        qword ptr [rsp + 0x68]
01519 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01521 488f442470                     pop        qword ptr [rsp + 0x70]
01526 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0152e 488f442478                     pop        qword ptr [rsp + 0x78]
01533 48894424f8                     mov        qword ptr [rsp - 8], rax
01538 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0153f 89442464                       mov        dword ptr [rsp + 0x64], eax
01543 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01548 48894424f8                     mov        qword ptr [rsp - 8], rax
0154d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01554 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0155b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01560 48894424f8                     mov        qword ptr [rsp - 8], rax
01565 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0156c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01573 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01578 48894424f8                     mov        qword ptr [rsp - 8], rax
0157d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01584 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0158b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01590 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01598 488f842490000000               pop        qword ptr [rsp + 0x90]
015a0 48894424f8                     mov        qword ptr [rsp - 8], rax
015a5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015ac 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b8 90                             nop        
015b9 90                             nop        
015ba 90                             nop        
015bb e820ecafff                     call       0x7ff8d76cda60
015c0 0f1f8400b816000b               nop        dword ptr [rax + rax + 0xb0016b8]
015c8 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
015d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015d6 e885dd1917                     call       0x7ff8eed6cbe0
015db f4                             hlt        
015dc be45ffffff                     mov        esi, 0xffffff45
015e1 48894424f8                     mov        qword ptr [rsp - 8], rax
015e6 8b442408                       mov        eax, dword ptr [rsp + 8]
015ea 890424                         mov        dword ptr [rsp], eax
015ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f2 48894424f8                     mov        qword ptr [rsp - 8], rax
015f7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
015fb 89442404                       mov        dword ptr [rsp + 4], eax
015ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01604 48ff742410                     push       qword ptr [rsp + 0x10]
01609 488f442408                     pop        qword ptr [rsp + 8]
0160e 48ff742418                     push       qword ptr [rsp + 0x18]
01613 488f442410                     pop        qword ptr [rsp + 0x10]
01618 48894424f8                     mov        qword ptr [rsp - 8], rax
0161d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01621 89442418                       mov        dword ptr [rsp + 0x18], eax
01625 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162a 48894424f8                     mov        qword ptr [rsp - 8], rax
0162f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01633 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01637 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163c 48894424f8                     mov        qword ptr [rsp - 8], rax
01641 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01645 89442420                       mov        dword ptr [rsp + 0x20], eax
01649 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164e 48894424f8                     mov        qword ptr [rsp - 8], rax
01653 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01657 89442424                       mov        dword ptr [rsp + 0x24], eax
0165b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01660 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01665 48ff742438                     push       qword ptr [rsp + 0x38]
0166a 488f442430                     pop        qword ptr [rsp + 0x30]
0166f 48894424f8                     mov        qword ptr [rsp - 8], rax
01674 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01678 89442438                       mov        dword ptr [rsp + 0x38], eax
0167c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01681 48894424f8                     mov        qword ptr [rsp - 8], rax
01686 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0168a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0168e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01693 48ff742448                     push       qword ptr [rsp + 0x48]
01698 488f442440                     pop        qword ptr [rsp + 0x40]
0169d 48ff742450                     push       qword ptr [rsp + 0x50]
016a2 488f442448                     pop        qword ptr [rsp + 0x48]
016a7 48ff742458                     push       qword ptr [rsp + 0x58]
016ac 488f442450                     pop        qword ptr [rsp + 0x50]
016b1 48894424f8                     mov        qword ptr [rsp - 8], rax
016b6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016bd 89442458                       mov        dword ptr [rsp + 0x58], eax
016c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c6 48894424f8                     mov        qword ptr [rsp - 8], rax
016cb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016d2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016db 48894424f8                     mov        qword ptr [rsp - 8], rax
016e0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016e7 89442460                       mov        dword ptr [rsp + 0x60], eax
016eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f0 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
016f8 488f442468                     pop        qword ptr [rsp + 0x68]
016fd 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01705 488f442470                     pop        qword ptr [rsp + 0x70]
0170a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01712 488f442478                     pop        qword ptr [rsp + 0x78]
01717 48894424f8                     mov        qword ptr [rsp - 8], rax
0171c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01723 89442464                       mov        dword ptr [rsp + 0x64], eax
01727 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0172c 48894424f8                     mov        qword ptr [rsp - 8], rax
01731 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01738 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0173f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01744 48894424f8                     mov        qword ptr [rsp - 8], rax
01749 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01750 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175c 48894424f8                     mov        qword ptr [rsp - 8], rax
01761 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01768 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0176f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01774 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0177c 488f842490000000               pop        qword ptr [rsp + 0x90]
01784 48894424f8                     mov        qword ptr [rsp - 8], rax
01789 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
01790 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
01797 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179c 48894424f8                     mov        qword ptr [rsp - 8], rax
017a1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017a8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017bc 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017c4 90                             nop        
017c5 90                             nop        
017c6 90                             nop        
017c7 e814eaafff                     call       0x7ff8d76cda60
017cc 0f1f8400c418000c               nop        dword ptr [rax + rax + 0xc0018c4]
017d4 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
017de 4883e4f0                       and        rsp, 0xfffffffffffffff0
017e2 e879db1917                     call       0x7ff8eed6cbe0
017e7 f4                             hlt        
017e8 be45ffffff                     mov        esi, 0xffffff45
017ed 48894424f8                     mov        qword ptr [rsp - 8], rax
017f2 8b442408                       mov        eax, dword ptr [rsp + 8]
017f6 890424                         mov        dword ptr [rsp], eax
017f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01803 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01807 89442404                       mov        dword ptr [rsp + 4], eax
0180b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01810 48ff742410                     push       qword ptr [rsp + 0x10]
01815 488f442408                     pop        qword ptr [rsp + 8]
0181a 48ff742418                     push       qword ptr [rsp + 0x18]
0181f 488f442410                     pop        qword ptr [rsp + 0x10]
01824 48894424f8                     mov        qword ptr [rsp - 8], rax
01829 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0182d 89442418                       mov        dword ptr [rsp + 0x18], eax
01831 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01836 48894424f8                     mov        qword ptr [rsp - 8], rax
0183b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0183f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01843 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01848 48894424f8                     mov        qword ptr [rsp - 8], rax
0184d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01851 89442420                       mov        dword ptr [rsp + 0x20], eax
01855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185a 48894424f8                     mov        qword ptr [rsp - 8], rax
0185f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01863 89442424                       mov        dword ptr [rsp + 0x24], eax
01867 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01871 48ff742438                     push       qword ptr [rsp + 0x38]
01876 488f442430                     pop        qword ptr [rsp + 0x30]
0187b 48894424f8                     mov        qword ptr [rsp - 8], rax
01880 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01884 89442438                       mov        dword ptr [rsp + 0x38], eax
01888 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188d 48894424f8                     mov        qword ptr [rsp - 8], rax
01892 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01896 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0189a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189f 48ff742448                     push       qword ptr [rsp + 0x48]
018a4 488f442440                     pop        qword ptr [rsp + 0x40]
018a9 48ff742450                     push       qword ptr [rsp + 0x50]
018ae 488f442448                     pop        qword ptr [rsp + 0x48]
018b3 48ff742458                     push       qword ptr [rsp + 0x58]
018b8 488f442450                     pop        qword ptr [rsp + 0x50]
018bd 48894424f8                     mov        qword ptr [rsp - 8], rax
018c2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018c9 89442458                       mov        dword ptr [rsp + 0x58], eax
018cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d2 48894424f8                     mov        qword ptr [rsp - 8], rax
018d7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018de 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e7 48894424f8                     mov        qword ptr [rsp - 8], rax
018ec 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018f3 89442460                       mov        dword ptr [rsp + 0x60], eax
018f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01904 488f442468                     pop        qword ptr [rsp + 0x68]
01909 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01911 488f442470                     pop        qword ptr [rsp + 0x70]
01916 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0191e 488f442478                     pop        qword ptr [rsp + 0x78]
01923 48894424f8                     mov        qword ptr [rsp - 8], rax
01928 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0192f 89442464                       mov        dword ptr [rsp + 0x64], eax
01933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01938 48894424f8                     mov        qword ptr [rsp - 8], rax
0193d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01944 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48894424f8                     mov        qword ptr [rsp - 8], rax
01955 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0195c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01963 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01968 48894424f8                     mov        qword ptr [rsp - 8], rax
0196d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01974 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01988 488f842490000000               pop        qword ptr [rsp + 0x90]
01990 48894424f8                     mov        qword ptr [rsp - 8], rax
01995 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
0199c 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a8 48894424f8                     mov        qword ptr [rsp - 8], rax
019ad 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019b4 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019c8 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019cf 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019d7 e804e8afff                     call       0x7ff8d76cda60
019dc 0f1f8400d41a000d               nop        dword ptr [rax + rax + 0xd001ad4]
019e4 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
019ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f2 e869d91917                     call       0x7ff8eed6cbe0
019f7 f4                             hlt        
019f8 be45ffffff                     mov        esi, 0xffffff45
019fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01a02 8b442408                       mov        eax, dword ptr [rsp + 8]
01a06 890424                         mov        dword ptr [rsp], eax
01a09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a13 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a17 89442404                       mov        dword ptr [rsp + 4], eax
01a1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a20 48ff742410                     push       qword ptr [rsp + 0x10]
01a25 488f442408                     pop        qword ptr [rsp + 8]
01a2a 48ff742418                     push       qword ptr [rsp + 0x18]
01a2f 488f442410                     pop        qword ptr [rsp + 0x10]
01a34 48894424f8                     mov        qword ptr [rsp - 8], rax
01a39 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a3d 89442418                       mov        dword ptr [rsp + 0x18], eax
01a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a46 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a4f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a58 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a61 89442420                       mov        dword ptr [rsp + 0x20], eax
01a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a73 89442424                       mov        dword ptr [rsp + 0x24], eax
01a77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a81 48ff742438                     push       qword ptr [rsp + 0x38]
01a86 488f442430                     pop        qword ptr [rsp + 0x30]
01a8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a90 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a94 89442438                       mov        dword ptr [rsp + 0x38], eax
01a98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01aa6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaf 48ff742448                     push       qword ptr [rsp + 0x48]
01ab4 488f442440                     pop        qword ptr [rsp + 0x40]
01ab9 48ff742450                     push       qword ptr [rsp + 0x50]
01abe 488f442448                     pop        qword ptr [rsp + 0x48]
01ac3 48ff742458                     push       qword ptr [rsp + 0x58]
01ac8 488f442450                     pop        qword ptr [rsp + 0x50]
01acd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ad9 89442458                       mov        dword ptr [rsp + 0x58], eax
01add 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01aee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01af2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af7 48894424f8                     mov        qword ptr [rsp - 8], rax
01afc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b03 89442460                       mov        dword ptr [rsp + 0x60], eax
01b07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b14 488f442468                     pop        qword ptr [rsp + 0x68]
01b19 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b21 488f442478                     pop        qword ptr [rsp + 0x78]
01b26 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b32 89442464                       mov        dword ptr [rsp + 0x64], eax
01b36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b40 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b47 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b53 48894424f8                     mov        qword ptr [rsp - 8], rax
01b58 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b5f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b70 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b77 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b83 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b8b 488f842490000000               pop        qword ptr [rsp + 0x90]
01b93 48894424f8                     mov        qword ptr [rsp - 8], rax
01b98 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01b9f 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ba6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bab 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bb3 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01bba 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bc1 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bc9 90                             nop        
01bca 90                             nop        
01bcb e810e6afff                     call       0x7ff8d76cda60
01bd0 0f1f8400c81c000e               nop        dword ptr [rax + rax + 0xe001cc8]
01bd8 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
01be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be6 e875d71917                     call       0x7ff8eed6cbe0
01beb f4                             hlt        
01bec b9ffffff7f                     mov        ecx, 0x7fffffff
01bf1 4c3bc9                         cmp        r9, rcx
01bf4 bdffffffff                     mov        ebp, 0xffffffff
01bf9 7c08                           jl         0x7ff8d7bcf483
01bfb 400f95c5                       setne      bpl
01bff 400fb6ed                       movzx      ebp, bpl
01c03 be45ffffff                     mov        esi, 0xffffff45
01c08 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c12 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c19 89442460                       mov        dword ptr [rsp + 0x60], eax
01c1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c2e 89442464                       mov        dword ptr [rsp + 0x64], eax
01c32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c37 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c43 89442468                       mov        dword ptr [rsp + 0x68], eax
01c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4c 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c54 48894424f8                     mov        qword ptr [rsp - 8], rax
01c59 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c60 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c69 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6e 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c75 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c81 48894424f8                     mov        qword ptr [rsp - 8], rax
01c86 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01c8d 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01c94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c99 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9e 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ca5 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb1 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cb9 488f842498000000               pop        qword ptr [rsp + 0x98]
01cc1 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cc9 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd6 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01cdd 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce9 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01cf1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01cf9 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
01d01 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d09 90                             nop        
01d0a 90                             nop        
01d0b e8d0e4afff                     call       0x7ff8d76cda60
01d10 0f1f8400081e000f               nop        dword ptr [rax + rax + 0xf001e08]
01d18 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
01d22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d26 e835d61917                     call       0x7ff8eed6cbe0
01d2b f4                             hlt        
01d2c be45ffffff                     mov        esi, 0xffffff45
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b442408                       mov        eax, dword ptr [rsp + 8]
01d3a 890424                         mov        dword ptr [rsp], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d4b 89442404                       mov        dword ptr [rsp + 4], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 48ff742410                     push       qword ptr [rsp + 0x10]
01d59 488f442408                     pop        qword ptr [rsp + 8]
01d5e 48ff742418                     push       qword ptr [rsp + 0x18]
01d63 488f442410                     pop        qword ptr [rsp + 0x10]
01d68 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d71 89442418                       mov        dword ptr [rsp + 0x18], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d83 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d91 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d95 89442420                       mov        dword ptr [rsp + 0x20], eax
01d99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01da3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01da7 89442424                       mov        dword ptr [rsp + 0x24], eax
01dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01db5 48ff742438                     push       qword ptr [rsp + 0x38]
01dba 488f442430                     pop        qword ptr [rsp + 0x30]
01dbf 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01dc8 89442438                       mov        dword ptr [rsp + 0x38], eax
01dcc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01dda 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de3 48ff742448                     push       qword ptr [rsp + 0x48]
01de8 488f442440                     pop        qword ptr [rsp + 0x40]
01ded 48ff742450                     push       qword ptr [rsp + 0x50]
01df2 488f442448                     pop        qword ptr [rsp + 0x48]
01df7 48ff742458                     push       qword ptr [rsp + 0x58]
01dfc 488f442450                     pop        qword ptr [rsp + 0x50]
01e01 48894424f8                     mov        qword ptr [rsp - 8], rax
01e06 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e0d 89442458                       mov        dword ptr [rsp + 0x58], eax
01e11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e16 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e22 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e30 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e37 89442460                       mov        dword ptr [rsp + 0x60], eax
01e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e40 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e45 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e51 89442464                       mov        dword ptr [rsp + 0x64], eax
01e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e66 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e72 48894424f8                     mov        qword ptr [rsp - 8], rax
01e77 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e7e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01e96 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01e9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01eaa 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01eb2 90                             nop        
01eb3 e828e3afff                     call       0x7ff8d76cda60
01eb8 0f1f8400b01f0010               nop        dword ptr [rax + rax + 0x10001fb0]
01ec0 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
01eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ece e88dd41917                     call       0x7ff8eed6cbe0
01ed3 f4                             hlt        
01ed4 be45ffffff                     mov        esi, 0xffffff45
01ed9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ede 8b442408                       mov        eax, dword ptr [rsp + 8]
01ee2 890424                         mov        dword ptr [rsp], eax
01ee5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eea 48894424f8                     mov        qword ptr [rsp - 8], rax
01eef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01ef3 89442404                       mov        dword ptr [rsp + 4], eax
01ef7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01efc 48ff742410                     push       qword ptr [rsp + 0x10]
01f01 488f442408                     pop        qword ptr [rsp + 8]
01f06 48ff742418                     push       qword ptr [rsp + 0x18]
01f0b 488f442410                     pop        qword ptr [rsp + 0x10]
01f10 48894424f8                     mov        qword ptr [rsp - 8], rax
01f15 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f19 89442418                       mov        dword ptr [rsp + 0x18], eax
01f1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f22 48894424f8                     mov        qword ptr [rsp - 8], rax
01f27 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f2b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f34 48894424f8                     mov        qword ptr [rsp - 8], rax
01f39 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f3d 89442420                       mov        dword ptr [rsp + 0x20], eax
01f41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f46 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f4f 89442424                       mov        dword ptr [rsp + 0x24], eax
01f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f58 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f5d 48ff742438                     push       qword ptr [rsp + 0x38]
01f62 488f442430                     pop        qword ptr [rsp + 0x30]
01f67 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f70 89442438                       mov        dword ptr [rsp + 0x38], eax
01f74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f79 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f82 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8b 48ff742448                     push       qword ptr [rsp + 0x48]
01f90 488f442440                     pop        qword ptr [rsp + 0x40]
01f95 48ff742450                     push       qword ptr [rsp + 0x50]
01f9a 488f442448                     pop        qword ptr [rsp + 0x48]
01f9f 48ff742458                     push       qword ptr [rsp + 0x58]
01fa4 488f442450                     pop        qword ptr [rsp + 0x50]
01fa9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fae 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fb5 89442458                       mov        dword ptr [rsp + 0x58], eax
01fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01fdf 89442460                       mov        dword ptr [rsp + 0x60], eax
01fe3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe8 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01fed 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ff9 89442464                       mov        dword ptr [rsp + 0x64], eax
01ffd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02002 48894424f8                     mov        qword ptr [rsp - 8], rax
02007 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0200e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02015 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201a 48894424f8                     mov        qword ptr [rsp - 8], rax
0201f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02026 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0202d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02032 48894424f8                     mov        qword ptr [rsp - 8], rax
02037 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0203e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02045 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02052 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0205a 90                             nop        
0205b e880e1afff                     call       0x7ff8d76cda60
02060 0f1f840058210011               nop        dword ptr [rax + rax + 0x11002158]
02068 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
02072 4883e4f0                       and        rsp, 0xfffffffffffffff0
02076 e8e5d21917                     call       0x7ff8eed6cbe0
0207b f4                             hlt        
0207c be3dffffff                     mov        esi, 0xffffff3d
02081 48894424f8                     mov        qword ptr [rsp - 8], rax
02086 8b442408                       mov        eax, dword ptr [rsp + 8]
0208a 890424                         mov        dword ptr [rsp], eax
0208d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02092 48894424f8                     mov        qword ptr [rsp - 8], rax
02097 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0209b 89442404                       mov        dword ptr [rsp + 4], eax
0209f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a4 48ff742410                     push       qword ptr [rsp + 0x10]
020a9 488f442408                     pop        qword ptr [rsp + 8]
020ae 48ff742418                     push       qword ptr [rsp + 0x18]
020b3 488f442410                     pop        qword ptr [rsp + 0x10]
020b8 48894424f8                     mov        qword ptr [rsp - 8], rax
020bd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020c1 89442418                       mov        dword ptr [rsp + 0x18], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48894424f8                     mov        qword ptr [rsp - 8], rax
020cf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020d3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020dc 48894424f8                     mov        qword ptr [rsp - 8], rax
020e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e5 89442420                       mov        dword ptr [rsp + 0x20], eax
020e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ee 48894424f8                     mov        qword ptr [rsp - 8], rax
020f3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
020f7 89442424                       mov        dword ptr [rsp + 0x24], eax
020fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02100 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02105 48ff742438                     push       qword ptr [rsp + 0x38]
0210a 488f442430                     pop        qword ptr [rsp + 0x30]
0210f 48894424f8                     mov        qword ptr [rsp - 8], rax
02114 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02118 89442438                       mov        dword ptr [rsp + 0x38], eax
0211c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02121 48894424f8                     mov        qword ptr [rsp - 8], rax
02126 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0212a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0212e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02133 48ff742448                     push       qword ptr [rsp + 0x48]
02138 488f442440                     pop        qword ptr [rsp + 0x40]
0213d 48ff742450                     push       qword ptr [rsp + 0x50]
02142 488f442448                     pop        qword ptr [rsp + 0x48]
02147 48ff742458                     push       qword ptr [rsp + 0x58]
0214c 488f442450                     pop        qword ptr [rsp + 0x50]
02151 48894424f8                     mov        qword ptr [rsp - 8], rax
02156 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0215d 89442458                       mov        dword ptr [rsp + 0x58], eax
02161 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02166 48894424f8                     mov        qword ptr [rsp - 8], rax
0216b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02172 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02176 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217b 48894424f8                     mov        qword ptr [rsp - 8], rax
02180 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02187 89442460                       mov        dword ptr [rsp + 0x60], eax
0218b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02190 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02195 48894424f8                     mov        qword ptr [rsp - 8], rax
0219a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021a1 89442464                       mov        dword ptr [rsp + 0x64], eax
021a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021aa 48894424f8                     mov        qword ptr [rsp - 8], rax
021af 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021b6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c2 48894424f8                     mov        qword ptr [rsp - 8], rax
021c7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021ce 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021da 48894424f8                     mov        qword ptr [rsp - 8], rax
021df 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
021e6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
021ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
021fa 488f842490000000               pop        qword ptr [rsp + 0x90]
02202 48894424f8                     mov        qword ptr [rsp - 8], rax
02207 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0220e 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02215 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02222 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0222a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02232 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0223a 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02242 48894424f8                     mov        qword ptr [rsp - 8], rax
02247 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0224e 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02255 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0225a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02262 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0226a 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02272 90                             nop        
02273 e868dfafff                     call       0x7ff8d76cda60
02278 0f1f840070230012               nop        dword ptr [rax + rax + 0x12002370]
02280 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0228a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0228e e8cdd01917                     call       0x7ff8eed6cbe0
02293 f4                             hlt        
02294 be45ffffff                     mov        esi, 0xffffff45
02299 48894424f8                     mov        qword ptr [rsp - 8], rax
0229e 8b442408                       mov        eax, dword ptr [rsp + 8]
022a2 890424                         mov        dword ptr [rsp], eax
022a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022aa 48894424f8                     mov        qword ptr [rsp - 8], rax
022af 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022b3 89442404                       mov        dword ptr [rsp + 4], eax
022b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022bc 48ff742410                     push       qword ptr [rsp + 0x10]
022c1 488f442408                     pop        qword ptr [rsp + 8]
022c6 48ff742418                     push       qword ptr [rsp + 0x18]
022cb 488f442410                     pop        qword ptr [rsp + 0x10]
022d0 48894424f8                     mov        qword ptr [rsp - 8], rax
022d5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022d9 89442418                       mov        dword ptr [rsp + 0x18], eax
022dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e2 48894424f8                     mov        qword ptr [rsp - 8], rax
022e7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022eb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f4 48894424f8                     mov        qword ptr [rsp - 8], rax
022f9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022fd 89442420                       mov        dword ptr [rsp + 0x20], eax
02301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02306 48894424f8                     mov        qword ptr [rsp - 8], rax
0230b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0230f 89442424                       mov        dword ptr [rsp + 0x24], eax
02313 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02318 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0231d 48ff742438                     push       qword ptr [rsp + 0x38]
02322 488f442430                     pop        qword ptr [rsp + 0x30]
02327 48894424f8                     mov        qword ptr [rsp - 8], rax
0232c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02330 89442438                       mov        dword ptr [rsp + 0x38], eax
02334 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02339 48894424f8                     mov        qword ptr [rsp - 8], rax
0233e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02342 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02346 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0234b 48ff742448                     push       qword ptr [rsp + 0x48]
02350 488f442440                     pop        qword ptr [rsp + 0x40]
02355 48ff742450                     push       qword ptr [rsp + 0x50]
0235a 488f442448                     pop        qword ptr [rsp + 0x48]
0235f 48ff742458                     push       qword ptr [rsp + 0x58]
02364 488f442450                     pop        qword ptr [rsp + 0x50]
02369 897c2458                       mov        dword ptr [rsp + 0x58], edi
0236d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02375 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0237d 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02385 90                             nop        
02386 90                             nop        
02387 e854deafff                     call       0x7ff8d76cda60
0238c 0f1f840084240013               nop        dword ptr [rax + rax + 0x13002484]
02394 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0239e 4883e4f0                       and        rsp, 0xfffffffffffffff0
023a2 e8b9cf1917                     call       0x7ff8eed6cbe0
023a7 f4                             hlt        
023a8 be45ffffff                     mov        esi, 0xffffff45
023ad 48894424f8                     mov        qword ptr [rsp - 8], rax
023b2 8b442408                       mov        eax, dword ptr [rsp + 8]
023b6 890424                         mov        dword ptr [rsp], eax
023b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023be 48894424f8                     mov        qword ptr [rsp - 8], rax
023c3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023c7 89442404                       mov        dword ptr [rsp + 4], eax
023cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d0 48ff742410                     push       qword ptr [rsp + 0x10]
023d5 488f442408                     pop        qword ptr [rsp + 8]
023da 48ff742418                     push       qword ptr [rsp + 0x18]
023df 488f442410                     pop        qword ptr [rsp + 0x10]
023e4 48894424f8                     mov        qword ptr [rsp - 8], rax
023e9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023ed 89442418                       mov        dword ptr [rsp + 0x18], eax
023f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f6 48894424f8                     mov        qword ptr [rsp - 8], rax
023fb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023ff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02403 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02408 48894424f8                     mov        qword ptr [rsp - 8], rax
0240d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02411 89442420                       mov        dword ptr [rsp + 0x20], eax
02415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241a 48894424f8                     mov        qword ptr [rsp - 8], rax
0241f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02423 89442424                       mov        dword ptr [rsp + 0x24], eax
02427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02431 48ff742438                     push       qword ptr [rsp + 0x38]
02436 488f442430                     pop        qword ptr [rsp + 0x30]
0243b 48894424f8                     mov        qword ptr [rsp - 8], rax
02440 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02444 89442438                       mov        dword ptr [rsp + 0x38], eax
02448 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244d 48894424f8                     mov        qword ptr [rsp - 8], rax
02452 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02456 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0245a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245f 48ff742448                     push       qword ptr [rsp + 0x48]
02464 488f442440                     pop        qword ptr [rsp + 0x40]
02469 48ff742450                     push       qword ptr [rsp + 0x50]
0246e 488f442448                     pop        qword ptr [rsp + 0x48]
02473 48ff742458                     push       qword ptr [rsp + 0x58]
02478 488f442450                     pop        qword ptr [rsp + 0x50]
0247d 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02484 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0248c 90                             nop        
0248d 90                             nop        
0248e 90                             nop        
0248f e84cddafff                     call       0x7ff8d76cda60
02494 0f1f84008c250014               nop        dword ptr [rax + rax + 0x1400258c]
0249c 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
024a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
024aa e8b1ce1917                     call       0x7ff8eed6cbe0
024af f4                             hlt        
024b0 be45ffffff                     mov        esi, 0xffffff45
024b5 48894424f8                     mov        qword ptr [rsp - 8], rax
024ba 8b442408                       mov        eax, dword ptr [rsp + 8]
024be 890424                         mov        dword ptr [rsp], eax
024c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c6 48894424f8                     mov        qword ptr [rsp - 8], rax
024cb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024cf 89442404                       mov        dword ptr [rsp + 4], eax
024d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d8 48ff742410                     push       qword ptr [rsp + 0x10]
024dd 488f442408                     pop        qword ptr [rsp + 8]
024e2 48ff742418                     push       qword ptr [rsp + 0x18]
024e7 488f442410                     pop        qword ptr [rsp + 0x10]
024ec 48894424f8                     mov        qword ptr [rsp - 8], rax
024f1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
024f5 89442418                       mov        dword ptr [rsp + 0x18], eax
024f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02503 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02507 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0250b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02510 48894424f8                     mov        qword ptr [rsp - 8], rax
02515 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02519 89442420                       mov        dword ptr [rsp + 0x20], eax
0251d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02522 48894424f8                     mov        qword ptr [rsp - 8], rax
02527 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0252b 89442424                       mov        dword ptr [rsp + 0x24], eax
0252f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02534 48ff742438                     push       qword ptr [rsp + 0x38]
02539 488f442430                     pop        qword ptr [rsp + 0x30]
0253e 48894424f8                     mov        qword ptr [rsp - 8], rax
02543 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02547 89442438                       mov        dword ptr [rsp + 0x38], eax
0254b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02550 48894424f8                     mov        qword ptr [rsp - 8], rax
02555 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02559 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0255d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02562 48ff742448                     push       qword ptr [rsp + 0x48]
02567 488f442440                     pop        qword ptr [rsp + 0x40]
0256c 48ff742450                     push       qword ptr [rsp + 0x50]
02571 488f442448                     pop        qword ptr [rsp + 0x48]
02576 48ff742458                     push       qword ptr [rsp + 0x58]
0257b 488f442450                     pop        qword ptr [rsp + 0x50]
02580 48894424f8                     mov        qword ptr [rsp - 8], rax
02585 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0258c 89442458                       mov        dword ptr [rsp + 0x58], eax
02590 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02595 48894424f8                     mov        qword ptr [rsp - 8], rax
0259a 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025a1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025aa 48894424f8                     mov        qword ptr [rsp - 8], rax
025af 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025b6 89442460                       mov        dword ptr [rsp + 0x60], eax
025ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025bf 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025c7 488f442468                     pop        qword ptr [rsp + 0x68]
025cc 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025d4 488f442470                     pop        qword ptr [rsp + 0x70]
025d9 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
025e1 488f442478                     pop        qword ptr [rsp + 0x78]
025e6 48894424f8                     mov        qword ptr [rsp - 8], rax
025eb 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
025f2 89442464                       mov        dword ptr [rsp + 0x64], eax
025f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02600 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02607 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0260e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02613 48894424f8                     mov        qword ptr [rsp - 8], rax
02618 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0261f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02626 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0262b 48894424f8                     mov        qword ptr [rsp - 8], rax
02630 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02637 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0263e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02643 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0264b 488f842490000000               pop        qword ptr [rsp + 0x90]
02653 48894424f8                     mov        qword ptr [rsp - 8], rax
02658 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0265f 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02666 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
02673 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0267b 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
02683 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0268b e850dbafff                     call       0x7ff8d76cda60
02690 0f1f840088270015               nop        dword ptr [rax + rax + 0x15002788]
02698 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
026a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
026a6 e8b5cc1917                     call       0x7ff8eed6cbe0
026ab f4                             hlt        
026ac 4533d2                         xor        r10d, r10d
026af 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
026b7 e912dbffff                     jmp        0x7ff8d7bcda4e
026bc 4533d2                         xor        r10d, r10d
026bf 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026c4 e931dbffff                     jmp        0x7ff8d7bcda7a
026c9 4533d2                         xor        r10d, r10d
026cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026d1 e94bdbffff                     jmp        0x7ff8d7bcdaa1
026d6 4533d2                         xor        r10d, r10d
026d9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026de e96adbffff                     jmp        0x7ff8d7bcdacd
026e3 4533d2                         xor        r10d, r10d
026e6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026eb e987dbffff                     jmp        0x7ff8d7bcdaf7
026f0 4533d2                         xor        r10d, r10d
026f3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
026f8 e9acdbffff                     jmp        0x7ff8d7bcdb29
026fd 4533d2                         xor        r10d, r10d
02700 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02708 e9c9dbffff                     jmp        0x7ff8d7bcdb56
0270d 4533d2                         xor        r10d, r10d
02710 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02718 e9dfdbffff                     jmp        0x7ff8d7bcdb7c
0271d bebeffffff                     mov        esi, 0xffffffbe
02722 48894424f8                     mov        qword ptr [rsp - 8], rax
02727 8b442408                       mov        eax, dword ptr [rsp + 8]
0272b 890424                         mov        dword ptr [rsp], eax
0272e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02733 48894424f8                     mov        qword ptr [rsp - 8], rax
02738 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0273c 89442404                       mov        dword ptr [rsp + 4], eax
02740 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02745 48ff742410                     push       qword ptr [rsp + 0x10]
0274a 488f442408                     pop        qword ptr [rsp + 8]
0274f 48ff742418                     push       qword ptr [rsp + 0x18]
02754 488f442410                     pop        qword ptr [rsp + 0x10]
02759 48894424f8                     mov        qword ptr [rsp - 8], rax
0275e 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02762 89442418                       mov        dword ptr [rsp + 0x18], eax
02766 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276b 48894424f8                     mov        qword ptr [rsp - 8], rax
02770 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02774 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02778 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277d 48894424f8                     mov        qword ptr [rsp - 8], rax
02782 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02786 89442420                       mov        dword ptr [rsp + 0x20], eax
0278a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278f 48894424f8                     mov        qword ptr [rsp - 8], rax
02794 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02798 89442424                       mov        dword ptr [rsp + 0x24], eax
0279c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a1 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
027a6 48ff742438                     push       qword ptr [rsp + 0x38]
027ab 488f442430                     pop        qword ptr [rsp + 0x30]
027b0 48894424f8                     mov        qword ptr [rsp - 8], rax
027b5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027b9 89442438                       mov        dword ptr [rsp + 0x38], eax
027bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c2 48894424f8                     mov        qword ptr [rsp - 8], rax
027c7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
027cb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d4 48ff742448                     push       qword ptr [rsp + 0x48]
027d9 488f442440                     pop        qword ptr [rsp + 0x40]
027de 48ff742450                     push       qword ptr [rsp + 0x50]
027e3 488f442448                     pop        qword ptr [rsp + 0x48]
027e8 48ff742458                     push       qword ptr [rsp + 0x58]
027ed 488f442450                     pop        qword ptr [rsp + 0x50]
027f2 90                             nop        
027f3 e8e8d9afff                     call       0x7ff8d76cda60
027f8 0f1f8400f0280016               nop        dword ptr [rax + rax + 0x160028f0]
02800 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0280a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0280e e84dcb1917                     call       0x7ff8eed6cbe0
02813 f4                             hlt        
02814 be85ffffff                     mov        esi, 0xffffff85
02819 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
0281d 48894424f8                     mov        qword ptr [rsp - 8], rax
02822 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02826 890424                         mov        dword ptr [rsp], eax
02829 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282e 48894424f8                     mov        qword ptr [rsp - 8], rax
02833 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02837 89442404                       mov        dword ptr [rsp + 4], eax
0283b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02840 48894424f8                     mov        qword ptr [rsp - 8], rax
02845 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02849 89442408                       mov        dword ptr [rsp + 8], eax
0284d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02852 48894424f8                     mov        qword ptr [rsp - 8], rax
02857 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0285b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0285f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02864 48894424f8                     mov        qword ptr [rsp - 8], rax
02869 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0286d 89442410                       mov        dword ptr [rsp + 0x10], eax
02871 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02876 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
0287b 48ff742438                     push       qword ptr [rsp + 0x38]
02880 488f442420                     pop        qword ptr [rsp + 0x20]
02885 48894424f8                     mov        qword ptr [rsp - 8], rax
0288a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0288e 89442414                       mov        dword ptr [rsp + 0x14], eax
02892 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02897 48894424f8                     mov        qword ptr [rsp - 8], rax
0289c 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028a0 89442428                       mov        dword ptr [rsp + 0x28], eax
028a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a9 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
028ae 90                             nop        
028af e82cd9afff                     call       0x7ff8d76cda60
028b4 0f1f8400ac290017               nop        dword ptr [rax + rax + 0x170029ac]
028bc 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
028c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ca e891ca1917                     call       0x7ff8eed6cbe0
028cf f4                             hlt        
028d0 bef6ffffff                     mov        esi, 0xfffffff6
028d5 90                             nop        
028d6 90                             nop        
028d7 e804d9afff                     call       0x7ff8d76cda60
028dc 0f1f8400d4290018               nop        dword ptr [rax + rax + 0x180029d4]
028e4 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
028ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
028f2 e869ca1917                     call       0x7ff8eed6cbe0
028f7 f4                             hlt        
028f8 be5d000000                     mov        esi, 0x5d
028fd 90                             nop        
028fe 90                             nop        
028ff e8dcd8afff                     call       0x7ff8d76cda60
02904 0f1f8400fc290019               nop        dword ptr [rax + rax + 0x190029fc]
0290c 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
02916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0291a e841ca1917                     call       0x7ff8eed6cbe0
0291f f4                             hlt        
02920 bef6ffffff                     mov        esi, 0xfffffff6
02925 418beb                         mov        ebp, r11d
02928 90                             nop        
02929 90                             nop        
0292a 90                             nop        
0292b e8b0d8afff                     call       0x7ff8d76cda60
02930 0f1f8400282a001a               nop        dword ptr [rax + rax + 0x1a002a28]
02938 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
02942 4883e4f0                       and        rsp, 0xfffffffffffffff0
02946 e815ca1917                     call       0x7ff8eed6cbe0
0294b f4                             hlt        
0294c bef6ffffff                     mov        esi, 0xfffffff6
02951 8be9                           mov        ebp, ecx
02953 e888d8afff                     call       0x7ff8d76cda60
02958 0f1f8400502a001b               nop        dword ptr [rax + rax + 0x1b002a50]
02960 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
0296a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0296e e8edc91917                     call       0x7ff8eed6cbe0
02973 f4                             hlt        
02974 bef6ffffff                     mov        esi, 0xfffffff6
02979 418beb                         mov        ebp, r11d
0297c 90                             nop        
0297d 90                             nop        
0297e 90                             nop        
0297f e85cd8afff                     call       0x7ff8d76cda60
02984 0f1f84007c2a001c               nop        dword ptr [rax + rax + 0x1c002a7c]
0298c 48bf40e61bb0f87f0000           movabs     rdi, 0x7ff8b01be640
02996 4883e4f0                       and        rsp, 0xfffffffffffffff0
0299a e8c1c91917                     call       0x7ff8eed6cbe0
0299f f4                             hlt        
029a0 eb00                           jmp        0x7ff8d7bd0222
029a2 488bf0                         mov        rsi, rax
029a5 e912e1ffff                     jmp        0x7ff8d7bce33c
029aa 49ba0be3bcd7f87f0000           movabs     r10, 0x7ff8d7bce30b
029b4 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
029bb e92021b6ff                     jmp        0x7ff8d7732360
029c0 e89befb4ff                     call       0x7ff8d771f1e0
029c5 e964d6ffff                     jmp        0x7ff8d7bcd8ae
029ca f4                             hlt        
029cb f4                             hlt        
029cc f4                             hlt        
029cd f4                             hlt        
029ce f4                             hlt        
029cf f4                             hlt        
