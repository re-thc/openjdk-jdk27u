00000 e83b30a317                     call       0x7f0c8b895640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85a8260000                   jne        0x7f0c73e64cd6
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
000a6 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
000ad 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b9 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000c0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ed 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f2 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49ba80bd978b0c7f0000           movabs     r10, 0x7f0c8b97bd80
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f8494170000                   je         0x7f0c73e63ec4
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15410000                 cmp        r11d, 0x4115
0013e 0f85fc1a0000                   jne        0x7f0c73e64240
00144 4c891424                       mov        qword ptr [rsp], r10
00148 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00150 4885ed                         test       rbp, rbp
00153 0f8477170000                   je         0x7f0c73e63ed0
00159 448b5500                       mov        r10d, dword ptr [rbp]
0015d 41c1ea0d                       shr        r10d, 0xd
00161 4181fadd050000                 cmp        r10d, 0x5dd
00168 0f85d21a0000                   jne        0x7f0c73e64240
0016e 4c8bd5                         mov        r10, rbp
00171 4c89542408                     mov        qword ptr [rsp + 8], r10
00176 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017e 4885ed                         test       rbp, rbp
00181 0f8456170000                   je         0x7f0c73e63edd
00187 448b5d00                       mov        r11d, dword ptr [rbp]
0018b 41c1eb0d                       shr        r11d, 0xd
0018f 4181fbe0050000                 cmp        r11d, 0x5e0
00196 0f85a41a0000                   jne        0x7f0c73e64240
0019c 4c8bd5                         mov        r10, rbp
0019f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a4 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ac 4885ed                         test       rbp, rbp
001af 0f8435170000                   je         0x7f0c73e63eea
001b5 448b5500                       mov        r10d, dword ptr [rbp]
001b9 41c1ea0d                       shr        r10d, 0xd
001bd 4181fadf050000                 cmp        r10d, 0x5df
001c4 0f85761a0000                   jne        0x7f0c73e64240
001ca 4c8bd5                         mov        r10, rbp
001cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d2 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001da 4885ed                         test       rbp, rbp
001dd 0f8414170000                   je         0x7f0c73e63ef7
001e3 448b5500                       mov        r10d, dword ptr [rbp]
001e7 41c1ea0d                       shr        r10d, 0xd
001eb 4181fadf050000                 cmp        r10d, 0x5df
001f2 0f85481a0000                   jne        0x7f0c73e64240
001f8 4c8bd5                         mov        r10, rbp
001fb 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00200 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00208 4885ed                         test       rbp, rbp
0020b 0f84f3160000                   je         0x7f0c73e63f04
00211 448b5500                       mov        r10d, dword ptr [rbp]
00215 41c1ea0d                       shr        r10d, 0xd
00219 4181fadd050000                 cmp        r10d, 0x5dd
00220 0f851a1a0000                   jne        0x7f0c73e64240
00226 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00230 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00234 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00239 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0023e 4585db                         test       r11d, r11d
00241 0f8441190000                   je         0x7f0c73e64188
00247 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00250 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00255 4585d2                         test       r10d, r10d
00258 0f862a190000                   jbe        0x7f0c73e64188
0025e 4183fa01                       cmp        r10d, 1
00262 0f8620190000                   jbe        0x7f0c73e64188
00268 4183fa02                       cmp        r10d, 2
0026c 0f8616190000                   jbe        0x7f0c73e64188
00272 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00277 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027b 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00280 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00285 458b5204                       mov        r10d, dword ptr [r10 + 4]
00289 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00291 4183c3f1                       add        r11d, -0xf
00295 4585db                         test       r11d, r11d
00298 0f8cea180000                   jl         0x7f0c73e64188
0029e 4183c2f1                       add        r10d, -0xf
002a2 4585d2                         test       r10d, r10d
002a5 0f8cdd180000                   jl         0x7f0c73e64188
002ab 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002b3 4183c3f9                       add        r11d, -7
002b7 4585db                         test       r11d, r11d
002ba 0f8cc8180000                   jl         0x7f0c73e64188
002c0 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002c8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002d0 4d63d3                         movsxd     r10, r11d
002d3 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
002db 458d53f1                       lea        r10d, [r11 - 0xf]
002df 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002e7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002ef 4983c2f1                       add        r10, -0xf
002f3 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
002fb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00300 458d43f1                       lea        r8d, [r11 - 0xf]
00304 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
0030c 4d63d3                         movsxd     r10, r11d
0030f 4983c2f1                       add        r10, -0xf
00313 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0031b e9dc010000                     jmp        0x7f0c73e62afc
00320 4533db                         xor        r11d, r11d
00323 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00328 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0032d 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00331 83fa03                         cmp        edx, 3
00334 0f8ec6030000                   jle        0x7f0c73e62d00
0033a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0033f 45895310                       mov        dword ptr [r11 + 0x10], r10d
00343 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00347 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0034c 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00350 448d52fd                       lea        r10d, [rdx - 3]
00354 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0035c 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00361 45895308                       mov        dword ptr [r11 + 8], r10d
00365 4c639c24a4000000               movsxd     r11, dword ptr [rsp + 0xa4]
0036d 4d63d5                         movsxd     r10, r13d
00370 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00375 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
0037a 4d03d0                         add        r10, r8
0037d 4d3bda                         cmp        r11, r10
00380 0f8f2a130000                   jg         0x7f0c73e63cb0
00386 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0038e 4585db                         test       r11d, r11d
00391 0f8e09120000                   jle        0x7f0c73e63ba0
00397 418bdd                         mov        ebx, r13d
0039a 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
0039e 48636c2478                     movsxd     rbp, dword ptr [rsp + 0x78]
003a3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
003a8 4403d3                         add        r10d, ebx
003ab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003b0 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
003b5 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
003bd 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
003c2 0f8f400c0000                   jg         0x7f0c73e63608
003c8 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003cd 0f8f35130000                   jg         0x7f0c73e63d08
003d3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003d8 4183fb10                       cmp        r11d, 0x10
003dc 0f8fce010000                   jg         0x7f0c73e62bb0
003e2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003e7 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
003ef 0f83e3100000                   jae        0x7f0c73e63ad8
003f5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003fa 458bca                         mov        r9d, r10d
003fd 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00402 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00409 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00411 0f8305110000                   jae        0x7f0c73e63b1c
00417 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0041c 4503d1                         add        r10d, r9d
0041f 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00427 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0042c c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
00433 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00438 4503dd                         add        r11d, r13d
0043b 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00443 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0044b 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
00453 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
0045b 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00460 4183fa10                       cmp        r10d, 0x10
00464 0f8f82130000                   jg         0x7f0c73e63dec
0046a 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00472 4183fb10                       cmp        r11d, 0x10
00476 0f8c5c030000                   jl         0x7f0c73e62dd8
0047c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00484 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0048c 0f83820f0000                   jae        0x7f0c73e63a14
00492 458bda                         mov        r11d, r10d
00495 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0049a c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
004a1 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
004a9 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
004b1 0f83b10f0000                   jae        0x7f0c73e63a68
004b7 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
004bf 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004c4 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
004cb 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
004d0 4503ea                         add        r13d, r10d
004d3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004d7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004dc 41ffc3                         inc        r11d
004df 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004e4 418502                         test       dword ptr [r10], eax
004e7 48894424f8                     mov        qword ptr [rsp - 8], rax
004ec 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
004f3 89442438                       mov        dword ptr [rsp + 0x38], eax
004f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004fc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00501 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00506 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0050b 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
00510 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00515 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0051a 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
0051f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00524 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00529 0f8d2c0a0000                   jge        0x7f0c73e6355b
0052f 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00534 0f839c0e0000                   jae        0x7f0c73e639d6
0053a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0053f 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
00544 4d8bd3                         mov        r10, r11
00547 49c1ea12                       shr        r10, 0x12
0054b 458bd2                         mov        r10d, r10d
0054e 4181e2ffff0300                 and        r10d, 0x3ffff
00555 4489542478                     mov        dword ptr [rsp + 0x78], r10d
0055a 4d8bd3                         mov        r10, r11
0055d 49c1fa24                       sar        r10, 0x24
00561 458bdb                         mov        r11d, r11d
00564 458bd2                         mov        r10d, r10d
00567 418bd2                         mov        edx, r10d
0056a 4181e3ffff0100                 and        r11d, 0x1ffff
00571 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00576 4585d2                         test       r10d, r10d
00579 0f8c41100000                   jl         0x7f0c73e63bc0
0057f 4585db                         test       r11d, r11d
00582 0f8498fdffff                   je         0x7f0c73e62920
00588 453bd9                         cmp        r11d, r9d
0058b 0f8e97fdffff                   jle        0x7f0c73e62928
00591 be45ffffff                     mov        esi, 0xffffff45
00596 418beb                         mov        ebp, r11d
00599 44890c24                       mov        dword ptr [rsp], r9d
0059d 666690                         nop        
005a0 c5f877                         vzeroupper 
005a3 e8b80ab6ff                     call       0x7f0c739c3660
005a8 0f1f8400a0060001               nop        dword ptr [rax + rax + 0x10006a0]
005b0 4183fb30                       cmp        r11d, 0x30
005b4 0f8ffd070000                   jg         0x7f0c73e633b7
005ba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005bf 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
005c7 0f8344130000                   jae        0x7f0c73e63f11
005cd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005d2 418bca                         mov        ecx, r10d
005d5 4d63c2                         movsxd     r8, r10d
005d8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
005dd c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
005e4 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
005ec 0f83b2130000                   jae        0x7f0c73e63fa4
005f2 458d5510                       lea        r10d, [r13 + 0x10]
005f6 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
005fe 4d63d5                         movsxd     r10, r13d
00601 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00606 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0060d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00615 443bdb                         cmp        r11d, ebx
00618 0f8dc6000000                   jge        0x7f0c73e62ce4
0061e 4d2bc2                         sub        r8, r10
00621 4d63db                         movsxd     r11, r11d
00624 4f8d1403                       lea        r10, [r11 + r8]
00628 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00630 0f8332140000                   jae        0x7f0c73e64068
00636 4c63d3                         movsxd     r10, ebx
00639 4d2bd3                         sub        r10, r11
0063c 4983c20f                       add        r10, 0xf
00640 4983e2f0                       and        r10, 0xfffffffffffffff0
00644 458bd2                         mov        r10d, r10d
00647 478d5c2a10                     lea        r11d, [r10 + r13 + 0x10]
0064c 4d63db                         movsxd     r11, r11d
0064f 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00654 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0065c 0f8306140000                   jae        0x7f0c73e64068
00662 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0066a 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00672 0f83f0130000                   jae        0x7f0c73e64068
00678 4983c3f0                       add        r11, -0x10
0067c 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00684 0f83de130000                   jae        0x7f0c73e64068
0068a 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00690 0f8f62140000                   jg         0x7f0c73e640f8
00696 448bd1                         mov        r10d, ecx
00699 452bd5                         sub        r10d, r13d
0069c 0f1f4000                       nop        dword ptr [rax]
006a0 458bc2                         mov        r8d, r10d
006a3 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
006ab 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006b0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
006b7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006bf 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
006c4 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
006cb 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
006d3 4183c010                       add        r8d, 0x10
006d7 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
006df 443bc3                         cmp        r8d, ebx
006e2 7cbc                           jl         0x7f0c73e62ca0
006e4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
006e9 4403d1                         add        r10d, ecx
006ec 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
006f4 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
006fb e943fdffff                     jmp        0x7f0c73e62a43
00700 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00705 4585c0                         test       r8d, r8d
00708 7407                           je         0x7f0c73e62d11
0070a 448d5aff                       lea        r11d, [rdx - 1]
0070e 418bd3                         mov        edx, r11d
00711 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00716 458b4b08                       mov        r9d, dword ptr [r11 + 8]
0071a 85d2                           test       edx, edx
0071c 7473                           je         0x7f0c73e62d91
0071e 83fa03                         cmp        edx, 3
00721 0f84180b0000                   je         0x7f0c73e6383f
00727 83fa02                         cmp        edx, 2
0072a 7772                           ja         0x7f0c73e62d9e
0072c 3b54244c                       cmp        edx, dword ptr [rsp + 0x4c]
00730 0f8332150000                   jae        0x7f0c73e64268
00736 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0073b 458b4c9308                     mov        r9d, dword ptr [r11 + rdx*4 + 8]
00740 85d2                           test       edx, edx
00742 7e44                           jle        0x7f0c73e62d88
00744 448d52ff                       lea        r10d, [rdx - 1]
00748 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
0074d 0f83b9170000                   jae        0x7f0c73e6450c
00753 33c9                           xor        ecx, ecx
00755 458bdb                         mov        r11d, r11d
00758 4183c3cc                       add        r11d, -0x34
0075c 41c1eb02                       shr        r11d, 2
00760 458d5413ff                     lea        r10d, [r11 + rdx - 1]
00765 4c63da                         movsxd     r11, edx
00768 41b804000000                   mov        r8d, 4
0076e c442b8f5d2                     bzhi       r10, r10, r8
00773 4d2bda                         sub        r11, r10
00776 49ffcb                         dec        r11
00779 4d85db                         test       r11, r11
0077c 4c0f4cd9                       cmovl      r11, rcx
00780 458bd3                         mov        r10d, r11d
00783 e9a7060000                     jmp        0x7f0c73e6342f
00788 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0078d 45894a08                       mov        dword ptr [r10 + 8], r9d
00791 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00799 e9c7fbffff                     jmp        0x7f0c73e62965
0079e 48beb0af72e200000000           movabs     rsi, 0xe272afb0
007a8 418bed                         mov        ebp, r13d
007ab 90                             nop        
007ac c5f877                         vzeroupper 
007af e8ac8aa9ff                     call       0x7f0c738fb860
007b4 0f1f8400ac080002               nop        dword ptr [rax + rax + 0x20008ac]
007bc 4885c0                         test       rax, rax
007bf 0f84a7150000                   je         0x7f0c73e6436c
007c5 488bf0                         mov        rsi, rax
007c8 c5f877                         vzeroupper 
007cb 4881c4f0000000                 add        rsp, 0xf0
007d2 5d                             pop        rbp
007d3 e98887b6ff                     jmp        0x7f0c739cb560
007d8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
007e0 4503da                         add        r11d, r10d
007e3 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
007eb 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
007f3 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
007f8 0f8dc6020000                   jge        0x7f0c73e630c4
007fe 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00806 4183c308                       add        r11d, 8
0080a 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0080f 4183fa08                       cmp        r10d, 8
00813 0f8da4010000                   jge        0x7f0c73e62fbd
00819 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00821 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00829 0f83f5190000                   jae        0x7f0c73e64824
0082f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00834 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
0083a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00842 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0084a 0f83901a0000                   jae        0x7f0c73e648e0
00850 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00855 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0085d 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00862 4183c303                       add        r11d, 3
00866 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0086e 41ffc2                         inc        r10d
00871 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00879 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00881 0f83b91a0000                   jae        0x7f0c73e64940
00887 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0088f 4183c303                       add        r11d, 3
00893 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
0089b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008a0 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
008a6 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
008ae 0f83fc1a0000                   jae        0x7f0c73e649b0
008b4 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008bc 43886c1809                     mov        byte ptr [r8 + r11 + 9], bpl
008c1 470fbe44100a                   movsx      r8d, byte ptr [r8 + r10 + 0xa]
008c7 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008cc 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
008d1 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
008d7 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
008dc 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
008e4 4183fb08                       cmp        r11d, 8
008e8 0f83221b0000                   jae        0x7f0c73e64a10
008ee 49baf0e870e200000000           movabs     r10, 0xe270e8f0
008f8 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
00900 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00905 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0090a 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0090f 4183fa04                       cmp        r10d, 4
00913 7e3f                           jle        0x7f0c73e62f54
00915 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
0091c 83c504                         add        ebp, 4
0091f 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00924 418bd1                         mov        edx, r9d
00927 90                             nop        
00928 c5f877                         vzeroupper 
0092b e83089a9ff                     call       0x7f0c738fb860
00930 0f1f8400280a0003               nop        dword ptr [rax + rax + 0x3000a28]
00938 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0093d 8bd5                           mov        edx, ebp
0093f 8bc8                           mov        ecx, eax
00941 666690                         nop        
00944 c5f877                         vzeroupper 
00947 e81489a9ff                     call       0x7f0c738fb860
0094c 0f1f8400440a0004               nop        dword ptr [rax + rax + 0x4000a44]
00954 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00959 4183fa08                       cmp        r10d, 8
0095d 7e51                           jle        0x7f0c73e62fb0
0095f 49ba18e970e200000000           movabs     r10, 0xe270e918
00969 8b542414                       mov        edx, dword ptr [rsp + 0x14]
0096d 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00975 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
0097a 83c208                         add        edx, 8
0097d 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00982 6690                           nop        
00984 c5f877                         vzeroupper 
00987 e8d488a9ff                     call       0x7f0c738fb860
0098c 0f1f8400840a0005               nop        dword ptr [rax + rax + 0x5000a84]
00994 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00999 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
0099d 488bc8                         mov        rcx, rax
009a0 c5f877                         vzeroupper 
009a3 e8b888a9ff                     call       0x7f0c738fb860
009a8 0f1f8400a00a0006               nop        dword ptr [rax + rax + 0x6000aa0]
009b0 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
009b8 e916fbffff                     jmp        0x7f0c73e62ad3
009bd 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009c2 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
009c9 666690                         nop        
009cc c5f877                         vzeroupper 
009cf e88c88a9ff                     call       0x7f0c738fb860
009d4 0f1f8400cc0a0007               nop        dword ptr [rax + rax + 0x7000acc]
009dc 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009e1 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
009e8 488bc8                         mov        rcx, rax
009eb 90                             nop        
009ec c5f877                         vzeroupper 
009ef e86c88a9ff                     call       0x7f0c738fb860
009f4 0f1f8400ec0a0008               nop        dword ptr [rax + rax + 0x8000aec]
009fc 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a04 4183c208                       add        r10d, 8
00a08 458bca                         mov        r9d, r10d
00a0b be95ffffff                     mov        esi, 0xffffff95
00a10 488b2c24                       mov        rbp, qword ptr [rsp]
00a14 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00a19 4c891424                       mov        qword ptr [rsp], r10
00a1d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a22 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a27 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a2c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a31 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a36 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a3b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a40 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a45 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a4a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a4f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00a54 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a59 48ff742440                     push       qword ptr [rsp + 0x40]
00a5e 488f442438                     pop        qword ptr [rsp + 0x38]
00a63 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a68 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00a6d 48ff742450                     push       qword ptr [rsp + 0x50]
00a72 488f442448                     pop        qword ptr [rsp + 0x48]
00a77 48ff742458                     push       qword ptr [rsp + 0x58]
00a7c 488f442450                     pop        qword ptr [rsp + 0x50]
00a81 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00a86 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00a8b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a90 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00a95 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00a9a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00a9f 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00aa7 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00aac 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ab1 666690                         nop        
00ab4 c5f877                         vzeroupper 
00ab7 e8a405b6ff                     call       0x7f0c739c3660
00abc 0f1f8400b40b0009               nop        dword ptr [rax + rax + 0x9000bb4]
00ac4 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00ac9 4183fb30                       cmp        r11d, 0x30
00acd 0f8f1c020000                   jg         0x7f0c73e632ef
00ad3 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00ada 83c5f9                         add        ebp, -7
00add 89ac24a4000000                 mov        dword ptr [rsp + 0xa4], ebp
00ae4 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00aec 443bd5                         cmp        r10d, ebp
00aef 0f83d3120000                   jae        0x7f0c73e643c8
00af5 418bea                         mov        ebp, r10d
00af8 89ac24b4000000                 mov        dword ptr [rsp + 0xb4], ebp
00aff 4863ed                         movsxd     rbp, ebp
00b02 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00b0a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b0f 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00b14 4889ac24c8000000               mov        qword ptr [rsp + 0xc8], rbp
00b1c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b24 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
00b2c 0f831e130000                   jae        0x7f0c73e64450
00b32 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b3a 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00b42 4963eb                         movsxd     rbp, r11d
00b45 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
00b4d 488d4d08                       lea        rcx, [rbp + 8]
00b51 48be28c122e200000000           movabs     rsi, 0xe222c128
00b5b 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00b60 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00b68 4533c9                         xor        r9d, r9d
00b6b 90                             nop        
00b6c c5f877                         vzeroupper 
00b6f e8ec7ca9ff                     call       0x7f0c738fae60
00b74 0f1f84006c0c000a               nop        dword ptr [rax + rax + 0xa000c6c]
00b7c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b84 4183c208                       add        r10d, 8
00b88 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00b90 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00b98 0f8d3f010000                   jge        0x7f0c73e632dd
00b9e 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ba6 482bac24d0000000               sub        rbp, qword ptr [rsp + 0xd0]
00bae 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00bb6 4983c0f9                       add        r8, -7
00bba 4d63da                         movsxd     r11, r10d
00bbd 4d8d142b                       lea        r10, [r11 + rbp]
00bc1 4d3bd0                         cmp        r10, r8
00bc4 0f8352140000                   jae        0x7f0c73e6461c
00bca 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00bd2 4d2bd3                         sub        r10, r11
00bd5 4983c207                       add        r10, 7
00bd9 4983e2f8                       and        r10, 0xfffffffffffffff8
00bdd 458bd2                         mov        r10d, r10d
00be0 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
00be8 478d540a08                     lea        r10d, [r10 + r9 + 8]
00bed 4d63d2                         movsxd     r10, r10d
00bf0 4d8d5c2af8                     lea        r11, [r10 + rbp - 8]
00bf5 4d3bd8                         cmp        r11, r8
00bf8 0f831e140000                   jae        0x7f0c73e6461c
00bfe 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c06 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00c0e 0f8308140000                   jae        0x7f0c73e6461c
00c14 4983c2f8                       add        r10, -8
00c18 4d3bd0                         cmp        r10, r8
00c1b 0f83fb130000                   jae        0x7f0c73e6461c
00c21 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c29 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c30 0f8fae140000                   jg         0x7f0c73e646e4
00c36 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00c3d 412be9                         sub        ebp, r9d
00c40 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00c44 660f1f440000                   nop        word ptr [rax + rax]
00c4a 660f1f440000                   nop        word ptr [rax + rax]
00c50 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c58 4963cb                         movsxd     rcx, r11d
00c5b 4883c108                       add        rcx, 8
00c5f 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00c63 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00c6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00c6f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00c74 48be28c122e200000000           movabs     rsi, 0xe222c128
00c7e 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00c83 4533c9                         xor        r9d, r9d
00c86 6690                           nop        
00c88 c5f877                         vzeroupper 
00c8b e8d07ba9ff                     call       0x7f0c738fae60
00c90 0f1f8400880d000b               nop        dword ptr [rax + rax + 0xb000d88]
00c98 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
00ca0 4183c208                       add        r10d, 8
00ca4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00cac 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00cb4 7c9a                           jl         0x7f0c73e63250
00cb6 eb25                           jmp        0x7f0c73e632dd
00cb8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00cbd 4d63d2                         movsxd     r10, r10d
00cc0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cc7 c442a8f5db                     bzhi       r11, r11, r10
00ccc c4c1fb92fb                     kmovq      k7, r11
00cd1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cd7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cdd 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00ce5 44036c2478                     add        r13d, dword ptr [rsp + 0x78]
00cea e9e4f7ffff                     jmp        0x7f0c73e62ad3
00cef 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00cf7 4585d2                         test       r10d, r10d
00cfa 0f8cb8110000                   jl         0x7f0c73e644b8
00d00 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d08 4585db                         test       r11d, r11d
00d0b 0f8ca7110000                   jl         0x7f0c73e644b8
00d11 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d16 44039424b4000000               add        r10d, dword ptr [rsp + 0xb4]
00d1e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00d26 453bda                         cmp        r11d, r10d
00d29 0f8289110000                   jb         0x7f0c73e644b8
00d2f 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d37 0f827b110000                   jb         0x7f0c73e644b8
00d3d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d42 4585d2                         test       r10d, r10d
00d45 7496                           je         0x7f0c73e632dd
00d47 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d4c 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00d54 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00d59 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00d61 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00d66 4883fd20                       cmp        rbp, 0x20
00d6a 0f8648ffffff                   jbe        0x7f0c73e632b8
00d70 488bd5                         mov        rdx, rbp
00d73 c5f877                         vzeroupper 
00d76 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
00d80 41ffd2                         call       r10
00d83 0f1f840000000000               nop        dword ptr [rax + rax]
00d8b e94dffffff                     jmp        0x7f0c73e632dd
00d90 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d95 4d63d3                         movsxd     r10, r11d
00d98 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d9f c442a8f5db                     bzhi       r11, r11, r10
00da4 c4c1fb92fb                     kmovq      k7, r11
00da9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00daf 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00db5 eb66                           jmp        0x7f0c73e6341d
00db7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00dbc 4585db                         test       r11d, r11d
00dbf 0f8cbf0f0000                   jl         0x7f0c73e64384
00dc5 4585ed                         test       r13d, r13d
00dc8 0f8cb60f0000                   jl         0x7f0c73e64384
00dce 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00dd3 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00ddb 0f82a30f0000                   jb         0x7f0c73e64384
00de1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00de9 443bdb                         cmp        r11d, ebx
00dec 0f82920f0000                   jb         0x7f0c73e64384
00df2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00df7 4585d2                         test       r10d, r10d
00dfa 7421                           je         0x7f0c73e6341d
00dfc 4983f820                       cmp        r8, 0x20
00e00 768e                           jbe        0x7f0c73e63390
00e02 498bd0                         mov        rdx, r8
00e05 c5f877                         vzeroupper 
00e08 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
00e12 41ffd2                         call       r10
00e15 0f1f840000000000               nop        dword ptr [rax + rax]
00e1d 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00e24 e91af6ffff                     jmp        0x7f0c73e62a43
00e29 666690                         nop        
00e2c 418bd3                         mov        edx, r11d
00e2f 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00e34 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00e39 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00e3e 4489449108                     mov        dword ptr [rcx + rdx*4 + 8], r8d
00e43 448d5aff                       lea        r11d, [rdx - 1]
00e47 453bda                         cmp        r11d, r10d
00e4a 7fe0                           jg         0x7f0c73e6342c
00e4c 4183fb3f                       cmp        r11d, 0x3f
00e50 0f8ebe110000                   jle        0x7f0c73e64614
00e56 448bd2                         mov        r10d, edx
00e59 41ffca                         dec        r10d
00e5c 418bca                         mov        ecx, r10d
00e5f eb12                           jmp        0x7f0c73e63473
00e61 0f1f840000000000               nop        dword ptr [rax + rax]
00e69 0f1f8000000000                 nop        dword ptr [rax]
00e70 418bca                         mov        ecx, r10d
00e73 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00e78 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00e83 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00e8e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00e99 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00ea4 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00eaf 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00eba 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00ec5 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00ed0 448d51c0                       lea        r10d, [rcx - 0x40]
00ed4 4183fa3f                       cmp        r10d, 0x3f
00ed8 7f96                           jg         0x7f0c73e63470
00eda 4183fa0f                       cmp        r10d, 0xf
00ede 7e2d                           jle        0x7f0c73e6350d
00ee0 448bd1                         mov        r10d, ecx
00ee3 4183c2c0                       add        r10d, -0x40
00ee7 90                             nop        
00ee8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00eed 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00ef8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00f03 4183c2f0                       add        r10d, -0x10
00f07 4183fa0f                       cmp        r10d, 0xf
00f0b 7fdb                           jg         0x7f0c73e634e8
00f0d 4585d2                         test       r10d, r10d
00f10 0f8e72f8ffff                   jle        0x7f0c73e62d88
00f16 6690                           nop        
00f18 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00f1d 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00f22 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00f27 47895c9008                     mov        dword ptr [r8 + r10*4 + 8], r11d
00f2c 41ffca                         dec        r10d
00f2f 4585d2                         test       r10d, r10d
00f32 7fe4                           jg         0x7f0c73e63518
00f34 e94ff8ffff                     jmp        0x7f0c73e62d88
00f39 4d63d1                         movsxd     r10, r9d
00f3c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f43 c442a8f5db                     bzhi       r11, r11, r10
00f48 c4c1fb92fb                     kmovq      k7, r11
00f4d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f53 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f59 eb6d                           jmp        0x7f0c73e635c8
00f5b 4585d2                         test       r10d, r10d
00f5e 0f8c48150000                   jl         0x7f0c73e64aac
00f64 4585ed                         test       r13d, r13d
00f67 0f8c3f150000                   jl         0x7f0c73e64aac
00f6d 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f72 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00f77 0f822f150000                   jb         0x7f0c73e64aac
00f7d 438d2c29                       lea        ebp, [r9 + r13]
00f81 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00f89 443bd5                         cmp        r10d, ebp
00f8c 0f821a150000                   jb         0x7f0c73e64aac
00f92 4585c9                         test       r9d, r9d
00f95 0f8c11150000                   jl         0x7f0c73e64aac
00f9b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00fa0 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00fa5 7421                           je         0x7f0c73e635c8
00fa7 4963d1                         movsxd     rdx, r9d
00faa 4883fa20                       cmp        rdx, 0x20
00fae 7689                           jbe        0x7f0c73e63539
00fb0 c5f877                         vzeroupper 
00fb3 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
00fbd 41ffd2                         call       r10
00fc0 0f1f840000000000               nop        dword ptr [rax + rax]
00fc8 4c8b1424                       mov        r10, qword ptr [rsp]
00fcc 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00fd0 c5f877                         vzeroupper 
00fd3 4881c4f0000000                 add        rsp, 0xf0
00fda 5d                             pop        rbp
00fdb 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00fdf 0f87db160000                   ja         0x7f0c73e64cc0
00fe5 c3                             ret        
00fe6 4d63d2                         movsxd     r10, r10d
00fe9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ff0 c442a8f5db                     bzhi       r11, r11, r10
00ff5 c4c1fb92fb                     kmovq      k7, r11
00ffa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01000 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01006 eb74                           jmp        0x7f0c73e6367c
01008 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0100d 4585db                         test       r11d, r11d
01010 0f84b8030000                   je         0x7f0c73e639ce
01016 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0101b 4585db                         test       r11d, r11d
0101e 0f8cac140000                   jl         0x7f0c73e64ad0
01024 4585ed                         test       r13d, r13d
01027 0f8ca3140000                   jl         0x7f0c73e64ad0
0102d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01032 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0103a 0f8290140000                   jb         0x7f0c73e64ad0
01040 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01048 443bdb                         cmp        r11d, ebx
0104b 0f827f140000                   jb         0x7f0c73e64ad0
01051 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01056 4585d2                         test       r10d, r10d
01059 7421                           je         0x7f0c73e6367c
0105b 4983f820                       cmp        r8, 0x20
0105f 7685                           jbe        0x7f0c73e635e6
01061 498bd0                         mov        rdx, r8
01064 c5f877                         vzeroupper 
01067 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
01071 41ffd2                         call       r10
01074 0f1f840000000000               nop        dword ptr [rax + rax]
0107c 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01081 4585db                         test       r11d, r11d
01084 0f8eaa010000                   jle        0x7f0c73e63834
0108a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0108f 498d741a08                     lea        rsi, [r10 + rbx + 8]
01094 458d341b                       lea        r14d, [r11 + rbx]
01098 448bd3                         mov        r10d, ebx
0109b 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
010a3 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
010ab 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
010b0 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
010b8 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
010bd 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
010c5 453bd3                         cmp        r10d, r11d
010c8 0f8de4000000                   jge        0x7f0c73e637b2
010ce 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
010d6 458bd3                         mov        r10d, r11d
010d9 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
010e1 450f4fd0                       cmovg      r10d, r8d
010e5 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
010ed 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
010f5 4585d2                         test       r10d, r10d
010f8 0f8c3e140000                   jl         0x7f0c73e64b3c
010fe 85db                           test       ebx, ebx
01100 0f8c36140000                   jl         0x7f0c73e64b3c
01106 458bda                         mov        r11d, r10d
01109 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
01111 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
01119 453bc3                         cmp        r8d, r11d
0111c 0f821a140000                   jb         0x7f0c73e64b3c
01122 448bd3                         mov        r10d, ebx
01125 44039424a4000000               add        r10d, dword ptr [rsp + 0xa4]
0112d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01135 453bc2                         cmp        r8d, r10d
01138 0f82fe130000                   jb         0x7f0c73e64b3c
0113e 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01146 4585d2                         test       r10d, r10d
01149 0f8ced130000                   jl         0x7f0c73e64b3c
0114f 4585d2                         test       r10d, r10d
01152 742c                           je         0x7f0c73e63780
01154 4963d2                         movsxd     rdx, r10d
01157 4883fa20                       cmp        rdx, 0x20
0115b 773b                           ja         0x7f0c73e63798
0115d 458bda                         mov        r11d, r10d
01160 4d63d3                         movsxd     r10, r11d
01163 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0116a c442a8f5db                     bzhi       r11, r11, r10
0116f c4c1fb92fb                     kmovq      k7, r11
01174 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0117a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01180 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01188 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0118d 0f8c69010000                   jl         0x7f0c73e638fc
01193 e99f000000                     jmp        0x7f0c73e63837
01198 c5f877                         vzeroupper 
0119b 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
011a5 41ffd2                         call       r10
011a8 0f1f840000000000               nop        dword ptr [rax + rax]
011b0 ebce                           jmp        0x7f0c73e63780
011b2 4585c0                         test       r8d, r8d
011b5 0f8c35140000                   jl         0x7f0c73e64bf0
011bb 85db                           test       ebx, ebx
011bd 0f8c2d140000                   jl         0x7f0c73e64bf0
011c3 4503d8                         add        r11d, r8d
011c6 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
011ce 453bd3                         cmp        r10d, r11d
011d1 0f8219140000                   jb         0x7f0c73e64bf0
011d7 453bd6                         cmp        r10d, r14d
011da 0f8210140000                   jb         0x7f0c73e64bf0
011e0 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
011e5 4585d2                         test       r10d, r10d
011e8 744d                           je         0x7f0c73e63837
011ea 4883fd20                       cmp        rbp, 0x20
011ee 7727                           ja         0x7f0c73e63817
011f0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
011f5 4d63d3                         movsxd     r10, r11d
011f8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
011ff c442a8f5db                     bzhi       r11, r11, r10
01204 c4c1fb92fb                     kmovq      k7, r11
01209 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0120f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01215 eb20                           jmp        0x7f0c73e63837
01217 488bd5                         mov        rdx, rbp
0121a c5f877                         vzeroupper 
0121d 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
01227 41ffd2                         call       r10
0122a 0f1f840000000000               nop        dword ptr [rax + rax]
01232 eb03                           jmp        0x7f0c73e63837
01234 448bf3                         mov        r14d, ebx
01237 458bee                         mov        r13d, r14d
0123a e994f2ffff                     jmp        0x7f0c73e62ad3
0123f 41ffc9                         dec        r9d
01242 4585c9                         test       r9d, r9d
01245 7e1f                           jle        0x7f0c73e63866
01247 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0124c 45895310                       mov        dword ptr [r11 + 0x10], r10d
01250 458b5b08                       mov        r11d, dword ptr [r11 + 8]
01254 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01259 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0125d 45894a08                       mov        dword ptr [r10 + 8], r9d
01261 e92bf5ffff                     jmp        0x7f0c73e62d91
01266 48be80af72e200000000           movabs     rsi, 0xe272af80
01270 418bed                         mov        ebp, r13d
01273 90                             nop        
01274 c5f877                         vzeroupper 
01277 e8e47fa9ff                     call       0x7f0c738fb860
0127c 0f1f84007413000c               nop        dword ptr [rax + rax + 0xc001374]
01284 4885c0                         test       rax, rax
01287 0f8538f5ffff                   jne        0x7f0c73e62dc5
0128d bef6ffffff                     mov        esi, 0xfffffff6
01292 6690                           nop        
01294 c5f877                         vzeroupper 
01297 e8c4fdb5ff                     call       0x7f0c739c3660
0129c 0f1f84009413000d               nop        dword ptr [rax + rax + 0xd001394]
012a4 448bd5                         mov        r10d, ebp
012a7 4d63d2                         movsxd     r10, r10d
012aa 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012b1 c442a8f5db                     bzhi       r11, r11, r10
012b6 c4c1fb92fb                     kmovq      k7, r11
012bb 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012c1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012c7 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
012cf 4403d5                         add        r10d, ebp
012d2 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
012da 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
012de 418502                         test       dword ptr [r10], eax
012e1 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
012e9 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
012ee 0f8d43ffffff                   jge        0x7f0c73e63837
012f4 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
012fc 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01304 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
0130c 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01314 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
01318 2bac24a4000000                 sub        ebp, dword ptr [rsp + 0xa4]
0131f 3bac24a4000000                 cmp        ebp, dword ptr [rsp + 0xa4]
01326 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0132e 410f4feb                       cmovg      ebp, r11d
01332 4585d2                         test       r10d, r10d
01335 0f8c710e0000                   jl         0x7f0c73e647ac
0133b 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01343 4585db                         test       r11d, r11d
01346 0f8c600e0000                   jl         0x7f0c73e647ac
0134c 458d1c2a                       lea        r11d, [r10 + rbp]
01350 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01358 453bd3                         cmp        r10d, r11d
0135b 0f824b0e0000                   jb         0x7f0c73e647ac
01361 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
01369 4403ed                         add        r13d, ebp
0136c 453bd5                         cmp        r10d, r13d
0136f 0f82370e0000                   jb         0x7f0c73e647ac
01375 85ed                           test       ebp, ebp
01377 0f8c2f0e0000                   jl         0x7f0c73e647ac
0137d 85ed                           test       ebp, ebp
0137f 0f8442ffffff                   je         0x7f0c73e638c7
01385 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0138a 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01392 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
01397 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
0139f 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
013a4 4863d5                         movsxd     rdx, ebp
013a7 4883fa20                       cmp        rdx, 0x20
013ab 0f86f3feffff                   jbe        0x7f0c73e638a4
013b1 c5f877                         vzeroupper 
013b4 49ba204f8e730c7f0000           movabs     r10, 0x7f0c738e4f20
013be 41ffd2                         call       r10
013c1 0f1f840000000000               nop        dword ptr [rax + rax]
013c9 e9f9feffff                     jmp        0x7f0c73e638c7
013ce 418bdd                         mov        ebx, r13d
013d1 e9a6fcffff                     jmp        0x7f0c73e6367c
013d6 bee4ffffff                     mov        esi, 0xffffffe4
013db 488b2c24                       mov        rbp, qword ptr [rsp]
013df 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013e4 4c891424                       mov        qword ptr [rsp], r10
013e8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013ed 4489542408                     mov        dword ptr [rsp + 8], r10d
013f2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013f7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013fc 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01401 666690                         nop        
01404 c5f877                         vzeroupper 
01407 e854fcb5ff                     call       0x7f0c739c3660
0140c 0f1f84000415000f               nop        dword ptr [rax + rax + 0xf001504]
01414 bee4ffffff                     mov        esi, 0xffffffe4
01419 488b2c24                       mov        rbp, qword ptr [rsp]
0141d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01422 4c891424                       mov        qword ptr [rsp], r10
01426 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0142b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01430 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01435 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0143a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0143f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01444 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01449 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0144e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01453 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01458 c5f877                         vzeroupper 
0145b e800fcb5ff                     call       0x7f0c739c3660
01460 0f1f840058150010               nop        dword ptr [rax + rax + 0x10001558]
01468 bee4ffffff                     mov        esi, 0xffffffe4
0146d 488b2c24                       mov        rbp, qword ptr [rsp]
01471 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01476 4c891424                       mov        qword ptr [rsp], r10
0147a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0147f 4489542408                     mov        dword ptr [rsp + 8], r10d
01484 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01489 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0148e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01493 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01498 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0149d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014a2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014ac 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
014b1 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
014b9 4489542474                     mov        dword ptr [rsp + 0x74], r10d
014be c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
014c7 90                             nop        
014c8 c5f877                         vzeroupper 
014cb e890fbb5ff                     call       0x7f0c739c3660
014d0 0f1f8400c8150011               nop        dword ptr [rax + rax + 0x110015c8]
014d8 bee4ffffff                     mov        esi, 0xffffffe4
014dd 488b2c24                       mov        rbp, qword ptr [rsp]
014e1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014e6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014eb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014f0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014f5 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
014fa 48894424f8                     mov        qword ptr [rsp - 8], rax
014ff 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01503 89442470                       mov        dword ptr [rsp + 0x70], eax
01507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150c c5f877                         vzeroupper 
0150f e84cfbb5ff                     call       0x7f0c739c3660
01514 0f1f84000c160012               nop        dword ptr [rax + rax + 0x1200160c]
0151c bee4ffffff                     mov        esi, 0xffffffe4
01521 488b2c24                       mov        rbp, qword ptr [rsp]
01525 4c891c24                       mov        qword ptr [rsp], r11
01529 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0152e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01533 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01538 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0153d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01542 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01547 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0154c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01551 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01556 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0155b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01560 48894424f8                     mov        qword ptr [rsp - 8], rax
01565 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01569 89442470                       mov        dword ptr [rsp + 0x70], eax
0156d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01572 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01577 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0157f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01584 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0158d 666690                         nop        
01590 c5f877                         vzeroupper 
01593 e8c8fab5ff                     call       0x7f0c739c3660
01598 0f1f840090160013               nop        dword ptr [rax + rax + 0x13001690]
015a0 be45ffffff                     mov        esi, 0xffffff45
015a5 488b2c24                       mov        rbp, qword ptr [rsp]
015a9 4c89542408                     mov        qword ptr [rsp + 8], r10
015ae 6690                           nop        
015b0 c5f877                         vzeroupper 
015b3 e8a8fab5ff                     call       0x7f0c739c3660
015b8 0f1f8400b0160014               nop        dword ptr [rax + rax + 0x140016b0]
015c0 be45ffffff                     mov        esi, 0xffffff45
015c5 488b2c24                       mov        rbp, qword ptr [rsp]
015c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015ce 4c891424                       mov        qword ptr [rsp], r10
015d2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015d7 4489542408                     mov        dword ptr [rsp + 8], r10d
015dc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
015e1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015f0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015fa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015ff 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01604 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01609 48894424f8                     mov        qword ptr [rsp - 8], rax
0160e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01612 89442434                       mov        dword ptr [rsp + 0x34], eax
01616 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161b 48894424f8                     mov        qword ptr [rsp - 8], rax
01620 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01624 89442438                       mov        dword ptr [rsp + 0x38], eax
01628 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162d 48894424f8                     mov        qword ptr [rsp - 8], rax
01632 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01636 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0163a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163f 48ff742450                     push       qword ptr [rsp + 0x50]
01644 488f442448                     pop        qword ptr [rsp + 0x48]
01649 48ff742458                     push       qword ptr [rsp + 0x58]
0164e 488f442450                     pop        qword ptr [rsp + 0x50]
01653 48894424f8                     mov        qword ptr [rsp - 8], rax
01658 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0165c 89442458                       mov        dword ptr [rsp + 0x58], eax
01660 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01665 48894424f8                     mov        qword ptr [rsp - 8], rax
0166a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0166e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01672 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01677 48894424f8                     mov        qword ptr [rsp - 8], rax
0167c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01680 89442460                       mov        dword ptr [rsp + 0x60], eax
01684 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01689 48894424f8                     mov        qword ptr [rsp - 8], rax
0168e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01692 89442464                       mov        dword ptr [rsp + 0x64], eax
01696 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169b 8954246c                       mov        dword ptr [rsp + 0x6c], edx
0169f 90                             nop        
016a0 c5f877                         vzeroupper 
016a3 e8b8f9b5ff                     call       0x7f0c739c3660
016a8 0f1f8400a0170015               nop        dword ptr [rax + rax + 0x150017a0]
016b0 4d3bda                         cmp        r11, r10
016b3 bdffffffff                     mov        ebp, 0xffffffff
016b8 7c08                           jl         0x7f0c73e63cc2
016ba 400f95c5                       setne      bpl
016be 400fb6ed                       movzx      ebp, bpl
016c2 be45ffffff                     mov        esi, 0xffffff45
016c7 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
016cc 4489442414                     mov        dword ptr [rsp + 0x14], r8d
016d1 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
016d6 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
016db 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
016e0 48894424f8                     mov        qword ptr [rsp - 8], rax
016e5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
016e9 89442470                       mov        dword ptr [rsp + 0x70], eax
016ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f2 4c89542478                     mov        qword ptr [rsp + 0x78], r10
016f7 90                             nop        
016f8 c5f877                         vzeroupper 
016fb e860f9b5ff                     call       0x7f0c739c3660
01700 0f1f8400f8170016               nop        dword ptr [rax + rax + 0x160017f8]
01708 be45ffffff                     mov        esi, 0xffffff45
0170d 488b2c24                       mov        rbp, qword ptr [rsp]
01711 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01716 4c891424                       mov        qword ptr [rsp], r10
0171a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0171f 4489542408                     mov        dword ptr [rsp + 8], r10d
01724 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01729 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0172e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01733 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01738 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0173d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01742 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01747 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0174c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01751 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01756 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0175b 48894424f8                     mov        qword ptr [rsp - 8], rax
01760 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01764 89442434                       mov        dword ptr [rsp + 0x34], eax
01768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176d 48894424f8                     mov        qword ptr [rsp - 8], rax
01772 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01776 89442438                       mov        dword ptr [rsp + 0x38], eax
0177a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177f 48894424f8                     mov        qword ptr [rsp - 8], rax
01784 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01788 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0178c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01791 48ff742450                     push       qword ptr [rsp + 0x50]
01796 488f442448                     pop        qword ptr [rsp + 0x48]
0179b 48ff742458                     push       qword ptr [rsp + 0x58]
017a0 488f442450                     pop        qword ptr [rsp + 0x50]
017a5 48894424f8                     mov        qword ptr [rsp - 8], rax
017aa 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017ae 89442458                       mov        dword ptr [rsp + 0x58], eax
017b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b7 48894424f8                     mov        qword ptr [rsp - 8], rax
017bc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017c0 89442460                       mov        dword ptr [rsp + 0x60], eax
017c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c9 48894424f8                     mov        qword ptr [rsp - 8], rax
017ce 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017d2 89442468                       mov        dword ptr [rsp + 0x68], eax
017d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017db 90                             nop        
017dc c5f877                         vzeroupper 
017df e87cf8b5ff                     call       0x7f0c739c3660
017e4 0f1f8400dc180017               nop        dword ptr [rax + rax + 0x170018dc]
017ec be45ffffff                     mov        esi, 0xffffff45
017f1 488b2c24                       mov        rbp, qword ptr [rsp]
017f5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017fa 4c891424                       mov        qword ptr [rsp], r10
017fe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01803 44895c2408                     mov        dword ptr [rsp + 8], r11d
01808 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0180d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01812 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01817 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0181c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01821 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01826 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0182b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01830 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01835 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01843 89442438                       mov        dword ptr [rsp + 0x38], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 48894424f8                     mov        qword ptr [rsp - 8], rax
01851 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01855 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01859 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185e 48ff742450                     push       qword ptr [rsp + 0x50]
01863 488f442448                     pop        qword ptr [rsp + 0x48]
01868 48ff742458                     push       qword ptr [rsp + 0x58]
0186d 488f442450                     pop        qword ptr [rsp + 0x50]
01872 48894424f8                     mov        qword ptr [rsp - 8], rax
01877 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0187b 89442458                       mov        dword ptr [rsp + 0x58], eax
0187f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01884 48894424f8                     mov        qword ptr [rsp - 8], rax
01889 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0188d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01896 48894424f8                     mov        qword ptr [rsp - 8], rax
0189b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0189f 89442460                       mov        dword ptr [rsp + 0x60], eax
018a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
018ad 4489542464                     mov        dword ptr [rsp + 0x64], r10d
018b2 6690                           nop        
018b4 c5f877                         vzeroupper 
018b7 e8a4f7b5ff                     call       0x7f0c739c3660
018bc 0f1f8400b4190018               nop        dword ptr [rax + rax + 0x180019b4]
018c4 4533d2                         xor        r10d, r10d
018c7 4c891424                       mov        qword ptr [rsp], r10
018cb e978e8ffff                     jmp        0x7f0c73e62748
018d0 4533d2                         xor        r10d, r10d
018d3 4c89542408                     mov        qword ptr [rsp + 8], r10
018d8 e999e8ffff                     jmp        0x7f0c73e62776
018dd 4533d2                         xor        r10d, r10d
018e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018e5 e9bae8ffff                     jmp        0x7f0c73e627a4
018ea 4533d2                         xor        r10d, r10d
018ed 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018f2 e9dbe8ffff                     jmp        0x7f0c73e627d2
018f7 4533d2                         xor        r10d, r10d
018fa 4c89542470                     mov        qword ptr [rsp + 0x70], r10
018ff e9fce8ffff                     jmp        0x7f0c73e62800
01904 4533d2                         xor        r10d, r10d
01907 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0190c e91ae9ffff                     jmp        0x7f0c73e6282b
01911 bee4ffffff                     mov        esi, 0xffffffe4
01916 488b2c24                       mov        rbp, qword ptr [rsp]
0191a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0191f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01924 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01929 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01937 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01949 89442460                       mov        dword ptr [rsp + 0x60], eax
0194d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0195b 89442464                       mov        dword ptr [rsp + 0x64], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0196d 89442468                       mov        dword ptr [rsp + 0x68], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 48894424f8                     mov        qword ptr [rsp - 8], rax
0197b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0197f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01988 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0198c 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01991 666690                         nop        
01994 c5f877                         vzeroupper 
01997 e8c4f6b5ff                     call       0x7f0c739c3660
0199c 0f1f8400941a0019               nop        dword ptr [rax + rax + 0x19001a94]
019a4 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
019ad bee4ffffff                     mov        esi, 0xffffffe4
019b2 488b2c24                       mov        rbp, qword ptr [rsp]
019b6 4c891424                       mov        qword ptr [rsp], r10
019ba 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019bf 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019c9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019ce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019d3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019d8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019dd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019e2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
019e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019ec 48894424f8                     mov        qword ptr [rsp - 8], rax
019f1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019f5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
019f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01a03 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a07 89442460                       mov        dword ptr [rsp + 0x60], eax
01a0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a10 48894424f8                     mov        qword ptr [rsp - 8], rax
01a15 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a19 89442464                       mov        dword ptr [rsp + 0x64], eax
01a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a2b 89442468                       mov        dword ptr [rsp + 0x68], eax
01a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a34 48894424f8                     mov        qword ptr [rsp - 8], rax
01a39 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a3d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a46 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01a4a 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01a4e 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01a56 6690                           nop        
01a58 c5f877                         vzeroupper 
01a5b e800f6b5ff                     call       0x7f0c739c3660
01a60 0f1f8400581b001a               nop        dword ptr [rax + rax + 0x1a001b58]
01a68 8be9                           mov        ebp, ecx
01a6a 83c510                         add        ebp, 0x10
01a6d be6effffff                     mov        esi, 0xffffff6e
01a72 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a77 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a7c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a81 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a86 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01a8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a93 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aa5 89442460                       mov        dword ptr [rsp + 0x60], eax
01aa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aae 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ab7 89442464                       mov        dword ptr [rsp + 0x64], eax
01abb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ac9 89442468                       mov        dword ptr [rsp + 0x68], eax
01acd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad7 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01adb 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01adf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae4 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01ae8 c5f877                         vzeroupper 
01aeb e870f5b5ff                     call       0x7f0c739c3660
01af0 0f1f8400e81b001b               nop        dword ptr [rax + rax + 0x1b001be8]
01af8 8be9                           mov        ebp, ecx
01afa 83c510                         add        ebp, 0x10
01afd be66ffffff                     mov        esi, 0xffffff66
01b02 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b07 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b0c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b11 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b16 894c2438                       mov        dword ptr [rsp + 0x38], ecx
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
01b74 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01b78 c5f877                         vzeroupper 
01b7b e8e0f4b5ff                     call       0x7f0c739c3660
01b80 0f1f8400781c001c               nop        dword ptr [rax + rax + 0x1c001c78]
01b88 bebeffffff                     mov        esi, 0xffffffbe
01b8d 488b2c24                       mov        rbp, qword ptr [rsp]
01b91 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b96 4c891424                       mov        qword ptr [rsp], r10
01b9a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b9f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ba4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ba9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bb3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bb8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bbd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bc2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bc7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01bcc 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01bd1 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bda 89442434                       mov        dword ptr [rsp + 0x34], eax
01bde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be3 48894424f8                     mov        qword ptr [rsp - 8], rax
01be8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01bec 89442438                       mov        dword ptr [rsp + 0x38], eax
01bf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfa 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01bfe 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c07 48ff742450                     push       qword ptr [rsp + 0x50]
01c0c 488f442448                     pop        qword ptr [rsp + 0x48]
01c11 48ff742458                     push       qword ptr [rsp + 0x58]
01c16 488f442450                     pop        qword ptr [rsp + 0x50]
01c1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c20 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c24 89442458                       mov        dword ptr [rsp + 0x58], eax
01c28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2d 666690                         nop        
01c30 c5f877                         vzeroupper 
01c33 e828f4b5ff                     call       0x7f0c739c3660
01c38 0f1f8400301d001d               nop        dword ptr [rax + rax + 0x1d001d30]
01c40 be85ffffff                     mov        esi, 0xffffff85
01c45 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01c49 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c4e 44891424                       mov        dword ptr [rsp], r10d
01c52 44896c2404                     mov        dword ptr [rsp + 4], r13d
01c57 90                             nop        
01c58 c5f877                         vzeroupper 
01c5b e800f4b5ff                     call       0x7f0c739c3660
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
01cac 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01cb1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01cba 89442434                       mov        dword ptr [rsp + 0x34], eax
01cbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ccc 89442438                       mov        dword ptr [rsp + 0x38], eax
01cd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01cde 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ce2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce7 48ff742450                     push       qword ptr [rsp + 0x50]
01cec 488f442448                     pop        qword ptr [rsp + 0x48]
01cf1 48ff742458                     push       qword ptr [rsp + 0x58]
01cf6 488f442450                     pop        qword ptr [rsp + 0x50]
01cfb 48894424f8                     mov        qword ptr [rsp - 8], rax
01d00 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d04 89442458                       mov        dword ptr [rsp + 0x58], eax
01d08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d12 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d16 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d24 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d28 89442460                       mov        dword ptr [rsp + 0x60], eax
01d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d3a 89442464                       mov        dword ptr [rsp + 0x64], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 48894424f8                     mov        qword ptr [rsp - 8], rax
01d48 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d4c 89442468                       mov        dword ptr [rsp + 0x68], eax
01d50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d55 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01d5c c5f877                         vzeroupper 
01d5f e8fcf2b5ff                     call       0x7f0c739c3660
01d64 0f1f84005c1e001f               nop        dword ptr [rax + rax + 0x1f001e5c]
01d6c bef6ffffff                     mov        esi, 0xfffffff6
01d71 666690                         nop        
01d74 c5f877                         vzeroupper 
01d77 e8e4f2b5ff                     call       0x7f0c739c3660
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
01db3 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01db8 c5f877                         vzeroupper 
01dbb e8a0f2b5ff                     call       0x7f0c739c3660
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
01e43 e818f2b5ff                     call       0x7f0c739c3660
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
01eab e8b0f1b5ff                     call       0x7f0c739c3660
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
01eff e85cf1b5ff                     call       0x7f0c739c3660
01f04 0f1f8400fc1f0024               nop        dword ptr [rax + rax + 0x24001ffc]
01f0c be6effffff                     mov        esi, 0xffffff6e
01f11 488b2c24                       mov        rbp, qword ptr [rsp]
01f15 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f1a 4c891424                       mov        qword ptr [rsp], r10
01f1e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f23 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f28 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f2d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f32 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f37 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f3c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f41 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f46 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f4b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f50 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01f55 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f5e 89442434                       mov        dword ptr [rsp + 0x34], eax
01f62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f67 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f70 89442438                       mov        dword ptr [rsp + 0x38], eax
01f74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f79 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f82 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8b 48ff742450                     push       qword ptr [rsp + 0x50]
01f90 488f442448                     pop        qword ptr [rsp + 0x48]
01f95 48ff742458                     push       qword ptr [rsp + 0x58]
01f9a 488f442450                     pop        qword ptr [rsp + 0x50]
01f9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fa8 89442458                       mov        dword ptr [rsp + 0x58], eax
01fac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb6 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fba 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fcc 89442460                       mov        dword ptr [rsp + 0x60], eax
01fd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fda 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01fde 89442464                       mov        dword ptr [rsp + 0x64], eax
01fe2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fec 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ff0 89442468                       mov        dword ptr [rsp + 0x68], eax
01ff4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff9 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01ffe 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02002 6690                           nop        
02004 c5f877                         vzeroupper 
02007 e854f0b5ff                     call       0x7f0c739c3660
0200c 0f1f840004210025               nop        dword ptr [rax + rax + 0x25002104]
02014 458bd3                         mov        r10d, r11d
02017 e9f1eeffff                     jmp        0x7f0c73e6350d
0201c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
02024 458d5a08                       lea        r11d, [r10 + 8]
02028 458bcb                         mov        r9d, r11d
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
020cc 458bda                         mov        r11d, r10d
020cf 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
020d4 c5f877                         vzeroupper 
020d7 e884efb5ff                     call       0x7f0c739c3660
020dc 0f1f8400d4210026               nop        dword ptr [rax + rax + 0x260021d4]
020e4 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
020ec 458d5a08                       lea        r11d, [r10 + 8]
020f0 458bcb                         mov        r9d, r11d
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
02194 458bda                         mov        r11d, r10d
02197 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0219c c5f877                         vzeroupper 
0219f e8bceeb5ff                     call       0x7f0c739c3660
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
0220d 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02211 666690                         nop        
02214 c5f877                         vzeroupper 
02217 e844eeb5ff                     call       0x7f0c739c3660
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
022d3 e888edb5ff                     call       0x7f0c739c3660
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
02333 e828edb5ff                     call       0x7f0c739c3660
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
02398 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0239d 666690                         nop        
023a0 c5f877                         vzeroupper 
023a3 e8b8ecb5ff                     call       0x7f0c739c3660
023a8 0f1f8400a024002b               nop        dword ptr [rax + rax + 0x2b0024a0]
023b0 bee4ffffff                     mov        esi, 0xffffffe4
023b5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023ba 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023bf 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
023c4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023c9 48894424f8                     mov        qword ptr [rsp - 8], rax
023ce 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023d2 8944244c                       mov        dword ptr [rsp + 0x4c], eax
023d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023db 48894424f8                     mov        qword ptr [rsp - 8], rax
023e0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023e4 89442460                       mov        dword ptr [rsp + 0x60], eax
023e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ed 48894424f8                     mov        qword ptr [rsp - 8], rax
023f2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
023f6 89442464                       mov        dword ptr [rsp + 0x64], eax
023fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ff 90                             nop        
02400 c5f877                         vzeroupper 
02403 e858ecb5ff                     call       0x7f0c739c3660
02408 0f1f84000025002c               nop        dword ptr [rax + rax + 0x2c002500]
02410 bee4ffffff                     mov        esi, 0xffffffe4
02415 488b2c24                       mov        rbp, qword ptr [rsp]
02419 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0241e 4c891424                       mov        qword ptr [rsp], r10
02422 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02427 4489542408                     mov        dword ptr [rsp + 8], r10d
0242c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02431 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02436 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0243b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02440 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02445 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0244a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0244f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02454 48894424f8                     mov        qword ptr [rsp - 8], rax
02459 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0245d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02461 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02466 48894424f8                     mov        qword ptr [rsp - 8], rax
0246b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0246f 89442460                       mov        dword ptr [rsp + 0x60], eax
02473 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02478 48894424f8                     mov        qword ptr [rsp - 8], rax
0247d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02481 89442464                       mov        dword ptr [rsp + 0x64], eax
02485 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248a 48894424f8                     mov        qword ptr [rsp - 8], rax
0248f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02493 89442470                       mov        dword ptr [rsp + 0x70], eax
02497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249c c5f877                         vzeroupper 
0249f e8bcebb5ff                     call       0x7f0c739c3660
024a4 0f1f84009c25002d               nop        dword ptr [rax + rax + 0x2d00259c]
024ac beccffffff                     mov        esi, 0xffffffcc
024b1 488b2c24                       mov        rbp, qword ptr [rsp]
024b5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
024ba 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
024bf 90                             nop        
024c0 c5f877                         vzeroupper 
024c3 e898ebb5ff                     call       0x7f0c739c3660
024c8 0f1f8400c025002e               nop        dword ptr [rax + rax + 0x2e0025c0]
024d0 beccffffff                     mov        esi, 0xffffffcc
024d5 488b2c24                       mov        rbp, qword ptr [rsp]
024d9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024de 4489542414                     mov        dword ptr [rsp + 0x14], r10d
024e3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024e8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024ed 48894424f8                     mov        qword ptr [rsp - 8], rax
024f2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024f6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
024fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02504 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02508 89442460                       mov        dword ptr [rsp + 0x60], eax
0250c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02511 48894424f8                     mov        qword ptr [rsp - 8], rax
02516 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0251a 89442464                       mov        dword ptr [rsp + 0x64], eax
0251e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02523 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
0252b 90                             nop        
0252c c5f877                         vzeroupper 
0252f e82cebb5ff                     call       0x7f0c739c3660
02534 0f1f84002c26002f               nop        dword ptr [rax + rax + 0x2f00262c]
0253c beccffffff                     mov        esi, 0xffffffcc
02541 488b2c24                       mov        rbp, qword ptr [rsp]
02545 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0254a 4c891424                       mov        qword ptr [rsp], r10
0254e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02553 4489542408                     mov        dword ptr [rsp + 8], r10d
02558 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0255d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02562 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02567 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0256c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02571 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02576 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0257b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02580 48894424f8                     mov        qword ptr [rsp - 8], rax
02585 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02589 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0258d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02592 48894424f8                     mov        qword ptr [rsp - 8], rax
02597 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0259b 89442460                       mov        dword ptr [rsp + 0x60], eax
0259f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a4 48894424f8                     mov        qword ptr [rsp - 8], rax
025a9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
025ad 89442464                       mov        dword ptr [rsp + 0x64], eax
025b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b6 48894424f8                     mov        qword ptr [rsp - 8], rax
025bb 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
025bf 89442468                       mov        dword ptr [rsp + 0x68], eax
025c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c8 48894424f8                     mov        qword ptr [rsp - 8], rax
025cd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
025d1 89442470                       mov        dword ptr [rsp + 0x70], eax
025d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025da 895c2474                       mov        dword ptr [rsp + 0x74], ebx
025de 6690                           nop        
025e0 c5f877                         vzeroupper 
025e3 e878eab5ff                     call       0x7f0c739c3660
025e8 0f1f8400e0260030               nop        dword ptr [rax + rax + 0x300026e0]
025f0 beccffffff                     mov        esi, 0xffffffcc
025f5 488b2c24                       mov        rbp, qword ptr [rsp]
025f9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025fe 4c891424                       mov        qword ptr [rsp], r10
02602 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02607 4489542408                     mov        dword ptr [rsp + 8], r10d
0260c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02611 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02616 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0261b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02620 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02625 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0262a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0262f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02634 48894424f8                     mov        qword ptr [rsp - 8], rax
02639 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0263d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02646 48894424f8                     mov        qword ptr [rsp - 8], rax
0264b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0264f 89442460                       mov        dword ptr [rsp + 0x60], eax
02653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02658 48894424f8                     mov        qword ptr [rsp - 8], rax
0265d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02661 89442464                       mov        dword ptr [rsp + 0x64], eax
02665 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266a 48894424f8                     mov        qword ptr [rsp - 8], rax
0266f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02673 89442468                       mov        dword ptr [rsp + 0x68], eax
02677 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267c 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02680 c5f877                         vzeroupper 
02683 e8d8e9b5ff                     call       0x7f0c739c3660
02688 0f1f840080270031               nop        dword ptr [rax + rax + 0x31002780]
02690 eb10                           jmp        0x7f0c73e64ca2
02692 eb0e                           jmp        0x7f0c73e64ca2
02694 eb0c                           jmp        0x7f0c73e64ca2
02696 eb0a                           jmp        0x7f0c73e64ca2
02698 eb08                           jmp        0x7f0c73e64ca2
0269a eb06                           jmp        0x7f0c73e64ca2
0269c eb04                           jmp        0x7f0c73e64ca2
0269e eb02                           jmp        0x7f0c73e64ca2
026a0 eb00                           jmp        0x7f0c73e64ca2
026a2 488bf0                         mov        rsi, rax
026a5 e91ee1ffff                     jmp        0x7f0c73e62dc8
026aa bef6ffffff                     mov        esi, 0xfffffff6
026af 90                             nop        
026b0 c5f877                         vzeroupper 
026b3 e8a8e9b5ff                     call       0x7f0c739c3660
026b8 0f1f8400b0270032               nop        dword ptr [rax + rax + 0x320027b0]
026c0 49badb35e6730c7f0000           movabs     r10, 0x7f0c73e635db
026ca 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
026d1 e90a92a9ff                     jmp        0x7f0c738fdee0
026d6 e8c55da8ff                     call       0x7f0c738eaaa0
026db e94ed9ffff                     jmp        0x7f0c73e6262e
