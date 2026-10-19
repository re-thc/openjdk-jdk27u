00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c074a7ff                   jne        0x7ff84f8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85ec1b0000                   jne        0x7ff84fe840aa
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 488bde                         mov        rbx, rsi
0004c 8b7638                         mov        esi, dword ptr [rsi + 0x38]
0004f 448b4304                       mov        r8d, dword ptr [rbx + 4]
00053 4489442454                     mov        dword ptr [rsp + 0x54], r8d
00058 458bc8                         mov        r9d, r8d
0005b 442bce                         sub        r9d, esi
0005e 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00066 453bd9                         cmp        r11d, r9d
00069 0f8f55130000                   jg         0x7ff84fe83844
0006f 488b6b08                       mov        rbp, qword ptr [rbx + 8]
00073 4c8b4b20                       mov        r9, qword ptr [rbx + 0x20]
00077 4c638424d0000000               movsxd     r8, dword ptr [rsp + 0xd0]
0007f 4c63de                         movsxd     r11, esi
00082 4c03dd                         add        r11, rbp
00085 4d2bcb                         sub        r9, r11
00088 4d3bc1                         cmp        r8, r9
0008b 0f8f33130000                   jg         0x7ff84fe83844
00091 4c8b7310                       mov        r14, qword ptr [rbx + 0x10]
00095 4c8b6b28                       mov        r13, qword ptr [rbx + 0x28]
00099 4d85ed                         test       r13, r13
0009c 0f84010b0000                   je         0x7ff84fe83023
000a2 33c9                           xor        ecx, ecx
000a4 4c8bda                         mov        r11, rdx
000a7 8b5204                         mov        edx, dword ptr [rdx + 4]
000aa 8b4340                         mov        eax, dword ptr [rbx + 0x40]
000ad 448bc7                         mov        r8d, edi
000b0 85ff                           test       edi, edi
000b2 0f8e98110000                   jle        0x7ff84fe836d0
000b8 89742414                       mov        dword ptr [rsp + 0x14], esi
000bc 4c2bed                         sub        r13, rbp
000bf 448d4ae0                       lea        r9d, [rdx - 0x20]
000c3 8b7c2454                       mov        edi, dword ptr [rsp + 0x54]
000c7 83c7e0                         add        edi, -0x20
000ca 418b7204                       mov        esi, dword ptr [r10 + 4]
000ce 85f6                           test       esi, esi
000d0 0f8622130000                   jbe        0x7ff84fe83878
000d6 897c2420                       mov        dword ptr [rsp + 0x20], edi
000da 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000df 89442410                       mov        dword ptr [rsp + 0x10], eax
000e3 8954243c                       mov        dword ptr [rsp + 0x3c], edx
000e7 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ec 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f1 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
000f6 4c89542408                     mov        qword ptr [rsp + 8], r10
000fb 4489442404                     mov        dword ptr [rsp + 4], r8d
00100 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
00108 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
0010d 4c63d6                         movsxd     r10, esi
00110 4d63d8                         movsxd     r11, r8d
00113 49ffcb                         dec        r11
00116 4d3bda                         cmp        r11, r10
00119 0f83bd120000                   jae        0x7ff84fe8385c
0011f 85c9                           test       ecx, ecx
00121 0f84c4120000                   je         0x7ff84fe8386b
00127 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0012f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00133 4585db                         test       r11d, r11d
00136 0f8609130000                   jbe        0x7ff84fe838c5
0013c 4183fb01                       cmp        r11d, 1
00140 0f86ff120000                   jbe        0x7ff84fe838c5
00146 4183fb02                       cmp        r11d, 2
0014a 0f86f5120000                   jbe        0x7ff84fe838c5
00150 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
00158 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0015c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00161 448b5804                       mov        r11d, dword ptr [rax + 4]
00165 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0016d 448d5af1                       lea        r11d, [rdx - 0xf]
00171 4585db                         test       r11d, r11d
00174 0f8c22130000                   jl         0x7ff84fe8391c
0017a 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00182 4183c2f1                       add        r10d, -0xf
00186 4585d2                         test       r10d, r10d
00189 0f8c14130000                   jl         0x7ff84fe83923
0018f 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00197 4183c3f9                       add        r11d, -7
0019b 4585db                         test       r11d, r11d
0019e 0f8c06130000                   jl         0x7ff84fe8392a
001a4 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
001ac 4489542440                     mov        dword ptr [rsp + 0x40], r10d
001b1 4c8bd0                         mov        r10, rax
001b4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001b9 4c63542440                     movsxd     r10, dword ptr [rsp + 0x40]
001be 4983c2f1                       add        r10, -0xf
001c2 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001ca 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
001cf 4183c3f1                       add        r11d, -0xf
001d3 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
001d8 448bd2                         mov        r10d, edx
001db 458d5af1                       lea        r11d, [r10 - 0xf]
001df 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001e4 4d63d2                         movsxd     r10, r10d
001e7 4983c2f1                       add        r10, -0xf
001eb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001f3 4533d2                         xor        r10d, r10d
001f6 33db                           xor        ebx, ebx
001f8 e9b9010000                     jmp        0x7ff84fe82836
001fd 4533db                         xor        r11d, r11d
00200 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00205 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0020a 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
0020e 4183f803                       cmp        r8d, 3
00212 0f8e59030000                   jle        0x7ff84fe829f1
00218 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0021d 45894b10                       mov        dword ptr [r11 + 0x10], r9d
00221 458b4308                       mov        r8d, dword ptr [r11 + 8]
00225 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00229 448d5afd                       lea        r11d, [rdx - 3]
0022d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00232 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00237 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0023c 45894308                       mov        dword ptr [r11 + 8], r8d
00240 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00248 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
0024d 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00252 4c03542418                     add        r10, qword ptr [rsp + 0x18]
00257 4863542428                     movsxd     rdx, dword ptr [rsp + 0x28]
0025c 4c03d2                         add        r10, rdx
0025f 4d3bda                         cmp        r11, r10
00262 0f8fac0e0000                   jg         0x7ff84fe83594
00268 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0026d 4585db                         test       r11d, r11d
00270 0f8efa0d0000                   jle        0x7ff84fe834f0
00276 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0027b 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
00280 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00285 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0028a 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0028f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00294 4503d5                         add        r10d, r13d
00297 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
0029f 498d7c1b08                     lea        rdi, [r11 + rbx + 8]
002a4 448bdb                         mov        r11d, ebx
002a7 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
002ac 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
002b4 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
002b9 0f8f28090000                   jg         0x7ff84fe83067
002bf 443b5c2424                     cmp        r11d, dword ptr [rsp + 0x24]
002c4 0f8f9e0e0000                   jg         0x7ff84fe835e8
002ca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002cf 4183fa10                       cmp        r10d, 0x10
002d3 0f8f63010000                   jg         0x7ff84fe828bc
002d9 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002dd 0f83e90c0000                   jae        0x7ff84fe8344c
002e3 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
002eb c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002f2 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
002f7 0f83130d0000                   jae        0x7ff84fe83490
002fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00302 4403db                         add        r11d, ebx
00305 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0030d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00312 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00319 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0031e 4503d0                         add        r10d, r8d
00321 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00326 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0032b 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00330 458bc2                         mov        r8d, r10d
00333 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00338 4183fa10                       cmp        r10d, 0x10
0033c 0f8f9e0e0000                   jg         0x7ff84fe83660
00342 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00347 4183fb10                       cmp        r11d, 0x10
0034b 0f8c1f030000                   jl         0x7ff84fe82af0
00351 458bd0                         mov        r10d, r8d
00354 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
00359 0f83bd0b0000                   jae        0x7ff84fe8339c
0035f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00364 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0036b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00370 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00375 0f83f50b0000                   jae        0x7ff84fe833f0
0037b 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00380 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00385 c4817a7f440a08                 vmovdqu    xmmword ptr [r10 + r9 + 8], xmm0
0038c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00391 4503d9                         add        r11d, r9d
00394 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00399 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
003a1 41ffc2                         inc        r10d
003a4 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003a9 0f8d3a070000                   jge        0x7ff84fe82f69
003af 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
003b6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003bb 4f8b44d308                     mov        r8, qword ptr [r11 + r10*8 + 8]
003c0 4d8bd8                         mov        r11, r8
003c3 49c1eb12                       shr        r11, 0x12
003c7 458bdb                         mov        r11d, r11d
003ca 4181e3ffff0300                 and        r11d, 0x3ffff
003d1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003d6 4d8bc8                         mov        r9, r8
003d9 49c1f924                       sar        r9, 0x24
003dd 458bd8                         mov        r11d, r8d
003e0 458bc1                         mov        r8d, r9d
003e3 418bd0                         mov        edx, r8d
003e6 4181e3ffff0100                 and        r11d, 0x1ffff
003ed 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
003f2 4585c0                         test       r8d, r8d
003f5 0f8c950c0000                   jl         0x7ff84fe83510
003fb 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00400 4585c9                         test       r9d, r9d
00403 0f84f4fdffff                   je         0x7ff84fe8267d
00409 448b1c24                       mov        r11d, dword ptr [rsp]
0040d 442bdb                         sub        r11d, ebx
00410 453bcb                         cmp        r9d, r11d
00413 0f8eecfdffff                   jle        0x7ff84fe82685
00419 be45ffffff                     mov        esi, 0xffffff45
0041e 418be9                         mov        ebp, r9d
00421 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00429 666690                         nop        
0042c c5f877                         vzeroupper 
0042f e82c25b4ff                     call       0x7ff84f9c4de0
00434 0f1f84002c050000               nop        dword ptr [rax + rax + 0x52c]
0043c 4183fa30                       cmp        r10d, 0x30
00440 0f8f96040000                   jg         0x7ff84fe82d5c
00446 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0044a 0f831d0e0000                   jae        0x7ff84fe836ed
00450 4c63cb                         movsxd     r9, ebx
00453 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0045b c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00462 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00467 0f83530e0000                   jae        0x7ff84fe83740
0046d 458d5010                       lea        r10d, [r8 + 0x10]
00471 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00479 4963c8                         movsxd     rcx, r8d
0047c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00481 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
00488 453bd5                         cmp        r10d, r13d
0048b 0f8dc6000000                   jge        0x7ff84fe829d7
00491 4c2bc9                         sub        r9, rcx
00494 4963ca                         movsxd     rcx, r10d
00497 4e8d1c09                       lea        r11, [rcx + r9]
0049b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
004a3 0f838b0e0000                   jae        0x7ff84fe837b4
004a9 4d63dd                         movsxd     r11, r13d
004ac 4c2bd9                         sub        r11, rcx
004af 4983c30f                       add        r11, 0xf
004b3 4983e3f0                       and        r11, 0xfffffffffffffff0
004b7 458bdb                         mov        r11d, r11d
004ba 438d4c0310                     lea        ecx, [r11 + r8 + 0x10]
004bf 4c63d9                         movsxd     r11, ecx
004c2 4f8d4c0bf0                     lea        r9, [r11 + r9 - 0x10]
004c7 4c3b8c2488000000               cmp        r9, qword ptr [rsp + 0x88]
004cf 0f835f0e0000                   jae        0x7ff84fe837b4
004d5 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
004da 0f83540e0000                   jae        0x7ff84fe837b4
004e0 4983c3f0                       add        r11, -0x10
004e4 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004ec 0f83420e0000                   jae        0x7ff84fe837b4
004f2 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
004f9 0f8f7d0e0000                   jg         0x7ff84fe837fc
004ff 448bd3                         mov        r10d, ebx
00502 452bd0                         sub        r10d, r8d
00505 6666660f1f840000000000         nop        word ptr [rax + rax]
00510 458bc2                         mov        r8d, r10d
00513 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
0051b 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00523 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0052a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00532 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00537 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
0053e 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00546 4183c310                       add        r11d, 0x10
0054a 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00552 453bdd                         cmp        r11d, r13d
00555 7cb9                           jl         0x7ff84fe82990
00557 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0055c 4403db                         add        r11d, ebx
0055f 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00567 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
0056c e9b5fdffff                     jmp        0x7ff84fe827a6
00571 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00576 4585db                         test       r11d, r11d
00579 7407                           je         0x7ff84fe82a02
0057b 458d58ff                       lea        r11d, [r8 - 1]
0057f 418bd3                         mov        edx, r11d
00582 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00587 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0058b 85d2                           test       edx, edx
0058d 0f84b6040000                   je         0x7ff84fe82ec9
00593 83fa03                         cmp        edx, 3
00596 0f84ba040000                   je         0x7ff84fe82ed6
0059c 83fa02                         cmp        edx, 2
0059f 0f878a000000                   ja         0x7ff84fe82aaf
005a5 3b9424d8000000                 cmp        edx, dword ptr [rsp + 0xd8]
005ac 0f83ff0e0000                   jae        0x7ff84fe83931
005b2 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005b7 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
005bc 85d2                           test       edx, edx
005be 7e54                           jle        0x7ff84fe82a94
005c0 448d4aff                       lea        r9d, [rdx - 1]
005c4 443b8c24d8000000               cmp        r9d, dword ptr [rsp + 0xd8]
005cc 0f8366100000                   jae        0x7ff84fe83ab8
005d2 4863ca                         movsxd     rcx, edx
005d5 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005da 458bc0                         mov        r8d, r8d
005dd 4183c0cc                       add        r8d, -0x34
005e1 41c1e802                       shr        r8d, 2
005e5 458d4c10ff                     lea        r9d, [r8 + rdx - 1]
005ea 41b804000000                   mov        r8d, 4
005f0 c442b8f5c1                     bzhi       r8, r9, r8
005f5 492bc8                         sub        rcx, r8
005f8 48ffc9                         dec        rcx
005fb 4533c0                         xor        r8d, r8d
005fe 4885c9                         test       rcx, rcx
00601 490f4cc8                       cmovl      rcx, r8
00605 8bc9                           mov        ecx, ecx
00607 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0060f e933030000                     jmp        0x7ff84fe82dc7
00614 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0061c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00621 45895a08                       mov        dword ptr [r10 + 8], r11d
00625 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0062a e919fcffff                     jmp        0x7ff84fe826c8
0062f 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00637 48be980fbce200000000           movabs     rsi, 0xe2bc0f98
00641 8beb                           mov        ebp, ebx
00643 90                             nop        
00644 c5f877                         vzeroupper 
00647 e8947da7ff                     call       0x7ff84f8fa860
0064c 0f1f840044070001               nop        dword ptr [rax + rax + 0x1000744]
00654 4885c0                         test       rax, rax
00657 0f84d70e0000                   je         0x7ff84fe839b4
0065d 488bf0                         mov        rsi, rax
00660 c5f877                         vzeroupper 
00663 4881c4c0000000                 add        rsp, 0xc0
0066a 5d                             pop        rbp
0066b e9704db4ff                     jmp        0x7ff84f9c7860
00670 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00675 440354242c                     add        r10d, dword ptr [rsp + 0x2c]
0067a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0067f 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00684 0f8d7b010000                   jge        0x7ff84fe82c85
0068a 4183fb08                       cmp        r11d, 8
0068e 0f8dd4120000                   jge        0x7ff84fe83de8
00694 458bd0                         mov        r10d, r8d
00697 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0069f 0f831b100000                   jae        0x7ff84fe83b40
006a5 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
006aa 430fbe6c1108                   movsx      ebp, byte ptr [r9 + r10 + 8]
006b0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
006b5 443b9c24dc000000               cmp        r11d, dword ptr [rsp + 0xdc]
006bd 0f836d100000                   jae        0x7ff84fe83bb0
006c3 458bd1                         mov        r10d, r9d
006c6 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
006cb 458d5803                       lea        r11d, [r8 + 3]
006cf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006d4 41ffc2                         inc        r10d
006d7 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
006df 443b9c24dc000000               cmp        r11d, dword ptr [rsp + 0xdc]
006e7 0f837f100000                   jae        0x7ff84fe83bec
006ed 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
006f2 4183c303                       add        r11d, 3
006f6 4d63d0                         movsxd     r10, r8d
006f9 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
006fd 420fbe6c1109                   movsx      ebp, byte ptr [rcx + r10 + 9]
00703 443b9c24dc000000               cmp        r11d, dword ptr [rsp + 0xdc]
0070b 0f83a7100000                   jae        0x7ff84fe83c38
00711 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
00716 42886c1909                     mov        byte ptr [rcx + r11 + 9], bpl
0071b 460fbe4c110a                   movsx      r9d, byte ptr [rcx + r10 + 0xa]
00721 46884c190a                     mov        byte ptr [rcx + r11 + 0xa], r9b
00726 460fbe4c110b                   movsx      r9d, byte ptr [rcx + r10 + 0xb]
0072c 46884c190b                     mov        byte ptr [rcx + r11 + 0xb], r9b
00731 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00736 4183fb08                       cmp        r11d, 8
0073a 0f83c0100000                   jae        0x7ff84fe83c80
00740 49bab87eb6e200000000           movabs     r10, 0xe2b67eb8
0074a 4703449a08                     add        r8d, dword ptr [r10 + r11*4 + 8]
0074f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00754 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00759 4183fb04                       cmp        r11d, 4
0075d 7e3d                           jle        0x7ff84fe82c1c
0075f 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00763 83c504                         add        ebp, 4
00766 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0076b 418bd0                         mov        edx, r8d
0076e 6690                           nop        
00770 c5f877                         vzeroupper 
00773 e8687ca7ff                     call       0x7ff84f8fa860
00778 0f1f840070080002               nop        dword ptr [rax + rax + 0x2000870]
00780 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00785 8bd5                           mov        edx, ebp
00787 8bc8                           mov        ecx, eax
00789 666690                         nop        
0078c c5f877                         vzeroupper 
0078f e84c7ca7ff                     call       0x7ff84f8fa860
00794 0f1f84008c080003               nop        dword ptr [rax + rax + 0x300088c]
0079c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
007a1 4183fb08                       cmp        r11d, 8
007a5 0f8eeefbffff                   jle        0x7ff84fe82819
007ab 49bae07eb6e200000000           movabs     r10, 0xe2b67ee0
007b5 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007b9 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
007be 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
007c3 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
007c7 83c508                         add        ebp, 8
007ca 83c208                         add        edx, 8
007cd 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007d2 6690                           nop        
007d4 c5f877                         vzeroupper 
007d7 e8047ca7ff                     call       0x7ff84f8fa860
007dc 0f1f8400d4080004               nop        dword ptr [rax + rax + 0x40008d4]
007e4 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007e9 8bd5                           mov        edx, ebp
007eb 488bc8                         mov        rcx, rax
007ee 6690                           nop        
007f0 c5f877                         vzeroupper 
007f3 e8e87ba7ff                     call       0x7ff84f8fa860
007f8 0f1f8400f0080005               nop        dword ptr [rax + rax + 0x50008f0]
00800 e994fbffff                     jmp        0x7ff84fe82819
00805 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0080a 4183fb30                       cmp        r11d, 0x30
0080e 0f8fe4100000                   jg         0x7ff84fe83d78
00814 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00818 83c5f9                         add        ebp, -7
0081b 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
0081f 458bd0                         mov        r10d, r8d
00822 443bd5                         cmp        r10d, ebp
00825 0f83210d0000                   jae        0x7ff84fe839cc
0082b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00833 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00838 4b8b6c1308                     mov        rbp, qword ptr [r11 + r10 + 8]
0083d 4889ac2498000000               mov        qword ptr [rsp + 0x98], rbp
00845 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0084a 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
0084f 0f83530d0000                   jae        0x7ff84fe83a28
00855 48be28c122e200000000           movabs     rsi, 0xe222c128
0085f 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00863 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00867 4863cd                         movsxd     rcx, ebp
0086a 4883c108                       add        rcx, 8
0086e 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00873 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0087b 4533c9                         xor        r9d, r9d
0087e 6690                           nop        
00880 c5f877                         vzeroupper 
00883 e85871a7ff                     call       0x7ff84f8f9e60
00888 0f1f840080090006               nop        dword ptr [rax + rax + 0x6000980]
00890 83c508                         add        ebp, 8
00893 896c2438                       mov        dword ptr [rsp + 0x38], ebp
00897 3b6c2414                       cmp        ebp, dword ptr [rsp + 0x14]
0089b 0f8ccf0f0000                   jl         0x7ff84fe83cf0
008a1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
008a6 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
008ab 4489542414                     mov        dword ptr [rsp + 0x14], r10d
008b0 e9e4faffff                     jmp        0x7ff84fe82819
008b5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008ba 4d63d3                         movsxd     r10, r11d
008bd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
008c4 c442a8f5db                     bzhi       r11, r11, r10
008c9 c4c1fb92fb                     kmovq      k7, r11
008ce 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
008d4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
008da eb5d                           jmp        0x7ff84fe82db9
008dc 85db                           test       ebx, ebx
008de 0f8c100d0000                   jl         0x7ff84fe83a74
008e4 4585c0                         test       r8d, r8d
008e7 0f8c070d0000                   jl         0x7ff84fe83a74
008ed 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008f2 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
008fa 0f82f40c0000                   jb         0x7ff84fe83a74
00900 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00908 453bdd                         cmp        r11d, r13d
0090b 0f82e30c0000                   jb         0x7ff84fe83a74
00911 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00916 4585d2                         test       r10d, r10d
00919 741e                           je         0x7ff84fe82db9
0091b 4883fa20                       cmp        rdx, 0x20
0091f 7694                           jbe        0x7ff84fe82d35
00921 c5f877                         vzeroupper 
00924 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
0092e 41ffd2                         call       r10
00931 0f1f840000000000               nop        dword ptr [rax + rax]
00939 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
0093e e9e3f9ffff                     jmp        0x7ff84fe827a6
00943 90                             nop        
00944 418bd2                         mov        edx, r10d
00947 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0094c 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00951 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00956 4589449108                     mov        dword ptr [r9 + rdx*4 + 8], r8d
0095b 448d52ff                       lea        r10d, [rdx - 1]
0095f 443bd1                         cmp        r10d, ecx
00962 7fe0                           jg         0x7ff84fe82dc4
00964 4183fa3f                       cmp        r10d, 0x3f
00968 0f8e4a0d0000                   jle        0x7ff84fe83b38
0096e 448bd2                         mov        r10d, edx
00971 41ffca                         dec        r10d
00974 eb0d                           jmp        0x7ff84fe82e03
00976 66660f1f840000000000           nop        word ptr [rax + rax]
00980 458bd0                         mov        r10d, r8d
00983 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00988 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00993 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
0099e 62917e486f849088ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x78]
009a9 62917e487f84908cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x74], zmm0
009b4 62917e486f849048ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xb8]
009bf 62917e487f84904cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xb4], zmm0
009ca 62917e486f849008ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xf8]
009d5 62917e487f84900cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xf4], zmm0
009e0 458d42c0                       lea        r8d, [r10 - 0x40]
009e4 4183f83f                       cmp        r8d, 0x3f
009e8 7f96                           jg         0x7ff84fe82e00
009ea 4183f80f                       cmp        r8d, 0xf
009ee 7e2d                           jle        0x7ff84fe82e9d
009f0 458bc2                         mov        r8d, r10d
009f3 4183c0c0                       add        r8d, -0x40
009f7 90                             nop        
009f8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
009fd 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00a08 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00a13 4183c0f0                       add        r8d, -0x10
00a17 4183f80f                       cmp        r8d, 0xf
00a1b 7fdb                           jg         0x7ff84fe82e78
00a1d 4585c0                         test       r8d, r8d
00a20 0f8ef6fbffff                   jle        0x7ff84fe82a9c
00a26 6690                           nop        
00a28 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a2d 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00a32 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00a37 4789548108                     mov        dword ptr [r9 + r8*4 + 8], r10d
00a3c 41ffc8                         dec        r8d
00a3f 4585c0                         test       r8d, r8d
00a42 7fe4                           jg         0x7ff84fe82ea8
00a44 e9d3fbffff                     jmp        0x7ff84fe82a9c
00a49 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a51 e9cffbffff                     jmp        0x7ff84fe82aa5
00a56 41ffcb                         dec        r11d
00a59 4585db                         test       r11d, r11d
00a5c 7e22                           jle        0x7ff84fe82f00
00a5e 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00a63 45894810                       mov        dword ptr [r8 + 0x10], r9d
00a67 458b4808                       mov        r9d, dword ptr [r8 + 8]
00a6b 4589480c                       mov        dword ptr [r8 + 0xc], r9d
00a6f 45895808                       mov        dword ptr [r8 + 8], r11d
00a73 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a7b e9a5fbffff                     jmp        0x7ff84fe82aa5
00a80 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00a88 48be680fbce200000000           movabs     rsi, 0xe2bc0f68
00a92 8beb                           mov        ebp, ebx
00a94 c5f877                         vzeroupper 
00a97 e84479a7ff                     call       0x7ff84f8fa860
00a9c 0f1f8400940b0007               nop        dword ptr [rax + rax + 0x7000b94]
00aa4 4885c0                         test       rax, rax
00aa7 0f85b0fbffff                   jne        0x7ff84fe82add
00aad bef6ffffff                     mov        esi, 0xfffffff6
00ab2 6690                           nop        
00ab4 c5f877                         vzeroupper 
00ab7 e8a41eb4ff                     call       0x7ff84f9c4de0
00abc 0f1f8400b40b0008               nop        dword ptr [rax + rax + 0x8000bb4]
00ac4 4d63d2                         movsxd     r10, r10d
00ac7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ace c442a8f5db                     bzhi       r11, r11, r10
00ad3 c4c1fb92fb                     kmovq      k7, r11
00ad8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ade 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ae4 e9a1000000                     jmp        0x7ff84fe8300a
00ae9 448b1424                       mov        r10d, dword ptr [rsp]
00aed 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00af5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00afa 4585c0                         test       r8d, r8d
00afd 0f84e10e0000                   je         0x7ff84fe83e64
00b03 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00b0b 4585c9                         test       r9d, r9d
00b0e 0f8c080f0000                   jl         0x7ff84fe83e9c
00b14 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
00b19 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00b21 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00b25 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00b29 85c9                           test       ecx, ecx
00b2b 0f8cfc0e0000                   jl         0x7ff84fe83ead
00b31 3b1424                         cmp        edx, dword ptr [rsp]
00b34 0f82f30e0000                   jb         0x7ff84fe83ead
00b3a 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00b3e 4103ea                         add        ebp, r10d
00b41 418b5004                       mov        edx, dword ptr [r8 + 4]
00b45 3bd5                           cmp        edx, ebp
00b47 0f82e00e0000                   jb         0x7ff84fe83ead
00b4d 4585d2                         test       r10d, r10d
00b50 0f8cd70e0000                   jl         0x7ff84fe83ead
00b56 4585d2                         test       r10d, r10d
00b59 742f                           je         0x7ff84fe8300a
00b5b 498d740808                     lea        rsi, [r8 + rcx + 8]
00b60 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
00b65 4963d2                         movsxd     rdx, r10d
00b68 4883fa20                       cmp        rdx, 0x20
00b6c 0f8652ffffff                   jbe        0x7ff84fe82f44
00b72 c5f877                         vzeroupper 
00b75 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00b7f 41ffd2                         call       r10
00b82 0f1f840000000000               nop        dword ptr [rax + rax]
00b8a 896b38                         mov        dword ptr [rbx + 0x38], ebp
00b8d c5f877                         vzeroupper 
00b90 4881c4c0000000                 add        rsp, 0xc0
00b97 5d                             pop        rbp
00b98 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00b9c 0f8772100000                   ja         0x7ff84fe84094
00ba2 c3                             ret        
00ba3 4d03d8                         add        r11, r8
00ba6 4d3bde                         cmp        r11, r14
00ba9 7e08                           jle        0x7ff84fe83033
00bab 4533ed                         xor        r13d, r13d
00bae e9eff4ffff                     jmp        0x7ff84fe82522
00bb3 4533ed                         xor        r13d, r13d
00bb6 b901000000                     mov        ecx, 1
00bbb e9e4f4ffff                     jmp        0x7ff84fe82524
00bc0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bc5 4d63d2                         movsxd     r10, r10d
00bc8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bcf c442a8f5db                     bzhi       r11, r11, r10
00bd4 c4c1fb92fb                     kmovq      k7, r11
00bd9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bdf 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00be5 eb6b                           jmp        0x7ff84fe830d2
00be7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bec 4585d2                         test       r10d, r10d
00bef 0f841d030000                   je         0x7ff84fe83392
00bf5 85db                           test       ebx, ebx
00bf7 0f8cab0e0000                   jl         0x7ff84fe83f28
00bfd 4585c0                         test       r8d, r8d
00c00 0f8ca20e0000                   jl         0x7ff84fe83f28
00c06 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c0b 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00c13 0f828f0e0000                   jb         0x7ff84fe83f28
00c19 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00c21 453bd5                         cmp        r10d, r13d
00c24 0f827e0e0000                   jb         0x7ff84fe83f28
00c2a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c2f 4585db                         test       r11d, r11d
00c32 741e                           je         0x7ff84fe830d2
00c34 4883fa20                       cmp        rdx, 0x20
00c38 7686                           jbe        0x7ff84fe83040
00c3a c5f877                         vzeroupper 
00c3d 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00c47 41ffd2                         call       r10
00c4a 0f1f840000000000               nop        dword ptr [rax + rax]
00c52 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00c57 4585d2                         test       r10d, r10d
00c5a 0f8ea0010000                   jle        0x7ff84fe83280
00c60 458bdd                         mov        r11d, r13d
00c63 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00c68 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00c70 4503d5                         add        r10d, r13d
00c73 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00c78 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c7d 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00c85 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00c8a 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00c8f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c94 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00c99 0f8dcc000000                   jge        0x7ff84fe831eb
00c9f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00ca4 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00ca9 458bd3                         mov        r10d, r11d
00cac 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00cb1 450f4fd3                       cmovg      r10d, r11d
00cb5 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00cba 4585c9                         test       r9d, r9d
00cbd 0f8c2d0e0000                   jl         0x7ff84fe83f70
00cc3 4585ed                         test       r13d, r13d
00cc6 0f8c240e0000                   jl         0x7ff84fe83f70
00ccc 478d1c0a                       lea        r11d, [r10 + r9]
00cd0 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00cd8 453bc3                         cmp        r8d, r11d
00cdb 0f820f0e0000                   jb         0x7ff84fe83f70
00ce1 458bd5                         mov        r10d, r13d
00ce4 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00ce9 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00cf1 458bd8                         mov        r11d, r8d
00cf4 453bda                         cmp        r11d, r10d
00cf7 0f82f30d0000                   jb         0x7ff84fe83f70
00cfd 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00d02 4585d2                         test       r10d, r10d
00d05 0f8ce50d0000                   jl         0x7ff84fe83f70
00d0b 4585d2                         test       r10d, r10d
00d0e 742c                           je         0x7ff84fe831bc
00d10 4963d2                         movsxd     rdx, r10d
00d13 4883fa20                       cmp        rdx, 0x20
00d17 7738                           ja         0x7ff84fe831d1
00d19 458bda                         mov        r11d, r10d
00d1c 4d63d3                         movsxd     r10, r11d
00d1f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d26 c442a8f5db                     bzhi       r11, r11, r10
00d2b c4c1fb92fb                     kmovq      k7, r11
00d30 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d36 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d3c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d41 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00d46 0f8d4df6ffff                   jge        0x7ff84fe82819
00d4c e903010000                     jmp        0x7ff84fe832d4
00d51 c5f877                         vzeroupper 
00d54 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00d5e 41ffd2                         call       r10
00d61 0f1f840000000000               nop        dword ptr [rax + rax]
00d69 ebd1                           jmp        0x7ff84fe831bc
00d6b 4585c9                         test       r9d, r9d
00d6e 0f8cf00d0000                   jl         0x7ff84fe83fe4
00d74 4585ed                         test       r13d, r13d
00d77 0f8ce70d0000                   jl         0x7ff84fe83fe4
00d7d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00d82 4503d1                         add        r10d, r9d
00d85 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00d8d 453bc2                         cmp        r8d, r10d
00d90 0f82ce0d0000                   jb         0x7ff84fe83fe4
00d96 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d9b 453bc3                         cmp        r8d, r11d
00d9e 0f82c00d0000                   jb         0x7ff84fe83fe4
00da4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00da9 4585db                         test       r11d, r11d
00dac 0f84e7f5ffff                   je         0x7ff84fe82819
00db2 4963d3                         movsxd     rdx, r11d
00db5 4883fa20                       cmp        rdx, 0x20
00db9 7728                           ja         0x7ff84fe83263
00dbb 458bd3                         mov        r10d, r11d
00dbe 4d63d2                         movsxd     r10, r10d
00dc1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dc8 c442a8f5db                     bzhi       r11, r11, r10
00dcd c4c1fb92fb                     kmovq      k7, r11
00dd2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dd8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dde e9b6f5ffff                     jmp        0x7ff84fe82819
00de3 c5f877                         vzeroupper 
00de6 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00df0 41ffd2                         call       r10
00df3 0f1f840000000000               nop        dword ptr [rax + rax]
00dfb e999f5ffff                     jmp        0x7ff84fe82819
00e00 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
00e05 e98ff5ffff                     jmp        0x7ff84fe82819
00e0a 448bdd                         mov        r11d, ebp
00e0d 4d63d3                         movsxd     r10, r11d
00e10 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e17 c442a8f5db                     bzhi       r11, r11, r10
00e1c c4c1fb92fb                     kmovq      k7, r11
00e21 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e27 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e2d 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e32 4403dd                         add        r11d, ebp
00e35 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00e3a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00e3e 418502                         test       dword ptr [r10], eax
00e41 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00e46 0f8d4df5ffff                   jge        0x7ff84fe82819
00e4c 4489b42498000000               mov        dword ptr [rsp + 0x98], r14d
00e54 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e5c 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00e61 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00e69 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00e6d 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00e71 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
00e75 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e7a 410f4feb                       cmovg      ebp, r11d
00e7e 4585d2                         test       r10d, r10d
00e81 0f8ce10b0000                   jl         0x7ff84fe83ee8
00e87 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00e8f 4585c0                         test       r8d, r8d
00e92 0f8cd00b0000                   jl         0x7ff84fe83ee8
00e98 458d1c2a                       lea        r11d, [r10 + rbp]
00e9c 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00ea4 453bc3                         cmp        r8d, r11d
00ea7 0f82bb0b0000                   jb         0x7ff84fe83ee8
00ead 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00eb5 4403f5                         add        r14d, ebp
00eb8 453bc6                         cmp        r8d, r14d
00ebb 0f82a70b0000                   jb         0x7ff84fe83ee8
00ec1 85ed                           test       ebp, ebp
00ec3 0f8c9f0b0000                   jl         0x7ff84fe83ee8
00ec9 85ed                           test       ebp, ebp
00ecb 0f845cffffff                   je         0x7ff84fe832ad
00ed1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ed6 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00edb 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ee3 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00ee8 4863d5                         movsxd     rdx, ebp
00eeb 4883fa20                       cmp        rdx, 0x20
00eef 0f8615ffffff                   jbe        0x7ff84fe8328a
00ef5 c5f877                         vzeroupper 
00ef8 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00f02 41ffd2                         call       r10
00f05 0f1f840000000000               nop        dword ptr [rax + rax]
00f0d e91bffffff                     jmp        0x7ff84fe832ad
00f12 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
00f17 e936fdffff                     jmp        0x7ff84fe830d2
00f1c bee4ffffff                     mov        esi, 0xffffffe4
00f21 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00f29 448b1c24                       mov        r11d, dword ptr [rsp]
00f2d 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00f35 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f3a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00f42 448b542404                     mov        r10d, dword ptr [rsp + 4]
00f47 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00f4f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f54 4c891424                       mov        qword ptr [rsp], r10
00f58 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f5d 666690                         nop        
00f60 c5f877                         vzeroupper 
00f63 e8f819b4ff                     call       0x7ff84f9c4de0
00f68 0f1f84006010000a               nop        dword ptr [rax + rax + 0xa001060]
00f70 bee4ffffff                     mov        esi, 0xffffffe4
00f75 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00f7d 448b1c24                       mov        r11d, dword ptr [rsp]
00f81 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00f89 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f8e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00f96 448b542404                     mov        r10d, dword ptr [rsp + 4]
00f9b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00fa3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fa8 4c891424                       mov        qword ptr [rsp], r10
00fac 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00fb1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00fb6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00fbc c5f877                         vzeroupper 
00fbf e89c19b4ff                     call       0x7ff84f9c4de0
00fc4 0f1f8400bc10000b               nop        dword ptr [rax + rax + 0xb0010bc]
00fcc bee4ffffff                     mov        esi, 0xffffffe4
00fd1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00fd9 448b1424                       mov        r10d, dword ptr [rsp]
00fdd 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00fe5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00fea 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00ff2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ff7 4c891424                       mov        qword ptr [rsp], r10
00ffb 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00fff 90                             nop        
01000 c5f877                         vzeroupper 
01003 e85819b4ff                     call       0x7ff84f9c4de0
01008 0f1f84000011000c               nop        dword ptr [rax + rax + 0xc001100]
01010 bee4ffffff                     mov        esi, 0xffffffe4
01015 498bea                         mov        rbp, r10
01018 448b1424                       mov        r10d, dword ptr [rsp]
0101c 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01024 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01029 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01031 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01036 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0103e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01043 4c891424                       mov        qword ptr [rsp], r10
01047 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0104b 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01050 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01055 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0105a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01060 c5f877                         vzeroupper 
01063 e8f818b4ff                     call       0x7ff84f9c4de0
01068 0f1f84006011000d               nop        dword ptr [rax + rax + 0xd001160]
01070 be45ffffff                     mov        esi, 0xffffff45
01075 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0107d 666690                         nop        
01080 c5f877                         vzeroupper 
01083 e8d818b4ff                     call       0x7ff84f9c4de0
01088 0f1f84008011000e               nop        dword ptr [rax + rax + 0xe001180]
01090 be45ffffff                     mov        esi, 0xffffff45
01095 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0109d 448b1c24                       mov        r11d, dword ptr [rsp]
010a1 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
010a9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010ae 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
010b6 448b442404                     mov        r8d, dword ptr [rsp + 4]
010bb 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
010c3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
010c8 4c891c24                       mov        qword ptr [rsp], r11
010cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
010d6 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
010db 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
010e0 895c2410                       mov        dword ptr [rsp + 0x10], ebx
010e4 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
010e9 4489442414                     mov        dword ptr [rsp + 0x14], r8d
010ee 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
010f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
010f8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
010fd 89542430                       mov        dword ptr [rsp + 0x30], edx
01101 666690                         nop        
01104 c5f877                         vzeroupper 
01107 e85418b4ff                     call       0x7ff84f9c4de0
0110c 0f1f84000412000f               nop        dword ptr [rax + rax + 0xf001204]
01114 4d3bda                         cmp        r11, r10
01117 bdffffffff                     mov        ebp, 0xffffffff
0111c 7c08                           jl         0x7ff84fe835a6
0111e 400f95c5                       setne      bpl
01122 400fb6ed                       movzx      ebp, bpl
01126 be45ffffff                     mov        esi, 0xffffff45
0112b 448b1c24                       mov        r11d, dword ptr [rsp]
0112f 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01137 448b442404                     mov        r8d, dword ptr [rsp + 4]
0113c 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
01144 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01149 4c891c24                       mov        qword ptr [rsp], r11
0114d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01151 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01156 6690                           nop        
01158 c5f877                         vzeroupper 
0115b e80018b4ff                     call       0x7ff84f9c4de0
01160 0f1f840058120010               nop        dword ptr [rax + rax + 0x10001258]
01168 be45ffffff                     mov        esi, 0xffffff45
0116d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01175 448b1424                       mov        r10d, dword ptr [rsp]
01179 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01181 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01186 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0118e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01193 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0119b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011a0 4c891424                       mov        qword ptr [rsp], r10
011a4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
011a9 4489542408                     mov        dword ptr [rsp + 8], r10d
011ae 48894424f8                     mov        qword ptr [rsp - 8], rax
011b3 8b442414                       mov        eax, dword ptr [rsp + 0x14]
011b7 8944240c                       mov        dword ptr [rsp + 0xc], eax
011bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c0 895c2410                       mov        dword ptr [rsp + 0x10], ebx
011c4 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
011c9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
011ce 6690                           nop        
011d0 c5f877                         vzeroupper 
011d3 e88817b4ff                     call       0x7ff84f9c4de0
011d8 0f1f8400d0120011               nop        dword ptr [rax + rax + 0x110012d0]
011e0 be45ffffff                     mov        esi, 0xffffff45
011e5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
011ed 448b1c24                       mov        r11d, dword ptr [rsp]
011f1 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
011f9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011fe 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01206 448b542404                     mov        r10d, dword ptr [rsp + 4]
0120b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01213 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01218 4c891424                       mov        qword ptr [rsp], r10
0121c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01221 44895c2408                     mov        dword ptr [rsp + 8], r11d
01226 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0122b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01230 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01235 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0123a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0123f 90                             nop        
01240 c5f877                         vzeroupper 
01243 e81817b4ff                     call       0x7ff84f9c4de0
01248 0f1f840040130012               nop        dword ptr [rax + rax + 0x12001340]
01250 85c0                           test       eax, eax
01252 0f8480090000                   je         0x7ff84fe84058
01258 4c8bc0                         mov        r8, rax
0125b 8b0c24                         mov        ecx, dword ptr [rsp]
0125e 89742414                       mov        dword ptr [rsp + 0x14], esi
01262 4533c9                         xor        r9d, r9d
01265 448bd1                         mov        r10d, ecx
01268 e9b8f8ffff                     jmp        0x7ff84fe82fa5
0126d bee4ffffff                     mov        esi, 0xffffffe4
01272 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0127a 448b1c24                       mov        r11d, dword ptr [rsp]
0127e 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01286 448b542404                     mov        r10d, dword ptr [rsp + 4]
0128b 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01293 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01298 4c891424                       mov        qword ptr [rsp], r10
0129c 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
012a1 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
012a6 895c2440                       mov        dword ptr [rsp + 0x40], ebx
012aa 895c2444                       mov        dword ptr [rsp + 0x44], ebx
012ae 6690                           nop        
012b0 c5f877                         vzeroupper 
012b3 e8a816b4ff                     call       0x7ff84f9c4de0
012b8 0f1f8400b0130013               nop        dword ptr [rax + rax + 0x130013b0]
012c0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
012c9 bee4ffffff                     mov        esi, 0xffffffe4
012ce 498bea                         mov        rbp, r10
012d1 448b1c24                       mov        r11d, dword ptr [rsp]
012d5 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
012dd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012e2 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
012ea 448b542404                     mov        r10d, dword ptr [rsp + 4]
012ef 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
012f7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012fc 4c891424                       mov        qword ptr [rsp], r10
01300 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01305 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0130a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0130f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01314 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01319 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0131d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01322 6690                           nop        
01324 c5f877                         vzeroupper 
01327 e83416b4ff                     call       0x7ff84f9c4de0
0132c 0f1f840024140014               nop        dword ptr [rax + rax + 0x14001424]
01334 8beb                           mov        ebp, ebx
01336 83c510                         add        ebp, 0x10
01339 be6effffff                     mov        esi, 0xffffff6e
0133e 448b1c24                       mov        r11d, dword ptr [rsp]
01342 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0134a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0134f 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01357 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0135c 4c891424                       mov        qword ptr [rsp], r10
01360 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01364 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01369 666690                         nop        
0136c c5f877                         vzeroupper 
0136f e8ec15b4ff                     call       0x7ff84f9c4de0
01374 0f1f84006c140015               nop        dword ptr [rax + rax + 0x1500146c]
0137c 8beb                           mov        ebp, ebx
0137e 83c510                         add        ebp, 0x10
01381 be66ffffff                     mov        esi, 0xffffff66
01386 448b1424                       mov        r10d, dword ptr [rsp]
0138a 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01392 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01397 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0139f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013a4 4c891424                       mov        qword ptr [rsp], r10
013a8 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013ac 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
013b1 666690                         nop        
013b4 c5f877                         vzeroupper 
013b7 e8a415b4ff                     call       0x7ff84f9c4de0
013bc 0f1f8400b4140016               nop        dword ptr [rax + rax + 0x160014b4]
013c4 be17000000                     mov        esi, 0x17
013c9 666690                         nop        
013cc c5f877                         vzeroupper 
013cf e88c15b4ff                     call       0x7ff84f9c4de0
013d4 0f1f8400cc140017               nop        dword ptr [rax + rax + 0x170014cc]
013dc 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
013e4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013e9 eb0d                           jmp        0x7ff84fe83878
013eb 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
013f3 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013f8 be6effffff                     mov        esi, 0xffffff6e
013fd 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01405 4c89542408                     mov        qword ptr [rsp + 8], r10
0140a 89442410                       mov        dword ptr [rsp + 0x10], eax
0140e 897c2418                       mov        dword ptr [rsp + 0x18], edi
01412 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01417 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0141c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01421 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01425 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0142a 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0142f 90                             nop        
01430 c5f877                         vzeroupper 
01433 e82815b4ff                     call       0x7ff84f9c4de0
01438 0f1f840030150018               nop        dword ptr [rax + rax + 0x18001530]
01440 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01445 bebeffffff                     mov        esi, 0xffffffbe
0144a 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01452 448b0424                       mov        r8d, dword ptr [rsp]
01456 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0145e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01463 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0146b 4c89542408                     mov        qword ptr [rsp + 8], r10
01470 890424                         mov        dword ptr [rsp], eax
01473 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01478 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0147d 897c2414                       mov        dword ptr [rsp + 0x14], edi
01481 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01486 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0148a 6690                           nop        
0148c c5f877                         vzeroupper 
0148f e8cc14b4ff                     call       0x7ff84f9c4de0
01494 0f1f84008c150019               nop        dword ptr [rax + rax + 0x1900158c]
0149c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014a1 eba2                           jmp        0x7ff84fe838c5
014a3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014a8 eb9b                           jmp        0x7ff84fe838c5
014aa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014af eb94                           jmp        0x7ff84fe838c5
014b1 bee4ffffff                     mov        esi, 0xffffffe4
014b6 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
014be 448b0424                       mov        r8d, dword ptr [rsp]
014c2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
014ca 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014cf 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
014d7 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014dc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
014e4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014e9 4c891c24                       mov        qword ptr [rsp], r11
014ed 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014f2 44895c2408                     mov        dword ptr [rsp + 8], r11d
014f7 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
014fc 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01501 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01505 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0150a 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0150f 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01514 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01519 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0151e 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01522 6690                           nop        
01524 c5f877                         vzeroupper 
01527 e83414b4ff                     call       0x7ff84f9c4de0
0152c 0f1f84002416001a               nop        dword ptr [rax + rax + 0x1a001624]
01534 bef6ffffff                     mov        esi, 0xfffffff6
01539 666690                         nop        
0153c c5f877                         vzeroupper 
0153f e81c14b4ff                     call       0x7ff84f9c4de0
01544 0f1f84003c16001b               nop        dword ptr [rax + rax + 0x1b00163c]
0154c bee4ffffff                     mov        esi, 0xffffffe4
01551 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01559 448b1424                       mov        r10d, dword ptr [rsp]
0155d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01565 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0156a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01572 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01577 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0157f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01584 4c891424                       mov        qword ptr [rsp], r10
01588 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0158d 4489542408                     mov        dword ptr [rsp + 8], r10d
01592 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01597 90                             nop        
01598 c5f877                         vzeroupper 
0159b e8c013b4ff                     call       0x7ff84f9c4de0
015a0 0f1f84009816001c               nop        dword ptr [rax + rax + 0x1c001698]
015a8 bee4ffffff                     mov        esi, 0xffffffe4
015ad 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
015b5 448b1c24                       mov        r11d, dword ptr [rsp]
015b9 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
015c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015c6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
015ce 448b542404                     mov        r10d, dword ptr [rsp + 4]
015d3 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
015db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015e0 4c891424                       mov        qword ptr [rsp], r10
015e4 c5f877                         vzeroupper 
015e7 e87413b4ff                     call       0x7ff84f9c4de0
015ec 0f1f8400e416001d               nop        dword ptr [rax + rax + 0x1d0016e4]
015f4 beccffffff                     mov        esi, 0xffffffcc
015f9 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01601 448b1424                       mov        r10d, dword ptr [rsp]
01605 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0160d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01612 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0161a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0161f 4c891424                       mov        qword ptr [rsp], r10
01623 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01627 90                             nop        
01628 c5f877                         vzeroupper 
0162b e83013b4ff                     call       0x7ff84f9c4de0
01630 0f1f84002817001e               nop        dword ptr [rax + rax + 0x1e001728]
01638 be6effffff                     mov        esi, 0xffffff6e
0163d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01645 448b0c24                       mov        r9d, dword ptr [rsp]
01649 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
01651 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01656 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0165e 448b442404                     mov        r8d, dword ptr [rsp + 4]
01663 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0166b 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01670 4489442408                     mov        dword ptr [rsp + 8], r8d
01675 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0167a 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0167f 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01683 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01688 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0168d 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01692 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01697 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0169c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
016a1 89542440                       mov        dword ptr [rsp + 0x40], edx
016a5 666690                         nop        
016a8 c5f877                         vzeroupper 
016ab e8b012b4ff                     call       0x7ff84f9c4de0
016b0 0f1f8400a817001f               nop        dword ptr [rax + rax + 0x1f0017a8]
016b8 458bc2                         mov        r8d, r10d
016bb e95df3ffff                     jmp        0x7ff84fe82e9d
016c0 bee4ffffff                     mov        esi, 0xffffffe4
016c5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
016cd 448b1424                       mov        r10d, dword ptr [rsp]
016d1 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
016d9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016de 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016e6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016eb 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
016f3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016f8 4c891424                       mov        qword ptr [rsp], r10
016fc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01701 4489542408                     mov        dword ptr [rsp + 8], r10d
01706 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0170b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01710 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01715 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0171a 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0171f 90                             nop        
01720 c5f877                         vzeroupper 
01723 e83812b4ff                     call       0x7ff84f9c4de0
01728 0f1f840020180020               nop        dword ptr [rax + rax + 0x20001820]
01730 bee4ffffff                     mov        esi, 0xffffffe4
01735 448b1c24                       mov        r11d, dword ptr [rsp]
01739 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01741 448b542404                     mov        r10d, dword ptr [rsp + 4]
01746 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0174e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01753 4c891424                       mov        qword ptr [rsp], r10
01757 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0175c c5f877                         vzeroupper 
0175f e8fc11b4ff                     call       0x7ff84f9c4de0
01764 0f1f84005c180021               nop        dword ptr [rax + rax + 0x2100185c]
0176c 418d6801                       lea        ebp, [r8 + 1]
01770 bee4ffffff                     mov        esi, 0xffffffe4
01775 448b1424                       mov        r10d, dword ptr [rsp]
01779 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01781 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01786 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0178e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01793 4c891424                       mov        qword ptr [rsp], r10
01797 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0179c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017a1 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017a6 6690                           nop        
017a8 c5f877                         vzeroupper 
017ab e8b011b4ff                     call       0x7ff84f9c4de0
017b0 0f1f8400a8180022               nop        dword ptr [rax + rax + 0x220018a8]
017b8 bee4ffffff                     mov        esi, 0xffffffe4
017bd 448b1c24                       mov        r11d, dword ptr [rsp]
017c1 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
017c9 448b542404                     mov        r10d, dword ptr [rsp + 4]
017ce 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
017d6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017db 4c891424                       mov        qword ptr [rsp], r10
017df 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017e4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017e9 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017ee 6690                           nop        
017f0 c5f877                         vzeroupper 
017f3 e86811b4ff                     call       0x7ff84f9c4de0
017f8 0f1f8400f0180023               nop        dword ptr [rax + rax + 0x230018f0]
01800 bee4ffffff                     mov        esi, 0xffffffe4
01805 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0180d 448b1c24                       mov        r11d, dword ptr [rsp]
01811 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01819 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0181e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01826 448b542404                     mov        r10d, dword ptr [rsp + 4]
0182b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01833 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01838 4c891424                       mov        qword ptr [rsp], r10
0183c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01841 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01846 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0184b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01850 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01855 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0185a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0185f 90                             nop        
01860 c5f877                         vzeroupper 
01863 e8f810b4ff                     call       0x7ff84f9c4de0
01868 0f1f840060190024               nop        dword ptr [rax + rax + 0x24001960]
01870 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01878 4183c208                       add        r10d, 8
0187c 458bca                         mov        r9d, r10d
0187f be45ffffff                     mov        esi, 0xffffff45
01884 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0188c 448b1c24                       mov        r11d, dword ptr [rsp]
01890 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01898 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0189d 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018a5 448b542404                     mov        r10d, dword ptr [rsp + 4]
018aa 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
018b2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018b7 4c891424                       mov        qword ptr [rsp], r10
018bb 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018c0 4489542408                     mov        dword ptr [rsp + 8], r10d
018c5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
018ca 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
018cf 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
018d4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018d9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
018de 4489542428                     mov        dword ptr [rsp + 0x28], r10d
018e3 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
018e8 c5f877                         vzeroupper 
018eb e87010b4ff                     call       0x7ff84f9c4de0
018f0 0f1f8400e8190025               nop        dword ptr [rax + rax + 0x250019e8]
018f8 be45ffffff                     mov        esi, 0xffffff45
018fd 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01905 448b1424                       mov        r10d, dword ptr [rsp]
01909 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01911 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01916 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0191e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01923 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0192b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01930 4c891424                       mov        qword ptr [rsp], r10
01934 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01939 4489542408                     mov        dword ptr [rsp + 8], r10d
0193e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01943 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01948 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0194d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01952 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01957 90                             nop        
01958 c5f877                         vzeroupper 
0195b e80010b4ff                     call       0x7ff84f9c4de0
01960 0f1f8400581a0026               nop        dword ptr [rax + rax + 0x26001a58]
01968 be45ffffff                     mov        esi, 0xffffff45
0196d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01975 448b1424                       mov        r10d, dword ptr [rsp]
01979 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01981 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01986 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0198e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01993 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0199b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019a0 4c891424                       mov        qword ptr [rsp], r10
019a4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019a9 4489542408                     mov        dword ptr [rsp + 8], r10d
019ae 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
019b3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
019b8 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
019bd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019c2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019c7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019cc 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
019d1 666690                         nop        
019d4 c5f877                         vzeroupper 
019d7 e8840fb4ff                     call       0x7ff84f9c4de0
019dc 0f1f8400d41a0027               nop        dword ptr [rax + rax + 0x27001ad4]
019e4 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
019ec 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
019f4 bef6ffffff                     mov        esi, 0xfffffff6
019f9 498beb                         mov        rbp, r11
019fc 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01a04 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01a0c c5f877                         vzeroupper 
01a0f e84c0fb4ff                     call       0x7ff84f9c4de0
01a14 0f1f84000c1b0028               nop        dword ptr [rax + rax + 0x28001b0c]
01a1c 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
01a21 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a29 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
01a2d beccffffff                     mov        esi, 0xffffffcc
01a32 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01a3a 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
01a42 898c24dc000000                 mov        dword ptr [rsp + 0xdc], ecx
01a49 48891c24                       mov        qword ptr [rsp], rbx
01a4d 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01a52 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a57 90                             nop        
01a58 c5f877                         vzeroupper 
01a5b e8000fb4ff                     call       0x7ff84f9c4de0
01a60 0f1f8400581b0029               nop        dword ptr [rax + rax + 0x29001b58]
01a68 beccffffff                     mov        esi, 0xffffffcc
01a6d 448b1c24                       mov        r11d, dword ptr [rsp]
01a71 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01a79 448b542404                     mov        r10d, dword ptr [rsp + 4]
01a7e 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01a86 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a8b 4c891424                       mov        qword ptr [rsp], r10
01a8f 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01a93 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01a98 c5f877                         vzeroupper 
01a9b e8c00eb4ff                     call       0x7ff84f9c4de0
01aa0 0f1f8400981b002a               nop        dword ptr [rax + rax + 0x2a001b98]
01aa8 beccffffff                     mov        esi, 0xffffffcc
01aad 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01ab5 448b1c24                       mov        r11d, dword ptr [rsp]
01ab9 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01ac1 448b542404                     mov        r10d, dword ptr [rsp + 4]
01ac6 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01ace 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ad3 4c891424                       mov        qword ptr [rsp], r10
01ad7 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01adb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01ae0 c5f877                         vzeroupper 
01ae3 e8780eb4ff                     call       0x7ff84f9c4de0
01ae8 0f1f8400e01b002b               nop        dword ptr [rax + rax + 0x2b001be0]
01af0 beccffffff                     mov        esi, 0xffffffcc
01af5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01afd 448b1c24                       mov        r11d, dword ptr [rsp]
01b01 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01b09 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b0e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b16 448b542404                     mov        r10d, dword ptr [rsp + 4]
01b1b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01b23 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b28 4c891424                       mov        qword ptr [rsp], r10
01b2c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b31 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b36 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01b3a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b3f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b44 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01b49 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b4e 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01b53 90                             nop        
01b54 c5f877                         vzeroupper 
01b57 e8040eb4ff                     call       0x7ff84f9c4de0
01b5c 0f1f8400541c002c               nop        dword ptr [rax + rax + 0x2c001c54]
01b64 beccffffff                     mov        esi, 0xffffffcc
01b69 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b71 448b1424                       mov        r10d, dword ptr [rsp]
01b75 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b7d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b82 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b8a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b8f 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b97 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b9c 4c891424                       mov        qword ptr [rsp], r10
01ba0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ba5 4489542408                     mov        dword ptr [rsp + 8], r10d
01baa 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01bae 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01bb3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01bb8 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01bbd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bc2 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01bc7 90                             nop        
01bc8 c5f877                         vzeroupper 
01bcb e8900db4ff                     call       0x7ff84f9c4de0
01bd0 0f1f8400c81c002d               nop        dword ptr [rax + rax + 0x2d001cc8]
01bd8 448b1424                       mov        r10d, dword ptr [rsp]
01bdc 89742414                       mov        dword ptr [rsp + 0x14], esi
01be0 4533c0                         xor        r8d, r8d
01be3 e90cfeffff                     jmp        0x7ff84fe83e74
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 666690                         nop        
01bf0 c5f877                         vzeroupper 
01bf3 e8680db4ff                     call       0x7ff84f9c4de0
01bf8 0f1f8400f01c002e               nop        dword ptr [rax + rax + 0x2e001cf0]
01c00 eb0a                           jmp        0x7ff84fe8408c
01c02 eb08                           jmp        0x7ff84fe8408c
01c04 eb06                           jmp        0x7ff84fe8408c
01c06 eb04                           jmp        0x7ff84fe8408c
01c08 eb02                           jmp        0x7ff84fe8408c
01c0a eb00                           jmp        0x7ff84fe8408c
01c0c 488bf0                         mov        rsi, rax
01c0f e94ceaffff                     jmp        0x7ff84fe82ae0
01c14 49ba1830e84ff87f0000           movabs     r10, 0x7ff84fe83018
01c1e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c25 e9368ea7ff                     jmp        0x7ff84f8fcee0
01c2a e8f159a6ff                     call       0x7ff84f8e9aa0
01c2f e90ae4ffff                     jmp        0x7ff84fe824be
01c34 f4                             hlt        
01c35 f4                             hlt        
01c36 f4                             hlt        
01c37 f4                             hlt        
