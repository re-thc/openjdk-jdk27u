00000 e87b403b18                     call       0x7ff793f8d300
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
00028 0f859e290000                   jne        0x7ff77bbdbc4c
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
0018f 49ba70fa1494f77f0000           movabs     r10, 0x7ff79414fa70
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f8406250000                   je         0x7ff77bbdb938
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbf9060000                 cmp        r11d, 0x6f9
001c0 0f855a260000                   jne        0x7ff77bbdbaa0
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f84ec240000                   je         0x7ff77bbdb948
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f8530260000                   jne        0x7ff77bbdbaa0
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84cd240000                   je         0x7ff77bbdb955
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f8504260000                   jne        0x7ff77bbdbaa0
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f84b3240000                   je         0x7ff77bbdb962
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f85dd250000                   jne        0x7ff77bbdbaa0
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f8491240000                   je         0x7ff77bbdb96f
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f85ae250000                   jne        0x7ff77bbdbaa0
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8474240000                   je         0x7ff77bbdb97c
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f8584250000                   jne        0x7ff77bbdbaa0
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f844f240000                   je         0x7ff77bbdb989
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbfc060000                 cmp        r11d, 0x6fc
002c8 0f8552250000                   jne        0x7ff77bbdbaa0
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f843a240000                   je         0x7ff77bbdb999
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fafb060000                 cmp        r10d, 0x6fb
002ee 0f852c250000                   jne        0x7ff77bbdbaa0
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f841f240000                   je         0x7ff77bbdb9a9
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8411240000                   je         0x7ff77bbdb9a9
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f8403240000                   je         0x7ff77bbdb9a9
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00341 458d5af9                       lea        r11d, [r10 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8cdb230000                   jl         0x7ff77bbdb9a9
0034e 4183c2f9                       add        r10d, -7
00352 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0035a e96b020000                     jmp        0x7ff77bbd984a
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
0039a 0f8d64100000                   jge        0x7ff77bbda684
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d15120000                   jge        0x7ff77bbda868
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8df8130000                   jge        0x7ff77bbdaa74
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8ddf150000                   jge        0x7ff77bbdac84
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
00478 0f8efa0b0000                   jle        0x7ff77bbda2f8
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f6d170000                   jg         0x7ff77bbdae78
0048b 4181f8ffff0100                 cmp        r8d, 0x1ffff
00492 0f8fa0180000                   jg         0x7ff77bbdafb8
00498 4181fbffff0300                 cmp        r11d, 0x3ffff
0049f 0f8f3b1a0000                   jg         0x7ff77bbdb160
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83d31b0000                   jae        0x7ff77bbdb308
004b5 48c1e112                       shl        rcx, 0x12
004b9 4d63d9                         movsxd     r11, r9d
004bc 4d63c0                         movsxd     r8, r8d
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83bd090000                   jae        0x7ff77bbda118
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc108                     mov        qword ptr [r9 + r8*8 + 8], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8dbe000000                   jge        0x7ff77bbd983c
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
00550 0f8d4a1d0000                   jge        0x7ff77bbdb520
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
00592 0f8d1c1e0000                   jge        0x7ff77bbdb634
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
005d7 0f8d85040000                   jge        0x7ff77bbd9ce2
005dd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005e2 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e6 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005ee 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f6 458b4204                       mov        r8d, dword ptr [r10 + 4]
005fa 453bd8                         cmp        r11d, r8d
005fd 0f8301050000                   jae        0x7ff77bbd9d84
00603 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00608 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
0060c 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00613 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
0061a 458b4104                       mov        r8d, dword ptr [r9 + 4]
0061e 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00623 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0062b 413bc8                         cmp        ecx, r8d
0062e 0f83d8050000                   jae        0x7ff77bbd9e8c
00634 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00639 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00645 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0064d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00651 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00656 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0065e 453bd8                         cmp        r11d, r8d
00661 0f83d5060000                   jae        0x7ff77bbd9fbc
00667 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0066c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00674 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0067b ffc5                           inc        ebp
0067d 896c2404                       mov        dword ptr [rsp + 4], ebp
00681 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00685 0f8d4a040000                   jge        0x7ff77bbd9d55
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
00759 0f84550a0000                   je         0x7ff77bbda434
0075f 4183fa3f                       cmp        r10d, 0x3f
00763 0f8f270c0000                   jg         0x7ff77bbda610
00769 41b840000000                   mov        r8d, 0x40
0076f 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
00774 453bd0                         cmp        r10d, r8d
00777 7e43                           jle        0x7ff77bbd9a3c
00779 458bda                         mov        r11d, r10d
0077c 452bd8                         sub        r11d, r8d
0077f 4183f840                       cmp        r8d, 0x40
00783 0f8d331d0000                   jge        0x7ff77bbdb73c
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
007ba eb21                           jmp        0x7ff77bbd9a5d
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
007fb 0f8c8ffbffff                   jl         0x7ff77bbd9610
00801 458d53c0                       lea        r10d, [r11 - 0x40]
00805 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0080a 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080e 83c5f8                         add        ebp, -8
00811 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00815 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00819 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081d 83c1f0                         add        ecx, -0x10
00820 83f908                         cmp        ecx, 8
00823 0f8ceb010000                   jl         0x7ff77bbd9c94
00829 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082e 4183c2e8                       add        r10d, -0x18
00832 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0083a 0f821ffbffff                   jb         0x7ff77bbd95df
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
009f0 90                             nop        
009f1 90                             nop        
009f2 90                             nop        
009f3 e8e83dafff                     call       0x7ff77b6cda60
009f8 0f1f8400f00a0001               nop        dword ptr [rax + rax + 0x1000af0]
00a00 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
00a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0e e84d5f1818                     call       0x7ff793d5fbe0
00a13 f4                             hlt        
00a14 85c9                           test       ecx, ecx
00a16 7f08                           jg         0x7ff77bbd9ca0
00a18 4533d2                         xor        r10d, r10d
00a1b e94cf9ffff                     jmp        0x7ff77bbd95ec
00a20 8be9                           mov        ebp, ecx
00a22 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a2a 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a2e 90                             nop        
00a2f e8ac5fb5ff                     call       0x7ff77b72fc60
00a34 0f1f84002c0b0002               nop        dword ptr [rax + rax + 0x2000b2c]
00a3c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a41 41c1e303                       shl        r11d, 3
00a45 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a4a 41c1e203                       shl        r10d, 3
00a4e 452bd3                         sub        r10d, r11d
00a51 4181c2c0000000                 add        r10d, 0xc0
00a58 c462a9f7d0                     shlx       r10, rax, r10
00a5d e90af9ffff                     jmp        0x7ff77bbd95ec
00a62 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a6a 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a72 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a77 4d3bd3                         cmp        r10, r11
00a7a 7f26                           jg         0x7ff77bbd9d22
00a7c 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a81 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a86 0f85781e0000                   jne        0x7ff77bbdbb84
00a8c 418bc2                         mov        eax, r10d
00a8f 4881c430010000                 add        rsp, 0x130
00a96 5d                             pop        rbp
00a97 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a9b 0f87151f0000                   ja         0x7ff77bbdbc36
00aa1 c3                             ret        
00aa2 48bed05829e300000000           movabs     rsi, 0xe32958d0
00aac 90                             nop        
00aad 90                             nop        
00aae 90                             nop        
00aaf e82c5fb5ff                     call       0x7ff77b72fc60
00ab4 0f1f8400ac0b0003               nop        dword ptr [rax + rax + 0x3000bac]
00abc 4885c0                         test       rax, rax
00abf 0f84171e0000                   je         0x7ff77bbdbb5c
00ac5 488bf0                         mov        rsi, rax
00ac8 4881c430010000                 add        rsp, 0x130
00acf 5d                             pop        rbp
00ad0 e98bdbaeff                     jmp        0x7ff77b6c78e0
00ad5 4533d2                         xor        r10d, r10d
00ad8 33ed                           xor        ebp, ebp
00ada 4533c0                         xor        r8d, r8d
00add 4533db                         xor        r11d, r11d
00ae0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ae8 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00aef 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00af7 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00aff e9e9fbffff                     jmp        0x7ff77bbd996d
00b04 bee4ffffff                     mov        esi, 0xffffffe4
00b09 48894424f8                     mov        qword ptr [rsp - 8], rax
00b0e 8b442408                       mov        eax, dword ptr [rsp + 8]
00b12 890424                         mov        dword ptr [rsp], eax
00b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b23 89442404                       mov        dword ptr [rsp + 4], eax
00b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b2c 48ff742410                     push       qword ptr [rsp + 0x10]
00b31 488f442408                     pop        qword ptr [rsp + 8]
00b36 48ff742418                     push       qword ptr [rsp + 0x18]
00b3b 488f442410                     pop        qword ptr [rsp + 0x10]
00b40 48894424f8                     mov        qword ptr [rsp - 8], rax
00b45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b49 89442418                       mov        dword ptr [rsp + 0x18], eax
00b4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b52 48894424f8                     mov        qword ptr [rsp - 8], rax
00b57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b64 48894424f8                     mov        qword ptr [rsp - 8], rax
00b69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b6d 89442420                       mov        dword ptr [rsp + 0x20], eax
00b71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b76 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b7f 89442424                       mov        dword ptr [rsp + 0x24], eax
00b83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b8d 48ff742438                     push       qword ptr [rsp + 0x38]
00b92 488f442430                     pop        qword ptr [rsp + 0x30]
00b97 48894424f8                     mov        qword ptr [rsp - 8], rax
00b9c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ba0 89442438                       mov        dword ptr [rsp + 0x38], eax
00ba4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00bb2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bbb 48ff742448                     push       qword ptr [rsp + 0x48]
00bc0 488f442440                     pop        qword ptr [rsp + 0x40]
00bc5 48ff742450                     push       qword ptr [rsp + 0x50]
00bca 488f442448                     pop        qword ptr [rsp + 0x48]
00bcf 48ff742458                     push       qword ptr [rsp + 0x58]
00bd4 488f442450                     pop        qword ptr [rsp + 0x50]
00bd9 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00be1 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00be9 90                             nop        
00bea 90                             nop        
00beb e8f03bafff                     call       0x7ff77b6cda60
00bf0 0f1f8400e80c0004               nop        dword ptr [rax + rax + 0x4000ce8]
00bf8 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
00c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c06 e8555d1818                     call       0x7ff793d5fbe0
00c0b f4                             hlt        
00c0c bee4ffffff                     mov        esi, 0xffffffe4
00c11 48894424f8                     mov        qword ptr [rsp - 8], rax
00c16 8b442408                       mov        eax, dword ptr [rsp + 8]
00c1a 890424                         mov        dword ptr [rsp], eax
00c1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c22 48894424f8                     mov        qword ptr [rsp - 8], rax
00c27 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c2b 89442404                       mov        dword ptr [rsp + 4], eax
00c2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c34 48ff742410                     push       qword ptr [rsp + 0x10]
00c39 488f442408                     pop        qword ptr [rsp + 8]
00c3e 48ff742418                     push       qword ptr [rsp + 0x18]
00c43 488f442410                     pop        qword ptr [rsp + 0x10]
00c48 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c51 89442418                       mov        dword ptr [rsp + 0x18], eax
00c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00c71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c75 89442420                       mov        dword ptr [rsp + 0x20], eax
00c79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c83 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c87 89442424                       mov        dword ptr [rsp + 0x24], eax
00c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c90 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c95 48ff742438                     push       qword ptr [rsp + 0x38]
00c9a 488f442430                     pop        qword ptr [rsp + 0x30]
00c9f 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ca8 89442438                       mov        dword ptr [rsp + 0x38], eax
00cac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb1 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00cba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc3 48ff742448                     push       qword ptr [rsp + 0x48]
00cc8 488f442440                     pop        qword ptr [rsp + 0x40]
00ccd 48ff742450                     push       qword ptr [rsp + 0x50]
00cd2 488f442448                     pop        qword ptr [rsp + 0x48]
00cd7 48ff742458                     push       qword ptr [rsp + 0x58]
00cdc 488f442450                     pop        qword ptr [rsp + 0x50]
00ce1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ce6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ced 89442458                       mov        dword ptr [rsp + 0x58], eax
00cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00d02 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0b 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d13 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d1a 90                             nop        
00d1b e8c03aafff                     call       0x7ff77b6cda60
00d20 0f1f8400180e0005               nop        dword ptr [rax + rax + 0x5000e18]
00d28 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
00d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d36 e8255c1818                     call       0x7ff793d5fbe0
00d3b f4                             hlt        
00d3c bee4ffffff                     mov        esi, 0xffffffe4
00d41 48894424f8                     mov        qword ptr [rsp - 8], rax
00d46 8b442408                       mov        eax, dword ptr [rsp + 8]
00d4a 890424                         mov        dword ptr [rsp], eax
00d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d52 48894424f8                     mov        qword ptr [rsp - 8], rax
00d57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d5b 89442404                       mov        dword ptr [rsp + 4], eax
00d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d64 48ff742410                     push       qword ptr [rsp + 0x10]
00d69 488f442408                     pop        qword ptr [rsp + 8]
00d6e 48ff742418                     push       qword ptr [rsp + 0x18]
00d73 488f442410                     pop        qword ptr [rsp + 0x10]
00d78 48894424f8                     mov        qword ptr [rsp - 8], rax
00d7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d81 89442418                       mov        dword ptr [rsp + 0x18], eax
00d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00da1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00da5 89442420                       mov        dword ptr [rsp + 0x20], eax
00da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dae 48894424f8                     mov        qword ptr [rsp - 8], rax
00db3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00db7 89442424                       mov        dword ptr [rsp + 0x24], eax
00dbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dc0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00dc5 48ff742438                     push       qword ptr [rsp + 0x38]
00dca 488f442430                     pop        qword ptr [rsp + 0x30]
00dcf 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00dd8 89442438                       mov        dword ptr [rsp + 0x38], eax
00ddc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de1 48894424f8                     mov        qword ptr [rsp - 8], rax
00de6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00dea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00dee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df3 48ff742448                     push       qword ptr [rsp + 0x48]
00df8 488f442440                     pop        qword ptr [rsp + 0x40]
00dfd 48ff742450                     push       qword ptr [rsp + 0x50]
00e02 488f442448                     pop        qword ptr [rsp + 0x48]
00e07 48ff742458                     push       qword ptr [rsp + 0x58]
00e0c 488f442450                     pop        qword ptr [rsp + 0x50]
00e11 48894424f8                     mov        qword ptr [rsp - 8], rax
00e16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00e1d 89442458                       mov        dword ptr [rsp + 0x58], eax
00e21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e26 48894424f8                     mov        qword ptr [rsp - 8], rax
00e2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
00e40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e47 89442460                       mov        dword ptr [rsp + 0x60], eax
00e4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e50 48894424f8                     mov        qword ptr [rsp - 8], rax
00e55 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e5c 89442464                       mov        dword ptr [rsp + 0x64], eax
00e60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e65 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e6d 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e75 90                             nop        
00e76 90                             nop        
00e77 e86439afff                     call       0x7ff77b6cda60
00e7c 0f1f8400740f0006               nop        dword ptr [rax + rax + 0x6000f74]
00e84 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
00e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e92 e8c95a1818                     call       0x7ff793d5fbe0
00e97 f4                             hlt        
00e98 bee4ffffff                     mov        esi, 0xffffffe4
00e9d 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea2 8b442408                       mov        eax, dword ptr [rsp + 8]
00ea6 890424                         mov        dword ptr [rsp], eax
00ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eae 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00eb7 89442404                       mov        dword ptr [rsp + 4], eax
00ebb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec0 48ff742410                     push       qword ptr [rsp + 0x10]
00ec5 488f442408                     pop        qword ptr [rsp + 8]
00eca 48ff742418                     push       qword ptr [rsp + 0x18]
00ecf 488f442410                     pop        qword ptr [rsp + 0x10]
00ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00edd 89442418                       mov        dword ptr [rsp + 0x18], eax
00ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee6 48894424f8                     mov        qword ptr [rsp - 8], rax
00eeb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00eef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ef3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef8 48894424f8                     mov        qword ptr [rsp - 8], rax
00efd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f01 89442420                       mov        dword ptr [rsp + 0x20], eax
00f05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f13 89442424                       mov        dword ptr [rsp + 0x24], eax
00f17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f21 48ff742438                     push       qword ptr [rsp + 0x38]
00f26 488f442430                     pop        qword ptr [rsp + 0x30]
00f2b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f30 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f34 89442438                       mov        dword ptr [rsp + 0x38], eax
00f38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f42 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f46 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4f 48ff742448                     push       qword ptr [rsp + 0x48]
00f54 488f442440                     pop        qword ptr [rsp + 0x40]
00f59 48ff742450                     push       qword ptr [rsp + 0x50]
00f5e 488f442448                     pop        qword ptr [rsp + 0x48]
00f63 48ff742458                     push       qword ptr [rsp + 0x58]
00f68 488f442450                     pop        qword ptr [rsp + 0x50]
00f6d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f72 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f79 89442458                       mov        dword ptr [rsp + 0x58], eax
00f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f82 48894424f8                     mov        qword ptr [rsp - 8], rax
00f87 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f8e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f97 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00fa3 89442460                       mov        dword ptr [rsp + 0x60], eax
00fa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fac 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
00fb1 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fbd 89442464                       mov        dword ptr [rsp + 0x64], eax
00fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fd2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fde 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fea 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ff1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff6 48894424f8                     mov        qword ptr [rsp - 8], rax
00ffb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01002 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01009 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0100e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01016 488f842490000000               pop        qword ptr [rsp + 0x90]
0101e 48894424f8                     mov        qword ptr [rsp - 8], rax
01023 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0102a 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01031 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01036 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0103e 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01046 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0104e 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01056 90                             nop        
01057 e88437afff                     call       0x7ff77b6cda60
0105c 0f1f840054110007               nop        dword ptr [rax + rax + 0x7001154]
01064 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
0106e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01072 e8e9581818                     call       0x7ff793d5fbe0
01077 f4                             hlt        
01078 33c9                           xor        ecx, ecx
0107a 4c3bc9                         cmp        r9, rcx
0107d bdffffffff                     mov        ebp, 0xffffffff
01082 7c08                           jl         0x7ff77bbda30c
01084 400f95c5                       setne      bpl
01088 400fb6ed                       movzx      ebp, bpl
0108c be45ffffff                     mov        esi, 0xffffff45
01091 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01096 48894424f8                     mov        qword ptr [rsp - 8], rax
0109b 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
010a2 89442460                       mov        dword ptr [rsp + 0x60], eax
010a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ab 48894424f8                     mov        qword ptr [rsp - 8], rax
010b0 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010b7 89442464                       mov        dword ptr [rsp + 0x64], eax
010bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c0 48894424f8                     mov        qword ptr [rsp - 8], rax
010c5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010cc 89442468                       mov        dword ptr [rsp + 0x68], eax
010d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d5 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
010dd 48894424f8                     mov        qword ptr [rsp - 8], rax
010e2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010e9 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f2 48894424f8                     mov        qword ptr [rsp - 8], rax
010f7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
010fe 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110a 48894424f8                     mov        qword ptr [rsp - 8], rax
0110f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01116 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
0111d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01122 48894424f8                     mov        qword ptr [rsp - 8], rax
01127 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0112e 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01135 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0113a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01142 488f842498000000               pop        qword ptr [rsp + 0x98]
0114a 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01152 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0115a 48894424f8                     mov        qword ptr [rsp - 8], rax
0115f 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01166 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0116d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01172 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0117a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01182 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0118a 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01192 90                             nop        
01193 e84836afff                     call       0x7ff77b6cda60
01198 0f1f840090120008               nop        dword ptr [rax + rax + 0x8001290]
011a0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
011aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ae e8ad571818                     call       0x7ff793d5fbe0
011b3 f4                             hlt        
011b4 be45ffffff                     mov        esi, 0xffffff45
011b9 48894424f8                     mov        qword ptr [rsp - 8], rax
011be 8b442408                       mov        eax, dword ptr [rsp + 8]
011c2 890424                         mov        dword ptr [rsp], eax
011c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ca 48894424f8                     mov        qword ptr [rsp - 8], rax
011cf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011d3 89442404                       mov        dword ptr [rsp + 4], eax
011d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011dc 48ff742410                     push       qword ptr [rsp + 0x10]
011e1 488f442408                     pop        qword ptr [rsp + 8]
011e6 48ff742418                     push       qword ptr [rsp + 0x18]
011eb 488f442410                     pop        qword ptr [rsp + 0x10]
011f0 48894424f8                     mov        qword ptr [rsp - 8], rax
011f5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011f9 89442418                       mov        dword ptr [rsp + 0x18], eax
011fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01202 48894424f8                     mov        qword ptr [rsp - 8], rax
01207 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0120b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0120f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01214 48894424f8                     mov        qword ptr [rsp - 8], rax
01219 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0121d 89442420                       mov        dword ptr [rsp + 0x20], eax
01221 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01226 48894424f8                     mov        qword ptr [rsp - 8], rax
0122b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0122f 89442424                       mov        dword ptr [rsp + 0x24], eax
01233 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01238 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0123d 48ff742438                     push       qword ptr [rsp + 0x38]
01242 488f442430                     pop        qword ptr [rsp + 0x30]
01247 48894424f8                     mov        qword ptr [rsp - 8], rax
0124c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01250 89442438                       mov        dword ptr [rsp + 0x38], eax
01254 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01259 48894424f8                     mov        qword ptr [rsp - 8], rax
0125e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01262 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01266 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126b 48ff742448                     push       qword ptr [rsp + 0x48]
01270 488f442440                     pop        qword ptr [rsp + 0x40]
01275 48ff742450                     push       qword ptr [rsp + 0x50]
0127a 488f442448                     pop        qword ptr [rsp + 0x48]
0127f 48ff742458                     push       qword ptr [rsp + 0x58]
01284 488f442450                     pop        qword ptr [rsp + 0x50]
01289 48894424f8                     mov        qword ptr [rsp - 8], rax
0128e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01295 89442458                       mov        dword ptr [rsp + 0x58], eax
01299 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129e 48894424f8                     mov        qword ptr [rsp - 8], rax
012a3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012aa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b3 48894424f8                     mov        qword ptr [rsp - 8], rax
012b8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012bf 89442460                       mov        dword ptr [rsp + 0x60], eax
012c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c8 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012d0 488f442468                     pop        qword ptr [rsp + 0x68]
012d5 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012dd 488f442478                     pop        qword ptr [rsp + 0x78]
012e2 48894424f8                     mov        qword ptr [rsp - 8], rax
012e7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012ee 89442464                       mov        dword ptr [rsp + 0x64], eax
012f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f7 48894424f8                     mov        qword ptr [rsp - 8], rax
012fc 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01303 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0130a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130f 48894424f8                     mov        qword ptr [rsp - 8], rax
01314 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0131b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01322 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01327 48894424f8                     mov        qword ptr [rsp - 8], rax
0132c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01333 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0133a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01347 488f842490000000               pop        qword ptr [rsp + 0x90]
0134f 48894424f8                     mov        qword ptr [rsp - 8], rax
01354 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0135b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01362 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01367 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0136f e86c34afff                     call       0x7ff77b6cda60
01374 0f1f84006c140009               nop        dword ptr [rax + rax + 0x900146c]
0137c 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
01386 4883e4f0                       and        rsp, 0xfffffffffffffff0
0138a e8d1551818                     call       0x7ff793d5fbe0
0138f f4                             hlt        
01390 be45ffffff                     mov        esi, 0xffffff45
01395 48894424f8                     mov        qword ptr [rsp - 8], rax
0139a 8b442408                       mov        eax, dword ptr [rsp + 8]
0139e 890424                         mov        dword ptr [rsp], eax
013a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a6 48894424f8                     mov        qword ptr [rsp - 8], rax
013ab 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013af 89442404                       mov        dword ptr [rsp + 4], eax
013b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b8 48ff742410                     push       qword ptr [rsp + 0x10]
013bd 488f442408                     pop        qword ptr [rsp + 8]
013c2 48ff742418                     push       qword ptr [rsp + 0x18]
013c7 488f442410                     pop        qword ptr [rsp + 0x10]
013cc 48894424f8                     mov        qword ptr [rsp - 8], rax
013d1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013d5 89442418                       mov        dword ptr [rsp + 0x18], eax
013d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013de 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013e3 e8f833afff                     call       0x7ff77b6cda60
013e8 0f1f8400e014000a               nop        dword ptr [rax + rax + 0xa0014e0]
013f0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
013fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
013fe e85d551818                     call       0x7ff793d5fbe0
01403 f4                             hlt        
01404 be45ffffff                     mov        esi, 0xffffff45
01409 48894424f8                     mov        qword ptr [rsp - 8], rax
0140e 8b442408                       mov        eax, dword ptr [rsp + 8]
01412 890424                         mov        dword ptr [rsp], eax
01415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141a 48894424f8                     mov        qword ptr [rsp - 8], rax
0141f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01423 89442404                       mov        dword ptr [rsp + 4], eax
01427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142c 48ff742410                     push       qword ptr [rsp + 0x10]
01431 488f442408                     pop        qword ptr [rsp + 8]
01436 48ff742418                     push       qword ptr [rsp + 0x18]
0143b 488f442410                     pop        qword ptr [rsp + 0x10]
01440 48894424f8                     mov        qword ptr [rsp - 8], rax
01445 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01449 89442418                       mov        dword ptr [rsp + 0x18], eax
0144d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01452 48894424f8                     mov        qword ptr [rsp - 8], rax
01457 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0145b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0145f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01464 48894424f8                     mov        qword ptr [rsp - 8], rax
01469 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0146d 89442420                       mov        dword ptr [rsp + 0x20], eax
01471 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01476 48894424f8                     mov        qword ptr [rsp - 8], rax
0147b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0147f 89442424                       mov        dword ptr [rsp + 0x24], eax
01483 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01488 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0148d 48ff742438                     push       qword ptr [rsp + 0x38]
01492 488f442430                     pop        qword ptr [rsp + 0x30]
01497 48894424f8                     mov        qword ptr [rsp - 8], rax
0149c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014a0 89442438                       mov        dword ptr [rsp + 0x38], eax
014a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014b2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bb 48ff742448                     push       qword ptr [rsp + 0x48]
014c0 488f442440                     pop        qword ptr [rsp + 0x40]
014c5 48ff742450                     push       qword ptr [rsp + 0x50]
014ca 488f442448                     pop        qword ptr [rsp + 0x48]
014cf 48ff742458                     push       qword ptr [rsp + 0x58]
014d4 488f442450                     pop        qword ptr [rsp + 0x50]
014d9 48894424f8                     mov        qword ptr [rsp - 8], rax
014de 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014e5 89442458                       mov        dword ptr [rsp + 0x58], eax
014e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ee 48894424f8                     mov        qword ptr [rsp - 8], rax
014f3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014fa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01503 48894424f8                     mov        qword ptr [rsp - 8], rax
01508 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0150f 89442460                       mov        dword ptr [rsp + 0x60], eax
01513 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01518 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01520 488f442468                     pop        qword ptr [rsp + 0x68]
01525 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0152d 488f442470                     pop        qword ptr [rsp + 0x70]
01532 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0153a 488f442478                     pop        qword ptr [rsp + 0x78]
0153f 48894424f8                     mov        qword ptr [rsp - 8], rax
01544 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0154b 89442464                       mov        dword ptr [rsp + 0x64], eax
0154f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01554 48894424f8                     mov        qword ptr [rsp - 8], rax
01559 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01560 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01567 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156c 48894424f8                     mov        qword ptr [rsp - 8], rax
01571 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01578 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0157f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01584 48894424f8                     mov        qword ptr [rsp - 8], rax
01589 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01590 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01597 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015a4 488f842490000000               pop        qword ptr [rsp + 0x90]
015ac 48894424f8                     mov        qword ptr [rsp - 8], rax
015b1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015b8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c4 90                             nop        
015c5 90                             nop        
015c6 90                             nop        
015c7 e81432afff                     call       0x7ff77b6cda60
015cc 0f1f8400c416000b               nop        dword ptr [rax + rax + 0xb0016c4]
015d4 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
015de 4883e4f0                       and        rsp, 0xfffffffffffffff0
015e2 e879531818                     call       0x7ff793d5fbe0
015e7 f4                             hlt        
015e8 be45ffffff                     mov        esi, 0xffffff45
015ed 48894424f8                     mov        qword ptr [rsp - 8], rax
015f2 8b442408                       mov        eax, dword ptr [rsp + 8]
015f6 890424                         mov        dword ptr [rsp], eax
015f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01603 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01607 89442404                       mov        dword ptr [rsp + 4], eax
0160b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01610 48ff742410                     push       qword ptr [rsp + 0x10]
01615 488f442408                     pop        qword ptr [rsp + 8]
0161a 48ff742418                     push       qword ptr [rsp + 0x18]
0161f 488f442410                     pop        qword ptr [rsp + 0x10]
01624 48894424f8                     mov        qword ptr [rsp - 8], rax
01629 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0162d 89442418                       mov        dword ptr [rsp + 0x18], eax
01631 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01636 48894424f8                     mov        qword ptr [rsp - 8], rax
0163b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0163f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01648 48894424f8                     mov        qword ptr [rsp - 8], rax
0164d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01651 89442420                       mov        dword ptr [rsp + 0x20], eax
01655 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165a 48894424f8                     mov        qword ptr [rsp - 8], rax
0165f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01663 89442424                       mov        dword ptr [rsp + 0x24], eax
01667 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01671 48ff742438                     push       qword ptr [rsp + 0x38]
01676 488f442430                     pop        qword ptr [rsp + 0x30]
0167b 48894424f8                     mov        qword ptr [rsp - 8], rax
01680 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01684 89442438                       mov        dword ptr [rsp + 0x38], eax
01688 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168d 48894424f8                     mov        qword ptr [rsp - 8], rax
01692 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01696 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0169a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169f 48ff742448                     push       qword ptr [rsp + 0x48]
016a4 488f442440                     pop        qword ptr [rsp + 0x40]
016a9 48ff742450                     push       qword ptr [rsp + 0x50]
016ae 488f442448                     pop        qword ptr [rsp + 0x48]
016b3 48ff742458                     push       qword ptr [rsp + 0x58]
016b8 488f442450                     pop        qword ptr [rsp + 0x50]
016bd 48894424f8                     mov        qword ptr [rsp - 8], rax
016c2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016c9 89442458                       mov        dword ptr [rsp + 0x58], eax
016cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d2 48894424f8                     mov        qword ptr [rsp - 8], rax
016d7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016de 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e7 48894424f8                     mov        qword ptr [rsp - 8], rax
016ec 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016f3 89442460                       mov        dword ptr [rsp + 0x60], eax
016f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01704 488f442468                     pop        qword ptr [rsp + 0x68]
01709 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01711 488f442470                     pop        qword ptr [rsp + 0x70]
01716 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0171e 488f442478                     pop        qword ptr [rsp + 0x78]
01723 48894424f8                     mov        qword ptr [rsp - 8], rax
01728 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0172f 89442464                       mov        dword ptr [rsp + 0x64], eax
01733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01738 48894424f8                     mov        qword ptr [rsp - 8], rax
0173d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01744 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0174b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01750 48894424f8                     mov        qword ptr [rsp - 8], rax
01755 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0175c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01763 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01768 48894424f8                     mov        qword ptr [rsp - 8], rax
0176d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01774 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0177b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01780 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01788 488f842490000000               pop        qword ptr [rsp + 0x90]
01790 48894424f8                     mov        qword ptr [rsp - 8], rax
01795 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
0179c 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a8 48894424f8                     mov        qword ptr [rsp - 8], rax
017ad 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017b4 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c0 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017c8 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017d0 90                             nop        
017d1 90                             nop        
017d2 90                             nop        
017d3 e80830afff                     call       0x7ff77b6cda60
017d8 0f1f8400d018000c               nop        dword ptr [rax + rax + 0xc0018d0]
017e0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
017ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ee e86d511818                     call       0x7ff793d5fbe0
017f3 f4                             hlt        
017f4 be45ffffff                     mov        esi, 0xffffff45
017f9 48894424f8                     mov        qword ptr [rsp - 8], rax
017fe 8b442408                       mov        eax, dword ptr [rsp + 8]
01802 890424                         mov        dword ptr [rsp], eax
01805 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01813 89442404                       mov        dword ptr [rsp + 4], eax
01817 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181c 48ff742410                     push       qword ptr [rsp + 0x10]
01821 488f442408                     pop        qword ptr [rsp + 8]
01826 48ff742418                     push       qword ptr [rsp + 0x18]
0182b 488f442410                     pop        qword ptr [rsp + 0x10]
01830 48894424f8                     mov        qword ptr [rsp - 8], rax
01835 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01839 89442418                       mov        dword ptr [rsp + 0x18], eax
0183d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01842 48894424f8                     mov        qword ptr [rsp - 8], rax
01847 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0184b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0184f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01854 48894424f8                     mov        qword ptr [rsp - 8], rax
01859 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0185d 89442420                       mov        dword ptr [rsp + 0x20], eax
01861 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01866 48894424f8                     mov        qword ptr [rsp - 8], rax
0186b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0186f 89442424                       mov        dword ptr [rsp + 0x24], eax
01873 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01878 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0187d 48ff742438                     push       qword ptr [rsp + 0x38]
01882 488f442430                     pop        qword ptr [rsp + 0x30]
01887 48894424f8                     mov        qword ptr [rsp - 8], rax
0188c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01890 89442438                       mov        dword ptr [rsp + 0x38], eax
01894 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01899 48894424f8                     mov        qword ptr [rsp - 8], rax
0189e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018a2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ab 48ff742448                     push       qword ptr [rsp + 0x48]
018b0 488f442440                     pop        qword ptr [rsp + 0x40]
018b5 48ff742450                     push       qword ptr [rsp + 0x50]
018ba 488f442448                     pop        qword ptr [rsp + 0x48]
018bf 48ff742458                     push       qword ptr [rsp + 0x58]
018c4 488f442450                     pop        qword ptr [rsp + 0x50]
018c9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ce 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018d5 89442458                       mov        dword ptr [rsp + 0x58], eax
018d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018de 48894424f8                     mov        qword ptr [rsp - 8], rax
018e3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018ea 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f3 48894424f8                     mov        qword ptr [rsp - 8], rax
018f8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018ff 89442460                       mov        dword ptr [rsp + 0x60], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01910 488f442468                     pop        qword ptr [rsp + 0x68]
01915 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0191d 488f442470                     pop        qword ptr [rsp + 0x70]
01922 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0192a 488f442478                     pop        qword ptr [rsp + 0x78]
0192f 48894424f8                     mov        qword ptr [rsp - 8], rax
01934 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0193b 89442464                       mov        dword ptr [rsp + 0x64], eax
0193f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01944 48894424f8                     mov        qword ptr [rsp - 8], rax
01949 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01950 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195c 48894424f8                     mov        qword ptr [rsp - 8], rax
01961 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01968 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0196f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01974 48894424f8                     mov        qword ptr [rsp - 8], rax
01979 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01980 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01994 488f842490000000               pop        qword ptr [rsp + 0x90]
0199c 48894424f8                     mov        qword ptr [rsp - 8], rax
019a1 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019a8 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b4 48894424f8                     mov        qword ptr [rsp - 8], rax
019b9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019c0 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019d4 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019db 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019e3 e8f82dafff                     call       0x7ff77b6cda60
019e8 0f1f8400e01a000d               nop        dword ptr [rax + rax + 0xd001ae0]
019f0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
019fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fe e85d4f1818                     call       0x7ff793d5fbe0
01a03 f4                             hlt        
01a04 be45ffffff                     mov        esi, 0xffffff45
01a09 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0e 8b442408                       mov        eax, dword ptr [rsp + 8]
01a12 890424                         mov        dword ptr [rsp], eax
01a15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a23 89442404                       mov        dword ptr [rsp + 4], eax
01a27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2c 48ff742410                     push       qword ptr [rsp + 0x10]
01a31 488f442408                     pop        qword ptr [rsp + 8]
01a36 48ff742418                     push       qword ptr [rsp + 0x18]
01a3b 488f442410                     pop        qword ptr [rsp + 0x10]
01a40 48894424f8                     mov        qword ptr [rsp - 8], rax
01a45 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a49 89442418                       mov        dword ptr [rsp + 0x18], eax
01a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a52 48894424f8                     mov        qword ptr [rsp - 8], rax
01a57 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a5b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a64 48894424f8                     mov        qword ptr [rsp - 8], rax
01a69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a6d 89442420                       mov        dword ptr [rsp + 0x20], eax
01a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a76 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a7f 89442424                       mov        dword ptr [rsp + 0x24], eax
01a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a88 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a8d 48ff742438                     push       qword ptr [rsp + 0x38]
01a92 488f442430                     pop        qword ptr [rsp + 0x30]
01a97 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01aa0 89442438                       mov        dword ptr [rsp + 0x38], eax
01aa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa9 48894424f8                     mov        qword ptr [rsp - 8], rax
01aae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ab2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abb 48ff742448                     push       qword ptr [rsp + 0x48]
01ac0 488f442440                     pop        qword ptr [rsp + 0x40]
01ac5 48ff742450                     push       qword ptr [rsp + 0x50]
01aca 488f442448                     pop        qword ptr [rsp + 0x48]
01acf 48ff742458                     push       qword ptr [rsp + 0x58]
01ad4 488f442450                     pop        qword ptr [rsp + 0x50]
01ad9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ade 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01ae5 89442458                       mov        dword ptr [rsp + 0x58], eax
01ae9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aee 48894424f8                     mov        qword ptr [rsp - 8], rax
01af3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01afa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01afe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b03 48894424f8                     mov        qword ptr [rsp - 8], rax
01b08 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b0f 89442460                       mov        dword ptr [rsp + 0x60], eax
01b13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b18 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b20 488f442468                     pop        qword ptr [rsp + 0x68]
01b25 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b2d 488f442478                     pop        qword ptr [rsp + 0x78]
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b3e 89442464                       mov        dword ptr [rsp + 0x64], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b53 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b64 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b6b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b77 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b83 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b97 488f842490000000               pop        qword ptr [rsp + 0x90]
01b9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bab 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01bb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb7 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bbf 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01bc6 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bcd 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bd5 90                             nop        
01bd6 90                             nop        
01bd7 e8042cafff                     call       0x7ff77b6cda60
01bdc 0f1f8400d41c000e               nop        dword ptr [rax + rax + 0xe001cd4]
01be4 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
01bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf2 e8694d1818                     call       0x7ff793d5fbe0
01bf7 f4                             hlt        
01bf8 b9ffffff7f                     mov        ecx, 0x7fffffff
01bfd 4c3bc9                         cmp        r9, rcx
01c00 bdffffffff                     mov        ebp, 0xffffffff
01c05 7c08                           jl         0x7ff77bbdae8f
01c07 400f95c5                       setne      bpl
01c0b 400fb6ed                       movzx      ebp, bpl
01c0f be45ffffff                     mov        esi, 0xffffff45
01c14 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c19 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c25 89442460                       mov        dword ptr [rsp + 0x60], eax
01c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c33 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c3a 89442464                       mov        dword ptr [rsp + 0x64], eax
01c3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c43 48894424f8                     mov        qword ptr [rsp - 8], rax
01c48 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c4f 89442468                       mov        dword ptr [rsp + 0x68], eax
01c53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c58 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c60 48894424f8                     mov        qword ptr [rsp - 8], rax
01c65 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c6c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c75 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7a 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c81 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c92 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01c99 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01ca0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca5 48894424f8                     mov        qword ptr [rsp - 8], rax
01caa 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01cb1 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbd 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cc5 488f842498000000               pop        qword ptr [rsp + 0x98]
01ccd 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cd5 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cdd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ce9 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01cf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01cfd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01d05 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
01d0d 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d15 90                             nop        
01d16 90                             nop        
01d17 e8c42aafff                     call       0x7ff77b6cda60
01d1c 0f1f8400141e000f               nop        dword ptr [rax + rax + 0xf001e14]
01d24 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
01d2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d32 e8294c1818                     call       0x7ff793d5fbe0
01d37 f4                             hlt        
01d38 be45ffffff                     mov        esi, 0xffffff45
01d3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d42 8b442408                       mov        eax, dword ptr [rsp + 8]
01d46 890424                         mov        dword ptr [rsp], eax
01d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d53 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d57 89442404                       mov        dword ptr [rsp + 4], eax
01d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d60 48ff742410                     push       qword ptr [rsp + 0x10]
01d65 488f442408                     pop        qword ptr [rsp + 8]
01d6a 48ff742418                     push       qword ptr [rsp + 0x18]
01d6f 488f442410                     pop        qword ptr [rsp + 0x10]
01d74 48894424f8                     mov        qword ptr [rsp - 8], rax
01d79 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d7d 89442418                       mov        dword ptr [rsp + 0x18], eax
01d81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d86 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d8f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d98 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01da1 89442420                       mov        dword ptr [rsp + 0x20], eax
01da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daa 48894424f8                     mov        qword ptr [rsp - 8], rax
01daf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01db3 89442424                       mov        dword ptr [rsp + 0x24], eax
01db7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01dc1 48ff742438                     push       qword ptr [rsp + 0x38]
01dc6 488f442430                     pop        qword ptr [rsp + 0x30]
01dcb 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01dd4 89442438                       mov        dword ptr [rsp + 0x38], eax
01dd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
01de2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01de6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01def 48ff742448                     push       qword ptr [rsp + 0x48]
01df4 488f442440                     pop        qword ptr [rsp + 0x40]
01df9 48ff742450                     push       qword ptr [rsp + 0x50]
01dfe 488f442448                     pop        qword ptr [rsp + 0x48]
01e03 48ff742458                     push       qword ptr [rsp + 0x58]
01e08 488f442450                     pop        qword ptr [rsp + 0x50]
01e0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e12 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e19 89442458                       mov        dword ptr [rsp + 0x58], eax
01e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e22 48894424f8                     mov        qword ptr [rsp - 8], rax
01e27 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e2e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e37 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e43 89442460                       mov        dword ptr [rsp + 0x60], eax
01e47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e51 48894424f8                     mov        qword ptr [rsp - 8], rax
01e56 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e5d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e66 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e72 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e83 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e8a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e96 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01ea2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eae 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01eb6 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01ebe 90                             nop        
01ebf e81c29afff                     call       0x7ff77b6cda60
01ec4 0f1f8400bc1f0010               nop        dword ptr [rax + rax + 0x10001fbc]
01ecc 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
01ed6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eda e8814a1818                     call       0x7ff793d5fbe0
01edf f4                             hlt        
01ee0 be45ffffff                     mov        esi, 0xffffff45
01ee5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eea 8b442408                       mov        eax, dword ptr [rsp + 8]
01eee 890424                         mov        dword ptr [rsp], eax
01ef1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef6 48894424f8                     mov        qword ptr [rsp - 8], rax
01efb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01eff 89442404                       mov        dword ptr [rsp + 4], eax
01f03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f08 48ff742410                     push       qword ptr [rsp + 0x10]
01f0d 488f442408                     pop        qword ptr [rsp + 8]
01f12 48ff742418                     push       qword ptr [rsp + 0x18]
01f17 488f442410                     pop        qword ptr [rsp + 0x10]
01f1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f21 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f25 89442418                       mov        dword ptr [rsp + 0x18], eax
01f29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f33 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f37 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f40 48894424f8                     mov        qword ptr [rsp - 8], rax
01f45 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f49 89442420                       mov        dword ptr [rsp + 0x20], eax
01f4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f52 48894424f8                     mov        qword ptr [rsp - 8], rax
01f57 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f5b 89442424                       mov        dword ptr [rsp + 0x24], eax
01f5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f64 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f69 48ff742438                     push       qword ptr [rsp + 0x38]
01f6e 488f442430                     pop        qword ptr [rsp + 0x30]
01f73 48894424f8                     mov        qword ptr [rsp - 8], rax
01f78 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f7c 89442438                       mov        dword ptr [rsp + 0x38], eax
01f80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f85 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f8e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f97 48ff742448                     push       qword ptr [rsp + 0x48]
01f9c 488f442440                     pop        qword ptr [rsp + 0x40]
01fa1 48ff742450                     push       qword ptr [rsp + 0x50]
01fa6 488f442448                     pop        qword ptr [rsp + 0x48]
01fab 48ff742458                     push       qword ptr [rsp + 0x58]
01fb0 488f442450                     pop        qword ptr [rsp + 0x50]
01fb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fba 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fc1 89442458                       mov        dword ptr [rsp + 0x58], eax
01fc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fca 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fd6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fdf 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01feb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff4 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffe 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02005 89442464                       mov        dword ptr [rsp + 0x64], eax
02009 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200e 48894424f8                     mov        qword ptr [rsp - 8], rax
02013 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0201a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02021 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02026 48894424f8                     mov        qword ptr [rsp - 8], rax
0202b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02032 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02039 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203e 48894424f8                     mov        qword ptr [rsp - 8], rax
02043 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0204a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0205e 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02066 90                             nop        
02067 e87427afff                     call       0x7ff77b6cda60
0206c 0f1f840064210011               nop        dword ptr [rax + rax + 0x11002164]
02074 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
0207e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02082 e8d9481818                     call       0x7ff793d5fbe0
02087 f4                             hlt        
02088 be3dffffff                     mov        esi, 0xffffff3d
0208d 48894424f8                     mov        qword ptr [rsp - 8], rax
02092 8b442408                       mov        eax, dword ptr [rsp + 8]
02096 890424                         mov        dword ptr [rsp], eax
02099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209e 48894424f8                     mov        qword ptr [rsp - 8], rax
020a3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020a7 89442404                       mov        dword ptr [rsp + 4], eax
020ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b0 48ff742410                     push       qword ptr [rsp + 0x10]
020b5 488f442408                     pop        qword ptr [rsp + 8]
020ba 48ff742418                     push       qword ptr [rsp + 0x18]
020bf 488f442410                     pop        qword ptr [rsp + 0x10]
020c4 48894424f8                     mov        qword ptr [rsp - 8], rax
020c9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020cd 89442418                       mov        dword ptr [rsp + 0x18], eax
020d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d6 48894424f8                     mov        qword ptr [rsp - 8], rax
020db 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020df 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e8 48894424f8                     mov        qword ptr [rsp - 8], rax
020ed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020f1 89442420                       mov        dword ptr [rsp + 0x20], eax
020f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fa 48894424f8                     mov        qword ptr [rsp - 8], rax
020ff 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02103 89442424                       mov        dword ptr [rsp + 0x24], eax
02107 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02111 48ff742438                     push       qword ptr [rsp + 0x38]
02116 488f442430                     pop        qword ptr [rsp + 0x30]
0211b 48894424f8                     mov        qword ptr [rsp - 8], rax
02120 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02124 89442438                       mov        dword ptr [rsp + 0x38], eax
02128 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212d 48894424f8                     mov        qword ptr [rsp - 8], rax
02132 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02136 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0213a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213f 48ff742448                     push       qword ptr [rsp + 0x48]
02144 488f442440                     pop        qword ptr [rsp + 0x40]
02149 48ff742450                     push       qword ptr [rsp + 0x50]
0214e 488f442448                     pop        qword ptr [rsp + 0x48]
02153 48ff742458                     push       qword ptr [rsp + 0x58]
02158 488f442450                     pop        qword ptr [rsp + 0x50]
0215d 48894424f8                     mov        qword ptr [rsp - 8], rax
02162 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02169 89442458                       mov        dword ptr [rsp + 0x58], eax
0216d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02172 48894424f8                     mov        qword ptr [rsp - 8], rax
02177 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0217e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02182 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02187 48894424f8                     mov        qword ptr [rsp - 8], rax
0218c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02193 89442460                       mov        dword ptr [rsp + 0x60], eax
02197 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219c 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
021a1 48894424f8                     mov        qword ptr [rsp - 8], rax
021a6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021ad 89442464                       mov        dword ptr [rsp + 0x64], eax
021b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b6 48894424f8                     mov        qword ptr [rsp - 8], rax
021bb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021c2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ce 48894424f8                     mov        qword ptr [rsp - 8], rax
021d3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021da 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e6 48894424f8                     mov        qword ptr [rsp - 8], rax
021eb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
021f2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
021f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fe 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02206 488f842490000000               pop        qword ptr [rsp + 0x90]
0220e 48894424f8                     mov        qword ptr [rsp - 8], rax
02213 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0221a 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02221 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02226 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0222e 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02236 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0223e 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02246 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0224e 48894424f8                     mov        qword ptr [rsp - 8], rax
02253 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0225a 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02261 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02266 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0226e 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02276 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
0227e 90                             nop        
0227f e85c25afff                     call       0x7ff77b6cda60
02284 0f1f84007c230012               nop        dword ptr [rax + rax + 0x1200237c]
0228c 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
02296 4883e4f0                       and        rsp, 0xfffffffffffffff0
0229a e8c1461818                     call       0x7ff793d5fbe0
0229f f4                             hlt        
022a0 be45ffffff                     mov        esi, 0xffffff45
022a5 48894424f8                     mov        qword ptr [rsp - 8], rax
022aa 8b442408                       mov        eax, dword ptr [rsp + 8]
022ae 890424                         mov        dword ptr [rsp], eax
022b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b6 48894424f8                     mov        qword ptr [rsp - 8], rax
022bb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022bf 89442404                       mov        dword ptr [rsp + 4], eax
022c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c8 48ff742410                     push       qword ptr [rsp + 0x10]
022cd 488f442408                     pop        qword ptr [rsp + 8]
022d2 48ff742418                     push       qword ptr [rsp + 0x18]
022d7 488f442410                     pop        qword ptr [rsp + 0x10]
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022e5 89442418                       mov        dword ptr [rsp + 0x18], eax
022e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ee 48894424f8                     mov        qword ptr [rsp - 8], rax
022f3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022f7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02300 48894424f8                     mov        qword ptr [rsp - 8], rax
02305 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02309 89442420                       mov        dword ptr [rsp + 0x20], eax
0230d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02312 48894424f8                     mov        qword ptr [rsp - 8], rax
02317 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0231b 89442424                       mov        dword ptr [rsp + 0x24], eax
0231f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02324 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02329 48ff742438                     push       qword ptr [rsp + 0x38]
0232e 488f442430                     pop        qword ptr [rsp + 0x30]
02333 48894424f8                     mov        qword ptr [rsp - 8], rax
02338 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0233c 89442438                       mov        dword ptr [rsp + 0x38], eax
02340 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02345 48894424f8                     mov        qword ptr [rsp - 8], rax
0234a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0234e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02352 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02357 48ff742448                     push       qword ptr [rsp + 0x48]
0235c 488f442440                     pop        qword ptr [rsp + 0x40]
02361 48ff742450                     push       qword ptr [rsp + 0x50]
02366 488f442448                     pop        qword ptr [rsp + 0x48]
0236b 48ff742458                     push       qword ptr [rsp + 0x58]
02370 488f442450                     pop        qword ptr [rsp + 0x50]
02375 89542458                       mov        dword ptr [rsp + 0x58], edx
02379 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02381 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02389 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
02391 90                             nop        
02392 90                             nop        
02393 e84824afff                     call       0x7ff77b6cda60
02398 0f1f840090240013               nop        dword ptr [rax + rax + 0x13002490]
023a0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
023aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
023ae e8ad451818                     call       0x7ff793d5fbe0
023b3 f4                             hlt        
023b4 be45ffffff                     mov        esi, 0xffffff45
023b9 48894424f8                     mov        qword ptr [rsp - 8], rax
023be 8b442408                       mov        eax, dword ptr [rsp + 8]
023c2 890424                         mov        dword ptr [rsp], eax
023c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ca 48894424f8                     mov        qword ptr [rsp - 8], rax
023cf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023d3 89442404                       mov        dword ptr [rsp + 4], eax
023d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023dc 48ff742410                     push       qword ptr [rsp + 0x10]
023e1 488f442408                     pop        qword ptr [rsp + 8]
023e6 48ff742418                     push       qword ptr [rsp + 0x18]
023eb 488f442410                     pop        qword ptr [rsp + 0x10]
023f0 48894424f8                     mov        qword ptr [rsp - 8], rax
023f5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023f9 89442418                       mov        dword ptr [rsp + 0x18], eax
023fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02402 48894424f8                     mov        qword ptr [rsp - 8], rax
02407 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0240b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0240f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02414 48894424f8                     mov        qword ptr [rsp - 8], rax
02419 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0241d 89442420                       mov        dword ptr [rsp + 0x20], eax
02421 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02426 48894424f8                     mov        qword ptr [rsp - 8], rax
0242b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0242f 89442424                       mov        dword ptr [rsp + 0x24], eax
02433 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02438 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0243d 48ff742438                     push       qword ptr [rsp + 0x38]
02442 488f442430                     pop        qword ptr [rsp + 0x30]
02447 48894424f8                     mov        qword ptr [rsp - 8], rax
0244c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02450 89442438                       mov        dword ptr [rsp + 0x38], eax
02454 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02459 48894424f8                     mov        qword ptr [rsp - 8], rax
0245e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02462 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02466 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246b 48ff742448                     push       qword ptr [rsp + 0x48]
02470 488f442440                     pop        qword ptr [rsp + 0x40]
02475 48ff742450                     push       qword ptr [rsp + 0x50]
0247a 488f442448                     pop        qword ptr [rsp + 0x48]
0247f 48ff742458                     push       qword ptr [rsp + 0x58]
02484 488f442450                     pop        qword ptr [rsp + 0x50]
02489 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02490 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02498 90                             nop        
02499 90                             nop        
0249a 90                             nop        
0249b e84023afff                     call       0x7ff77b6cda60
024a0 0f1f840098250014               nop        dword ptr [rax + rax + 0x14002598]
024a8 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
024b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024b6 e8a5441818                     call       0x7ff793d5fbe0
024bb f4                             hlt        
024bc be45ffffff                     mov        esi, 0xffffff45
024c1 48894424f8                     mov        qword ptr [rsp - 8], rax
024c6 8b442408                       mov        eax, dword ptr [rsp + 8]
024ca 890424                         mov        dword ptr [rsp], eax
024cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d2 48894424f8                     mov        qword ptr [rsp - 8], rax
024d7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024db 89442404                       mov        dword ptr [rsp + 4], eax
024df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e4 48ff742410                     push       qword ptr [rsp + 0x10]
024e9 488f442408                     pop        qword ptr [rsp + 8]
024ee 48ff742418                     push       qword ptr [rsp + 0x18]
024f3 488f442410                     pop        qword ptr [rsp + 0x10]
024f8 48894424f8                     mov        qword ptr [rsp - 8], rax
024fd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02501 89442418                       mov        dword ptr [rsp + 0x18], eax
02505 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250a 48894424f8                     mov        qword ptr [rsp - 8], rax
0250f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02513 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251c 48894424f8                     mov        qword ptr [rsp - 8], rax
02521 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02525 89442420                       mov        dword ptr [rsp + 0x20], eax
02529 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252e 48894424f8                     mov        qword ptr [rsp - 8], rax
02533 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02537 89442424                       mov        dword ptr [rsp + 0x24], eax
0253b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02540 48ff742438                     push       qword ptr [rsp + 0x38]
02545 488f442430                     pop        qword ptr [rsp + 0x30]
0254a 48894424f8                     mov        qword ptr [rsp - 8], rax
0254f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02553 89442438                       mov        dword ptr [rsp + 0x38], eax
02557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255c 48894424f8                     mov        qword ptr [rsp - 8], rax
02561 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02565 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256e 48ff742448                     push       qword ptr [rsp + 0x48]
02573 488f442440                     pop        qword ptr [rsp + 0x40]
02578 48ff742450                     push       qword ptr [rsp + 0x50]
0257d 488f442448                     pop        qword ptr [rsp + 0x48]
02582 48ff742458                     push       qword ptr [rsp + 0x58]
02587 488f442450                     pop        qword ptr [rsp + 0x50]
0258c 48894424f8                     mov        qword ptr [rsp - 8], rax
02591 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02598 89442458                       mov        dword ptr [rsp + 0x58], eax
0259c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a1 48894424f8                     mov        qword ptr [rsp - 8], rax
025a6 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025ad 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b6 48894424f8                     mov        qword ptr [rsp - 8], rax
025bb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025c2 89442460                       mov        dword ptr [rsp + 0x60], eax
025c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025cb 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025d3 488f442468                     pop        qword ptr [rsp + 0x68]
025d8 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025e0 488f442470                     pop        qword ptr [rsp + 0x70]
025e5 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
025ed 488f442478                     pop        qword ptr [rsp + 0x78]
025f2 48894424f8                     mov        qword ptr [rsp - 8], rax
025f7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
025fe 89442464                       mov        dword ptr [rsp + 0x64], eax
02602 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02607 48894424f8                     mov        qword ptr [rsp - 8], rax
0260c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02613 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0261a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261f 48894424f8                     mov        qword ptr [rsp - 8], rax
02624 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0262b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 48894424f8                     mov        qword ptr [rsp - 8], rax
0263c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02643 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0264a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02657 488f842490000000               pop        qword ptr [rsp + 0x90]
0265f 48894424f8                     mov        qword ptr [rsp - 8], rax
02664 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0266b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02672 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02677 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0267f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02687 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0268f 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
02697 e84421afff                     call       0x7ff77b6cda60
0269c 0f1f840094270015               nop        dword ptr [rax + rax + 0x15002794]
026a4 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
026ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
026b2 e8a9421818                     call       0x7ff793d5fbe0
026b7 f4                             hlt        
026b8 4533d2                         xor        r10d, r10d
026bb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
026c3 e906dbffff                     jmp        0x7ff77bbd944e
026c8 4533d2                         xor        r10d, r10d
026cb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026d0 e925dbffff                     jmp        0x7ff77bbd947a
026d5 4533d2                         xor        r10d, r10d
026d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026dd e93fdbffff                     jmp        0x7ff77bbd94a1
026e2 4533d2                         xor        r10d, r10d
026e5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026ea e95edbffff                     jmp        0x7ff77bbd94cd
026ef 4533d2                         xor        r10d, r10d
026f2 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026f7 e97bdbffff                     jmp        0x7ff77bbd94f7
026fc 4533d2                         xor        r10d, r10d
026ff 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02704 e9a0dbffff                     jmp        0x7ff77bbd9529
02709 4533d2                         xor        r10d, r10d
0270c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02714 e9bddbffff                     jmp        0x7ff77bbd9556
02719 4533d2                         xor        r10d, r10d
0271c 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02724 e9d3dbffff                     jmp        0x7ff77bbd957c
02729 bebeffffff                     mov        esi, 0xffffffbe
0272e 48894424f8                     mov        qword ptr [rsp - 8], rax
02733 8b442408                       mov        eax, dword ptr [rsp + 8]
02737 890424                         mov        dword ptr [rsp], eax
0273a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273f 48894424f8                     mov        qword ptr [rsp - 8], rax
02744 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02748 89442404                       mov        dword ptr [rsp + 4], eax
0274c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02751 48ff742410                     push       qword ptr [rsp + 0x10]
02756 488f442408                     pop        qword ptr [rsp + 8]
0275b 48ff742418                     push       qword ptr [rsp + 0x18]
02760 488f442410                     pop        qword ptr [rsp + 0x10]
02765 48894424f8                     mov        qword ptr [rsp - 8], rax
0276a 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0276e 89442418                       mov        dword ptr [rsp + 0x18], eax
02772 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02777 48894424f8                     mov        qword ptr [rsp - 8], rax
0277c 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02780 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02784 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02789 48894424f8                     mov        qword ptr [rsp - 8], rax
0278e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02792 89442420                       mov        dword ptr [rsp + 0x20], eax
02796 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279b 48894424f8                     mov        qword ptr [rsp - 8], rax
027a0 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
027a4 89442424                       mov        dword ptr [rsp + 0x24], eax
027a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ad 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
027b2 48ff742438                     push       qword ptr [rsp + 0x38]
027b7 488f442430                     pop        qword ptr [rsp + 0x30]
027bc 48894424f8                     mov        qword ptr [rsp - 8], rax
027c1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027c5 89442438                       mov        dword ptr [rsp + 0x38], eax
027c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ce 48894424f8                     mov        qword ptr [rsp - 8], rax
027d3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
027d7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e0 48ff742448                     push       qword ptr [rsp + 0x48]
027e5 488f442440                     pop        qword ptr [rsp + 0x40]
027ea 48ff742450                     push       qword ptr [rsp + 0x50]
027ef 488f442448                     pop        qword ptr [rsp + 0x48]
027f4 48ff742458                     push       qword ptr [rsp + 0x58]
027f9 488f442450                     pop        qword ptr [rsp + 0x50]
027fe 90                             nop        
027ff e8dc1fafff                     call       0x7ff77b6cda60
02804 0f1f8400fc280016               nop        dword ptr [rax + rax + 0x160028fc]
0280c 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
02816 4883e4f0                       and        rsp, 0xfffffffffffffff0
0281a e841411818                     call       0x7ff793d5fbe0
0281f f4                             hlt        
02820 be85ffffff                     mov        esi, 0xffffff85
02825 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02829 48894424f8                     mov        qword ptr [rsp - 8], rax
0282e 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02832 890424                         mov        dword ptr [rsp], eax
02835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283a 48894424f8                     mov        qword ptr [rsp - 8], rax
0283f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02843 89442404                       mov        dword ptr [rsp + 4], eax
02847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284c 48894424f8                     mov        qword ptr [rsp - 8], rax
02851 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02855 89442408                       mov        dword ptr [rsp + 8], eax
02859 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285e 48894424f8                     mov        qword ptr [rsp - 8], rax
02863 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02867 8944240c                       mov        dword ptr [rsp + 0xc], eax
0286b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02870 48894424f8                     mov        qword ptr [rsp - 8], rax
02875 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02879 89442410                       mov        dword ptr [rsp + 0x10], eax
0287d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02882 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02887 48ff742438                     push       qword ptr [rsp + 0x38]
0288c 488f442420                     pop        qword ptr [rsp + 0x20]
02891 48894424f8                     mov        qword ptr [rsp - 8], rax
02896 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0289a 89442414                       mov        dword ptr [rsp + 0x14], eax
0289e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a3 48894424f8                     mov        qword ptr [rsp - 8], rax
028a8 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028ac 89442428                       mov        dword ptr [rsp + 0x28], eax
028b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b5 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
028ba 90                             nop        
028bb e8201fafff                     call       0x7ff77b6cda60
028c0 0f1f8400b8290017               nop        dword ptr [rax + rax + 0x170029b8]
028c8 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
028d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028d6 e885401818                     call       0x7ff793d5fbe0
028db f4                             hlt        
028dc bef6ffffff                     mov        esi, 0xfffffff6
028e1 90                             nop        
028e2 90                             nop        
028e3 e8f81eafff                     call       0x7ff77b6cda60
028e8 0f1f8400e0290018               nop        dword ptr [rax + rax + 0x180029e0]
028f0 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
028fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
028fe e85d401818                     call       0x7ff793d5fbe0
02903 f4                             hlt        
02904 be5d000000                     mov        esi, 0x5d
02909 90                             nop        
0290a 90                             nop        
0290b e8d01eafff                     call       0x7ff77b6cda60
02910 0f1f8400082a0019               nop        dword ptr [rax + rax + 0x19002a08]
02918 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
02922 4883e4f0                       and        rsp, 0xfffffffffffffff0
02926 e835401818                     call       0x7ff793d5fbe0
0292b f4                             hlt        
0292c bef6ffffff                     mov        esi, 0xfffffff6
02931 418beb                         mov        ebp, r11d
02934 90                             nop        
02935 90                             nop        
02936 90                             nop        
02937 e8a41eafff                     call       0x7ff77b6cda60
0293c 0f1f8400342a001a               nop        dword ptr [rax + rax + 0x1a002a34]
02944 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
0294e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02952 e809401818                     call       0x7ff793d5fbe0
02957 f4                             hlt        
02958 bef6ffffff                     mov        esi, 0xfffffff6
0295d 8be9                           mov        ebp, ecx
0295f e87c1eafff                     call       0x7ff77b6cda60
02964 0f1f84005c2a001b               nop        dword ptr [rax + rax + 0x1b002a5c]
0296c 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
02976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0297a e8e13f1818                     call       0x7ff793d5fbe0
0297f f4                             hlt        
02980 bef6ffffff                     mov        esi, 0xfffffff6
02985 418beb                         mov        ebp, r11d
02988 90                             nop        
02989 90                             nop        
0298a 90                             nop        
0298b e8501eafff                     call       0x7ff77b6cda60
02990 0f1f8400882a001c               nop        dword ptr [rax + rax + 0x1c002a88]
02998 48bf80fe1254f77f0000           movabs     rdi, 0x7ff75412fe80
029a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029a6 e8b53f1818                     call       0x7ff793d5fbe0
029ab f4                             hlt        
029ac eb00                           jmp        0x7ff77bbdbc2e
029ae 488bf0                         mov        rsi, rax
029b1 e912e1ffff                     jmp        0x7ff77bbd9d48
029b6 49ba179dbd7bf77f0000           movabs     r10, 0x7ff77bbd9d17
029c0 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
029c7 e91467b5ff                     jmp        0x7ff77b732360
029cc e88f35b4ff                     call       0x7ff77b71f1e0
029d1 e958d6ffff                     jmp        0x7ff77bbd92ae
029d6 f4                             hlt        
029d7 f4                             hlt        
