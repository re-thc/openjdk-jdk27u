00000 e8bb4ad719                     call       0x7f23c5942340
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
00028 0f85ae290000                   jne        0x7f23abbd025c
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
0018f 49ba704ab0c5237f0000           movabs     r10, 0x7f23c5b04a70
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f8416250000                   je         0x7f23abbcff48
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbf9060000                 cmp        r11d, 0x6f9
001c0 0f856a260000                   jne        0x7f23abbd00b0
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f84fc240000                   je         0x7f23abbcff58
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f8540260000                   jne        0x7f23abbd00b0
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84dd240000                   je         0x7f23abbcff65
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f8514260000                   jne        0x7f23abbd00b0
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f84c3240000                   je         0x7f23abbcff72
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f85ed250000                   jne        0x7f23abbd00b0
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f84a1240000                   je         0x7f23abbcff7f
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f85be250000                   jne        0x7f23abbd00b0
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f8484240000                   je         0x7f23abbcff8c
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f8594250000                   jne        0x7f23abbd00b0
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f845f240000                   je         0x7f23abbcff99
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbfc060000                 cmp        r11d, 0x6fc
002c8 0f8562250000                   jne        0x7f23abbd00b0
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f844a240000                   je         0x7f23abbcffa9
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fafb060000                 cmp        r10d, 0x6fb
002ee 0f853c250000                   jne        0x7f23abbd00b0
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f842f240000                   je         0x7f23abbcffb9
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8421240000                   je         0x7f23abbcffb9
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f8413240000                   je         0x7f23abbcffb9
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b4204                       mov        r8d, dword ptr [r10 + 4]
00341 458d50f9                       lea        r10d, [r8 - 7]
00345 4585d2                         test       r10d, r10d
00348 0f8ceb230000                   jl         0x7f23abbcffb9
0034e 4183c0f9                       add        r8d, -7
00352 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0035a e961020000                     jmp        0x7f23abbcde40
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
0039a 0f8d68100000                   jge        0x7f23abbcec88
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d19120000                   jge        0x7f23abbcee6c
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8dfc130000                   jge        0x7f23abbcf078
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bf9                           mov        edi, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8de9150000                   jge        0x7f23abbcf28c
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
00477 0f8ef70b0000                   jle        0x7f23abbce8f4
0047d 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
00484 0f8f76170000                   jg         0x7f23abbcf480
0048a 4181fbffff0100                 cmp        r11d, 0x1ffff
00491 0f8fb1180000                   jg         0x7f23abbcf5c8
00497 4181f9ffff0300                 cmp        r9d, 0x3ffff
0049e 0f8f4c1a0000                   jg         0x7f23abbcf770
004a4 8bc9                           mov        ecx, ecx
004a6 81f900000010                   cmp        ecx, 0x10000000
004ac 0f83e61b0000                   jae        0x7f23abbcf918
004b2 48c1e712                       shl        rdi, 0x12
004b6 4c63c1                         movsxd     r8, ecx
004b9 4d63db                         movsxd     r11, r11d
004bc 49c1e024                       shl        r8, 0x24
004c0 4c0bc7                         or         r8, rdi
004c3 4d0bc3                         or         r8, r11
004c6 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004ce 443b0c24                       cmp        r9d, dword ptr [rsp]
004d2 0f83b4090000                   jae        0x7f23abbce70c
004d8 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e0 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
004e8 4f8944d908                     mov        qword ptr [r9 + r11*8 + 8], r8
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8db7000000                   jge        0x7f23abbcde32
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
0054d 0f8d5d1d0000                   jge        0x7f23abbcfb30
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
00590 0f8d2e1e0000                   jge        0x7f23abbcfc44
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
005cd 0f8d83040000                   jge        0x7f23abbce2d6
005d3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d8 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005dc 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005e4 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005ec 458b4a04                       mov        r9d, dword ptr [r10 + 4]
005f0 453bd9                         cmp        r11d, r9d
005f3 0f83ff040000                   jae        0x7f23abbce378
005f9 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
005fe 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00602 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00609 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00610 458b4104                       mov        r8d, dword ptr [r9 + 4]
00614 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00619 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00621 413bc8                         cmp        ecx, r8d
00624 0f83d6050000                   jae        0x7f23abbce480
0062a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0062f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00633 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0063b 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
00643 458b4204                       mov        r8d, dword ptr [r10 + 4]
00647 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
0064c 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
00654 453bd8                         cmp        r11d, r8d
00657 0f83d3060000                   jae        0x7f23abbce5b0
0065d 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00662 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0066a 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00671 ffc5                           inc        ebp
00673 896c2404                       mov        dword ptr [rsp + 4], ebp
00677 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
0067b 0f8d48040000                   jge        0x7f23abbce349
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
00740 0f84720a0000                   je         0x7f23abbcea38
00746 4183fa3f                       cmp        r10d, 0x3f
0074a 0f8f440c0000                   jg         0x7f23abbcec14
00750 41b840000000                   mov        r8d, 0x40
00756 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
0075b 453bd0                         cmp        r10d, r8d
0075e 7e43                           jle        0x7f23abbce023
00760 458bda                         mov        r11d, r10d
00763 452bd8                         sub        r11d, r8d
00766 4183f840                       cmp        r8d, 0x40
0076a 0f8d5c1d0000                   jge        0x7f23abbcfd4c
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
007a1 eb21                           jmp        0x7f23abbce044
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
007e2 0f8ca8fbffff                   jl         0x7f23abbcdc10
007e8 458d50c0                       lea        r10d, [r8 - 0x40]
007ec 4489542440                     mov        dword ptr [rsp + 0x40], r10d
007f1 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
007f5 83c5f8                         add        ebp, -8
007f8 896c2430                       mov        dword ptr [rsp + 0x30], ebp
007fc 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00800 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00804 83c1f0                         add        ecx, -0x10
00807 83f908                         cmp        ecx, 8
0080a 0f8cf8010000                   jl         0x7f23abbce288
00810 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00815 4183c2e8                       add        r10d, -0x18
00819 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00821 0f8238fbffff                   jb         0x7f23abbcdbdf
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
009e4 90                             nop        
009e5 90                             nop        
009e6 90                             nop        
009e7 e8f4f7afff                     call       0x7f23ab6cda60
009ec 0f1f8400e40a0001               nop        dword ptr [rax + rax + 0x1000ae4]
009f4 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
009fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a02 e89969b419                     call       0x7f23c5714c20
00a07 f4                             hlt        
00a08 85c9                           test       ecx, ecx
00a0a 7f08                           jg         0x7f23abbce294
00a0c 4533d2                         xor        r10d, r10d
00a0f e958f9ffff                     jmp        0x7f23abbcdbec
00a14 8be9                           mov        ebp, ecx
00a16 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a1e 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a22 90                             nop        
00a23 e8b819b6ff                     call       0x7f23ab72fc60
00a28 0f1f8400200b0002               nop        dword ptr [rax + rax + 0x2000b20]
00a30 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a35 41c1e003                       shl        r8d, 3
00a39 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a3e 41c1e303                       shl        r11d, 3
00a42 452bd8                         sub        r11d, r8d
00a45 4181c3c0000000                 add        r11d, 0xc0
00a4c c462a1f7d0                     shlx       r10, rax, r11
00a51 e916f9ffff                     jmp        0x7f23abbcdbec
00a56 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a5e 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a66 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a6b 4d3bd3                         cmp        r10, r11
00a6e 7f26                           jg         0x7f23abbce316
00a70 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00a75 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00a7a 0f85941e0000                   jne        0x7f23abbd0194
00a80 418bc2                         mov        eax, r10d
00a83 4881c430010000                 add        rsp, 0x130
00a8a 5d                             pop        rbp
00a8b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a8f 0f87311f0000                   ja         0x7f23abbd0246
00a95 c3                             ret        
00a96 48be30b172e200000000           movabs     rsi, 0xe272b130
00aa0 90                             nop        
00aa1 90                             nop        
00aa2 90                             nop        
00aa3 e83819b6ff                     call       0x7f23ab72fc60
00aa8 0f1f8400a00b0003               nop        dword ptr [rax + rax + 0x3000ba0]
00ab0 4885c0                         test       rax, rax
00ab3 0f84331e0000                   je         0x7f23abbd016c
00ab9 488bf0                         mov        rsi, rax
00abc 4881c430010000                 add        rsp, 0x130
00ac3 5d                             pop        rbp
00ac4 e91778afff                     jmp        0x7f23ab6c5b60
00ac9 4533d2                         xor        r10d, r10d
00acc 4533c0                         xor        r8d, r8d
00acf 4533db                         xor        r11d, r11d
00ad2 33c9                           xor        ecx, ecx
00ad4 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00adc 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00ae4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00aec 898c2404010000                 mov        dword ptr [rsp + 0x104], ecx
00af3 e9e1fbffff                     jmp        0x7f23abbcdf59
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
00bdf e8fcf5afff                     call       0x7f23ab6cda60
00be4 0f1f8400dc0c0004               nop        dword ptr [rax + rax + 0x4000cdc]
00bec 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
00bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfa e8a167b419                     call       0x7f23c5714c20
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
00d0f e8ccf4afff                     call       0x7f23ab6cda60
00d14 0f1f84000c0e0005               nop        dword ptr [rax + rax + 0x5000e0c]
00d1c 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
00d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d2a e87166b419                     call       0x7f23c5714c20
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
00e6b e870f3afff                     call       0x7f23ab6cda60
00e70 0f1f8400680f0006               nop        dword ptr [rax + rax + 0x6000f68]
00e78 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
00e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e86 e81565b419                     call       0x7f23c5714c20
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
00fa0 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00fa8 488f442478                     pop        qword ptr [rsp + 0x78]
00fad 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb2 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fb9 89442464                       mov        dword ptr [rsp + 0x64], eax
00fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fce 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fda 48894424f8                     mov        qword ptr [rsp - 8], rax
00fdf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fe6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00fed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00ffe 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0100a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01012 488f842490000000               pop        qword ptr [rsp + 0x90]
0101a 48894424f8                     mov        qword ptr [rsp - 8], rax
0101f 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01026 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
0102d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01032 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0103a 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01042 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0104a 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
01052 90                             nop        
01053 e888f1afff                     call       0x7f23ab6cda60
01058 0f1f840050110007               nop        dword ptr [rax + rax + 0x7001150]
01060 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
0106a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0106e e82d63b419                     call       0x7f23c5714c20
01073 f4                             hlt        
01074 4533c0                         xor        r8d, r8d
01077 493bc8                         cmp        rcx, r8
0107a bdffffffff                     mov        ebp, 0xffffffff
0107f 7c08                           jl         0x7f23abbce909
01081 400f95c5                       setne      bpl
01085 400fb6ed                       movzx      ebp, bpl
01089 be45ffffff                     mov        esi, 0xffffff45
0108e 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01093 48894424f8                     mov        qword ptr [rsp - 8], rax
01098 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0109f 89442460                       mov        dword ptr [rsp + 0x60], eax
010a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010a8 48894424f8                     mov        qword ptr [rsp - 8], rax
010ad 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010b4 89442464                       mov        dword ptr [rsp + 0x64], eax
010b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010bd 48894424f8                     mov        qword ptr [rsp - 8], rax
010c2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010c9 89442468                       mov        dword ptr [rsp + 0x68], eax
010cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d2 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
010da 488f842480000000               pop        qword ptr [rsp + 0x80]
010e2 48894424f8                     mov        qword ptr [rsp - 8], rax
010e7 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010ee 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f7 48894424f8                     mov        qword ptr [rsp - 8], rax
010fc 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01103 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0110a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110f 48894424f8                     mov        qword ptr [rsp - 8], rax
01114 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0111b 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01122 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01127 48894424f8                     mov        qword ptr [rsp - 8], rax
0112c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01133 89842490000000                 mov        dword ptr [rsp + 0x90], eax
0113a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0113f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01147 488f842498000000               pop        qword ptr [rsp + 0x98]
0114f 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01157 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
0115f 48894424f8                     mov        qword ptr [rsp - 8], rax
01164 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0116b 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01172 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01177 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0117f 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01187 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0118f 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01197 e844f0afff                     call       0x7f23ab6cda60
0119c 0f1f840094120008               nop        dword ptr [rax + rax + 0x8001294]
011a4 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
011ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
011b2 e8e961b419                     call       0x7f23c5714c20
011b7 f4                             hlt        
011b8 be45ffffff                     mov        esi, 0xffffff45
011bd 48894424f8                     mov        qword ptr [rsp - 8], rax
011c2 8b442408                       mov        eax, dword ptr [rsp + 8]
011c6 890424                         mov        dword ptr [rsp], eax
011c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ce 48894424f8                     mov        qword ptr [rsp - 8], rax
011d3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011d7 89442404                       mov        dword ptr [rsp + 4], eax
011db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e0 48ff742410                     push       qword ptr [rsp + 0x10]
011e5 488f442408                     pop        qword ptr [rsp + 8]
011ea 48ff742418                     push       qword ptr [rsp + 0x18]
011ef 488f442410                     pop        qword ptr [rsp + 0x10]
011f4 48894424f8                     mov        qword ptr [rsp - 8], rax
011f9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
011fd 89442418                       mov        dword ptr [rsp + 0x18], eax
01201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01206 48894424f8                     mov        qword ptr [rsp - 8], rax
0120b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0120f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01213 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01218 48894424f8                     mov        qword ptr [rsp - 8], rax
0121d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01221 89442420                       mov        dword ptr [rsp + 0x20], eax
01225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122a 48894424f8                     mov        qword ptr [rsp - 8], rax
0122f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01233 89442424                       mov        dword ptr [rsp + 0x24], eax
01237 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01241 48ff742438                     push       qword ptr [rsp + 0x38]
01246 488f442430                     pop        qword ptr [rsp + 0x30]
0124b 48894424f8                     mov        qword ptr [rsp - 8], rax
01250 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01254 89442438                       mov        dword ptr [rsp + 0x38], eax
01258 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125d 48894424f8                     mov        qword ptr [rsp - 8], rax
01262 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01266 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0126a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126f 48ff742448                     push       qword ptr [rsp + 0x48]
01274 488f442440                     pop        qword ptr [rsp + 0x40]
01279 48ff742450                     push       qword ptr [rsp + 0x50]
0127e 488f442448                     pop        qword ptr [rsp + 0x48]
01283 48ff742458                     push       qword ptr [rsp + 0x58]
01288 488f442450                     pop        qword ptr [rsp + 0x50]
0128d 48894424f8                     mov        qword ptr [rsp - 8], rax
01292 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01299 89442458                       mov        dword ptr [rsp + 0x58], eax
0129d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a2 48894424f8                     mov        qword ptr [rsp - 8], rax
012a7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012ae 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b7 48894424f8                     mov        qword ptr [rsp - 8], rax
012bc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012c3 89442460                       mov        dword ptr [rsp + 0x60], eax
012c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cc 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012d4 488f442468                     pop        qword ptr [rsp + 0x68]
012d9 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012e1 488f442478                     pop        qword ptr [rsp + 0x78]
012e6 48894424f8                     mov        qword ptr [rsp - 8], rax
012eb 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012f2 89442464                       mov        dword ptr [rsp + 0x64], eax
012f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01300 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01307 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0130e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01313 48894424f8                     mov        qword ptr [rsp - 8], rax
01318 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0131f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01326 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132b 48894424f8                     mov        qword ptr [rsp - 8], rax
01330 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01337 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0133e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01343 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0134b 488f842490000000               pop        qword ptr [rsp + 0x90]
01353 48894424f8                     mov        qword ptr [rsp - 8], rax
01358 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0135f 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01366 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136b 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01373 e868eeafff                     call       0x7f23ab6cda60
01378 0f1f840070140009               nop        dword ptr [rax + rax + 0x9001470]
01380 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
0138a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0138e e80d60b419                     call       0x7f23c5714c20
01393 f4                             hlt        
01394 be45ffffff                     mov        esi, 0xffffff45
01399 48894424f8                     mov        qword ptr [rsp - 8], rax
0139e 8b442408                       mov        eax, dword ptr [rsp + 8]
013a2 890424                         mov        dword ptr [rsp], eax
013a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013aa 48894424f8                     mov        qword ptr [rsp - 8], rax
013af 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013b3 89442404                       mov        dword ptr [rsp + 4], eax
013b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013bc 48ff742410                     push       qword ptr [rsp + 0x10]
013c1 488f442408                     pop        qword ptr [rsp + 8]
013c6 48ff742418                     push       qword ptr [rsp + 0x18]
013cb 488f442410                     pop        qword ptr [rsp + 0x10]
013d0 48894424f8                     mov        qword ptr [rsp - 8], rax
013d5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013d9 89442418                       mov        dword ptr [rsp + 0x18], eax
013dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013e7 e8f4edafff                     call       0x7f23ab6cda60
013ec 0f1f8400e414000a               nop        dword ptr [rax + rax + 0xa0014e4]
013f4 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
013fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01402 e8995fb419                     call       0x7f23c5714c20
01407 f4                             hlt        
01408 be45ffffff                     mov        esi, 0xffffff45
0140d 48894424f8                     mov        qword ptr [rsp - 8], rax
01412 8b442408                       mov        eax, dword ptr [rsp + 8]
01416 890424                         mov        dword ptr [rsp], eax
01419 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141e 48894424f8                     mov        qword ptr [rsp - 8], rax
01423 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01427 89442404                       mov        dword ptr [rsp + 4], eax
0142b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01430 48ff742410                     push       qword ptr [rsp + 0x10]
01435 488f442408                     pop        qword ptr [rsp + 8]
0143a 48ff742418                     push       qword ptr [rsp + 0x18]
0143f 488f442410                     pop        qword ptr [rsp + 0x10]
01444 48894424f8                     mov        qword ptr [rsp - 8], rax
01449 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0144d 89442418                       mov        dword ptr [rsp + 0x18], eax
01451 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01456 48894424f8                     mov        qword ptr [rsp - 8], rax
0145b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0145f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01463 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01468 48894424f8                     mov        qword ptr [rsp - 8], rax
0146d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01471 89442420                       mov        dword ptr [rsp + 0x20], eax
01475 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147a 48894424f8                     mov        qword ptr [rsp - 8], rax
0147f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01483 89442424                       mov        dword ptr [rsp + 0x24], eax
01487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01491 48ff742438                     push       qword ptr [rsp + 0x38]
01496 488f442430                     pop        qword ptr [rsp + 0x30]
0149b 48894424f8                     mov        qword ptr [rsp - 8], rax
014a0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014a4 89442438                       mov        dword ptr [rsp + 0x38], eax
014a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ad 48894424f8                     mov        qword ptr [rsp - 8], rax
014b2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014b6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bf 48ff742448                     push       qword ptr [rsp + 0x48]
014c4 488f442440                     pop        qword ptr [rsp + 0x40]
014c9 48ff742450                     push       qword ptr [rsp + 0x50]
014ce 488f442448                     pop        qword ptr [rsp + 0x48]
014d3 48ff742458                     push       qword ptr [rsp + 0x58]
014d8 488f442450                     pop        qword ptr [rsp + 0x50]
014dd 48894424f8                     mov        qword ptr [rsp - 8], rax
014e2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014e9 89442458                       mov        dword ptr [rsp + 0x58], eax
014ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f2 48894424f8                     mov        qword ptr [rsp - 8], rax
014f7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
014fe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01507 48894424f8                     mov        qword ptr [rsp - 8], rax
0150c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01513 89442460                       mov        dword ptr [rsp + 0x60], eax
01517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01524 488f442468                     pop        qword ptr [rsp + 0x68]
01529 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01531 488f442470                     pop        qword ptr [rsp + 0x70]
01536 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0153e 488f442478                     pop        qword ptr [rsp + 0x78]
01543 48894424f8                     mov        qword ptr [rsp - 8], rax
01548 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0154f 89442464                       mov        dword ptr [rsp + 0x64], eax
01553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01558 48894424f8                     mov        qword ptr [rsp - 8], rax
0155d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01564 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0156b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01570 48894424f8                     mov        qword ptr [rsp - 8], rax
01575 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0157c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01583 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01588 48894424f8                     mov        qword ptr [rsp - 8], rax
0158d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01594 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0159b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015a8 488f842490000000               pop        qword ptr [rsp + 0x90]
015b0 48894424f8                     mov        qword ptr [rsp - 8], rax
015b5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015bc 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c8 90                             nop        
015c9 90                             nop        
015ca 90                             nop        
015cb e810ecafff                     call       0x7f23ab6cda60
015d0 0f1f8400c816000b               nop        dword ptr [rax + rax + 0xb0016c8]
015d8 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
015e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015e6 e8b55db419                     call       0x7f23c5714c20
015eb f4                             hlt        
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 48894424f8                     mov        qword ptr [rsp - 8], rax
015f6 8b442408                       mov        eax, dword ptr [rsp + 8]
015fa 890424                         mov        dword ptr [rsp], eax
015fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01602 48894424f8                     mov        qword ptr [rsp - 8], rax
01607 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0160b 89442404                       mov        dword ptr [rsp + 4], eax
0160f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01614 48ff742410                     push       qword ptr [rsp + 0x10]
01619 488f442408                     pop        qword ptr [rsp + 8]
0161e 48ff742418                     push       qword ptr [rsp + 0x18]
01623 488f442410                     pop        qword ptr [rsp + 0x10]
01628 48894424f8                     mov        qword ptr [rsp - 8], rax
0162d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01631 89442418                       mov        dword ptr [rsp + 0x18], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 48894424f8                     mov        qword ptr [rsp - 8], rax
0163f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01643 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48894424f8                     mov        qword ptr [rsp - 8], rax
01651 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01655 89442420                       mov        dword ptr [rsp + 0x20], eax
01659 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165e 48894424f8                     mov        qword ptr [rsp - 8], rax
01663 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01667 89442424                       mov        dword ptr [rsp + 0x24], eax
0166b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01670 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01675 48ff742438                     push       qword ptr [rsp + 0x38]
0167a 488f442430                     pop        qword ptr [rsp + 0x30]
0167f 48894424f8                     mov        qword ptr [rsp - 8], rax
01684 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01688 89442438                       mov        dword ptr [rsp + 0x38], eax
0168c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01691 48894424f8                     mov        qword ptr [rsp - 8], rax
01696 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0169a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0169e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a3 48ff742448                     push       qword ptr [rsp + 0x48]
016a8 488f442440                     pop        qword ptr [rsp + 0x40]
016ad 48ff742450                     push       qword ptr [rsp + 0x50]
016b2 488f442448                     pop        qword ptr [rsp + 0x48]
016b7 48ff742458                     push       qword ptr [rsp + 0x58]
016bc 488f442450                     pop        qword ptr [rsp + 0x50]
016c1 48894424f8                     mov        qword ptr [rsp - 8], rax
016c6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016cd 89442458                       mov        dword ptr [rsp + 0x58], eax
016d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d6 48894424f8                     mov        qword ptr [rsp - 8], rax
016db 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016e2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016eb 48894424f8                     mov        qword ptr [rsp - 8], rax
016f0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016f7 89442460                       mov        dword ptr [rsp + 0x60], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01708 488f442468                     pop        qword ptr [rsp + 0x68]
0170d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01715 488f442470                     pop        qword ptr [rsp + 0x70]
0171a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01722 488f442478                     pop        qword ptr [rsp + 0x78]
01727 48894424f8                     mov        qword ptr [rsp - 8], rax
0172c 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01733 89442464                       mov        dword ptr [rsp + 0x64], eax
01737 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173c 48894424f8                     mov        qword ptr [rsp - 8], rax
01741 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01748 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0174f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01754 48894424f8                     mov        qword ptr [rsp - 8], rax
01759 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01760 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01767 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01778 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0178c 488f842490000000               pop        qword ptr [rsp + 0x90]
01794 48894424f8                     mov        qword ptr [rsp - 8], rax
01799 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
017a0 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ac 48894424f8                     mov        qword ptr [rsp - 8], rax
017b1 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017b8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017cc 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017d4 90                             nop        
017d5 90                             nop        
017d6 90                             nop        
017d7 e804eaafff                     call       0x7f23ab6cda60
017dc 0f1f8400d418000c               nop        dword ptr [rax + rax + 0xc0018d4]
017e4 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
017ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
017f2 e8a95bb419                     call       0x7f23c5714c20
017f7 f4                             hlt        
017f8 be45ffffff                     mov        esi, 0xffffff45
017fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01802 8b442408                       mov        eax, dword ptr [rsp + 8]
01806 890424                         mov        dword ptr [rsp], eax
01809 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180e 48894424f8                     mov        qword ptr [rsp - 8], rax
01813 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01817 89442404                       mov        dword ptr [rsp + 4], eax
0181b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01820 48ff742410                     push       qword ptr [rsp + 0x10]
01825 488f442408                     pop        qword ptr [rsp + 8]
0182a 48ff742418                     push       qword ptr [rsp + 0x18]
0182f 488f442410                     pop        qword ptr [rsp + 0x10]
01834 48894424f8                     mov        qword ptr [rsp - 8], rax
01839 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0183d 89442418                       mov        dword ptr [rsp + 0x18], eax
01841 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01846 48894424f8                     mov        qword ptr [rsp - 8], rax
0184b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0184f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01853 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01858 48894424f8                     mov        qword ptr [rsp - 8], rax
0185d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01861 89442420                       mov        dword ptr [rsp + 0x20], eax
01865 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186a 48894424f8                     mov        qword ptr [rsp - 8], rax
0186f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01873 89442424                       mov        dword ptr [rsp + 0x24], eax
01877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01881 48ff742438                     push       qword ptr [rsp + 0x38]
01886 488f442430                     pop        qword ptr [rsp + 0x30]
0188b 48894424f8                     mov        qword ptr [rsp - 8], rax
01890 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01894 89442438                       mov        dword ptr [rsp + 0x38], eax
01898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189d 48894424f8                     mov        qword ptr [rsp - 8], rax
018a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018af 48ff742448                     push       qword ptr [rsp + 0x48]
018b4 488f442440                     pop        qword ptr [rsp + 0x40]
018b9 48ff742450                     push       qword ptr [rsp + 0x50]
018be 488f442448                     pop        qword ptr [rsp + 0x48]
018c3 48ff742458                     push       qword ptr [rsp + 0x58]
018c8 488f442450                     pop        qword ptr [rsp + 0x50]
018cd 48894424f8                     mov        qword ptr [rsp - 8], rax
018d2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018d9 89442458                       mov        dword ptr [rsp + 0x58], eax
018dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e2 48894424f8                     mov        qword ptr [rsp - 8], rax
018e7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018ee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f7 48894424f8                     mov        qword ptr [rsp - 8], rax
018fc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01903 89442460                       mov        dword ptr [rsp + 0x60], eax
01907 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01914 488f442468                     pop        qword ptr [rsp + 0x68]
01919 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01921 488f442470                     pop        qword ptr [rsp + 0x70]
01926 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0192e 488f442478                     pop        qword ptr [rsp + 0x78]
01933 48894424f8                     mov        qword ptr [rsp - 8], rax
01938 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0193f 89442464                       mov        dword ptr [rsp + 0x64], eax
01943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01948 48894424f8                     mov        qword ptr [rsp - 8], rax
0194d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01954 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48894424f8                     mov        qword ptr [rsp - 8], rax
01965 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0196c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01978 48894424f8                     mov        qword ptr [rsp - 8], rax
0197d 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01984 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01998 488f842490000000               pop        qword ptr [rsp + 0x90]
019a0 48894424f8                     mov        qword ptr [rsp - 8], rax
019a5 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019ac 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b8 48894424f8                     mov        qword ptr [rsp - 8], rax
019bd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019c4 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d0 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019d8 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019e0 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019e8 90                             nop        
019e9 90                             nop        
019ea 90                             nop        
019eb e8f0e7afff                     call       0x7f23ab6cda60
019f0 0f1f8400e81a000d               nop        dword ptr [rax + rax + 0xd001ae8]
019f8 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
01a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a06 e89559b419                     call       0x7f23c5714c20
01a0b f4                             hlt        
01a0c be45ffffff                     mov        esi, 0xffffff45
01a11 48894424f8                     mov        qword ptr [rsp - 8], rax
01a16 8b442408                       mov        eax, dword ptr [rsp + 8]
01a1a 890424                         mov        dword ptr [rsp], eax
01a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a2b 89442404                       mov        dword ptr [rsp + 4], eax
01a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a34 48ff742410                     push       qword ptr [rsp + 0x10]
01a39 488f442408                     pop        qword ptr [rsp + 8]
01a3e 48ff742418                     push       qword ptr [rsp + 0x18]
01a43 488f442410                     pop        qword ptr [rsp + 0x10]
01a48 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a51 89442418                       mov        dword ptr [rsp + 0x18], eax
01a55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a75 89442420                       mov        dword ptr [rsp + 0x20], eax
01a79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a87 89442424                       mov        dword ptr [rsp + 0x24], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a95 48ff742438                     push       qword ptr [rsp + 0x38]
01a9a 488f442430                     pop        qword ptr [rsp + 0x30]
01a9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01aa8 89442438                       mov        dword ptr [rsp + 0x38], eax
01aac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01aba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01abe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac3 48ff742448                     push       qword ptr [rsp + 0x48]
01ac8 488f442440                     pop        qword ptr [rsp + 0x40]
01acd 48ff742450                     push       qword ptr [rsp + 0x50]
01ad2 488f442448                     pop        qword ptr [rsp + 0x48]
01ad7 48ff742458                     push       qword ptr [rsp + 0x58]
01adc 488f442450                     pop        qword ptr [rsp + 0x50]
01ae1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01aed 89442458                       mov        dword ptr [rsp + 0x58], eax
01af1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af6 48894424f8                     mov        qword ptr [rsp - 8], rax
01afb 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b02 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b10 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b17 89442460                       mov        dword ptr [rsp + 0x60], eax
01b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b20 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b28 488f442468                     pop        qword ptr [rsp + 0x68]
01b2d 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b35 488f442478                     pop        qword ptr [rsp + 0x78]
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b46 89442464                       mov        dword ptr [rsp + 0x64], eax
01b4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b54 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b5b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b67 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b73 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b84 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b8b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b97 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b9f 488f842490000000               pop        qword ptr [rsp + 0x90]
01ba7 48894424f8                     mov        qword ptr [rsp - 8], rax
01bac 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bb3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbf 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bc7 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bcf 89bc24bc000000                 mov        dword ptr [rsp + 0xbc], edi
01bd6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bde 90                             nop        
01bdf e8fce5afff                     call       0x7f23ab6cda60
01be4 0f1f8400dc1c000e               nop        dword ptr [rax + rax + 0xe001cdc]
01bec 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
01bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfa e8a157b419                     call       0x7f23c5714c20
01bff f4                             hlt        
01c00 41b8ffffff7f                   mov        r8d, 0x7fffffff
01c06 493bc8                         cmp        rcx, r8
01c09 bdffffffff                     mov        ebp, 0xffffffff
01c0e 7c08                           jl         0x7f23abbcf498
01c10 400f95c5                       setne      bpl
01c14 400fb6ed                       movzx      ebp, bpl
01c18 be45ffffff                     mov        esi, 0xffffff45
01c1d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c2e 89442460                       mov        dword ptr [rsp + 0x60], eax
01c32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c37 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c43 89442464                       mov        dword ptr [rsp + 0x64], eax
01c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c51 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c58 89442468                       mov        dword ptr [rsp + 0x68], eax
01c5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c61 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01c69 488f842480000000               pop        qword ptr [rsp + 0x80]
01c71 48894424f8                     mov        qword ptr [rsp - 8], rax
01c76 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c7d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c86 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c92 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01caa 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01cc2 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cce 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cd6 488f842498000000               pop        qword ptr [rsp + 0x98]
01cde 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01ce6 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cee 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf3 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01cfa 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01d01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d06 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d0e 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01d16 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01d1e 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01d26 90                             nop        
01d27 e8b4e4afff                     call       0x7f23ab6cda60
01d2c 0f1f8400241e000f               nop        dword ptr [rax + rax + 0xf001e24]
01d34 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
01d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d42 e85956b419                     call       0x7f23c5714c20
01d47 f4                             hlt        
01d48 be45ffffff                     mov        esi, 0xffffff45
01d4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d52 8b442408                       mov        eax, dword ptr [rsp + 8]
01d56 890424                         mov        dword ptr [rsp], eax
01d59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d63 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d67 89442404                       mov        dword ptr [rsp + 4], eax
01d6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d70 48ff742410                     push       qword ptr [rsp + 0x10]
01d75 488f442408                     pop        qword ptr [rsp + 8]
01d7a 48ff742418                     push       qword ptr [rsp + 0x18]
01d7f 488f442410                     pop        qword ptr [rsp + 0x10]
01d84 48894424f8                     mov        qword ptr [rsp - 8], rax
01d89 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d8d 89442418                       mov        dword ptr [rsp + 0x18], eax
01d91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d96 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d9f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01da3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da8 48894424f8                     mov        qword ptr [rsp - 8], rax
01dad 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01db1 89442420                       mov        dword ptr [rsp + 0x20], eax
01db5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dba 48894424f8                     mov        qword ptr [rsp - 8], rax
01dbf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dc3 89442424                       mov        dword ptr [rsp + 0x24], eax
01dc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dcc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01dd1 48ff742438                     push       qword ptr [rsp + 0x38]
01dd6 488f442430                     pop        qword ptr [rsp + 0x30]
01ddb 48894424f8                     mov        qword ptr [rsp - 8], rax
01de0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01de4 89442438                       mov        dword ptr [rsp + 0x38], eax
01de8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ded 48894424f8                     mov        qword ptr [rsp - 8], rax
01df2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01df6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dff 48ff742448                     push       qword ptr [rsp + 0x48]
01e04 488f442440                     pop        qword ptr [rsp + 0x40]
01e09 48ff742450                     push       qword ptr [rsp + 0x50]
01e0e 488f442448                     pop        qword ptr [rsp + 0x48]
01e13 48ff742458                     push       qword ptr [rsp + 0x58]
01e18 488f442450                     pop        qword ptr [rsp + 0x50]
01e1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e22 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e29 89442458                       mov        dword ptr [rsp + 0x58], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e47 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e53 89442460                       mov        dword ptr [rsp + 0x60], eax
01e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5c 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e61 48894424f8                     mov        qword ptr [rsp - 8], rax
01e66 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e6d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e82 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e93 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01e9a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
01eab 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01eb2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01eb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebe 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ec6 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01ece 90                             nop        
01ecf e80ce3afff                     call       0x7f23ab6cda60
01ed4 0f1f8400cc1f0010               nop        dword ptr [rax + rax + 0x10001fcc]
01edc 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e8b154b419                     call       0x7f23c5714c20
01eef f4                             hlt        
01ef0 be45ffffff                     mov        esi, 0xffffff45
01ef5 48894424f8                     mov        qword ptr [rsp - 8], rax
01efa 8b442408                       mov        eax, dword ptr [rsp + 8]
01efe 890424                         mov        dword ptr [rsp], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f0f 89442404                       mov        dword ptr [rsp + 4], eax
01f13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f18 48ff742410                     push       qword ptr [rsp + 0x10]
01f1d 488f442408                     pop        qword ptr [rsp + 8]
01f22 48ff742418                     push       qword ptr [rsp + 0x18]
01f27 488f442410                     pop        qword ptr [rsp + 0x10]
01f2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f35 89442418                       mov        dword ptr [rsp + 0x18], eax
01f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f50 48894424f8                     mov        qword ptr [rsp - 8], rax
01f55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f59 89442420                       mov        dword ptr [rsp + 0x20], eax
01f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f62 48894424f8                     mov        qword ptr [rsp - 8], rax
01f67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f6b 89442424                       mov        dword ptr [rsp + 0x24], eax
01f6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f79 48ff742438                     push       qword ptr [rsp + 0x38]
01f7e 488f442430                     pop        qword ptr [rsp + 0x30]
01f83 48894424f8                     mov        qword ptr [rsp - 8], rax
01f88 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f8c 89442438                       mov        dword ptr [rsp + 0x38], eax
01f90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f95 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa7 48ff742448                     push       qword ptr [rsp + 0x48]
01fac 488f442440                     pop        qword ptr [rsp + 0x40]
01fb1 48ff742450                     push       qword ptr [rsp + 0x50]
01fb6 488f442448                     pop        qword ptr [rsp + 0x48]
01fbb 48ff742458                     push       qword ptr [rsp + 0x58]
01fc0 488f442450                     pop        qword ptr [rsp + 0x50]
01fc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fca 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fd1 89442458                       mov        dword ptr [rsp + 0x58], eax
01fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fda 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdf 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fe6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ffb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02004 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02009 48894424f8                     mov        qword ptr [rsp - 8], rax
0200e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02015 89442464                       mov        dword ptr [rsp + 0x64], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 48894424f8                     mov        qword ptr [rsp - 8], rax
02023 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0202a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02031 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02036 48894424f8                     mov        qword ptr [rsp - 8], rax
0203b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02042 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204e 48894424f8                     mov        qword ptr [rsp - 8], rax
02053 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0205a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02061 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02066 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0206e 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
02076 90                             nop        
02077 e864e1afff                     call       0x7f23ab6cda60
0207c 0f1f840074210011               nop        dword ptr [rax + rax + 0x11002174]
02084 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
0208e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02092 e80953b419                     call       0x7f23c5714c20
02097 f4                             hlt        
02098 be3dffffff                     mov        esi, 0xffffff3d
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442408                       mov        eax, dword ptr [rsp + 8]
020a6 890424                         mov        dword ptr [rsp], eax
020a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ae 48894424f8                     mov        qword ptr [rsp - 8], rax
020b3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020b7 89442404                       mov        dword ptr [rsp + 4], eax
020bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c0 48ff742410                     push       qword ptr [rsp + 0x10]
020c5 488f442408                     pop        qword ptr [rsp + 8]
020ca 48ff742418                     push       qword ptr [rsp + 0x18]
020cf 488f442410                     pop        qword ptr [rsp + 0x10]
020d4 48894424f8                     mov        qword ptr [rsp - 8], rax
020d9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020dd 89442418                       mov        dword ptr [rsp + 0x18], eax
020e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e6 48894424f8                     mov        qword ptr [rsp - 8], rax
020eb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020ef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f8 48894424f8                     mov        qword ptr [rsp - 8], rax
020fd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02101 89442420                       mov        dword ptr [rsp + 0x20], eax
02105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210a 48894424f8                     mov        qword ptr [rsp - 8], rax
0210f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02113 89442424                       mov        dword ptr [rsp + 0x24], eax
02117 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02121 48ff742438                     push       qword ptr [rsp + 0x38]
02126 488f442430                     pop        qword ptr [rsp + 0x30]
0212b 48894424f8                     mov        qword ptr [rsp - 8], rax
02130 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02134 89442438                       mov        dword ptr [rsp + 0x38], eax
02138 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213d 48894424f8                     mov        qword ptr [rsp - 8], rax
02142 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02146 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0214a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214f 48ff742448                     push       qword ptr [rsp + 0x48]
02154 488f442440                     pop        qword ptr [rsp + 0x40]
02159 48ff742450                     push       qword ptr [rsp + 0x50]
0215e 488f442448                     pop        qword ptr [rsp + 0x48]
02163 48ff742458                     push       qword ptr [rsp + 0x58]
02168 488f442450                     pop        qword ptr [rsp + 0x50]
0216d 48894424f8                     mov        qword ptr [rsp - 8], rax
02172 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02179 89442458                       mov        dword ptr [rsp + 0x58], eax
0217d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02182 48894424f8                     mov        qword ptr [rsp - 8], rax
02187 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0218e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02192 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02197 48894424f8                     mov        qword ptr [rsp - 8], rax
0219c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021a3 89442460                       mov        dword ptr [rsp + 0x60], eax
021a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ac 4c89442478                     mov        qword ptr [rsp + 0x78], r8
021b1 48894424f8                     mov        qword ptr [rsp - 8], rax
021b6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021bd 89442464                       mov        dword ptr [rsp + 0x64], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021d2 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021ea 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f6 48894424f8                     mov        qword ptr [rsp - 8], rax
021fb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02202 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02216 488f842490000000               pop        qword ptr [rsp + 0x90]
0221e 48894424f8                     mov        qword ptr [rsp - 8], rax
02223 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0222a 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02231 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02236 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0223e 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02246 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0224e 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02256 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0225e 48894424f8                     mov        qword ptr [rsp - 8], rax
02263 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0226a 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02276 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0227e 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
02286 898c24d8000000                 mov        dword ptr [rsp + 0xd8], ecx
0228d 90                             nop        
0228e 90                             nop        
0228f e84cdfafff                     call       0x7f23ab6cda60
02294 0f1f84008c230012               nop        dword ptr [rax + rax + 0x1200238c]
0229c 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
022a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022aa e8f150b419                     call       0x7f23c5714c20
022af f4                             hlt        
022b0 be45ffffff                     mov        esi, 0xffffff45
022b5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ba 8b442408                       mov        eax, dword ptr [rsp + 8]
022be 890424                         mov        dword ptr [rsp], eax
022c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c6 48894424f8                     mov        qword ptr [rsp - 8], rax
022cb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022cf 89442404                       mov        dword ptr [rsp + 4], eax
022d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d8 48ff742410                     push       qword ptr [rsp + 0x10]
022dd 488f442408                     pop        qword ptr [rsp + 8]
022e2 48ff742418                     push       qword ptr [rsp + 0x18]
022e7 488f442410                     pop        qword ptr [rsp + 0x10]
022ec 48894424f8                     mov        qword ptr [rsp - 8], rax
022f1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022f5 89442418                       mov        dword ptr [rsp + 0x18], eax
022f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02303 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02307 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0230b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02310 48894424f8                     mov        qword ptr [rsp - 8], rax
02315 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02319 89442420                       mov        dword ptr [rsp + 0x20], eax
0231d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02322 48894424f8                     mov        qword ptr [rsp - 8], rax
02327 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0232b 89442424                       mov        dword ptr [rsp + 0x24], eax
0232f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02334 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02339 48ff742438                     push       qword ptr [rsp + 0x38]
0233e 488f442430                     pop        qword ptr [rsp + 0x30]
02343 48894424f8                     mov        qword ptr [rsp - 8], rax
02348 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0234c 89442438                       mov        dword ptr [rsp + 0x38], eax
02350 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02355 48894424f8                     mov        qword ptr [rsp - 8], rax
0235a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0235e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02362 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02367 48ff742448                     push       qword ptr [rsp + 0x48]
0236c 488f442440                     pop        qword ptr [rsp + 0x40]
02371 48ff742450                     push       qword ptr [rsp + 0x50]
02376 488f442448                     pop        qword ptr [rsp + 0x48]
0237b 48ff742458                     push       qword ptr [rsp + 0x58]
02380 488f442450                     pop        qword ptr [rsp + 0x50]
02385 897c2458                       mov        dword ptr [rsp + 0x58], edi
02389 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02391 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02399 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
023a1 90                             nop        
023a2 90                             nop        
023a3 e838deafff                     call       0x7f23ab6cda60
023a8 0f1f8400a0240013               nop        dword ptr [rax + rax + 0x130024a0]
023b0 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
023ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
023be e8dd4fb419                     call       0x7f23c5714c20
023c3 f4                             hlt        
023c4 be45ffffff                     mov        esi, 0xffffff45
023c9 48894424f8                     mov        qword ptr [rsp - 8], rax
023ce 8b442408                       mov        eax, dword ptr [rsp + 8]
023d2 890424                         mov        dword ptr [rsp], eax
023d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023da 48894424f8                     mov        qword ptr [rsp - 8], rax
023df 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023e3 89442404                       mov        dword ptr [rsp + 4], eax
023e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ec 48ff742410                     push       qword ptr [rsp + 0x10]
023f1 488f442408                     pop        qword ptr [rsp + 8]
023f6 48ff742418                     push       qword ptr [rsp + 0x18]
023fb 488f442410                     pop        qword ptr [rsp + 0x10]
02400 48894424f8                     mov        qword ptr [rsp - 8], rax
02405 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02409 89442418                       mov        dword ptr [rsp + 0x18], eax
0240d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02412 48894424f8                     mov        qword ptr [rsp - 8], rax
02417 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0241b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0241f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02424 48894424f8                     mov        qword ptr [rsp - 8], rax
02429 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0242d 89442420                       mov        dword ptr [rsp + 0x20], eax
02431 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02436 48894424f8                     mov        qword ptr [rsp - 8], rax
0243b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0243f 89442424                       mov        dword ptr [rsp + 0x24], eax
02443 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02448 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0244d 48ff742438                     push       qword ptr [rsp + 0x38]
02452 488f442430                     pop        qword ptr [rsp + 0x30]
02457 48894424f8                     mov        qword ptr [rsp - 8], rax
0245c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02460 89442438                       mov        dword ptr [rsp + 0x38], eax
02464 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02469 48894424f8                     mov        qword ptr [rsp - 8], rax
0246e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02472 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02476 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247b 48ff742448                     push       qword ptr [rsp + 0x48]
02480 488f442440                     pop        qword ptr [rsp + 0x40]
02485 48ff742450                     push       qword ptr [rsp + 0x50]
0248a 488f442448                     pop        qword ptr [rsp + 0x48]
0248f 48ff742458                     push       qword ptr [rsp + 0x58]
02494 488f442450                     pop        qword ptr [rsp + 0x50]
02499 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
024a0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024a8 90                             nop        
024a9 90                             nop        
024aa 90                             nop        
024ab e830ddafff                     call       0x7f23ab6cda60
024b0 0f1f8400a8250014               nop        dword ptr [rax + rax + 0x140025a8]
024b8 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
024c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024c6 e8d54eb419                     call       0x7f23c5714c20
024cb f4                             hlt        
024cc be45ffffff                     mov        esi, 0xffffff45
024d1 48894424f8                     mov        qword ptr [rsp - 8], rax
024d6 8b442408                       mov        eax, dword ptr [rsp + 8]
024da 890424                         mov        dword ptr [rsp], eax
024dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e2 48894424f8                     mov        qword ptr [rsp - 8], rax
024e7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024eb 89442404                       mov        dword ptr [rsp + 4], eax
024ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f4 48ff742410                     push       qword ptr [rsp + 0x10]
024f9 488f442408                     pop        qword ptr [rsp + 8]
024fe 48ff742418                     push       qword ptr [rsp + 0x18]
02503 488f442410                     pop        qword ptr [rsp + 0x10]
02508 48894424f8                     mov        qword ptr [rsp - 8], rax
0250d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02511 89442418                       mov        dword ptr [rsp + 0x18], eax
02515 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251a 48894424f8                     mov        qword ptr [rsp - 8], rax
0251f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02523 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02527 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252c 48894424f8                     mov        qword ptr [rsp - 8], rax
02531 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02535 89442420                       mov        dword ptr [rsp + 0x20], eax
02539 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253e 48894424f8                     mov        qword ptr [rsp - 8], rax
02543 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02547 89442424                       mov        dword ptr [rsp + 0x24], eax
0254b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02550 48ff742438                     push       qword ptr [rsp + 0x38]
02555 488f442430                     pop        qword ptr [rsp + 0x30]
0255a 48894424f8                     mov        qword ptr [rsp - 8], rax
0255f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02563 89442438                       mov        dword ptr [rsp + 0x38], eax
02567 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256c 48894424f8                     mov        qword ptr [rsp - 8], rax
02571 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02575 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02579 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257e 48ff742448                     push       qword ptr [rsp + 0x48]
02583 488f442440                     pop        qword ptr [rsp + 0x40]
02588 48ff742450                     push       qword ptr [rsp + 0x50]
0258d 488f442448                     pop        qword ptr [rsp + 0x48]
02592 48ff742458                     push       qword ptr [rsp + 0x58]
02597 488f442450                     pop        qword ptr [rsp + 0x50]
0259c 48894424f8                     mov        qword ptr [rsp - 8], rax
025a1 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
025a8 89442458                       mov        dword ptr [rsp + 0x58], eax
025ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b1 48894424f8                     mov        qword ptr [rsp - 8], rax
025b6 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025bd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c6 48894424f8                     mov        qword ptr [rsp - 8], rax
025cb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025d2 89442460                       mov        dword ptr [rsp + 0x60], eax
025d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025db 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025e3 488f442468                     pop        qword ptr [rsp + 0x68]
025e8 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025f0 488f442470                     pop        qword ptr [rsp + 0x70]
025f5 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
025fd 488f442478                     pop        qword ptr [rsp + 0x78]
02602 48894424f8                     mov        qword ptr [rsp - 8], rax
02607 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0260e 89442464                       mov        dword ptr [rsp + 0x64], eax
02612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02617 48894424f8                     mov        qword ptr [rsp - 8], rax
0261c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02623 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0262a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0262f 48894424f8                     mov        qword ptr [rsp - 8], rax
02634 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0263b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02642 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02647 48894424f8                     mov        qword ptr [rsp - 8], rax
0264c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02653 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0265a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0265f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02667 488f842490000000               pop        qword ptr [rsp + 0x90]
0266f 48894424f8                     mov        qword ptr [rsp - 8], rax
02674 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0267b 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02682 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02687 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0268f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02697 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0269f 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
026a7 e834dbafff                     call       0x7f23ab6cda60
026ac 0f1f8400a4270015               nop        dword ptr [rax + rax + 0x150027a4]
026b4 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
026be 4883e4f0                       and        rsp, 0xfffffffffffffff0
026c2 e8d94cb419                     call       0x7f23c5714c20
026c7 f4                             hlt        
026c8 4533d2                         xor        r10d, r10d
026cb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
026d3 e9f6daffff                     jmp        0x7f23abbcda4e
026d8 4533d2                         xor        r10d, r10d
026db 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026e0 e915dbffff                     jmp        0x7f23abbcda7a
026e5 4533d2                         xor        r10d, r10d
026e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026ed e92fdbffff                     jmp        0x7f23abbcdaa1
026f2 4533d2                         xor        r10d, r10d
026f5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026fa e94edbffff                     jmp        0x7f23abbcdacd
026ff 4533d2                         xor        r10d, r10d
02702 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02707 e96bdbffff                     jmp        0x7f23abbcdaf7
0270c 4533d2                         xor        r10d, r10d
0270f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02714 e990dbffff                     jmp        0x7f23abbcdb29
02719 4533d2                         xor        r10d, r10d
0271c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02724 e9addbffff                     jmp        0x7f23abbcdb56
02729 4533d2                         xor        r10d, r10d
0272c 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02734 e9c3dbffff                     jmp        0x7f23abbcdb7c
02739 bebeffffff                     mov        esi, 0xffffffbe
0273e 48894424f8                     mov        qword ptr [rsp - 8], rax
02743 8b442408                       mov        eax, dword ptr [rsp + 8]
02747 890424                         mov        dword ptr [rsp], eax
0274a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274f 48894424f8                     mov        qword ptr [rsp - 8], rax
02754 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02758 89442404                       mov        dword ptr [rsp + 4], eax
0275c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02761 48ff742410                     push       qword ptr [rsp + 0x10]
02766 488f442408                     pop        qword ptr [rsp + 8]
0276b 48ff742418                     push       qword ptr [rsp + 0x18]
02770 488f442410                     pop        qword ptr [rsp + 0x10]
02775 48894424f8                     mov        qword ptr [rsp - 8], rax
0277a 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0277e 89442418                       mov        dword ptr [rsp + 0x18], eax
02782 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02787 48894424f8                     mov        qword ptr [rsp - 8], rax
0278c 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02790 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02794 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02799 48894424f8                     mov        qword ptr [rsp - 8], rax
0279e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027a2 89442420                       mov        dword ptr [rsp + 0x20], eax
027a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ab 48894424f8                     mov        qword ptr [rsp - 8], rax
027b0 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
027b4 89442424                       mov        dword ptr [rsp + 0x24], eax
027b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bd 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
027c2 48ff742438                     push       qword ptr [rsp + 0x38]
027c7 488f442430                     pop        qword ptr [rsp + 0x30]
027cc 48894424f8                     mov        qword ptr [rsp - 8], rax
027d1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027d5 89442438                       mov        dword ptr [rsp + 0x38], eax
027d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027de 48894424f8                     mov        qword ptr [rsp - 8], rax
027e3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
027e7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f0 48ff742448                     push       qword ptr [rsp + 0x48]
027f5 488f442440                     pop        qword ptr [rsp + 0x40]
027fa 48ff742450                     push       qword ptr [rsp + 0x50]
027ff 488f442448                     pop        qword ptr [rsp + 0x48]
02804 48ff742458                     push       qword ptr [rsp + 0x58]
02809 488f442450                     pop        qword ptr [rsp + 0x50]
0280e 90                             nop        
0280f e8ccd9afff                     call       0x7f23ab6cda60
02814 0f1f84000c290016               nop        dword ptr [rax + rax + 0x1600290c]
0281c 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
02826 4883e4f0                       and        rsp, 0xfffffffffffffff0
0282a e8714bb419                     call       0x7f23c5714c20
0282f f4                             hlt        
02830 be85ffffff                     mov        esi, 0xffffff85
02835 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02839 48894424f8                     mov        qword ptr [rsp - 8], rax
0283e 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02842 890424                         mov        dword ptr [rsp], eax
02845 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284a 48894424f8                     mov        qword ptr [rsp - 8], rax
0284f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02853 89442404                       mov        dword ptr [rsp + 4], eax
02857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285c 48894424f8                     mov        qword ptr [rsp - 8], rax
02861 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02865 89442408                       mov        dword ptr [rsp + 8], eax
02869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0286e 48894424f8                     mov        qword ptr [rsp - 8], rax
02873 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02877 8944240c                       mov        dword ptr [rsp + 0xc], eax
0287b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02880 48894424f8                     mov        qword ptr [rsp - 8], rax
02885 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02889 89442410                       mov        dword ptr [rsp + 0x10], eax
0288d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02892 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02897 48ff742438                     push       qword ptr [rsp + 0x38]
0289c 488f442420                     pop        qword ptr [rsp + 0x20]
028a1 48894424f8                     mov        qword ptr [rsp - 8], rax
028a6 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028aa 89442414                       mov        dword ptr [rsp + 0x14], eax
028ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b3 48894424f8                     mov        qword ptr [rsp - 8], rax
028b8 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028bc 89442428                       mov        dword ptr [rsp + 0x28], eax
028c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c5 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
028ca 90                             nop        
028cb e810d9afff                     call       0x7f23ab6cda60
028d0 0f1f8400c8290017               nop        dword ptr [rax + rax + 0x170029c8]
028d8 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
028e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028e6 e8b54ab419                     call       0x7f23c5714c20
028eb f4                             hlt        
028ec bef6ffffff                     mov        esi, 0xfffffff6
028f1 90                             nop        
028f2 90                             nop        
028f3 e8e8d8afff                     call       0x7f23ab6cda60
028f8 0f1f8400f0290018               nop        dword ptr [rax + rax + 0x180029f0]
02900 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
0290a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0290e e88d4ab419                     call       0x7f23c5714c20
02913 f4                             hlt        
02914 be5d000000                     mov        esi, 0x5d
02919 90                             nop        
0291a 90                             nop        
0291b e8c0d8afff                     call       0x7f23ab6cda60
02920 0f1f8400182a0019               nop        dword ptr [rax + rax + 0x19002a18]
02928 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
02932 4883e4f0                       and        rsp, 0xfffffffffffffff0
02936 e8654ab419                     call       0x7f23c5714c20
0293b f4                             hlt        
0293c bef6ffffff                     mov        esi, 0xfffffff6
02941 418beb                         mov        ebp, r11d
02944 90                             nop        
02945 90                             nop        
02946 90                             nop        
02947 e894d8afff                     call       0x7f23ab6cda60
0294c 0f1f8400442a001a               nop        dword ptr [rax + rax + 0x1a002a44]
02954 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
0295e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02962 e8394ab419                     call       0x7f23c5714c20
02967 f4                             hlt        
02968 bef6ffffff                     mov        esi, 0xfffffff6
0296d 8be9                           mov        ebp, ecx
0296f e86cd8afff                     call       0x7f23ab6cda60
02974 0f1f84006c2a001b               nop        dword ptr [rax + rax + 0x1b002a6c]
0297c 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
02986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0298a e8114ab419                     call       0x7f23c5714c20
0298f f4                             hlt        
02990 bef6ffffff                     mov        esi, 0xfffffff6
02995 418beb                         mov        ebp, r11d
02998 90                             nop        
02999 90                             nop        
0299a 90                             nop        
0299b e840d8afff                     call       0x7f23ab6cda60
029a0 0f1f8400982a001c               nop        dword ptr [rax + rax + 0x1c002a98]
029a8 48bf50661c84237f0000           movabs     rdi, 0x7f23841c6650
029b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029b6 e8e549b419                     call       0x7f23c5714c20
029bb f4                             hlt        
029bc eb00                           jmp        0x7f23abbd023e
029be 488bf0                         mov        rsi, rax
029c1 e9f6e0ffff                     jmp        0x7f23abbce33c
029c6 49ba0be3bcab237f0000           movabs     r10, 0x7f23abbce30b
029d0 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
029d7 e90421b6ff                     jmp        0x7f23ab732360
029dc e87fefb4ff                     call       0x7f23ab71f1e0
029e1 e948d6ffff                     jmp        0x7f23abbcd8ae
029e6 f4                             hlt        
029e7 f4                             hlt        
