00000 e87b8def17                     call       0x7efc93ad2c00
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
00028 0f85822b0000                   jne        0x7efc7bbdca30
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
0018f 49ba7053c993fc7e0000           movabs     r10, 0x7efc93c95370
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f84ea260000                   je         0x7efc7bbdc71c
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fb05010000                 cmp        r11d, 0x105
001c0 0f853e280000                   jne        0x7efc7bbdc884
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f84d0260000                   je         0x7efc7bbdc72c
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16040000                 cmp        r10d, 0x416
001ea 0f8514280000                   jne        0x7efc7bbdc884
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84b1260000                   je         0x7efc7bbdc739
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a040000                 cmp        r11d, 0x40a
00216 0f85e8270000                   jne        0x7efc7bbdc884
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f8497260000                   je         0x7efc7bbdc746
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d040000                 cmp        r10d, 0x40d
0023d 0f85c1270000                   jne        0x7efc7bbdc884
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8475260000                   je         0x7efc7bbdc753
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d040000                 cmp        r11d, 0x40d
0026c 0f8592270000                   jne        0x7efc7bbdc884
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8458260000                   je         0x7efc7bbdc760
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d040000                 cmp        r10d, 0x40d
00296 0f8568270000                   jne        0x7efc7bbdc884
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f8433260000                   je         0x7efc7bbdc76d
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fb08010000                 cmp        r11d, 0x108
002c8 0f8536270000                   jne        0x7efc7bbdc884
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f841e260000                   je         0x7efc7bbdc77d
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fa07010000                 cmp        r10d, 0x107
002ee 0f8510270000                   jne        0x7efc7bbdc884
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f8403260000                   je         0x7efc7bbdc78d
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f84f5250000                   je         0x7efc7bbdc78d
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f84e7250000                   je         0x7efc7bbdc78d
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d58f9                       lea        r11d, [r8 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8cbf250000                   jl         0x7efc7bbdc78d
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e95c020000                     jmp        0x7efc7bbda43b
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
0039a 0f8d44100000                   jge        0x7efc7bbdb264
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8df5110000                   jge        0x7efc7bbdb448
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8dd8130000                   jge        0x7efc7bbdb654
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8dbf150000                   jge        0x7efc7bbdb864
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
00478 0f8eda0b0000                   jle        0x7efc7bbdaed8
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f4d170000                   jg         0x7efc7bbdba58
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8f80180000                   jg         0x7efc7bbdbb98
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f1b1a0000                   jg         0x7efc7bbdbd40
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83b31b0000                   jae        0x7efc7bbdbee8
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f839d090000                   jae        0x7efc7bbdacf8
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8daf000000                   jge        0x7efc7bbda42d
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
00552 0f8d281d0000                   jge        0x7efc7bbdc100
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
0058c 0f8d121e0000                   jge        0x7efc7bbdc224
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
005c8 0f8d78040000                   jge        0x7efc7bbda8c6
005ce 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d3 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005d7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005df 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005e7 458b4204                       mov        r8d, dword ptr [r10 + 4]
005eb 453bd8                         cmp        r11d, r8d
005ee 0f83f2040000                   jae        0x7efc7bbda966
005f4 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
005f9 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
005fd 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00604 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
0060b 458b4104                       mov        r8d, dword ptr [r9 + 4]
0060f 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00614 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0061c 413bc8                         cmp        ecx, r8d
0061f 0f83c7050000                   jae        0x7efc7bbdaa6c
00625 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0062a 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0062e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00636 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0063e 458b4204                       mov        r8d, dword ptr [r10 + 4]
00642 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00647 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0064f 453bd8                         cmp        r11d, r8d
00652 0f83c4060000                   jae        0x7efc7bbdab9c
00658 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0065d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00665 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0066c ffc5                           inc        ebp
0066e 896c2404                       mov        dword ptr [rsp + 4], ebp
00672 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00676 0f8d3b040000                   jge        0x7efc7bbda937
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
00740 0f844e0a0000                   je         0x7efc7bbdb014
00746 4183fb3f                       cmp        r11d, 0x3f
0074a 0f8f200c0000                   jg         0x7efc7bbdb1f0
00750 41ba40000000                   mov        r10d, 0x40
00756 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
0075b 453bda                         cmp        r11d, r10d
0075e 7e43                           jle        0x7efc7bbda623
00760 458bc3                         mov        r8d, r11d
00763 452bc2                         sub        r8d, r10d
00766 4183fa40                       cmp        r10d, 0x40
0076a 0f8d301f0000                   jge        0x7efc7bbdc520
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
007a1 eb2b                           jmp        0x7efc7bbda64e
007a3 452bd3                         sub        r10d, r11d
007a6 c462abf7d3                     shrx       r10, rbx, r10
007ab 4183fb40                       cmp        r11d, 0x40
007af 0f8df71c0000                   jge        0x7efc7bbdc32c
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
007ec 0f8c9efbffff                   jl         0x7efc7bbda210
007f2 458d5ac0                       lea        r11d, [r10 - 0x40]
007f6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007fb 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007ff 83c5f8                         add        ebp, -8
00802 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00806 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0080a 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0080e 83c1f0                         add        ecx, -0x10
00811 83f908                         cmp        ecx, 8
00814 0f8cde010000                   jl         0x7efc7bbda878
0081a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0081f 4183c2e8                       add        r10d, -0x18
00823 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0082b 0f822efbffff                   jb         0x7efc7bbda1df
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
009d4 90                             nop        
009d5 90                             nop        
009d6 90                             nop        
009d7 e80432afff                     call       0x7efc7b6cda60
009dc 0f1f8400d40a0001               nop        dword ptr [rax + rax + 0x1000ad4]
009e4 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
009ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
009f2 e869accc17                     call       0x7efc938a54e0
009f7 f4                             hlt        
009f8 85c9                           test       ecx, ecx
009fa 7f08                           jg         0x7efc7bbda884
009fc 4533d2                         xor        r10d, r10d
009ff e968f9ffff                     jmp        0x7efc7bbda1ec
00a04 8be9                           mov        ebp, ecx
00a06 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a0e 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a12 90                             nop        
00a13 e8c853b5ff                     call       0x7efc7b72fc60
00a18 0f1f8400100b0002               nop        dword ptr [rax + rax + 0x2000b10]
00a20 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a25 41c1e303                       shl        r11d, 3
00a29 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a2e 41c1e203                       shl        r10d, 3
00a32 452bd3                         sub        r10d, r11d
00a35 4181c2c0000000                 add        r10d, 0xc0
00a3c c462a9f7d0                     shlx       r10, rax, r10
00a41 e926f9ffff                     jmp        0x7efc7bbda1ec
00a46 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a4e 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a56 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a5b 4d3bd3                         cmp        r10, r11
00a5e 7e31                           jle        0x7efc7bbda911
00a60 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a6a 90                             nop        
00a6b e87053b5ff                     call       0x7efc7b72fc60
00a70 0f1f8400680b0003               nop        dword ptr [rax + rax + 0x3000b68]
00a78 4885c0                         test       rax, rax
00a7b 0f843f200000                   je         0x7efc7bbdc940
00a81 488bf0                         mov        rsi, rax
00a84 4881c430010000                 add        rsp, 0x130
00a8b 5d                             pop        rbp
00a8c e94fe7aeff                     jmp        0x7efc7b6c9060
00a91 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a96 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a9b 0f8547200000                   jne        0x7efc7bbdc968
00aa1 418bc2                         mov        eax, r10d
00aa4 4881c430010000                 add        rsp, 0x130
00aab 5d                             pop        rbp
00aac 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ab0 0f87e4200000                   ja         0x7efc7bbdca1a
00ab6 c3                             ret        
00ab7 4533d2                         xor        r10d, r10d
00aba 33ed                           xor        ebp, ebp
00abc 4533c0                         xor        r8d, r8d
00abf 4533db                         xor        r11d, r11d
00ac2 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00aca 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00ad1 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00ad9 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00ae1 e9f3fbffff                     jmp        0x7efc7bbda559
00ae6 bee4ffffff                     mov        esi, 0xffffffe4
00aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
00af0 8b442408                       mov        eax, dword ptr [rsp + 8]
00af4 890424                         mov        dword ptr [rsp], eax
00af7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00afc 48894424f8                     mov        qword ptr [rsp - 8], rax
00b01 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b05 89442404                       mov        dword ptr [rsp + 4], eax
00b09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b0e 48ff742410                     push       qword ptr [rsp + 0x10]
00b13 488f442408                     pop        qword ptr [rsp + 8]
00b18 48ff742418                     push       qword ptr [rsp + 0x18]
00b1d 488f442410                     pop        qword ptr [rsp + 0x10]
00b22 48894424f8                     mov        qword ptr [rsp - 8], rax
00b27 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b2b 89442418                       mov        dword ptr [rsp + 0x18], eax
00b2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b34 48894424f8                     mov        qword ptr [rsp - 8], rax
00b39 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b3d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b46 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b4f 89442420                       mov        dword ptr [rsp + 0x20], eax
00b53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b58 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5d 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b61 89442424                       mov        dword ptr [rsp + 0x24], eax
00b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6a 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b6f 48ff742438                     push       qword ptr [rsp + 0x38]
00b74 488f442430                     pop        qword ptr [rsp + 0x30]
00b79 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b82 89442438                       mov        dword ptr [rsp + 0x38], eax
00b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00b90 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b94 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9d 48ff742448                     push       qword ptr [rsp + 0x48]
00ba2 488f442440                     pop        qword ptr [rsp + 0x40]
00ba7 48ff742450                     push       qword ptr [rsp + 0x50]
00bac 488f442448                     pop        qword ptr [rsp + 0x48]
00bb1 48ff742458                     push       qword ptr [rsp + 0x58]
00bb6 488f442450                     pop        qword ptr [rsp + 0x50]
00bbb 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bc3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bcb e81030afff                     call       0x7efc7b6cda60
00bd0 0f1f8400c80c0004               nop        dword ptr [rax + rax + 0x4000cc8]
00bd8 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
00be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00be6 e875aacc17                     call       0x7efc938a54e0
00beb f4                             hlt        
00bec bee4ffffff                     mov        esi, 0xffffffe4
00bf1 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf6 8b442408                       mov        eax, dword ptr [rsp + 8]
00bfa 890424                         mov        dword ptr [rsp], eax
00bfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c02 48894424f8                     mov        qword ptr [rsp - 8], rax
00c07 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c0b 89442404                       mov        dword ptr [rsp + 4], eax
00c0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c14 48ff742410                     push       qword ptr [rsp + 0x10]
00c19 488f442408                     pop        qword ptr [rsp + 8]
00c1e 48ff742418                     push       qword ptr [rsp + 0x18]
00c23 488f442410                     pop        qword ptr [rsp + 0x10]
00c28 48894424f8                     mov        qword ptr [rsp - 8], rax
00c2d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c31 89442418                       mov        dword ptr [rsp + 0x18], eax
00c35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c3f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c43 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c51 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c55 89442420                       mov        dword ptr [rsp + 0x20], eax
00c59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c63 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c67 89442424                       mov        dword ptr [rsp + 0x24], eax
00c6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c70 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c75 48ff742438                     push       qword ptr [rsp + 0x38]
00c7a 488f442430                     pop        qword ptr [rsp + 0x30]
00c7f 48894424f8                     mov        qword ptr [rsp - 8], rax
00c84 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c88 89442438                       mov        dword ptr [rsp + 0x38], eax
00c8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c91 48894424f8                     mov        qword ptr [rsp - 8], rax
00c96 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c9a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ca3 48ff742448                     push       qword ptr [rsp + 0x48]
00ca8 488f442440                     pop        qword ptr [rsp + 0x40]
00cad 48ff742450                     push       qword ptr [rsp + 0x50]
00cb2 488f442448                     pop        qword ptr [rsp + 0x48]
00cb7 48ff742458                     push       qword ptr [rsp + 0x58]
00cbc 488f442450                     pop        qword ptr [rsp + 0x50]
00cc1 48894424f8                     mov        qword ptr [rsp - 8], rax
00cc6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ccd 89442458                       mov        dword ptr [rsp + 0x58], eax
00cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cdb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00ce2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00ce6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ceb 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00cf3 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00cfa 90                             nop        
00cfb e8e02eafff                     call       0x7efc7b6cda60
00d00 0f1f8400f80d0005               nop        dword ptr [rax + rax + 0x5000df8]
00d08 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
00d12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d16 e845a9cc17                     call       0x7efc938a54e0
00d1b f4                             hlt        
00d1c bee4ffffff                     mov        esi, 0xffffffe4
00d21 48894424f8                     mov        qword ptr [rsp - 8], rax
00d26 8b442408                       mov        eax, dword ptr [rsp + 8]
00d2a 890424                         mov        dword ptr [rsp], eax
00d2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d32 48894424f8                     mov        qword ptr [rsp - 8], rax
00d37 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d3b 89442404                       mov        dword ptr [rsp + 4], eax
00d3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d44 48ff742410                     push       qword ptr [rsp + 0x10]
00d49 488f442408                     pop        qword ptr [rsp + 8]
00d4e 48ff742418                     push       qword ptr [rsp + 0x18]
00d53 488f442410                     pop        qword ptr [rsp + 0x10]
00d58 48894424f8                     mov        qword ptr [rsp - 8], rax
00d5d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d61 89442418                       mov        dword ptr [rsp + 0x18], eax
00d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d6a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d6f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d73 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d7c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d81 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d85 89442420                       mov        dword ptr [rsp + 0x20], eax
00d89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d93 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d97 89442424                       mov        dword ptr [rsp + 0x24], eax
00d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00da5 48ff742438                     push       qword ptr [rsp + 0x38]
00daa 488f442430                     pop        qword ptr [rsp + 0x30]
00daf 48894424f8                     mov        qword ptr [rsp - 8], rax
00db4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00db8 89442438                       mov        dword ptr [rsp + 0x38], eax
00dbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dc1 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dca 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00dce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd3 48ff742448                     push       qword ptr [rsp + 0x48]
00dd8 488f442440                     pop        qword ptr [rsp + 0x40]
00ddd 48ff742450                     push       qword ptr [rsp + 0x50]
00de2 488f442448                     pop        qword ptr [rsp + 0x48]
00de7 48ff742458                     push       qword ptr [rsp + 0x58]
00dec 488f442450                     pop        qword ptr [rsp + 0x50]
00df1 48894424f8                     mov        qword ptr [rsp - 8], rax
00df6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00dfd 89442458                       mov        dword ptr [rsp + 0x58], eax
00e01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e06 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e12 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1b 48894424f8                     mov        qword ptr [rsp - 8], rax
00e20 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e27 89442460                       mov        dword ptr [rsp + 0x60], eax
00e2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e30 48894424f8                     mov        qword ptr [rsp - 8], rax
00e35 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e3c 89442464                       mov        dword ptr [rsp + 0x64], eax
00e40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e45 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e4d 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e55 90                             nop        
00e56 90                             nop        
00e57 e8842dafff                     call       0x7efc7b6cda60
00e5c 0f1f8400540f0006               nop        dword ptr [rax + rax + 0x6000f54]
00e64 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
00e6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e72 e8e9a7cc17                     call       0x7efc938a54e0
00e77 f4                             hlt        
00e78 bee4ffffff                     mov        esi, 0xffffffe4
00e7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e82 8b442408                       mov        eax, dword ptr [rsp + 8]
00e86 890424                         mov        dword ptr [rsp], eax
00e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e93 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e97 89442404                       mov        dword ptr [rsp + 4], eax
00e9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea0 48ff742410                     push       qword ptr [rsp + 0x10]
00ea5 488f442408                     pop        qword ptr [rsp + 8]
00eaa 48ff742418                     push       qword ptr [rsp + 0x18]
00eaf 488f442410                     pop        qword ptr [rsp + 0x10]
00eb4 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00ebd 89442418                       mov        dword ptr [rsp + 0x18], eax
00ec1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec6 48894424f8                     mov        qword ptr [rsp - 8], rax
00ecb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00ecf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ed3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ed8 48894424f8                     mov        qword ptr [rsp - 8], rax
00edd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ee1 89442420                       mov        dword ptr [rsp + 0x20], eax
00ee5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eea 48894424f8                     mov        qword ptr [rsp - 8], rax
00eef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ef3 89442424                       mov        dword ptr [rsp + 0x24], eax
00ef7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f01 48ff742438                     push       qword ptr [rsp + 0x38]
00f06 488f442430                     pop        qword ptr [rsp + 0x30]
00f0b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f10 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f14 89442438                       mov        dword ptr [rsp + 0x38], eax
00f18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f22 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f26 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f2f 48ff742448                     push       qword ptr [rsp + 0x48]
00f34 488f442440                     pop        qword ptr [rsp + 0x40]
00f39 48ff742450                     push       qword ptr [rsp + 0x50]
00f3e 488f442448                     pop        qword ptr [rsp + 0x48]
00f43 48ff742458                     push       qword ptr [rsp + 0x58]
00f48 488f442450                     pop        qword ptr [rsp + 0x50]
00f4d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f52 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f59 89442458                       mov        dword ptr [rsp + 0x58], eax
00f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f62 48894424f8                     mov        qword ptr [rsp - 8], rax
00f67 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f6e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f77 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f83 89442460                       mov        dword ptr [rsp + 0x60], eax
00f87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00f91 48894424f8                     mov        qword ptr [rsp - 8], rax
00f96 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f9d 89442464                       mov        dword ptr [rsp + 0x64], eax
00fa1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fab 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fb2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fca 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fe2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fee 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00ff6 488f842490000000               pop        qword ptr [rsp + 0x90]
00ffe 48894424f8                     mov        qword ptr [rsp - 8], rax
01003 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0100a 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01011 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01016 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0101e 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01026 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0102e 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01036 90                             nop        
01037 e8a42bafff                     call       0x7efc7b6cda60
0103c 0f1f840034110007               nop        dword ptr [rax + rax + 0x7001134]
01044 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
0104e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01052 e809a6cc17                     call       0x7efc938a54e0
01057 f4                             hlt        
01058 33c9                           xor        ecx, ecx
0105a 4c3bc9                         cmp        r9, rcx
0105d bdffffffff                     mov        ebp, 0xffffffff
01062 7c08                           jl         0x7efc7bbdaeec
01064 400f95c5                       setne      bpl
01068 400fb6ed                       movzx      ebp, bpl
0106c be45ffffff                     mov        esi, 0xffffff45
01071 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01076 48894424f8                     mov        qword ptr [rsp - 8], rax
0107b 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01082 89442460                       mov        dword ptr [rsp + 0x60], eax
01086 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0108b 48894424f8                     mov        qword ptr [rsp - 8], rax
01090 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01097 89442464                       mov        dword ptr [rsp + 0x64], eax
0109b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a0 48894424f8                     mov        qword ptr [rsp - 8], rax
010a5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010ac 89442468                       mov        dword ptr [rsp + 0x68], eax
010b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b5 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
010bd 48894424f8                     mov        qword ptr [rsp - 8], rax
010c2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010c9 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d2 48894424f8                     mov        qword ptr [rsp - 8], rax
010d7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010de 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ea 48894424f8                     mov        qword ptr [rsp - 8], rax
010ef 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010f6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01102 48894424f8                     mov        qword ptr [rsp - 8], rax
01107 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0110e 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01115 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01122 488f842498000000               pop        qword ptr [rsp + 0x98]
0112a 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01132 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0113a 48894424f8                     mov        qword ptr [rsp - 8], rax
0113f 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01146 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0114d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01152 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0115a 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01162 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0116a 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01172 90                             nop        
01173 e8682aafff                     call       0x7efc7b6cda60
01178 0f1f840070120008               nop        dword ptr [rax + rax + 0x8001270]
01180 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
0118a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0118e e8cda4cc17                     call       0x7efc938a54e0
01193 f4                             hlt        
01194 be45ffffff                     mov        esi, 0xffffff45
01199 48894424f8                     mov        qword ptr [rsp - 8], rax
0119e 8b442408                       mov        eax, dword ptr [rsp + 8]
011a2 890424                         mov        dword ptr [rsp], eax
011a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011aa 48894424f8                     mov        qword ptr [rsp - 8], rax
011af 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011b3 89442404                       mov        dword ptr [rsp + 4], eax
011b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011bc 48ff742410                     push       qword ptr [rsp + 0x10]
011c1 488f442408                     pop        qword ptr [rsp + 8]
011c6 48ff742418                     push       qword ptr [rsp + 0x18]
011cb 488f442410                     pop        qword ptr [rsp + 0x10]
011d0 48894424f8                     mov        qword ptr [rsp - 8], rax
011d5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011d9 89442418                       mov        dword ptr [rsp + 0x18], eax
011dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e2 48894424f8                     mov        qword ptr [rsp - 8], rax
011e7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
011eb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
011ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f4 48894424f8                     mov        qword ptr [rsp - 8], rax
011f9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011fd 89442420                       mov        dword ptr [rsp + 0x20], eax
01201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01206 48894424f8                     mov        qword ptr [rsp - 8], rax
0120b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0120f 89442424                       mov        dword ptr [rsp + 0x24], eax
01213 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01218 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0121d 48ff742438                     push       qword ptr [rsp + 0x38]
01222 488f442430                     pop        qword ptr [rsp + 0x30]
01227 48894424f8                     mov        qword ptr [rsp - 8], rax
0122c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01230 89442438                       mov        dword ptr [rsp + 0x38], eax
01234 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01239 48894424f8                     mov        qword ptr [rsp - 8], rax
0123e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01242 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01246 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124b 48ff742448                     push       qword ptr [rsp + 0x48]
01250 488f442440                     pop        qword ptr [rsp + 0x40]
01255 48ff742450                     push       qword ptr [rsp + 0x50]
0125a 488f442448                     pop        qword ptr [rsp + 0x48]
0125f 48ff742458                     push       qword ptr [rsp + 0x58]
01264 488f442450                     pop        qword ptr [rsp + 0x50]
01269 48894424f8                     mov        qword ptr [rsp - 8], rax
0126e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01275 89442458                       mov        dword ptr [rsp + 0x58], eax
01279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0127e 48894424f8                     mov        qword ptr [rsp - 8], rax
01283 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0128a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0128e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01293 48894424f8                     mov        qword ptr [rsp - 8], rax
01298 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0129f 89442460                       mov        dword ptr [rsp + 0x60], eax
012a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012b0 488f442468                     pop        qword ptr [rsp + 0x68]
012b5 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012bd 488f442478                     pop        qword ptr [rsp + 0x78]
012c2 48894424f8                     mov        qword ptr [rsp - 8], rax
012c7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012ce 89442464                       mov        dword ptr [rsp + 0x64], eax
012d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d7 48894424f8                     mov        qword ptr [rsp - 8], rax
012dc 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
012e3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
012ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ef 48894424f8                     mov        qword ptr [rsp - 8], rax
012f4 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012fb 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01302 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01307 48894424f8                     mov        qword ptr [rsp - 8], rax
0130c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01313 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0131a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01327 488f842490000000               pop        qword ptr [rsp + 0x90]
0132f 48894424f8                     mov        qword ptr [rsp - 8], rax
01334 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0133b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01342 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01347 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0134f e88c28afff                     call       0x7efc7b6cda60
01354 0f1f84004c140009               nop        dword ptr [rax + rax + 0x900144c]
0135c 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
01366 4883e4f0                       and        rsp, 0xfffffffffffffff0
0136a e8f1a2cc17                     call       0x7efc938a54e0
0136f f4                             hlt        
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
013be 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013c3 e81828afff                     call       0x7efc7b6cda60
013c8 0f1f8400c014000a               nop        dword ptr [rax + rax + 0xa0014c0]
013d0 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
013da 4883e4f0                       and        rsp, 0xfffffffffffffff0
013de e87da2cc17                     call       0x7efc938a54e0
013e3 f4                             hlt        
013e4 be45ffffff                     mov        esi, 0xffffff45
013e9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ee 8b442408                       mov        eax, dword ptr [rsp + 8]
013f2 890424                         mov        dword ptr [rsp], eax
013f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fa 48894424f8                     mov        qword ptr [rsp - 8], rax
013ff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01403 89442404                       mov        dword ptr [rsp + 4], eax
01407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140c 48ff742410                     push       qword ptr [rsp + 0x10]
01411 488f442408                     pop        qword ptr [rsp + 8]
01416 48ff742418                     push       qword ptr [rsp + 0x18]
0141b 488f442410                     pop        qword ptr [rsp + 0x10]
01420 48894424f8                     mov        qword ptr [rsp - 8], rax
01425 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01429 89442418                       mov        dword ptr [rsp + 0x18], eax
0142d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01432 48894424f8                     mov        qword ptr [rsp - 8], rax
01437 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0143b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0143f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01444 48894424f8                     mov        qword ptr [rsp - 8], rax
01449 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0144d 89442420                       mov        dword ptr [rsp + 0x20], eax
01451 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01456 48894424f8                     mov        qword ptr [rsp - 8], rax
0145b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0145f 89442424                       mov        dword ptr [rsp + 0x24], eax
01463 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01468 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0146d 48ff742438                     push       qword ptr [rsp + 0x38]
01472 488f442430                     pop        qword ptr [rsp + 0x30]
01477 48894424f8                     mov        qword ptr [rsp - 8], rax
0147c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01480 89442438                       mov        dword ptr [rsp + 0x38], eax
01484 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01489 48894424f8                     mov        qword ptr [rsp - 8], rax
0148e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01492 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01496 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149b 48ff742448                     push       qword ptr [rsp + 0x48]
014a0 488f442440                     pop        qword ptr [rsp + 0x40]
014a5 48ff742450                     push       qword ptr [rsp + 0x50]
014aa 488f442448                     pop        qword ptr [rsp + 0x48]
014af 48ff742458                     push       qword ptr [rsp + 0x58]
014b4 488f442450                     pop        qword ptr [rsp + 0x50]
014b9 48894424f8                     mov        qword ptr [rsp - 8], rax
014be 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014c5 89442458                       mov        dword ptr [rsp + 0x58], eax
014c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ce 48894424f8                     mov        qword ptr [rsp - 8], rax
014d3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014da 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e3 48894424f8                     mov        qword ptr [rsp - 8], rax
014e8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
014ef 89442460                       mov        dword ptr [rsp + 0x60], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01500 488f442468                     pop        qword ptr [rsp + 0x68]
01505 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0150d 488f442470                     pop        qword ptr [rsp + 0x70]
01512 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0151a 488f442478                     pop        qword ptr [rsp + 0x78]
0151f 48894424f8                     mov        qword ptr [rsp - 8], rax
01524 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0152b 89442464                       mov        dword ptr [rsp + 0x64], eax
0152f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01534 48894424f8                     mov        qword ptr [rsp - 8], rax
01539 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01540 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154c 48894424f8                     mov        qword ptr [rsp - 8], rax
01551 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01558 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0155f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01570 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01584 488f842490000000               pop        qword ptr [rsp + 0x90]
0158c 48894424f8                     mov        qword ptr [rsp - 8], rax
01591 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01598 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0159f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a4 90                             nop        
015a5 90                             nop        
015a6 90                             nop        
015a7 e83426afff                     call       0x7efc7b6cda60
015ac 0f1f8400a416000b               nop        dword ptr [rax + rax + 0xb0016a4]
015b4 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
015be 4883e4f0                       and        rsp, 0xfffffffffffffff0
015c2 e899a0cc17                     call       0x7efc938a54e0
015c7 f4                             hlt        
015c8 be45ffffff                     mov        esi, 0xffffff45
015cd 48894424f8                     mov        qword ptr [rsp - 8], rax
015d2 8b442408                       mov        eax, dword ptr [rsp + 8]
015d6 890424                         mov        dword ptr [rsp], eax
015d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015de 48894424f8                     mov        qword ptr [rsp - 8], rax
015e3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
015e7 89442404                       mov        dword ptr [rsp + 4], eax
015eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f0 48ff742410                     push       qword ptr [rsp + 0x10]
015f5 488f442408                     pop        qword ptr [rsp + 8]
015fa 48ff742418                     push       qword ptr [rsp + 0x18]
015ff 488f442410                     pop        qword ptr [rsp + 0x10]
01604 48894424f8                     mov        qword ptr [rsp - 8], rax
01609 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0160d 89442418                       mov        dword ptr [rsp + 0x18], eax
01611 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01616 48894424f8                     mov        qword ptr [rsp - 8], rax
0161b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0161f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01623 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01628 48894424f8                     mov        qword ptr [rsp - 8], rax
0162d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01631 89442420                       mov        dword ptr [rsp + 0x20], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 48894424f8                     mov        qword ptr [rsp - 8], rax
0163f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01643 89442424                       mov        dword ptr [rsp + 0x24], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01651 48ff742438                     push       qword ptr [rsp + 0x38]
01656 488f442430                     pop        qword ptr [rsp + 0x30]
0165b 48894424f8                     mov        qword ptr [rsp - 8], rax
01660 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01664 89442438                       mov        dword ptr [rsp + 0x38], eax
01668 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166d 48894424f8                     mov        qword ptr [rsp - 8], rax
01672 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01676 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0167a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167f 48ff742448                     push       qword ptr [rsp + 0x48]
01684 488f442440                     pop        qword ptr [rsp + 0x40]
01689 48ff742450                     push       qword ptr [rsp + 0x50]
0168e 488f442448                     pop        qword ptr [rsp + 0x48]
01693 48ff742458                     push       qword ptr [rsp + 0x58]
01698 488f442450                     pop        qword ptr [rsp + 0x50]
0169d 48894424f8                     mov        qword ptr [rsp - 8], rax
016a2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016a9 89442458                       mov        dword ptr [rsp + 0x58], eax
016ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b2 48894424f8                     mov        qword ptr [rsp - 8], rax
016b7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016be 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c7 48894424f8                     mov        qword ptr [rsp - 8], rax
016cc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016d3 89442460                       mov        dword ptr [rsp + 0x60], eax
016d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016dc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
016e4 488f442468                     pop        qword ptr [rsp + 0x68]
016e9 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
016f1 488f442470                     pop        qword ptr [rsp + 0x70]
016f6 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
016fe 488f442478                     pop        qword ptr [rsp + 0x78]
01703 48894424f8                     mov        qword ptr [rsp - 8], rax
01708 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0170f 89442464                       mov        dword ptr [rsp + 0x64], eax
01713 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01718 48894424f8                     mov        qword ptr [rsp - 8], rax
0171d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01724 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0172b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01730 48894424f8                     mov        qword ptr [rsp - 8], rax
01735 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0173c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01743 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01748 48894424f8                     mov        qword ptr [rsp - 8], rax
0174d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01754 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0175b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01760 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01768 488f842490000000               pop        qword ptr [rsp + 0x90]
01770 48894424f8                     mov        qword ptr [rsp - 8], rax
01775 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
0177c 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
01783 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01788 48894424f8                     mov        qword ptr [rsp - 8], rax
0178d 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01794 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0179b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a0 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017a8 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017b0 90                             nop        
017b1 90                             nop        
017b2 90                             nop        
017b3 e82824afff                     call       0x7efc7b6cda60
017b8 0f1f8400b018000c               nop        dword ptr [rax + rax + 0xc0018b0]
017c0 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
017ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ce e88d9ecc17                     call       0x7efc938a54e0
017d3 f4                             hlt        
017d4 be45ffffff                     mov        esi, 0xffffff45
017d9 48894424f8                     mov        qword ptr [rsp - 8], rax
017de 8b442408                       mov        eax, dword ptr [rsp + 8]
017e2 890424                         mov        dword ptr [rsp], eax
017e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ea 48894424f8                     mov        qword ptr [rsp - 8], rax
017ef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
017f3 89442404                       mov        dword ptr [rsp + 4], eax
017f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fc 48ff742410                     push       qword ptr [rsp + 0x10]
01801 488f442408                     pop        qword ptr [rsp + 8]
01806 48ff742418                     push       qword ptr [rsp + 0x18]
0180b 488f442410                     pop        qword ptr [rsp + 0x10]
01810 48894424f8                     mov        qword ptr [rsp - 8], rax
01815 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01819 89442418                       mov        dword ptr [rsp + 0x18], eax
0181d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01822 48894424f8                     mov        qword ptr [rsp - 8], rax
01827 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0182b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0182f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01834 48894424f8                     mov        qword ptr [rsp - 8], rax
01839 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0183d 89442420                       mov        dword ptr [rsp + 0x20], eax
01841 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01846 48894424f8                     mov        qword ptr [rsp - 8], rax
0184b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0184f 89442424                       mov        dword ptr [rsp + 0x24], eax
01853 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01858 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0185d 48ff742438                     push       qword ptr [rsp + 0x38]
01862 488f442430                     pop        qword ptr [rsp + 0x30]
01867 48894424f8                     mov        qword ptr [rsp - 8], rax
0186c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01870 89442438                       mov        dword ptr [rsp + 0x38], eax
01874 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01879 48894424f8                     mov        qword ptr [rsp - 8], rax
0187e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01882 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01886 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188b 48ff742448                     push       qword ptr [rsp + 0x48]
01890 488f442440                     pop        qword ptr [rsp + 0x40]
01895 48ff742450                     push       qword ptr [rsp + 0x50]
0189a 488f442448                     pop        qword ptr [rsp + 0x48]
0189f 48ff742458                     push       qword ptr [rsp + 0x58]
018a4 488f442450                     pop        qword ptr [rsp + 0x50]
018a9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ae 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018b5 89442458                       mov        dword ptr [rsp + 0x58], eax
018b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018be 48894424f8                     mov        qword ptr [rsp - 8], rax
018c3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018ca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d3 48894424f8                     mov        qword ptr [rsp - 8], rax
018d8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018df 89442460                       mov        dword ptr [rsp + 0x60], eax
018e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
018f0 488f442468                     pop        qword ptr [rsp + 0x68]
018f5 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
018fd 488f442470                     pop        qword ptr [rsp + 0x70]
01902 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0190a 488f442478                     pop        qword ptr [rsp + 0x78]
0190f 48894424f8                     mov        qword ptr [rsp - 8], rax
01914 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0191b 89442464                       mov        dword ptr [rsp + 0x64], eax
0191f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01924 48894424f8                     mov        qword ptr [rsp - 8], rax
01929 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01930 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193c 48894424f8                     mov        qword ptr [rsp - 8], rax
01941 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01948 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0194f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01960 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01974 488f842490000000               pop        qword ptr [rsp + 0x90]
0197c 48894424f8                     mov        qword ptr [rsp - 8], rax
01981 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
01988 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
0198f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01994 48894424f8                     mov        qword ptr [rsp - 8], rax
01999 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019a0 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ac 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019b4 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019bb 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019c3 e81822afff                     call       0x7efc7b6cda60
019c8 0f1f8400c01a000d               nop        dword ptr [rax + rax + 0xd001ac0]
019d0 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
019da 4883e4f0                       and        rsp, 0xfffffffffffffff0
019de e87d9ccc17                     call       0x7efc938a54e0
019e3 f4                             hlt        
019e4 be45ffffff                     mov        esi, 0xffffff45
019e9 48894424f8                     mov        qword ptr [rsp - 8], rax
019ee 8b442408                       mov        eax, dword ptr [rsp + 8]
019f2 890424                         mov        dword ptr [rsp], eax
019f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fa 48894424f8                     mov        qword ptr [rsp - 8], rax
019ff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a03 89442404                       mov        dword ptr [rsp + 4], eax
01a07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0c 48ff742410                     push       qword ptr [rsp + 0x10]
01a11 488f442408                     pop        qword ptr [rsp + 8]
01a16 48ff742418                     push       qword ptr [rsp + 0x18]
01a1b 488f442410                     pop        qword ptr [rsp + 0x10]
01a20 48894424f8                     mov        qword ptr [rsp - 8], rax
01a25 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a29 89442418                       mov        dword ptr [rsp + 0x18], eax
01a2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a32 48894424f8                     mov        qword ptr [rsp - 8], rax
01a37 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a3b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a4d 89442420                       mov        dword ptr [rsp + 0x20], eax
01a51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a56 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a5f 89442424                       mov        dword ptr [rsp + 0x24], eax
01a63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a68 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a6d 48ff742438                     push       qword ptr [rsp + 0x38]
01a72 488f442430                     pop        qword ptr [rsp + 0x30]
01a77 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a80 89442438                       mov        dword ptr [rsp + 0x38], eax
01a84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a89 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01a92 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9b 48ff742448                     push       qword ptr [rsp + 0x48]
01aa0 488f442440                     pop        qword ptr [rsp + 0x40]
01aa5 48ff742450                     push       qword ptr [rsp + 0x50]
01aaa 488f442448                     pop        qword ptr [rsp + 0x48]
01aaf 48ff742458                     push       qword ptr [rsp + 0x58]
01ab4 488f442450                     pop        qword ptr [rsp + 0x50]
01ab9 48894424f8                     mov        qword ptr [rsp - 8], rax
01abe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ac5 89442458                       mov        dword ptr [rsp + 0x58], eax
01ac9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ace 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ada 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ade 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01aef 89442460                       mov        dword ptr [rsp + 0x60], eax
01af3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b00 488f442468                     pop        qword ptr [rsp + 0x68]
01b05 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b0d 488f442478                     pop        qword ptr [rsp + 0x78]
01b12 48894424f8                     mov        qword ptr [rsp - 8], rax
01b17 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b1e 89442464                       mov        dword ptr [rsp + 0x64], eax
01b22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b27 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b33 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b44 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b4b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b57 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b63 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b77 488f842490000000               pop        qword ptr [rsp + 0x90]
01b7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b84 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01b8b 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01b92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b97 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01b9f 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01ba6 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bad 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bb5 90                             nop        
01bb6 90                             nop        
01bb7 e82420afff                     call       0x7efc7b6cda60
01bbc 0f1f8400b41c000e               nop        dword ptr [rax + rax + 0xe001cb4]
01bc4 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
01bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bd2 e8899acc17                     call       0x7efc938a54e0
01bd7 f4                             hlt        
01bd8 be45ffffff                     mov        esi, 0xffffff45
01bdd b9ffffff7f                     mov        ecx, 0x7fffffff
01be2 4c3bc9                         cmp        r9, rcx
01be5 bdffffffff                     mov        ebp, 0xffffffff
01bea 7c08                           jl         0x7efc7bbdba74
01bec 400f95c5                       setne      bpl
01bf0 400fb6ed                       movzx      ebp, bpl
01bf4 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01bf9 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c05 89442460                       mov        dword ptr [rsp + 0x60], eax
01c09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c13 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c1a 89442464                       mov        dword ptr [rsp + 0x64], eax
01c1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c23 48894424f8                     mov        qword ptr [rsp - 8], rax
01c28 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c2f 89442468                       mov        dword ptr [rsp + 0x68], eax
01c33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c38 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c40 48894424f8                     mov        qword ptr [rsp - 8], rax
01c45 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c4c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c55 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5a 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c61 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c72 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01c79 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01c80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c85 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8a 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01c91 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01c98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9d 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ca5 488f842498000000               pop        qword ptr [rsp + 0x98]
01cad 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cb5 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01cc9 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01cd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01cdd 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01ce5 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01ced 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01cf5 90                             nop        
01cf6 90                             nop        
01cf7 e8e41eafff                     call       0x7efc7b6cda60
01cfc 0f1f8400f41d000f               nop        dword ptr [rax + rax + 0xf001df4]
01d04 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
01d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d12 e84999cc17                     call       0x7efc938a54e0
01d17 f4                             hlt        
01d18 be45ffffff                     mov        esi, 0xffffff45
01d1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d22 8b442408                       mov        eax, dword ptr [rsp + 8]
01d26 890424                         mov        dword ptr [rsp], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d33 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d37 89442404                       mov        dword ptr [rsp + 4], eax
01d3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d40 48ff742410                     push       qword ptr [rsp + 0x10]
01d45 488f442408                     pop        qword ptr [rsp + 8]
01d4a 48ff742418                     push       qword ptr [rsp + 0x18]
01d4f 488f442410                     pop        qword ptr [rsp + 0x10]
01d54 48894424f8                     mov        qword ptr [rsp - 8], rax
01d59 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d5d 89442418                       mov        dword ptr [rsp + 0x18], eax
01d61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d66 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d6f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d78 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d81 89442420                       mov        dword ptr [rsp + 0x20], eax
01d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01d93 89442424                       mov        dword ptr [rsp + 0x24], eax
01d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01da1 48ff742438                     push       qword ptr [rsp + 0x38]
01da6 488f442430                     pop        qword ptr [rsp + 0x30]
01dab 48894424f8                     mov        qword ptr [rsp - 8], rax
01db0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01db4 89442438                       mov        dword ptr [rsp + 0x38], eax
01db8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01dc6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dcf 48ff742448                     push       qword ptr [rsp + 0x48]
01dd4 488f442440                     pop        qword ptr [rsp + 0x40]
01dd9 48ff742450                     push       qword ptr [rsp + 0x50]
01dde 488f442448                     pop        qword ptr [rsp + 0x48]
01de3 48ff742458                     push       qword ptr [rsp + 0x58]
01de8 488f442450                     pop        qword ptr [rsp + 0x50]
01ded 48894424f8                     mov        qword ptr [rsp - 8], rax
01df2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01df9 89442458                       mov        dword ptr [rsp + 0x58], eax
01dfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e02 48894424f8                     mov        qword ptr [rsp - 8], rax
01e07 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e0e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e17 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e23 89442460                       mov        dword ptr [rsp + 0x60], eax
01e27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e31 48894424f8                     mov        qword ptr [rsp - 8], rax
01e36 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e3d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e46 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e52 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e63 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e6a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01e82 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01e96 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01e9e 90                             nop        
01e9f e83c1dafff                     call       0x7efc7b6cda60
01ea4 0f1f84009c1f0010               nop        dword ptr [rax + rax + 0x10001f9c]
01eac 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
01eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eba e8a197cc17                     call       0x7efc938a54e0
01ebf f4                             hlt        
01ec0 be45ffffff                     mov        esi, 0xffffff45
01ec5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eca 8b442408                       mov        eax, dword ptr [rsp + 8]
01ece 890424                         mov        dword ptr [rsp], eax
01ed1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed6 48894424f8                     mov        qword ptr [rsp - 8], rax
01edb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01edf 89442404                       mov        dword ptr [rsp + 4], eax
01ee3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee8 48ff742410                     push       qword ptr [rsp + 0x10]
01eed 488f442408                     pop        qword ptr [rsp + 8]
01ef2 48ff742418                     push       qword ptr [rsp + 0x18]
01ef7 488f442410                     pop        qword ptr [rsp + 0x10]
01efc 48894424f8                     mov        qword ptr [rsp - 8], rax
01f01 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f05 89442418                       mov        dword ptr [rsp + 0x18], eax
01f09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f13 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f17 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f20 48894424f8                     mov        qword ptr [rsp - 8], rax
01f25 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f29 89442420                       mov        dword ptr [rsp + 0x20], eax
01f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f32 48894424f8                     mov        qword ptr [rsp - 8], rax
01f37 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f3b 89442424                       mov        dword ptr [rsp + 0x24], eax
01f3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f44 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f49 48ff742438                     push       qword ptr [rsp + 0x38]
01f4e 488f442430                     pop        qword ptr [rsp + 0x30]
01f53 48894424f8                     mov        qword ptr [rsp - 8], rax
01f58 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f5c 89442438                       mov        dword ptr [rsp + 0x38], eax
01f60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f65 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f6e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f77 48ff742448                     push       qword ptr [rsp + 0x48]
01f7c 488f442440                     pop        qword ptr [rsp + 0x40]
01f81 48ff742450                     push       qword ptr [rsp + 0x50]
01f86 488f442448                     pop        qword ptr [rsp + 0x48]
01f8b 48ff742458                     push       qword ptr [rsp + 0x58]
01f90 488f442450                     pop        qword ptr [rsp + 0x50]
01f95 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fa1 89442458                       mov        dword ptr [rsp + 0x58], eax
01fa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01faa 48894424f8                     mov        qword ptr [rsp - 8], rax
01faf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fb6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbf 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01fcb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01fd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fde 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01fe5 89442464                       mov        dword ptr [rsp + 0x64], eax
01fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ffa 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02001 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02006 48894424f8                     mov        qword ptr [rsp - 8], rax
0200b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02012 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 48894424f8                     mov        qword ptr [rsp - 8], rax
02023 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0202a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02031 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02036 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0203e 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
02046 90                             nop        
02047 e8941bafff                     call       0x7efc7b6cda60
0204c 0f1f840044210011               nop        dword ptr [rax + rax + 0x11002144]
02054 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
0205e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02062 e8f995cc17                     call       0x7efc938a54e0
02067 f4                             hlt        
02068 be3dffffff                     mov        esi, 0xffffff3d
0206d 48894424f8                     mov        qword ptr [rsp - 8], rax
02072 8b442408                       mov        eax, dword ptr [rsp + 8]
02076 890424                         mov        dword ptr [rsp], eax
02079 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0207e 48894424f8                     mov        qword ptr [rsp - 8], rax
02083 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02087 89442404                       mov        dword ptr [rsp + 4], eax
0208b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02090 48ff742410                     push       qword ptr [rsp + 0x10]
02095 488f442408                     pop        qword ptr [rsp + 8]
0209a 48ff742418                     push       qword ptr [rsp + 0x18]
0209f 488f442410                     pop        qword ptr [rsp + 0x10]
020a4 48894424f8                     mov        qword ptr [rsp - 8], rax
020a9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020ad 89442418                       mov        dword ptr [rsp + 0x18], eax
020b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b6 48894424f8                     mov        qword ptr [rsp - 8], rax
020bb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020bf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c8 48894424f8                     mov        qword ptr [rsp - 8], rax
020cd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020d1 89442420                       mov        dword ptr [rsp + 0x20], eax
020d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020da 48894424f8                     mov        qword ptr [rsp - 8], rax
020df 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
020e3 89442424                       mov        dword ptr [rsp + 0x24], eax
020e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ec 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
020f1 48ff742438                     push       qword ptr [rsp + 0x38]
020f6 488f442430                     pop        qword ptr [rsp + 0x30]
020fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02100 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02104 89442438                       mov        dword ptr [rsp + 0x38], eax
02108 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210d 48894424f8                     mov        qword ptr [rsp - 8], rax
02112 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02116 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0211a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211f 48ff742448                     push       qword ptr [rsp + 0x48]
02124 488f442440                     pop        qword ptr [rsp + 0x40]
02129 48ff742450                     push       qword ptr [rsp + 0x50]
0212e 488f442448                     pop        qword ptr [rsp + 0x48]
02133 48ff742458                     push       qword ptr [rsp + 0x58]
02138 488f442450                     pop        qword ptr [rsp + 0x50]
0213d 48894424f8                     mov        qword ptr [rsp - 8], rax
02142 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02149 89442458                       mov        dword ptr [rsp + 0x58], eax
0214d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02152 48894424f8                     mov        qword ptr [rsp - 8], rax
02157 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0215e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02162 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02167 48894424f8                     mov        qword ptr [rsp - 8], rax
0216c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02173 89442460                       mov        dword ptr [rsp + 0x60], eax
02177 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02181 48894424f8                     mov        qword ptr [rsp - 8], rax
02186 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0218d 89442464                       mov        dword ptr [rsp + 0x64], eax
02191 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02196 48894424f8                     mov        qword ptr [rsp - 8], rax
0219b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021a2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ae 48894424f8                     mov        qword ptr [rsp - 8], rax
021b3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021ba 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
021d2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
021d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021de 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
021e6 488f842490000000               pop        qword ptr [rsp + 0x90]
021ee 48894424f8                     mov        qword ptr [rsp - 8], rax
021f3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
021fa 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02206 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0220e 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02216 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0221e 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02226 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0222e 48894424f8                     mov        qword ptr [rsp - 8], rax
02233 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0223a 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02241 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02246 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0224e 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02256 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
0225e 90                             nop        
0225f e87c19afff                     call       0x7efc7b6cda60
02264 0f1f84005c230012               nop        dword ptr [rax + rax + 0x1200235c]
0226c 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02276 4883e4f0                       and        rsp, 0xfffffffffffffff0
0227a e8e193cc17                     call       0x7efc938a54e0
0227f f4                             hlt        
02280 be45ffffff                     mov        esi, 0xffffff45
02285 48894424f8                     mov        qword ptr [rsp - 8], rax
0228a 8b442408                       mov        eax, dword ptr [rsp + 8]
0228e 890424                         mov        dword ptr [rsp], eax
02291 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02296 48894424f8                     mov        qword ptr [rsp - 8], rax
0229b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0229f 89442404                       mov        dword ptr [rsp + 4], eax
022a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a8 48ff742410                     push       qword ptr [rsp + 0x10]
022ad 488f442408                     pop        qword ptr [rsp + 8]
022b2 48ff742418                     push       qword ptr [rsp + 0x18]
022b7 488f442410                     pop        qword ptr [rsp + 0x10]
022bc 48894424f8                     mov        qword ptr [rsp - 8], rax
022c1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022c5 89442418                       mov        dword ptr [rsp + 0x18], eax
022c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ce 48894424f8                     mov        qword ptr [rsp - 8], rax
022d3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022d7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e0 48894424f8                     mov        qword ptr [rsp - 8], rax
022e5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022e9 89442420                       mov        dword ptr [rsp + 0x20], eax
022ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f2 48894424f8                     mov        qword ptr [rsp - 8], rax
022f7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022fb 89442424                       mov        dword ptr [rsp + 0x24], eax
022ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02304 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02309 48ff742438                     push       qword ptr [rsp + 0x38]
0230e 488f442430                     pop        qword ptr [rsp + 0x30]
02313 48894424f8                     mov        qword ptr [rsp - 8], rax
02318 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0231c 89442438                       mov        dword ptr [rsp + 0x38], eax
02320 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02325 48894424f8                     mov        qword ptr [rsp - 8], rax
0232a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0232e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02332 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02337 48ff742448                     push       qword ptr [rsp + 0x48]
0233c 488f442440                     pop        qword ptr [rsp + 0x40]
02341 48ff742450                     push       qword ptr [rsp + 0x50]
02346 488f442448                     pop        qword ptr [rsp + 0x48]
0234b 48ff742458                     push       qword ptr [rsp + 0x58]
02350 488f442450                     pop        qword ptr [rsp + 0x50]
02355 48894424f8                     mov        qword ptr [rsp - 8], rax
0235a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02361 89442458                       mov        dword ptr [rsp + 0x58], eax
02365 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236a 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02372 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0237a 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02382 90                             nop        
02383 e85818afff                     call       0x7efc7b6cda60
02388 0f1f840080240013               nop        dword ptr [rax + rax + 0x13002480]
02390 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
0239a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0239e e8bd92cc17                     call       0x7efc938a54e0
023a3 f4                             hlt        
023a4 be45ffffff                     mov        esi, 0xffffff45
023a9 48894424f8                     mov        qword ptr [rsp - 8], rax
023ae 8b442408                       mov        eax, dword ptr [rsp + 8]
023b2 890424                         mov        dword ptr [rsp], eax
023b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ba 48894424f8                     mov        qword ptr [rsp - 8], rax
023bf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023c3 89442404                       mov        dword ptr [rsp + 4], eax
023c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023cc 48ff742410                     push       qword ptr [rsp + 0x10]
023d1 488f442408                     pop        qword ptr [rsp + 8]
023d6 48ff742418                     push       qword ptr [rsp + 0x18]
023db 488f442410                     pop        qword ptr [rsp + 0x10]
023e0 48894424f8                     mov        qword ptr [rsp - 8], rax
023e5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023e9 89442418                       mov        dword ptr [rsp + 0x18], eax
023ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f2 48894424f8                     mov        qword ptr [rsp - 8], rax
023f7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023fb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02404 48894424f8                     mov        qword ptr [rsp - 8], rax
02409 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0240d 89442420                       mov        dword ptr [rsp + 0x20], eax
02411 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02416 48894424f8                     mov        qword ptr [rsp - 8], rax
0241b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0241f 89442424                       mov        dword ptr [rsp + 0x24], eax
02423 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02428 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0242d 48ff742438                     push       qword ptr [rsp + 0x38]
02432 488f442430                     pop        qword ptr [rsp + 0x30]
02437 48894424f8                     mov        qword ptr [rsp - 8], rax
0243c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02440 89442438                       mov        dword ptr [rsp + 0x38], eax
02444 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02449 48894424f8                     mov        qword ptr [rsp - 8], rax
0244e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02452 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02456 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245b 48ff742448                     push       qword ptr [rsp + 0x48]
02460 488f442440                     pop        qword ptr [rsp + 0x40]
02465 48ff742450                     push       qword ptr [rsp + 0x50]
0246a 488f442448                     pop        qword ptr [rsp + 0x48]
0246f 48ff742458                     push       qword ptr [rsp + 0x58]
02474 488f442450                     pop        qword ptr [rsp + 0x50]
02479 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02481 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02489 90                             nop        
0248a 90                             nop        
0248b e85017afff                     call       0x7efc7b6cda60
02490 0f1f840088250014               nop        dword ptr [rax + rax + 0x14002588]
02498 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
024a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024a6 e8b591cc17                     call       0x7efc938a54e0
024ab f4                             hlt        
024ac be45ffffff                     mov        esi, 0xffffff45
024b1 48894424f8                     mov        qword ptr [rsp - 8], rax
024b6 8b442408                       mov        eax, dword ptr [rsp + 8]
024ba 890424                         mov        dword ptr [rsp], eax
024bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c2 48894424f8                     mov        qword ptr [rsp - 8], rax
024c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024cb 89442404                       mov        dword ptr [rsp + 4], eax
024cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d4 48ff742410                     push       qword ptr [rsp + 0x10]
024d9 488f442408                     pop        qword ptr [rsp + 8]
024de 48ff742418                     push       qword ptr [rsp + 0x18]
024e3 488f442410                     pop        qword ptr [rsp + 0x10]
024e8 48894424f8                     mov        qword ptr [rsp - 8], rax
024ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
024f1 89442418                       mov        dword ptr [rsp + 0x18], eax
024f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024fa 48894424f8                     mov        qword ptr [rsp - 8], rax
024ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02503 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250c 48894424f8                     mov        qword ptr [rsp - 8], rax
02511 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02515 89442420                       mov        dword ptr [rsp + 0x20], eax
02519 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251e 48894424f8                     mov        qword ptr [rsp - 8], rax
02523 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02527 89442424                       mov        dword ptr [rsp + 0x24], eax
0252b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02530 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02535 48ff742438                     push       qword ptr [rsp + 0x38]
0253a 488f442430                     pop        qword ptr [rsp + 0x30]
0253f 48894424f8                     mov        qword ptr [rsp - 8], rax
02544 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02548 89442438                       mov        dword ptr [rsp + 0x38], eax
0254c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02551 48894424f8                     mov        qword ptr [rsp - 8], rax
02556 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0255a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0255e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02563 48ff742448                     push       qword ptr [rsp + 0x48]
02568 488f442440                     pop        qword ptr [rsp + 0x40]
0256d 48ff742450                     push       qword ptr [rsp + 0x50]
02572 488f442448                     pop        qword ptr [rsp + 0x48]
02577 48ff742458                     push       qword ptr [rsp + 0x58]
0257c 488f442450                     pop        qword ptr [rsp + 0x50]
02581 48894424f8                     mov        qword ptr [rsp - 8], rax
02586 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0258d 89442458                       mov        dword ptr [rsp + 0x58], eax
02591 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02596 48894424f8                     mov        qword ptr [rsp - 8], rax
0259b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025a2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ab 48894424f8                     mov        qword ptr [rsp - 8], rax
025b0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025b7 89442460                       mov        dword ptr [rsp + 0x60], eax
025bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c0 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025c8 488f442468                     pop        qword ptr [rsp + 0x68]
025cd 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025d5 488f442470                     pop        qword ptr [rsp + 0x70]
025da 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
025e2 488f442478                     pop        qword ptr [rsp + 0x78]
025e7 48894424f8                     mov        qword ptr [rsp - 8], rax
025ec 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
025f3 89442464                       mov        dword ptr [rsp + 0x64], eax
025f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02601 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02608 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0260f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02614 48894424f8                     mov        qword ptr [rsp - 8], rax
02619 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02620 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02627 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0262c 48894424f8                     mov        qword ptr [rsp - 8], rax
02631 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02638 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0263f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02644 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0264c 488f842490000000               pop        qword ptr [rsp + 0x90]
02654 48894424f8                     mov        qword ptr [rsp - 8], rax
02659 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02660 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02667 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02674 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0267c 90                             nop        
0267d 90                             nop        
0267e 90                             nop        
0267f e85c15afff                     call       0x7efc7b6cda60
02684 0f1f84007c270015               nop        dword ptr [rax + rax + 0x1500277c]
0268c 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02696 4883e4f0                       and        rsp, 0xfffffffffffffff0
0269a e8c18fcc17                     call       0x7efc938a54e0
0269f f4                             hlt        
026a0 be45ffffff                     mov        esi, 0xffffff45
026a5 48894424f8                     mov        qword ptr [rsp - 8], rax
026aa 8b442408                       mov        eax, dword ptr [rsp + 8]
026ae 890424                         mov        dword ptr [rsp], eax
026b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b6 48894424f8                     mov        qword ptr [rsp - 8], rax
026bb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026bf 89442404                       mov        dword ptr [rsp + 4], eax
026c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c8 48ff742410                     push       qword ptr [rsp + 0x10]
026cd 488f442408                     pop        qword ptr [rsp + 8]
026d2 48ff742418                     push       qword ptr [rsp + 0x18]
026d7 488f442410                     pop        qword ptr [rsp + 0x10]
026dc 48894424f8                     mov        qword ptr [rsp - 8], rax
026e1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026e5 89442418                       mov        dword ptr [rsp + 0x18], eax
026e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ee 48894424f8                     mov        qword ptr [rsp - 8], rax
026f3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026f7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
026fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02700 48894424f8                     mov        qword ptr [rsp - 8], rax
02705 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02709 89442420                       mov        dword ptr [rsp + 0x20], eax
0270d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02712 48894424f8                     mov        qword ptr [rsp - 8], rax
02717 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0271b 89442424                       mov        dword ptr [rsp + 0x24], eax
0271f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02724 48ff742438                     push       qword ptr [rsp + 0x38]
02729 488f442430                     pop        qword ptr [rsp + 0x30]
0272e 48894424f8                     mov        qword ptr [rsp - 8], rax
02733 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02737 89442438                       mov        dword ptr [rsp + 0x38], eax
0273b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02740 48894424f8                     mov        qword ptr [rsp - 8], rax
02745 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02749 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0274d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02752 48ff742448                     push       qword ptr [rsp + 0x48]
02757 488f442440                     pop        qword ptr [rsp + 0x40]
0275c 48ff742450                     push       qword ptr [rsp + 0x50]
02761 488f442448                     pop        qword ptr [rsp + 0x48]
02766 48ff742458                     push       qword ptr [rsp + 0x58]
0276b 488f442450                     pop        qword ptr [rsp + 0x50]
02770 48894424f8                     mov        qword ptr [rsp - 8], rax
02775 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0277c 89442458                       mov        dword ptr [rsp + 0x58], eax
02780 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02785 48894424f8                     mov        qword ptr [rsp - 8], rax
0278a 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02791 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02795 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279a 48894424f8                     mov        qword ptr [rsp - 8], rax
0279f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
027a6 89442460                       mov        dword ptr [rsp + 0x60], eax
027aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027af 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027b7 488f442468                     pop        qword ptr [rsp + 0x68]
027bc 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027c4 488f442470                     pop        qword ptr [rsp + 0x70]
027c9 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
027d1 488f442478                     pop        qword ptr [rsp + 0x78]
027d6 48894424f8                     mov        qword ptr [rsp - 8], rax
027db 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
027e2 89442464                       mov        dword ptr [rsp + 0x64], eax
027e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027eb 48894424f8                     mov        qword ptr [rsp - 8], rax
027f0 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
027f7 89842480000000                 mov        dword ptr [rsp + 0x80], eax
027fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02803 48894424f8                     mov        qword ptr [rsp - 8], rax
02808 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0280f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02816 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281b 48894424f8                     mov        qword ptr [rsp - 8], rax
02820 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02827 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0282e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02833 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0283b 488f842490000000               pop        qword ptr [rsp + 0x90]
02843 48894424f8                     mov        qword ptr [rsp - 8], rax
02848 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0284f 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02856 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
02863 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
0286b 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
02873 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0287b e86013afff                     call       0x7efc7b6cda60
02880 0f1f840078290016               nop        dword ptr [rax + rax + 0x16002978]
02888 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02892 4883e4f0                       and        rsp, 0xfffffffffffffff0
02896 e8c58dcc17                     call       0x7efc938a54e0
0289b f4                             hlt        
0289c 4533d2                         xor        r10d, r10d
0289f 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
028a7 e922d9ffff                     jmp        0x7efc7bbda04e
028ac 4533d2                         xor        r10d, r10d
028af 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028b4 e941d9ffff                     jmp        0x7efc7bbda07a
028b9 4533d2                         xor        r10d, r10d
028bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028c1 e95bd9ffff                     jmp        0x7efc7bbda0a1
028c6 4533d2                         xor        r10d, r10d
028c9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
028ce e97ad9ffff                     jmp        0x7efc7bbda0cd
028d3 4533d2                         xor        r10d, r10d
028d6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028db e997d9ffff                     jmp        0x7efc7bbda0f7
028e0 4533d2                         xor        r10d, r10d
028e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028e8 e9bcd9ffff                     jmp        0x7efc7bbda129
028ed 4533d2                         xor        r10d, r10d
028f0 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
028f8 e9d9d9ffff                     jmp        0x7efc7bbda156
028fd 4533d2                         xor        r10d, r10d
02900 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02908 e9efd9ffff                     jmp        0x7efc7bbda17c
0290d bebeffffff                     mov        esi, 0xffffffbe
02912 48894424f8                     mov        qword ptr [rsp - 8], rax
02917 8b442408                       mov        eax, dword ptr [rsp + 8]
0291b 890424                         mov        dword ptr [rsp], eax
0291e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02923 48894424f8                     mov        qword ptr [rsp - 8], rax
02928 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0292c 89442404                       mov        dword ptr [rsp + 4], eax
02930 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02935 48ff742410                     push       qword ptr [rsp + 0x10]
0293a 488f442408                     pop        qword ptr [rsp + 8]
0293f 48ff742418                     push       qword ptr [rsp + 0x18]
02944 488f442410                     pop        qword ptr [rsp + 0x10]
02949 48894424f8                     mov        qword ptr [rsp - 8], rax
0294e 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02952 89442418                       mov        dword ptr [rsp + 0x18], eax
02956 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295b 48894424f8                     mov        qword ptr [rsp - 8], rax
02960 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02964 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02968 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296d 48894424f8                     mov        qword ptr [rsp - 8], rax
02972 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02976 89442420                       mov        dword ptr [rsp + 0x20], eax
0297a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297f 48894424f8                     mov        qword ptr [rsp - 8], rax
02984 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02988 89442424                       mov        dword ptr [rsp + 0x24], eax
0298c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02991 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02996 48ff742438                     push       qword ptr [rsp + 0x38]
0299b 488f442430                     pop        qword ptr [rsp + 0x30]
029a0 48894424f8                     mov        qword ptr [rsp - 8], rax
029a5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029a9 89442438                       mov        dword ptr [rsp + 0x38], eax
029ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b2 48894424f8                     mov        qword ptr [rsp - 8], rax
029b7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
029bb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c4 48ff742448                     push       qword ptr [rsp + 0x48]
029c9 488f442440                     pop        qword ptr [rsp + 0x40]
029ce 48ff742450                     push       qword ptr [rsp + 0x50]
029d3 488f442448                     pop        qword ptr [rsp + 0x48]
029d8 48ff742458                     push       qword ptr [rsp + 0x58]
029dd 488f442450                     pop        qword ptr [rsp + 0x50]
029e2 90                             nop        
029e3 e8f811afff                     call       0x7efc7b6cda60
029e8 0f1f8400e02a0017               nop        dword ptr [rax + rax + 0x17002ae0]
029f0 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
029fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
029fe e85d8ccc17                     call       0x7efc938a54e0
02a03 f4                             hlt        
02a04 be85ffffff                     mov        esi, 0xffffff85
02a09 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a0d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a12 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a16 890424                         mov        dword ptr [rsp], eax
02a19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a1e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a23 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a27 89442404                       mov        dword ptr [rsp + 4], eax
02a2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a30 48894424f8                     mov        qword ptr [rsp - 8], rax
02a35 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a39 89442408                       mov        dword ptr [rsp + 8], eax
02a3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a42 48894424f8                     mov        qword ptr [rsp - 8], rax
02a47 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a4b 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a54 48894424f8                     mov        qword ptr [rsp - 8], rax
02a59 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a5d 89442410                       mov        dword ptr [rsp + 0x10], eax
02a61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a66 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a6b 48ff742438                     push       qword ptr [rsp + 0x38]
02a70 488f442420                     pop        qword ptr [rsp + 0x20]
02a75 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a7e 89442414                       mov        dword ptr [rsp + 0x14], eax
02a82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a87 48894424f8                     mov        qword ptr [rsp - 8], rax
02a8c 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02a90 89442428                       mov        dword ptr [rsp + 0x28], eax
02a94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a99 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02a9e 90                             nop        
02a9f e83c11afff                     call       0x7efc7b6cda60
02aa4 0f1f84009c2b0018               nop        dword ptr [rax + rax + 0x18002b9c]
02aac 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02ab6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aba e8a18bcc17                     call       0x7efc938a54e0
02abf f4                             hlt        
02ac0 bef6ffffff                     mov        esi, 0xfffffff6
02ac5 90                             nop        
02ac6 90                             nop        
02ac7 e81411afff                     call       0x7efc7b6cda60
02acc 0f1f8400c42b0019               nop        dword ptr [rax + rax + 0x19002bc4]
02ad4 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e8798bcc17                     call       0x7efc938a54e0
02ae7 f4                             hlt        
02ae8 be5d000000                     mov        esi, 0x5d
02aed 90                             nop        
02aee 90                             nop        
02aef e8ec10afff                     call       0x7efc7b6cda60
02af4 0f1f8400ec2b001a               nop        dword ptr [rax + rax + 0x1a002bec]
02afc 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b0a e8518bcc17                     call       0x7efc938a54e0
02b0f f4                             hlt        
02b10 bef6ffffff                     mov        esi, 0xfffffff6
02b15 418beb                         mov        ebp, r11d
02b18 90                             nop        
02b19 90                             nop        
02b1a 90                             nop        
02b1b e8c010afff                     call       0x7efc7b6cda60
02b20 0f1f8400182c001b               nop        dword ptr [rax + rax + 0x1b002c18]
02b28 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02b32 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b36 e8258bcc17                     call       0x7efc938a54e0
02b3b f4                             hlt        
02b3c bef6ffffff                     mov        esi, 0xfffffff6
02b41 8be9                           mov        ebp, ecx
02b43 e89810afff                     call       0x7efc7b6cda60
02b48 0f1f8400402c001c               nop        dword ptr [rax + rax + 0x1c002c40]
02b50 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5e e8fd8acc17                     call       0x7efc938a54e0
02b63 f4                             hlt        
02b64 bef6ffffff                     mov        esi, 0xfffffff6
02b69 418beb                         mov        ebp, r11d
02b6c 90                             nop        
02b6d 90                             nop        
02b6e 90                             nop        
02b6f e86c10afff                     call       0x7efc7b6cda60
02b74 0f1f84006c2c001d               nop        dword ptr [rax + rax + 0x1d002c6c]
02b7c 48bfb0c54754fc7e0000           movabs     rdi, 0x7efc5447c5b0
02b86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8a e8d18acc17                     call       0x7efc938a54e0
02b8f f4                             hlt        
02b90 eb00                           jmp        0x7efc7bbdca12
02b92 488bf0                         mov        rsi, rax
02b95 e9eadeffff                     jmp        0x7efc7bbda904
02b9a 49ba2ca9bd7bfc7e0000           movabs     r10, 0x7efc7bbda92c
02ba4 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02bab e93059b5ff                     jmp        0x7efc7b732360
02bb0 e8ab27b4ff                     call       0x7efc7b71f1e0
02bb5 e974d4ffff                     jmp        0x7efc7bbd9eae
02bba f4                             hlt        
02bbb f4                             hlt        
02bbc f4                             hlt        
02bbd f4                             hlt        
02bbe f4                             hlt        
02bbf f4                             hlt        
