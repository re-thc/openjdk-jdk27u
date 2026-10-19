00000 e83b487f18                     call       0x7f17b86586c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8596270000                   jne        0x7f179fe66644
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
0018f 49ba00ee73b8177f0000           movabs     r10, 0x7f17b873ee00
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f848a230000                   je         0x7f179fe663bc
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbdd050000                 cmp        r11d, 0x5dd
001c0 0f85ca240000                   jne        0x7f179fe66510
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8470230000                   je         0x7f179fe663cc
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f85a0240000                   jne        0x7f179fe66510
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8451230000                   je         0x7f179fe663d9
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f8574240000                   jne        0x7f179fe66510
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f8437230000                   je         0x7f179fe663e6
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f854d240000                   jne        0x7f179fe66510
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8415230000                   je         0x7f179fe663f3
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f851e240000                   jne        0x7f179fe66510
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f84f8220000                   je         0x7f179fe66400
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f85f4230000                   jne        0x7f179fe66510
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84d3220000                   je         0x7f179fe6640d
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbe0050000                 cmp        r11d, 0x5e0
002c8 0f85c2230000                   jne        0x7f179fe66510
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f84be220000                   je         0x7f179fe6641d
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fadf050000                 cmp        r10d, 0x5df
002ee 0f859c230000                   jne        0x7f179fe66510
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f84a3220000                   je         0x7f179fe6642d
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8495220000                   je         0x7f179fe6642d
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f8487220000                   je         0x7f179fe6642d
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00341 458d5af9                       lea        r11d, [r10 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8c5f220000                   jl         0x7f179fe6642d
0034e 4183c2f9                       add        r10d, -7
00352 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0035a e96b020000                     jmp        0x7f179fe6444a
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
0039a 0f8dc40f0000                   jge        0x7f179fe651e4
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d61110000                   jge        0x7f179fe653b4
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d30130000                   jge        0x7f179fe655ac
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8d03150000                   jge        0x7f179fe657a8
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
00478 0f8e960b0000                   jle        0x7f179fe64e94
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f7d160000                   jg         0x7f179fe65988
0048b 4181f8ffff0100                 cmp        r8d, 0x1ffff
00492 0f8f9c170000                   jg         0x7f179fe65ab4
00498 4181fbffff0300                 cmp        r11d, 0x3ffff
0049f 0f8f23190000                   jg         0x7f179fe65c48
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83a71a0000                   jae        0x7f179fe65ddc
004b5 48c1e112                       shl        rcx, 0x12
004b9 4d63d9                         movsxd     r11, r9d
004bc 4d63c0                         movsxd     r8, r8d
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f836d090000                   jae        0x7f179fe64cc8
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8dbe000000                   jge        0x7f179fe6443c
004fe 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00512 49c1e930                       shr        r9, 0x30
00516 458bc3                         mov        r8d, r11d
00519 418bd1                         mov        edx, r9d
0051c 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00524 c44223f7da                     shrx       r11d, r10d, r11d
00529 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
00530 038c24bc000000                 add        ecx, dword ptr [rsp + 0xbc]
00537 c44273f7ca                     shrx       r9d, r10d, ecx
0053c 4103d1                         add        edx, r9d
0053f 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
00546 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054d 83f920                         cmp        ecx, 0x20
00550 0f8d0a1c0000                   jge        0x7f179fe65fe0
00556 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0055e 49c1e930                       shr        r9, 0x30
00562 418bc9                         mov        ecx, r9d
00565 41b901000000                   mov        r9d, 1
0056b 8bbc24bc000000                 mov        edi, dword ptr [rsp + 0xbc]
00572 c4c241f7f9                     shlx       edi, r9d, edi
00577 ffcf                           dec        edi
00579 4123fb                         and        edi, r11d
0057c 4103f8                         add        edi, r8d
0057f 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00586 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0058e 4183f820                       cmp        r8d, 0x20
00592 0f8dc81c0000                   jge        0x7f179fe660e0
00598 41b801000000                   mov        r8d, 1
0059e 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
005a6 c44221f7c0                     shlx       r8d, r8d, r11d
005ab 41ffc8                         dec        r8d
005ae 4523c2                         and        r8d, r10d
005b1 4403c1                         add        r8d, ecx
005b4 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
005bc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005c0 418502                         test       dword ptr [r10], eax
005c3 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005ca 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005d2 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005d7 0f8d71040000                   jge        0x7f179fe648ce
005dd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005e2 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e6 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005ee 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f6 458b4204                       mov        r8d, dword ptr [r10 + 4]
005fa 453bd8                         cmp        r11d, r8d
005fd 0f83ed040000                   jae        0x7f179fe64970
00603 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00608 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
0060c 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00613 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
0061a 458b4104                       mov        r8d, dword ptr [r9 + 4]
0061e 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00623 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0062b 413bc8                         cmp        ecx, r8d
0062e 0f83b0050000                   jae        0x7f179fe64a64
00634 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00639 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00645 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0064d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00651 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00656 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0065e 453bd8                         cmp        r11d, r8d
00661 0f8399060000                   jae        0x7f179fe64b80
00667 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0066c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00674 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0067b ffc5                           inc        ebp
0067d 896c2404                       mov        dword ptr [rsp + 4], ebp
00681 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00685 0f8d36040000                   jge        0x7f179fe64941
0068b 49c1ea28                       shr        r10, 0x28
0068f 458bd2                         mov        r10d, r10d
00692 450fb6d2                       movzx      r10d, r10b
00696 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0069e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a6 49c1ea28                       shr        r10, 0x28
006aa 458bda                         mov        r11d, r10d
006ad 450fb6cb                       movzx      r9d, r11b
006b1 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
006b9 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006c1 49c1ea28                       shr        r10, 0x28
006c5 458bd2                         mov        r10d, r10d
006c8 450fb6da                       movzx      r11d, r10b
006cc 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
006d4 4503cb                         add        r9d, r11d
006d7 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006df 41ba01000000                   mov        r10d, 1
006e5 4489942404010000               mov        dword ptr [rsp + 0x104], r10d
006ed 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006f5 49c1ea20                       shr        r10, 0x20
006f9 458bda                         mov        r11d, r10d
006fc 410fb6eb                       movzx      ebp, r11b
00700 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00707 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0070f 49c1ea20                       shr        r10, 0x20
00713 458bd2                         mov        r10d, r10d
00716 410fb6ea                       movzx      ebp, r10b
0071a 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00721 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00729 49c1ea20                       shr        r10, 0x20
0072d 458bda                         mov        r11d, r10d
00730 410fb6eb                       movzx      ebp, r11b
00734 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
0073b 448bd5                         mov        r10d, ebp
0073e 44039424f8000000               add        r10d, dword ptr [rsp + 0xf8]
00746 44039424fc000000               add        r10d, dword ptr [rsp + 0xfc]
0074e 44039424f4000000               add        r10d, dword ptr [rsp + 0xf4]
00756 4585d2                         test       r10d, r10d
00759 0f84dd090000                   je         0x7f179fe64fbc
0075f 4183fa3f                       cmp        r10d, 0x3f
00763 0f8f9b0b0000                   jg         0x7f179fe65184
00769 41b840000000                   mov        r8d, 0x40
0076f 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
00774 453bd0                         cmp        r10d, r8d
00777 7e43                           jle        0x7f179fe6463c
00779 458bda                         mov        r11d, r10d
0077c 452bd8                         sub        r11d, r8d
0077f 4183f840                       cmp        r8d, 0x40
00783 0f8dcb1b0000                   jge        0x7f179fe661d4
00789 41b901000000                   mov        r9d, 1
0078f c442b9f7c1                     shlx       r8, r9, r8
00794 49ffc8                         dec        r8
00797 4c23c3                         and        r8, rbx
0079a c442a1f7c0                     shlx       r8, r8, r11
0079f 41b940000000                   mov        r9d, 0x40
007a5 452bcb                         sub        r9d, r11d
007a8 c462b3f75c2438                 shrx       r11, qword ptr [rsp + 0x38], r9
007af 4d0bc3                         or         r8, r11
007b2 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007ba eb21                           jmp        0x7f179fe6465d
007bc 41bb01000000                   mov        r11d, 1
007c2 c442a9f7db                     shlx       r11, r11, r10
007c7 452bc2                         sub        r8d, r10d
007ca c462bbf7c3                     shrx       r8, rbx, r8
007cf 49ffcb                         dec        r11
007d2 4d23c3                         and        r8, r11
007d5 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007dd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
007e2 4503da                         add        r11d, r10d
007e5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007ea 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
007ef 4503c2                         add        r8d, r10d
007f2 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007f7 4183fb40                       cmp        r11d, 0x40
007fb 0f8c8ffbffff                   jl         0x7f179fe64210
00801 458d53c0                       lea        r10d, [r11 - 0x40]
00805 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0080a 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080e 83c5f8                         add        ebp, -8
00811 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00815 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00819 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081d 83c1f0                         add        ecx, -0x10
00820 83f908                         cmp        ecx, 8
00823 0f8cd7010000                   jl         0x7f179fe64880
00829 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082e 4183c2e8                       add        r10d, -0x18
00832 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0083a 0f821ffbffff                   jb         0x7f179fe641df
00840 bee4ffffff                     mov        esi, 0xffffffe4
00845 48894424f8                     mov        qword ptr [rsp - 8], rax
0084a 8b442408                       mov        eax, dword ptr [rsp + 8]
0084e 890424                         mov        dword ptr [rsp], eax
00851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00856 48894424f8                     mov        qword ptr [rsp - 8], rax
0085b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085f 89442404                       mov        dword ptr [rsp + 4], eax
00863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00868 48ff742410                     push       qword ptr [rsp + 0x10]
0086d 488f442408                     pop        qword ptr [rsp + 8]
00872 48ff742418                     push       qword ptr [rsp + 0x18]
00877 488f442410                     pop        qword ptr [rsp + 0x10]
0087c 48894424f8                     mov        qword ptr [rsp - 8], rax
00881 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00885 89442418                       mov        dword ptr [rsp + 0x18], eax
00889 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088e 48894424f8                     mov        qword ptr [rsp - 8], rax
00893 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00897 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0089b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a0 48894424f8                     mov        qword ptr [rsp - 8], rax
008a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a9 89442420                       mov        dword ptr [rsp + 0x20], eax
008ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b2 48894424f8                     mov        qword ptr [rsp - 8], rax
008b7 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008bb 89442424                       mov        dword ptr [rsp + 0x24], eax
008bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c4 48ff742438                     push       qword ptr [rsp + 0x38]
008c9 488f442428                     pop        qword ptr [rsp + 0x28]
008ce 48894424f8                     mov        qword ptr [rsp - 8], rax
008d3 8b442440                       mov        eax, dword ptr [rsp + 0x40]
008d7 89442430                       mov        dword ptr [rsp + 0x30], eax
008db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e0 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008e5 48ff742448                     push       qword ptr [rsp + 0x48]
008ea 488f442438                     pop        qword ptr [rsp + 0x38]
008ef 48ff742450                     push       qword ptr [rsp + 0x50]
008f4 488f442440                     pop        qword ptr [rsp + 0x40]
008f9 48ff742458                     push       qword ptr [rsp + 0x58]
008fe 488f442448                     pop        qword ptr [rsp + 0x48]
00903 48894424f8                     mov        qword ptr [rsp - 8], rax
00908 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090f 89442450                       mov        dword ptr [rsp + 0x50], eax
00913 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00918 48894424f8                     mov        qword ptr [rsp - 8], rax
0091d 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00924 89442454                       mov        dword ptr [rsp + 0x54], eax
00928 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092d 48894424f8                     mov        qword ptr [rsp - 8], rax
00932 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00939 89442458                       mov        dword ptr [rsp + 0x58], eax
0093d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00942 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0094a 488f442460                     pop        qword ptr [rsp + 0x60]
0094f 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00957 488f442468                     pop        qword ptr [rsp + 0x68]
0095c 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00964 488f442470                     pop        qword ptr [rsp + 0x70]
00969 48894424f8                     mov        qword ptr [rsp - 8], rax
0096e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00975 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097e 48894424f8                     mov        qword ptr [rsp - 8], rax
00983 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0098a 89442478                       mov        dword ptr [rsp + 0x78], eax
0098e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00993 48894424f8                     mov        qword ptr [rsp - 8], rax
00998 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099f 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a8 48894424f8                     mov        qword ptr [rsp - 8], rax
009ad 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009b4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009c0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c8 488f842488000000               pop        qword ptr [rsp + 0x88]
009d0 48894424f8                     mov        qword ptr [rsp - 8], rax
009d5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009dc 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e8 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009f0 666690                         nop        
009f3 e8e8edb5ff                     call       0x7f179f9c3660
009f8 0f1f8400f00a0001               nop        dword ptr [rax + rax + 0x1000af0]
00a00 85c9                           test       ecx, ecx
00a02 7f08                           jg         0x7f179fe6488c
00a04 4533d2                         xor        r10d, r10d
00a07 e960f9ffff                     jmp        0x7f179fe641ec
00a0c 8be9                           mov        ebp, ecx
00a0e 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a16 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a1a 90                             nop        
00a1b e8c06fa9ff                     call       0x7f179f8fb860
00a20 0f1f8400180b0002               nop        dword ptr [rax + rax + 0x2000b18]
00a28 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a2d 41c1e303                       shl        r11d, 3
00a31 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a36 41c1e203                       shl        r10d, 3
00a3a 452bd3                         sub        r10d, r11d
00a3d 4181c2c0000000                 add        r10d, 0xc0
00a44 c462a9f7d0                     shlx       r10, rax, r10
00a49 e91ef9ffff                     jmp        0x7f179fe641ec
00a4e 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a56 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a5e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a63 4d3bd3                         cmp        r10, r11
00a66 7f26                           jg         0x7f179fe6490e
00a68 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a6d 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a72 0f85d41c0000                   jne        0x7f179fe665cc
00a78 418bc2                         mov        eax, r10d
00a7b 4881c430010000                 add        rsp, 0x130
00a82 5d                             pop        rbp
00a83 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a87 0f87211d0000                   ja         0x7f179fe6662e
00a8d c3                             ret        
00a8e 48be085529e300000000           movabs     rsi, 0xe3295508
00a98 666690                         nop        
00a9b e8406fa9ff                     call       0x7f179f8fb860
00aa0 0f1f8400980b0003               nop        dword ptr [rax + rax + 0x3000b98]
00aa8 4885c0                         test       rax, rax
00aab 0f84871c0000                   je         0x7f179fe665b8
00ab1 488bf0                         mov        rsi, rax
00ab4 4881c430010000                 add        rsp, 0x130
00abb 5d                             pop        rbp
00abc e91f6cb6ff                     jmp        0x7f179f9cb560
00ac1 4533d2                         xor        r10d, r10d
00ac4 33ed                           xor        ebp, ebp
00ac6 4533c0                         xor        r8d, r8d
00ac9 4533db                         xor        r11d, r11d
00acc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ad4 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00adb 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00ae3 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00aeb e9fdfbffff                     jmp        0x7f179fe6456d
00af0 bee4ffffff                     mov        esi, 0xffffffe4
00af5 48894424f8                     mov        qword ptr [rsp - 8], rax
00afa 8b442408                       mov        eax, dword ptr [rsp + 8]
00afe 890424                         mov        dword ptr [rsp], eax
00b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b06 48894424f8                     mov        qword ptr [rsp - 8], rax
00b0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b0f 89442404                       mov        dword ptr [rsp + 4], eax
00b13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b18 48ff742410                     push       qword ptr [rsp + 0x10]
00b1d 488f442408                     pop        qword ptr [rsp + 8]
00b22 48ff742418                     push       qword ptr [rsp + 0x18]
00b27 488f442410                     pop        qword ptr [rsp + 0x10]
00b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b35 89442418                       mov        dword ptr [rsp + 0x18], eax
00b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b50 48894424f8                     mov        qword ptr [rsp - 8], rax
00b55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b59 89442420                       mov        dword ptr [rsp + 0x20], eax
00b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b62 48894424f8                     mov        qword ptr [rsp - 8], rax
00b67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b6b 89442424                       mov        dword ptr [rsp + 0x24], eax
00b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b79 48ff742438                     push       qword ptr [rsp + 0x38]
00b7e 488f442430                     pop        qword ptr [rsp + 0x30]
00b83 48894424f8                     mov        qword ptr [rsp - 8], rax
00b88 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b8c 89442438                       mov        dword ptr [rsp + 0x38], eax
00b90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b95 48894424f8                     mov        qword ptr [rsp - 8], rax
00b9a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ba2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba7 48ff742448                     push       qword ptr [rsp + 0x48]
00bac 488f442440                     pop        qword ptr [rsp + 0x40]
00bb1 48ff742450                     push       qword ptr [rsp + 0x50]
00bb6 488f442448                     pop        qword ptr [rsp + 0x48]
00bbb 48ff742458                     push       qword ptr [rsp + 0x58]
00bc0 488f442450                     pop        qword ptr [rsp + 0x50]
00bc5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bcd 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00bd5 6690                           nop        
00bd7 e804ecb5ff                     call       0x7f179f9c3660
00bdc 0f1f8400d40c0004               nop        dword ptr [rax + rax + 0x4000cd4]
00be4 bee4ffffff                     mov        esi, 0xffffffe4
00be9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bee 8b442408                       mov        eax, dword ptr [rsp + 8]
00bf2 890424                         mov        dword ptr [rsp], eax
00bf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
00bff 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c03 89442404                       mov        dword ptr [rsp + 4], eax
00c07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c0c 48ff742410                     push       qword ptr [rsp + 0x10]
00c11 488f442408                     pop        qword ptr [rsp + 8]
00c16 48ff742418                     push       qword ptr [rsp + 0x18]
00c1b 488f442410                     pop        qword ptr [rsp + 0x10]
00c20 48894424f8                     mov        qword ptr [rsp - 8], rax
00c25 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c29 89442418                       mov        dword ptr [rsp + 0x18], eax
00c2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c32 48894424f8                     mov        qword ptr [rsp - 8], rax
00c37 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c3b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c44 48894424f8                     mov        qword ptr [rsp - 8], rax
00c49 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c4d 89442420                       mov        dword ptr [rsp + 0x20], eax
00c51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c56 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c5f 89442424                       mov        dword ptr [rsp + 0x24], eax
00c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c68 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c6d 48ff742438                     push       qword ptr [rsp + 0x38]
00c72 488f442430                     pop        qword ptr [rsp + 0x30]
00c77 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c80 89442438                       mov        dword ptr [rsp + 0x38], eax
00c84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c89 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c92 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c9b 48ff742448                     push       qword ptr [rsp + 0x48]
00ca0 488f442440                     pop        qword ptr [rsp + 0x40]
00ca5 48ff742450                     push       qword ptr [rsp + 0x50]
00caa 488f442448                     pop        qword ptr [rsp + 0x48]
00caf 48ff742458                     push       qword ptr [rsp + 0x58]
00cb4 488f442450                     pop        qword ptr [rsp + 0x50]
00cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cbe 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cc5 89442458                       mov        dword ptr [rsp + 0x58], eax
00cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cce 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cda 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce3 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00ceb 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00cf2 90                             nop        
00cf3 e8e8eab5ff                     call       0x7f179f9c3660
00cf8 0f1f8400f00d0005               nop        dword ptr [rax + rax + 0x5000df0]
00d00 bee4ffffff                     mov        esi, 0xffffffe4
00d05 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0a 8b442408                       mov        eax, dword ptr [rsp + 8]
00d0e 890424                         mov        dword ptr [rsp], eax
00d11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d16 48894424f8                     mov        qword ptr [rsp - 8], rax
00d1b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d1f 89442404                       mov        dword ptr [rsp + 4], eax
00d23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d28 48ff742410                     push       qword ptr [rsp + 0x10]
00d2d 488f442408                     pop        qword ptr [rsp + 8]
00d32 48ff742418                     push       qword ptr [rsp + 0x18]
00d37 488f442410                     pop        qword ptr [rsp + 0x10]
00d3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00d41 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d45 89442418                       mov        dword ptr [rsp + 0x18], eax
00d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d53 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d60 48894424f8                     mov        qword ptr [rsp - 8], rax
00d65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d69 89442420                       mov        dword ptr [rsp + 0x20], eax
00d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d72 48894424f8                     mov        qword ptr [rsp - 8], rax
00d77 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d7b 89442424                       mov        dword ptr [rsp + 0x24], eax
00d7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d84 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d89 48ff742438                     push       qword ptr [rsp + 0x38]
00d8e 488f442430                     pop        qword ptr [rsp + 0x30]
00d93 48894424f8                     mov        qword ptr [rsp - 8], rax
00d98 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d9c 89442438                       mov        dword ptr [rsp + 0x38], eax
00da0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da5 48894424f8                     mov        qword ptr [rsp - 8], rax
00daa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00db2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00db7 48ff742448                     push       qword ptr [rsp + 0x48]
00dbc 488f442440                     pop        qword ptr [rsp + 0x40]
00dc1 48ff742450                     push       qword ptr [rsp + 0x50]
00dc6 488f442448                     pop        qword ptr [rsp + 0x48]
00dcb 48ff742458                     push       qword ptr [rsp + 0x58]
00dd0 488f442450                     pop        qword ptr [rsp + 0x50]
00dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
00dda 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00de1 89442458                       mov        dword ptr [rsp + 0x58], eax
00de5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dea 48894424f8                     mov        qword ptr [rsp - 8], rax
00def 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00df6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dff 48894424f8                     mov        qword ptr [rsp - 8], rax
00e04 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e0b 89442460                       mov        dword ptr [rsp + 0x60], eax
00e0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e14 48894424f8                     mov        qword ptr [rsp - 8], rax
00e19 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e20 89442464                       mov        dword ptr [rsp + 0x64], eax
00e24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e29 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e31 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e39 6690                           nop        
00e3b e8a0e9b5ff                     call       0x7f179f9c3660
00e40 0f1f8400380f0006               nop        dword ptr [rax + rax + 0x6000f38]
00e48 bee4ffffff                     mov        esi, 0xffffffe4
00e4d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e52 8b442408                       mov        eax, dword ptr [rsp + 8]
00e56 890424                         mov        dword ptr [rsp], eax
00e59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e63 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e67 89442404                       mov        dword ptr [rsp + 4], eax
00e6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e70 48ff742410                     push       qword ptr [rsp + 0x10]
00e75 488f442408                     pop        qword ptr [rsp + 8]
00e7a 48ff742418                     push       qword ptr [rsp + 0x18]
00e7f 488f442410                     pop        qword ptr [rsp + 0x10]
00e84 48894424f8                     mov        qword ptr [rsp - 8], rax
00e89 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e8d 89442418                       mov        dword ptr [rsp + 0x18], eax
00e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e96 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e9f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ea3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ead 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00eb1 89442420                       mov        dword ptr [rsp + 0x20], eax
00eb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eba 48894424f8                     mov        qword ptr [rsp - 8], rax
00ebf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00ec3 89442424                       mov        dword ptr [rsp + 0x24], eax
00ec7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ecc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ed1 48ff742438                     push       qword ptr [rsp + 0x38]
00ed6 488f442430                     pop        qword ptr [rsp + 0x30]
00edb 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ee4 89442438                       mov        dword ptr [rsp + 0x38], eax
00ee8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eed 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00ef6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00efa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eff 48ff742448                     push       qword ptr [rsp + 0x48]
00f04 488f442440                     pop        qword ptr [rsp + 0x40]
00f09 48ff742450                     push       qword ptr [rsp + 0x50]
00f0e 488f442448                     pop        qword ptr [rsp + 0x48]
00f13 48ff742458                     push       qword ptr [rsp + 0x58]
00f18 488f442450                     pop        qword ptr [rsp + 0x50]
00f1d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f22 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f29 89442458                       mov        dword ptr [rsp + 0x58], eax
00f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f32 48894424f8                     mov        qword ptr [rsp - 8], rax
00f37 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f47 48894424f8                     mov        qword ptr [rsp - 8], rax
00f4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f53 89442460                       mov        dword ptr [rsp + 0x60], eax
00f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f5c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00f61 48894424f8                     mov        qword ptr [rsp - 8], rax
00f66 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f6d 89442464                       mov        dword ptr [rsp + 0x64], eax
00f71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f76 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f82 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f93 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f9a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fa1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fab 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fb2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fbe 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fc6 488f842490000000               pop        qword ptr [rsp + 0x90]
00fce 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fda 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe6 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fee 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00ff6 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00ffe 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01006 90                             nop        
01007 e8d4e7b5ff                     call       0x7f179f9c3660
0100c 0f1f840004110007               nop        dword ptr [rax + rax + 0x7001104]
01014 33c9                           xor        ecx, ecx
01016 4c3bc9                         cmp        r9, rcx
01019 bdffffffff                     mov        ebp, 0xffffffff
0101e 7c08                           jl         0x7f179fe64ea8
01020 400f95c5                       setne      bpl
01024 400fb6ed                       movzx      ebp, bpl
01028 be45ffffff                     mov        esi, 0xffffff45
0102d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01032 48894424f8                     mov        qword ptr [rsp - 8], rax
01037 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0103e 89442460                       mov        dword ptr [rsp + 0x60], eax
01042 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01047 48894424f8                     mov        qword ptr [rsp - 8], rax
0104c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01053 89442464                       mov        dword ptr [rsp + 0x64], eax
01057 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0105c 48894424f8                     mov        qword ptr [rsp - 8], rax
01061 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01068 89442468                       mov        dword ptr [rsp + 0x68], eax
0106c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01071 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01079 48894424f8                     mov        qword ptr [rsp - 8], rax
0107e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01085 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01089 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0108e 48894424f8                     mov        qword ptr [rsp - 8], rax
01093 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0109a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a6 48894424f8                     mov        qword ptr [rsp - 8], rax
010ab 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010b2 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010be 48894424f8                     mov        qword ptr [rsp - 8], rax
010c3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010ca 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010de 488f842498000000               pop        qword ptr [rsp + 0x98]
010e6 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010ee 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010f6 48894424f8                     mov        qword ptr [rsp - 8], rax
010fb 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01102 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01109 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01116 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0111e 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
01126 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0112e 90                             nop        
0112f e8ace6b5ff                     call       0x7f179f9c3660
01134 0f1f84002c120008               nop        dword ptr [rax + rax + 0x800122c]
0113c be45ffffff                     mov        esi, 0xffffff45
01141 48894424f8                     mov        qword ptr [rsp - 8], rax
01146 8b442408                       mov        eax, dword ptr [rsp + 8]
0114a 890424                         mov        dword ptr [rsp], eax
0114d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01152 48894424f8                     mov        qword ptr [rsp - 8], rax
01157 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0115b 89442404                       mov        dword ptr [rsp + 4], eax
0115f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01164 48ff742410                     push       qword ptr [rsp + 0x10]
01169 488f442408                     pop        qword ptr [rsp + 8]
0116e 48ff742418                     push       qword ptr [rsp + 0x18]
01173 488f442410                     pop        qword ptr [rsp + 0x10]
01178 48894424f8                     mov        qword ptr [rsp - 8], rax
0117d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01181 89442418                       mov        dword ptr [rsp + 0x18], eax
01185 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118a 48894424f8                     mov        qword ptr [rsp - 8], rax
0118f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01193 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01197 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0119c 48894424f8                     mov        qword ptr [rsp - 8], rax
011a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011a5 89442420                       mov        dword ptr [rsp + 0x20], eax
011a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ae 48894424f8                     mov        qword ptr [rsp - 8], rax
011b3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011b7 89442424                       mov        dword ptr [rsp + 0x24], eax
011bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011c5 48ff742438                     push       qword ptr [rsp + 0x38]
011ca 488f442430                     pop        qword ptr [rsp + 0x30]
011cf 48894424f8                     mov        qword ptr [rsp - 8], rax
011d4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011d8 89442438                       mov        dword ptr [rsp + 0x38], eax
011dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e1 48894424f8                     mov        qword ptr [rsp - 8], rax
011e6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f3 48ff742448                     push       qword ptr [rsp + 0x48]
011f8 488f442440                     pop        qword ptr [rsp + 0x40]
011fd 48ff742450                     push       qword ptr [rsp + 0x50]
01202 488f442448                     pop        qword ptr [rsp + 0x48]
01207 48ff742458                     push       qword ptr [rsp + 0x58]
0120c 488f442450                     pop        qword ptr [rsp + 0x50]
01211 48894424f8                     mov        qword ptr [rsp - 8], rax
01216 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0121d 89442458                       mov        dword ptr [rsp + 0x58], eax
01221 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01226 48894424f8                     mov        qword ptr [rsp - 8], rax
0122b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01232 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01236 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123b 48894424f8                     mov        qword ptr [rsp - 8], rax
01240 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01247 89442460                       mov        dword ptr [rsp + 0x60], eax
0124b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01250 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01258 488f442468                     pop        qword ptr [rsp + 0x68]
0125d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01265 488f442478                     pop        qword ptr [rsp + 0x78]
0126a 48894424f8                     mov        qword ptr [rsp - 8], rax
0126f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01276 89442464                       mov        dword ptr [rsp + 0x64], eax
0127a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0127f 48894424f8                     mov        qword ptr [rsp - 8], rax
01284 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0128b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01292 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01297 48894424f8                     mov        qword ptr [rsp - 8], rax
0129c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012a3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012af 48894424f8                     mov        qword ptr [rsp - 8], rax
012b4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012bb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012cf 488f842490000000               pop        qword ptr [rsp + 0x90]
012d7 48894424f8                     mov        qword ptr [rsp - 8], rax
012dc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012e3 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ef 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
012f7 e8e4e4b5ff                     call       0x7f179f9c3660
012fc 0f1f8400f4130009               nop        dword ptr [rax + rax + 0x90013f4]
01304 be45ffffff                     mov        esi, 0xffffff45
01309 48894424f8                     mov        qword ptr [rsp - 8], rax
0130e 8b442408                       mov        eax, dword ptr [rsp + 8]
01312 890424                         mov        dword ptr [rsp], eax
01315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131a 48894424f8                     mov        qword ptr [rsp - 8], rax
0131f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01323 89442404                       mov        dword ptr [rsp + 4], eax
01327 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132c 48ff742410                     push       qword ptr [rsp + 0x10]
01331 488f442408                     pop        qword ptr [rsp + 8]
01336 48ff742418                     push       qword ptr [rsp + 0x18]
0133b 488f442410                     pop        qword ptr [rsp + 0x10]
01340 48894424f8                     mov        qword ptr [rsp - 8], rax
01345 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01349 89442418                       mov        dword ptr [rsp + 0x18], eax
0134d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01352 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01357 e884e4b5ff                     call       0x7f179f9c3660
0135c 0f1f84005414000a               nop        dword ptr [rax + rax + 0xa001454]
01364 be45ffffff                     mov        esi, 0xffffff45
01369 48894424f8                     mov        qword ptr [rsp - 8], rax
0136e 8b442408                       mov        eax, dword ptr [rsp + 8]
01372 890424                         mov        dword ptr [rsp], eax
01375 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137a 48894424f8                     mov        qword ptr [rsp - 8], rax
0137f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01383 89442404                       mov        dword ptr [rsp + 4], eax
01387 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0138c 48ff742410                     push       qword ptr [rsp + 0x10]
01391 488f442408                     pop        qword ptr [rsp + 8]
01396 48ff742418                     push       qword ptr [rsp + 0x18]
0139b 488f442410                     pop        qword ptr [rsp + 0x10]
013a0 48894424f8                     mov        qword ptr [rsp - 8], rax
013a5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013a9 89442418                       mov        dword ptr [rsp + 0x18], eax
013ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b2 48894424f8                     mov        qword ptr [rsp - 8], rax
013b7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013bb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c4 48894424f8                     mov        qword ptr [rsp - 8], rax
013c9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013cd 89442420                       mov        dword ptr [rsp + 0x20], eax
013d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d6 48894424f8                     mov        qword ptr [rsp - 8], rax
013db 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013df 89442424                       mov        dword ptr [rsp + 0x24], eax
013e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013ed 48ff742438                     push       qword ptr [rsp + 0x38]
013f2 488f442430                     pop        qword ptr [rsp + 0x30]
013f7 48894424f8                     mov        qword ptr [rsp - 8], rax
013fc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01400 89442438                       mov        dword ptr [rsp + 0x38], eax
01404 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01409 48894424f8                     mov        qword ptr [rsp - 8], rax
0140e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01412 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01416 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141b 48ff742448                     push       qword ptr [rsp + 0x48]
01420 488f442440                     pop        qword ptr [rsp + 0x40]
01425 48ff742450                     push       qword ptr [rsp + 0x50]
0142a 488f442448                     pop        qword ptr [rsp + 0x48]
0142f 48ff742458                     push       qword ptr [rsp + 0x58]
01434 488f442450                     pop        qword ptr [rsp + 0x50]
01439 48894424f8                     mov        qword ptr [rsp - 8], rax
0143e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01445 89442458                       mov        dword ptr [rsp + 0x58], eax
01449 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144e 48894424f8                     mov        qword ptr [rsp - 8], rax
01453 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0145a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0145e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01463 48894424f8                     mov        qword ptr [rsp - 8], rax
01468 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0146f 89442460                       mov        dword ptr [rsp + 0x60], eax
01473 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01478 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01480 488f442468                     pop        qword ptr [rsp + 0x68]
01485 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0148d 488f442470                     pop        qword ptr [rsp + 0x70]
01492 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0149a 488f442478                     pop        qword ptr [rsp + 0x78]
0149f 48894424f8                     mov        qword ptr [rsp - 8], rax
014a4 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014ab 89442464                       mov        dword ptr [rsp + 0x64], eax
014af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b4 48894424f8                     mov        qword ptr [rsp - 8], rax
014b9 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014c0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014cc 48894424f8                     mov        qword ptr [rsp - 8], rax
014d1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014d8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e4 48894424f8                     mov        qword ptr [rsp - 8], rax
014e9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014f0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01504 488f842490000000               pop        qword ptr [rsp + 0x90]
0150c 48894424f8                     mov        qword ptr [rsp - 8], rax
01511 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01518 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0151f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01524 666690                         nop        
01527 e8b4e2b5ff                     call       0x7f179f9c3660
0152c 0f1f84002416000b               nop        dword ptr [rax + rax + 0xb001624]
01534 be45ffffff                     mov        esi, 0xffffff45
01539 48894424f8                     mov        qword ptr [rsp - 8], rax
0153e 8b442408                       mov        eax, dword ptr [rsp + 8]
01542 890424                         mov        dword ptr [rsp], eax
01545 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154a 48894424f8                     mov        qword ptr [rsp - 8], rax
0154f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01553 89442404                       mov        dword ptr [rsp + 4], eax
01557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155c 48ff742410                     push       qword ptr [rsp + 0x10]
01561 488f442408                     pop        qword ptr [rsp + 8]
01566 48ff742418                     push       qword ptr [rsp + 0x18]
0156b 488f442410                     pop        qword ptr [rsp + 0x10]
01570 48894424f8                     mov        qword ptr [rsp - 8], rax
01575 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01579 89442418                       mov        dword ptr [rsp + 0x18], eax
0157d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01582 48894424f8                     mov        qword ptr [rsp - 8], rax
01587 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0158b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0158f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01594 48894424f8                     mov        qword ptr [rsp - 8], rax
01599 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0159d 89442420                       mov        dword ptr [rsp + 0x20], eax
015a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a6 48894424f8                     mov        qword ptr [rsp - 8], rax
015ab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015af 89442424                       mov        dword ptr [rsp + 0x24], eax
015b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015bd 48ff742438                     push       qword ptr [rsp + 0x38]
015c2 488f442430                     pop        qword ptr [rsp + 0x30]
015c7 48894424f8                     mov        qword ptr [rsp - 8], rax
015cc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015d0 89442438                       mov        dword ptr [rsp + 0x38], eax
015d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d9 48894424f8                     mov        qword ptr [rsp - 8], rax
015de 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015e2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015eb 48ff742448                     push       qword ptr [rsp + 0x48]
015f0 488f442440                     pop        qword ptr [rsp + 0x40]
015f5 48ff742450                     push       qword ptr [rsp + 0x50]
015fa 488f442448                     pop        qword ptr [rsp + 0x48]
015ff 48ff742458                     push       qword ptr [rsp + 0x58]
01604 488f442450                     pop        qword ptr [rsp + 0x50]
01609 48894424f8                     mov        qword ptr [rsp - 8], rax
0160e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01615 89442458                       mov        dword ptr [rsp + 0x58], eax
01619 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161e 48894424f8                     mov        qword ptr [rsp - 8], rax
01623 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0162a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0162e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01633 48894424f8                     mov        qword ptr [rsp - 8], rax
01638 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0163f 89442460                       mov        dword ptr [rsp + 0x60], eax
01643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01648 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01650 488f442468                     pop        qword ptr [rsp + 0x68]
01655 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0165d 488f442470                     pop        qword ptr [rsp + 0x70]
01662 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0166a 488f442478                     pop        qword ptr [rsp + 0x78]
0166f 48894424f8                     mov        qword ptr [rsp - 8], rax
01674 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0167b 89442464                       mov        dword ptr [rsp + 0x64], eax
0167f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01684 48894424f8                     mov        qword ptr [rsp - 8], rax
01689 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01690 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01697 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169c 48894424f8                     mov        qword ptr [rsp - 8], rax
016a1 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016a8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b4 48894424f8                     mov        qword ptr [rsp - 8], rax
016b9 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016c0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016cc 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016d4 488f842490000000               pop        qword ptr [rsp + 0x90]
016dc 48894424f8                     mov        qword ptr [rsp - 8], rax
016e1 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016e8 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f4 48894424f8                     mov        qword ptr [rsp - 8], rax
016f9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01700 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170c 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01714 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0171c 666690                         nop        
0171f e8bce0b5ff                     call       0x7f179f9c3660
01724 0f1f84001c18000c               nop        dword ptr [rax + rax + 0xc00181c]
0172c be45ffffff                     mov        esi, 0xffffff45
01731 48894424f8                     mov        qword ptr [rsp - 8], rax
01736 8b442408                       mov        eax, dword ptr [rsp + 8]
0173a 890424                         mov        dword ptr [rsp], eax
0173d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01742 48894424f8                     mov        qword ptr [rsp - 8], rax
01747 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0174b 89442404                       mov        dword ptr [rsp + 4], eax
0174f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01754 48ff742410                     push       qword ptr [rsp + 0x10]
01759 488f442408                     pop        qword ptr [rsp + 8]
0175e 48ff742418                     push       qword ptr [rsp + 0x18]
01763 488f442410                     pop        qword ptr [rsp + 0x10]
01768 48894424f8                     mov        qword ptr [rsp - 8], rax
0176d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01771 89442418                       mov        dword ptr [rsp + 0x18], eax
01775 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177a 48894424f8                     mov        qword ptr [rsp - 8], rax
0177f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01783 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01787 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178c 48894424f8                     mov        qword ptr [rsp - 8], rax
01791 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01795 89442420                       mov        dword ptr [rsp + 0x20], eax
01799 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179e 48894424f8                     mov        qword ptr [rsp - 8], rax
017a3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
017a7 89442424                       mov        dword ptr [rsp + 0x24], eax
017ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017b5 48ff742438                     push       qword ptr [rsp + 0x38]
017ba 488f442430                     pop        qword ptr [rsp + 0x30]
017bf 48894424f8                     mov        qword ptr [rsp - 8], rax
017c4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017c8 89442438                       mov        dword ptr [rsp + 0x38], eax
017cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d1 48894424f8                     mov        qword ptr [rsp - 8], rax
017d6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017da 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e3 48ff742448                     push       qword ptr [rsp + 0x48]
017e8 488f442440                     pop        qword ptr [rsp + 0x40]
017ed 48ff742450                     push       qword ptr [rsp + 0x50]
017f2 488f442448                     pop        qword ptr [rsp + 0x48]
017f7 48ff742458                     push       qword ptr [rsp + 0x58]
017fc 488f442450                     pop        qword ptr [rsp + 0x50]
01801 48894424f8                     mov        qword ptr [rsp - 8], rax
01806 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0180d 89442458                       mov        dword ptr [rsp + 0x58], eax
01811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01816 48894424f8                     mov        qword ptr [rsp - 8], rax
0181b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01822 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01826 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182b 48894424f8                     mov        qword ptr [rsp - 8], rax
01830 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01837 89442460                       mov        dword ptr [rsp + 0x60], eax
0183b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01840 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01848 488f442468                     pop        qword ptr [rsp + 0x68]
0184d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01855 488f442470                     pop        qword ptr [rsp + 0x70]
0185a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01862 488f442478                     pop        qword ptr [rsp + 0x78]
01867 48894424f8                     mov        qword ptr [rsp - 8], rax
0186c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01873 89442464                       mov        dword ptr [rsp + 0x64], eax
01877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187c 48894424f8                     mov        qword ptr [rsp - 8], rax
01881 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01888 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0188f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01894 48894424f8                     mov        qword ptr [rsp - 8], rax
01899 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
018a0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
018a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018b8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c4 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018cc 488f842490000000               pop        qword ptr [rsp + 0x90]
018d4 48894424f8                     mov        qword ptr [rsp - 8], rax
018d9 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018e0 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ec 48894424f8                     mov        qword ptr [rsp - 8], rax
018f1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018f8 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
018ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01904 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0190c 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
01913 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
0191b e8c0deb5ff                     call       0x7f179f9c3660
01920 0f1f8400181a000d               nop        dword ptr [rax + rax + 0xd001a18]
01928 be45ffffff                     mov        esi, 0xffffff45
0192d 48894424f8                     mov        qword ptr [rsp - 8], rax
01932 8b442408                       mov        eax, dword ptr [rsp + 8]
01936 890424                         mov        dword ptr [rsp], eax
01939 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193e 48894424f8                     mov        qword ptr [rsp - 8], rax
01943 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01947 89442404                       mov        dword ptr [rsp + 4], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48ff742410                     push       qword ptr [rsp + 0x10]
01955 488f442408                     pop        qword ptr [rsp + 8]
0195a 48ff742418                     push       qword ptr [rsp + 0x18]
0195f 488f442410                     pop        qword ptr [rsp + 0x10]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0196d 89442418                       mov        dword ptr [rsp + 0x18], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 48894424f8                     mov        qword ptr [rsp - 8], rax
0197b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0197f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01988 48894424f8                     mov        qword ptr [rsp - 8], rax
0198d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01991 89442420                       mov        dword ptr [rsp + 0x20], eax
01995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199a 48894424f8                     mov        qword ptr [rsp - 8], rax
0199f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
019a3 89442424                       mov        dword ptr [rsp + 0x24], eax
019a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ac 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019b1 48ff742438                     push       qword ptr [rsp + 0x38]
019b6 488f442430                     pop        qword ptr [rsp + 0x30]
019bb 48894424f8                     mov        qword ptr [rsp - 8], rax
019c0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019c4 89442438                       mov        dword ptr [rsp + 0x38], eax
019c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cd 48894424f8                     mov        qword ptr [rsp - 8], rax
019d2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019d6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019df 48ff742448                     push       qword ptr [rsp + 0x48]
019e4 488f442440                     pop        qword ptr [rsp + 0x40]
019e9 48ff742450                     push       qword ptr [rsp + 0x50]
019ee 488f442448                     pop        qword ptr [rsp + 0x48]
019f3 48ff742458                     push       qword ptr [rsp + 0x58]
019f8 488f442450                     pop        qword ptr [rsp + 0x50]
019fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01a02 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a09 89442458                       mov        dword ptr [rsp + 0x58], eax
01a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a12 48894424f8                     mov        qword ptr [rsp - 8], rax
01a17 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a1e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a27 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a33 89442460                       mov        dword ptr [rsp + 0x60], eax
01a37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a44 488f442468                     pop        qword ptr [rsp + 0x68]
01a49 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a51 488f442478                     pop        qword ptr [rsp + 0x78]
01a56 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a62 89442464                       mov        dword ptr [rsp + 0x64], eax
01a66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a70 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a77 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a83 48894424f8                     mov        qword ptr [rsp - 8], rax
01a88 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a8f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa0 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01aa7 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01aae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01abb 488f842490000000               pop        qword ptr [rsp + 0x90]
01ac3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac8 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01acf 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ad6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01adb 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ae3 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01aea 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01af1 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01af9 6690                           nop        
01afb e8e0dcb5ff                     call       0x7f179f9c3660
01b00 0f1f8400f81b000e               nop        dword ptr [rax + rax + 0xe001bf8]
01b08 b9ffffff7f                     mov        ecx, 0x7fffffff
01b0d 4c3bc9                         cmp        r9, rcx
01b10 bdffffffff                     mov        ebp, 0xffffffff
01b15 7c08                           jl         0x7f179fe6599f
01b17 400f95c5                       setne      bpl
01b1b 400fb6ed                       movzx      ebp, bpl
01b1f be45ffffff                     mov        esi, 0xffffff45
01b24 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b29 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b35 89442460                       mov        dword ptr [rsp + 0x60], eax
01b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b4a 89442464                       mov        dword ptr [rsp + 0x64], eax
01b4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b53 48894424f8                     mov        qword ptr [rsp - 8], rax
01b58 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b5f 89442468                       mov        dword ptr [rsp + 0x68], eax
01b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b68 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01b70 48894424f8                     mov        qword ptr [rsp - 8], rax
01b75 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b7c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b85 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8a 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b91 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba2 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01ba9 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bba 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bc1 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01bc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcd 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01bd5 488f842498000000               pop        qword ptr [rsp + 0x98]
01bdd 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01be5 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01bed 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bf9 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01c00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c05 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c0d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01c15 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
01c1d 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c25 6690                           nop        
01c27 e8b4dbb5ff                     call       0x7f179f9c3660
01c2c 0f1f8400241d000f               nop        dword ptr [rax + rax + 0xf001d24]
01c34 be45ffffff                     mov        esi, 0xffffff45
01c39 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3e 8b442408                       mov        eax, dword ptr [rsp + 8]
01c42 890424                         mov        dword ptr [rsp], eax
01c45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c53 89442404                       mov        dword ptr [rsp + 4], eax
01c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5c 48ff742410                     push       qword ptr [rsp + 0x10]
01c61 488f442408                     pop        qword ptr [rsp + 8]
01c66 48ff742418                     push       qword ptr [rsp + 0x18]
01c6b 488f442410                     pop        qword ptr [rsp + 0x10]
01c70 48894424f8                     mov        qword ptr [rsp - 8], rax
01c75 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c79 89442418                       mov        dword ptr [rsp + 0x18], eax
01c7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c82 48894424f8                     mov        qword ptr [rsp - 8], rax
01c87 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c8b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c94 48894424f8                     mov        qword ptr [rsp - 8], rax
01c99 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c9d 89442420                       mov        dword ptr [rsp + 0x20], eax
01ca1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01caf 89442424                       mov        dword ptr [rsp + 0x24], eax
01cb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01cbd 48ff742438                     push       qword ptr [rsp + 0x38]
01cc2 488f442430                     pop        qword ptr [rsp + 0x30]
01cc7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01cd0 89442438                       mov        dword ptr [rsp + 0x38], eax
01cd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cde 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ce2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ce6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ceb 48ff742448                     push       qword ptr [rsp + 0x48]
01cf0 488f442440                     pop        qword ptr [rsp + 0x40]
01cf5 48ff742450                     push       qword ptr [rsp + 0x50]
01cfa 488f442448                     pop        qword ptr [rsp + 0x48]
01cff 48ff742458                     push       qword ptr [rsp + 0x58]
01d04 488f442450                     pop        qword ptr [rsp + 0x50]
01d09 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d15 89442458                       mov        dword ptr [rsp + 0x58], eax
01d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d23 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d2a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d33 48894424f8                     mov        qword ptr [rsp - 8], rax
01d38 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d3f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d48 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01d4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d52 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d59 89442464                       mov        dword ptr [rsp + 0x64], eax
01d5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d62 48894424f8                     mov        qword ptr [rsp - 8], rax
01d67 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d6e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d86 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d92 48894424f8                     mov        qword ptr [rsp - 8], rax
01d97 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01d9e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daa 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01db2 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01dba 90                             nop        
01dbb e820dab5ff                     call       0x7f179f9c3660
01dc0 0f1f8400b81e0010               nop        dword ptr [rax + rax + 0x10001eb8]
01dc8 be45ffffff                     mov        esi, 0xffffff45
01dcd 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd2 8b442408                       mov        eax, dword ptr [rsp + 8]
01dd6 890424                         mov        dword ptr [rsp], eax
01dd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dde 48894424f8                     mov        qword ptr [rsp - 8], rax
01de3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01de7 89442404                       mov        dword ptr [rsp + 4], eax
01deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df0 48ff742410                     push       qword ptr [rsp + 0x10]
01df5 488f442408                     pop        qword ptr [rsp + 8]
01dfa 48ff742418                     push       qword ptr [rsp + 0x18]
01dff 488f442410                     pop        qword ptr [rsp + 0x10]
01e04 48894424f8                     mov        qword ptr [rsp - 8], rax
01e09 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e0d 89442418                       mov        dword ptr [rsp + 0x18], eax
01e11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e16 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e1f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e28 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e31 89442420                       mov        dword ptr [rsp + 0x20], eax
01e35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e43 89442424                       mov        dword ptr [rsp + 0x24], eax
01e47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e51 48ff742438                     push       qword ptr [rsp + 0x38]
01e56 488f442430                     pop        qword ptr [rsp + 0x30]
01e5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e60 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e64 89442438                       mov        dword ptr [rsp + 0x38], eax
01e68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e72 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e76 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7f 48ff742448                     push       qword ptr [rsp + 0x48]
01e84 488f442440                     pop        qword ptr [rsp + 0x40]
01e89 48ff742450                     push       qword ptr [rsp + 0x50]
01e8e 488f442448                     pop        qword ptr [rsp + 0x48]
01e93 48ff742458                     push       qword ptr [rsp + 0x58]
01e98 488f442450                     pop        qword ptr [rsp + 0x50]
01e9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ea9 89442458                       mov        dword ptr [rsp + 0x58], eax
01ead 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ebe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ec2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ecc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ed3 89442460                       mov        dword ptr [rsp + 0x60], eax
01ed7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edc 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ee1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01eed 89442464                       mov        dword ptr [rsp + 0x64], eax
01ef1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef6 48894424f8                     mov        qword ptr [rsp - 8], rax
01efb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f02 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f13 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f1a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f26 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f32 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f46 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01f4e 90                             nop        
01f4f e88cd8b5ff                     call       0x7f179f9c3660
01f54 0f1f84004c200011               nop        dword ptr [rax + rax + 0x1100204c]
01f5c be3dffffff                     mov        esi, 0xffffff3d
01f61 48894424f8                     mov        qword ptr [rsp - 8], rax
01f66 8b442408                       mov        eax, dword ptr [rsp + 8]
01f6a 890424                         mov        dword ptr [rsp], eax
01f6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f72 48894424f8                     mov        qword ptr [rsp - 8], rax
01f77 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f7b 89442404                       mov        dword ptr [rsp + 4], eax
01f7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f84 48ff742410                     push       qword ptr [rsp + 0x10]
01f89 488f442408                     pop        qword ptr [rsp + 8]
01f8e 48ff742418                     push       qword ptr [rsp + 0x18]
01f93 488f442410                     pop        qword ptr [rsp + 0x10]
01f98 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01fa1 89442418                       mov        dword ptr [rsp + 0x18], eax
01fa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01faa 48894424f8                     mov        qword ptr [rsp - 8], rax
01faf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fb3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fc5 89442420                       mov        dword ptr [rsp + 0x20], eax
01fc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fce 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fd7 89442424                       mov        dword ptr [rsp + 0x24], eax
01fdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01fe5 48ff742438                     push       qword ptr [rsp + 0x38]
01fea 488f442430                     pop        qword ptr [rsp + 0x30]
01fef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ff8 89442438                       mov        dword ptr [rsp + 0x38], eax
01ffc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02001 48894424f8                     mov        qword ptr [rsp - 8], rax
02006 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0200a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0200e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02013 48ff742448                     push       qword ptr [rsp + 0x48]
02018 488f442440                     pop        qword ptr [rsp + 0x40]
0201d 48ff742450                     push       qword ptr [rsp + 0x50]
02022 488f442448                     pop        qword ptr [rsp + 0x48]
02027 48ff742458                     push       qword ptr [rsp + 0x58]
0202c 488f442450                     pop        qword ptr [rsp + 0x50]
02031 48894424f8                     mov        qword ptr [rsp - 8], rax
02036 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0203d 89442458                       mov        dword ptr [rsp + 0x58], eax
02041 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02046 48894424f8                     mov        qword ptr [rsp - 8], rax
0204b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02052 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02056 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205b 48894424f8                     mov        qword ptr [rsp - 8], rax
02060 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02067 89442460                       mov        dword ptr [rsp + 0x60], eax
0206b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02070 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02075 48894424f8                     mov        qword ptr [rsp - 8], rax
0207a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02081 89442464                       mov        dword ptr [rsp + 0x64], eax
02085 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208a 48894424f8                     mov        qword ptr [rsp - 8], rax
0208f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02096 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0209d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a2 48894424f8                     mov        qword ptr [rsp - 8], rax
020a7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020ae 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020c6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020da 488f842490000000               pop        qword ptr [rsp + 0x90]
020e2 48894424f8                     mov        qword ptr [rsp - 8], rax
020e7 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
020ee 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
020f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fa 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02102 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0210a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02112 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0211a 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02122 48894424f8                     mov        qword ptr [rsp - 8], rax
02127 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0212e 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02135 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02142 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0214a 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02152 90                             nop        
02153 e888d6b5ff                     call       0x7f179f9c3660
02158 0f1f840050220012               nop        dword ptr [rax + rax + 0x12002250]
02160 be45ffffff                     mov        esi, 0xffffff45
02165 48894424f8                     mov        qword ptr [rsp - 8], rax
0216a 8b442408                       mov        eax, dword ptr [rsp + 8]
0216e 890424                         mov        dword ptr [rsp], eax
02171 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02176 48894424f8                     mov        qword ptr [rsp - 8], rax
0217b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0217f 89442404                       mov        dword ptr [rsp + 4], eax
02183 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02188 48ff742410                     push       qword ptr [rsp + 0x10]
0218d 488f442408                     pop        qword ptr [rsp + 8]
02192 48ff742418                     push       qword ptr [rsp + 0x18]
02197 488f442410                     pop        qword ptr [rsp + 0x10]
0219c 48894424f8                     mov        qword ptr [rsp - 8], rax
021a1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
021a5 89442418                       mov        dword ptr [rsp + 0x18], eax
021a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ae 48894424f8                     mov        qword ptr [rsp - 8], rax
021b3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021b7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c0 48894424f8                     mov        qword ptr [rsp - 8], rax
021c5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021c9 89442420                       mov        dword ptr [rsp + 0x20], eax
021cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d2 48894424f8                     mov        qword ptr [rsp - 8], rax
021d7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021db 89442424                       mov        dword ptr [rsp + 0x24], eax
021df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
021e9 48ff742438                     push       qword ptr [rsp + 0x38]
021ee 488f442430                     pop        qword ptr [rsp + 0x30]
021f3 48894424f8                     mov        qword ptr [rsp - 8], rax
021f8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021fc 89442438                       mov        dword ptr [rsp + 0x38], eax
02200 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02205 48894424f8                     mov        qword ptr [rsp - 8], rax
0220a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0220e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02212 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02217 48ff742448                     push       qword ptr [rsp + 0x48]
0221c 488f442440                     pop        qword ptr [rsp + 0x40]
02221 48ff742450                     push       qword ptr [rsp + 0x50]
02226 488f442448                     pop        qword ptr [rsp + 0x48]
0222b 48ff742458                     push       qword ptr [rsp + 0x58]
02230 488f442450                     pop        qword ptr [rsp + 0x50]
02235 89542458                       mov        dword ptr [rsp + 0x58], edx
02239 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02241 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02249 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02251 6690                           nop        
02253 e888d5b5ff                     call       0x7f179f9c3660
02258 0f1f840050230013               nop        dword ptr [rax + rax + 0x13002350]
02260 be45ffffff                     mov        esi, 0xffffff45
02265 48894424f8                     mov        qword ptr [rsp - 8], rax
0226a 8b442408                       mov        eax, dword ptr [rsp + 8]
0226e 890424                         mov        dword ptr [rsp], eax
02271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02276 48894424f8                     mov        qword ptr [rsp - 8], rax
0227b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0227f 89442404                       mov        dword ptr [rsp + 4], eax
02283 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02288 48ff742410                     push       qword ptr [rsp + 0x10]
0228d 488f442408                     pop        qword ptr [rsp + 8]
02292 48ff742418                     push       qword ptr [rsp + 0x18]
02297 488f442410                     pop        qword ptr [rsp + 0x10]
0229c 48894424f8                     mov        qword ptr [rsp - 8], rax
022a1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022a5 89442418                       mov        dword ptr [rsp + 0x18], eax
022a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ae 48894424f8                     mov        qword ptr [rsp - 8], rax
022b3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022b7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c0 48894424f8                     mov        qword ptr [rsp - 8], rax
022c5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022c9 89442420                       mov        dword ptr [rsp + 0x20], eax
022cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d2 48894424f8                     mov        qword ptr [rsp - 8], rax
022d7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022db 89442424                       mov        dword ptr [rsp + 0x24], eax
022df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
022e9 48ff742438                     push       qword ptr [rsp + 0x38]
022ee 488f442430                     pop        qword ptr [rsp + 0x30]
022f3 48894424f8                     mov        qword ptr [rsp - 8], rax
022f8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022fc 89442438                       mov        dword ptr [rsp + 0x38], eax
02300 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02305 48894424f8                     mov        qword ptr [rsp - 8], rax
0230a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0230e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02312 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02317 48ff742448                     push       qword ptr [rsp + 0x48]
0231c 488f442440                     pop        qword ptr [rsp + 0x40]
02321 48ff742450                     push       qword ptr [rsp + 0x50]
02326 488f442448                     pop        qword ptr [rsp + 0x48]
0232b 48ff742458                     push       qword ptr [rsp + 0x58]
02330 488f442450                     pop        qword ptr [rsp + 0x50]
02335 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
0233c 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02344 666690                         nop        
02347 e894d4b5ff                     call       0x7f179f9c3660
0234c 0f1f840044240014               nop        dword ptr [rax + rax + 0x14002444]
02354 be45ffffff                     mov        esi, 0xffffff45
02359 48894424f8                     mov        qword ptr [rsp - 8], rax
0235e 8b442408                       mov        eax, dword ptr [rsp + 8]
02362 890424                         mov        dword ptr [rsp], eax
02365 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236a 48894424f8                     mov        qword ptr [rsp - 8], rax
0236f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02373 89442404                       mov        dword ptr [rsp + 4], eax
02377 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0237c 48ff742410                     push       qword ptr [rsp + 0x10]
02381 488f442408                     pop        qword ptr [rsp + 8]
02386 48ff742418                     push       qword ptr [rsp + 0x18]
0238b 488f442410                     pop        qword ptr [rsp + 0x10]
02390 48894424f8                     mov        qword ptr [rsp - 8], rax
02395 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02399 89442418                       mov        dword ptr [rsp + 0x18], eax
0239d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a2 48894424f8                     mov        qword ptr [rsp - 8], rax
023a7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023ab 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b4 48894424f8                     mov        qword ptr [rsp - 8], rax
023b9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023bd 89442420                       mov        dword ptr [rsp + 0x20], eax
023c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c6 48894424f8                     mov        qword ptr [rsp - 8], rax
023cb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023cf 89442424                       mov        dword ptr [rsp + 0x24], eax
023d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d8 48ff742438                     push       qword ptr [rsp + 0x38]
023dd 488f442430                     pop        qword ptr [rsp + 0x30]
023e2 48894424f8                     mov        qword ptr [rsp - 8], rax
023e7 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023eb 89442438                       mov        dword ptr [rsp + 0x38], eax
023ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f4 48894424f8                     mov        qword ptr [rsp - 8], rax
023f9 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023fd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02401 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02406 48ff742448                     push       qword ptr [rsp + 0x48]
0240b 488f442440                     pop        qword ptr [rsp + 0x40]
02410 48ff742450                     push       qword ptr [rsp + 0x50]
02415 488f442448                     pop        qword ptr [rsp + 0x48]
0241a 48ff742458                     push       qword ptr [rsp + 0x58]
0241f 488f442450                     pop        qword ptr [rsp + 0x50]
02424 48894424f8                     mov        qword ptr [rsp - 8], rax
02429 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02430 89442458                       mov        dword ptr [rsp + 0x58], eax
02434 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02439 48894424f8                     mov        qword ptr [rsp - 8], rax
0243e 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02445 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02449 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244e 48894424f8                     mov        qword ptr [rsp - 8], rax
02453 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0245a 89442460                       mov        dword ptr [rsp + 0x60], eax
0245e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02463 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0246b 488f442468                     pop        qword ptr [rsp + 0x68]
02470 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02478 488f442470                     pop        qword ptr [rsp + 0x70]
0247d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02485 488f442478                     pop        qword ptr [rsp + 0x78]
0248a 48894424f8                     mov        qword ptr [rsp - 8], rax
0248f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02496 89442464                       mov        dword ptr [rsp + 0x64], eax
0249a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249f 48894424f8                     mov        qword ptr [rsp - 8], rax
024a4 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024ab 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b7 48894424f8                     mov        qword ptr [rsp - 8], rax
024bc 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024c3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024cf 48894424f8                     mov        qword ptr [rsp - 8], rax
024d4 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024db 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
024ef 488f842490000000               pop        qword ptr [rsp + 0x90]
024f7 48894424f8                     mov        qword ptr [rsp - 8], rax
024fc 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02503 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0250a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
02517 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0251f 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
02527 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0252f e8acd2b5ff                     call       0x7f179f9c3660
02534 0f1f84002c260015               nop        dword ptr [rax + rax + 0x1500262c]
0253c 4533d2                         xor        r10d, r10d
0253f 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
02547 e982dcffff                     jmp        0x7f179fe6404e
0254c 4533d2                         xor        r10d, r10d
0254f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02554 e9a1dcffff                     jmp        0x7f179fe6407a
02559 4533d2                         xor        r10d, r10d
0255c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02561 e9bbdcffff                     jmp        0x7f179fe640a1
02566 4533d2                         xor        r10d, r10d
02569 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0256e e9dadcffff                     jmp        0x7f179fe640cd
02573 4533d2                         xor        r10d, r10d
02576 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0257b e9f7dcffff                     jmp        0x7f179fe640f7
02580 4533d2                         xor        r10d, r10d
02583 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02588 e91cddffff                     jmp        0x7f179fe64129
0258d 4533d2                         xor        r10d, r10d
02590 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02598 e939ddffff                     jmp        0x7f179fe64156
0259d 4533d2                         xor        r10d, r10d
025a0 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
025a8 e94fddffff                     jmp        0x7f179fe6417c
025ad bebeffffff                     mov        esi, 0xffffffbe
025b2 48894424f8                     mov        qword ptr [rsp - 8], rax
025b7 8b442408                       mov        eax, dword ptr [rsp + 8]
025bb 890424                         mov        dword ptr [rsp], eax
025be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c3 48894424f8                     mov        qword ptr [rsp - 8], rax
025c8 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
025cc 89442404                       mov        dword ptr [rsp + 4], eax
025d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d5 48ff742410                     push       qword ptr [rsp + 0x10]
025da 488f442408                     pop        qword ptr [rsp + 8]
025df 48ff742418                     push       qword ptr [rsp + 0x18]
025e4 488f442410                     pop        qword ptr [rsp + 0x10]
025e9 48894424f8                     mov        qword ptr [rsp - 8], rax
025ee 8b442420                       mov        eax, dword ptr [rsp + 0x20]
025f2 89442418                       mov        dword ptr [rsp + 0x18], eax
025f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02600 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02604 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02608 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260d 48894424f8                     mov        qword ptr [rsp - 8], rax
02612 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02616 89442420                       mov        dword ptr [rsp + 0x20], eax
0261a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261f 48894424f8                     mov        qword ptr [rsp - 8], rax
02624 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02628 89442424                       mov        dword ptr [rsp + 0x24], eax
0262c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02631 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02636 48ff742438                     push       qword ptr [rsp + 0x38]
0263b 488f442430                     pop        qword ptr [rsp + 0x30]
02640 48894424f8                     mov        qword ptr [rsp - 8], rax
02645 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02649 89442438                       mov        dword ptr [rsp + 0x38], eax
0264d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02652 48894424f8                     mov        qword ptr [rsp - 8], rax
02657 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0265b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0265f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02664 48ff742448                     push       qword ptr [rsp + 0x48]
02669 488f442440                     pop        qword ptr [rsp + 0x40]
0266e 48ff742450                     push       qword ptr [rsp + 0x50]
02673 488f442448                     pop        qword ptr [rsp + 0x48]
02678 48ff742458                     push       qword ptr [rsp + 0x58]
0267d 488f442450                     pop        qword ptr [rsp + 0x50]
02682 90                             nop        
02683 e858d1b5ff                     call       0x7f179f9c3660
02688 0f1f840080270016               nop        dword ptr [rax + rax + 0x16002780]
02690 be85ffffff                     mov        esi, 0xffffff85
02695 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02699 48894424f8                     mov        qword ptr [rsp - 8], rax
0269e 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026a2 890424                         mov        dword ptr [rsp], eax
026a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026aa 48894424f8                     mov        qword ptr [rsp - 8], rax
026af 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026b3 89442404                       mov        dword ptr [rsp + 4], eax
026b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026bc 48894424f8                     mov        qword ptr [rsp - 8], rax
026c1 8b442424                       mov        eax, dword ptr [rsp + 0x24]
026c5 89442408                       mov        dword ptr [rsp + 8], eax
026c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ce 48894424f8                     mov        qword ptr [rsp - 8], rax
026d3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026d7 8944240c                       mov        dword ptr [rsp + 0xc], eax
026db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e0 48894424f8                     mov        qword ptr [rsp - 8], rax
026e5 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026e9 89442410                       mov        dword ptr [rsp + 0x10], eax
026ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f2 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
026f7 48ff742438                     push       qword ptr [rsp + 0x38]
026fc 488f442420                     pop        qword ptr [rsp + 0x20]
02701 48894424f8                     mov        qword ptr [rsp - 8], rax
02706 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0270a 89442414                       mov        dword ptr [rsp + 0x14], eax
0270e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02713 48894424f8                     mov        qword ptr [rsp - 8], rax
02718 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0271c 89442428                       mov        dword ptr [rsp + 0x28], eax
02720 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02725 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0272a 90                             nop        
0272b e8b0d0b5ff                     call       0x7f179f9c3660
02730 0f1f840028280017               nop        dword ptr [rax + rax + 0x17002828]
02738 bef6ffffff                     mov        esi, 0xfffffff6
0273d 6690                           nop        
0273f e89cd0b5ff                     call       0x7f179f9c3660
02744 0f1f84003c280018               nop        dword ptr [rax + rax + 0x1800283c]
0274c be5d000000                     mov        esi, 0x5d
02751 6690                           nop        
02753 e888d0b5ff                     call       0x7f179f9c3660
02758 0f1f840050280019               nop        dword ptr [rax + rax + 0x19002850]
02760 bef6ffffff                     mov        esi, 0xfffffff6
02765 418beb                         mov        ebp, r11d
02768 666690                         nop        
0276b e870d0b5ff                     call       0x7f179f9c3660
02770 0f1f84006828001a               nop        dword ptr [rax + rax + 0x1a002868]
02778 bef6ffffff                     mov        esi, 0xfffffff6
0277d 8be9                           mov        ebp, ecx
0277f e85cd0b5ff                     call       0x7f179f9c3660
02784 0f1f84007c28001b               nop        dword ptr [rax + rax + 0x1b00287c]
0278c bef6ffffff                     mov        esi, 0xfffffff6
02791 418beb                         mov        ebp, r11d
02794 666690                         nop        
02797 e844d0b5ff                     call       0x7f179f9c3660
0279c 0f1f84009428001c               nop        dword ptr [rax + rax + 0x1c002894]
027a4 eb00                           jmp        0x7f179fe66626
027a6 488bf0                         mov        rsi, rax
027a9 e906e3ffff                     jmp        0x7f179fe64934
027ae 49ba0349e69f177f0000           movabs     r10, 0x7f179fe64903
027b8 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
027bf e99c78a9ff                     jmp        0x7f179f8fdee0
027c4 e85744a8ff                     call       0x7f179f8eaaa0
027c9 e960d8ffff                     jmp        0x7f179fe63eae
027ce f4                             hlt        
027cf f4                             hlt        
