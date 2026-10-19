00000 e83b59a315                     call       0x7f2229899340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85b4260000                   jne        0x7f2213e660e2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004d 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00095 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
000ac 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b8 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000bf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c4 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e8 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ec 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f1 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fa 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00101 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00106 488bfe                         mov        rdi, rsi
00109 c5f877                         vzeroupper 
0010c 49ba80fa9729227f0000           movabs     r10, 0x7f222997fa80
00116 41ffd2                         call       r10
00119 0f1f840000000000               nop        dword ptr [rax + rax]
00121 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00126 4d85d2                         test       r10, r10
00129 0f8491170000                   je         0x7f2213e652c0
0012f 458b12                         mov        r10d, dword ptr [r10]
00132 41c1ea0d                       shr        r10d, 0xd
00136 4181fa15040000                 cmp        r10d, 0x415
0013d 0f85fd1a0000                   jne        0x7f2213e65640
00143 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00148 4c891424                       mov        qword ptr [rsp], r10
0014c 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00154 4885ed                         test       rbp, rbp
00157 0f846f170000                   je         0x7f2213e652cc
0015d 448b5d00                       mov        r11d, dword ptr [rbp]
00161 41c1eb0d                       shr        r11d, 0xd
00165 4181fb05010000                 cmp        r11d, 0x105
0016c 0f85ce1a0000                   jne        0x7f2213e65640
00172 4c8bd5                         mov        r10, rbp
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
00182 4885ed                         test       rbp, rbp
00185 0f844e170000                   je         0x7f2213e652d9
0018b 448b5500                       mov        r10d, dword ptr [rbp]
0018f 41c1ea0d                       shr        r10d, 0xd
00193 4181fa08010000                 cmp        r10d, 0x108
0019a 0f85a01a0000                   jne        0x7f2213e65640
001a0 4c8bd5                         mov        r10, rbp
001a3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001b0 4885ed                         test       rbp, rbp
001b3 0f842d170000                   je         0x7f2213e652e6
001b9 448b5d00                       mov        r11d, dword ptr [rbp]
001bd 41c1eb0d                       shr        r11d, 0xd
001c1 4181fb07010000                 cmp        r11d, 0x107
001c8 0f85721a0000                   jne        0x7f2213e65640
001ce 4c8bd5                         mov        r10, rbp
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001de 4885ed                         test       rbp, rbp
001e1 0f840c170000                   je         0x7f2213e652f3
001e7 448b5d00                       mov        r11d, dword ptr [rbp]
001eb 41c1eb0d                       shr        r11d, 0xd
001ef 4181fb07010000                 cmp        r11d, 0x107
001f6 0f85441a0000                   jne        0x7f2213e65640
001fc 4c8bd5                         mov        r10, rbp
001ff 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00204 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
0020c 4885ed                         test       rbp, rbp
0020f 0f84eb160000                   je         0x7f2213e65300
00215 448b5d00                       mov        r11d, dword ptr [rbp]
00219 41c1eb0d                       shr        r11d, 0xd
0021d 4181fb05010000                 cmp        r11d, 0x105
00224 0f85161a0000                   jne        0x7f2213e65640
0022a 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00234 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00238 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0023d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00242 4585d2                         test       r10d, r10d
00245 0f8441190000                   je         0x7f2213e6558c
0024b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00250 458b5204                       mov        r10d, dword ptr [r10 + 4]
00254 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00259 4585d2                         test       r10d, r10d
0025c 0f862a190000                   jbe        0x7f2213e6558c
00262 4183fa01                       cmp        r10d, 1
00266 0f8620190000                   jbe        0x7f2213e6558c
0026c 4183fa02                       cmp        r10d, 2
00270 0f8616190000                   jbe        0x7f2213e6558c
00276 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0027b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027f 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00284 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00289 458b5204                       mov        r10d, dword ptr [r10 + 4]
0028d 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00295 458d53f1                       lea        r10d, [r11 - 0xf]
00299 4585d2                         test       r10d, r10d
0029c 0f8cea180000                   jl         0x7f2213e6558c
002a2 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002aa 4183c3f1                       add        r11d, -0xf
002ae 4585db                         test       r11d, r11d
002b1 0f8cd5180000                   jl         0x7f2213e6558c
002b7 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002bf 4183c2f9                       add        r10d, -7
002c3 4585d2                         test       r10d, r10d
002c6 0f8cc0180000                   jl         0x7f2213e6558c
002cc 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002d4 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002dc 4d63d2                         movsxd     r10, r10d
002df 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
002e7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
002ef 4183c3f1                       add        r11d, -0xf
002f3 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002fb 4983c2f1                       add        r10, -0xf
002ff 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00307 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0030c 458d42f1                       lea        r8d, [r10 - 0xf]
00310 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00318 4d63d2                         movsxd     r10, r10d
0031b 4983c2f1                       add        r10, -0xf
0031f 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00327 e9db010000                     jmp        0x7f2213e63f07
0032c 4533db                         xor        r11d, r11d
0032f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00334 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00339 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0033d 83f803                         cmp        eax, 3
00340 0f8ebb030000                   jle        0x7f2213e64101
00346 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0034b 45895310                       mov        dword ptr [r11 + 0x10], r10d
0034f 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00353 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00358 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0035c 448d50fd                       lea        r10d, [rax - 3]
00360 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00368 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0036d 45895308                       mov        dword ptr [r11 + 8], r10d
00371 4c639c24a4000000               movsxd     r11, dword ptr [rsp + 0xa4]
00379 4c63d3                         movsxd     r10, ebx
0037c 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00381 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
00386 4d03d0                         add        r10, r8
00389 4d3bda                         cmp        r11, r10
0038c 0f8f1a130000                   jg         0x7f2213e650ac
00392 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0039a 4585db                         test       r11d, r11d
0039d 0f8ef9110000                   jle        0x7f2213e64f9c
003a3 448beb                         mov        r13d, ebx
003a6 44036c246c                     add        r13d, dword ptr [rsp + 0x6c]
003ab 48636c2478                     movsxd     rbp, dword ptr [rsp + 0x78]
003b0 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
003b5 4503d5                         add        r10d, r13d
003b8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003bd 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
003c2 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
003ca 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
003cf 0f8f2c0c0000                   jg         0x7f2213e64a01
003d5 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003da 0f8f24130000                   jg         0x7f2213e65104
003e0 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003e5 4183fa10                       cmp        r10d, 0x10
003e9 0f8fc9010000                   jg         0x7f2213e63fb8
003ef 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003f4 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
003fc 0f83d6100000                   jae        0x7f2213e64ed8
00402 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00407 458bca                         mov        r9d, r10d
0040a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0040f c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00416 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
0041d 0f83f9100000                   jae        0x7f2213e64f1c
00423 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00428 4503da                         add        r11d, r10d
0042b 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00433 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00438 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0043f 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00444 4403d3                         add        r10d, ebx
00447 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0044f 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00457 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
0045f 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00467 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0046c 4183fb10                       cmp        r11d, 0x10
00470 0f8f72130000                   jg         0x7f2213e651e8
00476 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0047e 4183fa10                       cmp        r10d, 0x10
00482 0f8c54030000                   jl         0x7f2213e641dc
00488 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00490 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00498 0f836e0f0000                   jae        0x7f2213e64e0c
0049e 458bd3                         mov        r10d, r11d
004a1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004a6 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
004ad 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
004b5 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
004bd 0f839d0f0000                   jae        0x7f2213e64e60
004c3 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
004cb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004d0 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
004d7 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
004db 4103db                         add        ebx, r11d
004de 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004e2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004e7 41ffc3                         inc        r11d
004ea 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004ef 418502                         test       dword ptr [r10], eax
004f2 48894424f8                     mov        qword ptr [rsp - 8], rax
004f7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
004fe 89442438                       mov        dword ptr [rsp + 0x38], eax
00502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00507 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0050c 498d741a08                     lea        rsi, [r10 + rbx + 8]
00511 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00516 442b442438                     sub        r8d, dword ptr [rsp + 0x38]
0051b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00520 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00525 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
0052a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0052f 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00534 0f8d110a0000                   jge        0x7f2213e6494b
0053a 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
0053f 0f838b0e0000                   jae        0x7f2213e64dd0
00545 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0054a 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
0054f 4d8bda                         mov        r11, r10
00552 49c1eb12                       shr        r11, 0x12
00556 458bdb                         mov        r11d, r11d
00559 4181e3ffff0300                 and        r11d, 0x3ffff
00560 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00565 4d8bca                         mov        r9, r10
00568 49c1f924                       sar        r9, 0x24
0056c 458bda                         mov        r11d, r10d
0056f 458bd1                         mov        r10d, r9d
00572 418bc2                         mov        eax, r10d
00575 4181e3ffff0100                 and        r11d, 0x1ffff
0057c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00581 4585d2                         test       r10d, r10d
00584 0f8c32100000                   jl         0x7f2213e64fbc
0058a 4585db                         test       r11d, r11d
0058d 0f8499fdffff                   je         0x7f2213e63d2c
00593 453bd8                         cmp        r11d, r8d
00596 0f8e98fdffff                   jle        0x7f2213e63d34
0059c be45ffffff                     mov        esi, 0xffffff45
005a1 418beb                         mov        ebp, r11d
005a4 44890424                       mov        dword ptr [rsp], r8d
005a8 c5f877                         vzeroupper 
005ab e8b0f6b5ff                     call       0x7f22139c3660
005b0 0f1f8400a8060001               nop        dword ptr [rax + rax + 0x10006a8]
005b8 4183fa30                       cmp        r10d, 0x30
005bc 0f8fe6070000                   jg         0x7f2213e647a8
005c2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005c7 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
005cf 0f8338130000                   jae        0x7f2213e6530d
005d5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005da 418bfb                         mov        edi, r11d
005dd 4d63cb                         movsxd     r9, r11d
005e0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
005e5 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
005ec 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
005f3 0f83a7130000                   jae        0x7f2213e653a0
005f9 448d5b10                       lea        r11d, [rbx + 0x10]
005fd 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00605 4c63d3                         movsxd     r10, ebx
00608 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0060d c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00614 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0061c 453bc5                         cmp        r8d, r13d
0061f 0f8dbf000000                   jge        0x7f2213e640e4
00625 4d2bca                         sub        r9, r10
00628 4d63d8                         movsxd     r11, r8d
0062b 4f8d140b                       lea        r10, [r11 + r9]
0062f 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00637 0f8327140000                   jae        0x7f2213e65464
0063d 4d63d5                         movsxd     r10, r13d
00640 4d2bd3                         sub        r10, r11
00643 4983c20f                       add        r10, 0xf
00647 4983e2f0                       and        r10, 0xfffffffffffffff0
0064b 458bd2                         mov        r10d, r10d
0064e 458d541a10                     lea        r10d, [r10 + rbx + 0x10]
00653 4d63d2                         movsxd     r10, r10d
00656 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
0065b 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00663 0f83fb130000                   jae        0x7f2213e65464
00669 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00671 0f83ed130000                   jae        0x7f2213e65464
00677 4983c2f0                       add        r10, -0x10
0067b 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00683 0f83db130000                   jae        0x7f2213e65464
00689 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00690 0f8f62140000                   jg         0x7f2213e654f8
00696 448bd7                         mov        r10d, edi
00699 442bd3                         sub        r10d, ebx
0069c 0f1f4000                       nop        dword ptr [rax]
006a0 458bc2                         mov        r8d, r10d
006a3 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
006ab 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006b0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
006b7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006bf 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
006c4 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
006cb 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006d3 4183c310                       add        r11d, 0x10
006d7 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
006df 453bdd                         cmp        r11d, r13d
006e2 7cbc                           jl         0x7f2213e640a0
006e4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
006e9 4403df                         add        r11d, edi
006ec 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
006f4 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
006fc e94efdffff                     jmp        0x7f2213e63e4f
00701 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00706 4585db                         test       r11d, r11d
00709 7407                           je         0x7f2213e64112
0070b 448d58ff                       lea        r11d, [rax - 1]
0070f 418bc3                         mov        eax, r11d
00712 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00717 458b4308                       mov        r8d, dword ptr [r11 + 8]
0071b 85c0                           test       eax, eax
0071d 7478                           je         0x7f2213e64197
0071f 83f803                         cmp        eax, 3
00722 0f84190b0000                   je         0x7f2213e64c41
00728 83f802                         cmp        eax, 2
0072b 7777                           ja         0x7f2213e641a4
0072d 3b44244c                       cmp        eax, dword ptr [rsp + 0x4c]
00731 0f8331150000                   jae        0x7f2213e65668
00737 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0073c 458b448308                     mov        r8d, dword ptr [r11 + rax*4 + 8]
00741 85c0                           test       eax, eax
00743 7e49                           jle        0x7f2213e6418e
00745 448d58ff                       lea        r11d, [rax - 1]
00749 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0074e 0f83b8170000                   jae        0x7f2213e6590c
00754 33c9                           xor        ecx, ecx
00756 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0075b 458bda                         mov        r11d, r10d
0075e 4183c3cc                       add        r11d, -0x34
00762 41c1eb02                       shr        r11d, 2
00766 458d5403ff                     lea        r10d, [r11 + rax - 1]
0076b 4c63d8                         movsxd     r11, eax
0076e 41b904000000                   mov        r9d, 4
00774 c442b0f5d2                     bzhi       r10, r10, r9
00779 4d2bda                         sub        r11, r10
0077c 49ffcb                         dec        r11
0077f 4d85db                         test       r11, r11
00782 4c0f4cd9                       cmovl      r11, rcx
00786 458bd3                         mov        r10d, r11d
00789 e991060000                     jmp        0x7f2213e6481f
0078e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00793 45894208                       mov        dword ptr [r10 + 8], r8d
00797 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
0079f e9cdfbffff                     jmp        0x7f2213e63d71
007a4 48bee82374e200000000           movabs     rsi, 0xe27423e8
007ae 8beb                           mov        ebp, ebx
007b0 c5f877                         vzeroupper 
007b3 e8a876a9ff                     call       0x7f22138fb860
007b8 0f1f8400b0080002               nop        dword ptr [rax + rax + 0x20008b0]
007c0 4885c0                         test       rax, rax
007c3 0f84a3150000                   je         0x7f2213e6576c
007c9 488bf0                         mov        rsi, rax
007cc c5f877                         vzeroupper 
007cf 4881c4f0000000                 add        rsp, 0xf0
007d6 5d                             pop        rbp
007d7 e9841ab6ff                     jmp        0x7f22139c5c60
007dc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
007e4 4503d3                         add        r10d, r11d
007e7 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
007ef 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
007f7 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
007fc 0f8dca020000                   jge        0x7f2213e644cc
00802 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0080a 4183c208                       add        r10d, 8
0080e 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00813 4183fb08                       cmp        r11d, 8
00817 0f8dab010000                   jge        0x7f2213e643c8
0081d 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00825 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0082d 0f83f1190000                   jae        0x7f2213e65c24
00833 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00838 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
0083e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00846 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0084e 0f838c1a0000                   jae        0x7f2213e65ce0
00854 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00859 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
0085e 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00866 4183c303                       add        r11d, 3
0086a 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00872 41ffc0                         inc        r8d
00875 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
0087d 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00885 0f83b51a0000                   jae        0x7f2213e65d40
0088b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00893 4183c303                       add        r11d, 3
00897 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
0089f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008a4 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
008aa 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
008b2 0f83001b0000                   jae        0x7f2213e65db8
008b8 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008c0 43886c1809                     mov        byte ptr [r8 + r11 + 9], bpl
008c5 470fbe44100a                   movsx      r8d, byte ptr [r8 + r10 + 0xa]
008cb 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008d0 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
008d5 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
008db 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
008e0 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
008e8 4183fa08                       cmp        r10d, 8
008ec 0f83261b0000                   jae        0x7f2213e65e18
008f2 49ba285d72e200000000           movabs     r10, 0xe2725d28
008fc 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00904 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0090c 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00911 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00916 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0091b 4183fb04                       cmp        r11d, 4
0091f 7e3f                           jle        0x7f2213e64360
00921 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00928 83c504                         add        ebp, 4
0092b 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00930 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00934 c5f877                         vzeroupper 
00937 e82475a9ff                     call       0x7f22138fb860
0093c 0f1f8400340a0003               nop        dword ptr [rax + rax + 0x3000a34]
00944 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00949 8bd5                           mov        edx, ebp
0094b 8bc8                           mov        ecx, eax
0094d 666690                         nop        
00950 c5f877                         vzeroupper 
00953 e80875a9ff                     call       0x7f22138fb860
00958 0f1f8400500a0004               nop        dword ptr [rax + rax + 0x4000a50]
00960 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00965 4183fb08                       cmp        r11d, 8
00969 7e51                           jle        0x7f2213e643bc
0096b 49ba505d72e200000000           movabs     r10, 0xe2725d50
00975 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00979 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00981 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00986 83c208                         add        edx, 8
00989 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0098e 6690                           nop        
00990 c5f877                         vzeroupper 
00993 e8c874a9ff                     call       0x7f22138fb860
00998 0f1f8400900a0005               nop        dword ptr [rax + rax + 0x5000a90]
009a0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009a5 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
009a9 488bc8                         mov        rcx, rax
009ac c5f877                         vzeroupper 
009af e8ac74a9ff                     call       0x7f22138fb860
009b4 0f1f8400ac0a0006               nop        dword ptr [rax + rax + 0x6000aac]
009bc 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
009c3 e916fbffff                     jmp        0x7f2213e63ede
009c8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009cd 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
009d4 c5f877                         vzeroupper 
009d7 e88474a9ff                     call       0x7f22138fb860
009dc 0f1f8400d40a0007               nop        dword ptr [rax + rax + 0x7000ad4]
009e4 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009e9 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
009f0 488bc8                         mov        rcx, rax
009f3 90                             nop        
009f4 c5f877                         vzeroupper 
009f7 e86474a9ff                     call       0x7f22138fb860
009fc 0f1f8400f40a0008               nop        dword ptr [rax + rax + 0x8000af4]
00a04 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00a0c 4183c308                       add        r11d, 8
00a10 458bcb                         mov        r9d, r11d
00a13 be95ffffff                     mov        esi, 0xffffff95
00a18 488b2c24                       mov        rbp, qword ptr [rsp]
00a1c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00a21 4c891424                       mov        qword ptr [rsp], r10
00a25 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a2a 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a2f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a34 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a39 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a3e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a43 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a48 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a4d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a52 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a57 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00a5c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a61 48ff742440                     push       qword ptr [rsp + 0x40]
00a66 488f442438                     pop        qword ptr [rsp + 0x38]
00a6b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a70 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00a75 48ff742450                     push       qword ptr [rsp + 0x50]
00a7a 488f442448                     pop        qword ptr [rsp + 0x48]
00a7f 48ff742458                     push       qword ptr [rsp + 0x58]
00a84 488f442450                     pop        qword ptr [rsp + 0x50]
00a89 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00a8e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00a93 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a98 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00a9d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00aa2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00aa7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00aaf 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00ab4 458bd3                         mov        r10d, r11d
00ab7 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00abc c5f877                         vzeroupper 
00abf e89cf1b5ff                     call       0x7f22139c3660
00ac4 0f1f8400bc0b0009               nop        dword ptr [rax + rax + 0x9000bbc]
00acc 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00ad1 4183fa30                       cmp        r10d, 0x30
00ad5 0f8f12020000                   jg         0x7f2213e646ed
00adb 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00ae2 83c5f9                         add        ebp, -7
00ae5 89ac24a4000000                 mov        dword ptr [rsp + 0xa4], ebp
00aec 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00af4 443bdd                         cmp        r11d, ebp
00af7 0f83cb120000                   jae        0x7f2213e657c8
00afd 418beb                         mov        ebp, r11d
00b00 89ac24b4000000                 mov        dword ptr [rsp + 0xb4], ebp
00b07 4863ed                         movsxd     rbp, ebp
00b0a 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00b12 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b17 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00b1c 4889ac24c8000000               mov        qword ptr [rsp + 0xc8], rbp
00b24 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b2c 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00b34 0f8316130000                   jae        0x7f2213e65850
00b3a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b42 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00b4a 4963ea                         movsxd     rbp, r10d
00b4d 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
00b55 488d4d08                       lea        rcx, [rbp + 8]
00b59 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00b63 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00b68 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00b70 4533c9                         xor        r9d, r9d
00b73 90                             nop        
00b74 c5f877                         vzeroupper 
00b77 e8e468a9ff                     call       0x7f22138fae60
00b7c 0f1f8400740c000a               nop        dword ptr [rax + rax + 0xa000c74]
00b84 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b8c 4183c308                       add        r11d, 8
00b90 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00b98 458bcb                         mov        r9d, r11d
00b9b 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00ba3 0f8d34010000                   jge        0x7f2213e646dd
00ba9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00bb1 482bac24d0000000               sub        rbp, qword ptr [rsp + 0xd0]
00bb9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00bc1 4983c2f9                       add        r10, -7
00bc5 4d63c3                         movsxd     r8, r11d
00bc8 4d8d1c28                       lea        r11, [r8 + rbp]
00bcc 4d3bda                         cmp        r11, r10
00bcf 0f8347140000                   jae        0x7f2213e65a1c
00bd5 4c639c24b8000000               movsxd     r11, dword ptr [rsp + 0xb8]
00bdd 4d2bd8                         sub        r11, r8
00be0 4983c307                       add        r11, 7
00be4 4983e3f8                       and        r11, 0xfffffffffffffff8
00be8 458bdb                         mov        r11d, r11d
00beb 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00bf3 478d5c0308                     lea        r11d, [r11 + r8 + 8]
00bf8 4d63db                         movsxd     r11, r11d
00bfb 4d8d442bf8                     lea        r8, [r11 + rbp - 8]
00c00 4d3bc2                         cmp        r8, r10
00c03 0f8313140000                   jae        0x7f2213e65a1c
00c09 443b8c24a4000000               cmp        r9d, dword ptr [rsp + 0xa4]
00c11 0f8305140000                   jae        0x7f2213e65a1c
00c17 4983c3f8                       add        r11, -8
00c1b 4d3bda                         cmp        r11, r10
00c1e 0f83f8130000                   jae        0x7f2213e65a1c
00c24 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c2c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c33 0f8fab140000                   jg         0x7f2213e65ae4
00c39 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00c40 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
00c47 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00c4b 0f1f440000                     nop        dword ptr [rax + rax]
00c50 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c58 4963cb                         movsxd     rcx, r11d
00c5b 4883c108                       add        rcx, 8
00c5f 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00c63 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00c6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00c6f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00c74 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00c7e 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00c83 4533c9                         xor        r9d, r9d
00c86 6690                           nop        
00c88 c5f877                         vzeroupper 
00c8b e8d067a9ff                     call       0x7f22138fae60
00c90 0f1f8400880d000b               nop        dword ptr [rax + rax + 0xb000d88]
00c98 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00ca0 4183c308                       add        r11d, 8
00ca4 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00cac 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00cb4 7c9a                           jl         0x7f2213e64650
00cb6 eb25                           jmp        0x7f2213e646dd
00cb8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00cbd 4d63d2                         movsxd     r10, r10d
00cc0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cc7 c442a8f5db                     bzhi       r11, r11, r10
00ccc c4c1fb92fb                     kmovq      k7, r11
00cd1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cd7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cdd 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00ce4 035c2478                       add        ebx, dword ptr [rsp + 0x78]
00ce8 e9f1f7ffff                     jmp        0x7f2213e63ede
00ced 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00cf5 4585d2                         test       r10d, r10d
00cf8 0f8cba110000                   jl         0x7f2213e658b8
00cfe 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00d06 4585c0                         test       r8d, r8d
00d09 0f8ca9110000                   jl         0x7f2213e658b8
00d0f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d14 4503da                         add        r11d, r10d
00d17 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00d1f 453bc3                         cmp        r8d, r11d
00d22 0f8290110000                   jb         0x7f2213e658b8
00d28 443b8424b8000000               cmp        r8d, dword ptr [rsp + 0xb8]
00d30 0f8282110000                   jb         0x7f2213e658b8
00d36 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d3b 4585db                         test       r11d, r11d
00d3e 749d                           je         0x7f2213e646dd
00d40 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d45 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00d4d 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00d52 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00d57 4883fd20                       cmp        rbp, 0x20
00d5b 0f8657ffffff                   jbe        0x7f2213e646b8
00d61 488bd5                         mov        rdx, rbp
00d64 c5f877                         vzeroupper 
00d67 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
00d71 41ffd2                         call       r10
00d74 0f1f840000000000               nop        dword ptr [rax + rax]
00d7c e95cffffff                     jmp        0x7f2213e646dd
00d81 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d86 4d63d3                         movsxd     r10, r11d
00d89 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d90 c442a8f5db                     bzhi       r11, r11, r10
00d95 c4c1fb92fb                     kmovq      k7, r11
00d9a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00da0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00da6 eb65                           jmp        0x7f2213e6480d
00da8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00dad 4585db                         test       r11d, r11d
00db0 0f8cce0f0000                   jl         0x7f2213e65784
00db6 85db                           test       ebx, ebx
00db8 0f8cc60f0000                   jl         0x7f2213e65784
00dbe 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00dc3 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00dcb 0f82b30f0000                   jb         0x7f2213e65784
00dd1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00dd9 453bdd                         cmp        r11d, r13d
00ddc 0f82a20f0000                   jb         0x7f2213e65784
00de2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00de7 4585d2                         test       r10d, r10d
00dea 7421                           je         0x7f2213e6480d
00dec 4983f820                       cmp        r8, 0x20
00df0 768f                           jbe        0x7f2213e64781
00df2 498bd0                         mov        rdx, r8
00df5 c5f877                         vzeroupper 
00df8 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
00e02 41ffd2                         call       r10
00e05 0f1f840000000000               nop        dword ptr [rax + rax]
00e0d 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00e15 e935f6ffff                     jmp        0x7f2213e63e4f
00e1a 6690                           nop        
00e1c 418bc3                         mov        eax, r11d
00e1f 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00e24 458b4c8104                     mov        r9d, dword ptr [r9 + rax*4 + 4]
00e29 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00e2e 44894c8108                     mov        dword ptr [rcx + rax*4 + 8], r9d
00e33 448d58ff                       lea        r11d, [rax - 1]
00e37 453bda                         cmp        r11d, r10d
00e3a 7fe0                           jg         0x7f2213e6481c
00e3c 4183fb3f                       cmp        r11d, 0x3f
00e40 0f8ece110000                   jle        0x7f2213e65a14
00e46 448bd0                         mov        r10d, eax
00e49 41ffca                         dec        r10d
00e4c 418bca                         mov        ecx, r10d
00e4f eb12                           jmp        0x7f2213e64863
00e51 0f1f840000000000               nop        dword ptr [rax + rax]
00e59 0f1f8000000000                 nop        dword ptr [rax]
00e60 418bca                         mov        ecx, r10d
00e63 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00e68 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00e73 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00e7e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00e89 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00e94 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00e9f 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00eaa 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00eb5 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00ec0 448d51c0                       lea        r10d, [rcx - 0x40]
00ec4 4183fa3f                       cmp        r10d, 0x3f
00ec8 7f96                           jg         0x7f2213e64860
00eca 4183fa0f                       cmp        r10d, 0xf
00ece 7e2d                           jle        0x7f2213e648fd
00ed0 448bd1                         mov        r10d, ecx
00ed3 4183c2c0                       add        r10d, -0x40
00ed7 90                             nop        
00ed8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00edd 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00ee8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00ef3 4183c2f0                       add        r10d, -0x10
00ef7 4183fa0f                       cmp        r10d, 0xf
00efb 7fdb                           jg         0x7f2213e648d8
00efd 4585d2                         test       r10d, r10d
00f00 0f8e88f8ffff                   jle        0x7f2213e6418e
00f06 6690                           nop        
00f08 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00f0d 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00f12 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00f17 47895c9108                     mov        dword ptr [r9 + r10*4 + 8], r11d
00f1c 41ffca                         dec        r10d
00f1f 4585d2                         test       r10d, r10d
00f22 7fe4                           jg         0x7f2213e64908
00f24 e965f8ffff                     jmp        0x7f2213e6418e
00f29 4d63d0                         movsxd     r10, r8d
00f2c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f33 c442a8f5db                     bzhi       r11, r11, r10
00f38 c4c1fb92fb                     kmovq      k7, r11
00f3d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f43 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f49 eb71                           jmp        0x7f2213e649bc
00f4b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f50 4585d2                         test       r10d, r10d
00f53 0f8c5b150000                   jl         0x7f2213e65eb4
00f59 85db                           test       ebx, ebx
00f5b 0f8c53150000                   jl         0x7f2213e65eb4
00f61 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f66 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00f6b 0f8243150000                   jb         0x7f2213e65eb4
00f71 428d2c03                       lea        ebp, [rbx + r8]
00f75 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00f7d 443bd5                         cmp        r10d, ebp
00f80 0f822e150000                   jb         0x7f2213e65eb4
00f86 4585c0                         test       r8d, r8d
00f89 0f8c25150000                   jl         0x7f2213e65eb4
00f8f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f94 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00f99 7421                           je         0x7f2213e649bc
00f9b 4963d0                         movsxd     rdx, r8d
00f9e 4883fa20                       cmp        rdx, 0x20
00fa2 7685                           jbe        0x7f2213e64929
00fa4 c5f877                         vzeroupper 
00fa7 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
00fb1 41ffd2                         call       r10
00fb4 0f1f840000000000               nop        dword ptr [rax + rax]
00fbc 4c8b1424                       mov        r10, qword ptr [rsp]
00fc0 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00fc4 c5f877                         vzeroupper 
00fc7 4881c4f0000000                 add        rsp, 0xf0
00fce 5d                             pop        rbp
00fcf 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00fd3 0f87f3160000                   ja         0x7f2213e660cc
00fd9 c3                             ret        
00fda 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00fdf 4d63d2                         movsxd     r10, r10d
00fe2 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fe9 c442a8f5db                     bzhi       r11, r11, r10
00fee c4c1fb92fb                     kmovq      k7, r11
00ff3 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ff9 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00fff eb77                           jmp        0x7f2213e64a78
01001 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01006 4585d2                         test       r10d, r10d
01009 0f84b9030000                   je         0x7f2213e64dc8
0100f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01014 4585db                         test       r11d, r11d
01017 0f8cbb140000                   jl         0x7f2213e65ed8
0101d 85db                           test       ebx, ebx
0101f 0f8cb3140000                   jl         0x7f2213e65ed8
01025 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0102a 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01032 0f82a0140000                   jb         0x7f2213e65ed8
01038 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01040 453bd5                         cmp        r10d, r13d
01043 0f828f140000                   jb         0x7f2213e65ed8
01049 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0104e 4585db                         test       r11d, r11d
01051 7425                           je         0x7f2213e64a78
01053 4983f820                       cmp        r8, 0x20
01057 0f867dffffff                   jbe        0x7f2213e649da
0105d 498bd0                         mov        rdx, r8
01060 c5f877                         vzeroupper 
01063 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
0106d 41ffd2                         call       r10
01070 0f1f840000000000               nop        dword ptr [rax + rax]
01078 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0107d 4585d2                         test       r10d, r10d
01080 0f8eb3010000                   jle        0x7f2213e64c39
01086 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0108b 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
01090 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
01094 4103dd                         add        ebx, r13d
01097 458bdd                         mov        r11d, r13d
0109a 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
010a2 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
010aa 458bcb                         mov        r9d, r11d
010ad 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
010b2 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
010ba 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
010bf 0f8de2000000                   jge        0x7f2213e64ba7
010c5 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
010ca 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
010d2 458bda                         mov        r11d, r10d
010d5 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
010dd 450f4fda                       cmovg      r11d, r10d
010e1 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
010e9 4585c9                         test       r9d, r9d
010ec 0f8c52140000                   jl         0x7f2213e65f44
010f2 4585ed                         test       r13d, r13d
010f5 0f8c49140000                   jl         0x7f2213e65f44
010fb 458bd9                         mov        r11d, r9d
010fe 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
01106 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
0110e 453bc3                         cmp        r8d, r11d
01111 0f822d140000                   jb         0x7f2213e65f44
01117 458bd5                         mov        r10d, r13d
0111a 44039424a4000000               add        r10d, dword ptr [rsp + 0xa4]
01122 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0112a 453bc2                         cmp        r8d, r10d
0112d 0f8211140000                   jb         0x7f2213e65f44
01133 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0113b 4585d2                         test       r10d, r10d
0113e 0f8c00140000                   jl         0x7f2213e65f44
01144 4585d2                         test       r10d, r10d
01147 742c                           je         0x7f2213e64b75
01149 4963d2                         movsxd     rdx, r10d
0114c 4883fa20                       cmp        rdx, 0x20
01150 773b                           ja         0x7f2213e64b8d
01152 458bda                         mov        r11d, r10d
01155 4d63d3                         movsxd     r10, r11d
01158 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0115f c442a8f5db                     bzhi       r11, r11, r10
01164 c4c1fb92fb                     kmovq      k7, r11
01169 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0116f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01175 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0117d 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
01182 0f8c70010000                   jl         0x7f2213e64cf8
01188 e951f3ffff                     jmp        0x7f2213e63ede
0118d c5f877                         vzeroupper 
01190 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
0119a 41ffd2                         call       r10
0119d 0f1f840000000000               nop        dword ptr [rax + rax]
011a5 ebce                           jmp        0x7f2213e64b75
011a7 4585db                         test       r11d, r11d
011aa 0f8c48140000                   jl         0x7f2213e65ff8
011b0 4585ed                         test       r13d, r13d
011b3 0f8c3f140000                   jl         0x7f2213e65ff8
011b9 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
011be 4503d3                         add        r10d, r11d
011c1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
011c9 453bda                         cmp        r11d, r10d
011cc 0f8226140000                   jb         0x7f2213e65ff8
011d2 443bdb                         cmp        r11d, ebx
011d5 0f821d140000                   jb         0x7f2213e65ff8
011db 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
011e0 4585d2                         test       r10d, r10d
011e3 0f84f5f2ffff                   je         0x7f2213e63ede
011e9 4883fd20                       cmp        rbp, 0x20
011ed 772a                           ja         0x7f2213e64c19
011ef 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
011f4 4d63d3                         movsxd     r10, r11d
011f7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
011fe c442a8f5db                     bzhi       r11, r11, r10
01203 c4c1fb92fb                     kmovq      k7, r11
01208 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0120e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01214 e9c5f2ffff                     jmp        0x7f2213e63ede
01219 488bd5                         mov        rdx, rbp
0121c c5f877                         vzeroupper 
0121f 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
01229 41ffd2                         call       r10
0122c 0f1f840000000000               nop        dword ptr [rax + rax]
01234 e9a5f2ffff                     jmp        0x7f2213e63ede
01239 418bdd                         mov        ebx, r13d
0123c e99df2ffff                     jmp        0x7f2213e63ede
01241 41ffc8                         dec        r8d
01244 4585c0                         test       r8d, r8d
01247 7e1a                           jle        0x7f2213e64c63
01249 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0124e 45895310                       mov        dword ptr [r11 + 0x10], r10d
01252 458b5308                       mov        r10d, dword ptr [r11 + 8]
01256 4589530c                       mov        dword ptr [r11 + 0xc], r10d
0125a 45894308                       mov        dword ptr [r11 + 8], r8d
0125e e934f5ffff                     jmp        0x7f2213e64197
01263 48beb82374e200000000           movabs     rsi, 0xe27423b8
0126d 8beb                           mov        ebp, ebx
0126f 90                             nop        
01270 c5f877                         vzeroupper 
01273 e8e86ba9ff                     call       0x7f22138fb860
01278 0f1f84007013000c               nop        dword ptr [rax + rax + 0xc001370]
01280 4885c0                         test       rax, rax
01283 0f8540f5ffff                   jne        0x7f2213e641c9
01289 bef6ffffff                     mov        esi, 0xfffffff6
0128e 6690                           nop        
01290 c5f877                         vzeroupper 
01293 e8c8e9b5ff                     call       0x7f22139c3660
01298 0f1f84009013000d               nop        dword ptr [rax + rax + 0xd001390]
012a0 448bdd                         mov        r11d, ebp
012a3 4d63d3                         movsxd     r10, r11d
012a6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012ad c442a8f5db                     bzhi       r11, r11, r10
012b2 c4c1fb92fb                     kmovq      k7, r11
012b7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012bd 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012c3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
012cb 4403d5                         add        r10d, ebp
012ce 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
012d6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
012da 418502                         test       dword ptr [r10], eax
012dd 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
012e5 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
012ea 0f8deef1ffff                   jge        0x7f2213e63ede
012f0 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
012f8 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01300 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
01308 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01310 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
01314 2bac24a4000000                 sub        ebp, dword ptr [rsp + 0xa4]
0131b 3bac24a4000000                 cmp        ebp, dword ptr [rsp + 0xa4]
01322 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0132a 410f4feb                       cmovg      ebp, r11d
0132e 458bda                         mov        r11d, r10d
01331 4585d2                         test       r10d, r10d
01334 0f8c720e0000                   jl         0x7f2213e65bac
0133a 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01342 4585d2                         test       r10d, r10d
01345 0f8c610e0000                   jl         0x7f2213e65bac
0134b 458d042b                       lea        r8d, [r11 + rbp]
0134f 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01357 453bc8                         cmp        r9d, r8d
0135a 0f824c0e0000                   jb         0x7f2213e65bac
01360 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
01368 4403f5                         add        r14d, ebp
0136b 458bd1                         mov        r10d, r9d
0136e 453bd6                         cmp        r10d, r14d
01371 0f82350e0000                   jb         0x7f2213e65bac
01377 85ed                           test       ebp, ebp
01379 0f8c2d0e0000                   jl         0x7f2213e65bac
0137f 85ed                           test       ebp, ebp
01381 0f843cffffff                   je         0x7f2213e64cc3
01387 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0138c 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
01394 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
01399 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0139e 4863d5                         movsxd     rdx, ebp
013a1 4883fa20                       cmp        rdx, 0x20
013a5 0f86f5feffff                   jbe        0x7f2213e64ca0
013ab c5f877                         vzeroupper 
013ae 49ba204f8e13227f0000           movabs     r10, 0x7f22138e4f20
013b8 41ffd2                         call       r10
013bb 0f1f840000000000               nop        dword ptr [rax + rax]
013c3 e9fbfeffff                     jmp        0x7f2213e64cc3
013c8 448beb                         mov        r13d, ebx
013cb e9a8fcffff                     jmp        0x7f2213e64a78
013d0 bee4ffffff                     mov        esi, 0xffffffe4
013d5 488b2c24                       mov        rbp, qword ptr [rsp]
013d9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013de 4c891424                       mov        qword ptr [rsp], r10
013e2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013e7 4489542408                     mov        dword ptr [rsp + 8], r10d
013ec 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013f1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013f6 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
013fa 6690                           nop        
013fc c5f877                         vzeroupper 
013ff e85ce8b5ff                     call       0x7f22139c3660
01404 0f1f8400fc14000f               nop        dword ptr [rax + rax + 0xf0014fc]
0140c bee4ffffff                     mov        esi, 0xffffffe4
01411 488b2c24                       mov        rbp, qword ptr [rsp]
01415 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0141a 4c891424                       mov        qword ptr [rsp], r10
0141e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01423 44895c2408                     mov        dword ptr [rsp + 8], r11d
01428 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0142d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01432 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01437 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0143c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01441 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01446 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0144b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01450 c5f877                         vzeroupper 
01453 e808e8b5ff                     call       0x7f22139c3660
01458 0f1f840050150010               nop        dword ptr [rax + rax + 0x10001550]
01460 bee4ffffff                     mov        esi, 0xffffffe4
01465 488b2c24                       mov        rbp, qword ptr [rsp]
01469 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0146e 4c891424                       mov        qword ptr [rsp], r10
01472 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01477 4489542408                     mov        dword ptr [rsp + 8], r10d
0147c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01481 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01486 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0148b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01490 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01495 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0149a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0149f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014a4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
014ac 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
014b1 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
014b9 4489542474                     mov        dword ptr [rsp + 0x74], r10d
014be c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
014c7 90                             nop        
014c8 c5f877                         vzeroupper 
014cb e890e7b5ff                     call       0x7f22139c3660
014d0 0f1f8400c8150011               nop        dword ptr [rax + rax + 0x110015c8]
014d8 bee4ffffff                     mov        esi, 0xffffffe4
014dd 488b2c24                       mov        rbp, qword ptr [rsp]
014e1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014e6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
014eb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014f0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014f5 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
014f9 48894424f8                     mov        qword ptr [rsp - 8], rax
014fe 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01502 89442470                       mov        dword ptr [rsp + 0x70], eax
01506 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150b 90                             nop        
0150c c5f877                         vzeroupper 
0150f e84ce7b5ff                     call       0x7f22139c3660
01514 0f1f84000c160012               nop        dword ptr [rax + rax + 0x1200160c]
0151c bee4ffffff                     mov        esi, 0xffffffe4
01521 488b2c24                       mov        rbp, qword ptr [rsp]
01525 4c891c24                       mov        qword ptr [rsp], r11
01529 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0152e 4489542408                     mov        dword ptr [rsp + 8], r10d
01533 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01538 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0153d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01542 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01547 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0154c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01551 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01556 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0155b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01560 48894424f8                     mov        qword ptr [rsp - 8], rax
01565 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01569 89442470                       mov        dword ptr [rsp + 0x70], eax
0156d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01572 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01576 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0157e 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01583 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0158c c5f877                         vzeroupper 
0158f e8cce6b5ff                     call       0x7f22139c3660
01594 0f1f84008c160013               nop        dword ptr [rax + rax + 0x1300168c]
0159c be45ffffff                     mov        esi, 0xffffff45
015a1 488b2c24                       mov        rbp, qword ptr [rsp]
015a5 4c89542408                     mov        qword ptr [rsp + 8], r10
015aa 6690                           nop        
015ac c5f877                         vzeroupper 
015af e8ace6b5ff                     call       0x7f22139c3660
015b4 0f1f8400ac160014               nop        dword ptr [rax + rax + 0x140016ac]
015bc be45ffffff                     mov        esi, 0xffffff45
015c1 488b2c24                       mov        rbp, qword ptr [rsp]
015c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015ca 4c891424                       mov        qword ptr [rsp], r10
015ce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015d3 4489542408                     mov        dword ptr [rsp + 8], r10d
015d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
015dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015ec 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015f1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015f6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015fb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01600 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01604 48894424f8                     mov        qword ptr [rsp - 8], rax
01609 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0160d 89442434                       mov        dword ptr [rsp + 0x34], eax
01611 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01616 48894424f8                     mov        qword ptr [rsp - 8], rax
0161b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0161f 89442438                       mov        dword ptr [rsp + 0x38], eax
01623 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01628 48894424f8                     mov        qword ptr [rsp - 8], rax
0162d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01631 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 48ff742450                     push       qword ptr [rsp + 0x50]
0163f 488f442448                     pop        qword ptr [rsp + 0x48]
01644 48ff742458                     push       qword ptr [rsp + 0x58]
01649 488f442450                     pop        qword ptr [rsp + 0x50]
0164e 48894424f8                     mov        qword ptr [rsp - 8], rax
01653 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01657 89442458                       mov        dword ptr [rsp + 0x58], eax
0165b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01660 48894424f8                     mov        qword ptr [rsp - 8], rax
01665 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01669 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0166d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01672 48894424f8                     mov        qword ptr [rsp - 8], rax
01677 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0167b 89442460                       mov        dword ptr [rsp + 0x60], eax
0167f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01684 48894424f8                     mov        qword ptr [rsp - 8], rax
01689 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0168d 89442464                       mov        dword ptr [rsp + 0x64], eax
01691 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01696 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0169a 6690                           nop        
0169c c5f877                         vzeroupper 
0169f e8bce5b5ff                     call       0x7f22139c3660
016a4 0f1f84009c170015               nop        dword ptr [rax + rax + 0x1500179c]
016ac 4d3bda                         cmp        r11, r10
016af bdffffffff                     mov        ebp, 0xffffffff
016b4 7c08                           jl         0x7f2213e650be
016b6 400f95c5                       setne      bpl
016ba 400fb6ed                       movzx      ebp, bpl
016be be45ffffff                     mov        esi, 0xffffff45
016c3 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
016c8 4489442414                     mov        dword ptr [rsp + 0x14], r8d
016cd 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
016d2 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
016d7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
016db 48894424f8                     mov        qword ptr [rsp - 8], rax
016e0 8b442478                       mov        eax, dword ptr [rsp + 0x78]
016e4 89442470                       mov        dword ptr [rsp + 0x70], eax
016e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ed 4c89542478                     mov        qword ptr [rsp + 0x78], r10
016f2 6690                           nop        
016f4 c5f877                         vzeroupper 
016f7 e864e5b5ff                     call       0x7f22139c3660
016fc 0f1f8400f4170016               nop        dword ptr [rax + rax + 0x160017f4]
01704 be45ffffff                     mov        esi, 0xffffff45
01709 488b2c24                       mov        rbp, qword ptr [rsp]
0170d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01712 4c891424                       mov        qword ptr [rsp], r10
01716 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0171b 4489542408                     mov        dword ptr [rsp + 8], r10d
01720 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01725 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0172a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0172f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01734 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01739 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0173e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01743 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01748 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0174d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01752 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01756 48894424f8                     mov        qword ptr [rsp - 8], rax
0175b 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0175f 89442434                       mov        dword ptr [rsp + 0x34], eax
01763 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01768 48894424f8                     mov        qword ptr [rsp - 8], rax
0176d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01771 89442438                       mov        dword ptr [rsp + 0x38], eax
01775 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177a 48894424f8                     mov        qword ptr [rsp - 8], rax
0177f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01783 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01787 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178c 48ff742450                     push       qword ptr [rsp + 0x50]
01791 488f442448                     pop        qword ptr [rsp + 0x48]
01796 48ff742458                     push       qword ptr [rsp + 0x58]
0179b 488f442450                     pop        qword ptr [rsp + 0x50]
017a0 48894424f8                     mov        qword ptr [rsp - 8], rax
017a5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017a9 89442458                       mov        dword ptr [rsp + 0x58], eax
017ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b2 48894424f8                     mov        qword ptr [rsp - 8], rax
017b7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017bb 89442460                       mov        dword ptr [rsp + 0x60], eax
017bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c4 48894424f8                     mov        qword ptr [rsp - 8], rax
017c9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017cd 89442468                       mov        dword ptr [rsp + 0x68], eax
017d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d6 6690                           nop        
017d8 c5f877                         vzeroupper 
017db e880e4b5ff                     call       0x7f22139c3660
017e0 0f1f8400d8180017               nop        dword ptr [rax + rax + 0x170018d8]
017e8 be45ffffff                     mov        esi, 0xffffff45
017ed 488b2c24                       mov        rbp, qword ptr [rsp]
017f1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017f6 4c891424                       mov        qword ptr [rsp], r10
017fa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017ff 44895c2408                     mov        dword ptr [rsp + 8], r11d
01804 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01809 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0180e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01813 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01818 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0181d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01822 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01827 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0182c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01831 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01836 48894424f8                     mov        qword ptr [rsp - 8], rax
0183b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0183f 89442438                       mov        dword ptr [rsp + 0x38], eax
01843 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01848 48894424f8                     mov        qword ptr [rsp - 8], rax
0184d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01851 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185a 48ff742450                     push       qword ptr [rsp + 0x50]
0185f 488f442448                     pop        qword ptr [rsp + 0x48]
01864 48ff742458                     push       qword ptr [rsp + 0x58]
01869 488f442450                     pop        qword ptr [rsp + 0x50]
0186e 48894424f8                     mov        qword ptr [rsp - 8], rax
01873 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01877 89442458                       mov        dword ptr [rsp + 0x58], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 48894424f8                     mov        qword ptr [rsp - 8], rax
01885 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01889 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0188d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01892 48894424f8                     mov        qword ptr [rsp - 8], rax
01897 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0189b 89442460                       mov        dword ptr [rsp + 0x60], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
018a9 4489542464                     mov        dword ptr [rsp + 0x64], r10d
018ae 6690                           nop        
018b0 c5f877                         vzeroupper 
018b3 e8a8e3b5ff                     call       0x7f22139c3660
018b8 0f1f8400b0190018               nop        dword ptr [rax + rax + 0x180019b0]
018c0 4533d2                         xor        r10d, r10d
018c3 4c891424                       mov        qword ptr [rsp], r10
018c7 e980e8ffff                     jmp        0x7f2213e63b4c
018cc 4533d2                         xor        r10d, r10d
018cf 4c89542408                     mov        qword ptr [rsp + 8], r10
018d4 e9a1e8ffff                     jmp        0x7f2213e63b7a
018d9 4533d2                         xor        r10d, r10d
018dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018e1 e9c2e8ffff                     jmp        0x7f2213e63ba8
018e6 4533d2                         xor        r10d, r10d
018e9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018ee e9e3e8ffff                     jmp        0x7f2213e63bd6
018f3 4533d2                         xor        r10d, r10d
018f6 4c89542470                     mov        qword ptr [rsp + 0x70], r10
018fb e904e9ffff                     jmp        0x7f2213e63c04
01900 4533d2                         xor        r10d, r10d
01903 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01908 e922e9ffff                     jmp        0x7f2213e63c2f
0190d bee4ffffff                     mov        esi, 0xffffffe4
01912 488b2c24                       mov        rbp, qword ptr [rsp]
01916 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0191b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01920 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01925 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0192a 48894424f8                     mov        qword ptr [rsp - 8], rax
0192f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01933 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193c 48894424f8                     mov        qword ptr [rsp - 8], rax
01941 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01945 89442460                       mov        dword ptr [rsp + 0x60], eax
01949 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194e 48894424f8                     mov        qword ptr [rsp - 8], rax
01953 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01957 89442464                       mov        dword ptr [rsp + 0x64], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48894424f8                     mov        qword ptr [rsp - 8], rax
01965 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01969 89442468                       mov        dword ptr [rsp + 0x68], eax
0196d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01972 48894424f8                     mov        qword ptr [rsp - 8], rax
01977 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0197b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01989 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0198d 666690                         nop        
01990 c5f877                         vzeroupper 
01993 e8c8e2b5ff                     call       0x7f22139c3660
01998 0f1f8400901a0019               nop        dword ptr [rax + rax + 0x19001a90]
019a0 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
019a9 bee4ffffff                     mov        esi, 0xffffffe4
019ae 488b2c24                       mov        rbp, qword ptr [rsp]
019b2 4c891424                       mov        qword ptr [rsp], r10
019b6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019bb 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019c5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019ca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019cf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019d4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019d9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019de 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
019e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019e8 48894424f8                     mov        qword ptr [rsp - 8], rax
019ed 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019f1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
019f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fa 48894424f8                     mov        qword ptr [rsp - 8], rax
019ff 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a03 89442460                       mov        dword ptr [rsp + 0x60], eax
01a07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a11 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a15 89442464                       mov        dword ptr [rsp + 0x64], eax
01a19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a23 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a27 89442468                       mov        dword ptr [rsp + 0x68], eax
01a2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a30 48894424f8                     mov        qword ptr [rsp - 8], rax
01a35 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a39 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a42 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01a47 897c247c                       mov        dword ptr [rsp + 0x7c], edi
01a4b 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01a52 6690                           nop        
01a54 c5f877                         vzeroupper 
01a57 e804e2b5ff                     call       0x7f22139c3660
01a5c 0f1f8400541b001a               nop        dword ptr [rax + rax + 0x1a001b54]
01a64 8bef                           mov        ebp, edi
01a66 83c510                         add        ebp, 0x10
01a69 be6effffff                     mov        esi, 0xffffff6e
01a6e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a73 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a78 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a7d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a82 897c2438                       mov        dword ptr [rsp + 0x38], edi
01a86 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a8f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a98 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aa1 89442460                       mov        dword ptr [rsp + 0x60], eax
01aa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaa 48894424f8                     mov        qword ptr [rsp - 8], rax
01aaf 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ab3 89442464                       mov        dword ptr [rsp + 0x64], eax
01ab7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ac5 89442468                       mov        dword ptr [rsp + 0x68], eax
01ac9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ace 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ad7 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01adb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01ae5 666690                         nop        
01ae8 c5f877                         vzeroupper 
01aeb e870e1b5ff                     call       0x7f22139c3660
01af0 0f1f8400e81b001b               nop        dword ptr [rax + rax + 0x1b001be8]
01af8 8bef                           mov        ebp, edi
01afa 83c510                         add        ebp, 0x10
01afd be66ffffff                     mov        esi, 0xffffff66
01b02 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b07 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b0c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b11 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b16 897c2438                       mov        dword ptr [rsp + 0x38], edi
01b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b23 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b31 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b35 89442460                       mov        dword ptr [rsp + 0x60], eax
01b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b47 89442464                       mov        dword ptr [rsp + 0x64], eax
01b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b50 48894424f8                     mov        qword ptr [rsp - 8], rax
01b55 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b59 89442468                       mov        dword ptr [rsp + 0x68], eax
01b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b62 48894424f8                     mov        qword ptr [rsp - 8], rax
01b67 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b6b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b74 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01b79 666690                         nop        
01b7c c5f877                         vzeroupper 
01b7f e8dce0b5ff                     call       0x7f22139c3660
01b84 0f1f84007c1c001c               nop        dword ptr [rax + rax + 0x1c001c7c]
01b8c bebeffffff                     mov        esi, 0xffffffbe
01b91 488b2c24                       mov        rbp, qword ptr [rsp]
01b95 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b9a 4c891424                       mov        qword ptr [rsp], r10
01b9e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ba3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ba8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bad 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bb2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bb7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bbc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bc1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bc6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bcb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01bd0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01bd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bdd 89442434                       mov        dword ptr [rsp + 0x34], eax
01be1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be6 48894424f8                     mov        qword ptr [rsp - 8], rax
01beb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01bef 89442438                       mov        dword ptr [rsp + 0x38], eax
01bf3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c01 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0a 48ff742450                     push       qword ptr [rsp + 0x50]
01c0f 488f442448                     pop        qword ptr [rsp + 0x48]
01c14 48ff742458                     push       qword ptr [rsp + 0x58]
01c19 488f442450                     pop        qword ptr [rsp + 0x50]
01c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c23 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c27 89442458                       mov        dword ptr [rsp + 0x58], eax
01c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c30 c5f877                         vzeroupper 
01c33 e828e0b5ff                     call       0x7f22139c3660
01c38 0f1f8400301d001d               nop        dword ptr [rax + rax + 0x1d001d30]
01c40 be85ffffff                     mov        esi, 0xffffff85
01c45 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01c49 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c4e 44891c24                       mov        dword ptr [rsp], r11d
01c52 895c2404                       mov        dword ptr [rsp + 4], ebx
01c56 6690                           nop        
01c58 c5f877                         vzeroupper 
01c5b e800e0b5ff                     call       0x7f22139c3660
01c60 0f1f8400581d001e               nop        dword ptr [rax + rax + 0x1e001d58]
01c68 bee4ffffff                     mov        esi, 0xffffffe4
01c6d 488b2c24                       mov        rbp, qword ptr [rsp]
01c71 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c76 4c891424                       mov        qword ptr [rsp], r10
01c7a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c7f 4489542408                     mov        dword ptr [rsp + 8], r10d
01c84 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01c89 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c8e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c93 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c98 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c9d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ca2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ca7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cac 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01cb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01cb9 89442434                       mov        dword ptr [rsp + 0x34], eax
01cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ccb 89442438                       mov        dword ptr [rsp + 0x38], eax
01ccf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd9 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01cdd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ce1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce6 48ff742450                     push       qword ptr [rsp + 0x50]
01ceb 488f442448                     pop        qword ptr [rsp + 0x48]
01cf0 48ff742458                     push       qword ptr [rsp + 0x58]
01cf5 488f442450                     pop        qword ptr [rsp + 0x50]
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d03 89442458                       mov        dword ptr [rsp + 0x58], eax
01d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d11 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d15 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d23 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d27 89442460                       mov        dword ptr [rsp + 0x60], eax
01d2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d30 48894424f8                     mov        qword ptr [rsp - 8], rax
01d35 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d39 89442464                       mov        dword ptr [rsp + 0x64], eax
01d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d4b 89442468                       mov        dword ptr [rsp + 0x68], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d5b 90                             nop        
01d5c c5f877                         vzeroupper 
01d5f e8fcdeb5ff                     call       0x7f22139c3660
01d64 0f1f84005c1e001f               nop        dword ptr [rax + rax + 0x1f001e5c]
01d6c bef6ffffff                     mov        esi, 0xfffffff6
01d71 666690                         nop        
01d74 c5f877                         vzeroupper 
01d77 e8e4deb5ff                     call       0x7f22139c3660
01d7c 0f1f8400741e0020               nop        dword ptr [rax + rax + 0x20001e74]
01d84 beccffffff                     mov        esi, 0xffffffcc
01d89 488b2c24                       mov        rbp, qword ptr [rsp]
01d8d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d92 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d97 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d9c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01da1 48894424f8                     mov        qword ptr [rsp - 8], rax
01da6 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01daa 89442470                       mov        dword ptr [rsp + 0x70], eax
01dae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db3 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01db7 90                             nop        
01db8 c5f877                         vzeroupper 
01dbb e8a0deb5ff                     call       0x7f22139c3660
01dc0 0f1f8400b81e0021               nop        dword ptr [rax + rax + 0x21001eb8]
01dc8 bee4ffffff                     mov        esi, 0xffffffe4
01dcd 488b2c24                       mov        rbp, qword ptr [rsp]
01dd1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dd6 4c891424                       mov        qword ptr [rsp], r10
01dda 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ddf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01de4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01de9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01dee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01df3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01df8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dfd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e02 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e07 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e11 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e15 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01e19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01e26 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01e2b 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01e33 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01e38 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01e3d 666690                         nop        
01e40 c5f877                         vzeroupper 
01e43 e818deb5ff                     call       0x7f22139c3660
01e48 0f1f8400401f0022               nop        dword ptr [rax + rax + 0x22001f40]
01e50 bee4ffffff                     mov        esi, 0xffffffe4
01e55 488b2c24                       mov        rbp, qword ptr [rsp]
01e59 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e5e 4c891424                       mov        qword ptr [rsp], r10
01e62 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e67 4489542408                     mov        dword ptr [rsp + 8], r10d
01e6c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e71 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e76 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e7b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e80 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e85 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e8a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e8f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e94 48894424f8                     mov        qword ptr [rsp - 8], rax
01e99 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e9d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea6 6690                           nop        
01ea8 c5f877                         vzeroupper 
01eab e8b0ddb5ff                     call       0x7f22139c3660
01eb0 0f1f8400a81f0023               nop        dword ptr [rax + rax + 0x23001fa8]
01eb8 beccffffff                     mov        esi, 0xffffffcc
01ebd 488b2c24                       mov        rbp, qword ptr [rsp]
01ec1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ec6 4c891424                       mov        qword ptr [rsp], r10
01eca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ecf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ed4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ed9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ede 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ee3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ee8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01eed 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ef2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ef7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01efc c5f877                         vzeroupper 
01eff e85cddb5ff                     call       0x7f22139c3660
01f04 0f1f8400fc1f0024               nop        dword ptr [rax + rax + 0x24001ffc]
01f0c be6effffff                     mov        esi, 0xffffff6e
01f11 488b2c24                       mov        rbp, qword ptr [rsp]
01f15 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f1a 4c891424                       mov        qword ptr [rsp], r10
01f1e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f23 4489542408                     mov        dword ptr [rsp + 8], r10d
01f28 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f2d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f32 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f37 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f3c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f41 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f46 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f4b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f50 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f54 48894424f8                     mov        qword ptr [rsp - 8], rax
01f59 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f5d 89442434                       mov        dword ptr [rsp + 0x34], eax
01f61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f66 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f6f 89442438                       mov        dword ptr [rsp + 0x38], eax
01f73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f78 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f81 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48ff742450                     push       qword ptr [rsp + 0x50]
01f8f 488f442448                     pop        qword ptr [rsp + 0x48]
01f94 48ff742458                     push       qword ptr [rsp + 0x58]
01f99 488f442450                     pop        qword ptr [rsp + 0x50]
01f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fa7 89442458                       mov        dword ptr [rsp + 0x58], eax
01fab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fb9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fcb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01fdd 89442464                       mov        dword ptr [rsp + 0x64], eax
01fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe6 48894424f8                     mov        qword ptr [rsp - 8], rax
01feb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01fef 89442468                       mov        dword ptr [rsp + 0x68], eax
01ff3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff8 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01ffd 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02001 666690                         nop        
02004 c5f877                         vzeroupper 
02007 e854dcb5ff                     call       0x7f22139c3660
0200c 0f1f840004210025               nop        dword ptr [rax + rax + 0x25002104]
02014 458bd3                         mov        r10d, r11d
02017 e9e1eeffff                     jmp        0x7f2213e648fd
0201c 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
02024 458d5308                       lea        r10d, [r11 + 8]
02028 458bca                         mov        r9d, r10d
0202b be6effffff                     mov        esi, 0xffffff6e
02030 488b2c24                       mov        rbp, qword ptr [rsp]
02034 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02039 4c891424                       mov        qword ptr [rsp], r10
0203d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02042 4489542408                     mov        dword ptr [rsp + 8], r10d
02047 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0204c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02051 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02056 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0205b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02060 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02065 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0206a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0206f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02074 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02079 48ff742440                     push       qword ptr [rsp + 0x40]
0207e 488f442438                     pop        qword ptr [rsp + 0x38]
02083 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02088 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0208d 48ff742450                     push       qword ptr [rsp + 0x50]
02092 488f442448                     pop        qword ptr [rsp + 0x48]
02097 48ff742458                     push       qword ptr [rsp + 0x58]
0209c 488f442450                     pop        qword ptr [rsp + 0x50]
020a1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
020a6 4489542444                     mov        dword ptr [rsp + 0x44], r10d
020ab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
020b0 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
020b5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
020ba 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
020bf 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
020c7 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
020cc 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
020d1 666690                         nop        
020d4 c5f877                         vzeroupper 
020d7 e884dbb5ff                     call       0x7f22139c3660
020dc 0f1f8400d4210026               nop        dword ptr [rax + rax + 0x260021d4]
020e4 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
020ec 458d5308                       lea        r10d, [r11 + 8]
020f0 458bca                         mov        r9d, r10d
020f3 be66ffffff                     mov        esi, 0xffffff66
020f8 488b2c24                       mov        rbp, qword ptr [rsp]
020fc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02101 4c891424                       mov        qword ptr [rsp], r10
02105 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0210a 4489542408                     mov        dword ptr [rsp + 8], r10d
0210f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02114 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02119 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0211e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02123 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02128 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0212d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02132 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02137 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0213c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02141 48ff742440                     push       qword ptr [rsp + 0x40]
02146 488f442438                     pop        qword ptr [rsp + 0x38]
0214b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02150 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02155 48ff742450                     push       qword ptr [rsp + 0x50]
0215a 488f442448                     pop        qword ptr [rsp + 0x48]
0215f 48ff742458                     push       qword ptr [rsp + 0x58]
02164 488f442450                     pop        qword ptr [rsp + 0x50]
02169 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0216e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02173 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02178 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0217d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02182 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02187 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0218f 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02194 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02199 666690                         nop        
0219c c5f877                         vzeroupper 
0219f e8bcdab5ff                     call       0x7f22139c3660
021a4 0f1f84009c220027               nop        dword ptr [rax + rax + 0x2700229c]
021ac beccffffff                     mov        esi, 0xffffffcc
021b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021b6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
021bb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021c0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021c5 48894424f8                     mov        qword ptr [rsp - 8], rax
021ca 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021ce 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d7 48894424f8                     mov        qword ptr [rsp - 8], rax
021dc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021e0 89442460                       mov        dword ptr [rsp + 0x60], eax
021e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e9 48894424f8                     mov        qword ptr [rsp - 8], rax
021ee 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021f2 89442464                       mov        dword ptr [rsp + 0x64], eax
021f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02200 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02204 89442468                       mov        dword ptr [rsp + 0x68], eax
02208 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220d 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02212 6690                           nop        
02214 c5f877                         vzeroupper 
02217 e844dab5ff                     call       0x7f22139c3660
0221c 0f1f840014230028               nop        dword ptr [rax + rax + 0x28002314]
02224 bee4ffffff                     mov        esi, 0xffffffe4
02229 488b2c24                       mov        rbp, qword ptr [rsp]
0222d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02232 4c891424                       mov        qword ptr [rsp], r10
02236 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0223b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02240 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02245 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0224a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0224f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02254 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02259 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0225e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02263 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02268 48894424f8                     mov        qword ptr [rsp - 8], rax
0226d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02271 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02275 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227a 48894424f8                     mov        qword ptr [rsp - 8], rax
0227f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02283 89442460                       mov        dword ptr [rsp + 0x60], eax
02287 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228c 48894424f8                     mov        qword ptr [rsp - 8], rax
02291 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02295 89442464                       mov        dword ptr [rsp + 0x64], eax
02299 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229e 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
022a6 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
022ab 48894424f8                     mov        qword ptr [rsp - 8], rax
022b0 8b442478                       mov        eax, dword ptr [rsp + 0x78]
022b4 89442474                       mov        dword ptr [rsp + 0x74], eax
022b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022bd 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
022c5 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
022cd 666690                         nop        
022d0 c5f877                         vzeroupper 
022d3 e888d9b5ff                     call       0x7f22139c3660
022d8 0f1f8400d0230029               nop        dword ptr [rax + rax + 0x290023d0]
022e0 bee4ffffff                     mov        esi, 0xffffffe4
022e5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022ea 4489542414                     mov        dword ptr [rsp + 0x14], r10d
022ef 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
022f4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022f9 48894424f8                     mov        qword ptr [rsp - 8], rax
022fe 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02302 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02306 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230b 48894424f8                     mov        qword ptr [rsp - 8], rax
02310 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02314 89442460                       mov        dword ptr [rsp + 0x60], eax
02318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02326 89442464                       mov        dword ptr [rsp + 0x64], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 90                             nop        
02330 c5f877                         vzeroupper 
02333 e828d9b5ff                     call       0x7f22139c3660
02338 0f1f84003024002a               nop        dword ptr [rax + rax + 0x2a002430]
02340 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
02347 ffc5                           inc        ebp
02349 bee4ffffff                     mov        esi, 0xffffffe4
0234e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02353 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02358 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0235d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02362 48894424f8                     mov        qword ptr [rsp - 8], rax
02367 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0236b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0236f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02374 48894424f8                     mov        qword ptr [rsp - 8], rax
02379 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0237d 89442460                       mov        dword ptr [rsp + 0x60], eax
02381 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02386 48894424f8                     mov        qword ptr [rsp - 8], rax
0238b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0238f 89442464                       mov        dword ptr [rsp + 0x64], eax
02393 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02398 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
023a0 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
023a5 666690                         nop        
023a8 c5f877                         vzeroupper 
023ab e8b0d8b5ff                     call       0x7f22139c3660
023b0 0f1f8400a824002b               nop        dword ptr [rax + rax + 0x2b0024a8]
023b8 bee4ffffff                     mov        esi, 0xffffffe4
023bd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023c2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023c7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
023cc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023d1 48894424f8                     mov        qword ptr [rsp - 8], rax
023d6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023da 8944244c                       mov        dword ptr [rsp + 0x4c], eax
023de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e3 48894424f8                     mov        qword ptr [rsp - 8], rax
023e8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023ec 89442460                       mov        dword ptr [rsp + 0x60], eax
023f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f5 48894424f8                     mov        qword ptr [rsp - 8], rax
023fa 8b442468                       mov        eax, dword ptr [rsp + 0x68]
023fe 89442464                       mov        dword ptr [rsp + 0x64], eax
02402 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02407 90                             nop        
02408 c5f877                         vzeroupper 
0240b e850d8b5ff                     call       0x7f22139c3660
02410 0f1f84000825002c               nop        dword ptr [rax + rax + 0x2c002508]
02418 bee4ffffff                     mov        esi, 0xffffffe4
0241d 488b2c24                       mov        rbp, qword ptr [rsp]
02421 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02426 4c891424                       mov        qword ptr [rsp], r10
0242a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0242f 4489542408                     mov        dword ptr [rsp + 8], r10d
02434 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02439 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0243e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02443 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02448 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0244d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02452 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02457 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0245c 48894424f8                     mov        qword ptr [rsp - 8], rax
02461 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02465 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02469 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246e 48894424f8                     mov        qword ptr [rsp - 8], rax
02473 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02477 89442460                       mov        dword ptr [rsp + 0x60], eax
0247b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02480 48894424f8                     mov        qword ptr [rsp - 8], rax
02485 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02489 89442464                       mov        dword ptr [rsp + 0x64], eax
0248d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02492 48894424f8                     mov        qword ptr [rsp - 8], rax
02497 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0249b 89442470                       mov        dword ptr [rsp + 0x70], eax
0249f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a4 c5f877                         vzeroupper 
024a7 e8b4d7b5ff                     call       0x7f22139c3660
024ac 0f1f8400a425002d               nop        dword ptr [rax + rax + 0x2d0025a4]
024b4 beccffffff                     mov        esi, 0xffffffcc
024b9 488b2c24                       mov        rbp, qword ptr [rsp]
024bd 895c2414                       mov        dword ptr [rsp + 0x14], ebx
024c1 4489442420                     mov        dword ptr [rsp + 0x20], r8d
024c6 6690                           nop        
024c8 c5f877                         vzeroupper 
024cb e890d7b5ff                     call       0x7f22139c3660
024d0 0f1f8400c825002e               nop        dword ptr [rax + rax + 0x2e0025c8]
024d8 beccffffff                     mov        esi, 0xffffffcc
024dd 488b2c24                       mov        rbp, qword ptr [rsp]
024e1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024e6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
024eb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024f0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024f5 48894424f8                     mov        qword ptr [rsp - 8], rax
024fa 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024fe 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02507 48894424f8                     mov        qword ptr [rsp - 8], rax
0250c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02510 89442460                       mov        dword ptr [rsp + 0x60], eax
02514 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02519 48894424f8                     mov        qword ptr [rsp - 8], rax
0251e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02522 89442464                       mov        dword ptr [rsp + 0x64], eax
02526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252b 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
02532 6690                           nop        
02534 c5f877                         vzeroupper 
02537 e824d7b5ff                     call       0x7f22139c3660
0253c 0f1f84003426002f               nop        dword ptr [rax + rax + 0x2f002634]
02544 beccffffff                     mov        esi, 0xffffffcc
02549 488b2c24                       mov        rbp, qword ptr [rsp]
0254d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02552 4c891424                       mov        qword ptr [rsp], r10
02556 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0255b 4489542408                     mov        dword ptr [rsp + 8], r10d
02560 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02565 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0256a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0256f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02574 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02579 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0257e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02583 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02588 48894424f8                     mov        qword ptr [rsp - 8], rax
0258d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02591 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02595 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259a 48894424f8                     mov        qword ptr [rsp - 8], rax
0259f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025a3 89442460                       mov        dword ptr [rsp + 0x60], eax
025a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ac 48894424f8                     mov        qword ptr [rsp - 8], rax
025b1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
025b5 89442464                       mov        dword ptr [rsp + 0x64], eax
025b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025be 48894424f8                     mov        qword ptr [rsp - 8], rax
025c3 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
025c7 89442468                       mov        dword ptr [rsp + 0x68], eax
025cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d0 48894424f8                     mov        qword ptr [rsp - 8], rax
025d5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
025d9 89442470                       mov        dword ptr [rsp + 0x70], eax
025dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e2 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025e7 90                             nop        
025e8 c5f877                         vzeroupper 
025eb e870d6b5ff                     call       0x7f22139c3660
025f0 0f1f8400e8260030               nop        dword ptr [rax + rax + 0x300026e8]
025f8 beccffffff                     mov        esi, 0xffffffcc
025fd 488b2c24                       mov        rbp, qword ptr [rsp]
02601 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02606 4c891424                       mov        qword ptr [rsp], r10
0260a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0260f 4489542408                     mov        dword ptr [rsp + 8], r10d
02614 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02619 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0261e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02623 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02628 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0262d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02632 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02637 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0263c 48894424f8                     mov        qword ptr [rsp - 8], rax
02641 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02645 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02649 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264e 48894424f8                     mov        qword ptr [rsp - 8], rax
02653 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02657 89442460                       mov        dword ptr [rsp + 0x60], eax
0265b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02660 48894424f8                     mov        qword ptr [rsp - 8], rax
02665 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02669 89442464                       mov        dword ptr [rsp + 0x64], eax
0266d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02672 48894424f8                     mov        qword ptr [rsp - 8], rax
02677 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0267b 89442468                       mov        dword ptr [rsp + 0x68], eax
0267f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02684 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02689 666690                         nop        
0268c c5f877                         vzeroupper 
0268f e8ccd5b5ff                     call       0x7f22139c3660
02694 0f1f84008c270031               nop        dword ptr [rax + rax + 0x3100278c]
0269c eb10                           jmp        0x7f2213e660ae
0269e eb0e                           jmp        0x7f2213e660ae
026a0 eb0c                           jmp        0x7f2213e660ae
026a2 eb0a                           jmp        0x7f2213e660ae
026a4 eb08                           jmp        0x7f2213e660ae
026a6 eb06                           jmp        0x7f2213e660ae
026a8 eb04                           jmp        0x7f2213e660ae
026aa eb02                           jmp        0x7f2213e660ae
026ac eb00                           jmp        0x7f2213e660ae
026ae 488bf0                         mov        rsi, rax
026b1 e916e1ffff                     jmp        0x7f2213e641cc
026b6 bef6ffffff                     mov        esi, 0xfffffff6
026bb 90                             nop        
026bc c5f877                         vzeroupper 
026bf e89cd5b5ff                     call       0x7f22139c3660
026c4 0f1f8400bc270032               nop        dword ptr [rax + rax + 0x320027bc]
026cc 49bacf49e613227f0000           movabs     r10, 0x7f2213e649cf
026d6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
026dd e9fe7da9ff                     jmp        0x7f22138fdee0
026e2 e8b949a8ff                     call       0x7f22138eaaa0
026e7 e942d9ffff                     jmp        0x7f2213e63a2e
026ec f4                             hlt        
026ed f4                             hlt        
026ee f4                             hlt        
026ef f4                             hlt        
