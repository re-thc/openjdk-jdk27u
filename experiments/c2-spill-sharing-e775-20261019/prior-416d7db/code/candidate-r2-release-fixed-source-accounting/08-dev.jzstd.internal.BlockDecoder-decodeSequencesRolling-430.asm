00000 e8fbe7ca18                     call       0x7f4c34b29880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec20010000                 sub        rsp, 0x120
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f856e2b0000                   jne        0x7f4c1be7dc1c
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
00184 49ba4088c0344c7f0000           movabs     r10, 0x7f4c34c08840
0018e 41ffd2                         call       r10
00191 0f1f840000000000               nop        dword ptr [rax + rax]
00199 4d85ed                         test       r13, r13
0019c 0f84ee260000                   je         0x7f4c1be7d910
001a2 458b5d04                       mov        r11d, dword ptr [r13 + 4]
001a6 41c1eb0a                       shr        r11d, 0xa
001aa 4181fb05020000                 cmp        r11d, 0x205
001b1 0f8551280000                   jne        0x7f4c1be7da88
001b7 4d8bd5                         mov        r10, r13
001ba 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
001c2 4d85f6                         test       r14, r14
001c5 0f84d5260000                   je         0x7f4c1be7d920
001cb 458b5604                       mov        r10d, dword ptr [r14 + 4]
001cf 41c1ea0a                       shr        r10d, 0xa
001d3 4181fa0e080000                 cmp        r10d, 0x80e
001da 0f8528280000                   jne        0x7f4c1be7da88
001e0 4d8bd6                         mov        r10, r14
001e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001ed 4d85d2                         test       r10, r10
001f0 0f84b7260000                   je         0x7f4c1be7d92d
001f6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001fa 41c1eb0a                       shr        r11d, 0xa
001fe 4181fb16060000                 cmp        r11d, 0x616
00205 0f85fd270000                   jne        0x7f4c1be7da88
0020b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00210 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00215 4d85d2                         test       r10, r10
00218 0f849c260000                   je         0x7f4c1be7d93a
0021e 458b5204                       mov        r10d, dword ptr [r10 + 4]
00222 41c1ea0a                       shr        r10d, 0xa
00226 4181fa1c060000                 cmp        r10d, 0x61c
0022d 0f85d5270000                   jne        0x7f4c1be7da88
00233 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00238 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0023d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00242 4d85d2                         test       r10, r10
00245 0f847c260000                   je         0x7f4c1be7d947
0024b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0024f 41c1eb0a                       shr        r11d, 0xa
00253 4181fb1c060000                 cmp        r11d, 0x61c
0025a 0f85a8270000                   jne        0x7f4c1be7da88
00260 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00265 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0026a 4d85d2                         test       r10, r10
0026d 0f8461260000                   je         0x7f4c1be7d954
00273 458b5204                       mov        r10d, dword ptr [r10 + 4]
00277 41c1ea0a                       shr        r10d, 0xa
0027b 4181fa1c060000                 cmp        r10d, 0x61c
00282 0f8580270000                   jne        0x7f4c1be7da88
00288 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0028d 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00295 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0029d 4d85d2                         test       r10, r10
002a0 0f843e260000                   je         0x7f4c1be7d964
002a6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002aa 41c1eb0a                       shr        r11d, 0xa
002ae 4181fb08020000                 cmp        r11d, 0x208
002b5 0f854d270000                   jne        0x7f4c1be7da88
002bb 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002c3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002c8 4d85d2                         test       r10, r10
002cb 0f8423260000                   je         0x7f4c1be7d974
002d1 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d5 41c1ea0a                       shr        r10d, 0xa
002d9 4181fa07020000                 cmp        r10d, 0x207
002e0 0f8522270000                   jne        0x7f4c1be7da88
002e6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
002eb 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
002f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002f8 4d85d2                         test       r10, r10
002fb 0f8403260000                   je         0x7f4c1be7d984
00301 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00306 4d85d2                         test       r10, r10
00309 0f84f5250000                   je         0x7f4c1be7d984
0030f 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00317 4d85d2                         test       r10, r10
0031a 0f84e4250000                   je         0x7f4c1be7d984
00320 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00328 418b6a08                       mov        ebp, dword ptr [r10 + 8]
0032c 892c24                         mov        dword ptr [rsp], ebp
0032f 4c8b942408010000               mov        r10, qword ptr [rsp + 0x108]
00337 458b5208                       mov        r10d, dword ptr [r10 + 8]
0033b 458d5af9                       lea        r11d, [r10 - 7]
0033f 4585db                         test       r11d, r11d
00342 0f8cbc250000                   jl         0x7f4c1be7d984
00348 4183c2f9                       add        r10d, -7
0034c 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00354 e96b020000                     jmp        0x7f4c1be7b644
00359 4c8b9c2408010000               mov        r11, qword ptr [rsp + 0x108]
00361 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00366 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
0036b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00370 48894424f8                     mov        qword ptr [rsp - 8], rax
00375 8b442430                       mov        eax, dword ptr [rsp + 0x30]
00379 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0037d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00382 0f1f8000000000                 nop        dword ptr [rax]
00389 0f1f8000000000                 nop        dword ptr [rax]
00390 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8db8100000                   jge        0x7f4c1be7c4d8
003a0 c462d3f79c2400010000           shrx       r11, qword ptr [rsp + 0x100], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942400010000               and        r10, qword ptr [rsp + 0x100]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d4d120000                   jge        0x7f4c1be7c6a0
003d3 c442d3f7c3                     shrx       r8, r11, rbp
003d8 41b901000000                   mov        r9d, 1
003de c442d1f7c9                     shlx       r9, r9, rbp
003e3 49ffc9                         dec        r9
003e6 4d23cb                         and        r9, r11
003e9 418bf9                         mov        edi, r9d
003ec 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d14140000                   jge        0x7f4c1be7c890
003fc c442d3f7d8                     shrx       r11, r8, rbp
00401 41b901000000                   mov        r9d, 1
00407 c442d1f7c9                     shlx       r9, r9, rbp
0040c 49ffc9                         dec        r9
0040f 4d23c8                         and        r9, r8
00412 418bc9                         mov        ecx, r9d
00415 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
0041c 83fd40                         cmp        ebp, 0x40
0041f 0f8dcb150000                   jge        0x7f4c1be7ca70
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
00478 0f8e460c0000                   jle        0x7f4c1be7c144
0047e 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00485 0f8f41170000                   jg         0x7f4c1be7cc4c
0048b 4181fbffff0100                 cmp        r11d, 0x1ffff
00492 0f8fa8180000                   jg         0x7f4c1be7cdc0
00498 4181f8ffff0300                 cmp        r8d, 0x3ffff
0049f 0f8f431a0000                   jg         0x7f4c1be7cf68
004a5 458bc9                         mov        r9d, r9d
004a8 4181f900000010                 cmp        r9d, 0x10000000
004af 0f83db1b0000                   jae        0x7f4c1be7d110
004b5 4d63c3                         movsxd     r8, r11d
004b8 4d63d9                         movsxd     r11, r9d
004bb 48c1e112                       shl        rcx, 0x12
004bf 49c1e324                       shl        r11, 0x24
004c3 4c0bd9                         or         r11, rcx
004c6 4d0bd8                         or         r11, r8
004c9 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004d1 443b0c24                       cmp        r9d, dword ptr [rsp]
004d5 0f83210a0000                   jae        0x7f4c1be7bf7c
004db 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e3 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004eb 4f895cc110                     mov        qword ptr [r9 + r8*8 + 0x10], r11
004f0 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f4 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f8 0f8db8000000                   jge        0x7f4c1be7b636
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
00552 0f8d381d0000                   jge        0x7f4c1be7d310
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
0058c 0f8d2a1e0000                   jge        0x7f4c1be7d43c
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
005d1 0f8d83040000                   jge        0x7f4c1be7bada
005d7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
005dc 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
005e0 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
005e8 44239c24a0000000               and        r11d, dword ptr [rsp + 0xa0]
005f0 458b4208                       mov        r8d, dword ptr [r10 + 8]
005f4 453bd8                         cmp        r11d, r8d
005f7 0f83fd040000                   jae        0x7f4c1be7bb7a
005fd 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
00602 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
00606 8b8c248c000000                 mov        ecx, dword ptr [rsp + 0x8c]
0060d 238c24a4000000                 and        ecx, dword ptr [rsp + 0xa4]
00614 458b4108                       mov        r8d, dword ptr [r9 + 8]
00618 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
0061d 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00625 413bc8                         cmp        ecx, r8d
00628 0f830a060000                   jae        0x7f4c1be7bcb8
0062e 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00636 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
0063a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00642 44239c24a8000000               and        r11d, dword ptr [rsp + 0xa8]
0064a 458b4208                       mov        r8d, dword ptr [r10 + 8]
0064e 4d8b4cc910                     mov        r9, qword ptr [r9 + rcx*8 + 0x10]
00653 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
0065b 453bd8                         cmp        r11d, r8d
0065e 0f831c070000                   jae        0x7f4c1be7be00
00664 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
00669 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00671 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00678 ffc5                           inc        ebp
0067a 896c2404                       mov        dword ptr [rsp + 4], ebp
0067e 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00682 0f8d43040000                   jge        0x7f4c1be7bb4b
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
00756 0f84d80a0000                   je         0x7f4c1be7c2b4
0075c 4183fb3f                       cmp        r11d, 0x3f
00760 0f8f920c0000                   jg         0x7f4c1be7c478
00766 41ba40000000                   mov        r10d, 0x40
0076c 442b542448                     sub        r10d, dword ptr [rsp + 0x48]
00771 453bda                         cmp        r11d, r10d
00774 7e43                           jle        0x7f4c1be7b839
00776 458bc3                         mov        r8d, r11d
00779 452bc2                         sub        r8d, r10d
0077c 4183fa40                       cmp        r10d, 0x40
00780 0f8d261f0000                   jge        0x7f4c1be7d72c
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
007b7 eb2b                           jmp        0x7f4c1be7b864
007b9 452bd3                         sub        r10d, r11d
007bc c462abf7d3                     shrx       r10, rbx, r10
007c1 4183fb40                       cmp        r11d, 0x40
007c5 0f8d091d0000                   jge        0x7f4c1be7d554
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
00802 0f8c88fbffff                   jl         0x7f4c1be7b410
00808 458d5ac0                       lea        r11d, [r10 - 0x40]
0080c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00811 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00815 83c5f8                         add        ebp, -8
00818 896c2430                       mov        dword ptr [rsp + 0x30], ebp
0081c 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00820 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00824 83c1f0                         add        ecx, -0x10
00827 83f908                         cmp        ecx, 8
0082a 0f8cdc010000                   jl         0x7f4c1be7ba8c
00830 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00835 4183c2e8                       add        r10d, -0x18
00839 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00841 0f8212fbffff                   jb         0x7f4c1be7b3d9
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
009fd 6690                           nop        
009ff e8dcc2b5ff                     call       0x7f4c1b9d7d60
00a04 0f1f8400fc0a0001               nop        dword ptr [rax + rax + 0x1000afc]
00a0c 85c9                           test       ecx, ecx
00a0e 7f08                           jg         0x7f4c1be7ba98
00a10 4533d2                         xor        r10d, r10d
00a13 e94ef9ffff                     jmp        0x7f4c1be7b3e6
00a18 8be9                           mov        ebp, ecx
00a1a 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
00a22 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a26 90                             nop        
00a27 e8b44da9ff                     call       0x7f4c1b910860
00a2c 0f1f8400240b0002               nop        dword ptr [rax + rax + 0x2000b24]
00a34 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a39 41c1e303                       shl        r11d, 3
00a3d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00a42 41c1e203                       shl        r10d, 3
00a46 452bd3                         sub        r10d, r11d
00a49 4181c2c0000000                 add        r10d, 0xc0
00a50 c462a9f7d0                     shlx       r10, rax, r10
00a55 e90cf9ffff                     jmp        0x7f4c1be7b3e6
00a5a 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00a62 4c03942498000000               add        r10, qword ptr [rsp + 0x98]
00a6a 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a6f 4d3bd3                         cmp        r10, r11
00a72 7e31                           jle        0x7f4c1be7bb25
00a74 48be385d32e300000000           movabs     rsi, 0xe3325d38
00a7e 90                             nop        
00a7f e85c4da9ff                     call       0x7f4c1b910860
00a84 0f1f84007c0b0003               nop        dword ptr [rax + rax + 0x3000b7c]
00a8c 4885c0                         test       rax, rax
00a8f 0f847b200000                   je         0x7f4c1be7db90
00a95 488bf0                         mov        rsi, rax
00a98 4881c420010000                 add        rsp, 0x120
00a9f 5d                             pop        rbp
00aa0 e9bbeab5ff                     jmp        0x7f4c1b9da5e0
00aa5 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00aaa 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00aaf 0f856f200000                   jne        0x7f4c1be7dba4
00ab5 418bc2                         mov        eax, r10d
00ab8 4881c420010000                 add        rsp, 0x120
00abf 5d                             pop        rbp
00ac0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ac4 0f87bc200000                   ja         0x7f4c1be7dc06
00aca c3                             ret        
00acb 4533d2                         xor        r10d, r10d
00ace 33ed                           xor        ebp, ebp
00ad0 4533c0                         xor        r8d, r8d
00ad3 4533db                         xor        r11d, r11d
00ad6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00ade 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00ae5 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
00aed 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
00af5 e9f0fbffff                     jmp        0x7f4c1be7b76a
00afa bee4ffffff                     mov        esi, 0xffffffe4
00aff 48894424f8                     mov        qword ptr [rsp - 8], rax
00b04 8b442408                       mov        eax, dword ptr [rsp + 8]
00b08 890424                         mov        dword ptr [rsp], eax
00b0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b10 48894424f8                     mov        qword ptr [rsp - 8], rax
00b15 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b19 89442404                       mov        dword ptr [rsp + 4], eax
00b1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b22 48ff742410                     push       qword ptr [rsp + 0x10]
00b27 488f442408                     pop        qword ptr [rsp + 8]
00b2c 48ff742418                     push       qword ptr [rsp + 0x18]
00b31 488f442410                     pop        qword ptr [rsp + 0x10]
00b36 48894424f8                     mov        qword ptr [rsp - 8], rax
00b3b 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b3f 89442418                       mov        dword ptr [rsp + 0x18], eax
00b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b48 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4d 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b51 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b63 89442420                       mov        dword ptr [rsp + 0x20], eax
00b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b71 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b75 89442424                       mov        dword ptr [rsp + 0x24], eax
00b79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b7e 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b83 48ff742440                     push       qword ptr [rsp + 0x40]
00b88 488f442430                     pop        qword ptr [rsp + 0x30]
00b8d 48894424f8                     mov        qword ptr [rsp - 8], rax
00b92 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00b96 89442438                       mov        dword ptr [rsp + 0x38], eax
00b9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9f 48894424f8                     mov        qword ptr [rsp - 8], rax
00ba4 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00ba8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00bac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bb1 48ff742450                     push       qword ptr [rsp + 0x50]
00bb6 488f442440                     pop        qword ptr [rsp + 0x40]
00bbb 48ff742458                     push       qword ptr [rsp + 0x58]
00bc0 488f442448                     pop        qword ptr [rsp + 0x48]
00bc5 48894424f8                     mov        qword ptr [rsp - 8], rax
00bca 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00bd1 89442458                       mov        dword ptr [rsp + 0x58], eax
00bd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bda 48894424f8                     mov        qword ptr [rsp - 8], rax
00bdf 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00be6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00bea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bef 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf4 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00bfb 89442460                       mov        dword ptr [rsp + 0x60], eax
00bff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c04 48894424f8                     mov        qword ptr [rsp - 8], rax
00c09 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00c10 89442464                       mov        dword ptr [rsp + 0x64], eax
00c14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c19 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00c21 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00c29 6690                           nop        
00c2b e8b0c0b5ff                     call       0x7f4c1b9d7d60
00c30 0f1f8400280d0004               nop        dword ptr [rax + rax + 0x4000d28]
00c38 bee4ffffff                     mov        esi, 0xffffffe4
00c3d 48894424f8                     mov        qword ptr [rsp - 8], rax
00c42 8b442408                       mov        eax, dword ptr [rsp + 8]
00c46 890424                         mov        dword ptr [rsp], eax
00c49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c53 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00c57 89442404                       mov        dword ptr [rsp + 4], eax
00c5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c60 48ff742410                     push       qword ptr [rsp + 0x10]
00c65 488f442408                     pop        qword ptr [rsp + 8]
00c6a 48ff742418                     push       qword ptr [rsp + 0x18]
00c6f 488f442410                     pop        qword ptr [rsp + 0x10]
00c74 48894424f8                     mov        qword ptr [rsp - 8], rax
00c79 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c7d 89442418                       mov        dword ptr [rsp + 0x18], eax
00c81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c86 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c8f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c98 48894424f8                     mov        qword ptr [rsp - 8], rax
00c9d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ca1 89442420                       mov        dword ptr [rsp + 0x20], eax
00ca5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00caa 48894424f8                     mov        qword ptr [rsp - 8], rax
00caf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00cb3 89442424                       mov        dword ptr [rsp + 0x24], eax
00cb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cbc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00cc1 48ff742440                     push       qword ptr [rsp + 0x40]
00cc6 488f442430                     pop        qword ptr [rsp + 0x30]
00ccb 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00cd4 89442438                       mov        dword ptr [rsp + 0x38], eax
00cd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cdd 48894424f8                     mov        qword ptr [rsp - 8], rax
00ce2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00ce6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00cea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cef 48ff742450                     push       qword ptr [rsp + 0x50]
00cf4 488f442440                     pop        qword ptr [rsp + 0x40]
00cf9 48ff742458                     push       qword ptr [rsp + 0x58]
00cfe 488f442448                     pop        qword ptr [rsp + 0x48]
00d03 48894424f8                     mov        qword ptr [rsp - 8], rax
00d08 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00d0f 89442458                       mov        dword ptr [rsp + 0x58], eax
00d13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d18 48894424f8                     mov        qword ptr [rsp - 8], rax
00d1d 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00d24 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00d28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d2d 48894424f8                     mov        qword ptr [rsp - 8], rax
00d32 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00d39 89442460                       mov        dword ptr [rsp + 0x60], eax
00d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d42 48ffb42498000000               push       qword ptr [rsp + 0x98]
00d4a 488f442478                     pop        qword ptr [rsp + 0x78]
00d4f 48894424f8                     mov        qword ptr [rsp - 8], rax
00d54 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00d5b 89442464                       mov        dword ptr [rsp + 0x64], eax
00d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d64 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00d6c 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00d73 e868bfb5ff                     call       0x7f4c1b9d7d60
00d78 0f1f8400700e0005               nop        dword ptr [rax + rax + 0x5000e70]
00d80 bee4ffffff                     mov        esi, 0xffffffe4
00d85 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8a 8b442408                       mov        eax, dword ptr [rsp + 8]
00d8e 890424                         mov        dword ptr [rsp], eax
00d91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d96 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d9f 89442404                       mov        dword ptr [rsp + 4], eax
00da3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da8 48ff742410                     push       qword ptr [rsp + 0x10]
00dad 488f442408                     pop        qword ptr [rsp + 8]
00db2 48ff742418                     push       qword ptr [rsp + 0x18]
00db7 488f442410                     pop        qword ptr [rsp + 0x10]
00dbc 48894424f8                     mov        qword ptr [rsp - 8], rax
00dc1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00dc5 89442418                       mov        dword ptr [rsp + 0x18], eax
00dc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dce 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00dd7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00ddb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00de0 48894424f8                     mov        qword ptr [rsp - 8], rax
00de5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00de9 89442420                       mov        dword ptr [rsp + 0x20], eax
00ded 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df2 48894424f8                     mov        qword ptr [rsp - 8], rax
00df7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00dfb 89442424                       mov        dword ptr [rsp + 0x24], eax
00dff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e04 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00e09 48ff742440                     push       qword ptr [rsp + 0x40]
00e0e 488f442430                     pop        qword ptr [rsp + 0x30]
00e13 48894424f8                     mov        qword ptr [rsp - 8], rax
00e18 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00e1c 89442438                       mov        dword ptr [rsp + 0x38], eax
00e20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e25 48894424f8                     mov        qword ptr [rsp - 8], rax
00e2a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00e2e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e37 48ff742450                     push       qword ptr [rsp + 0x50]
00e3c 488f442440                     pop        qword ptr [rsp + 0x40]
00e41 48ff742458                     push       qword ptr [rsp + 0x58]
00e46 488f442448                     pop        qword ptr [rsp + 0x48]
00e4b 48894424f8                     mov        qword ptr [rsp - 8], rax
00e50 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00e57 89442458                       mov        dword ptr [rsp + 0x58], eax
00e5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e60 48894424f8                     mov        qword ptr [rsp - 8], rax
00e65 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00e6c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00e70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e75 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7a 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00e81 89442460                       mov        dword ptr [rsp + 0x60], eax
00e85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8a 48ffb42498000000               push       qword ptr [rsp + 0x98]
00e92 488f442478                     pop        qword ptr [rsp + 0x78]
00e97 48894424f8                     mov        qword ptr [rsp - 8], rax
00e9c 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00ea3 89442464                       mov        dword ptr [rsp + 0x64], eax
00ea7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eac 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb1 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00eb8 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00ebf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ec9 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00ed0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00ed7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00edc 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ee4 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00eec 666690                         nop        
00eef e8ecbdb5ff                     call       0x7f4c1b9d7d60
00ef4 0f1f8400ec0f0006               nop        dword ptr [rax + rax + 0x6000fec]
00efc bee4ffffff                     mov        esi, 0xffffffe4
00f01 48894424f8                     mov        qword ptr [rsp - 8], rax
00f06 8b442408                       mov        eax, dword ptr [rsp + 8]
00f0a 890424                         mov        dword ptr [rsp], eax
00f0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f12 48894424f8                     mov        qword ptr [rsp - 8], rax
00f17 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00f1b 89442404                       mov        dword ptr [rsp + 4], eax
00f1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f24 48ff742410                     push       qword ptr [rsp + 0x10]
00f29 488f442408                     pop        qword ptr [rsp + 8]
00f2e 48ff742418                     push       qword ptr [rsp + 0x18]
00f33 488f442410                     pop        qword ptr [rsp + 0x10]
00f38 48894424f8                     mov        qword ptr [rsp - 8], rax
00f3d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00f41 89442418                       mov        dword ptr [rsp + 0x18], eax
00f45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f4f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00f53 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f5c 48894424f8                     mov        qword ptr [rsp - 8], rax
00f61 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f65 89442420                       mov        dword ptr [rsp + 0x20], eax
00f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f6e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f73 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00f77 89442424                       mov        dword ptr [rsp + 0x24], eax
00f7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f80 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00f85 48ff742440                     push       qword ptr [rsp + 0x40]
00f8a 488f442430                     pop        qword ptr [rsp + 0x30]
00f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
00f94 8b442448                       mov        eax, dword ptr [rsp + 0x48]
00f98 89442438                       mov        dword ptr [rsp + 0x38], eax
00f9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa1 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00faa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00fae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb3 48ff742450                     push       qword ptr [rsp + 0x50]
00fb8 488f442440                     pop        qword ptr [rsp + 0x40]
00fbd 48ff742458                     push       qword ptr [rsp + 0x58]
00fc2 488f442448                     pop        qword ptr [rsp + 0x48]
00fc7 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
00fcf 488f442450                     pop        qword ptr [rsp + 0x50]
00fd4 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00fe0 89442458                       mov        dword ptr [rsp + 0x58], eax
00fe4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe9 48894424f8                     mov        qword ptr [rsp - 8], rax
00fee 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ff5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00ff9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffe 48894424f8                     mov        qword ptr [rsp - 8], rax
01003 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0100a 89442460                       mov        dword ptr [rsp + 0x60], eax
0100e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01013 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01018 48894424f8                     mov        qword ptr [rsp - 8], rax
0101d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01024 89442464                       mov        dword ptr [rsp + 0x64], eax
01028 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0102d 48894424f8                     mov        qword ptr [rsp - 8], rax
01032 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01039 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01040 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01045 48894424f8                     mov        qword ptr [rsp - 8], rax
0104a 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01051 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01058 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0105d 48894424f8                     mov        qword ptr [rsp - 8], rax
01062 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01069 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01070 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01075 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0107d 488f842490000000               pop        qword ptr [rsp + 0x90]
01085 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0108d 488f842498000000               pop        qword ptr [rsp + 0x98]
01095 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0109d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
010a5 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
010ad 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
010b5 6690                           nop        
010b7 e824bcb5ff                     call       0x7f4c1b9d7d60
010bc 0f1f8400b4110007               nop        dword ptr [rax + rax + 0x70011b4]
010c4 33c9                           xor        ecx, ecx
010c6 4c3bc9                         cmp        r9, rcx
010c9 bdffffffff                     mov        ebp, 0xffffffff
010ce 7c08                           jl         0x7f4c1be7c158
010d0 400f95c5                       setne      bpl
010d4 400fb6ed                       movzx      ebp, bpl
010d8 be45ffffff                     mov        esi, 0xffffff45
010dd 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
010e2 48ff742440                     push       qword ptr [rsp + 0x40]
010e7 488f442438                     pop        qword ptr [rsp + 0x38]
010ec 48894424f8                     mov        qword ptr [rsp - 8], rax
010f1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
010f5 89442440                       mov        dword ptr [rsp + 0x40], eax
010f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01103 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01107 89442444                       mov        dword ptr [rsp + 0x44], eax
0110b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01110 48ff742450                     push       qword ptr [rsp + 0x50]
01115 488f442448                     pop        qword ptr [rsp + 0x48]
0111a 48ff742458                     push       qword ptr [rsp + 0x58]
0111f 488f442450                     pop        qword ptr [rsp + 0x50]
01124 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0112c 488f442458                     pop        qword ptr [rsp + 0x58]
01131 48894424f8                     mov        qword ptr [rsp - 8], rax
01136 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0113d 89442460                       mov        dword ptr [rsp + 0x60], eax
01141 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01146 48894424f8                     mov        qword ptr [rsp - 8], rax
0114b 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01152 89442464                       mov        dword ptr [rsp + 0x64], eax
01156 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0115b 48894424f8                     mov        qword ptr [rsp - 8], rax
01160 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01167 89442468                       mov        dword ptr [rsp + 0x68], eax
0116b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01170 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01178 48894424f8                     mov        qword ptr [rsp - 8], rax
0117d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01184 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01188 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118d 48894424f8                     mov        qword ptr [rsp - 8], rax
01192 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01199 89842488000000                 mov        dword ptr [rsp + 0x88], eax
011a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a5 48894424f8                     mov        qword ptr [rsp - 8], rax
011aa 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
011b1 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
011b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011bd 48894424f8                     mov        qword ptr [rsp - 8], rax
011c2 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
011c9 89842490000000                 mov        dword ptr [rsp + 0x90], eax
011d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d5 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
011dd 488f842498000000               pop        qword ptr [rsp + 0x98]
011e5 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
011ed 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
011f5 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
011fd 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01205 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0120d 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01215 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0121d 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01225 6690                           nop        
01227 e8b4bab5ff                     call       0x7f4c1b9d7d60
0122c 0f1f840024130008               nop        dword ptr [rax + rax + 0x8001324]
01234 be45ffffff                     mov        esi, 0xffffff45
01239 48894424f8                     mov        qword ptr [rsp - 8], rax
0123e 8b442408                       mov        eax, dword ptr [rsp + 8]
01242 890424                         mov        dword ptr [rsp], eax
01245 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124a 48894424f8                     mov        qword ptr [rsp - 8], rax
0124f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01253 89442404                       mov        dword ptr [rsp + 4], eax
01257 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125c 48ff742410                     push       qword ptr [rsp + 0x10]
01261 488f442408                     pop        qword ptr [rsp + 8]
01266 48ff742418                     push       qword ptr [rsp + 0x18]
0126b 488f442410                     pop        qword ptr [rsp + 0x10]
01270 48894424f8                     mov        qword ptr [rsp - 8], rax
01275 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01279 89442418                       mov        dword ptr [rsp + 0x18], eax
0127d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01282 48894424f8                     mov        qword ptr [rsp - 8], rax
01287 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0128b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0128f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01294 48894424f8                     mov        qword ptr [rsp - 8], rax
01299 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0129d 89442420                       mov        dword ptr [rsp + 0x20], eax
012a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a6 48894424f8                     mov        qword ptr [rsp - 8], rax
012ab 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
012af 89442424                       mov        dword ptr [rsp + 0x24], eax
012b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
012bd 48ff742440                     push       qword ptr [rsp + 0x40]
012c2 488f442430                     pop        qword ptr [rsp + 0x30]
012c7 48894424f8                     mov        qword ptr [rsp - 8], rax
012cc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
012d0 89442438                       mov        dword ptr [rsp + 0x38], eax
012d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d9 48894424f8                     mov        qword ptr [rsp - 8], rax
012de 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012e2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
012e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012eb 48ff742450                     push       qword ptr [rsp + 0x50]
012f0 488f442440                     pop        qword ptr [rsp + 0x40]
012f5 48ff742458                     push       qword ptr [rsp + 0x58]
012fa 488f442448                     pop        qword ptr [rsp + 0x48]
012ff 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01307 488f442450                     pop        qword ptr [rsp + 0x50]
0130c 48894424f8                     mov        qword ptr [rsp - 8], rax
01311 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01318 89442458                       mov        dword ptr [rsp + 0x58], eax
0131c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01321 48894424f8                     mov        qword ptr [rsp - 8], rax
01326 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0132d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01331 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01336 48894424f8                     mov        qword ptr [rsp - 8], rax
0133b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01342 89442460                       mov        dword ptr [rsp + 0x60], eax
01346 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0134b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01353 488f442468                     pop        qword ptr [rsp + 0x68]
01358 48ffb42498000000               push       qword ptr [rsp + 0x98]
01360 488f442478                     pop        qword ptr [rsp + 0x78]
01365 48894424f8                     mov        qword ptr [rsp - 8], rax
0136a 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01371 89442464                       mov        dword ptr [rsp + 0x64], eax
01375 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137a 48894424f8                     mov        qword ptr [rsp - 8], rax
0137f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01386 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0138d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01392 48894424f8                     mov        qword ptr [rsp - 8], rax
01397 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0139e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
013a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013aa 48894424f8                     mov        qword ptr [rsp - 8], rax
013af 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
013b6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
013bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c2 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
013ca 488f842490000000               pop        qword ptr [rsp + 0x90]
013d2 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
013da 488f842498000000               pop        qword ptr [rsp + 0x98]
013e2 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
013ea 90                             nop        
013eb e8f0b8b5ff                     call       0x7f4c1b9d7d60
013f0 0f1f8400e8140009               nop        dword ptr [rax + rax + 0x90014e8]
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
01446 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0144b e890b8b5ff                     call       0x7f4c1b9d7d60
01450 0f1f84004815000a               nop        dword ptr [rax + rax + 0xa001548]
01458 be45ffffff                     mov        esi, 0xffffff45
0145d 48894424f8                     mov        qword ptr [rsp - 8], rax
01462 8b442408                       mov        eax, dword ptr [rsp + 8]
01466 890424                         mov        dword ptr [rsp], eax
01469 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146e 48894424f8                     mov        qword ptr [rsp - 8], rax
01473 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01477 89442404                       mov        dword ptr [rsp + 4], eax
0147b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01480 48ff742410                     push       qword ptr [rsp + 0x10]
01485 488f442408                     pop        qword ptr [rsp + 8]
0148a 48ff742418                     push       qword ptr [rsp + 0x18]
0148f 488f442410                     pop        qword ptr [rsp + 0x10]
01494 48894424f8                     mov        qword ptr [rsp - 8], rax
01499 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0149d 89442418                       mov        dword ptr [rsp + 0x18], eax
014a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a6 48894424f8                     mov        qword ptr [rsp - 8], rax
014ab 8b442424                       mov        eax, dword ptr [rsp + 0x24]
014af 8944241c                       mov        dword ptr [rsp + 0x1c], eax
014b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b8 48894424f8                     mov        qword ptr [rsp - 8], rax
014bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014c1 89442420                       mov        dword ptr [rsp + 0x20], eax
014c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ca 48894424f8                     mov        qword ptr [rsp - 8], rax
014cf 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
014d3 89442424                       mov        dword ptr [rsp + 0x24], eax
014d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014dc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
014e1 48ff742440                     push       qword ptr [rsp + 0x40]
014e6 488f442430                     pop        qword ptr [rsp + 0x30]
014eb 48894424f8                     mov        qword ptr [rsp - 8], rax
014f0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014f4 89442438                       mov        dword ptr [rsp + 0x38], eax
014f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01502 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01506 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0150a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150f 48ff742450                     push       qword ptr [rsp + 0x50]
01514 488f442440                     pop        qword ptr [rsp + 0x40]
01519 48ff742458                     push       qword ptr [rsp + 0x58]
0151e 488f442448                     pop        qword ptr [rsp + 0x48]
01523 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0152b 488f442450                     pop        qword ptr [rsp + 0x50]
01530 48894424f8                     mov        qword ptr [rsp - 8], rax
01535 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0153c 89442458                       mov        dword ptr [rsp + 0x58], eax
01540 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01545 48894424f8                     mov        qword ptr [rsp - 8], rax
0154a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01551 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01555 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155a 48894424f8                     mov        qword ptr [rsp - 8], rax
0155f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01566 89442460                       mov        dword ptr [rsp + 0x60], eax
0156a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01577 488f442468                     pop        qword ptr [rsp + 0x68]
0157c 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01584 488f442470                     pop        qword ptr [rsp + 0x70]
01589 48ffb42498000000               push       qword ptr [rsp + 0x98]
01591 488f442478                     pop        qword ptr [rsp + 0x78]
01596 48894424f8                     mov        qword ptr [rsp - 8], rax
0159b 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
015a2 89442464                       mov        dword ptr [rsp + 0x64], eax
015a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ab 48894424f8                     mov        qword ptr [rsp - 8], rax
015b0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
015b7 89842480000000                 mov        dword ptr [rsp + 0x80], eax
015be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c3 48894424f8                     mov        qword ptr [rsp - 8], rax
015c8 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
015cf 89842484000000                 mov        dword ptr [rsp + 0x84], eax
015d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015db 48894424f8                     mov        qword ptr [rsp - 8], rax
015e0 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
015e7 89842488000000                 mov        dword ptr [rsp + 0x88], eax
015ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f3 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
015fb 488f842490000000               pop        qword ptr [rsp + 0x90]
01603 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0160b 488f842498000000               pop        qword ptr [rsp + 0x98]
01613 e8c8b6b5ff                     call       0x7f4c1b9d7d60
01618 0f1f84001017000b               nop        dword ptr [rax + rax + 0xb001710]
01620 be45ffffff                     mov        esi, 0xffffff45
01625 48894424f8                     mov        qword ptr [rsp - 8], rax
0162a 8b442408                       mov        eax, dword ptr [rsp + 8]
0162e 890424                         mov        dword ptr [rsp], eax
01631 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01636 48894424f8                     mov        qword ptr [rsp - 8], rax
0163b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0163f 89442404                       mov        dword ptr [rsp + 4], eax
01643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01648 48ff742410                     push       qword ptr [rsp + 0x10]
0164d 488f442408                     pop        qword ptr [rsp + 8]
01652 48ff742418                     push       qword ptr [rsp + 0x18]
01657 488f442410                     pop        qword ptr [rsp + 0x10]
0165c 48894424f8                     mov        qword ptr [rsp - 8], rax
01661 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01665 89442418                       mov        dword ptr [rsp + 0x18], eax
01669 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166e 48894424f8                     mov        qword ptr [rsp - 8], rax
01673 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01677 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0167b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01680 48894424f8                     mov        qword ptr [rsp - 8], rax
01685 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01689 89442420                       mov        dword ptr [rsp + 0x20], eax
0168d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01692 48894424f8                     mov        qword ptr [rsp - 8], rax
01697 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0169b 89442424                       mov        dword ptr [rsp + 0x24], eax
0169f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
016a9 48ff742440                     push       qword ptr [rsp + 0x40]
016ae 488f442430                     pop        qword ptr [rsp + 0x30]
016b3 48894424f8                     mov        qword ptr [rsp - 8], rax
016b8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016bc 89442438                       mov        dword ptr [rsp + 0x38], eax
016c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c5 48894424f8                     mov        qword ptr [rsp - 8], rax
016ca 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
016ce 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d7 48ff742450                     push       qword ptr [rsp + 0x50]
016dc 488f442440                     pop        qword ptr [rsp + 0x40]
016e1 48ff742458                     push       qword ptr [rsp + 0x58]
016e6 488f442448                     pop        qword ptr [rsp + 0x48]
016eb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
016f3 488f442450                     pop        qword ptr [rsp + 0x50]
016f8 48894424f8                     mov        qword ptr [rsp - 8], rax
016fd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01704 89442458                       mov        dword ptr [rsp + 0x58], eax
01708 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170d 48894424f8                     mov        qword ptr [rsp - 8], rax
01712 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01719 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0171d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01722 48894424f8                     mov        qword ptr [rsp - 8], rax
01727 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0172e 89442460                       mov        dword ptr [rsp + 0x60], eax
01732 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01737 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0173f 488f442468                     pop        qword ptr [rsp + 0x68]
01744 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0174c 488f442470                     pop        qword ptr [rsp + 0x70]
01751 48ffb42498000000               push       qword ptr [rsp + 0x98]
01759 488f442478                     pop        qword ptr [rsp + 0x78]
0175e 48894424f8                     mov        qword ptr [rsp - 8], rax
01763 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0176a 89442464                       mov        dword ptr [rsp + 0x64], eax
0176e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01773 48894424f8                     mov        qword ptr [rsp - 8], rax
01778 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0177f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01786 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178b 48894424f8                     mov        qword ptr [rsp - 8], rax
01790 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01797 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0179e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a3 48894424f8                     mov        qword ptr [rsp - 8], rax
017a8 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
017af 89842488000000                 mov        dword ptr [rsp + 0x88], eax
017b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bb 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
017c3 488f842490000000               pop        qword ptr [rsp + 0x90]
017cb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
017d3 488f842498000000               pop        qword ptr [rsp + 0x98]
017db 48894424f8                     mov        qword ptr [rsp - 8], rax
017e0 8b8424f4000000                 mov        eax, dword ptr [rsp + 0xf4]
017e7 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
017ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f3 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
017fb 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01803 e8d8b4b5ff                     call       0x7f4c1b9d7d60
01808 0f1f84000019000c               nop        dword ptr [rax + rax + 0xc001900]
01810 be45ffffff                     mov        esi, 0xffffff45
01815 48894424f8                     mov        qword ptr [rsp - 8], rax
0181a 8b442408                       mov        eax, dword ptr [rsp + 8]
0181e 890424                         mov        dword ptr [rsp], eax
01821 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01826 48894424f8                     mov        qword ptr [rsp - 8], rax
0182b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0182f 89442404                       mov        dword ptr [rsp + 4], eax
01833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01838 48ff742410                     push       qword ptr [rsp + 0x10]
0183d 488f442408                     pop        qword ptr [rsp + 8]
01842 48ff742418                     push       qword ptr [rsp + 0x18]
01847 488f442410                     pop        qword ptr [rsp + 0x10]
0184c 48894424f8                     mov        qword ptr [rsp - 8], rax
01851 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01855 89442418                       mov        dword ptr [rsp + 0x18], eax
01859 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185e 48894424f8                     mov        qword ptr [rsp - 8], rax
01863 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01867 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0186b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01870 48894424f8                     mov        qword ptr [rsp - 8], rax
01875 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01879 89442420                       mov        dword ptr [rsp + 0x20], eax
0187d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01882 48894424f8                     mov        qword ptr [rsp - 8], rax
01887 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0188b 89442424                       mov        dword ptr [rsp + 0x24], eax
0188f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01894 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01899 48ff742440                     push       qword ptr [rsp + 0x40]
0189e 488f442430                     pop        qword ptr [rsp + 0x30]
018a3 48894424f8                     mov        qword ptr [rsp - 8], rax
018a8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018ac 89442438                       mov        dword ptr [rsp + 0x38], eax
018b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b5 48894424f8                     mov        qword ptr [rsp - 8], rax
018ba 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018be 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c7 48ff742450                     push       qword ptr [rsp + 0x50]
018cc 488f442440                     pop        qword ptr [rsp + 0x40]
018d1 48ff742458                     push       qword ptr [rsp + 0x58]
018d6 488f442448                     pop        qword ptr [rsp + 0x48]
018db 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
018e3 488f442450                     pop        qword ptr [rsp + 0x50]
018e8 48894424f8                     mov        qword ptr [rsp - 8], rax
018ed 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
018f4 89442458                       mov        dword ptr [rsp + 0x58], eax
018f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01902 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01909 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0190d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01912 48894424f8                     mov        qword ptr [rsp - 8], rax
01917 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0191e 89442460                       mov        dword ptr [rsp + 0x60], eax
01922 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01927 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0192f 488f442468                     pop        qword ptr [rsp + 0x68]
01934 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
0193c 488f442470                     pop        qword ptr [rsp + 0x70]
01941 48ffb42498000000               push       qword ptr [rsp + 0x98]
01949 488f442478                     pop        qword ptr [rsp + 0x78]
0194e 48894424f8                     mov        qword ptr [rsp - 8], rax
01953 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0195a 89442464                       mov        dword ptr [rsp + 0x64], eax
0195e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01963 48894424f8                     mov        qword ptr [rsp - 8], rax
01968 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0196f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197b 48894424f8                     mov        qword ptr [rsp - 8], rax
01980 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01987 89842484000000                 mov        dword ptr [rsp + 0x84], eax
0198e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01993 48894424f8                     mov        qword ptr [rsp - 8], rax
01998 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0199f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
019a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ab 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
019b3 488f842490000000               pop        qword ptr [rsp + 0x90]
019bb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
019c3 488f842498000000               pop        qword ptr [rsp + 0x98]
019cb 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
019d3 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
019da 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
019e2 90                             nop        
019e3 e8f8b2b5ff                     call       0x7f4c1b9d7d60
019e8 0f1f8400e01a000d               nop        dword ptr [rax + rax + 0xd001ae0]
019f0 be45ffffff                     mov        esi, 0xffffff45
019f5 48894424f8                     mov        qword ptr [rsp - 8], rax
019fa 8b442408                       mov        eax, dword ptr [rsp + 8]
019fe 890424                         mov        dword ptr [rsp], eax
01a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a06 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01a0f 89442404                       mov        dword ptr [rsp + 4], eax
01a13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a18 48ff742410                     push       qword ptr [rsp + 0x10]
01a1d 488f442408                     pop        qword ptr [rsp + 8]
01a22 48ff742418                     push       qword ptr [rsp + 0x18]
01a27 488f442410                     pop        qword ptr [rsp + 0x10]
01a2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a31 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01a35 89442418                       mov        dword ptr [rsp + 0x18], eax
01a39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a43 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01a47 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a50 48894424f8                     mov        qword ptr [rsp - 8], rax
01a55 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a59 89442420                       mov        dword ptr [rsp + 0x20], eax
01a5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a62 48894424f8                     mov        qword ptr [rsp - 8], rax
01a67 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01a6b 89442424                       mov        dword ptr [rsp + 0x24], eax
01a6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a74 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01a79 48ff742440                     push       qword ptr [rsp + 0x40]
01a7e 488f442430                     pop        qword ptr [rsp + 0x30]
01a83 48894424f8                     mov        qword ptr [rsp - 8], rax
01a88 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a8c 89442438                       mov        dword ptr [rsp + 0x38], eax
01a90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a95 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01a9e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa7 48ff742450                     push       qword ptr [rsp + 0x50]
01aac 488f442440                     pop        qword ptr [rsp + 0x40]
01ab1 48ff742458                     push       qword ptr [rsp + 0x58]
01ab6 488f442448                     pop        qword ptr [rsp + 0x48]
01abb 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01ac3 488f442450                     pop        qword ptr [rsp + 0x50]
01ac8 48894424f8                     mov        qword ptr [rsp - 8], rax
01acd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ad4 89442458                       mov        dword ptr [rsp + 0x58], eax
01ad8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01add 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae2 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01ae9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01aed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af2 48894424f8                     mov        qword ptr [rsp - 8], rax
01af7 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01afe 89442460                       mov        dword ptr [rsp + 0x60], eax
01b02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b07 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01b0f 488f442468                     pop        qword ptr [rsp + 0x68]
01b14 48ffb42498000000               push       qword ptr [rsp + 0x98]
01b1c 488f442478                     pop        qword ptr [rsp + 0x78]
01b21 48894424f8                     mov        qword ptr [rsp - 8], rax
01b26 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01b2d 89442464                       mov        dword ptr [rsp + 0x64], eax
01b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b36 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b42 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01b49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b53 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b5a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01b61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b66 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6b 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b72 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01b79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7e 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01b86 488f842490000000               pop        qword ptr [rsp + 0x90]
01b8e 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01b96 488f842498000000               pop        qword ptr [rsp + 0x98]
01b9e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ba6 89bc24b8000000                 mov        dword ptr [rsp + 0xb8], edi
01bad 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01bb4 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01bbc 666690                         nop        
01bbf e81cb1b5ff                     call       0x7f4c1b9d7d60
01bc4 0f1f8400bc1c000e               nop        dword ptr [rax + rax + 0xe001cbc]
01bcc be45ffffff                     mov        esi, 0xffffff45
01bd1 b9ffffff7f                     mov        ecx, 0x7fffffff
01bd6 4c3bc9                         cmp        r9, rcx
01bd9 bdffffffff                     mov        ebp, 0xffffffff
01bde 7c08                           jl         0x7f4c1be7cc68
01be0 400f95c5                       setne      bpl
01be4 400fb6ed                       movzx      ebp, bpl
01be8 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01bed 48ff742440                     push       qword ptr [rsp + 0x40]
01bf2 488f442438                     pop        qword ptr [rsp + 0x38]
01bf7 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c00 89442440                       mov        dword ptr [rsp + 0x40], eax
01c04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c09 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01c12 89442444                       mov        dword ptr [rsp + 0x44], eax
01c16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1b 48ff742450                     push       qword ptr [rsp + 0x50]
01c20 488f442448                     pop        qword ptr [rsp + 0x48]
01c25 48ff742458                     push       qword ptr [rsp + 0x58]
01c2a 488f442450                     pop        qword ptr [rsp + 0x50]
01c2f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01c37 488f442458                     pop        qword ptr [rsp + 0x58]
01c3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c41 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c48 89442460                       mov        dword ptr [rsp + 0x60], eax
01c4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c51 48894424f8                     mov        qword ptr [rsp - 8], rax
01c56 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01c5d 89442464                       mov        dword ptr [rsp + 0x64], eax
01c61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c66 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6b 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01c72 89442468                       mov        dword ptr [rsp + 0x68], eax
01c76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7b 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
01c83 48894424f8                     mov        qword ptr [rsp - 8], rax
01c88 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01c8f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c98 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ca4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01cab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb5 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01cbc 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccd 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01cd4 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01cdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce0 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01ce8 488f842498000000               pop        qword ptr [rsp + 0x98]
01cf0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01cf8 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01d00 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01d08 488f8424a8000000               pop        qword ptr [rsp + 0xa8]
01d10 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01d18 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01d20 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01d28 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01d30 666690                         nop        
01d33 e8a8afb5ff                     call       0x7f4c1b9d7d60
01d38 0f1f8400301e000f               nop        dword ptr [rax + rax + 0xf001e30]
01d40 be45ffffff                     mov        esi, 0xffffff45
01d45 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4a 8b442408                       mov        eax, dword ptr [rsp + 8]
01d4e 890424                         mov        dword ptr [rsp], eax
01d51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d56 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01d5f 89442404                       mov        dword ptr [rsp + 4], eax
01d63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d68 48ff742410                     push       qword ptr [rsp + 0x10]
01d6d 488f442408                     pop        qword ptr [rsp + 8]
01d72 48ff742418                     push       qword ptr [rsp + 0x18]
01d77 488f442410                     pop        qword ptr [rsp + 0x10]
01d7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d81 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01d85 89442418                       mov        dword ptr [rsp + 0x18], eax
01d89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d93 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01d97 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01da9 89442420                       mov        dword ptr [rsp + 0x20], eax
01dad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db2 48894424f8                     mov        qword ptr [rsp - 8], rax
01db7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01dbb 89442424                       mov        dword ptr [rsp + 0x24], eax
01dbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01dc9 48ff742440                     push       qword ptr [rsp + 0x40]
01dce 488f442430                     pop        qword ptr [rsp + 0x30]
01dd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01ddc 89442438                       mov        dword ptr [rsp + 0x38], eax
01de0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dea 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01dee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01df2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df7 48ff742450                     push       qword ptr [rsp + 0x50]
01dfc 488f442440                     pop        qword ptr [rsp + 0x40]
01e01 48ff742458                     push       qword ptr [rsp + 0x58]
01e06 488f442448                     pop        qword ptr [rsp + 0x48]
01e0b 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01e13 488f442450                     pop        qword ptr [rsp + 0x50]
01e18 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01e24 89442458                       mov        dword ptr [rsp + 0x58], eax
01e28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e32 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01e39 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e42 48894424f8                     mov        qword ptr [rsp - 8], rax
01e47 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01e4e 89442460                       mov        dword ptr [rsp + 0x60], eax
01e52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e57 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
01e5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e61 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01e68 89442464                       mov        dword ptr [rsp + 0x64], eax
01e6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e71 48894424f8                     mov        qword ptr [rsp - 8], rax
01e76 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e7d 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01e84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e89 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8e 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01e95 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01e9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea6 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01ead 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01eb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb9 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
01ec1 488f842490000000               pop        qword ptr [rsp + 0x90]
01ec9 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01ed1 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01ed9 6690                           nop        
01edb e800aeb5ff                     call       0x7f4c1b9d7d60
01ee0 0f1f8400d81f0010               nop        dword ptr [rax + rax + 0x10001fd8]
01ee8 be45ffffff                     mov        esi, 0xffffff45
01eed 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef2 8b442408                       mov        eax, dword ptr [rsp + 8]
01ef6 890424                         mov        dword ptr [rsp], eax
01ef9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01efe 48894424f8                     mov        qword ptr [rsp - 8], rax
01f03 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f07 89442404                       mov        dword ptr [rsp + 4], eax
01f0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f10 48ff742410                     push       qword ptr [rsp + 0x10]
01f15 488f442408                     pop        qword ptr [rsp + 8]
01f1a 48ff742418                     push       qword ptr [rsp + 0x18]
01f1f 488f442410                     pop        qword ptr [rsp + 0x10]
01f24 48894424f8                     mov        qword ptr [rsp - 8], rax
01f29 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01f2d 89442418                       mov        dword ptr [rsp + 0x18], eax
01f31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f36 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01f3f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f48 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f51 89442420                       mov        dword ptr [rsp + 0x20], eax
01f55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01f63 89442424                       mov        dword ptr [rsp + 0x24], eax
01f67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01f71 48ff742440                     push       qword ptr [rsp + 0x40]
01f76 488f442430                     pop        qword ptr [rsp + 0x30]
01f7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f80 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f84 89442438                       mov        dword ptr [rsp + 0x38], eax
01f88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01f96 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9f 48ff742450                     push       qword ptr [rsp + 0x50]
01fa4 488f442440                     pop        qword ptr [rsp + 0x40]
01fa9 48ff742458                     push       qword ptr [rsp + 0x58]
01fae 488f442448                     pop        qword ptr [rsp + 0x48]
01fb3 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
01fbb 488f442450                     pop        qword ptr [rsp + 0x50]
01fc0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01fcc 89442458                       mov        dword ptr [rsp + 0x58], eax
01fd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fda 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01fe1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fe5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fea 48894424f8                     mov        qword ptr [rsp - 8], rax
01fef 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01ff6 89442460                       mov        dword ptr [rsp + 0x60], eax
01ffa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fff 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
02004 48894424f8                     mov        qword ptr [rsp - 8], rax
02009 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02010 89442464                       mov        dword ptr [rsp + 0x64], eax
02014 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02019 48894424f8                     mov        qword ptr [rsp - 8], rax
0201e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02025 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0202c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02031 48894424f8                     mov        qword ptr [rsp - 8], rax
02036 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0203d 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02044 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02049 48894424f8                     mov        qword ptr [rsp - 8], rax
0204e 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02055 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0205c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02061 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02069 488f842490000000               pop        qword ptr [rsp + 0x90]
02071 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02079 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
02081 6690                           nop        
02083 e858acb5ff                     call       0x7f4c1b9d7d60
02088 0f1f840080210011               nop        dword ptr [rax + rax + 0x11002180]
02090 be3dffffff                     mov        esi, 0xffffff3d
02095 48894424f8                     mov        qword ptr [rsp - 8], rax
0209a 8b442408                       mov        eax, dword ptr [rsp + 8]
0209e 890424                         mov        dword ptr [rsp], eax
020a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a6 48894424f8                     mov        qword ptr [rsp - 8], rax
020ab 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
020af 89442404                       mov        dword ptr [rsp + 4], eax
020b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b8 48ff742410                     push       qword ptr [rsp + 0x10]
020bd 488f442408                     pop        qword ptr [rsp + 8]
020c2 48ff742418                     push       qword ptr [rsp + 0x18]
020c7 488f442410                     pop        qword ptr [rsp + 0x10]
020cc 48894424f8                     mov        qword ptr [rsp - 8], rax
020d1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
020d5 89442418                       mov        dword ptr [rsp + 0x18], eax
020d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020de 48894424f8                     mov        qword ptr [rsp - 8], rax
020e3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
020e7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
020eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f0 48894424f8                     mov        qword ptr [rsp - 8], rax
020f5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020f9 89442420                       mov        dword ptr [rsp + 0x20], eax
020fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02102 48894424f8                     mov        qword ptr [rsp - 8], rax
02107 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0210b 89442424                       mov        dword ptr [rsp + 0x24], eax
0210f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02114 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02119 48ff742440                     push       qword ptr [rsp + 0x40]
0211e 488f442430                     pop        qword ptr [rsp + 0x30]
02123 48894424f8                     mov        qword ptr [rsp - 8], rax
02128 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0212c 89442438                       mov        dword ptr [rsp + 0x38], eax
02130 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02135 48894424f8                     mov        qword ptr [rsp - 8], rax
0213a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0213e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02142 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02147 48ff742450                     push       qword ptr [rsp + 0x50]
0214c 488f442440                     pop        qword ptr [rsp + 0x40]
02151 48ff742458                     push       qword ptr [rsp + 0x58]
02156 488f442448                     pop        qword ptr [rsp + 0x48]
0215b 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
02163 488f442450                     pop        qword ptr [rsp + 0x50]
02168 48894424f8                     mov        qword ptr [rsp - 8], rax
0216d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02174 89442458                       mov        dword ptr [rsp + 0x58], eax
02178 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217d 48894424f8                     mov        qword ptr [rsp - 8], rax
02182 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02189 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0218d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02192 48894424f8                     mov        qword ptr [rsp - 8], rax
02197 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0219e 89442460                       mov        dword ptr [rsp + 0x60], eax
021a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a7 48897c2478                     mov        qword ptr [rsp + 0x78], rdi
021ac 48894424f8                     mov        qword ptr [rsp - 8], rax
021b1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
021b8 89442464                       mov        dword ptr [rsp + 0x64], eax
021bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c1 48894424f8                     mov        qword ptr [rsp - 8], rax
021c6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
021cd 89842480000000                 mov        dword ptr [rsp + 0x80], eax
021d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d9 48894424f8                     mov        qword ptr [rsp - 8], rax
021de 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
021e5 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f1 48894424f8                     mov        qword ptr [rsp - 8], rax
021f6 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
021fd 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02204 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02209 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02211 488f842490000000               pop        qword ptr [rsp + 0x90]
02219 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02221 488f842498000000               pop        qword ptr [rsp + 0x98]
02229 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
02231 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02239 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
02241 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02249 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
02251 48894424f8                     mov        qword ptr [rsp - 8], rax
02256 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
0225d 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
02264 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02269 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02271 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02279 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
02281 6690                           nop        
02283 e858aab5ff                     call       0x7f4c1b9d7d60
02288 0f1f840080230012               nop        dword ptr [rax + rax + 0x12002380]
02290 be45ffffff                     mov        esi, 0xffffff45
02295 48894424f8                     mov        qword ptr [rsp - 8], rax
0229a 8b442408                       mov        eax, dword ptr [rsp + 8]
0229e 890424                         mov        dword ptr [rsp], eax
022a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a6 48894424f8                     mov        qword ptr [rsp - 8], rax
022ab 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
022af 89442404                       mov        dword ptr [rsp + 4], eax
022b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b8 48ff742410                     push       qword ptr [rsp + 0x10]
022bd 488f442408                     pop        qword ptr [rsp + 8]
022c2 48ff742418                     push       qword ptr [rsp + 0x18]
022c7 488f442410                     pop        qword ptr [rsp + 0x10]
022cc 48894424f8                     mov        qword ptr [rsp - 8], rax
022d1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022d5 89442418                       mov        dword ptr [rsp + 0x18], eax
022d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022de 48894424f8                     mov        qword ptr [rsp - 8], rax
022e3 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022e7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f0 48894424f8                     mov        qword ptr [rsp - 8], rax
022f5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022f9 89442420                       mov        dword ptr [rsp + 0x20], eax
022fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02302 48894424f8                     mov        qword ptr [rsp - 8], rax
02307 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0230b 89442424                       mov        dword ptr [rsp + 0x24], eax
0230f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02314 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02319 48ff742440                     push       qword ptr [rsp + 0x40]
0231e 488f442430                     pop        qword ptr [rsp + 0x30]
02323 48894424f8                     mov        qword ptr [rsp - 8], rax
02328 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0232c 89442438                       mov        dword ptr [rsp + 0x38], eax
02330 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02335 48894424f8                     mov        qword ptr [rsp - 8], rax
0233a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0233e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02342 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02347 48ff742450                     push       qword ptr [rsp + 0x50]
0234c 488f442440                     pop        qword ptr [rsp + 0x40]
02351 48ff742458                     push       qword ptr [rsp + 0x58]
02356 488f442448                     pop        qword ptr [rsp + 0x48]
0235b 897c2458                       mov        dword ptr [rsp + 0x58], edi
0235f 48ffb42498000000               push       qword ptr [rsp + 0x98]
02367 488f442470                     pop        qword ptr [rsp + 0x70]
0236c 48894424f8                     mov        qword ptr [rsp - 8], rax
02371 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02378 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0237c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02381 48894424f8                     mov        qword ptr [rsp - 8], rax
02386 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0238d 89442478                       mov        dword ptr [rsp + 0x78], eax
02391 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02396 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0239e 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
023a6 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
023ae 90                             nop        
023af e82ca9b5ff                     call       0x7f4c1b9d7d60
023b4 0f1f8400ac240013               nop        dword ptr [rax + rax + 0x130024ac]
023bc be45ffffff                     mov        esi, 0xffffff45
023c1 48894424f8                     mov        qword ptr [rsp - 8], rax
023c6 8b442408                       mov        eax, dword ptr [rsp + 8]
023ca 890424                         mov        dword ptr [rsp], eax
023cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d2 48894424f8                     mov        qword ptr [rsp - 8], rax
023d7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
023db 89442404                       mov        dword ptr [rsp + 4], eax
023df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e4 48ff742410                     push       qword ptr [rsp + 0x10]
023e9 488f442408                     pop        qword ptr [rsp + 8]
023ee 48ff742418                     push       qword ptr [rsp + 0x18]
023f3 488f442410                     pop        qword ptr [rsp + 0x10]
023f8 48894424f8                     mov        qword ptr [rsp - 8], rax
023fd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02401 89442418                       mov        dword ptr [rsp + 0x18], eax
02405 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240a 48894424f8                     mov        qword ptr [rsp - 8], rax
0240f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02413 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02417 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241c 48894424f8                     mov        qword ptr [rsp - 8], rax
02421 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02425 89442420                       mov        dword ptr [rsp + 0x20], eax
02429 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242e 48894424f8                     mov        qword ptr [rsp - 8], rax
02433 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02437 89442424                       mov        dword ptr [rsp + 0x24], eax
0243b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02440 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02445 48ff742440                     push       qword ptr [rsp + 0x40]
0244a 488f442430                     pop        qword ptr [rsp + 0x30]
0244f 48894424f8                     mov        qword ptr [rsp - 8], rax
02454 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02458 89442438                       mov        dword ptr [rsp + 0x38], eax
0245c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02461 48894424f8                     mov        qword ptr [rsp - 8], rax
02466 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0246a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0246e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02473 48ff742450                     push       qword ptr [rsp + 0x50]
02478 488f442440                     pop        qword ptr [rsp + 0x40]
0247d 48ff742458                     push       qword ptr [rsp + 0x58]
02482 488f442448                     pop        qword ptr [rsp + 0x48]
02487 897c2458                       mov        dword ptr [rsp + 0x58], edi
0248b 48894424f8                     mov        qword ptr [rsp - 8], rax
02490 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02497 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0249b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a0 48894424f8                     mov        qword ptr [rsp - 8], rax
024a5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
024ac 89442478                       mov        dword ptr [rsp + 0x78], eax
024b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b5 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
024bd 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
024c5 6690                           nop        
024c7 e814a8b5ff                     call       0x7f4c1b9d7d60
024cc 0f1f8400c4250014               nop        dword ptr [rax + rax + 0x140025c4]
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
02558 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0255d 48ff742440                     push       qword ptr [rsp + 0x40]
02562 488f442430                     pop        qword ptr [rsp + 0x30]
02567 48894424f8                     mov        qword ptr [rsp - 8], rax
0256c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02570 89442438                       mov        dword ptr [rsp + 0x38], eax
02574 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02579 48894424f8                     mov        qword ptr [rsp - 8], rax
0257e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02582 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02586 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0258b 48ff742450                     push       qword ptr [rsp + 0x50]
02590 488f442440                     pop        qword ptr [rsp + 0x40]
02595 48ff742458                     push       qword ptr [rsp + 0x58]
0259a 488f442448                     pop        qword ptr [rsp + 0x48]
0259f 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
025a7 488f442450                     pop        qword ptr [rsp + 0x50]
025ac 48894424f8                     mov        qword ptr [rsp - 8], rax
025b1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
025b8 89442458                       mov        dword ptr [rsp + 0x58], eax
025bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c1 48894424f8                     mov        qword ptr [rsp - 8], rax
025c6 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
025cd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d6 48894424f8                     mov        qword ptr [rsp - 8], rax
025db 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
025e2 89442460                       mov        dword ptr [rsp + 0x60], eax
025e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025eb 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
025f3 488f442468                     pop        qword ptr [rsp + 0x68]
025f8 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02600 488f442470                     pop        qword ptr [rsp + 0x70]
02605 48ffb42498000000               push       qword ptr [rsp + 0x98]
0260d 488f442478                     pop        qword ptr [rsp + 0x78]
02612 48894424f8                     mov        qword ptr [rsp - 8], rax
02617 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0261e 89442464                       mov        dword ptr [rsp + 0x64], eax
02622 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02627 48894424f8                     mov        qword ptr [rsp - 8], rax
0262c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02633 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0263a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263f 48894424f8                     mov        qword ptr [rsp - 8], rax
02644 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0264b 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02652 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02657 48894424f8                     mov        qword ptr [rsp - 8], rax
0265c 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02663 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0266a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266f 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
02677 488f842490000000               pop        qword ptr [rsp + 0x90]
0267f 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
02687 488f842498000000               pop        qword ptr [rsp + 0x98]
0268f 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02697 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0269f e83ca6b5ff                     call       0x7f4c1b9d7d60
026a4 0f1f84009c270015               nop        dword ptr [rax + rax + 0x1500279c]
026ac be45ffffff                     mov        esi, 0xffffff45
026b1 48894424f8                     mov        qword ptr [rsp - 8], rax
026b6 8b442408                       mov        eax, dword ptr [rsp + 8]
026ba 890424                         mov        dword ptr [rsp], eax
026bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c2 48894424f8                     mov        qword ptr [rsp - 8], rax
026c7 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
026cb 89442404                       mov        dword ptr [rsp + 4], eax
026cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d4 48ff742410                     push       qword ptr [rsp + 0x10]
026d9 488f442408                     pop        qword ptr [rsp + 8]
026de 48ff742418                     push       qword ptr [rsp + 0x18]
026e3 488f442410                     pop        qword ptr [rsp + 0x10]
026e8 48894424f8                     mov        qword ptr [rsp - 8], rax
026ed 8b442420                       mov        eax, dword ptr [rsp + 0x20]
026f1 89442418                       mov        dword ptr [rsp + 0x18], eax
026f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fa 48894424f8                     mov        qword ptr [rsp - 8], rax
026ff 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02703 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270c 48894424f8                     mov        qword ptr [rsp - 8], rax
02711 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02715 89442420                       mov        dword ptr [rsp + 0x20], eax
02719 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271e 48894424f8                     mov        qword ptr [rsp - 8], rax
02723 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02727 89442424                       mov        dword ptr [rsp + 0x24], eax
0272b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02730 48ff742440                     push       qword ptr [rsp + 0x40]
02735 488f442430                     pop        qword ptr [rsp + 0x30]
0273a 48894424f8                     mov        qword ptr [rsp - 8], rax
0273f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02743 89442438                       mov        dword ptr [rsp + 0x38], eax
02747 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274c 48894424f8                     mov        qword ptr [rsp - 8], rax
02751 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02755 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02759 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275e 48ff742450                     push       qword ptr [rsp + 0x50]
02763 488f442440                     pop        qword ptr [rsp + 0x40]
02768 48ff742458                     push       qword ptr [rsp + 0x58]
0276d 488f442448                     pop        qword ptr [rsp + 0x48]
02772 48ffb424b0000000               push       qword ptr [rsp + 0xb0]
0277a 488f442450                     pop        qword ptr [rsp + 0x50]
0277f 48894424f8                     mov        qword ptr [rsp - 8], rax
02784 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0278b 89442458                       mov        dword ptr [rsp + 0x58], eax
0278f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02794 48894424f8                     mov        qword ptr [rsp - 8], rax
02799 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
027a0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ae 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
027b5 89442460                       mov        dword ptr [rsp + 0x60], eax
027b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027be 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
027c6 488f442468                     pop        qword ptr [rsp + 0x68]
027cb 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
027d3 488f442470                     pop        qword ptr [rsp + 0x70]
027d8 48ffb42498000000               push       qword ptr [rsp + 0x98]
027e0 488f442478                     pop        qword ptr [rsp + 0x78]
027e5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ea 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
027f1 89442464                       mov        dword ptr [rsp + 0x64], eax
027f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fa 48894424f8                     mov        qword ptr [rsp - 8], rax
027ff 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02806 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0280d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02812 48894424f8                     mov        qword ptr [rsp - 8], rax
02817 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0281e 89842484000000                 mov        dword ptr [rsp + 0x84], eax
02825 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282a 48894424f8                     mov        qword ptr [rsp - 8], rax
0282f 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02836 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0283d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02842 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
0284a 488f842490000000               pop        qword ptr [rsp + 0x90]
02852 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0285a 488f842498000000               pop        qword ptr [rsp + 0x98]
02862 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0286a 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
02872 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0287a 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02882 90                             nop        
02883 e858a4b5ff                     call       0x7f4c1b9d7d60
02888 0f1f840080290016               nop        dword ptr [rax + rax + 0x16002980]
02890 4533d2                         xor        r10d, r10d
02893 4c89942408010000               mov        qword ptr [rsp + 0x108], r10
0289b e922d9ffff                     jmp        0x7f4c1be7b242
028a0 4533d2                         xor        r10d, r10d
028a3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028a8 e93bd9ffff                     jmp        0x7f4c1be7b268
028ad 4533d2                         xor        r10d, r10d
028b0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028b5 e956d9ffff                     jmp        0x7f4c1be7b290
028ba 4533d2                         xor        r10d, r10d
028bd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028c2 e976d9ffff                     jmp        0x7f4c1be7b2bd
028c7 4533d2                         xor        r10d, r10d
028ca 4c89542458                     mov        qword ptr [rsp + 0x58], r10
028cf e991d9ffff                     jmp        0x7f4c1be7b2e5
028d4 4533d2                         xor        r10d, r10d
028d7 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
028df e9b1d9ffff                     jmp        0x7f4c1be7b315
028e4 4533d2                         xor        r10d, r10d
028e7 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
028ef e9cfd9ffff                     jmp        0x7f4c1be7b343
028f4 4533d2                         xor        r10d, r10d
028f7 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
028ff e9efd9ffff                     jmp        0x7f4c1be7b373
02904 bebeffffff                     mov        esi, 0xffffffbe
02909 48894424f8                     mov        qword ptr [rsp - 8], rax
0290e 8b442408                       mov        eax, dword ptr [rsp + 8]
02912 890424                         mov        dword ptr [rsp], eax
02915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291a 48894424f8                     mov        qword ptr [rsp - 8], rax
0291f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02923 89442404                       mov        dword ptr [rsp + 4], eax
02927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292c 48ff742410                     push       qword ptr [rsp + 0x10]
02931 488f442408                     pop        qword ptr [rsp + 8]
02936 48ff742418                     push       qword ptr [rsp + 0x18]
0293b 488f442410                     pop        qword ptr [rsp + 0x10]
02940 48894424f8                     mov        qword ptr [rsp - 8], rax
02945 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02949 89442418                       mov        dword ptr [rsp + 0x18], eax
0294d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02952 48894424f8                     mov        qword ptr [rsp - 8], rax
02957 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0295b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0295f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02964 48894424f8                     mov        qword ptr [rsp - 8], rax
02969 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0296d 89442420                       mov        dword ptr [rsp + 0x20], eax
02971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02976 48894424f8                     mov        qword ptr [rsp - 8], rax
0297b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
0297f 89442424                       mov        dword ptr [rsp + 0x24], eax
02983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02988 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0298d 48ff742440                     push       qword ptr [rsp + 0x40]
02992 488f442430                     pop        qword ptr [rsp + 0x30]
02997 48894424f8                     mov        qword ptr [rsp - 8], rax
0299c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
029a0 89442438                       mov        dword ptr [rsp + 0x38], eax
029a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a9 48894424f8                     mov        qword ptr [rsp - 8], rax
029ae 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
029b2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029bb 48ff742450                     push       qword ptr [rsp + 0x50]
029c0 488f442440                     pop        qword ptr [rsp + 0x40]
029c5 48ff742458                     push       qword ptr [rsp + 0x58]
029ca 488f442448                     pop        qword ptr [rsp + 0x48]
029cf 48894424f8                     mov        qword ptr [rsp - 8], rax
029d4 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
029db 89442458                       mov        dword ptr [rsp + 0x58], eax
029df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e4 48894424f8                     mov        qword ptr [rsp - 8], rax
029e9 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
029f0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f9 6690                           nop        
029fb e8e0a2b5ff                     call       0x7f4c1b9d7d60
02a00 0f1f8400f82a0017               nop        dword ptr [rax + rax + 0x17002af8]
02a08 be85ffffff                     mov        esi, 0xffffff85
02a0d 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02a11 48894424f8                     mov        qword ptr [rsp - 8], rax
02a16 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02a1a 890424                         mov        dword ptr [rsp], eax
02a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a22 48894424f8                     mov        qword ptr [rsp - 8], rax
02a27 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02a2b 89442404                       mov        dword ptr [rsp + 4], eax
02a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a34 48894424f8                     mov        qword ptr [rsp - 8], rax
02a39 8b442424                       mov        eax, dword ptr [rsp + 0x24]
02a3d 89442408                       mov        dword ptr [rsp + 8], eax
02a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a46 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a4f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a58 48894424f8                     mov        qword ptr [rsp - 8], rax
02a5d 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a61 89442410                       mov        dword ptr [rsp + 0x10], eax
02a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6a 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
02a6f 48ff742440                     push       qword ptr [rsp + 0x40]
02a74 488f442420                     pop        qword ptr [rsp + 0x20]
02a79 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02a82 89442414                       mov        dword ptr [rsp + 0x14], eax
02a86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a90 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02a94 89442428                       mov        dword ptr [rsp + 0x28], eax
02a98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa2 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02aa9 8944242c                       mov        dword ptr [rsp + 0x2c], eax
02aad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab7 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02abe 89442430                       mov        dword ptr [rsp + 0x30], eax
02ac2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac7 48894424f8                     mov        qword ptr [rsp - 8], rax
02acc 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02ad3 89442434                       mov        dword ptr [rsp + 0x34], eax
02ad7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02adc 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02ae8 89442448                       mov        dword ptr [rsp + 0x48], eax
02aec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af1 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
02af9 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
02b01 6690                           nop        
02b03 e8d8a1b5ff                     call       0x7f4c1b9d7d60
02b08 0f1f8400002c0018               nop        dword ptr [rax + rax + 0x18002c00]
02b10 bef6ffffff                     mov        esi, 0xfffffff6
02b15 6690                           nop        
02b17 e8c4a1b5ff                     call       0x7f4c1b9d7d60
02b1c 0f1f8400142c0019               nop        dword ptr [rax + rax + 0x19002c14]
02b24 be5d000000                     mov        esi, 0x5d
02b29 6690                           nop        
02b2b e8b0a1b5ff                     call       0x7f4c1b9d7d60
02b30 0f1f8400282c001a               nop        dword ptr [rax + rax + 0x1a002c28]
02b38 bef6ffffff                     mov        esi, 0xfffffff6
02b3d 418beb                         mov        ebp, r11d
02b40 666690                         nop        
02b43 e898a1b5ff                     call       0x7f4c1b9d7d60
02b48 0f1f8400402c001b               nop        dword ptr [rax + rax + 0x1b002c40]
02b50 bef6ffffff                     mov        esi, 0xfffffff6
02b55 8be9                           mov        ebp, ecx
02b57 e884a1b5ff                     call       0x7f4c1b9d7d60
02b5c 0f1f8400542c001c               nop        dword ptr [rax + rax + 0x1c002c54]
02b64 bef6ffffff                     mov        esi, 0xfffffff6
02b69 418beb                         mov        ebp, r11d
02b6c 666690                         nop        
02b6f e86ca1b5ff                     call       0x7f4c1b9d7d60
02b74 0f1f84006c2c001d               nop        dword ptr [rax + rax + 0x1d002c6c]
02b7c eb00                           jmp        0x7f4c1be7dbfe
02b7e 488bf0                         mov        rsi, rax
02b81 e912dfffff                     jmp        0x7f4c1be7bb18
02b86 49ba40bbe71b4c7f0000           movabs     r10, 0x7f4c1be7bb40
02b90 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02b97 e9c452a9ff                     jmp        0x7f4c1b912ee0
02b9c e87f1ea8ff                     call       0x7f4c1b8ffaa0
02ba1 e988d4ffff                     jmp        0x7f4c1be7b0ae
02ba6 f4                             hlt        
02ba7 f4                             hlt        
