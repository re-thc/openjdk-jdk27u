00000 e83b2d2e17                     call       0x7f471713b640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f858a270000                   jne        0x7f46ffe5b0b8
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
0018f 49ba801d2217477f0000           movabs     r10, 0x7f4717221d80
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f847e230000                   je         0x7f46ffe5ae30
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbe4050000                 cmp        r11d, 0x5e4
001c0 0f85be240000                   jne        0x7f46ffe5af84
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8464230000                   je         0x7f46ffe5ae40
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f8594240000                   jne        0x7f46ffe5af84
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8445230000                   je         0x7f46ffe5ae4d
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f8568240000                   jne        0x7f46ffe5af84
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f842b230000                   je         0x7f46ffe5ae5a
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f8541240000                   jne        0x7f46ffe5af84
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8409230000                   je         0x7f46ffe5ae67
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f8512240000                   jne        0x7f46ffe5af84
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f84ec220000                   je         0x7f46ffe5ae74
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f85e8230000                   jne        0x7f46ffe5af84
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84c7220000                   je         0x7f46ffe5ae81
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbe7050000                 cmp        r11d, 0x5e7
002c8 0f85b6230000                   jne        0x7f46ffe5af84
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f84b2220000                   je         0x7f46ffe5ae91
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fae6050000                 cmp        r10d, 0x5e6
002ee 0f8590230000                   jne        0x7f46ffe5af84
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f8497220000                   je         0x7f46ffe5aea1
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8489220000                   je         0x7f46ffe5aea1
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f847b220000                   je         0x7f46ffe5aea1
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d50f9                       lea        r10d, [r8 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8c53220000                   jl         0x7f46ffe5aea1
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e964020000                     jmp        0x7f46ffe58ec3
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
0039a 0f8db80f0000                   jge        0x7f46ffe59c58
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d55110000                   jge        0x7f46ffe59e28
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d24130000                   jge        0x7f46ffe5a020
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8df7140000                   jge        0x7f46ffe5a21c
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
00478 0f8e8a0b0000                   jle        0x7f46ffe59908
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f71160000                   jg         0x7f46ffe5a3fc
0048b 4181f8ffff0100                 cmp        r8d, 0x1ffff
00492 0f8f90170000                   jg         0x7f46ffe5a528
00498 4181fbffff0300                 cmp        r11d, 0x3ffff
0049f 0f8f17190000                   jg         0x7f46ffe5a6bc
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f839b1a0000                   jae        0x7f46ffe5a850
004b5 48c1e112                       shl        rcx, 0x12
004b9 4d63d9                         movsxd     r11, r9d
004bc 4d63c0                         movsxd     r8, r8d
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f8361090000                   jae        0x7f46ffe5973c
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db7000000                   jge        0x7f46ffe58eb5
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
00550 0f8dfe1b0000                   jge        0x7f46ffe5aa54
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
00593 0f8dbb1c0000                   jge        0x7f46ffe5ab54
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
005d0 0f8d6c040000                   jge        0x7f46ffe59342
005d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005db 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005df 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e7 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005ef 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f3 453bd9                         cmp        r11d, r9d
005f6 0f83e8040000                   jae        0x7f46ffe593e4
005fc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00601 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00605 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
0060c 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00613 458b4104                       mov        r8d, dword ptr [r9 + 4]
00617 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0061c 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00624 413bc8                         cmp        ecx, r8d
00627 0f83ab050000                   jae        0x7f46ffe594d8
0062d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00632 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00636 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063e 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00646 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064a 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
0064f 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00657 453bd8                         cmp        r11d, r8d
0065a 0f8394060000                   jae        0x7f46ffe595f4
00660 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00665 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066d 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00674 ffc5                           inc        ebp
00676 896c2404                       mov        dword ptr [rsp + 4], ebp
0067a 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067e 0f8d31040000                   jge        0x7f46ffe593b5
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
00743 0f84e7090000                   je         0x7f46ffe59a30
00749 4183fa3f                       cmp        r10d, 0x3f
0074d 0f8fa50b0000                   jg         0x7f46ffe59bf8
00753 41b840000000                   mov        r8d, 0x40
00759 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
0075e 453bd0                         cmp        r10d, r8d
00761 7e43                           jle        0x7f46ffe590a6
00763 458bda                         mov        r11d, r10d
00766 452bd8                         sub        r11d, r8d
00769 4183f840                       cmp        r8d, 0x40
0076d 0f8dd51b0000                   jge        0x7f46ffe5ac48
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
007a4 eb21                           jmp        0x7f46ffe590c7
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
007e5 0f8ca5fbffff                   jl         0x7f46ffe58c90
007eb 458d50c0                       lea        r10d, [r8 - 0x40]
007ef 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007f4 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007f8 83c5f8                         add        ebp, -8
007fb 896c2430                       mov        dword ptr [rsp + 0x30], ebp
007ff 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00803 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00807 83c1f0                         add        ecx, -0x10
0080a 83f908                         cmp        ecx, 8
0080d 0f8ce1010000                   jl         0x7f46ffe592f4
00813 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00818 4183c2e8                       add        r10d, -0x18
0081c 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00824 0f8235fbffff                   jb         0x7f46ffe58c5f
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
009e7 e874a3b6ff                     call       0x7f46ff9c3660
009ec 0f1f8400e40a0001               nop        dword ptr [rax + rax + 0x1000ae4]
009f4 85c9                           test       ecx, ecx
009f6 7f08                           jg         0x7f46ffe59300
009f8 4533d2                         xor        r10d, r10d
009fb e96cf9ffff                     jmp        0x7f46ffe58c6c
00a00 8be9                           mov        ebp, ecx
00a02 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a0a 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a0e 90                             nop        
00a0f e84c25aaff                     call       0x7f46ff8fb860
00a14 0f1f84000c0b0002               nop        dword ptr [rax + rax + 0x2000b0c]
00a1c 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a21 41c1e003                       shl        r8d, 3
00a25 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a2a 41c1e303                       shl        r11d, 3
00a2e 452bd8                         sub        r11d, r8d
00a31 4181c3c0000000                 add        r11d, 0xc0
00a38 c462a1f7d0                     shlx       r10, rax, r11
00a3d e92af9ffff                     jmp        0x7f46ffe58c6c
00a42 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a4a 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a52 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a57 4d3bd3                         cmp        r10, r11
00a5a 7f26                           jg         0x7f46ffe59382
00a5c 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a61 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a66 0f85d41c0000                   jne        0x7f46ffe5b040
00a6c 418bc2                         mov        eax, r10d
00a6f 4881c430010000                 add        rsp, 0x130
00a76 5d                             pop        rbp
00a77 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a7b 0f87211d0000                   ja         0x7f46ffe5b0a2
00a81 c3                             ret        
00a82 48be18ae72e200000000           movabs     rsi, 0xe272ae18
00a8c 666690                         nop        
00a8f e8cc24aaff                     call       0x7f46ff8fb860
00a94 0f1f84008c0b0003               nop        dword ptr [rax + rax + 0x3000b8c]
00a9c 4885c0                         test       rax, rax
00a9f 0f84871c0000                   je         0x7f46ffe5b02c
00aa5 488bf0                         mov        rsi, rax
00aa8 4881c430010000                 add        rsp, 0x130
00aaf 5d                             pop        rbp
00ab0 e9ab21b7ff                     jmp        0x7f46ff9cb560
00ab5 4533d2                         xor        r10d, r10d
00ab8 4533c0                         xor        r8d, r8d
00abb 4533db                         xor        r11d, r11d
00abe 33c9                           xor        ecx, ecx
00ac0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ac8 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00ad0 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00ad8 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00adf e9f8fbffff                     jmp        0x7f46ffe58fdc
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
00bcb e890a1b6ff                     call       0x7f46ff9c3660
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
00ce7 e874a0b6ff                     call       0x7f46ff9c3660
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
00e2f e82c9fb6ff                     call       0x7f46ff9c3660
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
00f50 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00f55 48894424f8                     mov        qword ptr [rsp - 8], rax
00f5a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f61 89442464                       mov        dword ptr [rsp + 0x64], eax
00f65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f6a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f76 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f82 48894424f8                     mov        qword ptr [rsp - 8], rax
00f87 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f8e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f9a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fa6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fba 488f842490000000               pop        qword ptr [rsp + 0x90]
00fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc7 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fce 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fda 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fe2 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00fea 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00ff2 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00ffa 90                             nop        
00ffb e8609db6ff                     call       0x7f46ff9c3660
01000 0f1f8400f8100007               nop        dword ptr [rax + rax + 0x70010f8]
01008 33c9                           xor        ecx, ecx
0100a 4c3bc9                         cmp        r9, rcx
0100d bdffffffff                     mov        ebp, 0xffffffff
01012 7c08                           jl         0x7f46ffe5991c
01014 400f95c5                       setne      bpl
01018 400fb6ed                       movzx      ebp, bpl
0101c be45ffffff                     mov        esi, 0xffffff45
01021 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01026 48894424f8                     mov        qword ptr [rsp - 8], rax
0102b 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01032 89442460                       mov        dword ptr [rsp + 0x60], eax
01036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103b 48894424f8                     mov        qword ptr [rsp - 8], rax
01040 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01047 89442464                       mov        dword ptr [rsp + 0x64], eax
0104b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01050 48894424f8                     mov        qword ptr [rsp - 8], rax
01055 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0105c 89442468                       mov        dword ptr [rsp + 0x68], eax
01060 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01065 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
0106d 48894424f8                     mov        qword ptr [rsp - 8], rax
01072 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01079 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0107d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01082 48894424f8                     mov        qword ptr [rsp - 8], rax
01087 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0108e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01095 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109a 48894424f8                     mov        qword ptr [rsp - 8], rax
0109f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010a6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b2 48894424f8                     mov        qword ptr [rsp - 8], rax
010b7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010be 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ca 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010d2 488f842498000000               pop        qword ptr [rsp + 0x98]
010da 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010e2 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010ea 48894424f8                     mov        qword ptr [rsp - 8], rax
010ef 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
010f6 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
010fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01102 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0110a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01112 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0111a 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01122 90                             nop        
01123 e8389cb6ff                     call       0x7f46ff9c3660
01128 0f1f840020120008               nop        dword ptr [rax + rax + 0x8001220]
01130 be45ffffff                     mov        esi, 0xffffff45
01135 48894424f8                     mov        qword ptr [rsp - 8], rax
0113a 8b442408                       mov        eax, dword ptr [rsp + 8]
0113e 890424                         mov        dword ptr [rsp], eax
01141 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01146 48894424f8                     mov        qword ptr [rsp - 8], rax
0114b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0114f 89442404                       mov        dword ptr [rsp + 4], eax
01153 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01158 48ff742410                     push       qword ptr [rsp + 0x10]
0115d 488f442408                     pop        qword ptr [rsp + 8]
01162 48ff742418                     push       qword ptr [rsp + 0x18]
01167 488f442410                     pop        qword ptr [rsp + 0x10]
0116c 48894424f8                     mov        qword ptr [rsp - 8], rax
01171 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01175 89442418                       mov        dword ptr [rsp + 0x18], eax
01179 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117e 48894424f8                     mov        qword ptr [rsp - 8], rax
01183 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01187 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0118b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01190 48894424f8                     mov        qword ptr [rsp - 8], rax
01195 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01199 89442420                       mov        dword ptr [rsp + 0x20], eax
0119d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a2 48894424f8                     mov        qword ptr [rsp - 8], rax
011a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011ab 89442424                       mov        dword ptr [rsp + 0x24], eax
011af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011b9 48ff742438                     push       qword ptr [rsp + 0x38]
011be 488f442430                     pop        qword ptr [rsp + 0x30]
011c3 48894424f8                     mov        qword ptr [rsp - 8], rax
011c8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011cc 89442438                       mov        dword ptr [rsp + 0x38], eax
011d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d5 48894424f8                     mov        qword ptr [rsp - 8], rax
011da 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e7 48ff742448                     push       qword ptr [rsp + 0x48]
011ec 488f442440                     pop        qword ptr [rsp + 0x40]
011f1 48ff742450                     push       qword ptr [rsp + 0x50]
011f6 488f442448                     pop        qword ptr [rsp + 0x48]
011fb 48ff742458                     push       qword ptr [rsp + 0x58]
01200 488f442450                     pop        qword ptr [rsp + 0x50]
01205 48894424f8                     mov        qword ptr [rsp - 8], rax
0120a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01211 89442458                       mov        dword ptr [rsp + 0x58], eax
01215 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121a 48894424f8                     mov        qword ptr [rsp - 8], rax
0121f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01226 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0122a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122f 48894424f8                     mov        qword ptr [rsp - 8], rax
01234 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0123b 89442460                       mov        dword ptr [rsp + 0x60], eax
0123f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01244 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0124c 488f442468                     pop        qword ptr [rsp + 0x68]
01251 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01259 488f442478                     pop        qword ptr [rsp + 0x78]
0125e 48894424f8                     mov        qword ptr [rsp - 8], rax
01263 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0126a 89442464                       mov        dword ptr [rsp + 0x64], eax
0126e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01273 48894424f8                     mov        qword ptr [rsp - 8], rax
01278 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0127f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01286 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128b 48894424f8                     mov        qword ptr [rsp - 8], rax
01290 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01297 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0129e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a3 48894424f8                     mov        qword ptr [rsp - 8], rax
012a8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012af 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012c3 488f842490000000               pop        qword ptr [rsp + 0x90]
012cb 48894424f8                     mov        qword ptr [rsp - 8], rax
012d0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012d7 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012e3 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
012eb e8709ab6ff                     call       0x7f46ff9c3660
012f0 0f1f8400e8130009               nop        dword ptr [rax + rax + 0x90013e8]
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01302 8b442408                       mov        eax, dword ptr [rsp + 8]
01306 890424                         mov        dword ptr [rsp], eax
01309 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130e 48894424f8                     mov        qword ptr [rsp - 8], rax
01313 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01317 89442404                       mov        dword ptr [rsp + 4], eax
0131b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01320 48ff742410                     push       qword ptr [rsp + 0x10]
01325 488f442408                     pop        qword ptr [rsp + 8]
0132a 48ff742418                     push       qword ptr [rsp + 0x18]
0132f 488f442410                     pop        qword ptr [rsp + 0x10]
01334 48894424f8                     mov        qword ptr [rsp - 8], rax
01339 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0133d 89442418                       mov        dword ptr [rsp + 0x18], eax
01341 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01346 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0134b e8109ab6ff                     call       0x7f46ff9c3660
01350 0f1f84004814000a               nop        dword ptr [rax + rax + 0xa001448]
01358 be45ffffff                     mov        esi, 0xffffff45
0135d 48894424f8                     mov        qword ptr [rsp - 8], rax
01362 8b442408                       mov        eax, dword ptr [rsp + 8]
01366 890424                         mov        dword ptr [rsp], eax
01369 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136e 48894424f8                     mov        qword ptr [rsp - 8], rax
01373 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01377 89442404                       mov        dword ptr [rsp + 4], eax
0137b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01380 48ff742410                     push       qword ptr [rsp + 0x10]
01385 488f442408                     pop        qword ptr [rsp + 8]
0138a 48ff742418                     push       qword ptr [rsp + 0x18]
0138f 488f442410                     pop        qword ptr [rsp + 0x10]
01394 48894424f8                     mov        qword ptr [rsp - 8], rax
01399 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0139d 89442418                       mov        dword ptr [rsp + 0x18], eax
013a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a6 48894424f8                     mov        qword ptr [rsp - 8], rax
013ab 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013af 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b8 48894424f8                     mov        qword ptr [rsp - 8], rax
013bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013c1 89442420                       mov        dword ptr [rsp + 0x20], eax
013c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ca 48894424f8                     mov        qword ptr [rsp - 8], rax
013cf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013d3 89442424                       mov        dword ptr [rsp + 0x24], eax
013d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013dc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013e1 48ff742438                     push       qword ptr [rsp + 0x38]
013e6 488f442430                     pop        qword ptr [rsp + 0x30]
013eb 48894424f8                     mov        qword ptr [rsp - 8], rax
013f0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
013f4 89442438                       mov        dword ptr [rsp + 0x38], eax
013f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01402 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01406 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0140a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140f 48ff742448                     push       qword ptr [rsp + 0x48]
01414 488f442440                     pop        qword ptr [rsp + 0x40]
01419 48ff742450                     push       qword ptr [rsp + 0x50]
0141e 488f442448                     pop        qword ptr [rsp + 0x48]
01423 48ff742458                     push       qword ptr [rsp + 0x58]
01428 488f442450                     pop        qword ptr [rsp + 0x50]
0142d 48894424f8                     mov        qword ptr [rsp - 8], rax
01432 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01439 89442458                       mov        dword ptr [rsp + 0x58], eax
0143d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01442 48894424f8                     mov        qword ptr [rsp - 8], rax
01447 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0144e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01452 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01457 48894424f8                     mov        qword ptr [rsp - 8], rax
0145c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01463 89442460                       mov        dword ptr [rsp + 0x60], eax
01467 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01474 488f442468                     pop        qword ptr [rsp + 0x68]
01479 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01481 488f442470                     pop        qword ptr [rsp + 0x70]
01486 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0148e 488f442478                     pop        qword ptr [rsp + 0x78]
01493 48894424f8                     mov        qword ptr [rsp - 8], rax
01498 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0149f 89442464                       mov        dword ptr [rsp + 0x64], eax
014a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ad 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014b4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014cc 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d8 48894424f8                     mov        qword ptr [rsp - 8], rax
014dd 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014e4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
014f8 488f842490000000               pop        qword ptr [rsp + 0x90]
01500 48894424f8                     mov        qword ptr [rsp - 8], rax
01505 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0150c 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01513 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01518 666690                         nop        
0151b e84098b6ff                     call       0x7f46ff9c3660
01520 0f1f84001816000b               nop        dword ptr [rax + rax + 0xb001618]
01528 be45ffffff                     mov        esi, 0xffffff45
0152d 48894424f8                     mov        qword ptr [rsp - 8], rax
01532 8b442408                       mov        eax, dword ptr [rsp + 8]
01536 890424                         mov        dword ptr [rsp], eax
01539 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153e 48894424f8                     mov        qword ptr [rsp - 8], rax
01543 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01547 89442404                       mov        dword ptr [rsp + 4], eax
0154b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01550 48ff742410                     push       qword ptr [rsp + 0x10]
01555 488f442408                     pop        qword ptr [rsp + 8]
0155a 48ff742418                     push       qword ptr [rsp + 0x18]
0155f 488f442410                     pop        qword ptr [rsp + 0x10]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0156d 89442418                       mov        dword ptr [rsp + 0x18], eax
01571 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01576 48894424f8                     mov        qword ptr [rsp - 8], rax
0157b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0157f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01583 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01588 48894424f8                     mov        qword ptr [rsp - 8], rax
0158d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01591 89442420                       mov        dword ptr [rsp + 0x20], eax
01595 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159a 48894424f8                     mov        qword ptr [rsp - 8], rax
0159f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015a3 89442424                       mov        dword ptr [rsp + 0x24], eax
015a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015b1 48ff742438                     push       qword ptr [rsp + 0x38]
015b6 488f442430                     pop        qword ptr [rsp + 0x30]
015bb 48894424f8                     mov        qword ptr [rsp - 8], rax
015c0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015c4 89442438                       mov        dword ptr [rsp + 0x38], eax
015c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cd 48894424f8                     mov        qword ptr [rsp - 8], rax
015d2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015d6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 48ff742448                     push       qword ptr [rsp + 0x48]
015e4 488f442440                     pop        qword ptr [rsp + 0x40]
015e9 48ff742450                     push       qword ptr [rsp + 0x50]
015ee 488f442448                     pop        qword ptr [rsp + 0x48]
015f3 48ff742458                     push       qword ptr [rsp + 0x58]
015f8 488f442450                     pop        qword ptr [rsp + 0x50]
015fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01602 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01609 89442458                       mov        dword ptr [rsp + 0x58], eax
0160d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01612 48894424f8                     mov        qword ptr [rsp - 8], rax
01617 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0161e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01622 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01627 48894424f8                     mov        qword ptr [rsp - 8], rax
0162c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01633 89442460                       mov        dword ptr [rsp + 0x60], eax
01637 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01644 488f442468                     pop        qword ptr [rsp + 0x68]
01649 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01651 488f442470                     pop        qword ptr [rsp + 0x70]
01656 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0165e 488f442478                     pop        qword ptr [rsp + 0x78]
01663 48894424f8                     mov        qword ptr [rsp - 8], rax
01668 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0166f 89442464                       mov        dword ptr [rsp + 0x64], eax
01673 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01678 48894424f8                     mov        qword ptr [rsp - 8], rax
0167d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01684 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 48894424f8                     mov        qword ptr [rsp - 8], rax
01695 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0169c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a8 48894424f8                     mov        qword ptr [rsp - 8], rax
016ad 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016b4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016c8 488f842490000000               pop        qword ptr [rsp + 0x90]
016d0 48894424f8                     mov        qword ptr [rsp - 8], rax
016d5 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016dc 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e8 48894424f8                     mov        qword ptr [rsp - 8], rax
016ed 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
016f4 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01708 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01710 666690                         nop        
01713 e84896b6ff                     call       0x7f46ff9c3660
01718 0f1f84001018000c               nop        dword ptr [rax + rax + 0xc001810]
01720 be45ffffff                     mov        esi, 0xffffff45
01725 48894424f8                     mov        qword ptr [rsp - 8], rax
0172a 8b442408                       mov        eax, dword ptr [rsp + 8]
0172e 890424                         mov        dword ptr [rsp], eax
01731 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01736 48894424f8                     mov        qword ptr [rsp - 8], rax
0173b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0173f 89442404                       mov        dword ptr [rsp + 4], eax
01743 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01748 48ff742410                     push       qword ptr [rsp + 0x10]
0174d 488f442408                     pop        qword ptr [rsp + 8]
01752 48ff742418                     push       qword ptr [rsp + 0x18]
01757 488f442410                     pop        qword ptr [rsp + 0x10]
0175c 48894424f8                     mov        qword ptr [rsp - 8], rax
01761 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01765 89442418                       mov        dword ptr [rsp + 0x18], eax
01769 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176e 48894424f8                     mov        qword ptr [rsp - 8], rax
01773 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01777 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0177b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01780 48894424f8                     mov        qword ptr [rsp - 8], rax
01785 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01789 89442420                       mov        dword ptr [rsp + 0x20], eax
0178d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01792 48894424f8                     mov        qword ptr [rsp - 8], rax
01797 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0179b 89442424                       mov        dword ptr [rsp + 0x24], eax
0179f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017a9 48ff742438                     push       qword ptr [rsp + 0x38]
017ae 488f442430                     pop        qword ptr [rsp + 0x30]
017b3 48894424f8                     mov        qword ptr [rsp - 8], rax
017b8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017bc 89442438                       mov        dword ptr [rsp + 0x38], eax
017c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c5 48894424f8                     mov        qword ptr [rsp - 8], rax
017ca 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017ce 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d7 48ff742448                     push       qword ptr [rsp + 0x48]
017dc 488f442440                     pop        qword ptr [rsp + 0x40]
017e1 48ff742450                     push       qword ptr [rsp + 0x50]
017e6 488f442448                     pop        qword ptr [rsp + 0x48]
017eb 48ff742458                     push       qword ptr [rsp + 0x58]
017f0 488f442450                     pop        qword ptr [rsp + 0x50]
017f5 48894424f8                     mov        qword ptr [rsp - 8], rax
017fa 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01801 89442458                       mov        dword ptr [rsp + 0x58], eax
01805 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01816 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0181a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181f 48894424f8                     mov        qword ptr [rsp - 8], rax
01824 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0182b 89442460                       mov        dword ptr [rsp + 0x60], eax
0182f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01834 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0183c 488f442468                     pop        qword ptr [rsp + 0x68]
01841 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01849 488f442470                     pop        qword ptr [rsp + 0x70]
0184e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01856 488f442478                     pop        qword ptr [rsp + 0x78]
0185b 48894424f8                     mov        qword ptr [rsp - 8], rax
01860 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01867 89442464                       mov        dword ptr [rsp + 0x64], eax
0186b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01870 48894424f8                     mov        qword ptr [rsp - 8], rax
01875 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0187c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01888 48894424f8                     mov        qword ptr [rsp - 8], rax
0188d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01894 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0189b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a0 48894424f8                     mov        qword ptr [rsp - 8], rax
018a5 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018ac 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b8 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018c0 488f842490000000               pop        qword ptr [rsp + 0x90]
018c8 48894424f8                     mov        qword ptr [rsp - 8], rax
018cd 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018d4 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e0 48894424f8                     mov        qword ptr [rsp - 8], rax
018e5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018ec 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
018f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f8 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01900 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
01907 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
0190f e84c94b6ff                     call       0x7f46ff9c3660
01914 0f1f84000c1a000d               nop        dword ptr [rax + rax + 0xd001a0c]
0191c be45ffffff                     mov        esi, 0xffffff45
01921 48894424f8                     mov        qword ptr [rsp - 8], rax
01926 8b442408                       mov        eax, dword ptr [rsp + 8]
0192a 890424                         mov        dword ptr [rsp], eax
0192d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01932 48894424f8                     mov        qword ptr [rsp - 8], rax
01937 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0193b 89442404                       mov        dword ptr [rsp + 4], eax
0193f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01944 48ff742410                     push       qword ptr [rsp + 0x10]
01949 488f442408                     pop        qword ptr [rsp + 8]
0194e 48ff742418                     push       qword ptr [rsp + 0x18]
01953 488f442410                     pop        qword ptr [rsp + 0x10]
01958 48894424f8                     mov        qword ptr [rsp - 8], rax
0195d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01961 89442418                       mov        dword ptr [rsp + 0x18], eax
01965 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196a 48894424f8                     mov        qword ptr [rsp - 8], rax
0196f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01973 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197c 48894424f8                     mov        qword ptr [rsp - 8], rax
01981 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01985 89442420                       mov        dword ptr [rsp + 0x20], eax
01989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198e 48894424f8                     mov        qword ptr [rsp - 8], rax
01993 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01997 89442424                       mov        dword ptr [rsp + 0x24], eax
0199b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019a5 48ff742438                     push       qword ptr [rsp + 0x38]
019aa 488f442430                     pop        qword ptr [rsp + 0x30]
019af 48894424f8                     mov        qword ptr [rsp - 8], rax
019b4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019b8 89442438                       mov        dword ptr [rsp + 0x38], eax
019bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c1 48894424f8                     mov        qword ptr [rsp - 8], rax
019c6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019ca 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d3 48ff742448                     push       qword ptr [rsp + 0x48]
019d8 488f442440                     pop        qword ptr [rsp + 0x40]
019dd 48ff742450                     push       qword ptr [rsp + 0x50]
019e2 488f442448                     pop        qword ptr [rsp + 0x48]
019e7 48ff742458                     push       qword ptr [rsp + 0x58]
019ec 488f442450                     pop        qword ptr [rsp + 0x50]
019f1 48894424f8                     mov        qword ptr [rsp - 8], rax
019f6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
019fd 89442458                       mov        dword ptr [rsp + 0x58], eax
01a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a06 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a12 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a20 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a27 89442460                       mov        dword ptr [rsp + 0x60], eax
01a2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a30 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a38 488f442468                     pop        qword ptr [rsp + 0x68]
01a3d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a45 488f442478                     pop        qword ptr [rsp + 0x78]
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a56 89442464                       mov        dword ptr [rsp + 0x64], eax
01a5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a64 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a6b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a77 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a83 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a94 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01a9b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01aa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01aaf 488f842490000000               pop        qword ptr [rsp + 0x90]
01ab7 48894424f8                     mov        qword ptr [rsp - 8], rax
01abc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ac3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01aca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01acf 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ad7 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01ade 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01ae5 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01aed 6690                           nop        
01aef e86c92b6ff                     call       0x7f46ff9c3660
01af4 0f1f8400ec1b000e               nop        dword ptr [rax + rax + 0xe001bec]
01afc b9ffffff7f                     mov        ecx, 0x7fffffff
01b01 4c3bc9                         cmp        r9, rcx
01b04 bdffffffff                     mov        ebp, 0xffffffff
01b09 7c08                           jl         0x7f46ffe5a413
01b0b 400f95c5                       setne      bpl
01b0f 400fb6ed                       movzx      ebp, bpl
01b13 be45ffffff                     mov        esi, 0xffffff45
01b18 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b22 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b29 89442460                       mov        dword ptr [rsp + 0x60], eax
01b2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b3e 89442464                       mov        dword ptr [rsp + 0x64], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b53 89442468                       mov        dword ptr [rsp + 0x68], eax
01b57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5c 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01b64 48894424f8                     mov        qword ptr [rsp - 8], rax
01b69 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b70 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b79 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7e 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b85 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b91 48894424f8                     mov        qword ptr [rsp - 8], rax
01b96 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b9d 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01ba4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba9 48894424f8                     mov        qword ptr [rsp - 8], rax
01bae 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bb5 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01bbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc1 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bc9 488f842498000000               pop        qword ptr [rsp + 0x98]
01bd1 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bd9 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01be1 48894424f8                     mov        qword ptr [rsp - 8], rax
01be6 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bed 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01bf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf9 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c01 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01c09 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
01c11 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c19 6690                           nop        
01c1b e84091b6ff                     call       0x7f46ff9c3660
01c20 0f1f8400181d000f               nop        dword ptr [rax + rax + 0xf001d18]
01c28 be45ffffff                     mov        esi, 0xffffff45
01c2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c32 8b442408                       mov        eax, dword ptr [rsp + 8]
01c36 890424                         mov        dword ptr [rsp], eax
01c39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c43 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c47 89442404                       mov        dword ptr [rsp + 4], eax
01c4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c50 48ff742410                     push       qword ptr [rsp + 0x10]
01c55 488f442408                     pop        qword ptr [rsp + 8]
01c5a 48ff742418                     push       qword ptr [rsp + 0x18]
01c5f 488f442410                     pop        qword ptr [rsp + 0x10]
01c64 48894424f8                     mov        qword ptr [rsp - 8], rax
01c69 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c6d 89442418                       mov        dword ptr [rsp + 0x18], eax
01c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c76 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c7f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c88 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c91 89442420                       mov        dword ptr [rsp + 0x20], eax
01c95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ca3 89442424                       mov        dword ptr [rsp + 0x24], eax
01ca7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01cb1 48ff742438                     push       qword ptr [rsp + 0x38]
01cb6 488f442430                     pop        qword ptr [rsp + 0x30]
01cbb 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01cc4 89442438                       mov        dword ptr [rsp + 0x38], eax
01cc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cd6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cdf 48ff742448                     push       qword ptr [rsp + 0x48]
01ce4 488f442440                     pop        qword ptr [rsp + 0x40]
01ce9 48ff742450                     push       qword ptr [rsp + 0x50]
01cee 488f442448                     pop        qword ptr [rsp + 0x48]
01cf3 48ff742458                     push       qword ptr [rsp + 0x58]
01cf8 488f442450                     pop        qword ptr [rsp + 0x50]
01cfd 48894424f8                     mov        qword ptr [rsp - 8], rax
01d02 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d09 89442458                       mov        dword ptr [rsp + 0x58], eax
01d0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d12 48894424f8                     mov        qword ptr [rsp - 8], rax
01d17 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d1e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d27 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d33 89442460                       mov        dword ptr [rsp + 0x60], eax
01d37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01d41 48894424f8                     mov        qword ptr [rsp - 8], rax
01d46 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d4d 89442464                       mov        dword ptr [rsp + 0x64], eax
01d51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d56 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d62 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d73 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d7a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d86 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01d92 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01d99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01da6 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01dae 90                             nop        
01daf e8ac8fb6ff                     call       0x7f46ff9c3660
01db4 0f1f8400ac1e0010               nop        dword ptr [rax + rax + 0x10001eac]
01dbc be45ffffff                     mov        esi, 0xffffff45
01dc1 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc6 8b442408                       mov        eax, dword ptr [rsp + 8]
01dca 890424                         mov        dword ptr [rsp], eax
01dcd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01ddb 89442404                       mov        dword ptr [rsp + 4], eax
01ddf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de4 48ff742410                     push       qword ptr [rsp + 0x10]
01de9 488f442408                     pop        qword ptr [rsp + 8]
01dee 48ff742418                     push       qword ptr [rsp + 0x18]
01df3 488f442410                     pop        qword ptr [rsp + 0x10]
01df8 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e01 89442418                       mov        dword ptr [rsp + 0x18], eax
01e05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e13 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e21 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e25 89442420                       mov        dword ptr [rsp + 0x20], eax
01e29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e33 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e37 89442424                       mov        dword ptr [rsp + 0x24], eax
01e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e40 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e45 48ff742438                     push       qword ptr [rsp + 0x38]
01e4a 488f442430                     pop        qword ptr [rsp + 0x30]
01e4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e54 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e58 89442438                       mov        dword ptr [rsp + 0x38], eax
01e5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e61 48894424f8                     mov        qword ptr [rsp - 8], rax
01e66 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e6a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e73 48ff742448                     push       qword ptr [rsp + 0x48]
01e78 488f442440                     pop        qword ptr [rsp + 0x40]
01e7d 48ff742450                     push       qword ptr [rsp + 0x50]
01e82 488f442448                     pop        qword ptr [rsp + 0x48]
01e87 48ff742458                     push       qword ptr [rsp + 0x58]
01e8c 488f442450                     pop        qword ptr [rsp + 0x50]
01e91 48894424f8                     mov        qword ptr [rsp - 8], rax
01e96 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e9d 89442458                       mov        dword ptr [rsp + 0x58], eax
01ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
01eab 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01eb2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01eb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ec7 89442460                       mov        dword ptr [rsp + 0x60], eax
01ecb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed0 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ed5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eda 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01ee1 89442464                       mov        dword ptr [rsp + 0x64], eax
01ee5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eea 48894424f8                     mov        qword ptr [rsp - 8], rax
01eef 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ef6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f02 48894424f8                     mov        qword ptr [rsp - 8], rax
01f07 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f0e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f26 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f32 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f3a 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01f42 90                             nop        
01f43 e8188eb6ff                     call       0x7f46ff9c3660
01f48 0f1f840040200011               nop        dword ptr [rax + rax + 0x11002040]
01f50 be3dffffff                     mov        esi, 0xffffff3d
01f55 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5a 8b442408                       mov        eax, dword ptr [rsp + 8]
01f5e 890424                         mov        dword ptr [rsp], eax
01f61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f66 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f6f 89442404                       mov        dword ptr [rsp + 4], eax
01f73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f78 48ff742410                     push       qword ptr [rsp + 0x10]
01f7d 488f442408                     pop        qword ptr [rsp + 8]
01f82 48ff742418                     push       qword ptr [rsp + 0x18]
01f87 488f442410                     pop        qword ptr [rsp + 0x10]
01f8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f91 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f95 89442418                       mov        dword ptr [rsp + 0x18], eax
01f99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fa7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fb9 89442420                       mov        dword ptr [rsp + 0x20], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fcb 89442424                       mov        dword ptr [rsp + 0x24], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01fd9 48ff742438                     push       qword ptr [rsp + 0x38]
01fde 488f442430                     pop        qword ptr [rsp + 0x30]
01fe3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01fec 89442438                       mov        dword ptr [rsp + 0x38], eax
01ff0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff5 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ffe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02002 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02007 48ff742448                     push       qword ptr [rsp + 0x48]
0200c 488f442440                     pop        qword ptr [rsp + 0x40]
02011 48ff742450                     push       qword ptr [rsp + 0x50]
02016 488f442448                     pop        qword ptr [rsp + 0x48]
0201b 48ff742458                     push       qword ptr [rsp + 0x58]
02020 488f442450                     pop        qword ptr [rsp + 0x50]
02025 48894424f8                     mov        qword ptr [rsp - 8], rax
0202a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02031 89442458                       mov        dword ptr [rsp + 0x58], eax
02035 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203a 48894424f8                     mov        qword ptr [rsp - 8], rax
0203f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02046 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0204a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204f 48894424f8                     mov        qword ptr [rsp - 8], rax
02054 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0205b 89442460                       mov        dword ptr [rsp + 0x60], eax
0205f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02064 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02069 48894424f8                     mov        qword ptr [rsp - 8], rax
0206e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02075 89442464                       mov        dword ptr [rsp + 0x64], eax
02079 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0207e 48894424f8                     mov        qword ptr [rsp - 8], rax
02083 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0208a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02091 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02096 48894424f8                     mov        qword ptr [rsp - 8], rax
0209b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020a2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ae 48894424f8                     mov        qword ptr [rsp - 8], rax
020b3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020ba 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020ce 488f842490000000               pop        qword ptr [rsp + 0x90]
020d6 48894424f8                     mov        qword ptr [rsp - 8], rax
020db 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
020e2 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
020e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ee 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
020f6 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
020fe 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02106 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0210e 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02116 48894424f8                     mov        qword ptr [rsp - 8], rax
0211b 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02122 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02129 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02136 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0213e 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02146 90                             nop        
02147 e8148cb6ff                     call       0x7f46ff9c3660
0214c 0f1f840044220012               nop        dword ptr [rax + rax + 0x12002244]
02154 be45ffffff                     mov        esi, 0xffffff45
02159 48894424f8                     mov        qword ptr [rsp - 8], rax
0215e 8b442408                       mov        eax, dword ptr [rsp + 8]
02162 890424                         mov        dword ptr [rsp], eax
02165 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216a 48894424f8                     mov        qword ptr [rsp - 8], rax
0216f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02173 89442404                       mov        dword ptr [rsp + 4], eax
02177 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217c 48ff742410                     push       qword ptr [rsp + 0x10]
02181 488f442408                     pop        qword ptr [rsp + 8]
02186 48ff742418                     push       qword ptr [rsp + 0x18]
0218b 488f442410                     pop        qword ptr [rsp + 0x10]
02190 48894424f8                     mov        qword ptr [rsp - 8], rax
02195 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02199 89442418                       mov        dword ptr [rsp + 0x18], eax
0219d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a2 48894424f8                     mov        qword ptr [rsp - 8], rax
021a7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021ab 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b4 48894424f8                     mov        qword ptr [rsp - 8], rax
021b9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021bd 89442420                       mov        dword ptr [rsp + 0x20], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021cf 89442424                       mov        dword ptr [rsp + 0x24], eax
021d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
021dd 48ff742438                     push       qword ptr [rsp + 0x38]
021e2 488f442430                     pop        qword ptr [rsp + 0x30]
021e7 48894424f8                     mov        qword ptr [rsp - 8], rax
021ec 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021f0 89442438                       mov        dword ptr [rsp + 0x38], eax
021f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f9 48894424f8                     mov        qword ptr [rsp - 8], rax
021fe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02202 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 48ff742448                     push       qword ptr [rsp + 0x48]
02210 488f442440                     pop        qword ptr [rsp + 0x40]
02215 48ff742450                     push       qword ptr [rsp + 0x50]
0221a 488f442448                     pop        qword ptr [rsp + 0x48]
0221f 48ff742458                     push       qword ptr [rsp + 0x58]
02224 488f442450                     pop        qword ptr [rsp + 0x50]
02229 897c2458                       mov        dword ptr [rsp + 0x58], edi
0222d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02235 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0223d 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02245 6690                           nop        
02247 e8148bb6ff                     call       0x7f46ff9c3660
0224c 0f1f840044230013               nop        dword ptr [rax + rax + 0x13002344]
02254 be45ffffff                     mov        esi, 0xffffff45
02259 48894424f8                     mov        qword ptr [rsp - 8], rax
0225e 8b442408                       mov        eax, dword ptr [rsp + 8]
02262 890424                         mov        dword ptr [rsp], eax
02265 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0226a 48894424f8                     mov        qword ptr [rsp - 8], rax
0226f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02273 89442404                       mov        dword ptr [rsp + 4], eax
02277 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227c 48ff742410                     push       qword ptr [rsp + 0x10]
02281 488f442408                     pop        qword ptr [rsp + 8]
02286 48ff742418                     push       qword ptr [rsp + 0x18]
0228b 488f442410                     pop        qword ptr [rsp + 0x10]
02290 48894424f8                     mov        qword ptr [rsp - 8], rax
02295 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02299 89442418                       mov        dword ptr [rsp + 0x18], eax
0229d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a2 48894424f8                     mov        qword ptr [rsp - 8], rax
022a7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022ab 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b4 48894424f8                     mov        qword ptr [rsp - 8], rax
022b9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022bd 89442420                       mov        dword ptr [rsp + 0x20], eax
022c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c6 48894424f8                     mov        qword ptr [rsp - 8], rax
022cb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022cf 89442424                       mov        dword ptr [rsp + 0x24], eax
022d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
022dd 48ff742438                     push       qword ptr [rsp + 0x38]
022e2 488f442430                     pop        qword ptr [rsp + 0x30]
022e7 48894424f8                     mov        qword ptr [rsp - 8], rax
022ec 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022f0 89442438                       mov        dword ptr [rsp + 0x38], eax
022f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f9 48894424f8                     mov        qword ptr [rsp - 8], rax
022fe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02302 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02306 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230b 48ff742448                     push       qword ptr [rsp + 0x48]
02310 488f442440                     pop        qword ptr [rsp + 0x40]
02315 48ff742450                     push       qword ptr [rsp + 0x50]
0231a 488f442448                     pop        qword ptr [rsp + 0x48]
0231f 48ff742458                     push       qword ptr [rsp + 0x58]
02324 488f442450                     pop        qword ptr [rsp + 0x50]
02329 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02330 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02338 666690                         nop        
0233b e8208ab6ff                     call       0x7f46ff9c3660
02340 0f1f840038240014               nop        dword ptr [rax + rax + 0x14002438]
02348 be45ffffff                     mov        esi, 0xffffff45
0234d 48894424f8                     mov        qword ptr [rsp - 8], rax
02352 8b442408                       mov        eax, dword ptr [rsp + 8]
02356 890424                         mov        dword ptr [rsp], eax
02359 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235e 48894424f8                     mov        qword ptr [rsp - 8], rax
02363 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02367 89442404                       mov        dword ptr [rsp + 4], eax
0236b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02370 48ff742410                     push       qword ptr [rsp + 0x10]
02375 488f442408                     pop        qword ptr [rsp + 8]
0237a 48ff742418                     push       qword ptr [rsp + 0x18]
0237f 488f442410                     pop        qword ptr [rsp + 0x10]
02384 48894424f8                     mov        qword ptr [rsp - 8], rax
02389 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0238d 89442418                       mov        dword ptr [rsp + 0x18], eax
02391 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02396 48894424f8                     mov        qword ptr [rsp - 8], rax
0239b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0239f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023b1 89442420                       mov        dword ptr [rsp + 0x20], eax
023b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ba 48894424f8                     mov        qword ptr [rsp - 8], rax
023bf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023c3 89442424                       mov        dword ptr [rsp + 0x24], eax
023c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023cc 48ff742438                     push       qword ptr [rsp + 0x38]
023d1 488f442430                     pop        qword ptr [rsp + 0x30]
023d6 48894424f8                     mov        qword ptr [rsp - 8], rax
023db 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023df 89442438                       mov        dword ptr [rsp + 0x38], eax
023e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ed 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023f1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fa 48ff742448                     push       qword ptr [rsp + 0x48]
023ff 488f442440                     pop        qword ptr [rsp + 0x40]
02404 48ff742450                     push       qword ptr [rsp + 0x50]
02409 488f442448                     pop        qword ptr [rsp + 0x48]
0240e 48ff742458                     push       qword ptr [rsp + 0x58]
02413 488f442450                     pop        qword ptr [rsp + 0x50]
02418 48894424f8                     mov        qword ptr [rsp - 8], rax
0241d 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02424 89442458                       mov        dword ptr [rsp + 0x58], eax
02428 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242d 48894424f8                     mov        qword ptr [rsp - 8], rax
02432 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02439 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0243d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02442 48894424f8                     mov        qword ptr [rsp - 8], rax
02447 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0244e 89442460                       mov        dword ptr [rsp + 0x60], eax
02452 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02457 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0245f 488f442468                     pop        qword ptr [rsp + 0x68]
02464 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0246c 488f442470                     pop        qword ptr [rsp + 0x70]
02471 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02479 488f442478                     pop        qword ptr [rsp + 0x78]
0247e 48894424f8                     mov        qword ptr [rsp - 8], rax
02483 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0248a 89442464                       mov        dword ptr [rsp + 0x64], eax
0248e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02493 48894424f8                     mov        qword ptr [rsp - 8], rax
02498 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0249f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ab 48894424f8                     mov        qword ptr [rsp - 8], rax
024b0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024b7 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c3 48894424f8                     mov        qword ptr [rsp - 8], rax
024c8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024cf 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024db 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
024e3 488f842490000000               pop        qword ptr [rsp + 0x90]
024eb 48894424f8                     mov        qword ptr [rsp - 8], rax
024f0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
024f7 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
024fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02503 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0250b 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02513 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0251b 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
02523 e83888b6ff                     call       0x7f46ff9c3660
02528 0f1f840020260015               nop        dword ptr [rax + rax + 0x15002620]
02530 4533d2                         xor        r10d, r10d
02533 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
0253b e98edcffff                     jmp        0x7f46ffe58ace
02540 4533d2                         xor        r10d, r10d
02543 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02548 e9addcffff                     jmp        0x7f46ffe58afa
0254d 4533d2                         xor        r10d, r10d
02550 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02555 e9c7dcffff                     jmp        0x7f46ffe58b21
0255a 4533d2                         xor        r10d, r10d
0255d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02562 e9e6dcffff                     jmp        0x7f46ffe58b4d
02567 4533d2                         xor        r10d, r10d
0256a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0256f e903ddffff                     jmp        0x7f46ffe58b77
02574 4533d2                         xor        r10d, r10d
02577 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0257c e928ddffff                     jmp        0x7f46ffe58ba9
02581 4533d2                         xor        r10d, r10d
02584 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0258c e945ddffff                     jmp        0x7f46ffe58bd6
02591 4533d2                         xor        r10d, r10d
02594 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0259c e95bddffff                     jmp        0x7f46ffe58bfc
025a1 bebeffffff                     mov        esi, 0xffffffbe
025a6 48894424f8                     mov        qword ptr [rsp - 8], rax
025ab 8b442408                       mov        eax, dword ptr [rsp + 8]
025af 890424                         mov        dword ptr [rsp], eax
025b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b7 48894424f8                     mov        qword ptr [rsp - 8], rax
025bc 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
025c0 89442404                       mov        dword ptr [rsp + 4], eax
025c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c9 48ff742410                     push       qword ptr [rsp + 0x10]
025ce 488f442408                     pop        qword ptr [rsp + 8]
025d3 48ff742418                     push       qword ptr [rsp + 0x18]
025d8 488f442410                     pop        qword ptr [rsp + 0x10]
025dd 48894424f8                     mov        qword ptr [rsp - 8], rax
025e2 8b442420                       mov        eax, dword ptr [rsp + 0x20]
025e6 89442418                       mov        dword ptr [rsp + 0x18], eax
025ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ef 48894424f8                     mov        qword ptr [rsp - 8], rax
025f4 8b442424                       mov        eax, dword ptr [rsp + 0x24]
025f8 8944241c                       mov        dword ptr [rsp + 0x1c], eax
025fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02601 48894424f8                     mov        qword ptr [rsp - 8], rax
02606 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0260a 89442420                       mov        dword ptr [rsp + 0x20], eax
0260e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02613 48894424f8                     mov        qword ptr [rsp - 8], rax
02618 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0261c 89442424                       mov        dword ptr [rsp + 0x24], eax
02620 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02625 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0262a 48ff742438                     push       qword ptr [rsp + 0x38]
0262f 488f442430                     pop        qword ptr [rsp + 0x30]
02634 48894424f8                     mov        qword ptr [rsp - 8], rax
02639 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0263d 89442438                       mov        dword ptr [rsp + 0x38], eax
02641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02646 48894424f8                     mov        qword ptr [rsp - 8], rax
0264b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0264f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02658 48ff742448                     push       qword ptr [rsp + 0x48]
0265d 488f442440                     pop        qword ptr [rsp + 0x40]
02662 48ff742450                     push       qword ptr [rsp + 0x50]
02667 488f442448                     pop        qword ptr [rsp + 0x48]
0266c 48ff742458                     push       qword ptr [rsp + 0x58]
02671 488f442450                     pop        qword ptr [rsp + 0x50]
02676 90                             nop        
02677 e8e486b6ff                     call       0x7f46ff9c3660
0267c 0f1f840074270016               nop        dword ptr [rax + rax + 0x16002774]
02684 be85ffffff                     mov        esi, 0xffffff85
02689 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
0268d 48894424f8                     mov        qword ptr [rsp - 8], rax
02692 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02696 890424                         mov        dword ptr [rsp], eax
02699 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269e 48894424f8                     mov        qword ptr [rsp - 8], rax
026a3 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026a7 89442404                       mov        dword ptr [rsp + 4], eax
026ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b0 48894424f8                     mov        qword ptr [rsp - 8], rax
026b5 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026b9 89442408                       mov        dword ptr [rsp + 8], eax
026bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c2 48894424f8                     mov        qword ptr [rsp - 8], rax
026c7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026cb 8944240c                       mov        dword ptr [rsp + 0xc], eax
026cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d4 48894424f8                     mov        qword ptr [rsp - 8], rax
026d9 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026dd 89442410                       mov        dword ptr [rsp + 0x10], eax
026e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e6 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
026eb 48ff742438                     push       qword ptr [rsp + 0x38]
026f0 488f442420                     pop        qword ptr [rsp + 0x20]
026f5 48894424f8                     mov        qword ptr [rsp - 8], rax
026fa 8b442440                       mov        eax, dword ptr [rsp + 0x40]
026fe 89442414                       mov        dword ptr [rsp + 0x14], eax
02702 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02707 48894424f8                     mov        qword ptr [rsp - 8], rax
0270c 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02710 89442428                       mov        dword ptr [rsp + 0x28], eax
02714 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02719 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0271e 90                             nop        
0271f e83c86b6ff                     call       0x7f46ff9c3660
02724 0f1f84001c280017               nop        dword ptr [rax + rax + 0x1700281c]
0272c bef6ffffff                     mov        esi, 0xfffffff6
02731 6690                           nop        
02733 e82886b6ff                     call       0x7f46ff9c3660
02738 0f1f840030280018               nop        dword ptr [rax + rax + 0x18002830]
02740 be5d000000                     mov        esi, 0x5d
02745 6690                           nop        
02747 e81486b6ff                     call       0x7f46ff9c3660
0274c 0f1f840044280019               nop        dword ptr [rax + rax + 0x19002844]
02754 bef6ffffff                     mov        esi, 0xfffffff6
02759 418beb                         mov        ebp, r11d
0275c 666690                         nop        
0275f e8fc85b6ff                     call       0x7f46ff9c3660
02764 0f1f84005c28001a               nop        dword ptr [rax + rax + 0x1a00285c]
0276c bef6ffffff                     mov        esi, 0xfffffff6
02771 8be9                           mov        ebp, ecx
02773 e8e885b6ff                     call       0x7f46ff9c3660
02778 0f1f84007028001b               nop        dword ptr [rax + rax + 0x1b002870]
02780 bef6ffffff                     mov        esi, 0xfffffff6
02785 418beb                         mov        ebp, r11d
02788 666690                         nop        
0278b e8d085b6ff                     call       0x7f46ff9c3660
02790 0f1f84008828001c               nop        dword ptr [rax + rax + 0x1c002888]
02798 eb00                           jmp        0x7f46ffe5b09a
0279a 488bf0                         mov        rsi, rax
0279d e906e3ffff                     jmp        0x7f46ffe593a8
027a2 49ba7793e5ff467f0000           movabs     r10, 0x7f46ffe59377
027ac 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
027b3 e9282eaaff                     jmp        0x7f46ff8fdee0
027b8 e8e3f9a8ff                     call       0x7f46ff8eaaa0
027bd e96cd8ffff                     jmp        0x7f46ffe5892e
027c2 f4                             hlt        
027c3 f4                             hlt        
027c4 f4                             hlt        
027c5 f4                             hlt        
027c6 f4                             hlt        
027c7 f4                             hlt        
