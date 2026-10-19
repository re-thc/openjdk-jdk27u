00000 e84bb7d618                     call       0x7f63f495ad50
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
00018 4881ec20010000                 sub        rsp, 0x120
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f858a2d0000                   jne        0x7f63dbbf23b8
0002e 4c8baee8010000                 mov        r13, qword ptr [rsi + 0x1e8]
00035 4c8bb6d0010000                 mov        r14, qword ptr [rsi + 0x1d0]
0003c 448b96d0000000                 mov        r10d, dword ptr [rsi + 0xd0]
00043 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0004b 4c8b96c8010000                 mov        r10, qword ptr [rsi + 0x1c8]
00052 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00057 4c8b9660010000                 mov        r10, qword ptr [rsi + 0x160]
0005e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00063 4c8b9658010000                 mov        r10, qword ptr [rsi + 0x158]
0006a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0006f 4c8b9650010000                 mov        r10, qword ptr [rsi + 0x150]
00076 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0007b 4c8b9610010000                 mov        r10, qword ptr [rsi + 0x110]
00082 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0008a 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00091 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00096 448b9ee0010000                 mov        r11d, dword ptr [rsi + 0x1e0]
0009d 44895c2408                     mov        dword ptr [rsp + 8], r11d
000a2 448b96d8010000                 mov        r10d, dword ptr [rsi + 0x1d8]
000a9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
000ae 448b9ec0010000                 mov        r11d, dword ptr [rsi + 0x1c0]
000b5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
000ba 448b96b8010000                 mov        r10d, dword ptr [rsi + 0x1b8]
000c1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
000c6 448b9ea0010000                 mov        r11d, dword ptr [rsi + 0x1a0]
000cd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000d2 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000d9 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000e0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000e5 448b9e70010000                 mov        r11d, dword ptr [rsi + 0x170]
000ec 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000f1 448b9668010000                 mov        r10d, dword ptr [rsi + 0x168]
000f8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
000fd 448b9e28010000                 mov        r11d, dword ptr [rsi + 0x128]
00104 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0010c 448b9620010000                 mov        r10d, dword ptr [rsi + 0x120]
00113 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0011b 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00122 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0012a 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
00131 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00139 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
00140 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00148 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
0014f 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00157 448b96e0000000                 mov        r10d, dword ptr [rsi + 0xe0]
0015e 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00166 448b9ed8000000                 mov        r11d, dword ptr [rsi + 0xd8]
0016d 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00175 448b9698010000                 mov        r10d, dword ptr [rsi + 0x198]
0017c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00181 488bfe                         mov        rdi, rsi
00184 49ba3083b1f4637f0000           movabs     r10, 0x7f63f4b18330
0018e 41ffd2                         call       r10
00191 0f1f840000000000               nop        dword ptr [rax + rax]
00199 4d85ed                         test       r13, r13
0019c 0f847e280000                   je         0x7f63dbbf2020
001a2 458b5d04                       mov        r11d, dword ptr [r13 + 4]
001a6 41c1eb0a                       shr        r11d, 0xa
001aa 4181fb0a020000                 cmp        r11d, 0x20a
001b1 0f85f5290000                   jne        0x7f63dbbf21ac
001b7 4d8bd5                         mov        r10, r13
001ba 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
001c2 4d85f6                         test       r14, r14
001c5 0f8465280000                   je         0x7f63dbbf2030
001cb 458b5604                       mov        r10d, dword ptr [r14 + 4]
001cf 41c1ea0a                       shr        r10d, 0xa
001d3 4181fa2e080000                 cmp        r10d, 0x82e
001da 0f85cc290000                   jne        0x7f63dbbf21ac
001e0 4d8bd6                         mov        r10, r14
001e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001ed 4d85d2                         test       r10, r10
001f0 0f8447280000                   je         0x7f63dbbf203d
001f6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001fa 41c1eb0a                       shr        r11d, 0xa
001fe 4181fb16080000                 cmp        r11d, 0x816
00205 0f85a1290000                   jne        0x7f63dbbf21ac
0020b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00210 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00215 4d85d2                         test       r10, r10
00218 0f842c280000                   je         0x7f63dbbf204a
0021e 458b5204                       mov        r10d, dword ptr [r10 + 4]
00222 41c1ea0a                       shr        r10d, 0xa
00226 4181fa1c080000                 cmp        r10d, 0x81c
0022d 0f8579290000                   jne        0x7f63dbbf21ac
00233 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00238 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0023d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00242 4d85d2                         test       r10, r10
00245 0f840c280000                   je         0x7f63dbbf2057
0024b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0024f 41c1eb0a                       shr        r11d, 0xa
00253 4181fb1c080000                 cmp        r11d, 0x81c
0025a 0f854c290000                   jne        0x7f63dbbf21ac
00260 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00265 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0026a 4d85d2                         test       r10, r10
0026d 0f84f1270000                   je         0x7f63dbbf2064
00273 458b5204                       mov        r10d, dword ptr [r10 + 4]
00277 41c1ea0a                       shr        r10d, 0xa
0027b 4181fa1c080000                 cmp        r10d, 0x81c
00282 0f8524290000                   jne        0x7f63dbbf21ac
00288 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0028d 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00295 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0029d 4d85d2                         test       r10, r10
002a0 0f84ce270000                   je         0x7f63dbbf2074
002a6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002aa 41c1eb0a                       shr        r11d, 0xa
002ae 4181fb10020000                 cmp        r11d, 0x210
002b5 0f85f1280000                   jne        0x7f63dbbf21ac
002bb 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002c3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002c8 4d85d2                         test       r10, r10
002cb 0f84b3270000                   je         0x7f63dbbf2084
002d1 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d5 41c1ea0a                       shr        r10d, 0xa
002d9 4181fa0e020000                 cmp        r10d, 0x20e
002e0 0f85c6280000                   jne        0x7f63dbbf21ac
002e6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002eb 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
002f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002f8 4d85d2                         test       r10, r10
002fb 0f8493270000                   je         0x7f63dbbf2094
00301 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00306 4d85d2                         test       r10, r10
00309 0f8485270000                   je         0x7f63dbbf2094
0030f 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00317 4d85d2                         test       r10, r10
0031a 0f8474270000                   je         0x7f63dbbf2094
00320 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00328 418b6a08                       mov        ebp, dword ptr [r10 + 8]
0032c 892c24                         mov        dword ptr [rsp], ebp
0032f 4c8b942408010000               mov        r10, qword ptr [rsp + 0x108]
00337 458b5208                       mov        r10d, dword ptr [r10 + 8]
0033b 458d5af9                       lea        r11d, [r10 - 7]
0033f 4585db                         test       r11d, r11d
00342 0f8c4c270000                   jl         0x7f63dbbf2094
00348 4183c2f9                       add        r10d, -7
0034c 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00354 e96b020000                     jmp        0x7f63dbbefbc4
00359 4c8b9c2408010000               mov        r11, qword ptr [rsp + 0x108]
00361 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00366 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
0036b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00370 48894424f8                     mov        qword ptr [rsp - 8], rax
00375 8b442430                       mov        eax, dword ptr [rsp + 0x30]
00379 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0037d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00382 90                             nop        
00383 90                             nop        
00384 90                             nop        
00385 90                             nop        
00386 90                             nop        
00387 90                             nop        
00388 90                             nop        
00389 90                             nop        
0038a 90                             nop        
0038b 90                             nop        
0038c 90                             nop        
0038d 90                             nop        
0038e 90                             nop        
0038f 90                             nop        
00390 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8d58110000                   jge        0x7f63dbbf0af8
003a0 c462d3f79c2400010000           shrx       r11, qword ptr [rsp + 0x100], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942400010000               and        r10, qword ptr [rsp + 0x100]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d01130000                   jge        0x7f63dbbf0cd4
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8ddc140000                   jge        0x7f63dbbf0ed8
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8da7160000                   jge        0x7f63dbbf10cc
00425 41b801000000                   mov        r8d, 1
0042b c442d1f7c8                     shlx       r9, r8, rbp
00430 49ffc9                         dec        r9
00433 4d23cb                         and        r9, r11
00436 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0043e 458bc3                         mov        r8d, r11d
00441 4403c1                         add        r8d, ecx
00444 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0044c 458bdb                         mov        r11d, r11d
0044f 4403df                         add        r11d, edi
00452 4963c8                         movsxd     rcx, r8d
00455 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
0045d 8bff                           mov        edi, edi
0045f 4c03cf                         add        r9, rdi
00462 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
0046a 4803f9                         add        rdi, rcx
0046d 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
00475 4d85c9                         test       r9, r9
00478 0f8eaa0c0000                   jle        0x7f63dbbf0728
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f31180000                   jg         0x7f63dbbf12bc
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8fac190000                   jg         0x7f63dbbf1444
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f5b1b0000                   jg         0x7f63dbbf1600
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83071d0000                   jae        0x7f63dbbf17bc
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83710a0000                   jae        0x7f63dbbf054c
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc110                     mov        qword ptr [r9 + r8*8 + 0x10], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db8000000                   jge        0x7f63dbbefbb6
004fe 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00506 49c1eb30                       shr        r11, 0x30
0050a 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00512 49c1e830                       shr        r8, 0x30
00516 458bdb                         mov        r11d, r11d
00519 418bf8                         mov        edi, r8d
0051c 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00524 44038424e8000000               add        r8d, dword ptr [rsp + 0xe8]
0052c c4423bf7ca                     shrx       r9d, r10d, r8d
00531 4103f9                         add        edi, r9d
00534 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0053b 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00543 c4423bf7ca                     shrx       r9d, r10d, r8d
00548 8b8c24e8000000                 mov        ecx, dword ptr [rsp + 0xe8]
0054f 83f920                         cmp        ecx, 0x20
00552 0f8d781e0000                   jge        0x7f63dbbf19d0
00558 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00560 49c1e830                       shr        r8, 0x30
00564 458bc0                         mov        r8d, r8d
00567 bf01000000                     mov        edi, 1
0056c c4e271f7ff                     shlx       edi, edi, ecx
00571 ffcf                           dec        edi
00573 4123f9                         and        edi, r9d
00576 4103fb                         add        edi, r11d
00579 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00580 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00588 4183f920                       cmp        r9d, 0x20
0058c 0f8d7e1f0000                   jge        0x7f63dbbf1b10
00592 41b901000000                   mov        r9d, 1
00598 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
005a0 c44221f7c9                     shlx       r9d, r9d, r11d
005a5 41ffc9                         dec        r9d
005a8 4523ca                         and        r9d, r10d
005ab 4503c8                         add        r9d, r8d
005ae 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
005b6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005ba 418502                         test       dword ptr [r10], eax
005bd 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005c4 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
005cc 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
005d1 0f8d97040000                   jge        0x7f63dbbf006e
005d7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
005dc 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
005e0 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
005e8 44239c24a0000000               and        r11d, dword ptr [rsp + 0xa0]
005f0 458b4208                       mov        r8d, dword ptr [r10 + 8]
005f4 453bd8                         cmp        r11d, r8d
005f7 0f8311050000                   jae        0x7f63dbbf010e
005fd 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
00602 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
00606 8b8c248c000000                 mov        ecx, dword ptr [rsp + 0x8c]
0060d 238c24a4000000                 and        ecx, dword ptr [rsp + 0xa4]
00614 458b4108                       mov        r8d, dword ptr [r9 + 8]
00618 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
0061d 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00625 413bc8                         cmp        ecx, r8d
00628 0f8332060000                   jae        0x7f63dbbf0260
0062e 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00636 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
0063a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00642 44239c24a8000000               and        r11d, dword ptr [rsp + 0xa8]
0064a 458b4208                       mov        r8d, dword ptr [r10 + 8]
0064e 4d8b4cc910                     mov        r9, qword ptr [r9 + rcx*8 + 0x10]
00653 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
0065b 453bd8                         cmp        r11d, r8d
0065e 0f8358070000                   jae        0x7f63dbbf03bc
00664 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
00669 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00671 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00678 ffc5                           inc        ebp
0067a 896c2404                       mov        dword ptr [rsp + 4], ebp
0067e 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00682 0f8d57040000                   jge        0x7f63dbbf00df
00688 49c1ea28                       shr        r10, 0x28
0068c 458bd2                         mov        r10d, r10d
0068f 450fb6d2                       movzx      r10d, r10b
00693 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0069b 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006a3 49c1ea28                       shr        r10, 0x28
006a7 458bda                         mov        r11d, r10d
006aa 450fb6cb                       movzx      r9d, r11b
006ae 44038c24e8000000               add        r9d, dword ptr [rsp + 0xe8]
006b6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006be 49c1ea28                       shr        r10, 0x28
006c2 458bd2                         mov        r10d, r10d
006c5 450fb6da                       movzx      r11d, r10b
006c9 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
006d1 4503cb                         add        r9d, r11d
006d4 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
006dc 41ba01000000                   mov        r10d, 1
006e2 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
006ea 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
006f2 49c1ea20                       shr        r10, 0x20
006f6 458bda                         mov        r11d, r10d
006f9 410fb6eb                       movzx      ebp, r11b
006fd 89ac24ac000000                 mov        dword ptr [rsp + 0xac], ebp
00704 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0070c 49c1ea20                       shr        r10, 0x20
00710 458bd2                         mov        r10d, r10d
00713 410fb6ea                       movzx      ebp, r10b
00717 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
0071e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00726 49c1ea20                       shr        r10, 0x20
0072a 458bda                         mov        r11d, r10d
0072d 410fb6eb                       movzx      ebp, r11b
00731 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00738 448bdd                         mov        r11d, ebp
0073b 44039c24ac000000               add        r11d, dword ptr [rsp + 0xac]
00743 44039c24f4000000               add        r11d, dword ptr [rsp + 0xf4]
0074b 44039c24f0000000               add        r11d, dword ptr [rsp + 0xf0]
00753 4585db                         test       r11d, r11d
00756 0f84500b0000                   je         0x7f63dbbf08ac
0075c 4183fb3f                       cmp        r11d, 0x3f
00760 0f8f1e0d0000                   jg         0x7f63dbbf0a84
00766 41ba40000000                   mov        r10d, 0x40
0076c 442b542448                     sub        r10d, dword ptr [rsp + 0x48]
00771 453bda                         cmp        r11d, r10d
00774 7e43                           jle        0x7f63dbbefdb9
00776 458bc3                         mov        r8d, r11d
00779 452bc2                         sub        r8d, r10d
0077c 4183fa40                       cmp        r10d, 0x40
00780 0f8da2200000                   jge        0x7f63dbbf1e28
00786 41b901000000                   mov        r9d, 1
0078c c442a9f7d1                     shlx       r10, r9, r10
00791 49ffca                         dec        r10
00794 4c23d3                         and        r10, rbx
00797 c4c2b9f7ca                     shlx       rcx, r10, r8
0079c 41b940000000                   mov        r9d, 0x40
007a2 452bc8                         sub        r9d, r8d
007a5 c462b3f7542440                 shrx       r10, qword ptr [rsp + 0x40], r9
007ac 490bca                         or         rcx, r10
007af 48898c2400010000               mov        qword ptr [rsp + 0x100], rcx
007b7 eb2b                           jmp        0x7f63dbbefde4
007b9 452bd3                         sub        r10d, r11d
007bc c462abf7d3                     shrx       r10, rbx, r10
007c1 4183fb40                       cmp        r11d, 0x40
007c5 0f8d711e0000                   jge        0x7f63dbbf1c3c
007cb 41b801000000                   mov        r8d, 1
007d1 c442a1f7c0                     shlx       r8, r8, r11
007d6 49ffc8                         dec        r8
007d9 4d23c2                         and        r8, r10
007dc 4c89842400010000               mov        qword ptr [rsp + 0x100], r8
007e4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
007e9 4503d3                         add        r10d, r11d
007ec 4489542448                     mov        dword ptr [rsp + 0x48], r10d
007f1 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
007f6 4503c3                         add        r8d, r11d
007f9 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
007fe 4183fa40                       cmp        r10d, 0x40
00802 0f8c88fbffff                   jl         0x7f63dbbef990
00808 458d5ac0                       lea        r11d, [r10 - 0x40]
0080c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00811 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00815 83c5f8                         add        ebp, -8
00818 896c2430                       mov        dword ptr [rsp + 0x30], ebp
0081c 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00820 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00824 83c1f0                         add        ecx, -0x10
00827 83f908                         cmp        ecx, 8
0082a 0f8cf0010000                   jl         0x7f63dbbf0020
00830 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00835 4183c2e8                       add        r10d, -0x18
00839 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00841 0f8212fbffff                   jb         0x7f63dbbef959
00847 bee4ffffff                     mov        esi, 0xffffffe4
0084c 48894424f8                     mov        qword ptr [rsp - 8], rax
00851 8b442408                       mov        eax, dword ptr [rsp + 8]
00855 890424                         mov        dword ptr [rsp], eax
00858 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0085d 48894424f8                     mov        qword ptr [rsp - 8], rax
00862 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00866 89442404                       mov        dword ptr [rsp + 4], eax
0086a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0086f 48ff742410                     push       qword ptr [rsp + 0x10]
00874 488f442408                     pop        qword ptr [rsp + 8]
00879 48ff742418                     push       qword ptr [rsp + 0x18]
0087e 488f442410                     pop        qword ptr [rsp + 0x10]
00883 48894424f8                     mov        qword ptr [rsp - 8], rax
00888 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0088c 89442418                       mov        dword ptr [rsp + 0x18], eax
00890 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00895 48894424f8                     mov        qword ptr [rsp - 8], rax
0089a 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0089e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
008a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a7 48894424f8                     mov        qword ptr [rsp - 8], rax
008ac 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008b0 89442420                       mov        dword ptr [rsp + 0x20], eax
008b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b9 48894424f8                     mov        qword ptr [rsp - 8], rax
008be 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008c2 89442424                       mov        dword ptr [rsp + 0x24], eax
008c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008cb 48ff742440                     push       qword ptr [rsp + 0x40]
008d0 488f442428                     pop        qword ptr [rsp + 0x28]
008d5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008da 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008df 48ff742450                     push       qword ptr [rsp + 0x50]
008e4 488f442438                     pop        qword ptr [rsp + 0x38]
008e9 48ff742458                     push       qword ptr [rsp + 0x58]
008ee 488f442440                     pop        qword ptr [rsp + 0x40]
008f3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
008fb 488f442448                     pop        qword ptr [rsp + 0x48]
00900 48894424f8                     mov        qword ptr [rsp - 8], rax
00905 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0090c 89442450                       mov        dword ptr [rsp + 0x50], eax
00910 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00915 48894424f8                     mov        qword ptr [rsp - 8], rax
0091a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00921 89442454                       mov        dword ptr [rsp + 0x54], eax
00925 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092a 48894424f8                     mov        qword ptr [rsp - 8], rax
0092f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00936 89442458                       mov        dword ptr [rsp + 0x58], eax
0093a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00947 488f442460                     pop        qword ptr [rsp + 0x60]
0094c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00954 488f442468                     pop        qword ptr [rsp + 0x68]
00959 48ffb42498000000               push       qword ptr [rsp + 0x98]
00961 488f442470                     pop        qword ptr [rsp + 0x70]
00966 48894424f8                     mov        qword ptr [rsp - 8], rax
0096b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00972 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097b 48894424f8                     mov        qword ptr [rsp - 8], rax
00980 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00987 89442478                       mov        dword ptr [rsp + 0x78], eax
0098b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00990 48894424f8                     mov        qword ptr [rsp - 8], rax
00995 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0099c 8944247c                       mov        dword ptr [rsp + 0x7c], eax
009a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a5 48894424f8                     mov        qword ptr [rsp - 8], rax
009aa 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
009b1 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bd 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009c5 488f842488000000               pop        qword ptr [rsp + 0x88]
009cd 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009d5 488f842490000000               pop        qword ptr [rsp + 0x90]
009dd 48894424f8                     mov        qword ptr [rsp - 8], rax
009e2 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
009e9 898424a4000000                 mov        dword ptr [rsp + 0xa4], eax
009f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009f5 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009fd 90                             nop        
009fe 90                             nop        
009ff e85ca7afff                     call       0x7f63db6ea760
00a04 0f1f8400fc0a0001               nop        dword ptr [rax + rax + 0x1000afc]
00a0c 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
00a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a1a e8e108b418                     call       0x7f63f4730900
00a1f f4                             hlt        
00a20 85c9                           test       ecx, ecx
00a22 7f08                           jg         0x7f63dbbf002c
00a24 4533d2                         xor        r10d, r10d
00a27 e93af9ffff                     jmp        0x7f63dbbef966
00a2c 8be9                           mov        ebp, ecx
00a2e 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
00a36 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a3a 90                             nop        
00a3b e8203cb5ff                     call       0x7f63db743c60
00a40 0f1f8400380b0002               nop        dword ptr [rax + rax + 0x2000b38]
00a48 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a4d 41c1e303                       shl        r11d, 3
00a51 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a56 41c1e203                       shl        r10d, 3
00a5a 452bd3                         sub        r10d, r11d
00a5d 4181c2c0000000                 add        r10d, 0xc0
00a64 c462a9f7d0                     shlx       r10, rax, r10
00a69 e9f8f8ffff                     jmp        0x7f63dbbef966
00a6e 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00a76 4c03942498000000               add        r10, qword ptr [rsp + 0x98]
00a7e 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a83 4d3bd3                         cmp        r10, r11
00a86 7e31                           jle        0x7f63dbbf00b9
00a88 48be486d32e300000000           movabs     rsi, 0xe3326d48
00a92 90                             nop        
00a93 e8c83bb5ff                     call       0x7f63db743c60
00a98 0f1f8400900b0003               nop        dword ptr [rax + rax + 0x3000b90]
00aa0 4885c0                         test       rax, rax
00aa3 0f841f220000                   je         0x7f63dbbf22c8
00aa9 488bf0                         mov        rsi, rax
00aac 4881c420010000                 add        rsp, 0x120
00ab3 5d                             pop        rbp
00ab4 e9a72eafff                     jmp        0x7f63db6e2f60
00ab9 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00abe 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00ac3 0f8527220000                   jne        0x7f63dbbf22f0
00ac9 418bc2                         mov        eax, r10d
00acc 4881c420010000                 add        rsp, 0x120
00ad3 5d                             pop        rbp
00ad4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ad8 0f87c4220000                   ja         0x7f63dbbf23a2
00ade c3                             ret        
00adf 4533d2                         xor        r10d, r10d
00ae2 33ed                           xor        ebp, ebp
00ae4 4533c0                         xor        r8d, r8d
00ae7 4533db                         xor        r11d, r11d
00aea 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00af2 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00af9 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
00b01 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
00b09 e9dcfbffff                     jmp        0x7f63dbbefcea
00b0e bee4ffffff                     mov        esi, 0xffffffe4
00b13 48894424f8                     mov        qword ptr [rsp - 8], rax
00b18 8b442408                       mov        eax, dword ptr [rsp + 8]
00b1c 890424                         mov        dword ptr [rsp], eax
00b1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b24 48894424f8                     mov        qword ptr [rsp - 8], rax
00b29 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b2d 89442404                       mov        dword ptr [rsp + 4], eax
00b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b36 48ff742410                     push       qword ptr [rsp + 0x10]
00b3b 488f442408                     pop        qword ptr [rsp + 8]
00b40 48ff742418                     push       qword ptr [rsp + 0x18]
00b45 488f442410                     pop        qword ptr [rsp + 0x10]
00b4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4f 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b53 89442418                       mov        dword ptr [rsp + 0x18], eax
00b57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b61 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b65 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6e 48894424f8                     mov        qword ptr [rsp - 8], rax
00b73 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b77 89442420                       mov        dword ptr [rsp + 0x20], eax
00b7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b80 48894424f8                     mov        qword ptr [rsp - 8], rax
00b85 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b89 89442424                       mov        dword ptr [rsp + 0x24], eax
00b8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b92 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b97 48ff742440                     push       qword ptr [rsp + 0x40]
00b9c 488f442430                     pop        qword ptr [rsp + 0x30]
00ba1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00baa 89442438                       mov        dword ptr [rsp + 0x38], eax
00bae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb3 48894424f8                     mov        qword ptr [rsp - 8], rax
00bb8 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00bbc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bc5 48ff742450                     push       qword ptr [rsp + 0x50]
00bca 488f442440                     pop        qword ptr [rsp + 0x40]
00bcf 48ff742458                     push       qword ptr [rsp + 0x58]
00bd4 488f442448                     pop        qword ptr [rsp + 0x48]
00bd9 48894424f8                     mov        qword ptr [rsp - 8], rax
00bde 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00be5 89442458                       mov        dword ptr [rsp + 0x58], eax
00be9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bee 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf3 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00bfa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00bfe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c03 48894424f8                     mov        qword ptr [rsp - 8], rax
00c08 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00c0f 89442460                       mov        dword ptr [rsp + 0x60], eax
00c13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c18 48894424f8                     mov        qword ptr [rsp - 8], rax
00c1d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00c24 89442464                       mov        dword ptr [rsp + 0x64], eax
00c28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c2d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00c35 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00c3d 90                             nop        
00c3e 90                             nop        
00c3f e81ca5afff                     call       0x7f63db6ea760
00c44 0f1f84003c0d0004               nop        dword ptr [rax + rax + 0x4000d3c]
00c4c 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
00c56 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c5a e8a106b418                     call       0x7f63f4730900
00c5f f4                             hlt        
00c60 bee4ffffff                     mov        esi, 0xffffffe4
00c65 48894424f8                     mov        qword ptr [rsp - 8], rax
00c6a 8b442408                       mov        eax, dword ptr [rsp + 8]
00c6e 890424                         mov        dword ptr [rsp], eax
00c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c76 48894424f8                     mov        qword ptr [rsp - 8], rax
00c7b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c7f 89442404                       mov        dword ptr [rsp + 4], eax
00c83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c88 48ff742410                     push       qword ptr [rsp + 0x10]
00c8d 488f442408                     pop        qword ptr [rsp + 8]
00c92 48ff742418                     push       qword ptr [rsp + 0x18]
00c97 488f442410                     pop        qword ptr [rsp + 0x10]
00c9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00ca5 89442418                       mov        dword ptr [rsp + 0x18], eax
00ca9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cae 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00cb7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00cbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc0 48894424f8                     mov        qword ptr [rsp - 8], rax
00cc5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00cc9 89442420                       mov        dword ptr [rsp + 0x20], eax
00ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00cdb 89442424                       mov        dword ptr [rsp + 0x24], eax
00cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ce9 48ff742440                     push       qword ptr [rsp + 0x40]
00cee 488f442430                     pop        qword ptr [rsp + 0x30]
00cf3 48894424f8                     mov        qword ptr [rsp - 8], rax
00cf8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00cfc 89442438                       mov        dword ptr [rsp + 0x38], eax
00d00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d05 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00d0e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00d12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d17 48ff742450                     push       qword ptr [rsp + 0x50]
00d1c 488f442440                     pop        qword ptr [rsp + 0x40]
00d21 48ff742458                     push       qword ptr [rsp + 0x58]
00d26 488f442448                     pop        qword ptr [rsp + 0x48]
00d2b 48894424f8                     mov        qword ptr [rsp - 8], rax
00d30 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00d37 89442458                       mov        dword ptr [rsp + 0x58], eax
00d3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d40 48894424f8                     mov        qword ptr [rsp - 8], rax
00d45 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00d4c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d55 48894424f8                     mov        qword ptr [rsp - 8], rax
00d5a 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00d61 89442460                       mov        dword ptr [rsp + 0x60], eax
00d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d6a 48ffb42498000000               push       qword ptr [rsp + 0x98]
00d72 488f442478                     pop        qword ptr [rsp + 0x78]
00d77 48894424f8                     mov        qword ptr [rsp - 8], rax
00d7c 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00d83 89442464                       mov        dword ptr [rsp + 0x64], eax
00d87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8c 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d94 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d9b e8c0a3afff                     call       0x7f63db6ea760
00da0 0f1f8400980e0005               nop        dword ptr [rax + rax + 0x5000e98]
00da8 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
00db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00db6 e84505b418                     call       0x7f63f4730900
00dbb f4                             hlt        
00dbc bee4ffffff                     mov        esi, 0xffffffe4
00dc1 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc6 8b442408                       mov        eax, dword ptr [rsp + 8]
00dca 890424                         mov        dword ptr [rsp], eax
00dcd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00ddb 89442404                       mov        dword ptr [rsp + 4], eax
00ddf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de4 48ff742410                     push       qword ptr [rsp + 0x10]
00de9 488f442408                     pop        qword ptr [rsp + 8]
00dee 48ff742418                     push       qword ptr [rsp + 0x18]
00df3 488f442410                     pop        qword ptr [rsp + 0x10]
00df8 48894424f8                     mov        qword ptr [rsp - 8], rax
00dfd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e01 89442418                       mov        dword ptr [rsp + 0x18], eax
00e05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e13 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1c 48894424f8                     mov        qword ptr [rsp - 8], rax
00e21 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e25 89442420                       mov        dword ptr [rsp + 0x20], eax
00e29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e33 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00e37 89442424                       mov        dword ptr [rsp + 0x24], eax
00e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e40 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00e45 48ff742440                     push       qword ptr [rsp + 0x40]
00e4a 488f442430                     pop        qword ptr [rsp + 0x30]
00e4f 48894424f8                     mov        qword ptr [rsp - 8], rax
00e54 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00e58 89442438                       mov        dword ptr [rsp + 0x38], eax
00e5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e61 48894424f8                     mov        qword ptr [rsp - 8], rax
00e66 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00e6a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e73 48ff742450                     push       qword ptr [rsp + 0x50]
00e78 488f442440                     pop        qword ptr [rsp + 0x40]
00e7d 48ff742458                     push       qword ptr [rsp + 0x58]
00e82 488f442448                     pop        qword ptr [rsp + 0x48]
00e87 48894424f8                     mov        qword ptr [rsp - 8], rax
00e8c 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00e93 89442458                       mov        dword ptr [rsp + 0x58], eax
00e97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea1 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ea8 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00eac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eb1 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb6 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00ebd 89442460                       mov        dword ptr [rsp + 0x60], eax
00ec1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec6 48ffb42498000000               push       qword ptr [rsp + 0x98]
00ece 488f442478                     pop        qword ptr [rsp + 0x78]
00ed3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed8 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00edf 89442464                       mov        dword ptr [rsp + 0x64], eax
00ee3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee8 48894424f8                     mov        qword ptr [rsp - 8], rax
00eed 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00ef4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f00 48894424f8                     mov        qword ptr [rsp - 8], rax
00f05 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f0c 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f18 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00f20 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00f28 90                             nop        
00f29 90                             nop        
00f2a 90                             nop        
00f2b e830a2afff                     call       0x7f63db6ea760
00f30 0f1f840028100006               nop        dword ptr [rax + rax + 0x6001028]
00f38 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
00f42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f46 e8b503b418                     call       0x7f63f4730900
00f4b f4                             hlt        
00f4c bee4ffffff                     mov        esi, 0xffffffe4
00f51 48894424f8                     mov        qword ptr [rsp - 8], rax
00f56 8b442408                       mov        eax, dword ptr [rsp + 8]
00f5a 890424                         mov        dword ptr [rsp], eax
00f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f62 48894424f8                     mov        qword ptr [rsp - 8], rax
00f67 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00f6b 89442404                       mov        dword ptr [rsp + 4], eax
00f6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f74 48ff742410                     push       qword ptr [rsp + 0x10]
00f79 488f442408                     pop        qword ptr [rsp + 8]
00f7e 48ff742418                     push       qword ptr [rsp + 0x18]
00f83 488f442410                     pop        qword ptr [rsp + 0x10]
00f88 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00f91 89442418                       mov        dword ptr [rsp + 0x18], eax
00f95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f9a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f9f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00fa3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00fa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fac 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00fb5 89442420                       mov        dword ptr [rsp + 0x20], eax
00fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00fc7 89442424                       mov        dword ptr [rsp + 0x24], eax
00fcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00fd5 48ff742440                     push       qword ptr [rsp + 0x40]
00fda 488f442430                     pop        qword ptr [rsp + 0x30]
00fdf 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00fe8 89442438                       mov        dword ptr [rsp + 0x38], eax
00fec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00ffa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ffe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01003 48ff742450                     push       qword ptr [rsp + 0x50]
01008 488f442440                     pop        qword ptr [rsp + 0x40]
0100d 48ff742458                     push       qword ptr [rsp + 0x58]
01012 488f442448                     pop        qword ptr [rsp + 0x48]
01017 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0101f 488f442450                     pop        qword ptr [rsp + 0x50]
01024 48894424f8                     mov        qword ptr [rsp - 8], rax
01029 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01030 89442458                       mov        dword ptr [rsp + 0x58], eax
01034 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01039 48894424f8                     mov        qword ptr [rsp - 8], rax
0103e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01045 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0104e 48894424f8                     mov        qword ptr [rsp - 8], rax
01053 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0105a 89442460                       mov        dword ptr [rsp + 0x60], eax
0105e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01063 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01068 48894424f8                     mov        qword ptr [rsp - 8], rax
0106d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01074 89442464                       mov        dword ptr [rsp + 0x64], eax
01078 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0107d 48894424f8                     mov        qword ptr [rsp - 8], rax
01082 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01089 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01090 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01095 48894424f8                     mov        qword ptr [rsp - 8], rax
0109a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
010a1 89842484000000                 mov        dword ptr [rsp + 0x84], eax
010a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ad 48894424f8                     mov        qword ptr [rsp - 8], rax
010b2 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
010b9 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c5 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
010cd 488f842490000000               pop        qword ptr [rsp + 0x90]
010d5 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010dd 488f842498000000               pop        qword ptr [rsp + 0x98]
010e5 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
010ed 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
010f5 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
010fd 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01105 90                             nop        
01106 90                             nop        
01107 e854a0afff                     call       0x7f63db6ea760
0110c 0f1f840004120007               nop        dword ptr [rax + rax + 0x7001204]
01114 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
0111e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01122 e8d901b418                     call       0x7f63f4730900
01127 f4                             hlt        
01128 33c9                           xor        ecx, ecx
0112a 4c3bc9                         cmp        r9, rcx
0112d bdffffffff                     mov        ebp, 0xffffffff
01132 7c08                           jl         0x7f63dbbf073c
01134 400f95c5                       setne      bpl
01138 400fb6ed                       movzx      ebp, bpl
0113c be45ffffff                     mov        esi, 0xffffff45
01141 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01146 48ff742440                     push       qword ptr [rsp + 0x40]
0114b 488f442438                     pop        qword ptr [rsp + 0x38]
01150 48894424f8                     mov        qword ptr [rsp - 8], rax
01155 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01159 89442440                       mov        dword ptr [rsp + 0x40], eax
0115d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01162 48894424f8                     mov        qword ptr [rsp - 8], rax
01167 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0116b 89442444                       mov        dword ptr [rsp + 0x44], eax
0116f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01174 48ff742450                     push       qword ptr [rsp + 0x50]
01179 488f442448                     pop        qword ptr [rsp + 0x48]
0117e 48ff742458                     push       qword ptr [rsp + 0x58]
01183 488f442450                     pop        qword ptr [rsp + 0x50]
01188 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01190 488f442458                     pop        qword ptr [rsp + 0x58]
01195 48894424f8                     mov        qword ptr [rsp - 8], rax
0119a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
011a1 89442460                       mov        dword ptr [rsp + 0x60], eax
011a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011aa 48894424f8                     mov        qword ptr [rsp - 8], rax
011af 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
011b6 89442464                       mov        dword ptr [rsp + 0x64], eax
011ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011bf 48894424f8                     mov        qword ptr [rsp - 8], rax
011c4 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
011cb 89442468                       mov        dword ptr [rsp + 0x68], eax
011cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d4 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
011dc 48894424f8                     mov        qword ptr [rsp - 8], rax
011e1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
011e8 8944246c                       mov        dword ptr [rsp + 0x6c], eax
011ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f1 48894424f8                     mov        qword ptr [rsp - 8], rax
011f6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
011fd 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01204 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01209 48894424f8                     mov        qword ptr [rsp - 8], rax
0120e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01215 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
0121c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01221 48894424f8                     mov        qword ptr [rsp - 8], rax
01226 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0122d 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01234 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01239 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01241 488f842498000000               pop        qword ptr [rsp + 0x98]
01249 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01251 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01259 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01261 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01269 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01271 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01279 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01281 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01289 90                             nop        
0128a 90                             nop        
0128b e8d09eafff                     call       0x7f63db6ea760
01290 0f1f840088130008               nop        dword ptr [rax + rax + 0x8001388]
01298 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
012a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012a6 e85500b418                     call       0x7f63f4730900
012ab f4                             hlt        
012ac be45ffffff                     mov        esi, 0xffffff45
012b1 48894424f8                     mov        qword ptr [rsp - 8], rax
012b6 8b442408                       mov        eax, dword ptr [rsp + 8]
012ba 890424                         mov        dword ptr [rsp], eax
012bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c2 48894424f8                     mov        qword ptr [rsp - 8], rax
012c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
012cb 89442404                       mov        dword ptr [rsp + 4], eax
012cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d4 48ff742410                     push       qword ptr [rsp + 0x10]
012d9 488f442408                     pop        qword ptr [rsp + 8]
012de 48ff742418                     push       qword ptr [rsp + 0x18]
012e3 488f442410                     pop        qword ptr [rsp + 0x10]
012e8 48894424f8                     mov        qword ptr [rsp - 8], rax
012ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
012f1 89442418                       mov        dword ptr [rsp + 0x18], eax
012f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fa 48894424f8                     mov        qword ptr [rsp - 8], rax
012ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01303 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01307 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130c 48894424f8                     mov        qword ptr [rsp - 8], rax
01311 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01315 89442420                       mov        dword ptr [rsp + 0x20], eax
01319 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131e 48894424f8                     mov        qword ptr [rsp - 8], rax
01323 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01327 89442424                       mov        dword ptr [rsp + 0x24], eax
0132b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01330 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01335 48ff742440                     push       qword ptr [rsp + 0x40]
0133a 488f442430                     pop        qword ptr [rsp + 0x30]
0133f 48894424f8                     mov        qword ptr [rsp - 8], rax
01344 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01348 89442438                       mov        dword ptr [rsp + 0x38], eax
0134c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01351 48894424f8                     mov        qword ptr [rsp - 8], rax
01356 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0135a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0135e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01363 48ff742450                     push       qword ptr [rsp + 0x50]
01368 488f442440                     pop        qword ptr [rsp + 0x40]
0136d 48ff742458                     push       qword ptr [rsp + 0x58]
01372 488f442448                     pop        qword ptr [rsp + 0x48]
01377 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0137f 488f442450                     pop        qword ptr [rsp + 0x50]
01384 48894424f8                     mov        qword ptr [rsp - 8], rax
01389 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01390 89442458                       mov        dword ptr [rsp + 0x58], eax
01394 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01399 48894424f8                     mov        qword ptr [rsp - 8], rax
0139e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
013a5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
013a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ae 48894424f8                     mov        qword ptr [rsp - 8], rax
013b3 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
013ba 89442460                       mov        dword ptr [rsp + 0x60], eax
013be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c3 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
013cb 488f442468                     pop        qword ptr [rsp + 0x68]
013d0 48ffb42498000000               push       qword ptr [rsp + 0x98]
013d8 488f442478                     pop        qword ptr [rsp + 0x78]
013dd 48894424f8                     mov        qword ptr [rsp - 8], rax
013e2 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
013e9 89442464                       mov        dword ptr [rsp + 0x64], eax
013ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f2 48894424f8                     mov        qword ptr [rsp - 8], rax
013f7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
013fe 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01405 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140a 48894424f8                     mov        qword ptr [rsp - 8], rax
0140f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01416 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0141d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01422 48894424f8                     mov        qword ptr [rsp - 8], rax
01427 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0142e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01435 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143a 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01442 488f842490000000               pop        qword ptr [rsp + 0x90]
0144a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01452 488f842498000000               pop        qword ptr [rsp + 0x98]
0145a 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
01462 90                             nop        
01463 e8f89cafff                     call       0x7f63db6ea760
01468 0f1f840060150009               nop        dword ptr [rax + rax + 0x9001560]
01470 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
0147a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0147e e87dfeb318                     call       0x7f63f4730900
01483 f4                             hlt        
01484 be45ffffff                     mov        esi, 0xffffff45
01489 48894424f8                     mov        qword ptr [rsp - 8], rax
0148e 8b442408                       mov        eax, dword ptr [rsp + 8]
01492 890424                         mov        dword ptr [rsp], eax
01495 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149a 48894424f8                     mov        qword ptr [rsp - 8], rax
0149f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
014a3 89442404                       mov        dword ptr [rsp + 4], eax
014a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ac 48ff742410                     push       qword ptr [rsp + 0x10]
014b1 488f442408                     pop        qword ptr [rsp + 8]
014b6 48ff742418                     push       qword ptr [rsp + 0x18]
014bb 488f442410                     pop        qword ptr [rsp + 0x10]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
014c9 89442418                       mov        dword ptr [rsp + 0x18], eax
014cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014d7 e8849cafff                     call       0x7f63db6ea760
014dc 0f1f8400d415000a               nop        dword ptr [rax + rax + 0xa0015d4]
014e4 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
014ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
014f2 e809feb318                     call       0x7f63f4730900
014f7 f4                             hlt        
014f8 be45ffffff                     mov        esi, 0xffffff45
014fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01502 8b442408                       mov        eax, dword ptr [rsp + 8]
01506 890424                         mov        dword ptr [rsp], eax
01509 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150e 48894424f8                     mov        qword ptr [rsp - 8], rax
01513 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01517 89442404                       mov        dword ptr [rsp + 4], eax
0151b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01520 48ff742410                     push       qword ptr [rsp + 0x10]
01525 488f442408                     pop        qword ptr [rsp + 8]
0152a 48ff742418                     push       qword ptr [rsp + 0x18]
0152f 488f442410                     pop        qword ptr [rsp + 0x10]
01534 48894424f8                     mov        qword ptr [rsp - 8], rax
01539 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0153d 89442418                       mov        dword ptr [rsp + 0x18], eax
01541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01546 48894424f8                     mov        qword ptr [rsp - 8], rax
0154b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0154f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01558 48894424f8                     mov        qword ptr [rsp - 8], rax
0155d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01561 89442420                       mov        dword ptr [rsp + 0x20], eax
01565 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156a 48894424f8                     mov        qword ptr [rsp - 8], rax
0156f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01573 89442424                       mov        dword ptr [rsp + 0x24], eax
01577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01581 48ff742440                     push       qword ptr [rsp + 0x40]
01586 488f442430                     pop        qword ptr [rsp + 0x30]
0158b 48894424f8                     mov        qword ptr [rsp - 8], rax
01590 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01594 89442438                       mov        dword ptr [rsp + 0x38], eax
01598 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159d 48894424f8                     mov        qword ptr [rsp - 8], rax
015a2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
015a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015af 48ff742450                     push       qword ptr [rsp + 0x50]
015b4 488f442440                     pop        qword ptr [rsp + 0x40]
015b9 48ff742458                     push       qword ptr [rsp + 0x58]
015be 488f442448                     pop        qword ptr [rsp + 0x48]
015c3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
015cb 488f442450                     pop        qword ptr [rsp + 0x50]
015d0 48894424f8                     mov        qword ptr [rsp - 8], rax
015d5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
015dc 89442458                       mov        dword ptr [rsp + 0x58], eax
015e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e5 48894424f8                     mov        qword ptr [rsp - 8], rax
015ea 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
015f1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fa 48894424f8                     mov        qword ptr [rsp - 8], rax
015ff 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01606 89442460                       mov        dword ptr [rsp + 0x60], eax
0160a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01617 488f442468                     pop        qword ptr [rsp + 0x68]
0161c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01624 488f442470                     pop        qword ptr [rsp + 0x70]
01629 48ffb42498000000               push       qword ptr [rsp + 0x98]
01631 488f442478                     pop        qword ptr [rsp + 0x78]
01636 48894424f8                     mov        qword ptr [rsp - 8], rax
0163b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01642 89442464                       mov        dword ptr [rsp + 0x64], eax
01646 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164b 48894424f8                     mov        qword ptr [rsp - 8], rax
01650 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01657 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0165e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01663 48894424f8                     mov        qword ptr [rsp - 8], rax
01668 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0166f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167b 48894424f8                     mov        qword ptr [rsp - 8], rax
01680 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01687 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0168e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01693 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0169b 488f842490000000               pop        qword ptr [rsp + 0x90]
016a3 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016ab 488f842498000000               pop        qword ptr [rsp + 0x98]
016b3 e8a89aafff                     call       0x7f63db6ea760
016b8 0f1f8400b017000b               nop        dword ptr [rax + rax + 0xb0017b0]
016c0 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
016ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ce e82dfcb318                     call       0x7f63f4730900
016d3 f4                             hlt        
016d4 be45ffffff                     mov        esi, 0xffffff45
016d9 48894424f8                     mov        qword ptr [rsp - 8], rax
016de 8b442408                       mov        eax, dword ptr [rsp + 8]
016e2 890424                         mov        dword ptr [rsp], eax
016e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ea 48894424f8                     mov        qword ptr [rsp - 8], rax
016ef 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
016f3 89442404                       mov        dword ptr [rsp + 4], eax
016f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fc 48ff742410                     push       qword ptr [rsp + 0x10]
01701 488f442408                     pop        qword ptr [rsp + 8]
01706 48ff742418                     push       qword ptr [rsp + 0x18]
0170b 488f442410                     pop        qword ptr [rsp + 0x10]
01710 48894424f8                     mov        qword ptr [rsp - 8], rax
01715 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01719 89442418                       mov        dword ptr [rsp + 0x18], eax
0171d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01722 48894424f8                     mov        qword ptr [rsp - 8], rax
01727 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0172b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0172f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01734 48894424f8                     mov        qword ptr [rsp - 8], rax
01739 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0173d 89442420                       mov        dword ptr [rsp + 0x20], eax
01741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01746 48894424f8                     mov        qword ptr [rsp - 8], rax
0174b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0174f 89442424                       mov        dword ptr [rsp + 0x24], eax
01753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01758 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0175d 48ff742440                     push       qword ptr [rsp + 0x40]
01762 488f442430                     pop        qword ptr [rsp + 0x30]
01767 48894424f8                     mov        qword ptr [rsp - 8], rax
0176c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01770 89442438                       mov        dword ptr [rsp + 0x38], eax
01774 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01779 48894424f8                     mov        qword ptr [rsp - 8], rax
0177e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01782 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01786 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178b 48ff742450                     push       qword ptr [rsp + 0x50]
01790 488f442440                     pop        qword ptr [rsp + 0x40]
01795 48ff742458                     push       qword ptr [rsp + 0x58]
0179a 488f442448                     pop        qword ptr [rsp + 0x48]
0179f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
017a7 488f442450                     pop        qword ptr [rsp + 0x50]
017ac 48894424f8                     mov        qword ptr [rsp - 8], rax
017b1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
017b8 89442458                       mov        dword ptr [rsp + 0x58], eax
017bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c1 48894424f8                     mov        qword ptr [rsp - 8], rax
017c6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
017cd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
017d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d6 48894424f8                     mov        qword ptr [rsp - 8], rax
017db 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
017e2 89442460                       mov        dword ptr [rsp + 0x60], eax
017e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017eb 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
017f3 488f442468                     pop        qword ptr [rsp + 0x68]
017f8 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01800 488f442470                     pop        qword ptr [rsp + 0x70]
01805 48ffb42498000000               push       qword ptr [rsp + 0x98]
0180d 488f442478                     pop        qword ptr [rsp + 0x78]
01812 48894424f8                     mov        qword ptr [rsp - 8], rax
01817 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0181e 89442464                       mov        dword ptr [rsp + 0x64], eax
01822 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01827 48894424f8                     mov        qword ptr [rsp - 8], rax
0182c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01833 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0183a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183f 48894424f8                     mov        qword ptr [rsp - 8], rax
01844 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0184b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01852 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01857 48894424f8                     mov        qword ptr [rsp - 8], rax
0185c 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01863 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0186a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186f 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01877 488f842490000000               pop        qword ptr [rsp + 0x90]
0187f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01887 488f842498000000               pop        qword ptr [rsp + 0x98]
0188f 48894424f8                     mov        qword ptr [rsp - 8], rax
01894 8b8424f4000000                 mov        eax, dword ptr [rsp + 0xf4]
0189b 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
018a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a7 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
018af 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
018b7 e8a498afff                     call       0x7f63db6ea760
018bc 0f1f8400b419000c               nop        dword ptr [rax + rax + 0xc0019b4]
018c4 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
018ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
018d2 e829fab318                     call       0x7f63f4730900
018d7 f4                             hlt        
018d8 be45ffffff                     mov        esi, 0xffffff45
018dd 48894424f8                     mov        qword ptr [rsp - 8], rax
018e2 8b442408                       mov        eax, dword ptr [rsp + 8]
018e6 890424                         mov        dword ptr [rsp], eax
018e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ee 48894424f8                     mov        qword ptr [rsp - 8], rax
018f3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
018f7 89442404                       mov        dword ptr [rsp + 4], eax
018fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01900 48ff742410                     push       qword ptr [rsp + 0x10]
01905 488f442408                     pop        qword ptr [rsp + 8]
0190a 48ff742418                     push       qword ptr [rsp + 0x18]
0190f 488f442410                     pop        qword ptr [rsp + 0x10]
01914 48894424f8                     mov        qword ptr [rsp - 8], rax
01919 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0191d 89442418                       mov        dword ptr [rsp + 0x18], eax
01921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01926 48894424f8                     mov        qword ptr [rsp - 8], rax
0192b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0192f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01938 48894424f8                     mov        qword ptr [rsp - 8], rax
0193d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01941 89442420                       mov        dword ptr [rsp + 0x20], eax
01945 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194a 48894424f8                     mov        qword ptr [rsp - 8], rax
0194f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01953 89442424                       mov        dword ptr [rsp + 0x24], eax
01957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01961 48ff742440                     push       qword ptr [rsp + 0x40]
01966 488f442430                     pop        qword ptr [rsp + 0x30]
0196b 48894424f8                     mov        qword ptr [rsp - 8], rax
01970 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01974 89442438                       mov        dword ptr [rsp + 0x38], eax
01978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197d 48894424f8                     mov        qword ptr [rsp - 8], rax
01982 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01986 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0198a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198f 48ff742450                     push       qword ptr [rsp + 0x50]
01994 488f442440                     pop        qword ptr [rsp + 0x40]
01999 48ff742458                     push       qword ptr [rsp + 0x58]
0199e 488f442448                     pop        qword ptr [rsp + 0x48]
019a3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
019ab 488f442450                     pop        qword ptr [rsp + 0x50]
019b0 48894424f8                     mov        qword ptr [rsp - 8], rax
019b5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
019bc 89442458                       mov        dword ptr [rsp + 0x58], eax
019c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c5 48894424f8                     mov        qword ptr [rsp - 8], rax
019ca 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
019d1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019da 48894424f8                     mov        qword ptr [rsp - 8], rax
019df 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
019e6 89442460                       mov        dword ptr [rsp + 0x60], eax
019ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ef 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
019f7 488f442468                     pop        qword ptr [rsp + 0x68]
019fc 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01a04 488f442470                     pop        qword ptr [rsp + 0x70]
01a09 48ffb42498000000               push       qword ptr [rsp + 0x98]
01a11 488f442478                     pop        qword ptr [rsp + 0x78]
01a16 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01a22 89442464                       mov        dword ptr [rsp + 0x64], eax
01a26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a30 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a37 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a43 48894424f8                     mov        qword ptr [rsp - 8], rax
01a48 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a4f 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a60 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01a67 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01a6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a73 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01a7b 488f842490000000               pop        qword ptr [rsp + 0x90]
01a83 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01a8b 488f842498000000               pop        qword ptr [rsp + 0x98]
01a93 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01a9b 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
01aa2 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01aaa 90                             nop        
01aab e8b096afff                     call       0x7f63db6ea760
01ab0 0f1f8400a81b000d               nop        dword ptr [rax + rax + 0xd001ba8]
01ab8 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
01ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ac6 e835f8b318                     call       0x7f63f4730900
01acb f4                             hlt        
01acc be45ffffff                     mov        esi, 0xffffff45
01ad1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad6 8b442408                       mov        eax, dword ptr [rsp + 8]
01ada 890424                         mov        dword ptr [rsp], eax
01add 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01aeb 89442404                       mov        dword ptr [rsp + 4], eax
01aef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af4 48ff742410                     push       qword ptr [rsp + 0x10]
01af9 488f442408                     pop        qword ptr [rsp + 8]
01afe 48ff742418                     push       qword ptr [rsp + 0x18]
01b03 488f442410                     pop        qword ptr [rsp + 0x10]
01b08 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01b11 89442418                       mov        dword ptr [rsp + 0x18], eax
01b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01b23 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b31 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b35 89442420                       mov        dword ptr [rsp + 0x20], eax
01b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01b47 89442424                       mov        dword ptr [rsp + 0x24], eax
01b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b50 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01b55 48ff742440                     push       qword ptr [rsp + 0x40]
01b5a 488f442430                     pop        qword ptr [rsp + 0x30]
01b5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b64 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b68 89442438                       mov        dword ptr [rsp + 0x38], eax
01b6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b71 48894424f8                     mov        qword ptr [rsp - 8], rax
01b76 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01b7a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b83 48ff742450                     push       qword ptr [rsp + 0x50]
01b88 488f442440                     pop        qword ptr [rsp + 0x40]
01b8d 48ff742458                     push       qword ptr [rsp + 0x58]
01b92 488f442448                     pop        qword ptr [rsp + 0x48]
01b97 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01b9f 488f442450                     pop        qword ptr [rsp + 0x50]
01ba4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01bb0 89442458                       mov        dword ptr [rsp + 0x58], eax
01bb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb9 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbe 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01bc5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01bc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bce 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd3 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01bda 89442460                       mov        dword ptr [rsp + 0x60], eax
01bde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be3 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01beb 488f442468                     pop        qword ptr [rsp + 0x68]
01bf0 48ffb42498000000               push       qword ptr [rsp + 0x98]
01bf8 488f442478                     pop        qword ptr [rsp + 0x78]
01bfd 48894424f8                     mov        qword ptr [rsp - 8], rax
01c02 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01c09 89442464                       mov        dword ptr [rsp + 0x64], eax
01c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c12 48894424f8                     mov        qword ptr [rsp - 8], rax
01c17 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c1e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01c36 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c42 48894424f8                     mov        qword ptr [rsp - 8], rax
01c47 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01c4e 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5a 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01c62 488f842490000000               pop        qword ptr [rsp + 0x90]
01c6a 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01c72 488f842498000000               pop        qword ptr [rsp + 0x98]
01c7a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01c82 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01c89 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01c90 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01c98 90                             nop        
01c99 90                             nop        
01c9a 90                             nop        
01c9b e8c094afff                     call       0x7f63db6ea760
01ca0 0f1f8400981d000e               nop        dword ptr [rax + rax + 0xe001d98]
01ca8 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
01cb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cb6 e845f6b318                     call       0x7f63f4730900
01cbb f4                             hlt        
01cbc be45ffffff                     mov        esi, 0xffffff45
01cc1 b9ffffff7f                     mov        ecx, 0x7fffffff
01cc6 4c3bc9                         cmp        r9, rcx
01cc9 bdffffffff                     mov        ebp, 0xffffffff
01cce 7c08                           jl         0x7f63dbbf12d8
01cd0 400f95c5                       setne      bpl
01cd4 400fb6ed                       movzx      ebp, bpl
01cd8 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01cdd 48ff742440                     push       qword ptr [rsp + 0x40]
01ce2 488f442438                     pop        qword ptr [rsp + 0x38]
01ce7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cec 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01cf0 89442440                       mov        dword ptr [rsp + 0x40], eax
01cf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfe 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01d02 89442444                       mov        dword ptr [rsp + 0x44], eax
01d06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0b 48ff742450                     push       qword ptr [rsp + 0x50]
01d10 488f442448                     pop        qword ptr [rsp + 0x48]
01d15 48ff742458                     push       qword ptr [rsp + 0x58]
01d1a 488f442450                     pop        qword ptr [rsp + 0x50]
01d1f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01d27 488f442458                     pop        qword ptr [rsp + 0x58]
01d2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d31 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01d38 89442460                       mov        dword ptr [rsp + 0x60], eax
01d3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d41 48894424f8                     mov        qword ptr [rsp - 8], rax
01d46 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01d4d 89442464                       mov        dword ptr [rsp + 0x64], eax
01d51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d56 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01d62 89442468                       mov        dword ptr [rsp + 0x68], eax
01d66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6b 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01d73 48894424f8                     mov        qword ptr [rsp - 8], rax
01d78 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01d7f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01d83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d88 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d94 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01dac 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01db3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db8 48894424f8                     mov        qword ptr [rsp - 8], rax
01dbd 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01dc4 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01dcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd0 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01dd8 488f842498000000               pop        qword ptr [rsp + 0x98]
01de0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01de8 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01df0 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01df8 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01e00 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01e08 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01e10 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01e18 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01e20 90                             nop        
01e21 90                             nop        
01e22 90                             nop        
01e23 e83893afff                     call       0x7f63db6ea760
01e28 0f1f8400201f000f               nop        dword ptr [rax + rax + 0xf001f20]
01e30 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e8bdf4b318                     call       0x7f63f4730900
01e43 f4                             hlt        
01e44 be45ffffff                     mov        esi, 0xffffff45
01e49 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4e 8b442408                       mov        eax, dword ptr [rsp + 8]
01e52 890424                         mov        dword ptr [rsp], eax
01e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01e63 89442404                       mov        dword ptr [rsp + 4], eax
01e67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6c 48ff742410                     push       qword ptr [rsp + 0x10]
01e71 488f442408                     pop        qword ptr [rsp + 8]
01e76 48ff742418                     push       qword ptr [rsp + 0x18]
01e7b 488f442410                     pop        qword ptr [rsp + 0x10]
01e80 48894424f8                     mov        qword ptr [rsp - 8], rax
01e85 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e89 89442418                       mov        dword ptr [rsp + 0x18], eax
01e8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e92 48894424f8                     mov        qword ptr [rsp - 8], rax
01e97 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e9b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ead 89442420                       mov        dword ptr [rsp + 0x20], eax
01eb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ebb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01ebf 89442424                       mov        dword ptr [rsp + 0x24], eax
01ec3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ecd 48ff742440                     push       qword ptr [rsp + 0x40]
01ed2 488f442430                     pop        qword ptr [rsp + 0x30]
01ed7 48894424f8                     mov        qword ptr [rsp - 8], rax
01edc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01ee0 89442438                       mov        dword ptr [rsp + 0x38], eax
01ee4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee9 48894424f8                     mov        qword ptr [rsp - 8], rax
01eee 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01ef2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01efb 48ff742450                     push       qword ptr [rsp + 0x50]
01f00 488f442440                     pop        qword ptr [rsp + 0x40]
01f05 48ff742458                     push       qword ptr [rsp + 0x58]
01f0a 488f442448                     pop        qword ptr [rsp + 0x48]
01f0f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01f17 488f442450                     pop        qword ptr [rsp + 0x50]
01f1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f21 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01f28 89442458                       mov        dword ptr [rsp + 0x58], eax
01f2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f31 48894424f8                     mov        qword ptr [rsp - 8], rax
01f36 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01f3d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01f41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f46 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01f52 89442460                       mov        dword ptr [rsp + 0x60], eax
01f56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5b 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01f60 48894424f8                     mov        qword ptr [rsp - 8], rax
01f65 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01f6c 89442464                       mov        dword ptr [rsp + 0x64], eax
01f70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f75 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01f81 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01f99 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01fa0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa5 48894424f8                     mov        qword ptr [rsp - 8], rax
01faa 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01fb1 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01fb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbd 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01fc5 488f842490000000               pop        qword ptr [rsp + 0x90]
01fcd 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01fd5 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01fdd 90                             nop        
01fde 90                             nop        
01fdf e87c91afff                     call       0x7f63db6ea760
01fe4 0f1f8400dc200010               nop        dword ptr [rax + rax + 0x100020dc]
01fec 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
01ff6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ffa e801f3b318                     call       0x7f63f4730900
01fff f4                             hlt        
02000 be45ffffff                     mov        esi, 0xffffff45
02005 48894424f8                     mov        qword ptr [rsp - 8], rax
0200a 8b442408                       mov        eax, dword ptr [rsp + 8]
0200e 890424                         mov        dword ptr [rsp], eax
02011 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02016 48894424f8                     mov        qword ptr [rsp - 8], rax
0201b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0201f 89442404                       mov        dword ptr [rsp + 4], eax
02023 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02028 48ff742410                     push       qword ptr [rsp + 0x10]
0202d 488f442408                     pop        qword ptr [rsp + 8]
02032 48ff742418                     push       qword ptr [rsp + 0x18]
02037 488f442410                     pop        qword ptr [rsp + 0x10]
0203c 48894424f8                     mov        qword ptr [rsp - 8], rax
02041 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02045 89442418                       mov        dword ptr [rsp + 0x18], eax
02049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204e 48894424f8                     mov        qword ptr [rsp - 8], rax
02053 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02057 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0205b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02060 48894424f8                     mov        qword ptr [rsp - 8], rax
02065 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02069 89442420                       mov        dword ptr [rsp + 0x20], eax
0206d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02072 48894424f8                     mov        qword ptr [rsp - 8], rax
02077 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0207b 89442424                       mov        dword ptr [rsp + 0x24], eax
0207f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02084 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02089 48ff742440                     push       qword ptr [rsp + 0x40]
0208e 488f442430                     pop        qword ptr [rsp + 0x30]
02093 48894424f8                     mov        qword ptr [rsp - 8], rax
02098 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0209c 89442438                       mov        dword ptr [rsp + 0x38], eax
020a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a5 48894424f8                     mov        qword ptr [rsp - 8], rax
020aa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
020ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b7 48ff742450                     push       qword ptr [rsp + 0x50]
020bc 488f442440                     pop        qword ptr [rsp + 0x40]
020c1 48ff742458                     push       qword ptr [rsp + 0x58]
020c6 488f442448                     pop        qword ptr [rsp + 0x48]
020cb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
020d3 488f442450                     pop        qword ptr [rsp + 0x50]
020d8 48894424f8                     mov        qword ptr [rsp - 8], rax
020dd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
020e4 89442458                       mov        dword ptr [rsp + 0x58], eax
020e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ed 48894424f8                     mov        qword ptr [rsp - 8], rax
020f2 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
020f9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
020fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02102 48894424f8                     mov        qword ptr [rsp - 8], rax
02107 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0210e 89442460                       mov        dword ptr [rsp + 0x60], eax
02112 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02117 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
0211c 48894424f8                     mov        qword ptr [rsp - 8], rax
02121 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02128 89442464                       mov        dword ptr [rsp + 0x64], eax
0212c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02131 48894424f8                     mov        qword ptr [rsp - 8], rax
02136 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0213d 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02144 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02149 48894424f8                     mov        qword ptr [rsp - 8], rax
0214e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02155 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0215c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02161 48894424f8                     mov        qword ptr [rsp - 8], rax
02166 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0216d 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02174 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02179 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02181 488f842490000000               pop        qword ptr [rsp + 0x90]
02189 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02191 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
02199 90                             nop        
0219a 90                             nop        
0219b e8c08fafff                     call       0x7f63db6ea760
021a0 0f1f840098220011               nop        dword ptr [rax + rax + 0x11002298]
021a8 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
021b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021b6 e845f1b318                     call       0x7f63f4730900
021bb f4                             hlt        
021bc be3dffffff                     mov        esi, 0xffffff3d
021c1 48894424f8                     mov        qword ptr [rsp - 8], rax
021c6 8b442408                       mov        eax, dword ptr [rsp + 8]
021ca 890424                         mov        dword ptr [rsp], eax
021cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d2 48894424f8                     mov        qword ptr [rsp - 8], rax
021d7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
021db 89442404                       mov        dword ptr [rsp + 4], eax
021df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e4 48ff742410                     push       qword ptr [rsp + 0x10]
021e9 488f442408                     pop        qword ptr [rsp + 8]
021ee 48ff742418                     push       qword ptr [rsp + 0x18]
021f3 488f442410                     pop        qword ptr [rsp + 0x10]
021f8 48894424f8                     mov        qword ptr [rsp - 8], rax
021fd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02201 89442418                       mov        dword ptr [rsp + 0x18], eax
02205 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220a 48894424f8                     mov        qword ptr [rsp - 8], rax
0220f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02213 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02217 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221c 48894424f8                     mov        qword ptr [rsp - 8], rax
02221 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02225 89442420                       mov        dword ptr [rsp + 0x20], eax
02229 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222e 48894424f8                     mov        qword ptr [rsp - 8], rax
02233 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02237 89442424                       mov        dword ptr [rsp + 0x24], eax
0223b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02240 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02245 48ff742440                     push       qword ptr [rsp + 0x40]
0224a 488f442430                     pop        qword ptr [rsp + 0x30]
0224f 48894424f8                     mov        qword ptr [rsp - 8], rax
02254 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02258 89442438                       mov        dword ptr [rsp + 0x38], eax
0225c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02261 48894424f8                     mov        qword ptr [rsp - 8], rax
02266 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0226a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0226e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02273 48ff742450                     push       qword ptr [rsp + 0x50]
02278 488f442440                     pop        qword ptr [rsp + 0x40]
0227d 48ff742458                     push       qword ptr [rsp + 0x58]
02282 488f442448                     pop        qword ptr [rsp + 0x48]
02287 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0228f 488f442450                     pop        qword ptr [rsp + 0x50]
02294 48894424f8                     mov        qword ptr [rsp - 8], rax
02299 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
022a0 89442458                       mov        dword ptr [rsp + 0x58], eax
022a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a9 48894424f8                     mov        qword ptr [rsp - 8], rax
022ae 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
022b5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
022b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022be 48894424f8                     mov        qword ptr [rsp - 8], rax
022c3 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
022ca 89442460                       mov        dword ptr [rsp + 0x60], eax
022ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d3 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
022d8 48894424f8                     mov        qword ptr [rsp - 8], rax
022dd 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
022e4 89442464                       mov        dword ptr [rsp + 0x64], eax
022e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ed 48894424f8                     mov        qword ptr [rsp - 8], rax
022f2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
022f9 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02300 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02305 48894424f8                     mov        qword ptr [rsp - 8], rax
0230a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02311 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02329 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02330 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02335 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0233d 488f842490000000               pop        qword ptr [rsp + 0x90]
02345 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0234d 488f842498000000               pop        qword ptr [rsp + 0x98]
02355 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0235d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02365 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0236d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02375 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0237d 48894424f8                     mov        qword ptr [rsp - 8], rax
02382 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02389 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02390 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02395 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0239d 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
023a5 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
023ad 90                             nop        
023ae 90                             nop        
023af e8ac8dafff                     call       0x7f63db6ea760
023b4 0f1f8400ac240012               nop        dword ptr [rax + rax + 0x120024ac]
023bc 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
023c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023ca e831efb318                     call       0x7f63f4730900
023cf f4                             hlt        
023d0 be45ffffff                     mov        esi, 0xffffff45
023d5 48894424f8                     mov        qword ptr [rsp - 8], rax
023da 8b442408                       mov        eax, dword ptr [rsp + 8]
023de 890424                         mov        dword ptr [rsp], eax
023e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e6 48894424f8                     mov        qword ptr [rsp - 8], rax
023eb 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023ef 89442404                       mov        dword ptr [rsp + 4], eax
023f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f8 48ff742410                     push       qword ptr [rsp + 0x10]
023fd 488f442408                     pop        qword ptr [rsp + 8]
02402 48ff742418                     push       qword ptr [rsp + 0x18]
02407 488f442410                     pop        qword ptr [rsp + 0x10]
0240c 48894424f8                     mov        qword ptr [rsp - 8], rax
02411 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02415 89442418                       mov        dword ptr [rsp + 0x18], eax
02419 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241e 48894424f8                     mov        qword ptr [rsp - 8], rax
02423 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02427 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0242b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02430 48894424f8                     mov        qword ptr [rsp - 8], rax
02435 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02439 89442420                       mov        dword ptr [rsp + 0x20], eax
0243d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02442 48894424f8                     mov        qword ptr [rsp - 8], rax
02447 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0244b 89442424                       mov        dword ptr [rsp + 0x24], eax
0244f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02454 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02459 48ff742440                     push       qword ptr [rsp + 0x40]
0245e 488f442430                     pop        qword ptr [rsp + 0x30]
02463 48894424f8                     mov        qword ptr [rsp - 8], rax
02468 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0246c 89442438                       mov        dword ptr [rsp + 0x38], eax
02470 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02475 48894424f8                     mov        qword ptr [rsp - 8], rax
0247a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0247e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02482 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02487 48ff742450                     push       qword ptr [rsp + 0x50]
0248c 488f442440                     pop        qword ptr [rsp + 0x40]
02491 48ff742458                     push       qword ptr [rsp + 0x58]
02496 488f442448                     pop        qword ptr [rsp + 0x48]
0249b 897c2458                       mov        dword ptr [rsp + 0x58], edi
0249f 48ffb42498000000               push       qword ptr [rsp + 0x98]
024a7 488f442470                     pop        qword ptr [rsp + 0x70]
024ac 48894424f8                     mov        qword ptr [rsp - 8], rax
024b1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
024b8 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c1 48894424f8                     mov        qword ptr [rsp - 8], rax
024c6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
024cd 89442478                       mov        dword ptr [rsp + 0x78], eax
024d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d6 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
024de 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
024e6 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
024ee 90                             nop        
024ef e86c8cafff                     call       0x7f63db6ea760
024f4 0f1f8400ec250013               nop        dword ptr [rax + rax + 0x130025ec]
024fc 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02506 4883e4f0                       and        rsp, 0xfffffffffffffff0
0250a e8f1edb318                     call       0x7f63f4730900
0250f f4                             hlt        
02510 be45ffffff                     mov        esi, 0xffffff45
02515 48894424f8                     mov        qword ptr [rsp - 8], rax
0251a 8b442408                       mov        eax, dword ptr [rsp + 8]
0251e 890424                         mov        dword ptr [rsp], eax
02521 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02526 48894424f8                     mov        qword ptr [rsp - 8], rax
0252b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0252f 89442404                       mov        dword ptr [rsp + 4], eax
02533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02538 48ff742410                     push       qword ptr [rsp + 0x10]
0253d 488f442408                     pop        qword ptr [rsp + 8]
02542 48ff742418                     push       qword ptr [rsp + 0x18]
02547 488f442410                     pop        qword ptr [rsp + 0x10]
0254c 48894424f8                     mov        qword ptr [rsp - 8], rax
02551 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02555 89442418                       mov        dword ptr [rsp + 0x18], eax
02559 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255e 48894424f8                     mov        qword ptr [rsp - 8], rax
02563 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02567 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0256b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02570 48894424f8                     mov        qword ptr [rsp - 8], rax
02575 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02579 89442420                       mov        dword ptr [rsp + 0x20], eax
0257d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02582 48894424f8                     mov        qword ptr [rsp - 8], rax
02587 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0258b 89442424                       mov        dword ptr [rsp + 0x24], eax
0258f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02594 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02599 48ff742440                     push       qword ptr [rsp + 0x40]
0259e 488f442430                     pop        qword ptr [rsp + 0x30]
025a3 48894424f8                     mov        qword ptr [rsp - 8], rax
025a8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
025ac 89442438                       mov        dword ptr [rsp + 0x38], eax
025b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ba 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
025be 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c7 48ff742450                     push       qword ptr [rsp + 0x50]
025cc 488f442440                     pop        qword ptr [rsp + 0x40]
025d1 48ff742458                     push       qword ptr [rsp + 0x58]
025d6 488f442448                     pop        qword ptr [rsp + 0x48]
025db 897c2458                       mov        dword ptr [rsp + 0x58], edi
025df 48894424f8                     mov        qword ptr [rsp - 8], rax
025e4 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
025eb 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f4 48894424f8                     mov        qword ptr [rsp - 8], rax
025f9 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02600 89442478                       mov        dword ptr [rsp + 0x78], eax
02604 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02609 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02611 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02619 90                             nop        
0261a 90                             nop        
0261b e8408bafff                     call       0x7f63db6ea760
02620 0f1f840018270014               nop        dword ptr [rax + rax + 0x14002718]
02628 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02632 4883e4f0                       and        rsp, 0xfffffffffffffff0
02636 e8c5ecb318                     call       0x7f63f4730900
0263b f4                             hlt        
0263c be45ffffff                     mov        esi, 0xffffff45
02641 48894424f8                     mov        qword ptr [rsp - 8], rax
02646 8b442408                       mov        eax, dword ptr [rsp + 8]
0264a 890424                         mov        dword ptr [rsp], eax
0264d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02652 48894424f8                     mov        qword ptr [rsp - 8], rax
02657 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0265b 89442404                       mov        dword ptr [rsp + 4], eax
0265f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02664 48ff742410                     push       qword ptr [rsp + 0x10]
02669 488f442408                     pop        qword ptr [rsp + 8]
0266e 48ff742418                     push       qword ptr [rsp + 0x18]
02673 488f442410                     pop        qword ptr [rsp + 0x10]
02678 48894424f8                     mov        qword ptr [rsp - 8], rax
0267d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02681 89442418                       mov        dword ptr [rsp + 0x18], eax
02685 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268a 48894424f8                     mov        qword ptr [rsp - 8], rax
0268f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02693 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02697 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269c 48894424f8                     mov        qword ptr [rsp - 8], rax
026a1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026a5 89442420                       mov        dword ptr [rsp + 0x20], eax
026a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ae 48894424f8                     mov        qword ptr [rsp - 8], rax
026b3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026b7 89442424                       mov        dword ptr [rsp + 0x24], eax
026bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
026c5 48ff742440                     push       qword ptr [rsp + 0x40]
026ca 488f442430                     pop        qword ptr [rsp + 0x30]
026cf 48894424f8                     mov        qword ptr [rsp - 8], rax
026d4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026d8 89442438                       mov        dword ptr [rsp + 0x38], eax
026dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e1 48894424f8                     mov        qword ptr [rsp - 8], rax
026e6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
026ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
026ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f3 48ff742450                     push       qword ptr [rsp + 0x50]
026f8 488f442440                     pop        qword ptr [rsp + 0x40]
026fd 48ff742458                     push       qword ptr [rsp + 0x58]
02702 488f442448                     pop        qword ptr [rsp + 0x48]
02707 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0270f 488f442450                     pop        qword ptr [rsp + 0x50]
02714 48894424f8                     mov        qword ptr [rsp - 8], rax
02719 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02720 89442458                       mov        dword ptr [rsp + 0x58], eax
02724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02729 48894424f8                     mov        qword ptr [rsp - 8], rax
0272e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02735 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02739 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273e 48894424f8                     mov        qword ptr [rsp - 8], rax
02743 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0274a 89442460                       mov        dword ptr [rsp + 0x60], eax
0274e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02753 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0275b 488f442468                     pop        qword ptr [rsp + 0x68]
02760 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02768 488f442470                     pop        qword ptr [rsp + 0x70]
0276d 48ffb42498000000               push       qword ptr [rsp + 0x98]
02775 488f442478                     pop        qword ptr [rsp + 0x78]
0277a 48894424f8                     mov        qword ptr [rsp - 8], rax
0277f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02786 89442464                       mov        dword ptr [rsp + 0x64], eax
0278a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278f 48894424f8                     mov        qword ptr [rsp - 8], rax
02794 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0279b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
027a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a7 48894424f8                     mov        qword ptr [rsp - 8], rax
027ac 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
027b3 89842484000000                 mov        dword ptr [rsp + 0x84], eax
027ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bf 48894424f8                     mov        qword ptr [rsp - 8], rax
027c4 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
027cb 89842488000000                 mov        dword ptr [rsp + 0x88], eax
027d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d7 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
027df 488f842490000000               pop        qword ptr [rsp + 0x90]
027e7 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
027ef 488f842498000000               pop        qword ptr [rsp + 0x98]
027f7 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
027ff 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02807 e85489afff                     call       0x7f63db6ea760
0280c 0f1f840004290015               nop        dword ptr [rax + rax + 0x15002904]
02814 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
0281e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02822 e8d9eab318                     call       0x7f63f4730900
02827 f4                             hlt        
02828 be45ffffff                     mov        esi, 0xffffff45
0282d 48894424f8                     mov        qword ptr [rsp - 8], rax
02832 8b442408                       mov        eax, dword ptr [rsp + 8]
02836 890424                         mov        dword ptr [rsp], eax
02839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02847 89442404                       mov        dword ptr [rsp + 4], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 48ff742410                     push       qword ptr [rsp + 0x10]
02855 488f442408                     pop        qword ptr [rsp + 8]
0285a 48ff742418                     push       qword ptr [rsp + 0x18]
0285f 488f442410                     pop        qword ptr [rsp + 0x10]
02864 48894424f8                     mov        qword ptr [rsp - 8], rax
02869 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0286d 89442418                       mov        dword ptr [rsp + 0x18], eax
02871 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02876 48894424f8                     mov        qword ptr [rsp - 8], rax
0287b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0287f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02888 48894424f8                     mov        qword ptr [rsp - 8], rax
0288d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02891 89442420                       mov        dword ptr [rsp + 0x20], eax
02895 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289a 48894424f8                     mov        qword ptr [rsp - 8], rax
0289f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
028a3 89442424                       mov        dword ptr [rsp + 0x24], eax
028a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ac 48ff742440                     push       qword ptr [rsp + 0x40]
028b1 488f442430                     pop        qword ptr [rsp + 0x30]
028b6 48894424f8                     mov        qword ptr [rsp - 8], rax
028bb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
028bf 89442438                       mov        dword ptr [rsp + 0x38], eax
028c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c8 48894424f8                     mov        qword ptr [rsp - 8], rax
028cd 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
028d1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028da 48ff742450                     push       qword ptr [rsp + 0x50]
028df 488f442440                     pop        qword ptr [rsp + 0x40]
028e4 48ff742458                     push       qword ptr [rsp + 0x58]
028e9 488f442448                     pop        qword ptr [rsp + 0x48]
028ee 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
028f6 488f442450                     pop        qword ptr [rsp + 0x50]
028fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02900 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02907 89442458                       mov        dword ptr [rsp + 0x58], eax
0290b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02910 48894424f8                     mov        qword ptr [rsp - 8], rax
02915 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0291c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02920 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02925 48894424f8                     mov        qword ptr [rsp - 8], rax
0292a 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02931 89442460                       mov        dword ptr [rsp + 0x60], eax
02935 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293a 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02942 488f442468                     pop        qword ptr [rsp + 0x68]
02947 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0294f 488f442470                     pop        qword ptr [rsp + 0x70]
02954 48ffb42498000000               push       qword ptr [rsp + 0x98]
0295c 488f442478                     pop        qword ptr [rsp + 0x78]
02961 48894424f8                     mov        qword ptr [rsp - 8], rax
02966 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0296d 89442464                       mov        dword ptr [rsp + 0x64], eax
02971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02976 48894424f8                     mov        qword ptr [rsp - 8], rax
0297b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02982 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0298e 48894424f8                     mov        qword ptr [rsp - 8], rax
02993 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0299a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
029a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a6 48894424f8                     mov        qword ptr [rsp - 8], rax
029ab 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
029b2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
029b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029be 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
029c6 488f842490000000               pop        qword ptr [rsp + 0x90]
029ce 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
029d6 488f842498000000               pop        qword ptr [rsp + 0x98]
029de 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
029e6 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
029ee 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
029f6 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
029fe 90                             nop        
029ff e85c87afff                     call       0x7f63db6ea760
02a04 0f1f8400fc2a0016               nop        dword ptr [rax + rax + 0x16002afc]
02a0c 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1a e8e1e8b318                     call       0x7f63f4730900
02a1f f4                             hlt        
02a20 4533d2                         xor        r10d, r10d
02a23 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
02a2b e992d7ffff                     jmp        0x7f63dbbef7c2
02a30 4533d2                         xor        r10d, r10d
02a33 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a38 e9abd7ffff                     jmp        0x7f63dbbef7e8
02a3d 4533d2                         xor        r10d, r10d
02a40 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a45 e9c6d7ffff                     jmp        0x7f63dbbef810
02a4a 4533d2                         xor        r10d, r10d
02a4d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02a52 e9e6d7ffff                     jmp        0x7f63dbbef83d
02a57 4533d2                         xor        r10d, r10d
02a5a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02a5f e901d8ffff                     jmp        0x7f63dbbef865
02a64 4533d2                         xor        r10d, r10d
02a67 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
02a6f e921d8ffff                     jmp        0x7f63dbbef895
02a74 4533d2                         xor        r10d, r10d
02a77 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02a7f e93fd8ffff                     jmp        0x7f63dbbef8c3
02a84 4533d2                         xor        r10d, r10d
02a87 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02a8f e95fd8ffff                     jmp        0x7f63dbbef8f3
02a94 bebeffffff                     mov        esi, 0xffffffbe
02a99 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9e 8b442408                       mov        eax, dword ptr [rsp + 8]
02aa2 890424                         mov        dword ptr [rsp], eax
02aa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aaa 48894424f8                     mov        qword ptr [rsp - 8], rax
02aaf 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02ab3 89442404                       mov        dword ptr [rsp + 4], eax
02ab7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02abc 48ff742410                     push       qword ptr [rsp + 0x10]
02ac1 488f442408                     pop        qword ptr [rsp + 8]
02ac6 48ff742418                     push       qword ptr [rsp + 0x18]
02acb 488f442410                     pop        qword ptr [rsp + 0x10]
02ad0 48894424f8                     mov        qword ptr [rsp - 8], rax
02ad5 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02ad9 89442418                       mov        dword ptr [rsp + 0x18], eax
02add 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae7 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02aeb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02aef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af4 48894424f8                     mov        qword ptr [rsp - 8], rax
02af9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02afd 89442420                       mov        dword ptr [rsp + 0x20], eax
02b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b06 48894424f8                     mov        qword ptr [rsp - 8], rax
02b0b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02b0f 89442424                       mov        dword ptr [rsp + 0x24], eax
02b13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b18 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02b1d 48ff742440                     push       qword ptr [rsp + 0x40]
02b22 488f442430                     pop        qword ptr [rsp + 0x30]
02b27 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02b30 89442438                       mov        dword ptr [rsp + 0x38], eax
02b34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b39 48894424f8                     mov        qword ptr [rsp - 8], rax
02b3e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02b42 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b4b 48ff742450                     push       qword ptr [rsp + 0x50]
02b50 488f442440                     pop        qword ptr [rsp + 0x40]
02b55 48ff742458                     push       qword ptr [rsp + 0x58]
02b5a 488f442448                     pop        qword ptr [rsp + 0x48]
02b5f 48894424f8                     mov        qword ptr [rsp - 8], rax
02b64 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02b6b 89442458                       mov        dword ptr [rsp + 0x58], eax
02b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b74 48894424f8                     mov        qword ptr [rsp - 8], rax
02b79 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02b80 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02b84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b89 90                             nop        
02b8a 90                             nop        
02b8b e8d085afff                     call       0x7f63db6ea760
02b90 0f1f8400882c0017               nop        dword ptr [rax + rax + 0x17002c88]
02b98 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02ba2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ba6 e855e7b318                     call       0x7f63f4730900
02bab f4                             hlt        
02bac be85ffffff                     mov        esi, 0xffffff85
02bb1 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02bb5 48894424f8                     mov        qword ptr [rsp - 8], rax
02bba 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02bbe 890424                         mov        dword ptr [rsp], eax
02bc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bc6 48894424f8                     mov        qword ptr [rsp - 8], rax
02bcb 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02bcf 89442404                       mov        dword ptr [rsp + 4], eax
02bd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd8 48894424f8                     mov        qword ptr [rsp - 8], rax
02bdd 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02be1 89442408                       mov        dword ptr [rsp + 8], eax
02be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bea 48894424f8                     mov        qword ptr [rsp - 8], rax
02bef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bf3 8944240c                       mov        dword ptr [rsp + 0xc], eax
02bf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bfc 48894424f8                     mov        qword ptr [rsp - 8], rax
02c01 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02c05 89442410                       mov        dword ptr [rsp + 0x10], eax
02c09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0e 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02c13 48ff742440                     push       qword ptr [rsp + 0x40]
02c18 488f442420                     pop        qword ptr [rsp + 0x20]
02c1d 48894424f8                     mov        qword ptr [rsp - 8], rax
02c22 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c26 89442414                       mov        dword ptr [rsp + 0x14], eax
02c2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2f 48894424f8                     mov        qword ptr [rsp - 8], rax
02c34 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02c38 89442428                       mov        dword ptr [rsp + 0x28], eax
02c3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c41 48894424f8                     mov        qword ptr [rsp - 8], rax
02c46 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02c4d 8944242c                       mov        dword ptr [rsp + 0x2c], eax
02c51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c56 48894424f8                     mov        qword ptr [rsp - 8], rax
02c5b 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02c62 89442430                       mov        dword ptr [rsp + 0x30], eax
02c66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c6b 48894424f8                     mov        qword ptr [rsp - 8], rax
02c70 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02c77 89442434                       mov        dword ptr [rsp + 0x34], eax
02c7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c80 48894424f8                     mov        qword ptr [rsp - 8], rax
02c85 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02c8c 89442448                       mov        dword ptr [rsp + 0x48], eax
02c90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c95 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
02c9d 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
02ca5 90                             nop        
02ca6 90                             nop        
02ca7 e8b484afff                     call       0x7f63db6ea760
02cac 0f1f8400a42d0018               nop        dword ptr [rax + rax + 0x18002da4]
02cb4 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02cbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cc2 e839e6b318                     call       0x7f63f4730900
02cc7 f4                             hlt        
02cc8 bef6ffffff                     mov        esi, 0xfffffff6
02ccd 90                             nop        
02cce 90                             nop        
02ccf e88c84afff                     call       0x7f63db6ea760
02cd4 0f1f8400cc2d0019               nop        dword ptr [rax + rax + 0x19002dcc]
02cdc 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02ce6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cea e811e6b318                     call       0x7f63f4730900
02cef f4                             hlt        
02cf0 be5d000000                     mov        esi, 0x5d
02cf5 90                             nop        
02cf6 90                             nop        
02cf7 e86484afff                     call       0x7f63db6ea760
02cfc 0f1f8400f42d001a               nop        dword ptr [rax + rax + 0x1a002df4]
02d04 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d12 e8e9e5b318                     call       0x7f63f4730900
02d17 f4                             hlt        
02d18 bef6ffffff                     mov        esi, 0xfffffff6
02d1d 418beb                         mov        ebp, r11d
02d20 90                             nop        
02d21 90                             nop        
02d22 90                             nop        
02d23 e83884afff                     call       0x7f63db6ea760
02d28 0f1f8400202e001b               nop        dword ptr [rax + rax + 0x1b002e20]
02d30 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02d3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d3e e8bde5b318                     call       0x7f63f4730900
02d43 f4                             hlt        
02d44 bef6ffffff                     mov        esi, 0xfffffff6
02d49 8be9                           mov        ebp, ecx
02d4b e81084afff                     call       0x7f63db6ea760
02d50 0f1f8400482e001c               nop        dword ptr [rax + rax + 0x1c002e48]
02d58 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02d62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d66 e895e5b318                     call       0x7f63f4730900
02d6b f4                             hlt        
02d6c bef6ffffff                     mov        esi, 0xfffffff6
02d71 418beb                         mov        ebp, r11d
02d74 90                             nop        
02d75 90                             nop        
02d76 90                             nop        
02d77 e8e483afff                     call       0x7f63db6ea760
02d7c 0f1f8400742e001d               nop        dword ptr [rax + rax + 0x1d002e74]
02d84 48bff08811b4637f0000           movabs     rdi, 0x7f63b41188f0
02d8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d92 e869e5b318                     call       0x7f63f4730900
02d97 f4                             hlt        
02d98 eb00                           jmp        0x7f63dbbf239a
02d9a 488bf0                         mov        rsi, rax
02d9d e90addffff                     jmp        0x7f63dbbf00ac
02da2 49bad400bfdb637f0000           movabs     r10, 0x7f63dbbf00d4
02dac 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02db3 e9a83fb5ff                     jmp        0x7f63db746360
02db8 e8230eb4ff                     call       0x7f63db7331e0
02dbd e96cd2ffff                     jmp        0x7f63dbbef62e
02dc2 f4                             hlt        
02dc3 f4                             hlt        
02dc4 f4                             hlt        
02dc5 f4                             hlt        
02dc6 f4                             hlt        
02dc7 f4                             hlt        
