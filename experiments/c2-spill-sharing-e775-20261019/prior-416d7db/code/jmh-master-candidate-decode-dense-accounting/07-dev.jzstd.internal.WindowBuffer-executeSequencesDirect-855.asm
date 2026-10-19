00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85406ea7ff                   jne        0x7f254b8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85c0190000                   jne        0x7f254be844fe
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 498bc0                         mov        rax, r8
00046 890c24                         mov        dword ptr [rsp], ecx
00049 488bde                         mov        rbx, rsi
0004c 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
00050 448b5604                       mov        r10d, dword ptr [rsi + 4]
00054 4489542454                     mov        dword ptr [rsp + 0x54], r10d
00059 418bea                         mov        ebp, r10d
0005c 412beb                         sub        ebp, r11d
0005f 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00067 443bd5                         cmp        r10d, ebp
0006a 0f8f18140000                   jg         0x7f254be83f88
00070 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00074 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00079 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007d 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00085 4963cb                         movsxd     rcx, r11d
00088 48034c2418                     add        rcx, qword ptr [rsp + 0x18]
0008d 4c2bc1                         sub        r8, rcx
00090 4d3bc8                         cmp        r9, r8
00093 0f8f07140000                   jg         0x7f254be83fa0
00099 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009d 4c8b5628                       mov        r10, qword ptr [rsi + 0x28]
000a1 448b6e40                       mov        r13d, dword ptr [rsi + 0x40]
000a5 4d85d2                         test       r10, r10
000a8 0f8586130000                   jne        0x7f254be83f34
000ae 4903c9                         add        rcx, r9
000b1 493bce                         cmp        rcx, r14
000b4 0f8f0e140000                   jg         0x7f254be83fc8
000ba 4c8bca                         mov        r9, rdx
000bd 8b5204                         mov        edx, dword ptr [rdx + 4]
000c0 448bd7                         mov        r10d, edi
000c3 85ff                           test       edi, edi
000c5 0f8e31100000                   jle        0x7f254be83bfc
000cb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
000d0 448d5ae0                       lea        r11d, [rdx - 0x20]
000d4 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
000d9 4183c0e0                       add        r8d, -0x20
000dd 488b7c2418                     mov        rdi, qword ptr [rsp + 0x18]
000e2 48f7df                         neg        rdi
000e5 8b7004                         mov        esi, dword ptr [rax + 4]
000e8 85f6                           test       esi, esi
000ea 0f8600110000                   jbe        0x7f254be83cf0
000f0 4963ca                         movsxd     rcx, r10d
000f3 4863f6                         movsxd     rsi, esi
000f6 48ffc9                         dec        rcx
000f9 483bce                         cmp        rcx, rsi
000fc 0f83ee100000                   jae        0x7f254be83cf0
00102 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0010a 8b4d04                         mov        ecx, dword ptr [rbp + 4]
0010d 85c9                           test       ecx, ecx
0010f 0f8634110000                   jbe        0x7f254be83d49
00115 83f901                         cmp        ecx, 1
00118 0f862b110000                   jbe        0x7f254be83d49
0011e 83f902                         cmp        ecx, 2
00121 0f8622110000                   jbe        0x7f254be83d49
00127 418b7504                       mov        esi, dword ptr [r13 + 4]
0012b 8974243c                       mov        dword ptr [rsp + 0x3c], esi
0012f 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00133 48897c2470                     mov        qword ptr [rsp + 0x70], rdi
00138 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0013d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00142 89542410                       mov        dword ptr [rsp + 0x10], edx
00146 44896c2408                     mov        dword ptr [rsp + 8], r13d
0014b 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00150 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00158 488f442430                     pop        qword ptr [rsp + 0x30]
0015d 4489542404                     mov        dword ptr [rsp + 4], r10d
00162 48898424c8000000               mov        qword ptr [rsp + 0xc8], rax
0016a 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
00172 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
00177 448d52f1                       lea        r10d, [rdx - 0xf]
0017b 4585d2                         test       r10d, r10d
0017e 0f8cc0100000                   jl         0x7f254be83d44
00184 448d5ef1                       lea        r11d, [rsi - 0xf]
00188 4585db                         test       r11d, r11d
0018b 0f8c13110000                   jl         0x7f254be83da4
00191 448d56f9                       lea        r10d, [rsi - 7]
00195 4585d2                         test       r10d, r10d
00198 0f8c12110000                   jl         0x7f254be83db0
0019e 448bde                         mov        r11d, esi
001a1 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
001a6 4d8bd5                         mov        r10, r13
001a9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001ae 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
001b3 4183c2f1                       add        r10d, -0xf
001b7 4489542444                     mov        dword ptr [rsp + 0x44], r10d
001bc 448bda                         mov        r11d, edx
001bf 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001c4 458d53f1                       lea        r10d, [r11 - 0xf]
001c8 4489542478                     mov        dword ptr [rsp + 0x78], r10d
001cd 4533c0                         xor        r8d, r8d
001d0 33db                           xor        ebx, ebx
001d2 e9b9010000                     jmp        0x7f254be82e90
001d7 4533db                         xor        r11d, r11d
001da 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001df 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
001e4 418b4a0c                       mov        ecx, dword ptr [r10 + 0xc]
001e8 448bd0                         mov        r10d, eax
001eb 4183fa03                       cmp        r10d, 3
001ef 0f8e4c030000                   jle        0x7f254be83041
001f5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
001fa 41894a10                       mov        dword ptr [r10 + 0x10], ecx
001fe 458b5208                       mov        r10d, dword ptr [r10 + 8]
00202 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00207 4589530c                       mov        dword ptr [r11 + 0xc], r10d
0020b 448d50fd                       lea        r10d, [rax - 3]
0020f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00214 4d8bd3                         mov        r10, r11
00217 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0021c 45895a08                       mov        dword ptr [r10 + 8], r11d
00220 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00228 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
0022d 4c635c240c                     movsxd     r11, dword ptr [rsp + 0xc]
00232 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
00237 4863542428                     movsxd     rdx, dword ptr [rsp + 0x28]
0023c 4c03da                         add        r11, rdx
0023f 4d3bd3                         cmp        r10, r11
00242 0f8f000e0000                   jg         0x7f254be83b48
00248 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0024d 4585d2                         test       r10d, r10d
00250 0f8e820d0000                   jle        0x7f254be83ad8
00256 448b74240c                     mov        r14d, dword ptr [rsp + 0xc]
0025b 4403742428                     add        r14d, dword ptr [rsp + 0x28]
00260 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00265 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0026a 4b8d740308                     lea        rsi, [r11 + r8 + 8]
0026f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00274 4503de                         add        r11d, r14d
00277 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0027f 498d7c1a08                     lea        rdi, [r10 + rbx + 8]
00284 448bcb                         mov        r9d, ebx
00287 44034c2428                     add        r9d, dword ptr [rsp + 0x28]
0028c 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
00294 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00299 0f8fd6080000                   jg         0x7f254be83675
0029f 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
002a4 0f8fce0d0000                   jg         0x7f254be83b78
002aa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002af 4183fa10                       cmp        r10d, 0x10
002b3 0f8f5b010000                   jg         0x7f254be82f14
002b9 3b5c2478                       cmp        ebx, dword ptr [rsp + 0x78]
002bd 0f83a10c0000                   jae        0x7f254be83a64
002c3 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
002cb c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002d2 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
002d7 0f83ab0c0000                   jae        0x7f254be83a88
002dd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002e2 4403d3                         add        r10d, ebx
002e5 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
002ed 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
002f2 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
002f9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002fe 4503d8                         add        r11d, r8d
00301 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00306 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0030b 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
00310 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00315 4183fb10                       cmp        r11d, 0x10
00319 0f8f990d0000                   jg         0x7f254be83bb8
0031f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00324 4183fa10                       cmp        r10d, 0x10
00328 0f8c02030000                   jl         0x7f254be83130
0032e 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00333 0f83810b0000                   jae        0x7f254be839ba
00339 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0033e c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00345 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0034a 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
0034f 0f83b30b0000                   jae        0x7f254be83a08
00355 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0035a 448b542408                     mov        r10d, dword ptr [rsp + 8]
0035f c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00366 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0036b 4503c3                         add        r8d, r11d
0036e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00373 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
0037b 41ffc0                         inc        r8d
0037e 443b442404                     cmp        r8d, dword ptr [rsp + 4]
00383 0f8d04070000                   jge        0x7f254be8358d
00389 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
00390 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00398 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
0039d 4d8bd3                         mov        r10, r11
003a0 49c1fa24                       sar        r10, 0x24
003a4 458bd2                         mov        r10d, r10d
003a7 418bc2                         mov        eax, r10d
003aa 4d8bd3                         mov        r10, r11
003ad 49c1ea12                       shr        r10, 0x12
003b1 458bdb                         mov        r11d, r11d
003b4 458bd2                         mov        r10d, r10d
003b7 4181e3ffff0100                 and        r11d, 0x1ffff
003be 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
003c3 4181e2ffff0300                 and        r10d, 0x3ffff
003ca 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
003cf 448bd0                         mov        r10d, eax
003d2 4585d2                         test       r10d, r10d
003d5 0f8c1d0c0000                   jl         0x7f254be83af8
003db 4585db                         test       r11d, r11d
003de 0f84f3fdffff                   je         0x7f254be82cd7
003e4 448b1424                       mov        r10d, dword ptr [rsp]
003e8 442bd3                         sub        r10d, ebx
003eb 453bda                         cmp        r11d, r10d
003ee 0f8eebfdffff                   jle        0x7f254be82cdf
003f4 be45ffffff                     mov        esi, 0xffffff45
003f9 418beb                         mov        ebp, r11d
003fc 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00404 c5f877                         vzeroupper 
00407 e8540fb4ff                     call       0x7f254b9c3e60
0040c 0f1f840004050000               nop        dword ptr [rax + rax + 0x504]
00414 4183fa30                       cmp        r10d, 0x30
00418 0f8f6d050000                   jg         0x7f254be8348b
0041e 3b5c2478                       cmp        ebx, dword ptr [rsp + 0x78]
00422 0f83f30c0000                   jae        0x7f254be83c1b
00428 4863cb                         movsxd     rcx, ebx
0042b 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00433 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
0043a 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0043f 0f832f0d0000                   jae        0x7f254be83c74
00445 458d5010                       lea        r10d, [r8 + 0x10]
00449 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00451 4d63c8                         movsxd     r9, r8d
00454 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00459 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
00460 453bd6                         cmp        r10d, r14d
00463 0f8dbe000000                   jge        0x7f254be83027
00469 492bc9                         sub        rcx, r9
0046c 4d63ca                         movsxd     r9, r10d
0046f 48637c2450                     movsxd     rdi, dword ptr [rsp + 0x50]
00474 4883c7f1                       add        rdi, -0xf
00478 4d8d1c09                       lea        r11, [r9 + rcx]
0047c 4c3bdf                         cmp        r11, rdi
0047f 0f83370e0000                   jae        0x7f254be83dbc
00485 4d63de                         movsxd     r11, r14d
00488 4d2bd9                         sub        r11, r9
0048b 4983c30f                       add        r11, 0xf
0048f 4983e3f0                       and        r11, 0xfffffffffffffff0
00493 458bdb                         mov        r11d, r11d
00496 478d4c0310                     lea        r9d, [r11 + r8 + 0x10]
0049b 4d63d9                         movsxd     r11, r9d
0049e 4d8d4c0bf0                     lea        r9, [r11 + rcx - 0x10]
004a3 4c3bcf                         cmp        r9, rdi
004a6 0f83100e0000                   jae        0x7f254be83dbc
004ac 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
004b1 0f83050e0000                   jae        0x7f254be83dbc
004b7 4983c3f0                       add        r11, -0x10
004bb 4c63542440                     movsxd     r10, dword ptr [rsp + 0x40]
004c0 4983c2f1                       add        r10, -0xf
004c4 4d3bda                         cmp        r11, r10
004c7 0f83ef0d0000                   jae        0x7f254be83dbc
004cd 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
004d4 0f8f2e0e0000                   jg         0x7f254be83e08
004da 8bcb                           mov        ecx, ebx
004dc 412bc8                         sub        ecx, r8d
004df 90                             nop        
004e0 448bd1                         mov        r10d, ecx
004e3 4403942480000000               add        r10d, dword ptr [rsp + 0x80]
004eb 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
004f3 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
004fa 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00502 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00507 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0050e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00516 4183c210                       add        r10d, 0x10
0051a 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00522 453bd6                         cmp        r10d, r14d
00525 7cb9                           jl         0x7f254be82fe0
00527 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0052c 4403d3                         add        r10d, ebx
0052f 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00537 4489742438                     mov        dword ptr [rsp + 0x38], r14d
0053c e9c5fdffff                     jmp        0x7f254be82e06
00541 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00546 4585d2                         test       r10d, r10d
00549 7407                           je         0x7f254be83052
0054b 448d50ff                       lea        r10d, [rax - 1]
0054f 418bc2                         mov        eax, r10d
00552 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00557 458b4a08                       mov        r9d, dword ptr [r10 + 8]
0055b 85c0                           test       eax, eax
0055d 0f8487040000                   je         0x7f254be834ea
00563 83f803                         cmp        eax, 3
00566 0f848b040000                   je         0x7f254be834f7
0056c 83f802                         cmp        eax, 2
0056f 777f                           ja         0x7f254be830f0
00571 3b442424                       cmp        eax, dword ptr [rsp + 0x24]
00575 0f83d90d0000                   jae        0x7f254be83e54
0057b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00580 458b4c8308                     mov        r9d, dword ptr [r11 + rax*4 + 8]
00585 85c0                           test       eax, eax
00587 7e4c                           jle        0x7f254be830d5
00589 448d50ff                       lea        r10d, [rax - 1]
0058d 443b542424                     cmp        r10d, dword ptr [rsp + 0x24]
00592 0f83dc100000                   jae        0x7f254be84174
00598 4863f8                         movsxd     rdi, eax
0059b 458bdb                         mov        r11d, r11d
0059e 4183c3cc                       add        r11d, -0x34
005a2 41c1eb02                       shr        r11d, 2
005a6 458d5403ff                     lea        r10d, [r11 + rax - 1]
005ab b904000000                     mov        ecx, 4
005b0 c442f0f5d2                     bzhi       r10, r10, rcx
005b5 492bfa                         sub        rdi, r10
005b8 48ffcf                         dec        rdi
005bb 4533d2                         xor        r10d, r10d
005be 4885ff                         test       rdi, rdi
005c1 490f4cfa                       cmovl      rdi, r10
005c5 448bdf                         mov        r11d, edi
005c8 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
005d0 e992020000                     jmp        0x7f254be83367
005d5 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
005dd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
005e2 45894a08                       mov        dword ptr [r10 + 8], r9d
005e6 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
005eb e938fcffff                     jmp        0x7f254be82d28
005f0 48be1047bce200000000           movabs     rsi, 0xe2bc4710
005fa 8beb                           mov        ebp, ebx
005fc 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00601 666690                         nop        
00604 c5f877                         vzeroupper 
00607 e85477a7ff                     call       0x7f254b8fa860
0060c 0f1f840004070001               nop        dword ptr [rax + rax + 0x1000704]
00614 4885c0                         test       rax, rax
00617 0f847b0d0000                   je         0x7f254be83e98
0061d 488bf0                         mov        rsi, rax
00620 c5f877                         vzeroupper 
00623 4881c4b0000000                 add        rsp, 0xb0
0062a 5d                             pop        rbp
0062b e9b089b4ff                     jmp        0x7f254b9cbae0
00630 458bd3                         mov        r10d, r11d
00633 4403542438                     add        r10d, dword ptr [rsp + 0x38]
00638 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0063d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00642 453bd3                         cmp        r10d, r11d
00645 0f8d6e010000                   jge        0x7f254be832b9
0064b 4183fa08                       cmp        r10d, 8
0064f 0f8d37110000                   jge        0x7f254be8428c
00655 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
0065a 0f83b40e0000                   jae        0x7f254be84014
00660 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00665 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
0066b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00670 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00675 0f83f10e0000                   jae        0x7f254be8406c
0067b 448b542408                     mov        r10d, dword ptr [rsp + 8]
00680 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00685 458d5803                       lea        r11d, [r8 + 3]
00689 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0068e 41ffc2                         inc        r10d
00691 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00699 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0069e 0f83f80e0000                   jae        0x7f254be8409c
006a4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
006a9 4183c303                       add        r11d, 3
006ad 4d63d0                         movsxd     r10, r8d
006b0 8b4c2408                       mov        ecx, dword ptr [rsp + 8]
006b4 420fbe6c1109                   movsx      ebp, byte ptr [rcx + r10 + 9]
006ba 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
006bf 0f83130f0000                   jae        0x7f254be840d8
006c5 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
006ca 42886c1909                     mov        byte ptr [rcx + r11 + 9], bpl
006cf 460fbe4c110a                   movsx      r9d, byte ptr [rcx + r10 + 0xa]
006d5 46884c190a                     mov        byte ptr [rcx + r11 + 0xa], r9b
006da 460fbe4c110b                   movsx      r9d, byte ptr [rcx + r10 + 0xb]
006e0 46884c190b                     mov        byte ptr [rcx + r11 + 0xb], r9b
006e5 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006ea 4183fb08                       cmp        r11d, 8
006ee 0f831c0f0000                   jae        0x7f254be84110
006f4 49ba30b6b6e200000000           movabs     r10, 0xe2b6b630
006fe 4703449a08                     add        r8d, dword ptr [r10 + r11*4 + 8]
00703 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00708 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0070d 4183fb04                       cmp        r11d, 4
00711 7e3d                           jle        0x7f254be83250
00713 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00717 83c504                         add        ebp, 4
0071a 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0071f 418bd0                         mov        edx, r8d
00722 6690                           nop        
00724 c5f877                         vzeroupper 
00727 e83476a7ff                     call       0x7f254b8fa860
0072c 0f1f840024080002               nop        dword ptr [rax + rax + 0x2000824]
00734 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00739 8bd5                           mov        edx, ebp
0073b 8bc8                           mov        ecx, eax
0073d 666690                         nop        
00740 c5f877                         vzeroupper 
00743 e81876a7ff                     call       0x7f254b8fa860
00748 0f1f840040080003               nop        dword ptr [rax + rax + 0x3000840]
00750 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00755 4183fb08                       cmp        r11d, 8
00759 0f8e14fcffff                   jle        0x7f254be82e73
0075f 49ba58b6b6e200000000           movabs     r10, 0xe2b6b658
00769 8b542428                       mov        edx, dword ptr [rsp + 0x28]
0076d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00772 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00777 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0077b 83c508                         add        ebp, 8
0077e 83c208                         add        edx, 8
00781 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00786 6690                           nop        
00788 c5f877                         vzeroupper 
0078b e8d075a7ff                     call       0x7f254b8fa860
00790 0f1f840088080004               nop        dword ptr [rax + rax + 0x4000888]
00798 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0079d 8bd5                           mov        edx, ebp
0079f 488bc8                         mov        rcx, rax
007a2 6690                           nop        
007a4 c5f877                         vzeroupper 
007a7 e8b475a7ff                     call       0x7f254b8fa860
007ac 0f1f8400a4080005               nop        dword ptr [rax + rax + 0x50008a4]
007b4 e9bafbffff                     jmp        0x7f254be82e73
007b9 4183fb30                       cmp        r11d, 0x30
007bd 0f8f610f0000                   jg         0x7f254be84224
007c3 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
007c7 83c5f9                         add        ebp, -7
007ca 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007ce 443bc5                         cmp        r8d, ebp
007d1 0f83d90b0000                   jae        0x7f254be83eb0
007d7 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
007df 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
007e4 4b8b6c0308                     mov        rbp, qword ptr [r11 + r8 + 8]
007e9 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
007f1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007f6 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
007fb 0f83f30b0000                   jae        0x7f254be83ef4
00801 48be28c122e200000000           movabs     rsi, 0xe222c128
0080b 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0080f 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00813 4863cd                         movsxd     rcx, ebp
00816 4883c108                       add        rcx, 8
0081a 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
0081f 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00827 4533c9                         xor        r9d, r9d
0082a 6690                           nop        
0082c c5f877                         vzeroupper 
0082f e82c6ba7ff                     call       0x7f254b8f9e60
00834 0f1f84002c090006               nop        dword ptr [rax + rax + 0x600092c]
0083c 83c508                         add        ebp, 8
0083f 896c2438                       mov        dword ptr [rsp + 0x38], ebp
00843 3b6c240c                       cmp        ebp, dword ptr [rsp + 0xc]
00847 0f8c770e0000                   jl         0x7f254be841c4
0084d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00852 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00857 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0085c e912fbffff                     jmp        0x7f254be82e73
00861 666690                         nop        
00864 418bc0                         mov        eax, r8d
00867 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0086c 458b548004                     mov        r10d, dword ptr [r8 + rax*4 + 4]
00871 498bc8                         mov        rcx, r8
00874 4489548108                     mov        dword ptr [rcx + rax*4 + 8], r10d
00879 448d40ff                       lea        r8d, [rax - 1]
0087d 453bc3                         cmp        r8d, r11d
00880 7fe2                           jg         0x7f254be83364
00882 4183f83f                       cmp        r8d, 0x3f
00886 0f8e300e0000                   jle        0x7f254be841bc
0088c 448bd0                         mov        r10d, eax
0088f 41ffca                         dec        r10d
00892 418bca                         mov        ecx, r10d
00895 eb0c                           jmp        0x7f254be833a3
00897 660f1f840000000000             nop        word ptr [rax + rax]
008a0 418bca                         mov        ecx, r10d
008a3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008a8 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
008b3 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
008be 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
008c9 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
008d4 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
008df 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
008ea 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
008f5 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00900 448d51c0                       lea        r10d, [rcx - 0x40]
00904 4183fa3f                       cmp        r10d, 0x3f
00908 7f96                           jg         0x7f254be833a0
0090a 4183fa0f                       cmp        r10d, 0xf
0090e 7e2d                           jle        0x7f254be8343d
00910 448bd1                         mov        r10d, ecx
00913 4183c2c0                       add        r10d, -0x40
00917 90                             nop        
00918 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0091d 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00928 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00933 4183c2f0                       add        r10d, -0x10
00937 4183fa0f                       cmp        r10d, 0xf
0093b 7fdb                           jg         0x7f254be83418
0093d 4585d2                         test       r10d, r10d
00940 0f8e97fcffff                   jle        0x7f254be830dd
00946 6690                           nop        
00948 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0094d 478b449304                     mov        r8d, dword ptr [r11 + r10*4 + 4]
00952 4789449308                     mov        dword ptr [r11 + r10*4 + 8], r8d
00957 41ffca                         dec        r10d
0095a 4585d2                         test       r10d, r10d
0095d 7fe9                           jg         0x7f254be83448
0095f e979fcffff                     jmp        0x7f254be830dd
00964 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00969 4d63d3                         movsxd     r10, r11d
0096c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00973 c442a8f5db                     bzhi       r11, r11, r10
00978 c4c1fb92fb                     kmovq      k7, r11
0097d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00983 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00989 eb55                           jmp        0x7f254be834e0
0098b 85db                           test       ebx, ebx
0098d 0f8cd50d0000                   jl         0x7f254be84268
00993 4585c0                         test       r8d, r8d
00996 0f8ccc0d0000                   jl         0x7f254be84268
0099c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009a1 453bd9                         cmp        r11d, r9d
009a4 0f82be0d0000                   jb         0x7f254be84268
009aa 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
009af 453bd6                         cmp        r10d, r14d
009b2 0f82b00d0000                   jb         0x7f254be84268
009b8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009bd 4585d2                         test       r10d, r10d
009c0 741e                           je         0x7f254be834e0
009c2 4883fa20                       cmp        rdx, 0x20
009c6 769c                           jbe        0x7f254be83464
009c8 c5f877                         vzeroupper 
009cb 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
009d5 41ffd2                         call       r10
009d8 0f1f840000000000               nop        dword ptr [rax + rax]
009e0 4489742438                     mov        dword ptr [rsp + 0x38], r14d
009e5 e91cf9ffff                     jmp        0x7f254be82e06
009ea 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
009f2 e9effbffff                     jmp        0x7f254be830e6
009f7 41ffc9                         dec        r9d
009fa 4585c9                         test       r9d, r9d
009fd 7e27                           jle        0x7f254be83526
009ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a04 41894a10                       mov        dword ptr [r10 + 0x10], ecx
00a08 458b5208                       mov        r10d, dword ptr [r10 + 8]
00a0c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00a11 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00a15 45894b08                       mov        dword ptr [r11 + 8], r9d
00a19 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00a21 e9c0fbffff                     jmp        0x7f254be830e6
00a26 48bee046bce200000000           movabs     rsi, 0xe2bc46e0
00a30 8beb                           mov        ebp, ebx
00a32 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00a37 90                             nop        
00a38 c5f877                         vzeroupper 
00a3b e82073a7ff                     call       0x7f254b8fa860
00a40 0f1f8400380b0007               nop        dword ptr [rax + rax + 0x7000b38]
00a48 4885c0                         test       rax, rax
00a4b 0f85ccfbffff                   jne        0x7f254be8311d
00a51 bef6ffffff                     mov        esi, 0xfffffff6
00a56 6690                           nop        
00a58 c5f877                         vzeroupper 
00a5b e80009b4ff                     call       0x7f254b9c3e60
00a60 0f1f8400580b0008               nop        dword ptr [rax + rax + 0x8000b58]
00a68 4d63d2                         movsxd     r10, r10d
00a6b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a72 c442a8f5db                     bzhi       r11, r11, r10
00a77 c4c1fb92fb                     kmovq      k7, r11
00a7c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a82 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a88 e9a7000000                     jmp        0x7f254be83634
00a8d 448b1424                       mov        r10d, dword ptr [rsp]
00a91 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00a99 448b442408                     mov        r8d, dword ptr [rsp + 8]
00a9e 4585c0                         test       r8d, r8d
00aa1 0f84350d0000                   je         0x7f254be842dc
00aa7 498bc8                         mov        rcx, r8
00aaa 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00ab2 4585c0                         test       r8d, r8d
00ab5 0f8c590d0000                   jl         0x7f254be84314
00abb 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
00ac0 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00ac8 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00acc 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00ad1 4585db                         test       r11d, r11d
00ad4 0f8c4c0d0000                   jl         0x7f254be84326
00ada 3b1424                         cmp        edx, dword ptr [rsp]
00add 0f82430d0000                   jb         0x7f254be84326
00ae3 448b6c240c                     mov        r13d, dword ptr [rsp + 0xc]
00ae8 4503ea                         add        r13d, r10d
00aeb 8b5104                         mov        edx, dword ptr [rcx + 4]
00aee 413bd5                         cmp        edx, r13d
00af1 0f822f0d0000                   jb         0x7f254be84326
00af7 4585d2                         test       r10d, r10d
00afa 0f8c260d0000                   jl         0x7f254be84326
00b00 4585d2                         test       r10d, r10d
00b03 742f                           je         0x7f254be83634
00b05 4b8d7c0108                     lea        rdi, [r9 + r8 + 8]
00b0a 4a8d741908                     lea        rsi, [rcx + r11 + 8]
00b0f 4963d2                         movsxd     rdx, r10d
00b12 4883fa20                       cmp        rdx, 0x20
00b16 0f864cffffff                   jbe        0x7f254be83568
00b1c c5f877                         vzeroupper 
00b1f 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00b29 41ffd2                         call       r10
00b2c 0f1f840000000000               nop        dword ptr [rax + rax]
00b34 44896b38                       mov        dword ptr [rbx + 0x38], r13d
00b38 c5f877                         vzeroupper 
00b3b 4881c4b0000000                 add        rsp, 0xb0
00b42 5d                             pop        rbp
00b43 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00b47 0f879b0e0000                   ja         0x7f254be844e8
00b4d c3                             ret        
00b4e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b53 4d63d2                         movsxd     r10, r10d
00b56 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b5d c442a8f5db                     bzhi       r11, r11, r10
00b62 c4c1fb92fb                     kmovq      k7, r11
00b67 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b6d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b73 eb63                           jmp        0x7f254be836d8
00b75 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b7a 4585d2                         test       r10d, r10d
00b7d 0f842d030000                   je         0x7f254be839b0
00b83 85db                           test       ebx, ebx
00b85 0f8c150d0000                   jl         0x7f254be843a0
00b8b 4585c0                         test       r8d, r8d
00b8e 0f8c0c0d0000                   jl         0x7f254be843a0
00b94 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b99 453bd9                         cmp        r11d, r9d
00b9c 0f82fe0c0000                   jb         0x7f254be843a0
00ba2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ba7 453bd6                         cmp        r10d, r14d
00baa 0f82f00c0000                   jb         0x7f254be843a0
00bb0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bb5 4585db                         test       r11d, r11d
00bb8 741e                           je         0x7f254be836d8
00bba 4883fa20                       cmp        rdx, 0x20
00bbe 768e                           jbe        0x7f254be8364e
00bc0 c5f877                         vzeroupper 
00bc3 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00bcd 41ffd2                         call       r10
00bd0 0f1f840000000000               nop        dword ptr [rax + rax]
00bd8 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00bdd 4585d2                         test       r10d, r10d
00be0 0f8e97010000                   jle        0x7f254be8387d
00be6 4503d6                         add        r10d, r14d
00be9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00bee 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00bf3 4b8d743308                     lea        rsi, [r11 + r14 + 8]
00bf8 458bd6                         mov        r10d, r14d
00bfb 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00c00 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00c08 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00c0d 458bca                         mov        r9d, r10d
00c10 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00c15 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c1a 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00c1f 0f8d99000000                   jge        0x7f254be837be
00c25 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c2a 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00c2f 458bd3                         mov        r10d, r11d
00c32 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c37 450f4fd3                       cmovg      r10d, r11d
00c3b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00c40 4585c9                         test       r9d, r9d
00c43 0f8c930c0000                   jl         0x7f254be843dc
00c49 4585f6                         test       r14d, r14d
00c4c 0f8c8a0c0000                   jl         0x7f254be843dc
00c52 478d1c0a                       lea        r11d, [r10 + r9]
00c56 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00c5b 453bc3                         cmp        r8d, r11d
00c5e 0f82780c0000                   jb         0x7f254be843dc
00c64 458bd6                         mov        r10d, r14d
00c67 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00c6c 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00c74 453bc2                         cmp        r8d, r10d
00c77 0f825f0c0000                   jb         0x7f254be843dc
00c7d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c82 4585d2                         test       r10d, r10d
00c85 0f8c510c0000                   jl         0x7f254be843dc
00c8b 4585d2                         test       r10d, r10d
00c8e 0f84b0000000                   je         0x7f254be83844
00c94 4963d2                         movsxd     rdx, r10d
00c97 4883fa20                       cmp        rdx, 0x20
00c9b 0f8680000000                   jbe        0x7f254be83821
00ca1 c5f877                         vzeroupper 
00ca4 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00cae 41ffd2                         call       r10
00cb1 0f1f840000000000               nop        dword ptr [rax + rax]
00cb9 e986000000                     jmp        0x7f254be83844
00cbe 4585c9                         test       r9d, r9d
00cc1 0f8c7d0c0000                   jl         0x7f254be84444
00cc7 4585f6                         test       r14d, r14d
00cca 0f8c740c0000                   jl         0x7f254be84444
00cd0 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00cd5 4503d1                         add        r10d, r9d
00cd8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00cdd 453bc2                         cmp        r8d, r10d
00ce0 0f825e0c0000                   jb         0x7f254be84444
00ce6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00ceb 453bc3                         cmp        r8d, r11d
00cee 0f82500c0000                   jb         0x7f254be84444
00cf4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00cf9 4585db                         test       r11d, r11d
00cfc 747a                           je         0x7f254be83878
00cfe 4963d3                         movsxd     rdx, r11d
00d01 4883fa20                       cmp        rdx, 0x20
00d05 764e                           jbe        0x7f254be83855
00d07 c5f877                         vzeroupper 
00d0a 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00d14 41ffd2                         call       r10
00d17 0f1f840000000000               nop        dword ptr [rax + rax]
00d1f eb57                           jmp        0x7f254be83878
00d21 458bda                         mov        r11d, r10d
00d24 4d63d3                         movsxd     r10, r11d
00d27 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d2e c442a8f5db                     bzhi       r11, r11, r10
00d33 c4c1fb92fb                     kmovq      k7, r11
00d38 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d3e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d44 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d49 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00d4e 7d28                           jge        0x7f254be83878
00d50 e982000000                     jmp        0x7f254be838d7
00d55 458bd3                         mov        r10d, r11d
00d58 4d63d2                         movsxd     r10, r10d
00d5b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d62 c442a8f5db                     bzhi       r11, r11, r10
00d67 c4c1fb92fb                     kmovq      k7, r11
00d6c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d72 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d78 448b74240c                     mov        r14d, dword ptr [rsp + 0xc]
00d7d 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00d82 e9ecf5ffff                     jmp        0x7f254be82e73
00d87 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d8f 4d63d3                         movsxd     r10, r11d
00d92 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d99 c442a8f5db                     bzhi       r11, r11, r10
00d9e c4c1fb92fb                     kmovq      k7, r11
00da3 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00da9 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00daf 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00db4 44039c2484000000               add        r11d, dword ptr [rsp + 0x84]
00dbc 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00dc1 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00dc5 418502                         test       dword ptr [r10], eax
00dc8 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00dcd 7da9                           jge        0x7f254be83878
00dcf 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00dd7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00ddc 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00de1 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00de6 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00deb 450f4fd0                       cmovg      r10d, r8d
00def 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00df7 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00dfe 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00e02 85ed                           test       ebp, ebp
00e04 0f8c5a0a0000                   jl         0x7f254be84364
00e0a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00e12 4585d2                         test       r10d, r10d
00e15 0f8c490a0000                   jl         0x7f254be84364
00e1b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00e23 4403dd                         add        r11d, ebp
00e26 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00e2b 453bc3                         cmp        r8d, r11d
00e2e 0f82300a0000                   jb         0x7f254be84364
00e34 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00e3c 4403ac2484000000               add        r13d, dword ptr [rsp + 0x84]
00e44 453bc5                         cmp        r8d, r13d
00e47 0f82170a0000                   jb         0x7f254be84364
00e4d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00e55 4585db                         test       r11d, r11d
00e58 0f8c060a0000                   jl         0x7f254be84364
00e5e 4585db                         test       r11d, r11d
00e61 0f8448ffffff                   je         0x7f254be838af
00e67 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e6c 498d7c2a08                     lea        rdi, [r10 + rbp + 8]
00e71 458bda                         mov        r11d, r10d
00e74 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00e7c 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00e81 4863942484000000               movsxd     rdx, dword ptr [rsp + 0x84]
00e89 4883fa20                       cmp        rdx, 0x20
00e8d 0f86f4feffff                   jbe        0x7f254be83887
00e93 c5f877                         vzeroupper 
00e96 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00ea0 41ffd2                         call       r10
00ea3 0f1f840000000000               nop        dword ptr [rax + rax]
00eab e9fffeffff                     jmp        0x7f254be838af
00eb0 448b74240c                     mov        r14d, dword ptr [rsp + 0xc]
00eb5 e91efdffff                     jmp        0x7f254be836d8
00eba bee4ffffff                     mov        esi, 0xffffffe4
00ebf 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ec7 448b1c24                       mov        r11d, dword ptr [rsp]
00ecb 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00ed3 448b542404                     mov        r10d, dword ptr [rsp + 4]
00ed8 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00ee0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ee5 4c891424                       mov        qword ptr [rsp], r10
00ee9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00eee 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ef3 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00ef8 c5f877                         vzeroupper 
00efb e86004b4ff                     call       0x7f254b9c3e60
00f00 0f1f8400f80f000a               nop        dword ptr [rax + rax + 0xa000ff8]
00f08 bee4ffffff                     mov        esi, 0xffffffe4
00f0d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00f15 448b1c24                       mov        r11d, dword ptr [rsp]
00f19 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00f21 448b542404                     mov        r10d, dword ptr [rsp + 4]
00f26 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00f2e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f33 4c891424                       mov        qword ptr [rsp], r10
00f37 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f3c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f41 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00f46 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f4b c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00f51 666690                         nop        
00f54 c5f877                         vzeroupper 
00f57 e80404b4ff                     call       0x7f254b9c3e60
00f5c 0f1f84005410000b               nop        dword ptr [rax + rax + 0xb001054]
00f64 bee4ffffff                     mov        esi, 0xffffffe4
00f69 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00f71 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00f75 666690                         nop        
00f78 c5f877                         vzeroupper 
00f7b e8e003b4ff                     call       0x7f254b9c3e60
00f80 0f1f84007810000c               nop        dword ptr [rax + rax + 0xc001078]
00f88 bee4ffffff                     mov        esi, 0xffffffe4
00f8d 498bea                         mov        rbp, r10
00f90 448b1424                       mov        r10d, dword ptr [rsp]
00f94 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f9c 448b542404                     mov        r10d, dword ptr [rsp + 4]
00fa1 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00fa9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fae 4c891424                       mov        qword ptr [rsp], r10
00fb2 895c2410                       mov        dword ptr [rsp + 0x10], ebx
00fb6 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00fbb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00fc0 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00fc6 6690                           nop        
00fc8 c5f877                         vzeroupper 
00fcb e89003b4ff                     call       0x7f254b9c3e60
00fd0 0f1f8400c810000d               nop        dword ptr [rax + rax + 0xd0010c8]
00fd8 be45ffffff                     mov        esi, 0xffffff45
00fdd 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00fe5 666690                         nop        
00fe8 c5f877                         vzeroupper 
00feb e87003b4ff                     call       0x7f254b9c3e60
00ff0 0f1f8400e810000e               nop        dword ptr [rax + rax + 0xe0010e8]
00ff8 458bd0                         mov        r10d, r8d
00ffb be45ffffff                     mov        esi, 0xffffff45
01000 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01008 448b0424                       mov        r8d, dword ptr [rsp]
0100c 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01014 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01019 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01021 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01026 4c891c24                       mov        qword ptr [rsp], r11
0102a 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0102e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01033 89442430                       mov        dword ptr [rsp + 0x30], eax
01037 90                             nop        
01038 c5f877                         vzeroupper 
0103b e82003b4ff                     call       0x7f254b9c3e60
01040 0f1f84003811000f               nop        dword ptr [rax + rax + 0xf001138]
01048 4d3bd3                         cmp        r10, r11
0104b bdffffffff                     mov        ebp, 0xffffffff
01050 7c08                           jl         0x7f254be83b5a
01052 400f95c5                       setne      bpl
01056 400fb6ed                       movzx      ebp, bpl
0105a be45ffffff                     mov        esi, 0xffffff45
0105f 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01063 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01068 c5f877                         vzeroupper 
0106b e8f002b4ff                     call       0x7f254b9c3e60
01070 0f1f840068110010               nop        dword ptr [rax + rax + 0x10001168]
01078 be45ffffff                     mov        esi, 0xffffff45
0107d 498bea                         mov        rbp, r10
01080 448b1424                       mov        r10d, dword ptr [rsp]
01084 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0108c 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01091 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01099 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0109e 4c891424                       mov        qword ptr [rsp], r10
010a2 895c2410                       mov        dword ptr [rsp + 0x10], ebx
010a6 6690                           nop        
010a8 c5f877                         vzeroupper 
010ab e8b002b4ff                     call       0x7f254b9c3e60
010b0 0f1f8400a8110011               nop        dword ptr [rax + rax + 0x110011a8]
010b8 be45ffffff                     mov        esi, 0xffffff45
010bd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
010c5 448b1c24                       mov        r11d, dword ptr [rsp]
010c9 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
010d1 448b542404                     mov        r10d, dword ptr [rsp + 4]
010d6 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
010de 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
010e3 4c891424                       mov        qword ptr [rsp], r10
010e7 4489442434                     mov        dword ptr [rsp + 0x34], r8d
010ec c5f877                         vzeroupper 
010ef e86c02b4ff                     call       0x7f254b9c3e60
010f4 0f1f8400ec110012               nop        dword ptr [rax + rax + 0x120011ec]
010fc 4585ed                         test       r13d, r13d
010ff 0f84a7080000                   je         0x7f254be844ac
01105 498bcd                         mov        rcx, r13
01108 8b3c24                         mov        edi, dword ptr [rsp]
0110b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01110 4533c0                         xor        r8d, r8d
01113 448bd7                         mov        r10d, edi
01116 e9b1f9ffff                     jmp        0x7f254be835cc
0111b bee4ffffff                     mov        esi, 0xffffffe4
01120 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01128 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0112d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01132 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01137 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0113c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01141 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01146 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0114b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01150 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01155 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0115a 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0115e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01162 6690                           nop        
01164 c5f877                         vzeroupper 
01167 e8f401b4ff                     call       0x7f254b9c3e60
0116c 0f1f840064120013               nop        dword ptr [rax + rax + 0x13001264]
01174 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0117d bee4ffffff                     mov        esi, 0xffffffe4
01182 498bea                         mov        rbp, r10
01185 448b1c24                       mov        r11d, dword ptr [rsp]
01189 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01191 448b542404                     mov        r10d, dword ptr [rsp + 4]
01196 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0119e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011a3 4c891424                       mov        qword ptr [rsp], r10
011a7 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
011ac 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
011b1 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
011b6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
011bb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
011c0 4489542424                     mov        dword ptr [rsp + 0x24], r10d
011c5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
011ca 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
011cf 4489742430                     mov        dword ptr [rsp + 0x30], r14d
011d4 895c2438                       mov        dword ptr [rsp + 0x38], ebx
011d8 4489442440                     mov        dword ptr [rsp + 0x40], r8d
011dd 666690                         nop        
011e0 c5f877                         vzeroupper 
011e3 e87801b4ff                     call       0x7f254b9c3e60
011e8 0f1f8400e0120014               nop        dword ptr [rax + rax + 0x140012e0]
011f0 be6effffff                     mov        esi, 0xffffff6e
011f5 498be9                         mov        rbp, r9
011f8 8b1424                         mov        edx, dword ptr [rsp]
011fb 899424c0000000                 mov        dword ptr [rsp + 0xc0], edx
01202 48890424                       mov        qword ptr [rsp], rax
01206 44896c2408                     mov        dword ptr [rsp + 8], r13d
0120b 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
01210 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01215 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0121a 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0121f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01224 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01229 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0122e 4c89742438                     mov        qword ptr [rsp + 0x38], r14
01233 90                             nop        
01234 c5f877                         vzeroupper 
01237 e82401b4ff                     call       0x7f254b9c3e60
0123c 0f1f840034130015               nop        dword ptr [rax + rax + 0x15001334]
01244 448b542404                     mov        r10d, dword ptr [rsp + 4]
01249 bebeffffff                     mov        esi, 0xffffffbe
0124e 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
01256 8b1424                         mov        edx, dword ptr [rsp]
01259 899424c8000000                 mov        dword ptr [rsp + 0xc8], edx
01260 48890424                       mov        qword ptr [rsp], rax
01264 44896c2408                     mov        dword ptr [rsp + 8], r13d
01269 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
0126e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01273 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01278 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0127d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01282 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01287 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0128c 4c89742438                     mov        qword ptr [rsp + 0x38], r14
01291 666690                         nop        
01294 c5f877                         vzeroupper 
01297 e8c400b4ff                     call       0x7f254b9c3e60
0129c 0f1f840094130016               nop        dword ptr [rax + rax + 0x16001394]
012a4 448b542404                     mov        r10d, dword ptr [rsp + 4]
012a9 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012ae eb99                           jmp        0x7f254be83d49
012b0 448b542404                     mov        r10d, dword ptr [rsp + 4]
012b5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012ba eb8d                           jmp        0x7f254be83d49
012bc 8beb                           mov        ebp, ebx
012be 83c510                         add        ebp, 0x10
012c1 be6effffff                     mov        esi, 0xffffff6e
012c6 895c240c                       mov        dword ptr [rsp + 0xc], ebx
012ca 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
012cf 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012d4 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012d9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
012de 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
012e3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
012e8 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
012ed 4489542428                     mov        dword ptr [rsp + 0x28], r10d
012f2 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
012f7 90                             nop        
012f8 c5f877                         vzeroupper 
012fb e86000b4ff                     call       0x7f254b9c3e60
01300 0f1f8400f8130017               nop        dword ptr [rax + rax + 0x170013f8]
01308 8beb                           mov        ebp, ebx
0130a 83c510                         add        ebp, 0x10
0130d be66ffffff                     mov        esi, 0xffffff66
01312 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01316 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0131b 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01320 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01325 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0132a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0132f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01334 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01339 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0133e 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01343 90                             nop        
01344 c5f877                         vzeroupper 
01347 e81400b4ff                     call       0x7f254b9c3e60
0134c 0f1f840044140018               nop        dword ptr [rax + rax + 0x18001444]
01354 bee4ffffff                     mov        esi, 0xffffffe4
01359 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01361 448b1424                       mov        r10d, dword ptr [rsp]
01365 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0136d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01372 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0137a 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0137e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01383 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01387 90                             nop        
01388 c5f877                         vzeroupper 
0138b e8d0ffb3ff                     call       0x7f254b9c3e60
01390 0f1f840088140019               nop        dword ptr [rax + rax + 0x19001488]
01398 bef6ffffff                     mov        esi, 0xfffffff6
0139d 666690                         nop        
013a0 c5f877                         vzeroupper 
013a3 e8b8ffb3ff                     call       0x7f254b9c3e60
013a8 0f1f8400a014001a               nop        dword ptr [rax + rax + 0x1a0014a0]
013b0 bee4ffffff                     mov        esi, 0xffffffe4
013b5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
013bd 448b1424                       mov        r10d, dword ptr [rsp]
013c1 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
013c9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
013ce 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
013d6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013db 4c891424                       mov        qword ptr [rsp], r10
013df 4489442444                     mov        dword ptr [rsp + 0x44], r8d
013e4 c5f877                         vzeroupper 
013e7 e874ffb3ff                     call       0x7f254b9c3e60
013ec 0f1f8400e414001b               nop        dword ptr [rax + rax + 0x1b0014e4]
013f4 bee4ffffff                     mov        esi, 0xffffffe4
013f9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01401 448b1c24                       mov        r11d, dword ptr [rsp]
01405 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0140d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01412 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0141a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0141f 4c891424                       mov        qword ptr [rsp], r10
01423 90                             nop        
01424 c5f877                         vzeroupper 
01427 e834ffb3ff                     call       0x7f254b9c3e60
0142c 0f1f84002415001c               nop        dword ptr [rax + rax + 0x1c001524]
01434 4533c0                         xor        r8d, r8d
01437 4d3bd0                         cmp        r10, r8
0143a bdffffffff                     mov        ebp, 0xffffffff
0143f 7c08                           jl         0x7f254be83f49
01441 400f95c5                       setne      bpl
01445 400fb6ed                       movzx      ebp, bpl
01449 be45ffffff                     mov        esi, 0xffffff45
0144e 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
01456 4889442408                     mov        qword ptr [rsp + 8], rax
0145b 897c2404                       mov        dword ptr [rsp + 4], edi
0145f 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01464 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01469 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
0146e 4c89742430                     mov        qword ptr [rsp + 0x30], r14
01473 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01478 c5f877                         vzeroupper 
0147b e8e0feb3ff                     call       0x7f254b9c3e60
01480 0f1f84007815001d               nop        dword ptr [rax + rax + 0x1d001578]
01488 be45ffffff                     mov        esi, 0xffffff45
0148d 666690                         nop        
01490 c5f877                         vzeroupper 
01493 e8c8feb3ff                     call       0x7f254b9c3e60
01498 0f1f84009015001e               nop        dword ptr [rax + rax + 0x1e001590]
014a0 4d3bc8                         cmp        r9, r8
014a3 bdffffffff                     mov        ebp, 0xffffffff
014a8 7c08                           jl         0x7f254be83fb2
014aa 400f95c5                       setne      bpl
014ae 400fb6ed                       movzx      ebp, bpl
014b2 be45ffffff                     mov        esi, 0xffffff45
014b7 90                             nop        
014b8 c5f877                         vzeroupper 
014bb e8a0feb3ff                     call       0x7f254b9c3e60
014c0 0f1f8400b815001f               nop        dword ptr [rax + rax + 0x1f0015b8]
014c8 493bce                         cmp        rcx, r14
014cb bdffffffff                     mov        ebp, 0xffffffff
014d0 7c08                           jl         0x7f254be83fda
014d2 400f95c5                       setne      bpl
014d6 400fb6ed                       movzx      ebp, bpl
014da be45ffffff                     mov        esi, 0xffffff45
014df 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
014e7 4889442408                     mov        qword ptr [rsp + 8], rax
014ec 897c2404                       mov        dword ptr [rsp + 4], edi
014f0 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
014f5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
014fa 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
014ff 4c89742430                     mov        qword ptr [rsp + 0x30], r14
01504 c5f877                         vzeroupper 
01507 e854feb3ff                     call       0x7f254b9c3e60
0150c 0f1f840004160020               nop        dword ptr [rax + rax + 0x20001604]
01514 bee4ffffff                     mov        esi, 0xffffffe4
01519 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01521 448b1c24                       mov        r11d, dword ptr [rsp]
01525 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0152d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01532 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0153a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0153f 4c891424                       mov        qword ptr [rsp], r10
01543 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01548 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0154d 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01552 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01557 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0155c c5f877                         vzeroupper 
0155f e8fcfdb3ff                     call       0x7f254b9c3e60
01564 0f1f84005c160021               nop        dword ptr [rax + rax + 0x2100165c]
0156c bee4ffffff                     mov        esi, 0xffffffe4
01571 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01576 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0157b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01580 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01585 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0158a 6690                           nop        
0158c c5f877                         vzeroupper 
0158f e8ccfdb3ff                     call       0x7f254b9c3e60
01594 0f1f84008c160022               nop        dword ptr [rax + rax + 0x2200168c]
0159c 418d6801                       lea        ebp, [r8 + 1]
015a0 bee4ffffff                     mov        esi, 0xffffffe4
015a5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
015aa 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
015af 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015b4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015b9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015be 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015c3 4489442438                     mov        dword ptr [rsp + 0x38], r8d
015c8 c5f877                         vzeroupper 
015cb e890fdb3ff                     call       0x7f254b9c3e60
015d0 0f1f8400c8160023               nop        dword ptr [rax + rax + 0x230016c8]
015d8 bee4ffffff                     mov        esi, 0xffffffe4
015dd 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
015e2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015e7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
015ec 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015f1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015f6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
015fb 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01600 c5f877                         vzeroupper 
01603 e858fdb3ff                     call       0x7f254b9c3e60
01608 0f1f840000170024               nop        dword ptr [rax + rax + 0x24001700]
01610 bee4ffffff                     mov        esi, 0xffffffe4
01615 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0161d 448b1c24                       mov        r11d, dword ptr [rsp]
01621 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01629 448b542404                     mov        r10d, dword ptr [rsp + 4]
0162e 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01636 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0163b 4c891424                       mov        qword ptr [rsp], r10
0163f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01644 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01649 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0164e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01653 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01658 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0165d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01662 6690                           nop        
01664 c5f877                         vzeroupper 
01667 e8f4fcb3ff                     call       0x7f254b9c3e60
0166c 0f1f840064170025               nop        dword ptr [rax + rax + 0x25001764]
01674 be6effffff                     mov        esi, 0xffffff6e
01679 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01681 448b1424                       mov        r10d, dword ptr [rsp]
01685 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0168d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01692 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0169a 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0169e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
016a3 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
016a8 89442440                       mov        dword ptr [rsp + 0x40], eax
016ac c5f877                         vzeroupper 
016af e8acfcb3ff                     call       0x7f254b9c3e60
016b4 0f1f8400ac170026               nop        dword ptr [rax + rax + 0x260017ac]
016bc 458bd0                         mov        r10d, r8d
016bf e979f2ffff                     jmp        0x7f254be8343d
016c4 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016cc 4183c208                       add        r10d, 8
016d0 458bc2                         mov        r8d, r10d
016d3 be45ffffff                     mov        esi, 0xffffff45
016d8 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
016e0 448b1c24                       mov        r11d, dword ptr [rsp]
016e4 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
016ec 448b542404                     mov        r10d, dword ptr [rsp + 4]
016f1 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
016f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016fe 4c891424                       mov        qword ptr [rsp], r10
01702 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01707 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0170c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01711 666690                         nop        
01714 c5f877                         vzeroupper 
01717 e844fcb3ff                     call       0x7f254b9c3e60
0171c 0f1f840014180027               nop        dword ptr [rax + rax + 0x27001814]
01724 be45ffffff                     mov        esi, 0xffffff45
01729 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01731 448b1424                       mov        r10d, dword ptr [rsp]
01735 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0173d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01742 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0174a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0174f 4c891424                       mov        qword ptr [rsp], r10
01753 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01758 c5f877                         vzeroupper 
0175b e800fcb3ff                     call       0x7f254b9c3e60
01760 0f1f840058180028               nop        dword ptr [rax + rax + 0x28001858]
01768 beccffffff                     mov        esi, 0xffffffcc
0176d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01775 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01779 666690                         nop        
0177c c5f877                         vzeroupper 
0177f e8dcfbb3ff                     call       0x7f254b9c3e60
01784 0f1f84007c180029               nop        dword ptr [rax + rax + 0x2900187c]
0178c be45ffffff                     mov        esi, 0xffffff45
01791 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01799 448b1424                       mov        r10d, dword ptr [rsp]
0179d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
017a5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
017aa 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
017b2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017b7 4c891424                       mov        qword ptr [rsp], r10
017bb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
017c0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017c5 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
017ca 6690                           nop        
017cc c5f877                         vzeroupper 
017cf e88cfbb3ff                     call       0x7f254b9c3e60
017d4 0f1f8400cc18002a               nop        dword ptr [rax + rax + 0x2a0018cc]
017dc 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
017e4 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
017ec bef6ffffff                     mov        esi, 0xfffffff6
017f1 498be9                         mov        rbp, r9
017f4 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
017fc 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01804 c5f877                         vzeroupper 
01807 e854fbb3ff                     call       0x7f254b9c3e60
0180c 0f1f84000419002b               nop        dword ptr [rax + rax + 0x2b001904]
01814 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
01819 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01821 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01826 beccffffff                     mov        esi, 0xffffffcc
0182b 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
01833 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
0183b 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
01843 48891c24                       mov        qword ptr [rsp], rbx
01847 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
0184c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01851 666690                         nop        
01854 c5f877                         vzeroupper 
01857 e804fbb3ff                     call       0x7f254b9c3e60
0185c 0f1f84005419002c               nop        dword ptr [rax + rax + 0x2c001954]
01864 beccffffff                     mov        esi, 0xffffffcc
01869 895c240c                       mov        dword ptr [rsp + 0xc], ebx
0186d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01872 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01877 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0187c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01881 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01886 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0188b 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01890 c5f877                         vzeroupper 
01893 e8c8fab3ff                     call       0x7f254b9c3e60
01898 0f1f84009019002d               nop        dword ptr [rax + rax + 0x2d001990]
018a0 beccffffff                     mov        esi, 0xffffffcc
018a5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018ad 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
018b2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018b7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
018bc 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018c1 895c2444                       mov        dword ptr [rsp + 0x44], ebx
018c5 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
018ca 6690                           nop        
018cc c5f877                         vzeroupper 
018cf e88cfab3ff                     call       0x7f254b9c3e60
018d4 0f1f8400cc19002e               nop        dword ptr [rax + rax + 0x2e0019cc]
018dc beccffffff                     mov        esi, 0xffffffcc
018e1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018e9 448b1424                       mov        r10d, dword ptr [rsp]
018ed 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
018f5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
018fa 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01902 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01907 4c891424                       mov        qword ptr [rsp], r10
0190b 895c240c                       mov        dword ptr [rsp + 0xc], ebx
0190f 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01914 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01919 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0191e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01923 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01928 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0192d 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01932 6690                           nop        
01934 c5f877                         vzeroupper 
01937 e824fab3ff                     call       0x7f254b9c3e60
0193c 0f1f8400341a002f               nop        dword ptr [rax + rax + 0x2f001a34]
01944 beccffffff                     mov        esi, 0xffffffcc
01949 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01951 448b1424                       mov        r10d, dword ptr [rsp]
01955 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0195d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01962 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0196a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0196f 4c891424                       mov        qword ptr [rsp], r10
01973 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01977 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0197c 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01981 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01986 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0198b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01990 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01995 4489742438                     mov        dword ptr [rsp + 0x38], r14d
0199a 6690                           nop        
0199c c5f877                         vzeroupper 
0199f e8bcf9b3ff                     call       0x7f254b9c3e60
019a4 0f1f84009c1a0030               nop        dword ptr [rax + rax + 0x30001a9c]
019ac 448b1424                       mov        r10d, dword ptr [rsp]
019b0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019b5 4533db                         xor        r11d, r11d
019b8 e92ffeffff                     jmp        0x7f254be842ec
019bd bef6ffffff                     mov        esi, 0xfffffff6
019c2 6690                           nop        
019c4 c5f877                         vzeroupper 
019c7 e894f9b3ff                     call       0x7f254b9c3e60
019cc 0f1f8400c41a0031               nop        dword ptr [rax + rax + 0x31001ac4]
019d4 eb0a                           jmp        0x7f254be844e0
019d6 eb08                           jmp        0x7f254be844e0
019d8 eb06                           jmp        0x7f254be844e0
019da eb04                           jmp        0x7f254be844e0
019dc eb02                           jmp        0x7f254be844e0
019de eb00                           jmp        0x7f254be844e0
019e0 488bf0                         mov        rsi, rax
019e3 e938ecffff                     jmp        0x7f254be83120
019e8 49ba4336e84b257f0000           movabs     r10, 0x7f254be83643
019f2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
019f9 e9e289a7ff                     jmp        0x7f254b8fcee0
019fe e89d55a6ff                     call       0x7f254b8e9aa0
01a03 e936e6ffff                     jmp        0x7f254be82b3e
