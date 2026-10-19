00000 e8bbb08818                     call       0x7fb3cc464340
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
00028 0f85b6290000                   jne        0x7fb3b3bdbc64
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
0018f 49ba706a62ccb37f0000           movabs     r10, 0x7fb3cc626a70
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f841e250000                   je         0x7fb3b3bdb950
001b2 458b1a                         mov        r11d, dword ptr [r10]
001b5 41c1eb0d                       shr        r11d, 0xd
001b9 4181fbf9060000                 cmp        r11d, 0x6f9
001c0 0f8572260000                   jne        0x7fb3b3bdbab8
001c6 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d3 4d85d2                         test       r10, r10
001d6 0f8404250000                   je         0x7fb3b3bdb960
001dc 458b12                         mov        r10d, dword ptr [r10]
001df 41c1ea0d                       shr        r10d, 0xd
001e3 4181fa16410000                 cmp        r10d, 0x4116
001ea 0f8548260000                   jne        0x7fb3b3bdbab8
001f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f84e5240000                   je         0x7fb3b3bdb96d
00208 458b1a                         mov        r11d, dword ptr [r10]
0020b 41c1eb0d                       shr        r11d, 0xd
0020f 4181fb0a410000                 cmp        r11d, 0x410a
00216 0f851c260000                   jne        0x7fb3b3bdbab8
0021c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00226 4d85d2                         test       r10, r10
00229 0f84cb240000                   je         0x7fb3b3bdb97a
0022f 458b12                         mov        r10d, dword ptr [r10]
00232 41c1ea0d                       shr        r10d, 0xd
00236 4181fa0d410000                 cmp        r10d, 0x410d
0023d 0f85f5250000                   jne        0x7fb3b3bdbab8
00243 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f84a9240000                   je         0x7fb3b3bdb987
0025e 458b1a                         mov        r11d, dword ptr [r10]
00261 41c1eb0d                       shr        r11d, 0xd
00265 4181fb0d410000                 cmp        r11d, 0x410d
0026c 0f85c6250000                   jne        0x7fb3b3bdbab8
00272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00277 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0027f 4d85d2                         test       r10, r10
00282 0f848c240000                   je         0x7fb3b3bdb994
00288 458b12                         mov        r10d, dword ptr [r10]
0028b 41c1ea0d                       shr        r10d, 0xd
0028f 4181fa0d410000                 cmp        r10d, 0x410d
00296 0f859c250000                   jne        0x7fb3b3bdbab8
0029c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f8467240000                   je         0x7fb3b3bdb9a1
002ba 458b1a                         mov        r11d, dword ptr [r10]
002bd 41c1eb0d                       shr        r11d, 0xd
002c1 4181fbfc060000                 cmp        r11d, 0x6fc
002c8 0f856a250000                   jne        0x7fb3b3bdbab8
002ce 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002d6 4d85ed                         test       r13, r13
002d9 0f8452240000                   je         0x7fb3b3bdb9b1
002df 458b5500                       mov        r10d, dword ptr [r13]
002e3 41c1ea0d                       shr        r10d, 0xd
002e7 4181fafb060000                 cmp        r10d, 0x6fb
002ee 0f8544250000                   jne        0x7fb3b3bdbab8
002f4 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
002fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00301 4d85d2                         test       r10, r10
00304 0f8437240000                   je         0x7fb3b3bdb9c1
0030a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0030f 4d85d2                         test       r10, r10
00312 0f8429240000                   je         0x7fb3b3bdb9c1
00318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0031d 4d85d2                         test       r10, r10
00320 0f841b240000                   je         0x7fb3b3bdb9c1
00326 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0032e 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00332 892c24                         mov        dword ptr [rsp], ebp
00335 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
0033d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00341 458d5af9                       lea        r11d, [r10 - 7]
00345 4585db                         test       r11d, r11d
00348 0f8cf3230000                   jl         0x7fb3b3bdb9c1
0034e 4183c2f9                       add        r10d, -7
00352 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0035a e968020000                     jmp        0x7fb3b3bd9847
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
0039a 0f8d70100000                   jge        0x7fb3b3bda690
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d21120000                   jge        0x7fb3b3bda874
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d04140000                   jge        0x7fb3b3bdaa80
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bf9                           mov        edi, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8df1150000                   jge        0x7fb3b3bdac94
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
00477 0f8eff0b0000                   jle        0x7fb3b3bda2fc
0047d 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
00484 0f8f7e170000                   jg         0x7fb3b3bdae88
0048a 4181fbffff0100                 cmp        r11d, 0x1ffff
00491 0f8fb9180000                   jg         0x7fb3b3bdafd0
00497 4181f9ffff0300                 cmp        r9d, 0x3ffff
0049e 0f8f541a0000                   jg         0x7fb3b3bdb178
004a4 8bc9                           mov        ecx, ecx
004a6 81f900000010                   cmp        ecx, 0x10000000
004ac 0f83ee1b0000                   jae        0x7fb3b3bdb320
004b2 48c1e712                       shl        rdi, 0x12
004b6 4c63c1                         movsxd     r8, ecx
004b9 4d63db                         movsxd     r11, r11d
004bc 49c1e024                       shl        r8, 0x24
004c0 4c0bc7                         or         r8, rdi
004c3 4d0bc3                         or         r8, r11
004c6 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004ce 443b0c24                       cmp        r9d, dword ptr [rsp]
004d2 0f83bc090000                   jae        0x7fb3b3bda114
004d8 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e0 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
004e8 4f8944d908                     mov        qword ptr [r9 + r11*8 + 8], r8
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8dbe000000                   jge        0x7fb3b3bd9839
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
0050f 49c1e930                       shr        r9, 0x30
00513 458bc3                         mov        r8d, r11d
00516 418bd1                         mov        edx, r9d
00519 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00521 c44223f7da                     shrx       r11d, r10d, r11d
00526 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
0052d 038c24bc000000                 add        ecx, dword ptr [rsp + 0xbc]
00534 c44273f7ca                     shrx       r9d, r10d, ecx
00539 4103d1                         add        edx, r9d
0053c 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
00543 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054a 83f920                         cmp        ecx, 0x20
0054d 0f8d651d0000                   jge        0x7fb3b3bdb538
00553 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0055b 49c1e930                       shr        r9, 0x30
0055f 418bc9                         mov        ecx, r9d
00562 41b901000000                   mov        r9d, 1
00568 8bbc24bc000000                 mov        edi, dword ptr [rsp + 0xbc]
0056f c4c241f7f9                     shlx       edi, r9d, edi
00574 ffcf                           dec        edi
00576 4123fb                         and        edi, r11d
00579 4103f8                         add        edi, r8d
0057c 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00583 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0058b 4183f820                       cmp        r8d, 0x20
0058f 0f8d371e0000                   jge        0x7fb3b3bdb64c
00595 41b801000000                   mov        r8d, 1
0059b 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
005a3 c44221f7c0                     shlx       r8d, r8d, r11d
005a8 41ffc8                         dec        r8d
005ab 4523c2                         and        r8d, r10d
005ae 4403c1                         add        r8d, ecx
005b1 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
005b9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005bd 418502                         test       dword ptr [r10], eax
005c0 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c7 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005cf 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005d4 0f8d84040000                   jge        0x7fb3b3bd9cde
005da 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005df 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
005eb 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
005f3 458b4204                       mov        r8d, dword ptr [r10 + 4]
005f7 453bd8                         cmp        r11d, r8d
005fa 0f8300050000                   jae        0x7fb3b3bd9d80
00600 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00605 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
00609 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00610 238c24b4000000                 and        ecx, dword ptr [rsp + 0xb4]
00617 458b4104                       mov        r8d, dword ptr [r9 + 4]
0061b 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00620 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00628 413bc8                         cmp        ecx, r8d
0062b 0f83d7050000                   jae        0x7fb3b3bd9e88
00631 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00636 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063a 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00642 44239c24b8000000               and        r11d, dword ptr [rsp + 0xb8]
0064a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0064e 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
00653 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0065b 453bd8                         cmp        r11d, r8d
0065e 0f83d4060000                   jae        0x7fb3b3bd9fb8
00664 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00669 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00671 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00678 ffc5                           inc        ebp
0067a 896c2404                       mov        dword ptr [rsp + 4], ebp
0067e 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00682 0f8d49040000                   jge        0x7fb3b3bd9d51
00688 49c1ea28                       shr        r10, 0x28
0068c 458bd2                         mov        r10d, r10d
0068f 450fb6d2                       movzx      r10d, r10b
00693 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0069b 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a3 49c1ea28                       shr        r10, 0x28
006a7 458bda                         mov        r11d, r10d
006aa 450fb6cb                       movzx      r9d, r11b
006ae 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
006b6 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006be 49c1ea28                       shr        r10, 0x28
006c2 458bd2                         mov        r10d, r10d
006c5 450fb6da                       movzx      r11d, r10b
006c9 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
006d1 4503cb                         add        r9d, r11d
006d4 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006dc 41ba01000000                   mov        r10d, 1
006e2 4489942404010000               mov        dword ptr [rsp + 0x104], r10d
006ea 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006f2 49c1ea20                       shr        r10, 0x20
006f6 458bda                         mov        r11d, r10d
006f9 410fb6eb                       movzx      ebp, r11b
006fd 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00704 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0070c 49c1ea20                       shr        r10, 0x20
00710 458bd2                         mov        r10d, r10d
00713 410fb6ea                       movzx      ebp, r10b
00717 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
0071e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00726 49c1ea20                       shr        r10, 0x20
0072a 458bda                         mov        r11d, r10d
0072d 410fb6eb                       movzx      ebp, r11b
00731 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
00738 448bd5                         mov        r10d, ebp
0073b 44039424f8000000               add        r10d, dword ptr [rsp + 0xf8]
00743 44039424fc000000               add        r10d, dword ptr [rsp + 0xfc]
0074b 44039424f4000000               add        r10d, dword ptr [rsp + 0xf4]
00753 4585d2                         test       r10d, r10d
00756 0f84640a0000                   je         0x7fb3b3bda440
0075c 4183fa3f                       cmp        r10d, 0x3f
00760 0f8f360c0000                   jg         0x7fb3b3bda61c
00766 41b840000000                   mov        r8d, 0x40
0076c 442b442440                     sub        r8d, dword ptr [rsp + 0x40]
00771 453bd0                         cmp        r10d, r8d
00774 7e43                           jle        0x7fb3b3bd9a39
00776 458bda                         mov        r11d, r10d
00779 452bd8                         sub        r11d, r8d
0077c 4183f840                       cmp        r8d, 0x40
00780 0f8d4e1d0000                   jge        0x7fb3b3bdb754
00786 41b901000000                   mov        r9d, 1
0078c c442b9f7c1                     shlx       r8, r9, r8
00791 49ffc8                         dec        r8
00794 4c23c3                         and        r8, rbx
00797 c442a1f7c0                     shlx       r8, r8, r11
0079c 41b940000000                   mov        r9d, 0x40
007a2 452bcb                         sub        r9d, r11d
007a5 c462b3f75c2438                 shrx       r11, qword ptr [rsp + 0x38], r9
007ac 4d0bc3                         or         r8, r11
007af 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007b7 eb21                           jmp        0x7fb3b3bd9a5a
007b9 41bb01000000                   mov        r11d, 1
007bf c442a9f7db                     shlx       r11, r11, r10
007c4 452bc2                         sub        r8d, r10d
007c7 c462bbf7c3                     shrx       r8, rbx, r8
007cc 49ffcb                         dec        r11
007cf 4d23c3                         and        r8, r11
007d2 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
007da 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
007df 4503da                         add        r11d, r10d
007e2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007e7 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
007ec 4503c2                         add        r8d, r10d
007ef 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007f4 4183fb40                       cmp        r11d, 0x40
007f8 0f8c92fbffff                   jl         0x7fb3b3bd9610
007fe 458d53c0                       lea        r10d, [r11 - 0x40]
00802 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00807 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
0080b 83c5f8                         add        ebp, -8
0080e 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00812 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00816 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
0081a 83c1f0                         add        ecx, -0x10
0081d 83f908                         cmp        ecx, 8
00820 0f8cea010000                   jl         0x7fb3b3bd9c90
00826 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0082b 4183c2e8                       add        r10d, -0x18
0082f 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00837 0f8222fbffff                   jb         0x7fb3b3bd95df
0083d bee4ffffff                     mov        esi, 0xffffffe4
00842 48894424f8                     mov        qword ptr [rsp - 8], rax
00847 8b442408                       mov        eax, dword ptr [rsp + 8]
0084b 890424                         mov        dword ptr [rsp], eax
0084e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00853 48894424f8                     mov        qword ptr [rsp - 8], rax
00858 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085c 89442404                       mov        dword ptr [rsp + 4], eax
00860 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00865 48ff742410                     push       qword ptr [rsp + 0x10]
0086a 488f442408                     pop        qword ptr [rsp + 8]
0086f 48ff742418                     push       qword ptr [rsp + 0x18]
00874 488f442410                     pop        qword ptr [rsp + 0x10]
00879 48894424f8                     mov        qword ptr [rsp - 8], rax
0087e 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00882 89442418                       mov        dword ptr [rsp + 0x18], eax
00886 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088b 48894424f8                     mov        qword ptr [rsp - 8], rax
00890 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00894 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089d 48894424f8                     mov        qword ptr [rsp - 8], rax
008a2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a6 89442420                       mov        dword ptr [rsp + 0x20], eax
008aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008af 48894424f8                     mov        qword ptr [rsp - 8], rax
008b4 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008b8 89442424                       mov        dword ptr [rsp + 0x24], eax
008bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c1 48ff742438                     push       qword ptr [rsp + 0x38]
008c6 488f442428                     pop        qword ptr [rsp + 0x28]
008cb 48894424f8                     mov        qword ptr [rsp - 8], rax
008d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
008d4 89442430                       mov        dword ptr [rsp + 0x30], eax
008d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008dd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008e2 48ff742448                     push       qword ptr [rsp + 0x48]
008e7 488f442438                     pop        qword ptr [rsp + 0x38]
008ec 48ff742450                     push       qword ptr [rsp + 0x50]
008f1 488f442440                     pop        qword ptr [rsp + 0x40]
008f6 48ff742458                     push       qword ptr [rsp + 0x58]
008fb 488f442448                     pop        qword ptr [rsp + 0x48]
00900 48894424f8                     mov        qword ptr [rsp - 8], rax
00905 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090c 89442450                       mov        dword ptr [rsp + 0x50], eax
00910 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00915 48894424f8                     mov        qword ptr [rsp - 8], rax
0091a 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00921 89442454                       mov        dword ptr [rsp + 0x54], eax
00925 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092a 48894424f8                     mov        qword ptr [rsp - 8], rax
0092f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00936 89442458                       mov        dword ptr [rsp + 0x58], eax
0093a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00947 488f442460                     pop        qword ptr [rsp + 0x60]
0094c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00954 488f442468                     pop        qword ptr [rsp + 0x68]
00959 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00961 488f442470                     pop        qword ptr [rsp + 0x70]
00966 48894424f8                     mov        qword ptr [rsp - 8], rax
0096b 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00972 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097b 48894424f8                     mov        qword ptr [rsp - 8], rax
00980 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00987 89442478                       mov        dword ptr [rsp + 0x78], eax
0098b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00990 48894424f8                     mov        qword ptr [rsp - 8], rax
00995 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099c 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a5 48894424f8                     mov        qword ptr [rsp - 8], rax
009aa 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009b1 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bd 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c5 488f842488000000               pop        qword ptr [rsp + 0x88]
009cd 48894424f8                     mov        qword ptr [rsp - 8], rax
009d2 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d9 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009ed 90                             nop        
009ee 90                             nop        
009ef e8ec3dafff                     call       0x7fb3b36cda60
009f4 0f1f8400ec0a0001               nop        dword ptr [rax + rax + 0x1000aec]
009fc 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
00a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0a e891cf6518                     call       0x7fb3cc236c20
00a0f f4                             hlt        
00a10 85c9                           test       ecx, ecx
00a12 7f08                           jg         0x7fb3b3bd9c9c
00a14 4533d2                         xor        r10d, r10d
00a17 e950f9ffff                     jmp        0x7fb3b3bd95ec
00a1c 8be9                           mov        ebp, ecx
00a1e 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a26 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a2a 90                             nop        
00a2b e8b05fb5ff                     call       0x7fb3b372fc60
00a30 0f1f8400280b0002               nop        dword ptr [rax + rax + 0x2000b28]
00a38 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a3d 41c1e303                       shl        r11d, 3
00a41 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a46 41c1e203                       shl        r10d, 3
00a4a 452bd3                         sub        r10d, r11d
00a4d 4181c2c0000000                 add        r10d, 0xc0
00a54 c462a9f7d0                     shlx       r10, rax, r10
00a59 e90ef9ffff                     jmp        0x7fb3b3bd95ec
00a5e 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a66 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a6e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a73 4d3bd3                         cmp        r10, r11
00a76 7f26                           jg         0x7fb3b3bd9d1e
00a78 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a7d 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a82 0f85941e0000                   jne        0x7fb3b3bdbb9c
00a88 418bc2                         mov        eax, r10d
00a8b 4881c430010000                 add        rsp, 0x130
00a92 5d                             pop        rbp
00a93 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a97 0f87311f0000                   ja         0x7fb3b3bdbc4e
00a9d c3                             ret        
00a9e 48be085829e300000000           movabs     rsi, 0xe3295808
00aa8 90                             nop        
00aa9 90                             nop        
00aaa 90                             nop        
00aab e8305fb5ff                     call       0x7fb3b372fc60
00ab0 0f1f8400a80b0003               nop        dword ptr [rax + rax + 0x3000ba8]
00ab8 4885c0                         test       rax, rax
00abb 0f84331e0000                   je         0x7fb3b3bdbb74
00ac1 488bf0                         mov        rsi, rax
00ac4 4881c430010000                 add        rsp, 0x130
00acb 5d                             pop        rbp
00acc e90fbeaeff                     jmp        0x7fb3b36c5b60
00ad1 4533d2                         xor        r10d, r10d
00ad4 33ed                           xor        ebp, ebp
00ad6 4533c0                         xor        r8d, r8d
00ad9 4533db                         xor        r11d, r11d
00adc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00ae4 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00aeb 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00af3 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
00afb e9eafbffff                     jmp        0x7fb3b3bd996a
00b00 bee4ffffff                     mov        esi, 0xffffffe4
00b05 48894424f8                     mov        qword ptr [rsp - 8], rax
00b0a 8b442408                       mov        eax, dword ptr [rsp + 8]
00b0e 890424                         mov        dword ptr [rsp], eax
00b11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b16 48894424f8                     mov        qword ptr [rsp - 8], rax
00b1b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b1f 89442404                       mov        dword ptr [rsp + 4], eax
00b23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b28 48ff742410                     push       qword ptr [rsp + 0x10]
00b2d 488f442408                     pop        qword ptr [rsp + 8]
00b32 48ff742418                     push       qword ptr [rsp + 0x18]
00b37 488f442410                     pop        qword ptr [rsp + 0x10]
00b3c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b41 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b45 89442418                       mov        dword ptr [rsp + 0x18], eax
00b49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b53 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b60 48894424f8                     mov        qword ptr [rsp - 8], rax
00b65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b69 89442420                       mov        dword ptr [rsp + 0x20], eax
00b6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b72 48894424f8                     mov        qword ptr [rsp - 8], rax
00b77 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b7b 89442424                       mov        dword ptr [rsp + 0x24], eax
00b7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b84 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b89 48ff742438                     push       qword ptr [rsp + 0x38]
00b8e 488f442430                     pop        qword ptr [rsp + 0x30]
00b93 48894424f8                     mov        qword ptr [rsp - 8], rax
00b98 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b9c 89442438                       mov        dword ptr [rsp + 0x38], eax
00ba0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ba5 48894424f8                     mov        qword ptr [rsp - 8], rax
00baa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00bae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb7 48ff742448                     push       qword ptr [rsp + 0x48]
00bbc 488f442440                     pop        qword ptr [rsp + 0x40]
00bc1 48ff742450                     push       qword ptr [rsp + 0x50]
00bc6 488f442448                     pop        qword ptr [rsp + 0x48]
00bcb 48ff742458                     push       qword ptr [rsp + 0x58]
00bd0 488f442450                     pop        qword ptr [rsp + 0x50]
00bd5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bdd 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00be5 90                             nop        
00be6 90                             nop        
00be7 e8f43bafff                     call       0x7fb3b36cda60
00bec 0f1f8400e40c0004               nop        dword ptr [rax + rax + 0x4000ce4]
00bf4 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
00bfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c02 e899cd6518                     call       0x7fb3cc236c20
00c07 f4                             hlt        
00c08 bee4ffffff                     mov        esi, 0xffffffe4
00c0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00c12 8b442408                       mov        eax, dword ptr [rsp + 8]
00c16 890424                         mov        dword ptr [rsp], eax
00c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c23 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c27 89442404                       mov        dword ptr [rsp + 4], eax
00c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c30 48ff742410                     push       qword ptr [rsp + 0x10]
00c35 488f442408                     pop        qword ptr [rsp + 8]
00c3a 48ff742418                     push       qword ptr [rsp + 0x18]
00c3f 488f442410                     pop        qword ptr [rsp + 0x10]
00c44 48894424f8                     mov        qword ptr [rsp - 8], rax
00c49 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c4d 89442418                       mov        dword ptr [rsp + 0x18], eax
00c51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c56 48894424f8                     mov        qword ptr [rsp - 8], rax
00c5b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c5f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c68 48894424f8                     mov        qword ptr [rsp - 8], rax
00c6d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c71 89442420                       mov        dword ptr [rsp + 0x20], eax
00c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c83 89442424                       mov        dword ptr [rsp + 0x24], eax
00c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c8c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c91 48ff742438                     push       qword ptr [rsp + 0x38]
00c96 488f442430                     pop        qword ptr [rsp + 0x30]
00c9b 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ca4 89442438                       mov        dword ptr [rsp + 0x38], eax
00ca8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cad 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00cb6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cbf 48ff742448                     push       qword ptr [rsp + 0x48]
00cc4 488f442440                     pop        qword ptr [rsp + 0x40]
00cc9 48ff742450                     push       qword ptr [rsp + 0x50]
00cce 488f442448                     pop        qword ptr [rsp + 0x48]
00cd3 48ff742458                     push       qword ptr [rsp + 0x58]
00cd8 488f442450                     pop        qword ptr [rsp + 0x50]
00cdd 48894424f8                     mov        qword ptr [rsp - 8], rax
00ce2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00ce9 89442458                       mov        dword ptr [rsp + 0x58], eax
00ced 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cf2 48894424f8                     mov        qword ptr [rsp - 8], rax
00cf7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cfe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d07 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d0f 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d16 90                             nop        
00d17 e8c43aafff                     call       0x7fb3b36cda60
00d1c 0f1f8400140e0005               nop        dword ptr [rax + rax + 0x5000e14]
00d24 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
00d2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d32 e869cc6518                     call       0x7fb3cc236c20
00d37 f4                             hlt        
00d38 bee4ffffff                     mov        esi, 0xffffffe4
00d3d 48894424f8                     mov        qword ptr [rsp - 8], rax
00d42 8b442408                       mov        eax, dword ptr [rsp + 8]
00d46 890424                         mov        dword ptr [rsp], eax
00d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d53 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d57 89442404                       mov        dword ptr [rsp + 4], eax
00d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d60 48ff742410                     push       qword ptr [rsp + 0x10]
00d65 488f442408                     pop        qword ptr [rsp + 8]
00d6a 48ff742418                     push       qword ptr [rsp + 0x18]
00d6f 488f442410                     pop        qword ptr [rsp + 0x10]
00d74 48894424f8                     mov        qword ptr [rsp - 8], rax
00d79 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d7d 89442418                       mov        dword ptr [rsp + 0x18], eax
00d81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d86 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d8f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d98 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00da1 89442420                       mov        dword ptr [rsp + 0x20], eax
00da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00daa 48894424f8                     mov        qword ptr [rsp - 8], rax
00daf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00db3 89442424                       mov        dword ptr [rsp + 0x24], eax
00db7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dbc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00dc1 48ff742438                     push       qword ptr [rsp + 0x38]
00dc6 488f442430                     pop        qword ptr [rsp + 0x30]
00dcb 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00dd4 89442438                       mov        dword ptr [rsp + 0x38], eax
00dd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
00de2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00de6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00dea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00def 48ff742448                     push       qword ptr [rsp + 0x48]
00df4 488f442440                     pop        qword ptr [rsp + 0x40]
00df9 48ff742450                     push       qword ptr [rsp + 0x50]
00dfe 488f442448                     pop        qword ptr [rsp + 0x48]
00e03 48ff742458                     push       qword ptr [rsp + 0x58]
00e08 488f442450                     pop        qword ptr [rsp + 0x50]
00e0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00e12 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00e19 89442458                       mov        dword ptr [rsp + 0x58], eax
00e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e22 48894424f8                     mov        qword ptr [rsp - 8], rax
00e27 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00e2e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e37 48894424f8                     mov        qword ptr [rsp - 8], rax
00e3c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00e43 89442460                       mov        dword ptr [rsp + 0x60], eax
00e47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e4c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e51 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e58 89442464                       mov        dword ptr [rsp + 0x64], eax
00e5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e61 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e69 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00e71 90                             nop        
00e72 90                             nop        
00e73 e86839afff                     call       0x7fb3b36cda60
00e78 0f1f8400700f0006               nop        dword ptr [rax + rax + 0x6000f70]
00e80 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
00e8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e8e e80dcb6518                     call       0x7fb3cc236c20
00e93 f4                             hlt        
00e94 bee4ffffff                     mov        esi, 0xffffffe4
00e99 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9e 8b442408                       mov        eax, dword ptr [rsp + 8]
00ea2 890424                         mov        dword ptr [rsp], eax
00ea5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eaa 48894424f8                     mov        qword ptr [rsp - 8], rax
00eaf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00eb3 89442404                       mov        dword ptr [rsp + 4], eax
00eb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ebc 48ff742410                     push       qword ptr [rsp + 0x10]
00ec1 488f442408                     pop        qword ptr [rsp + 8]
00ec6 48ff742418                     push       qword ptr [rsp + 0x18]
00ecb 488f442410                     pop        qword ptr [rsp + 0x10]
00ed0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00ed9 89442418                       mov        dword ptr [rsp + 0x18], eax
00edd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee2 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00eeb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00eef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00efd 89442420                       mov        dword ptr [rsp + 0x20], eax
00f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f06 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f0f 89442424                       mov        dword ptr [rsp + 0x24], eax
00f13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f18 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f1d 48ff742438                     push       qword ptr [rsp + 0x38]
00f22 488f442430                     pop        qword ptr [rsp + 0x30]
00f27 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00f30 89442438                       mov        dword ptr [rsp + 0x38], eax
00f34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f39 48894424f8                     mov        qword ptr [rsp - 8], rax
00f3e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00f42 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4b 48ff742448                     push       qword ptr [rsp + 0x48]
00f50 488f442440                     pop        qword ptr [rsp + 0x40]
00f55 48ff742450                     push       qword ptr [rsp + 0x50]
00f5a 488f442448                     pop        qword ptr [rsp + 0x48]
00f5f 48ff742458                     push       qword ptr [rsp + 0x58]
00f64 488f442450                     pop        qword ptr [rsp + 0x50]
00f69 48894424f8                     mov        qword ptr [rsp - 8], rax
00f6e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f75 89442458                       mov        dword ptr [rsp + 0x58], eax
00f79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f7e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f83 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f8a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f93 48894424f8                     mov        qword ptr [rsp - 8], rax
00f98 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f9f 89442460                       mov        dword ptr [rsp + 0x60], eax
00fa3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa8 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00fb0 488f442478                     pop        qword ptr [rsp + 0x78]
00fb5 48894424f8                     mov        qword ptr [rsp - 8], rax
00fba 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00fc1 89442464                       mov        dword ptr [rsp + 0x64], eax
00fc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fca 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcf 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00fd6 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00fdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe7 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00fee 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ff5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffa 48894424f8                     mov        qword ptr [rsp - 8], rax
00fff 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01006 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0100d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01012 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0101a 488f842490000000               pop        qword ptr [rsp + 0x90]
01022 48894424f8                     mov        qword ptr [rsp - 8], rax
01027 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0102e 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01035 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0103a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01042 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0104a 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
01052 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
0105a 90                             nop        
0105b e88037afff                     call       0x7fb3b36cda60
01060 0f1f840058110007               nop        dword ptr [rax + rax + 0x7001158]
01068 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01072 4883e4f0                       and        rsp, 0xfffffffffffffff0
01076 e825c96518                     call       0x7fb3cc236c20
0107b f4                             hlt        
0107c 4533c0                         xor        r8d, r8d
0107f 493bc8                         cmp        rcx, r8
01082 bdffffffff                     mov        ebp, 0xffffffff
01087 7c08                           jl         0x7fb3b3bda311
01089 400f95c5                       setne      bpl
0108d 400fb6ed                       movzx      ebp, bpl
01091 be45ffffff                     mov        esi, 0xffffff45
01096 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0109b 48894424f8                     mov        qword ptr [rsp - 8], rax
010a0 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
010a7 89442460                       mov        dword ptr [rsp + 0x60], eax
010ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b0 48894424f8                     mov        qword ptr [rsp - 8], rax
010b5 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
010bc 89442464                       mov        dword ptr [rsp + 0x64], eax
010c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c5 48894424f8                     mov        qword ptr [rsp - 8], rax
010ca 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
010d1 89442468                       mov        dword ptr [rsp + 0x68], eax
010d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010da 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
010e2 488f842480000000               pop        qword ptr [rsp + 0x80]
010ea 48894424f8                     mov        qword ptr [rsp - 8], rax
010ef 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010f6 8944246c                       mov        dword ptr [rsp + 0x6c], eax
010fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01104 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0110b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01112 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01117 48894424f8                     mov        qword ptr [rsp - 8], rax
0111c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01123 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
0112a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0112f 48894424f8                     mov        qword ptr [rsp - 8], rax
01134 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0113b 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01142 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01147 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0114f 488f842498000000               pop        qword ptr [rsp + 0x98]
01157 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
0115f 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01167 48894424f8                     mov        qword ptr [rsp - 8], rax
0116c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01173 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0117a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117f 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01187 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0118f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01197 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
0119f e83c36afff                     call       0x7fb3b36cda60
011a4 0f1f84009c120008               nop        dword ptr [rax + rax + 0x800129c]
011ac 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
011b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ba e8e1c76518                     call       0x7fb3cc236c20
011bf f4                             hlt        
011c0 be45ffffff                     mov        esi, 0xffffff45
011c5 48894424f8                     mov        qword ptr [rsp - 8], rax
011ca 8b442408                       mov        eax, dword ptr [rsp + 8]
011ce 890424                         mov        dword ptr [rsp], eax
011d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d6 48894424f8                     mov        qword ptr [rsp - 8], rax
011db 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
011df 89442404                       mov        dword ptr [rsp + 4], eax
011e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e8 48ff742410                     push       qword ptr [rsp + 0x10]
011ed 488f442408                     pop        qword ptr [rsp + 8]
011f2 48ff742418                     push       qword ptr [rsp + 0x18]
011f7 488f442410                     pop        qword ptr [rsp + 0x10]
011fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01201 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01205 89442418                       mov        dword ptr [rsp + 0x18], eax
01209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0120e 48894424f8                     mov        qword ptr [rsp - 8], rax
01213 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01217 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0121b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01220 48894424f8                     mov        qword ptr [rsp - 8], rax
01225 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01229 89442420                       mov        dword ptr [rsp + 0x20], eax
0122d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01232 48894424f8                     mov        qword ptr [rsp - 8], rax
01237 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0123b 89442424                       mov        dword ptr [rsp + 0x24], eax
0123f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01244 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01249 48ff742438                     push       qword ptr [rsp + 0x38]
0124e 488f442430                     pop        qword ptr [rsp + 0x30]
01253 48894424f8                     mov        qword ptr [rsp - 8], rax
01258 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0125c 89442438                       mov        dword ptr [rsp + 0x38], eax
01260 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01265 48894424f8                     mov        qword ptr [rsp - 8], rax
0126a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0126e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01272 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01277 48ff742448                     push       qword ptr [rsp + 0x48]
0127c 488f442440                     pop        qword ptr [rsp + 0x40]
01281 48ff742450                     push       qword ptr [rsp + 0x50]
01286 488f442448                     pop        qword ptr [rsp + 0x48]
0128b 48ff742458                     push       qword ptr [rsp + 0x58]
01290 488f442450                     pop        qword ptr [rsp + 0x50]
01295 48894424f8                     mov        qword ptr [rsp - 8], rax
0129a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
012a1 89442458                       mov        dword ptr [rsp + 0x58], eax
012a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012aa 48894424f8                     mov        qword ptr [rsp - 8], rax
012af 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
012b6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bf 48894424f8                     mov        qword ptr [rsp - 8], rax
012c4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
012cb 89442460                       mov        dword ptr [rsp + 0x60], eax
012cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d4 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
012dc 488f442468                     pop        qword ptr [rsp + 0x68]
012e1 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
012e9 488f442478                     pop        qword ptr [rsp + 0x78]
012ee 48894424f8                     mov        qword ptr [rsp - 8], rax
012f3 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
012fa 89442464                       mov        dword ptr [rsp + 0x64], eax
012fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01303 48894424f8                     mov        qword ptr [rsp - 8], rax
01308 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0130f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01316 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131b 48894424f8                     mov        qword ptr [rsp - 8], rax
01320 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01327 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0132e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01333 48894424f8                     mov        qword ptr [rsp - 8], rax
01338 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0133f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01346 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0134b 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01353 488f842490000000               pop        qword ptr [rsp + 0x90]
0135b 48894424f8                     mov        qword ptr [rsp - 8], rax
01360 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01367 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0136e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01373 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0137b e86034afff                     call       0x7fb3b36cda60
01380 0f1f840078140009               nop        dword ptr [rax + rax + 0x9001478]
01388 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01392 4883e4f0                       and        rsp, 0xfffffffffffffff0
01396 e805c66518                     call       0x7fb3cc236c20
0139b f4                             hlt        
0139c be45ffffff                     mov        esi, 0xffffff45
013a1 48894424f8                     mov        qword ptr [rsp - 8], rax
013a6 8b442408                       mov        eax, dword ptr [rsp + 8]
013aa 890424                         mov        dword ptr [rsp], eax
013ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b2 48894424f8                     mov        qword ptr [rsp - 8], rax
013b7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
013bb 89442404                       mov        dword ptr [rsp + 4], eax
013bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c4 48ff742410                     push       qword ptr [rsp + 0x10]
013c9 488f442408                     pop        qword ptr [rsp + 8]
013ce 48ff742418                     push       qword ptr [rsp + 0x18]
013d3 488f442410                     pop        qword ptr [rsp + 0x10]
013d8 48894424f8                     mov        qword ptr [rsp - 8], rax
013dd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013e1 89442418                       mov        dword ptr [rsp + 0x18], eax
013e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ea 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013ef e8ec33afff                     call       0x7fb3b36cda60
013f4 0f1f8400ec14000a               nop        dword ptr [rax + rax + 0xa0014ec]
013fc 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01406 4883e4f0                       and        rsp, 0xfffffffffffffff0
0140a e891c56518                     call       0x7fb3cc236c20
0140f f4                             hlt        
01410 be45ffffff                     mov        esi, 0xffffff45
01415 48894424f8                     mov        qword ptr [rsp - 8], rax
0141a 8b442408                       mov        eax, dword ptr [rsp + 8]
0141e 890424                         mov        dword ptr [rsp], eax
01421 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01426 48894424f8                     mov        qword ptr [rsp - 8], rax
0142b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0142f 89442404                       mov        dword ptr [rsp + 4], eax
01433 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01438 48ff742410                     push       qword ptr [rsp + 0x10]
0143d 488f442408                     pop        qword ptr [rsp + 8]
01442 48ff742418                     push       qword ptr [rsp + 0x18]
01447 488f442410                     pop        qword ptr [rsp + 0x10]
0144c 48894424f8                     mov        qword ptr [rsp - 8], rax
01451 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01455 89442418                       mov        dword ptr [rsp + 0x18], eax
01459 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145e 48894424f8                     mov        qword ptr [rsp - 8], rax
01463 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01467 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0146b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01470 48894424f8                     mov        qword ptr [rsp - 8], rax
01475 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01479 89442420                       mov        dword ptr [rsp + 0x20], eax
0147d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01482 48894424f8                     mov        qword ptr [rsp - 8], rax
01487 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0148b 89442424                       mov        dword ptr [rsp + 0x24], eax
0148f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01494 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01499 48ff742438                     push       qword ptr [rsp + 0x38]
0149e 488f442430                     pop        qword ptr [rsp + 0x30]
014a3 48894424f8                     mov        qword ptr [rsp - 8], rax
014a8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014ac 89442438                       mov        dword ptr [rsp + 0x38], eax
014b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ba 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014be 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c7 48ff742448                     push       qword ptr [rsp + 0x48]
014cc 488f442440                     pop        qword ptr [rsp + 0x40]
014d1 48ff742450                     push       qword ptr [rsp + 0x50]
014d6 488f442448                     pop        qword ptr [rsp + 0x48]
014db 48ff742458                     push       qword ptr [rsp + 0x58]
014e0 488f442450                     pop        qword ptr [rsp + 0x50]
014e5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ea 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
014f1 89442458                       mov        dword ptr [rsp + 0x58], eax
014f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fa 48894424f8                     mov        qword ptr [rsp - 8], rax
014ff 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01506 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0150a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150f 48894424f8                     mov        qword ptr [rsp - 8], rax
01514 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0151b 89442460                       mov        dword ptr [rsp + 0x60], eax
0151f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01524 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0152c 488f442468                     pop        qword ptr [rsp + 0x68]
01531 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01539 488f442470                     pop        qword ptr [rsp + 0x70]
0153e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01546 488f442478                     pop        qword ptr [rsp + 0x78]
0154b 48894424f8                     mov        qword ptr [rsp - 8], rax
01550 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01557 89442464                       mov        dword ptr [rsp + 0x64], eax
0155b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01560 48894424f8                     mov        qword ptr [rsp - 8], rax
01565 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0156c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01573 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01578 48894424f8                     mov        qword ptr [rsp - 8], rax
0157d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01584 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0158b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01590 48894424f8                     mov        qword ptr [rsp - 8], rax
01595 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0159c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
015a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a8 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
015b0 488f842490000000               pop        qword ptr [rsp + 0x90]
015b8 48894424f8                     mov        qword ptr [rsp - 8], rax
015bd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
015c4 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
015cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d0 90                             nop        
015d1 90                             nop        
015d2 90                             nop        
015d3 e80832afff                     call       0x7fb3b36cda60
015d8 0f1f8400d016000b               nop        dword ptr [rax + rax + 0xb0016d0]
015e0 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
015ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ee e8adc36518                     call       0x7fb3cc236c20
015f3 f4                             hlt        
015f4 be45ffffff                     mov        esi, 0xffffff45
015f9 48894424f8                     mov        qword ptr [rsp - 8], rax
015fe 8b442408                       mov        eax, dword ptr [rsp + 8]
01602 890424                         mov        dword ptr [rsp], eax
01605 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160a 48894424f8                     mov        qword ptr [rsp - 8], rax
0160f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01613 89442404                       mov        dword ptr [rsp + 4], eax
01617 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161c 48ff742410                     push       qword ptr [rsp + 0x10]
01621 488f442408                     pop        qword ptr [rsp + 8]
01626 48ff742418                     push       qword ptr [rsp + 0x18]
0162b 488f442410                     pop        qword ptr [rsp + 0x10]
01630 48894424f8                     mov        qword ptr [rsp - 8], rax
01635 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01639 89442418                       mov        dword ptr [rsp + 0x18], eax
0163d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01642 48894424f8                     mov        qword ptr [rsp - 8], rax
01647 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0164b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0164f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01654 48894424f8                     mov        qword ptr [rsp - 8], rax
01659 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0165d 89442420                       mov        dword ptr [rsp + 0x20], eax
01661 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01666 48894424f8                     mov        qword ptr [rsp - 8], rax
0166b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0166f 89442424                       mov        dword ptr [rsp + 0x24], eax
01673 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01678 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0167d 48ff742438                     push       qword ptr [rsp + 0x38]
01682 488f442430                     pop        qword ptr [rsp + 0x30]
01687 48894424f8                     mov        qword ptr [rsp - 8], rax
0168c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01690 89442438                       mov        dword ptr [rsp + 0x38], eax
01694 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01699 48894424f8                     mov        qword ptr [rsp - 8], rax
0169e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
016a2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ab 48ff742448                     push       qword ptr [rsp + 0x48]
016b0 488f442440                     pop        qword ptr [rsp + 0x40]
016b5 48ff742450                     push       qword ptr [rsp + 0x50]
016ba 488f442448                     pop        qword ptr [rsp + 0x48]
016bf 48ff742458                     push       qword ptr [rsp + 0x58]
016c4 488f442450                     pop        qword ptr [rsp + 0x50]
016c9 48894424f8                     mov        qword ptr [rsp - 8], rax
016ce 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
016d5 89442458                       mov        dword ptr [rsp + 0x58], eax
016d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016de 48894424f8                     mov        qword ptr [rsp - 8], rax
016e3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
016ea 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f3 48894424f8                     mov        qword ptr [rsp - 8], rax
016f8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016ff 89442460                       mov        dword ptr [rsp + 0x60], eax
01703 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01708 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01710 488f442468                     pop        qword ptr [rsp + 0x68]
01715 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0171d 488f442470                     pop        qword ptr [rsp + 0x70]
01722 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0172a 488f442478                     pop        qword ptr [rsp + 0x78]
0172f 48894424f8                     mov        qword ptr [rsp - 8], rax
01734 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0173b 89442464                       mov        dword ptr [rsp + 0x64], eax
0173f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01744 48894424f8                     mov        qword ptr [rsp - 8], rax
01749 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01750 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175c 48894424f8                     mov        qword ptr [rsp - 8], rax
01761 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01768 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0176f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01774 48894424f8                     mov        qword ptr [rsp - 8], rax
01779 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01780 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01787 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178c 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01794 488f842490000000               pop        qword ptr [rsp + 0x90]
0179c 48894424f8                     mov        qword ptr [rsp - 8], rax
017a1 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
017a8 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 48894424f8                     mov        qword ptr [rsp - 8], rax
017b9 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
017c0 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
017c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cc 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017d4 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
017dc 90                             nop        
017dd 90                             nop        
017de 90                             nop        
017df e8fc2fafff                     call       0x7fb3b36cda60
017e4 0f1f8400dc18000c               nop        dword ptr [rax + rax + 0xc0018dc]
017ec 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
017f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fa e8a1c16518                     call       0x7fb3cc236c20
017ff f4                             hlt        
01800 be45ffffff                     mov        esi, 0xffffff45
01805 48894424f8                     mov        qword ptr [rsp - 8], rax
0180a 8b442408                       mov        eax, dword ptr [rsp + 8]
0180e 890424                         mov        dword ptr [rsp], eax
01811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01816 48894424f8                     mov        qword ptr [rsp - 8], rax
0181b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0181f 89442404                       mov        dword ptr [rsp + 4], eax
01823 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01828 48ff742410                     push       qword ptr [rsp + 0x10]
0182d 488f442408                     pop        qword ptr [rsp + 8]
01832 48ff742418                     push       qword ptr [rsp + 0x18]
01837 488f442410                     pop        qword ptr [rsp + 0x10]
0183c 48894424f8                     mov        qword ptr [rsp - 8], rax
01841 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01845 89442418                       mov        dword ptr [rsp + 0x18], eax
01849 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184e 48894424f8                     mov        qword ptr [rsp - 8], rax
01853 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01857 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0185b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01869 89442420                       mov        dword ptr [rsp + 0x20], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 48894424f8                     mov        qword ptr [rsp - 8], rax
01877 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0187b 89442424                       mov        dword ptr [rsp + 0x24], eax
0187f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01884 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01889 48ff742438                     push       qword ptr [rsp + 0x38]
0188e 488f442430                     pop        qword ptr [rsp + 0x30]
01893 48894424f8                     mov        qword ptr [rsp - 8], rax
01898 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0189c 89442438                       mov        dword ptr [rsp + 0x38], eax
018a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a5 48894424f8                     mov        qword ptr [rsp - 8], rax
018aa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b7 48ff742448                     push       qword ptr [rsp + 0x48]
018bc 488f442440                     pop        qword ptr [rsp + 0x40]
018c1 48ff742450                     push       qword ptr [rsp + 0x50]
018c6 488f442448                     pop        qword ptr [rsp + 0x48]
018cb 48ff742458                     push       qword ptr [rsp + 0x58]
018d0 488f442450                     pop        qword ptr [rsp + 0x50]
018d5 48894424f8                     mov        qword ptr [rsp - 8], rax
018da 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
018e1 89442458                       mov        dword ptr [rsp + 0x58], eax
018e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ea 48894424f8                     mov        qword ptr [rsp - 8], rax
018ef 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
018f6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01904 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0190b 89442460                       mov        dword ptr [rsp + 0x60], eax
0190f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01914 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0191c 488f442468                     pop        qword ptr [rsp + 0x68]
01921 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01929 488f442470                     pop        qword ptr [rsp + 0x70]
0192e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01936 488f442478                     pop        qword ptr [rsp + 0x78]
0193b 48894424f8                     mov        qword ptr [rsp - 8], rax
01940 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01947 89442464                       mov        dword ptr [rsp + 0x64], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48894424f8                     mov        qword ptr [rsp - 8], rax
01955 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0195c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01963 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01968 48894424f8                     mov        qword ptr [rsp - 8], rax
0196d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01974 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48894424f8                     mov        qword ptr [rsp - 8], rax
01985 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0198c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01998 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019a0 488f842490000000               pop        qword ptr [rsp + 0x90]
019a8 48894424f8                     mov        qword ptr [rsp - 8], rax
019ad 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
019b4 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
019bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c0 48894424f8                     mov        qword ptr [rsp - 8], rax
019c5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
019cc 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
019d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d8 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019e0 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
019e8 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
019f0 90                             nop        
019f1 90                             nop        
019f2 90                             nop        
019f3 e8e82dafff                     call       0x7fb3b36cda60
019f8 0f1f8400f01a000d               nop        dword ptr [rax + rax + 0xd001af0]
01a00 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a0e e88dbf6518                     call       0x7fb3cc236c20
01a13 f4                             hlt        
01a14 be45ffffff                     mov        esi, 0xffffff45
01a19 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1e 8b442408                       mov        eax, dword ptr [rsp + 8]
01a22 890424                         mov        dword ptr [rsp], eax
01a25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a33 89442404                       mov        dword ptr [rsp + 4], eax
01a37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3c 48ff742410                     push       qword ptr [rsp + 0x10]
01a41 488f442408                     pop        qword ptr [rsp + 8]
01a46 48ff742418                     push       qword ptr [rsp + 0x18]
01a4b 488f442410                     pop        qword ptr [rsp + 0x10]
01a50 48894424f8                     mov        qword ptr [rsp - 8], rax
01a55 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a59 89442418                       mov        dword ptr [rsp + 0x18], eax
01a5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a62 48894424f8                     mov        qword ptr [rsp - 8], rax
01a67 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a6b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a74 48894424f8                     mov        qword ptr [rsp - 8], rax
01a79 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a7d 89442420                       mov        dword ptr [rsp + 0x20], eax
01a81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a86 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a8f 89442424                       mov        dword ptr [rsp + 0x24], eax
01a93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a98 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a9d 48ff742438                     push       qword ptr [rsp + 0x38]
01aa2 488f442430                     pop        qword ptr [rsp + 0x30]
01aa7 48894424f8                     mov        qword ptr [rsp - 8], rax
01aac 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ab0 89442438                       mov        dword ptr [rsp + 0x38], eax
01ab4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab9 48894424f8                     mov        qword ptr [rsp - 8], rax
01abe 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ac2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ac6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01acb 48ff742448                     push       qword ptr [rsp + 0x48]
01ad0 488f442440                     pop        qword ptr [rsp + 0x40]
01ad5 48ff742450                     push       qword ptr [rsp + 0x50]
01ada 488f442448                     pop        qword ptr [rsp + 0x48]
01adf 48ff742458                     push       qword ptr [rsp + 0x58]
01ae4 488f442450                     pop        qword ptr [rsp + 0x50]
01ae9 48894424f8                     mov        qword ptr [rsp - 8], rax
01aee 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01af5 89442458                       mov        dword ptr [rsp + 0x58], eax
01af9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afe 48894424f8                     mov        qword ptr [rsp - 8], rax
01b03 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b0a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b13 48894424f8                     mov        qword ptr [rsp - 8], rax
01b18 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b1f 89442460                       mov        dword ptr [rsp + 0x60], eax
01b23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b28 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b30 488f442468                     pop        qword ptr [rsp + 0x68]
01b35 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b3d 488f442478                     pop        qword ptr [rsp + 0x78]
01b42 48894424f8                     mov        qword ptr [rsp - 8], rax
01b47 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b4e 89442464                       mov        dword ptr [rsp + 0x64], eax
01b52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b57 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b63 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b74 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01b7b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b87 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8c 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01b93 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ba7 488f842490000000               pop        qword ptr [rsp + 0x90]
01baf 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01bbb 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01bc2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc7 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01bcf 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01bd7 89bc24bc000000                 mov        dword ptr [rsp + 0xbc], edi
01bde 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01be6 90                             nop        
01be7 e8f42bafff                     call       0x7fb3b36cda60
01bec 0f1f8400e41c000e               nop        dword ptr [rax + rax + 0xe001ce4]
01bf4 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01bfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c02 e899bd6518                     call       0x7fb3cc236c20
01c07 f4                             hlt        
01c08 41b8ffffff7f                   mov        r8d, 0x7fffffff
01c0e 493bc8                         cmp        rcx, r8
01c11 bdffffffff                     mov        ebp, 0xffffffff
01c16 7c08                           jl         0x7fb3b3bdaea0
01c18 400f95c5                       setne      bpl
01c1c 400fb6ed                       movzx      ebp, bpl
01c20 be45ffffff                     mov        esi, 0xffffff45
01c25 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01c36 89442460                       mov        dword ptr [rsp + 0x60], eax
01c3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c44 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01c4b 89442464                       mov        dword ptr [rsp + 0x64], eax
01c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c54 48894424f8                     mov        qword ptr [rsp - 8], rax
01c59 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c60 89442468                       mov        dword ptr [rsp + 0x68], eax
01c64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c69 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01c71 488f842480000000               pop        qword ptr [rsp + 0x80]
01c79 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c85 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c93 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01c9a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ca1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cab 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01cb2 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01cb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01cca 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd6 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cde 488f842498000000               pop        qword ptr [rsp + 0x98]
01ce6 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01cee 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfb 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01d02 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01d09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d16 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01d1e 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01d26 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01d2e 90                             nop        
01d2f e8ac2aafff                     call       0x7fb3b36cda60
01d34 0f1f84002c1e000f               nop        dword ptr [rax + rax + 0xf001e2c]
01d3c 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01d46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4a e851bc6518                     call       0x7fb3cc236c20
01d4f f4                             hlt        
01d50 be45ffffff                     mov        esi, 0xffffff45
01d55 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5a 8b442408                       mov        eax, dword ptr [rsp + 8]
01d5e 890424                         mov        dword ptr [rsp], eax
01d61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d66 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d6f 89442404                       mov        dword ptr [rsp + 4], eax
01d73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d78 48ff742410                     push       qword ptr [rsp + 0x10]
01d7d 488f442408                     pop        qword ptr [rsp + 8]
01d82 48ff742418                     push       qword ptr [rsp + 0x18]
01d87 488f442410                     pop        qword ptr [rsp + 0x10]
01d8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d91 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d95 89442418                       mov        dword ptr [rsp + 0x18], eax
01d99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01da3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01da7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db0 48894424f8                     mov        qword ptr [rsp - 8], rax
01db5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01db9 89442420                       mov        dword ptr [rsp + 0x20], eax
01dbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dcb 89442424                       mov        dword ptr [rsp + 0x24], eax
01dcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01dd9 48ff742438                     push       qword ptr [rsp + 0x38]
01dde 488f442430                     pop        qword ptr [rsp + 0x30]
01de3 48894424f8                     mov        qword ptr [rsp - 8], rax
01de8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01dec 89442438                       mov        dword ptr [rsp + 0x38], eax
01df0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfa 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01dfe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e07 48ff742448                     push       qword ptr [rsp + 0x48]
01e0c 488f442440                     pop        qword ptr [rsp + 0x40]
01e11 48ff742450                     push       qword ptr [rsp + 0x50]
01e16 488f442448                     pop        qword ptr [rsp + 0x48]
01e1b 48ff742458                     push       qword ptr [rsp + 0x58]
01e20 488f442450                     pop        qword ptr [rsp + 0x50]
01e25 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01e31 89442458                       mov        dword ptr [rsp + 0x58], eax
01e35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01e46 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e54 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e64 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01e69 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e75 89442464                       mov        dword ptr [rsp + 0x64], eax
01e79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e83 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01e8a 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e96 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9b 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01ea2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eae 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb3 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01eba 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ec1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec6 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ece 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01ed6 90                             nop        
01ed7 e80429afff                     call       0x7fb3b36cda60
01edc 0f1f8400d41f0010               nop        dword ptr [rax + rax + 0x10001fd4]
01ee4 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
01eee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ef2 e8a9ba6518                     call       0x7fb3cc236c20
01ef7 f4                             hlt        
01ef8 be45ffffff                     mov        esi, 0xffffff45
01efd 48894424f8                     mov        qword ptr [rsp - 8], rax
01f02 8b442408                       mov        eax, dword ptr [rsp + 8]
01f06 890424                         mov        dword ptr [rsp], eax
01f09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f13 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f17 89442404                       mov        dword ptr [rsp + 4], eax
01f1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f20 48ff742410                     push       qword ptr [rsp + 0x10]
01f25 488f442408                     pop        qword ptr [rsp + 8]
01f2a 48ff742418                     push       qword ptr [rsp + 0x18]
01f2f 488f442410                     pop        qword ptr [rsp + 0x10]
01f34 48894424f8                     mov        qword ptr [rsp - 8], rax
01f39 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f3d 89442418                       mov        dword ptr [rsp + 0x18], eax
01f41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f46 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f4f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f58 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f61 89442420                       mov        dword ptr [rsp + 0x20], eax
01f65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f73 89442424                       mov        dword ptr [rsp + 0x24], eax
01f77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f81 48ff742438                     push       qword ptr [rsp + 0x38]
01f86 488f442430                     pop        qword ptr [rsp + 0x30]
01f8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f90 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f94 89442438                       mov        dword ptr [rsp + 0x38], eax
01f98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01fa6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01faa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01faf 48ff742448                     push       qword ptr [rsp + 0x48]
01fb4 488f442440                     pop        qword ptr [rsp + 0x40]
01fb9 48ff742450                     push       qword ptr [rsp + 0x50]
01fbe 488f442448                     pop        qword ptr [rsp + 0x48]
01fc3 48ff742458                     push       qword ptr [rsp + 0x58]
01fc8 488f442450                     pop        qword ptr [rsp + 0x50]
01fcd 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fd9 89442458                       mov        dword ptr [rsp + 0x58], eax
01fdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01fee 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ff2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02003 89442460                       mov        dword ptr [rsp + 0x60], eax
02007 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200c 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02011 48894424f8                     mov        qword ptr [rsp - 8], rax
02016 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0201d 89442464                       mov        dword ptr [rsp + 0x64], eax
02021 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02026 48894424f8                     mov        qword ptr [rsp - 8], rax
0202b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
02032 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02039 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203e 48894424f8                     mov        qword ptr [rsp - 8], rax
02043 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0204a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 48894424f8                     mov        qword ptr [rsp - 8], rax
0205b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
02062 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02069 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02076 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
0207e 90                             nop        
0207f e85c27afff                     call       0x7fb3b36cda60
02084 0f1f84007c210011               nop        dword ptr [rax + rax + 0x1100217c]
0208c 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e801b96518                     call       0x7fb3cc236c20
0209f f4                             hlt        
020a0 be3dffffff                     mov        esi, 0xffffff3d
020a5 48894424f8                     mov        qword ptr [rsp - 8], rax
020aa 8b442408                       mov        eax, dword ptr [rsp + 8]
020ae 890424                         mov        dword ptr [rsp], eax
020b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b6 48894424f8                     mov        qword ptr [rsp - 8], rax
020bb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020bf 89442404                       mov        dword ptr [rsp + 4], eax
020c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c8 48ff742410                     push       qword ptr [rsp + 0x10]
020cd 488f442408                     pop        qword ptr [rsp + 8]
020d2 48ff742418                     push       qword ptr [rsp + 0x18]
020d7 488f442410                     pop        qword ptr [rsp + 0x10]
020dc 48894424f8                     mov        qword ptr [rsp - 8], rax
020e1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020e5 89442418                       mov        dword ptr [rsp + 0x18], eax
020e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ee 48894424f8                     mov        qword ptr [rsp - 8], rax
020f3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020f7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02100 48894424f8                     mov        qword ptr [rsp - 8], rax
02105 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02109 89442420                       mov        dword ptr [rsp + 0x20], eax
0210d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02112 48894424f8                     mov        qword ptr [rsp - 8], rax
02117 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0211b 89442424                       mov        dword ptr [rsp + 0x24], eax
0211f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02124 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02129 48ff742438                     push       qword ptr [rsp + 0x38]
0212e 488f442430                     pop        qword ptr [rsp + 0x30]
02133 48894424f8                     mov        qword ptr [rsp - 8], rax
02138 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0213c 89442438                       mov        dword ptr [rsp + 0x38], eax
02140 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02145 48894424f8                     mov        qword ptr [rsp - 8], rax
0214a 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0214e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02152 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02157 48ff742448                     push       qword ptr [rsp + 0x48]
0215c 488f442440                     pop        qword ptr [rsp + 0x40]
02161 48ff742450                     push       qword ptr [rsp + 0x50]
02166 488f442448                     pop        qword ptr [rsp + 0x48]
0216b 48ff742458                     push       qword ptr [rsp + 0x58]
02170 488f442450                     pop        qword ptr [rsp + 0x50]
02175 48894424f8                     mov        qword ptr [rsp - 8], rax
0217a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02181 89442458                       mov        dword ptr [rsp + 0x58], eax
02185 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218a 48894424f8                     mov        qword ptr [rsp - 8], rax
0218f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02196 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0219a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219f 48894424f8                     mov        qword ptr [rsp - 8], rax
021a4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021ab 89442460                       mov        dword ptr [rsp + 0x60], eax
021af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b4 4c89442478                     mov        qword ptr [rsp + 0x78], r8
021b9 48894424f8                     mov        qword ptr [rsp - 8], rax
021be 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021c5 89442464                       mov        dword ptr [rsp + 0x64], eax
021c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ce 48894424f8                     mov        qword ptr [rsp - 8], rax
021d3 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
021da 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e6 48894424f8                     mov        qword ptr [rsp - 8], rax
021eb 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
021f2 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02203 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0220a 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02211 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02216 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0221e 488f842490000000               pop        qword ptr [rsp + 0x90]
02226 48894424f8                     mov        qword ptr [rsp - 8], rax
0222b 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02232 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
02239 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02246 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0224e 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02256 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0225e 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02266 48894424f8                     mov        qword ptr [rsp - 8], rax
0226b 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02272 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02286 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
0228e 898c24d8000000                 mov        dword ptr [rsp + 0xd8], ecx
02295 90                             nop        
02296 90                             nop        
02297 e84425afff                     call       0x7fb3b36cda60
0229c 0f1f840094230012               nop        dword ptr [rax + rax + 0x12002394]
022a4 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
022ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
022b2 e8e9b66518                     call       0x7fb3cc236c20
022b7 f4                             hlt        
022b8 be45ffffff                     mov        esi, 0xffffff45
022bd 48894424f8                     mov        qword ptr [rsp - 8], rax
022c2 8b442408                       mov        eax, dword ptr [rsp + 8]
022c6 890424                         mov        dword ptr [rsp], eax
022c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ce 48894424f8                     mov        qword ptr [rsp - 8], rax
022d3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022d7 89442404                       mov        dword ptr [rsp + 4], eax
022db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e0 48ff742410                     push       qword ptr [rsp + 0x10]
022e5 488f442408                     pop        qword ptr [rsp + 8]
022ea 48ff742418                     push       qword ptr [rsp + 0x18]
022ef 488f442410                     pop        qword ptr [rsp + 0x10]
022f4 48894424f8                     mov        qword ptr [rsp - 8], rax
022f9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022fd 89442418                       mov        dword ptr [rsp + 0x18], eax
02301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02306 48894424f8                     mov        qword ptr [rsp - 8], rax
0230b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0230f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02313 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02318 48894424f8                     mov        qword ptr [rsp - 8], rax
0231d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02321 89442420                       mov        dword ptr [rsp + 0x20], eax
02325 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232a 48894424f8                     mov        qword ptr [rsp - 8], rax
0232f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02333 89442424                       mov        dword ptr [rsp + 0x24], eax
02337 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02341 48ff742438                     push       qword ptr [rsp + 0x38]
02346 488f442430                     pop        qword ptr [rsp + 0x30]
0234b 48894424f8                     mov        qword ptr [rsp - 8], rax
02350 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02354 89442438                       mov        dword ptr [rsp + 0x38], eax
02358 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235d 48894424f8                     mov        qword ptr [rsp - 8], rax
02362 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02366 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0236a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236f 48ff742448                     push       qword ptr [rsp + 0x48]
02374 488f442440                     pop        qword ptr [rsp + 0x40]
02379 48ff742450                     push       qword ptr [rsp + 0x50]
0237e 488f442448                     pop        qword ptr [rsp + 0x48]
02383 48ff742458                     push       qword ptr [rsp + 0x58]
02388 488f442450                     pop        qword ptr [rsp + 0x50]
0238d 89542458                       mov        dword ptr [rsp + 0x58], edx
02391 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02399 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
023a1 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
023a9 90                             nop        
023aa 90                             nop        
023ab e83024afff                     call       0x7fb3b36cda60
023b0 0f1f8400a8240013               nop        dword ptr [rax + rax + 0x130024a8]
023b8 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
023c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023c6 e8d5b56518                     call       0x7fb3cc236c20
023cb f4                             hlt        
023cc be45ffffff                     mov        esi, 0xffffff45
023d1 48894424f8                     mov        qword ptr [rsp - 8], rax
023d6 8b442408                       mov        eax, dword ptr [rsp + 8]
023da 890424                         mov        dword ptr [rsp], eax
023dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e2 48894424f8                     mov        qword ptr [rsp - 8], rax
023e7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023eb 89442404                       mov        dword ptr [rsp + 4], eax
023ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f4 48ff742410                     push       qword ptr [rsp + 0x10]
023f9 488f442408                     pop        qword ptr [rsp + 8]
023fe 48ff742418                     push       qword ptr [rsp + 0x18]
02403 488f442410                     pop        qword ptr [rsp + 0x10]
02408 48894424f8                     mov        qword ptr [rsp - 8], rax
0240d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02411 89442418                       mov        dword ptr [rsp + 0x18], eax
02415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241a 48894424f8                     mov        qword ptr [rsp - 8], rax
0241f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02423 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242c 48894424f8                     mov        qword ptr [rsp - 8], rax
02431 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02435 89442420                       mov        dword ptr [rsp + 0x20], eax
02439 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243e 48894424f8                     mov        qword ptr [rsp - 8], rax
02443 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02447 89442424                       mov        dword ptr [rsp + 0x24], eax
0244b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02450 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02455 48ff742438                     push       qword ptr [rsp + 0x38]
0245a 488f442430                     pop        qword ptr [rsp + 0x30]
0245f 48894424f8                     mov        qword ptr [rsp - 8], rax
02464 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02468 89442438                       mov        dword ptr [rsp + 0x38], eax
0246c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02471 48894424f8                     mov        qword ptr [rsp - 8], rax
02476 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0247a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0247e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02483 48ff742448                     push       qword ptr [rsp + 0x48]
02488 488f442440                     pop        qword ptr [rsp + 0x40]
0248d 48ff742450                     push       qword ptr [rsp + 0x50]
02492 488f442448                     pop        qword ptr [rsp + 0x48]
02497 48ff742458                     push       qword ptr [rsp + 0x58]
0249c 488f442450                     pop        qword ptr [rsp + 0x50]
024a1 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
024a8 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024b0 90                             nop        
024b1 90                             nop        
024b2 90                             nop        
024b3 e82823afff                     call       0x7fb3b36cda60
024b8 0f1f8400b0250014               nop        dword ptr [rax + rax + 0x140025b0]
024c0 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
024ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ce e8cdb46518                     call       0x7fb3cc236c20
024d3 f4                             hlt        
024d4 be45ffffff                     mov        esi, 0xffffff45
024d9 48894424f8                     mov        qword ptr [rsp - 8], rax
024de 8b442408                       mov        eax, dword ptr [rsp + 8]
024e2 890424                         mov        dword ptr [rsp], eax
024e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ea 48894424f8                     mov        qword ptr [rsp - 8], rax
024ef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
024f3 89442404                       mov        dword ptr [rsp + 4], eax
024f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024fc 48ff742410                     push       qword ptr [rsp + 0x10]
02501 488f442408                     pop        qword ptr [rsp + 8]
02506 48ff742418                     push       qword ptr [rsp + 0x18]
0250b 488f442410                     pop        qword ptr [rsp + 0x10]
02510 48894424f8                     mov        qword ptr [rsp - 8], rax
02515 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02519 89442418                       mov        dword ptr [rsp + 0x18], eax
0251d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02522 48894424f8                     mov        qword ptr [rsp - 8], rax
02527 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0252b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0252f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02534 48894424f8                     mov        qword ptr [rsp - 8], rax
02539 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0253d 89442420                       mov        dword ptr [rsp + 0x20], eax
02541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02546 48894424f8                     mov        qword ptr [rsp - 8], rax
0254b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0254f 89442424                       mov        dword ptr [rsp + 0x24], eax
02553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02558 48ff742438                     push       qword ptr [rsp + 0x38]
0255d 488f442430                     pop        qword ptr [rsp + 0x30]
02562 48894424f8                     mov        qword ptr [rsp - 8], rax
02567 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0256b 89442438                       mov        dword ptr [rsp + 0x38], eax
0256f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02574 48894424f8                     mov        qword ptr [rsp - 8], rax
02579 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0257d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02586 48ff742448                     push       qword ptr [rsp + 0x48]
0258b 488f442440                     pop        qword ptr [rsp + 0x40]
02590 48ff742450                     push       qword ptr [rsp + 0x50]
02595 488f442448                     pop        qword ptr [rsp + 0x48]
0259a 48ff742458                     push       qword ptr [rsp + 0x58]
0259f 488f442450                     pop        qword ptr [rsp + 0x50]
025a4 48894424f8                     mov        qword ptr [rsp - 8], rax
025a9 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
025b0 89442458                       mov        dword ptr [rsp + 0x58], eax
025b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b9 48894424f8                     mov        qword ptr [rsp - 8], rax
025be 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
025c5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ce 48894424f8                     mov        qword ptr [rsp - 8], rax
025d3 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
025da 89442460                       mov        dword ptr [rsp + 0x60], eax
025de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e3 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025eb 488f442468                     pop        qword ptr [rsp + 0x68]
025f0 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
025f8 488f442470                     pop        qword ptr [rsp + 0x70]
025fd 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02605 488f442478                     pop        qword ptr [rsp + 0x78]
0260a 48894424f8                     mov        qword ptr [rsp - 8], rax
0260f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02616 89442464                       mov        dword ptr [rsp + 0x64], eax
0261a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261f 48894424f8                     mov        qword ptr [rsp - 8], rax
02624 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0262b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 48894424f8                     mov        qword ptr [rsp - 8], rax
0263c 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
02643 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0264a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264f 48894424f8                     mov        qword ptr [rsp - 8], rax
02654 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
0265b 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02662 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02667 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0266f 488f842490000000               pop        qword ptr [rsp + 0x90]
02677 48894424f8                     mov        qword ptr [rsp - 8], rax
0267c 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02683 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0268a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
02697 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0269f 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
026a7 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
026af e82c21afff                     call       0x7fb3b36cda60
026b4 0f1f8400ac270015               nop        dword ptr [rax + rax + 0x150027ac]
026bc 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
026c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ca e8d1b26518                     call       0x7fb3cc236c20
026cf f4                             hlt        
026d0 4533d2                         xor        r10d, r10d
026d3 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
026db e9eedaffff                     jmp        0x7fb3b3bd944e
026e0 4533d2                         xor        r10d, r10d
026e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026e8 e90ddbffff                     jmp        0x7fb3b3bd947a
026ed 4533d2                         xor        r10d, r10d
026f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026f5 e927dbffff                     jmp        0x7fb3b3bd94a1
026fa 4533d2                         xor        r10d, r10d
026fd 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02702 e946dbffff                     jmp        0x7fb3b3bd94cd
02707 4533d2                         xor        r10d, r10d
0270a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0270f e963dbffff                     jmp        0x7fb3b3bd94f7
02714 4533d2                         xor        r10d, r10d
02717 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0271c e988dbffff                     jmp        0x7fb3b3bd9529
02721 4533d2                         xor        r10d, r10d
02724 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0272c e9a5dbffff                     jmp        0x7fb3b3bd9556
02731 4533d2                         xor        r10d, r10d
02734 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0273c e9bbdbffff                     jmp        0x7fb3b3bd957c
02741 bebeffffff                     mov        esi, 0xffffffbe
02746 48894424f8                     mov        qword ptr [rsp - 8], rax
0274b 8b442408                       mov        eax, dword ptr [rsp + 8]
0274f 890424                         mov        dword ptr [rsp], eax
02752 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02757 48894424f8                     mov        qword ptr [rsp - 8], rax
0275c 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02760 89442404                       mov        dword ptr [rsp + 4], eax
02764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02769 48ff742410                     push       qword ptr [rsp + 0x10]
0276e 488f442408                     pop        qword ptr [rsp + 8]
02773 48ff742418                     push       qword ptr [rsp + 0x18]
02778 488f442410                     pop        qword ptr [rsp + 0x10]
0277d 48894424f8                     mov        qword ptr [rsp - 8], rax
02782 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02786 89442418                       mov        dword ptr [rsp + 0x18], eax
0278a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278f 48894424f8                     mov        qword ptr [rsp - 8], rax
02794 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02798 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0279c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a1 48894424f8                     mov        qword ptr [rsp - 8], rax
027a6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027aa 89442420                       mov        dword ptr [rsp + 0x20], eax
027ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b3 48894424f8                     mov        qword ptr [rsp - 8], rax
027b8 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
027bc 89442424                       mov        dword ptr [rsp + 0x24], eax
027c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c5 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
027ca 48ff742438                     push       qword ptr [rsp + 0x38]
027cf 488f442430                     pop        qword ptr [rsp + 0x30]
027d4 48894424f8                     mov        qword ptr [rsp - 8], rax
027d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027dd 89442438                       mov        dword ptr [rsp + 0x38], eax
027e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e6 48894424f8                     mov        qword ptr [rsp - 8], rax
027eb 8b442444                       mov        eax, dword ptr [rsp + 0x44]
027ef 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f8 48ff742448                     push       qword ptr [rsp + 0x48]
027fd 488f442440                     pop        qword ptr [rsp + 0x40]
02802 48ff742450                     push       qword ptr [rsp + 0x50]
02807 488f442448                     pop        qword ptr [rsp + 0x48]
0280c 48ff742458                     push       qword ptr [rsp + 0x58]
02811 488f442450                     pop        qword ptr [rsp + 0x50]
02816 90                             nop        
02817 e8c41fafff                     call       0x7fb3b36cda60
0281c 0f1f840014290016               nop        dword ptr [rax + rax + 0x16002914]
02824 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
0282e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02832 e869b16518                     call       0x7fb3cc236c20
02837 f4                             hlt        
02838 be85ffffff                     mov        esi, 0xffffff85
0283d 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02841 48894424f8                     mov        qword ptr [rsp - 8], rax
02846 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0284a 890424                         mov        dword ptr [rsp], eax
0284d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02852 48894424f8                     mov        qword ptr [rsp - 8], rax
02857 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0285b 89442404                       mov        dword ptr [rsp + 4], eax
0285f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02864 48894424f8                     mov        qword ptr [rsp - 8], rax
02869 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0286d 89442408                       mov        dword ptr [rsp + 8], eax
02871 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02876 48894424f8                     mov        qword ptr [rsp - 8], rax
0287b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0287f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02888 48894424f8                     mov        qword ptr [rsp - 8], rax
0288d 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02891 89442410                       mov        dword ptr [rsp + 0x10], eax
02895 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289a 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
0289f 48ff742438                     push       qword ptr [rsp + 0x38]
028a4 488f442420                     pop        qword ptr [rsp + 0x20]
028a9 48894424f8                     mov        qword ptr [rsp - 8], rax
028ae 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028b2 89442414                       mov        dword ptr [rsp + 0x14], eax
028b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028bb 48894424f8                     mov        qword ptr [rsp - 8], rax
028c0 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028c4 89442428                       mov        dword ptr [rsp + 0x28], eax
028c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028cd 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
028d2 90                             nop        
028d3 e8081fafff                     call       0x7fb3b36cda60
028d8 0f1f8400d0290017               nop        dword ptr [rax + rax + 0x170029d0]
028e0 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
028ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ee e8adb06518                     call       0x7fb3cc236c20
028f3 f4                             hlt        
028f4 bef6ffffff                     mov        esi, 0xfffffff6
028f9 90                             nop        
028fa 90                             nop        
028fb e8e01eafff                     call       0x7fb3b36cda60
02900 0f1f8400f8290018               nop        dword ptr [rax + rax + 0x180029f8]
02908 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
02912 4883e4f0                       and        rsp, 0xfffffffffffffff0
02916 e885b06518                     call       0x7fb3cc236c20
0291b f4                             hlt        
0291c be5d000000                     mov        esi, 0x5d
02921 90                             nop        
02922 90                             nop        
02923 e8b81eafff                     call       0x7fb3b36cda60
02928 0f1f8400202a0019               nop        dword ptr [rax + rax + 0x19002a20]
02930 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
0293a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0293e e85db06518                     call       0x7fb3cc236c20
02943 f4                             hlt        
02944 bef6ffffff                     mov        esi, 0xfffffff6
02949 418beb                         mov        ebp, r11d
0294c 90                             nop        
0294d 90                             nop        
0294e 90                             nop        
0294f e88c1eafff                     call       0x7fb3b36cda60
02954 0f1f84004c2a001a               nop        dword ptr [rax + rax + 0x1a002a4c]
0295c 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
02966 4883e4f0                       and        rsp, 0xfffffffffffffff0
0296a e831b06518                     call       0x7fb3cc236c20
0296f f4                             hlt        
02970 bef6ffffff                     mov        esi, 0xfffffff6
02975 8be9                           mov        ebp, ecx
02977 e8641eafff                     call       0x7fb3b36cda60
0297c 0f1f8400742a001b               nop        dword ptr [rax + rax + 0x1b002a74]
02984 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
0298e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02992 e809b06518                     call       0x7fb3cc236c20
02997 f4                             hlt        
02998 bef6ffffff                     mov        esi, 0xfffffff6
0299d 418beb                         mov        ebp, r11d
029a0 90                             nop        
029a1 90                             nop        
029a2 90                             nop        
029a3 e8381eafff                     call       0x7fb3b36cda60
029a8 0f1f8400a02a001c               nop        dword ptr [rax + rax + 0x1c002aa0]
029b0 48bfd0ee138cb37f0000           movabs     rdi, 0x7fb38c13eed0
029ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
029be e8ddaf6518                     call       0x7fb3cc236c20
029c3 f4                             hlt        
029c4 eb00                           jmp        0x7fb3b3bdbc46
029c6 488bf0                         mov        rsi, rax
029c9 e9f6e0ffff                     jmp        0x7fb3b3bd9d44
029ce 49ba139dbdb3b37f0000           movabs     r10, 0x7fb3b3bd9d13
029d8 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
029df e9fc66b5ff                     jmp        0x7fb3b3732360
029e4 e87735b4ff                     call       0x7fb3b371f1e0
029e9 e940d6ffff                     jmp        0x7fb3b3bd92ae
029ee f4                             hlt        
029ef f4                             hlt        
