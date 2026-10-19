00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854072a7ff                   jne        0x7fc50b8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85241c0000                   jne        0x7fc50be84362
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bc7                         mov        r8d, edi
0004e 488bee                         mov        rbp, rsi
00051 8b7638                         mov        esi, dword ptr [rsi + 0x38]
00054 448b5504                       mov        r10d, dword ptr [rbp + 4]
00058 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0005d 458bda                         mov        r11d, r10d
00060 442bde                         sub        r11d, esi
00063 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
0006b 453bd3                         cmp        r10d, r11d
0006e 0f8f8c130000                   jg         0x7fc50be83b00
00074 488b4508                       mov        rax, qword ptr [rbp + 8]
00078 4c8b4d20                       mov        r9, qword ptr [rbp + 0x20]
0007c 4c639c24d0000000               movsxd     r11, dword ptr [rsp + 0xd0]
00084 4c63d6                         movsxd     r10, esi
00087 4c03d0                         add        r10, rax
0008a 4d2bca                         sub        r9, r10
0008d 4d3bd9                         cmp        r11, r9
00090 0f8f6a130000                   jg         0x7fc50be83b00
00096 4c8b7510                       mov        r14, qword ptr [rbp + 0x10]
0009a 4c8b6d28                       mov        r13, qword ptr [rbp + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f84130b0000                   je         0x7fc50be832ba
000a7 33db                           xor        ebx, ebx
000a9 4c8bda                         mov        r11, rdx
000ac 8b5204                         mov        edx, dword ptr [rdx + 4]
000af 8b7d40                         mov        edi, dword ptr [rbp + 0x40]
000b2 4585c0                         test       r8d, r8d
000b5 0f8ed5110000                   jle        0x7fc50be83990
000bb 89742414                       mov        dword ptr [rsp + 0x14], esi
000bf 4c2be8                         sub        r13, rax
000c2 448d4ae0                       lea        r9d, [rdx - 0x20]
000c6 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
000ca 83c1e0                         add        ecx, -0x20
000cd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d2 418b7204                       mov        esi, dword ptr [r10 + 4]
000d6 85f6                           test       esi, esi
000d8 0f8656130000                   jbe        0x7fc50be83b34
000de 894c2420                       mov        dword ptr [rsp + 0x20], ecx
000e2 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000e7 897c2410                       mov        dword ptr [rsp + 0x10], edi
000eb 8954243c                       mov        dword ptr [rsp + 0x3c], edx
000ef 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f4 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f9 4889442418                     mov        qword ptr [rsp + 0x18], rax
000fe 4489442404                     mov        dword ptr [rsp + 4], r8d
00103 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0010b 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
00110 4c63d6                         movsxd     r10, esi
00113 4d63d8                         movsxd     r11, r8d
00116 49ffcb                         dec        r11
00119 4d3bda                         cmp        r11, r10
0011c 0f83f6120000                   jae        0x7fc50be83b18
00122 85db                           test       ebx, ebx
00124 0f84fd120000                   je         0x7fc50be83b27
0012a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00132 458b5304                       mov        r10d, dword ptr [r11 + 4]
00136 4585d2                         test       r10d, r10d
00139 0f8642130000                   jbe        0x7fc50be83b81
0013f 4183fa01                       cmp        r10d, 1
00143 0f8638130000                   jbe        0x7fc50be83b81
00149 4183fa02                       cmp        r10d, 2
0014d 0f862e130000                   jbe        0x7fc50be83b81
00153 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0015b 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0015f 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00164 448b5704                       mov        r10d, dword ptr [rdi + 4]
00168 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00170 448d52f1                       lea        r10d, [rdx - 0xf]
00174 4585d2                         test       r10d, r10d
00177 0f8c5b130000                   jl         0x7fc50be83bd8
0017d 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00185 4183c3f1                       add        r11d, -0xf
00189 4585db                         test       r11d, r11d
0018c 0f8c4d130000                   jl         0x7fc50be83bdf
00192 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
0019a 4183c2f9                       add        r10d, -7
0019e 4585d2                         test       r10d, r10d
001a1 0f8c3f130000                   jl         0x7fc50be83be6
001a7 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
001af 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
001b4 4c8bd7                         mov        r10, rdi
001b7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001bc 4d63d3                         movsxd     r10, r11d
001bf 4983c2f1                       add        r10, -0xf
001c3 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001cb 458d53f1                       lea        r10d, [r11 - 0xf]
001cf 4489542444                     mov        dword ptr [rsp + 0x44], r10d
001d4 448bd2                         mov        r10d, edx
001d7 458d42f1                       lea        r8d, [r10 - 0xf]
001db 4489442450                     mov        dword ptr [rsp + 0x50], r8d
001e0 4d63d2                         movsxd     r10, r10d
001e3 4983c2f1                       add        r10, -0xf
001e7 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001ef 4533d2                         xor        r10d, r10d
001f2 33db                           xor        ebx, ebx
001f4 e9bf010000                     jmp        0x7fc50be82ab8
001f9 4533c0                         xor        r8d, r8d
001fc 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00201 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00206 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
0020a 448bda                         mov        r11d, edx
0020d 4183fb03                       cmp        r11d, 3
00211 0f8e5a030000                   jle        0x7fc50be82c71
00217 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0021c 41894b10                       mov        dword ptr [r11 + 0x10], ecx
00220 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00224 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00229 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0022d 448d5afd                       lea        r11d, [rdx - 3]
00231 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00236 4d8bd8                         mov        r11, r8
00239 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0023e 45894308                       mov        dword ptr [r11 + 8], r8d
00242 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0024a 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
0024f 4c635c2414                     movsxd     r11, dword ptr [rsp + 0x14]
00254 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
00259 4863542428                     movsxd     rdx, dword ptr [rsp + 0x28]
0025e 4c03da                         add        r11, rdx
00261 4d3bd3                         cmp        r10, r11
00264 0f8fea0e0000                   jg         0x7fc50be83854
0026a 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0026f 4585d2                         test       r10d, r10d
00272 0f8e380e0000                   jle        0x7fc50be837b0
00278 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
0027d 4403742428                     add        r14d, dword ptr [rsp + 0x28]
00282 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00287 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0028c 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00291 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00296 4503d6                         add        r10d, r14d
00299 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
002a1 498d7c1b08                     lea        rdi, [r11 + rbx + 8]
002a6 448bdb                         mov        r11d, ebx
002a9 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
002ae 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
002b6 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
002bb 0f8f3d090000                   jg         0x7fc50be832fe
002c1 443b5c2424                     cmp        r11d, dword ptr [rsp + 0x24]
002c6 0f8fdc0e0000                   jg         0x7fc50be838a8
002cc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002d1 4183fa10                       cmp        r10d, 0x10
002d5 0f8f61010000                   jg         0x7fc50be82b3c
002db 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002df 0f83270d0000                   jae        0x7fc50be8370c
002e5 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
002ed c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002f4 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
002f9 0f83510d0000                   jae        0x7fc50be83750
002ff 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00304 4403d3                         add        r10d, ebx
00307 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0030f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00314 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0031b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00320 4503d8                         add        r11d, r8d
00323 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00328 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0032d 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00332 458bc2                         mov        r8d, r10d
00335 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0033a 4183fa10                       cmp        r10d, 0x10
0033e 0f8fdc0e0000                   jg         0x7fc50be83920
00344 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00349 4183fb10                       cmp        r11d, 0x10
0034d 0f8c1d030000                   jl         0x7fc50be82d70
00353 458bd0                         mov        r10d, r8d
00356 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
0035b 0f83fd0b0000                   jae        0x7fc50be8365e
00361 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00366 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0036d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00372 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00377 0f83330c0000                   jae        0x7fc50be836b0
0037d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00382 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00387 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
0038e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00393 4503d8                         add        r11d, r8d
00396 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0039b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
003a3 41ffc2                         inc        r10d
003a6 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003ab 0f8d48070000                   jge        0x7fc50be831f9
003b1 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
003b8 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003bd 4f8b5cd308                     mov        r11, qword ptr [r11 + r10*8 + 8]
003c2 4d8bc3                         mov        r8, r11
003c5 49c1e812                       shr        r8, 0x12
003c9 458bc0                         mov        r8d, r8d
003cc 4181e0ffff0300                 and        r8d, 0x3ffff
003d3 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003d8 4d8bcb                         mov        r9, r11
003db 49c1f924                       sar        r9, 0x24
003df 458bc3                         mov        r8d, r11d
003e2 458bd9                         mov        r11d, r9d
003e5 418bd3                         mov        edx, r11d
003e8 4181e0ffff0100                 and        r8d, 0x1ffff
003ef 4489442428                     mov        dword ptr [rsp + 0x28], r8d
003f4 4585db                         test       r11d, r11d
003f7 0f8cd30c0000                   jl         0x7fc50be837d0
003fd 4585c0                         test       r8d, r8d
00400 0f84f3fdffff                   je         0x7fc50be828f9
00406 448b0424                       mov        r8d, dword ptr [rsp]
0040a 442bc3                         sub        r8d, ebx
0040d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00412 453bd8                         cmp        r11d, r8d
00415 0f8ee6fdffff                   jle        0x7fc50be82901
0041b be45ffffff                     mov        esi, 0xffffff45
00420 418beb                         mov        ebp, r11d
00423 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0042b 90                             nop        
0042c c5f877                         vzeroupper 
0042f e82c10b4ff                     call       0x7fc50b9c3b60
00434 0f1f84002c050000               nop        dword ptr [rax + rax + 0x52c]
0043c 4183fa30                       cmp        r10d, 0x30
00440 0f8fa5050000                   jg         0x7fc50be830eb
00446 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0044a 0f835b0e0000                   jae        0x7fc50be839ab
00450 4c63cb                         movsxd     r9, ebx
00453 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0045b c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00462 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00467 0f838f0e0000                   jae        0x7fc50be839fc
0046d 458d5810                       lea        r11d, [r8 + 0x10]
00471 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00479 4963c8                         movsxd     rcx, r8d
0047c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00481 c4c17a7f440a08                 vmovdqu    xmmword ptr [r10 + rcx + 8], xmm0
00488 453bde                         cmp        r11d, r14d
0048b 0f8dc6000000                   jge        0x7fc50be82c57
00491 4c2bc9                         sub        r9, rcx
00494 4d63db                         movsxd     r11, r11d
00497 4f8d140b                       lea        r10, [r11 + r9]
0049b 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004a3 0f83c70e0000                   jae        0x7fc50be83a70
004a9 4d63d6                         movsxd     r10, r14d
004ac 4d2bd3                         sub        r10, r11
004af 4983c20f                       add        r10, 0xf
004b3 4983e2f0                       and        r10, 0xfffffffffffffff0
004b7 458bd2                         mov        r10d, r10d
004ba 478d5c0210                     lea        r11d, [r10 + r8 + 0x10]
004bf 4d63db                         movsxd     r11, r11d
004c2 4f8d540bf0                     lea        r10, [r11 + r9 - 0x10]
004c7 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004cf 0f839b0e0000                   jae        0x7fc50be83a70
004d5 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
004dd 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
004e2 0f83880e0000                   jae        0x7fc50be83a70
004e8 4983c3f0                       add        r11, -0x10
004ec 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004f4 0f83760e0000                   jae        0x7fc50be83a70
004fa 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
00501 0f8fb10e0000                   jg         0x7fc50be83ab8
00507 448bdb                         mov        r11d, ebx
0050a 452bd8                         sub        r11d, r8d
0050d 666690                         nop        
00510 458bd3                         mov        r10d, r11d
00513 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0051b 4c8b8424d0000000               mov        r8, qword ptr [rsp + 0xd0]
00523 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0052a 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00532 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00537 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
0053e 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00546 4183c010                       add        r8d, 0x10
0054a 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00552 453bc6                         cmp        r8d, r14d
00555 7cb9                           jl         0x7fc50be82c10
00557 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0055c 4403d3                         add        r10d, ebx
0055f 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00567 4489742438                     mov        dword ptr [rsp + 0x38], r14d
0056c e9b7fdffff                     jmp        0x7fc50be82a28
00571 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00576 4585c0                         test       r8d, r8d
00579 7406                           je         0x7fc50be82c81
0057b 41ffcb                         dec        r11d
0057e 418bd3                         mov        edx, r11d
00581 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00586 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0058a 85d2                           test       edx, edx
0058c 0f84c0040000                   je         0x7fc50be83152
00592 83fa03                         cmp        edx, 3
00595 0f84c4040000                   je         0x7fc50be8315f
0059b 83fa02                         cmp        edx, 2
0059e 0f878a000000                   ja         0x7fc50be82d2e
005a4 3b9424d8000000                 cmp        edx, dword ptr [rsp + 0xd8]
005ab 0f833c0f0000                   jae        0x7fc50be83bed
005b1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005b6 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
005bb 85d2                           test       edx, edx
005bd 7e54                           jle        0x7fc50be82d13
005bf 448d42ff                       lea        r8d, [rdx - 1]
005c3 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
005cb 0f830f120000                   jae        0x7fc50be83ee0
005d1 4863fa                         movsxd     rdi, edx
005d4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005d9 458bc8                         mov        r9d, r8d
005dc 4183c1cc                       add        r9d, -0x34
005e0 41c1e902                       shr        r9d, 2
005e4 458d4411ff                     lea        r8d, [r9 + rdx - 1]
005e9 b904000000                     mov        ecx, 4
005ee c442f0f5c0                     bzhi       r8, r8, rcx
005f3 492bf8                         sub        rdi, r8
005f6 48ffcf                         dec        rdi
005f9 4533c0                         xor        r8d, r8d
005fc 4885ff                         test       rdi, rdi
005ff 490f4cf8                       cmovl      rdi, r8
00603 448bc7                         mov        r8d, edi
00606 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0060e e9b8020000                     jmp        0x7fc50be82fcb
00613 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0061b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00620 45895a08                       mov        dword ptr [r10 + 8], r11d
00624 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00629 e91cfcffff                     jmp        0x7fc50be8294a
0062e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00636 48be6813bce200000000           movabs     rsi, 0xe2bc1368
00640 8beb                           mov        ebp, ebx
00642 6690                           nop        
00644 c5f877                         vzeroupper 
00647 e8147ba7ff                     call       0x7fc50b8fa860
0064c 0f1f840044070001               nop        dword ptr [rax + rax + 0x1000744]
00654 4885c0                         test       rax, rax
00657 0f84130f0000                   je         0x7fc50be83c70
0065d 488bf0                         mov        rsi, rax
00660 c5f877                         vzeroupper 
00663 4881c4c0000000                 add        rsp, 0xc0
0066a 5d                             pop        rbp
0066b e9f08fb4ff                     jmp        0x7fc50b9cbd60
00670 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00675 440354242c                     add        r10d, dword ptr [rsp + 0x2c]
0067a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0067f 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00684 0f8d83010000                   jge        0x7fc50be82f0d
0068a 4183fb08                       cmp        r11d, 8
0068e 0f8d10130000                   jge        0x7fc50be840a4
00694 458bd0                         mov        r10d, r8d
00697 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0069f 0f838b0f0000                   jae        0x7fc50be83d30
006a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006aa 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
006b0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006b5 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
006bd 0f83dd0f0000                   jae        0x7fc50be83da0
006c3 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006c8 43886c1308                     mov        byte ptr [r11 + r10 + 8], bpl
006cd 458d5003                       lea        r10d, [r8 + 3]
006d1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006d6 41ffc1                         inc        r9d
006d9 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
006e1 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
006e9 0f83ed0f0000                   jae        0x7fc50be83ddc
006ef 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006f4 4183c203                       add        r10d, 3
006f8 4d63d8                         movsxd     r11, r8d
006fb 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00700 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
00706 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0070e 0f8314100000                   jae        0x7fc50be83e28
00714 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00719 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
0071e 430fbe4c190a                   movsx      ecx, byte ptr [r9 + r11 + 0xa]
00724 43884c110a                     mov        byte ptr [r9 + r10 + 0xa], cl
00729 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
0072f 47885c110b                     mov        byte ptr [r9 + r10 + 0xb], r11b
00734 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00739 4183fa08                       cmp        r10d, 8
0073d 0f832d100000                   jae        0x7fc50be83e70
00743 49ba8882b6e200000000           movabs     r10, 0xe2b68288
0074d 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00752 4703448a08                     add        r8d, dword ptr [r10 + r9*4 + 8]
00757 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0075c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00761 4183fa04                       cmp        r10d, 4
00765 7e3d                           jle        0x7fc50be82ea4
00767 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0076b 83c504                         add        ebp, 4
0076e 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00773 418bd0                         mov        edx, r8d
00776 6690                           nop        
00778 c5f877                         vzeroupper 
0077b e8e079a7ff                     call       0x7fc50b8fa860
00780 0f1f840078080002               nop        dword ptr [rax + rax + 0x2000878]
00788 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0078d 8bd5                           mov        edx, ebp
0078f 8bc8                           mov        ecx, eax
00791 666690                         nop        
00794 c5f877                         vzeroupper 
00797 e8c479a7ff                     call       0x7fc50b8fa860
0079c 0f1f840094080003               nop        dword ptr [rax + rax + 0x3000894]
007a4 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a9 4183fa08                       cmp        r10d, 8
007ad 0f8ee8fbffff                   jle        0x7fc50be82a9b
007b3 49bab082b6e200000000           movabs     r10, 0xe2b682b0
007bd 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007c1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
007c6 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007cb 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
007cf 83c508                         add        ebp, 8
007d2 83c208                         add        edx, 8
007d5 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007da 6690                           nop        
007dc c5f877                         vzeroupper 
007df e87c79a7ff                     call       0x7fc50b8fa860
007e4 0f1f8400dc080004               nop        dword ptr [rax + rax + 0x40008dc]
007ec 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007f1 8bd5                           mov        edx, ebp
007f3 488bc8                         mov        rcx, rax
007f6 6690                           nop        
007f8 c5f877                         vzeroupper 
007fb e86079a7ff                     call       0x7fc50b8fa860
00800 0f1f8400f8080005               nop        dword ptr [rax + rax + 0x50008f8]
00808 e98efbffff                     jmp        0x7fc50be82a9b
0080d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00812 4183fa30                       cmp        r10d, 0x30
00816 0f8fd4100000                   jg         0x7fc50be83ff0
0081c 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00820 83c5f9                         add        ebp, -7
00823 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00827 458bd0                         mov        r10d, r8d
0082a 443bd5                         cmp        r10d, ebp
0082d 0f83550d0000                   jae        0x7fc50be83c88
00833 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0083b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00840 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00847 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
0084c 4889ac2498000000               mov        qword ptr [rsp + 0x98], rbp
00854 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00859 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
0085e 0f83800d0000                   jae        0x7fc50be83ce4
00864 48be28c122e200000000           movabs     rsi, 0xe222c128
0086e 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00872 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00876 4863cd                         movsxd     rcx, ebp
00879 4883c108                       add        rcx, 8
0087d 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00882 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0088a 4533c9                         xor        r9d, r9d
0088d 666690                         nop        
00890 c5f877                         vzeroupper 
00893 e8c86ea7ff                     call       0x7fc50b8f9e60
00898 0f1f840090090006               nop        dword ptr [rax + rax + 0x6000990]
008a0 83c508                         add        ebp, 8
008a3 896c2438                       mov        dword ptr [rsp + 0x38], ebp
008a7 3b6c2414                       cmp        ebp, dword ptr [rsp + 0x14]
008ab 0f8cb70f0000                   jl         0x7fc50be83f68
008b1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
008b6 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
008bb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
008c0 e9d6faffff                     jmp        0x7fc50be82a9b
008c5 666690                         nop        
008c8 418bd1                         mov        edx, r9d
008cb 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008d0 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
008d5 498bc9                         mov        rcx, r9
008d8 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
008dd 448d4aff                       lea        r9d, [rdx - 1]
008e1 453bc8                         cmp        r9d, r8d
008e4 7fe2                           jg         0x7fc50be82fc8
008e6 4183f93f                       cmp        r9d, 0x3f
008ea 0f8e700f0000                   jle        0x7fc50be83f60
008f0 448bd2                         mov        r10d, edx
008f3 41ffca                         dec        r10d
008f6 458bca                         mov        r9d, r10d
008f9 eb08                           jmp        0x7fc50be83003
008fb 0f1f440000                     nop        dword ptr [rax + rax]
00900 458bca                         mov        r9d, r10d
00903 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00908 62917e486f8488c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x38]
00913 62917e487f8488ccffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x34], zmm0
0091e 62917e486f848888ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x78]
00929 62917e487f84888cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x74], zmm0
00934 62917e486f848848ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0xb8]
0093f 62917e487f84884cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0xb4], zmm0
0094a 62917e486f848808ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0xf8]
00955 62917e487f84880cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0xf4], zmm0
00960 458d51c0                       lea        r10d, [r9 - 0x40]
00964 4183fa3f                       cmp        r10d, 0x3f
00968 7f96                           jg         0x7fc50be83000
0096a 4183fa0f                       cmp        r10d, 0xf
0096e 7e2d                           jle        0x7fc50be8309d
00970 458bd1                         mov        r10d, r9d
00973 4183c2c0                       add        r10d, -0x40
00977 90                             nop        
00978 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0097d 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00988 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00993 4183c2f0                       add        r10d, -0x10
00997 4183fa0f                       cmp        r10d, 0xf
0099b 7fdb                           jg         0x7fc50be83078
0099d 4585d2                         test       r10d, r10d
009a0 0f8e75fcffff                   jle        0x7fc50be82d1b
009a6 6690                           nop        
009a8 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
009ad 478b4c9004                     mov        r9d, dword ptr [r8 + r10*4 + 4]
009b2 47894c9008                     mov        dword ptr [r8 + r10*4 + 8], r9d
009b7 41ffca                         dec        r10d
009ba 4585d2                         test       r10d, r10d
009bd 7fe9                           jg         0x7fc50be830a8
009bf e957fcffff                     jmp        0x7fc50be82d1b
009c4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009c9 4d63d3                         movsxd     r10, r11d
009cc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009d3 c442a8f5db                     bzhi       r11, r11, r10
009d8 c4c1fb92fb                     kmovq      k7, r11
009dd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009e3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e9 eb5d                           jmp        0x7fc50be83148
009eb 85db                           test       ebx, ebx
009ed 0f8c6d0f0000                   jl         0x7fc50be84060
009f3 4585c0                         test       r8d, r8d
009f6 0f8c640f0000                   jl         0x7fc50be84060
009fc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a01 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00a09 0f82510f0000                   jb         0x7fc50be84060
00a0f 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00a17 453bd6                         cmp        r10d, r14d
00a1a 0f82400f0000                   jb         0x7fc50be84060
00a20 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a25 4585d2                         test       r10d, r10d
00a28 741e                           je         0x7fc50be83148
00a2a 4883fa20                       cmp        rdx, 0x20
00a2e 7694                           jbe        0x7fc50be830c4
00a30 c5f877                         vzeroupper 
00a33 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00a3d 41ffd2                         call       r10
00a40 0f1f840000000000               nop        dword ptr [rax + rax]
00a48 4489742438                     mov        dword ptr [rsp + 0x38], r14d
00a4d e9d6f8ffff                     jmp        0x7fc50be82a28
00a52 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a5a e9c5fbffff                     jmp        0x7fc50be82d24
00a5f 41ffcb                         dec        r11d
00a62 4585db                         test       r11d, r11d
00a65 7e27                           jle        0x7fc50be8318e
00a67 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00a6c 41894810                       mov        dword ptr [r8 + 0x10], ecx
00a70 458b4008                       mov        r8d, dword ptr [r8 + 8]
00a74 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00a79 4589410c                       mov        dword ptr [r9 + 0xc], r8d
00a7d 45895908                       mov        dword ptr [r9 + 8], r11d
00a81 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a89 e996fbffff                     jmp        0x7fc50be82d24
00a8e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00a96 48be3813bce200000000           movabs     rsi, 0xe2bc1338
00aa0 8beb                           mov        ebp, ebx
00aa2 6690                           nop        
00aa4 c5f877                         vzeroupper 
00aa7 e8b476a7ff                     call       0x7fc50b8fa860
00aac 0f1f8400a40b0007               nop        dword ptr [rax + rax + 0x7000ba4]
00ab4 4885c0                         test       rax, rax
00ab7 0f85a0fbffff                   jne        0x7fc50be82d5d
00abd bef6ffffff                     mov        esi, 0xfffffff6
00ac2 6690                           nop        
00ac4 c5f877                         vzeroupper 
00ac7 e89409b4ff                     call       0x7fc50b9c3b60
00acc 0f1f8400c40b0008               nop        dword ptr [rax + rax + 0x8000bc4]
00ad4 4d63d2                         movsxd     r10, r10d
00ad7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ade c442a8f5db                     bzhi       r11, r11, r10
00ae3 c4c1fb92fb                     kmovq      k7, r11
00ae8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aee 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00af4 e9a8000000                     jmp        0x7fc50be832a1
00af9 448b1c24                       mov        r11d, dword ptr [rsp]
00afd 458bd3                         mov        r10d, r11d
00b00 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00b08 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b0d 4585db                         test       r11d, r11d
00b10 0f840a0f0000                   je         0x7fc50be84120
00b16 498bcb                         mov        rcx, r11
00b19 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00b21 4585c0                         test       r8d, r8d
00b24 0f8c2e0f0000                   jl         0x7fc50be84158
00b2a 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
00b2f 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00b37 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00b3b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b40 4585c9                         test       r9d, r9d
00b43 0f8c210f0000                   jl         0x7fc50be8416a
00b49 3b1424                         cmp        edx, dword ptr [rsp]
00b4c 0f82180f0000                   jb         0x7fc50be8416a
00b52 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
00b56 4103da                         add        ebx, r10d
00b59 8b7904                         mov        edi, dword ptr [rcx + 4]
00b5c 3bfb                           cmp        edi, ebx
00b5e 0f82060f0000                   jb         0x7fc50be8416a
00b64 4585d2                         test       r10d, r10d
00b67 0f8cfd0e0000                   jl         0x7fc50be8416a
00b6d 4585d2                         test       r10d, r10d
00b70 742f                           je         0x7fc50be832a1
00b72 4a8d740908                     lea        rsi, [rcx + r9 + 8]
00b77 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00b7c 4963d2                         movsxd     rdx, r10d
00b7f 4883fa20                       cmp        rdx, 0x20
00b83 0f864bffffff                   jbe        0x7fc50be831d4
00b89 c5f877                         vzeroupper 
00b8c 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00b96 41ffd2                         call       r10
00b99 0f1f840000000000               nop        dword ptr [rax + rax]
00ba1 895d38                         mov        dword ptr [rbp + 0x38], ebx
00ba4 c5f877                         vzeroupper 
00ba7 4881c4c0000000                 add        rsp, 0xc0
00bae 5d                             pop        rbp
00baf 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00bb3 0f8793100000                   ja         0x7fc50be8434c
00bb9 c3                             ret        
00bba 4d03d3                         add        r10, r11
00bbd 4d3bd6                         cmp        r10, r14
00bc0 7e08                           jle        0x7fc50be832ca
00bc2 4533ed                         xor        r13d, r13d
00bc5 e9ddf4ffff                     jmp        0x7fc50be827a7
00bca 4533ed                         xor        r13d, r13d
00bcd bb01000000                     mov        ebx, 1
00bd2 e9d2f4ffff                     jmp        0x7fc50be827a9
00bd7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bdc 4d63d3                         movsxd     r10, r11d
00bdf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00be6 c442a8f5db                     bzhi       r11, r11, r10
00beb c4c1fb92fb                     kmovq      k7, r11
00bf0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bf6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bfc eb6b                           jmp        0x7fc50be83369
00bfe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c03 4585db                         test       r11d, r11d
00c06 0f8448030000                   je         0x7fc50be83654
00c0c 85db                           test       ebx, ebx
00c0e 0f8ccc0e0000                   jl         0x7fc50be841e0
00c14 4585c0                         test       r8d, r8d
00c17 0f8cc30e0000                   jl         0x7fc50be841e0
00c1d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c22 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00c2a 0f82b00e0000                   jb         0x7fc50be841e0
00c30 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00c38 453bde                         cmp        r11d, r14d
00c3b 0f829f0e0000                   jb         0x7fc50be841e0
00c41 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c46 4585d2                         test       r10d, r10d
00c49 741e                           je         0x7fc50be83369
00c4b 4883fa20                       cmp        rdx, 0x20
00c4f 7686                           jbe        0x7fc50be832d7
00c51 c5f877                         vzeroupper 
00c54 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00c5e 41ffd2                         call       r10
00c61 0f1f840000000000               nop        dword ptr [rax + rax]
00c69 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c6e 4585db                         test       r11d, r11d
00c71 0f8ec0010000                   jle        0x7fc50be83537
00c77 458bd6                         mov        r10d, r14d
00c7a 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00c7f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00c87 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c8c 4503de                         add        r11d, r14d
00c8f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c94 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00c99 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00ca1 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00ca6 4b8d743308                     lea        rsi, [r11 + r14 + 8]
00cab 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00cb0 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00cb5 0f8dd7000000                   jge        0x7fc50be83492
00cbb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00cc0 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00cc5 458bd3                         mov        r10d, r11d
00cc8 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00ccd 450f4fd0                       cmovg      r10d, r8d
00cd1 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00cd6 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00cde 4585d2                         test       r10d, r10d
00ce1 0f8c410e0000                   jl         0x7fc50be84228
00ce7 4585f6                         test       r14d, r14d
00cea 0f8c380e0000                   jl         0x7fc50be84228
00cf0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00cf5 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00cfd 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00d05 453bc2                         cmp        r8d, r10d
00d08 0f821a0e0000                   jb         0x7fc50be84228
00d0e 458bd6                         mov        r10d, r14d
00d11 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00d16 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00d1e 453bc2                         cmp        r8d, r10d
00d21 0f82010e0000                   jb         0x7fc50be84228
00d27 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00d2c 4585d2                         test       r10d, r10d
00d2f 0f8cf30d0000                   jl         0x7fc50be84228
00d35 4585d2                         test       r10d, r10d
00d38 7429                           je         0x7fc50be83463
00d3a 4963d2                         movsxd     rdx, r10d
00d3d 4883fa20                       cmp        rdx, 0x20
00d41 7735                           ja         0x7fc50be83478
00d43 4d63d2                         movsxd     r10, r10d
00d46 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d4d c442a8f5db                     bzhi       r11, r11, r10
00d52 c4c1fb92fb                     kmovq      k7, r11
00d57 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d5d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d63 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00d68 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00d6d 0f8d28f6ffff                   jge        0x7fc50be82a9b
00d73 e913010000                     jmp        0x7fc50be8358b
00d78 c5f877                         vzeroupper 
00d7b 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00d85 41ffd2                         call       r10
00d88 0f1f840000000000               nop        dword ptr [rax + rax]
00d90 ebd1                           jmp        0x7fc50be83463
00d92 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d9a 4585db                         test       r11d, r11d
00d9d 0f8cf90d0000                   jl         0x7fc50be8429c
00da3 4585f6                         test       r14d, r14d
00da6 0f8cf00d0000                   jl         0x7fc50be8429c
00dac 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00db1 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
00db9 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00dc1 453bd3                         cmp        r10d, r11d
00dc4 0f82d20d0000                   jb         0x7fc50be8429c
00dca 458bc2                         mov        r8d, r10d
00dcd 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dd2 453bc2                         cmp        r8d, r10d
00dd5 0f82c10d0000                   jb         0x7fc50be8429c
00ddb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00de0 4585d2                         test       r10d, r10d
00de3 0f84b2f5ffff                   je         0x7fc50be82a9b
00de9 4963d2                         movsxd     rdx, r10d
00dec 4883fa20                       cmp        rdx, 0x20
00df0 7728                           ja         0x7fc50be8351a
00df2 458bda                         mov        r11d, r10d
00df5 4d63d3                         movsxd     r10, r11d
00df8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dff c442a8f5db                     bzhi       r11, r11, r10
00e04 c4c1fb92fb                     kmovq      k7, r11
00e09 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e0f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e15 e981f5ffff                     jmp        0x7fc50be82a9b
00e1a c5f877                         vzeroupper 
00e1d 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00e27 41ffd2                         call       r10
00e2a 0f1f840000000000               nop        dword ptr [rax + rax]
00e32 e964f5ffff                     jmp        0x7fc50be82a9b
00e37 4489742414                     mov        dword ptr [rsp + 0x14], r14d
00e3c e95af5ffff                     jmp        0x7fc50be82a9b
00e41 448bd5                         mov        r10d, ebp
00e44 4d63d2                         movsxd     r10, r10d
00e47 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e4e c442a8f5db                     bzhi       r11, r11, r10
00e53 c4c1fb92fb                     kmovq      k7, r11
00e58 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e5e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e64 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e69 4403dd                         add        r11d, ebp
00e6c 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00e71 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00e75 418502                         test       dword ptr [r10], eax
00e78 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00e7d 0f8d18f5ffff                   jge        0x7fc50be82a9b
00e83 4489ac2498000000               mov        dword ptr [rsp + 0x98], r13d
00e8b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e93 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00e98 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00ea0 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00ea4 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00ea8 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
00eac 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00eb1 410f4fea                       cmovg      ebp, r10d
00eb5 4585db                         test       r11d, r11d
00eb8 0f8ce20b0000                   jl         0x7fc50be841a0
00ebe 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ec6 4585d2                         test       r10d, r10d
00ec9 0f8cd10b0000                   jl         0x7fc50be841a0
00ecf 458d142b                       lea        r10d, [r11 + rbp]
00ed3 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00edb 453bc2                         cmp        r8d, r10d
00ede 0f82bc0b0000                   jb         0x7fc50be841a0
00ee4 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00eec 4403ed                         add        r13d, ebp
00eef 458bd0                         mov        r10d, r8d
00ef2 453bd5                         cmp        r10d, r13d
00ef5 0f82a50b0000                   jb         0x7fc50be841a0
00efb 85ed                           test       ebp, ebp
00efd 0f8c9d0b0000                   jl         0x7fc50be841a0
00f03 85ed                           test       ebp, ebp
00f05 0f8459ffffff                   je         0x7fc50be83564
00f0b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f10 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00f18 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00f1d 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00f25 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00f2a 4863d5                         movsxd     rdx, ebp
00f2d 4883fa20                       cmp        rdx, 0x20
00f31 0f860affffff                   jbe        0x7fc50be83541
00f37 c5f877                         vzeroupper 
00f3a 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00f44 41ffd2                         call       r10
00f47 0f1f840000000000               nop        dword ptr [rax + rax]
00f4f e910ffffff                     jmp        0x7fc50be83564
00f54 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
00f59 e90bfdffff                     jmp        0x7fc50be83369
00f5e bee4ffffff                     mov        esi, 0xffffffe4
00f63 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00f6b 448b1424                       mov        r10d, dword ptr [rsp]
00f6f 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00f77 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f7c 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00f84 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00f89 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00f91 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f96 4c891424                       mov        qword ptr [rsp], r10
00f9a 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f9f 90                             nop        
00fa0 c5f877                         vzeroupper 
00fa3 e8b804b4ff                     call       0x7fc50b9c3b60
00fa8 0f1f8400a010000a               nop        dword ptr [rax + rax + 0xa0010a0]
00fb0 bee4ffffff                     mov        esi, 0xffffffe4
00fb5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00fbd 448b1424                       mov        r10d, dword ptr [rsp]
00fc1 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00fc9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fce 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00fd6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00fdb 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00fe3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fe8 4c891424                       mov        qword ptr [rsp], r10
00fec 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00ff1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00ff6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00ffc c5f877                         vzeroupper 
00fff e85c04b4ff                     call       0x7fc50b9c3b60
01004 0f1f8400fc10000b               nop        dword ptr [rax + rax + 0xb0010fc]
0100c bee4ffffff                     mov        esi, 0xffffffe4
01011 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01019 448b1424                       mov        r10d, dword ptr [rsp]
0101d 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01025 448b542404                     mov        r10d, dword ptr [rsp + 4]
0102a 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01032 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01037 4c891424                       mov        qword ptr [rsp], r10
0103b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0103f 90                             nop        
01040 c5f877                         vzeroupper 
01043 e81804b4ff                     call       0x7fc50b9c3b60
01048 0f1f84004011000c               nop        dword ptr [rax + rax + 0xc001140]
01050 bee4ffffff                     mov        esi, 0xffffffe4
01055 498bea                         mov        rbp, r10
01058 448b1c24                       mov        r11d, dword ptr [rsp]
0105c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01064 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01069 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01071 448b542404                     mov        r10d, dword ptr [rsp + 4]
01076 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0107e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01083 4c891424                       mov        qword ptr [rsp], r10
01087 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0108b 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01090 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01095 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0109a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
010a0 c5f877                         vzeroupper 
010a3 e8b803b4ff                     call       0x7fc50b9c3b60
010a8 0f1f8400a011000d               nop        dword ptr [rax + rax + 0xd0011a0]
010b0 be45ffffff                     mov        esi, 0xffffff45
010b5 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
010bd 666690                         nop        
010c0 c5f877                         vzeroupper 
010c3 e89803b4ff                     call       0x7fc50b9c3b60
010c8 0f1f8400c011000e               nop        dword ptr [rax + rax + 0xe0011c0]
010d0 be45ffffff                     mov        esi, 0xffffff45
010d5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
010dd 448b0424                       mov        r8d, dword ptr [rsp]
010e1 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
010e9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010ee 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
010f6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
010fb 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01103 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01108 4c891c24                       mov        qword ptr [rsp], r11
0110c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01111 4489442408                     mov        dword ptr [rsp + 8], r8d
01116 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0111b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01120 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01124 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01129 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0112e 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01133 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01138 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0113d 89542430                       mov        dword ptr [rsp + 0x30], edx
01141 666690                         nop        
01144 c5f877                         vzeroupper 
01147 e81403b4ff                     call       0x7fc50b9c3b60
0114c 0f1f84004412000f               nop        dword ptr [rax + rax + 0xf001244]
01154 4d3bd3                         cmp        r10, r11
01157 bdffffffff                     mov        ebp, 0xffffffff
0115c 7c08                           jl         0x7fc50be83866
0115e 400f95c5                       setne      bpl
01162 400fb6ed                       movzx      ebp, bpl
01166 be45ffffff                     mov        esi, 0xffffff45
0116b 448b0424                       mov        r8d, dword ptr [rsp]
0116f 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01177 448b542404                     mov        r10d, dword ptr [rsp + 4]
0117c 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01184 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01189 4c891424                       mov        qword ptr [rsp], r10
0118d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01191 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01196 6690                           nop        
01198 c5f877                         vzeroupper 
0119b e8c002b4ff                     call       0x7fc50b9c3b60
011a0 0f1f840098120010               nop        dword ptr [rax + rax + 0x10001298]
011a8 be45ffffff                     mov        esi, 0xffffff45
011ad 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
011b5 448b1c24                       mov        r11d, dword ptr [rsp]
011b9 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
011c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011c6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
011ce 448b542404                     mov        r10d, dword ptr [rsp + 4]
011d3 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
011db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011e0 4c891424                       mov        qword ptr [rsp], r10
011e4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011e9 44895c2408                     mov        dword ptr [rsp + 8], r11d
011ee 48894424f8                     mov        qword ptr [rsp - 8], rax
011f3 8b442414                       mov        eax, dword ptr [rsp + 0x14]
011f7 8944240c                       mov        dword ptr [rsp + 0xc], eax
011fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01200 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01204 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01209 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0120e 6690                           nop        
01210 c5f877                         vzeroupper 
01213 e84802b4ff                     call       0x7fc50b9c3b60
01218 0f1f840010130011               nop        dword ptr [rax + rax + 0x11001310]
01220 be45ffffff                     mov        esi, 0xffffff45
01225 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0122d 448b1424                       mov        r10d, dword ptr [rsp]
01231 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01239 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0123e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01246 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0124b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01253 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01258 4c891424                       mov        qword ptr [rsp], r10
0125c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01261 4489542408                     mov        dword ptr [rsp + 8], r10d
01266 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0126b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01270 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01275 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0127a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0127f 90                             nop        
01280 c5f877                         vzeroupper 
01283 e8d801b4ff                     call       0x7fc50b9c3b60
01288 0f1f840080130012               nop        dword ptr [rax + rax + 0x12001380]
01290 85ff                           test       edi, edi
01292 0f8478090000                   je         0x7fc50be84310
01298 488bcf                         mov        rcx, rdi
0129b 448b1424                       mov        r10d, dword ptr [rsp]
0129f 89742414                       mov        dword ptr [rsp + 0x14], esi
012a3 4533c0                         xor        r8d, r8d
012a6 e990f8ffff                     jmp        0x7fc50be8323b
012ab bee4ffffff                     mov        esi, 0xffffffe4
012b0 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
012b8 448b1424                       mov        r10d, dword ptr [rsp]
012bc 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
012c4 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
012c9 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
012d1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012d6 4c891424                       mov        qword ptr [rsp], r10
012da 4489742438                     mov        dword ptr [rsp + 0x38], r14d
012df 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
012e4 895c2440                       mov        dword ptr [rsp + 0x40], ebx
012e8 895c2444                       mov        dword ptr [rsp + 0x44], ebx
012ec c5f877                         vzeroupper 
012ef e86c01b4ff                     call       0x7fc50b9c3b60
012f4 0f1f8400ec130013               nop        dword ptr [rax + rax + 0x130013ec]
012fc c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01305 bee4ffffff                     mov        esi, 0xffffffe4
0130a 498bea                         mov        rbp, r10
0130d 448b1424                       mov        r10d, dword ptr [rsp]
01311 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01319 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0131e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01326 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0132b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01333 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01338 4c891424                       mov        qword ptr [rsp], r10
0133c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01341 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01346 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0134b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01350 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01355 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01359 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0135e 6690                           nop        
01360 c5f877                         vzeroupper 
01363 e8f800b4ff                     call       0x7fc50b9c3b60
01368 0f1f840060140014               nop        dword ptr [rax + rax + 0x14001460]
01370 8beb                           mov        ebp, ebx
01372 83c510                         add        ebp, 0x10
01375 be6effffff                     mov        esi, 0xffffff6e
0137a 448b1424                       mov        r10d, dword ptr [rsp]
0137e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01386 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0138b 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01393 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01398 4c891424                       mov        qword ptr [rsp], r10
0139c 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013a0 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
013a5 666690                         nop        
013a8 c5f877                         vzeroupper 
013ab e8b000b4ff                     call       0x7fc50b9c3b60
013b0 0f1f8400a8140015               nop        dword ptr [rax + rax + 0x150014a8]
013b8 8beb                           mov        ebp, ebx
013ba 83c510                         add        ebp, 0x10
013bd be66ffffff                     mov        esi, 0xffffff66
013c2 448b1c24                       mov        r11d, dword ptr [rsp]
013c6 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
013ce 448b542404                     mov        r10d, dword ptr [rsp + 4]
013d3 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
013db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013e0 4c891424                       mov        qword ptr [rsp], r10
013e4 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013e8 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
013ed 666690                         nop        
013f0 c5f877                         vzeroupper 
013f3 e86800b4ff                     call       0x7fc50b9c3b60
013f8 0f1f8400f0140016               nop        dword ptr [rax + rax + 0x160014f0]
01400 be17000000                     mov        esi, 0x17
01405 666690                         nop        
01408 c5f877                         vzeroupper 
0140b e85000b4ff                     call       0x7fc50b9c3b60
01410 0f1f840008150017               nop        dword ptr [rax + rax + 0x17001508]
01418 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01420 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01425 eb0d                           jmp        0x7fc50be83b34
01427 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
0142f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01434 be6effffff                     mov        esi, 0xffffff6e
01439 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01441 4c89542408                     mov        qword ptr [rsp + 8], r10
01446 897c2410                       mov        dword ptr [rsp + 0x10], edi
0144a 4889442418                     mov        qword ptr [rsp + 0x18], rax
0144f 894c2420                       mov        dword ptr [rsp + 0x20], ecx
01453 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01458 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0145d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01461 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01466 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0146b 90                             nop        
0146c c5f877                         vzeroupper 
0146f e8ecffb3ff                     call       0x7fc50b9c3b60
01474 0f1f84006c150018               nop        dword ptr [rax + rax + 0x1800156c]
0147c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01481 bebeffffff                     mov        esi, 0xffffffbe
01486 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0148e 448b1424                       mov        r10d, dword ptr [rsp]
01492 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0149a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0149f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
014a7 4c895c2408                     mov        qword ptr [rsp + 8], r11
014ac 893c24                         mov        dword ptr [rsp], edi
014af 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
014b4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014b9 894c2414                       mov        dword ptr [rsp + 0x14], ecx
014bd 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014c2 895c2424                       mov        dword ptr [rsp + 0x24], ebx
014c6 6690                           nop        
014c8 c5f877                         vzeroupper 
014cb e890ffb3ff                     call       0x7fc50b9c3b60
014d0 0f1f8400c8150019               nop        dword ptr [rax + rax + 0x190015c8]
014d8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014dd eba2                           jmp        0x7fc50be83b81
014df 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014e4 eb9b                           jmp        0x7fc50be83b81
014e6 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014eb eb94                           jmp        0x7fc50be83b81
014ed bee4ffffff                     mov        esi, 0xffffffe4
014f2 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
014fa 448b1c24                       mov        r11d, dword ptr [rsp]
014fe 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01506 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0150b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01513 448b442404                     mov        r8d, dword ptr [rsp + 4]
01518 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01520 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01525 4c891c24                       mov        qword ptr [rsp], r11
01529 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0152e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01533 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01538 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0153d 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01541 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01546 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0154b 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01550 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01555 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0155a 8954243c                       mov        dword ptr [rsp + 0x3c], edx
0155e 6690                           nop        
01560 c5f877                         vzeroupper 
01563 e8f8feb3ff                     call       0x7fc50b9c3b60
01568 0f1f84006016001a               nop        dword ptr [rax + rax + 0x1a001660]
01570 bef6ffffff                     mov        esi, 0xfffffff6
01575 666690                         nop        
01578 c5f877                         vzeroupper 
0157b e8e0feb3ff                     call       0x7fc50b9c3b60
01580 0f1f84007816001b               nop        dword ptr [rax + rax + 0x1b001678]
01588 bee4ffffff                     mov        esi, 0xffffffe4
0158d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01595 448b1c24                       mov        r11d, dword ptr [rsp]
01599 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
015a1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015a6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
015ae 448b542404                     mov        r10d, dword ptr [rsp + 4]
015b3 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
015bb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015c0 4c891424                       mov        qword ptr [rsp], r10
015c4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015c9 4489542408                     mov        dword ptr [rsp + 8], r10d
015ce 4489442444                     mov        dword ptr [rsp + 0x44], r8d
015d3 90                             nop        
015d4 c5f877                         vzeroupper 
015d7 e884feb3ff                     call       0x7fc50b9c3b60
015dc 0f1f8400d416001c               nop        dword ptr [rax + rax + 0x1c0016d4]
015e4 bee4ffffff                     mov        esi, 0xffffffe4
015e9 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
015f1 448b1424                       mov        r10d, dword ptr [rsp]
015f5 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
015fd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01602 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0160a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0160f 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01617 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0161c 4c891424                       mov        qword ptr [rsp], r10
01620 c5f877                         vzeroupper 
01623 e838feb3ff                     call       0x7fc50b9c3b60
01628 0f1f84002017001d               nop        dword ptr [rax + rax + 0x1d001720]
01630 bee4ffffff                     mov        esi, 0xffffffe4
01635 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0163d 448b1c24                       mov        r11d, dword ptr [rsp]
01641 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01649 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0164e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01656 448b542404                     mov        r10d, dword ptr [rsp + 4]
0165b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01663 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01668 4c891424                       mov        qword ptr [rsp], r10
0166c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01671 44895c2408                     mov        dword ptr [rsp + 8], r11d
01676 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0167b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01680 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01685 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0168a 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0168f 90                             nop        
01690 c5f877                         vzeroupper 
01693 e8c8fdb3ff                     call       0x7fc50b9c3b60
01698 0f1f84009017001e               nop        dword ptr [rax + rax + 0x1e001790]
016a0 bee4ffffff                     mov        esi, 0xffffffe4
016a5 448b1424                       mov        r10d, dword ptr [rsp]
016a9 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
016b1 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016b6 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
016be 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016c3 4c891424                       mov        qword ptr [rsp], r10
016c7 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
016cc c5f877                         vzeroupper 
016cf e88cfdb3ff                     call       0x7fc50b9c3b60
016d4 0f1f8400cc17001f               nop        dword ptr [rax + rax + 0x1f0017cc]
016dc 418d6801                       lea        ebp, [r8 + 1]
016e0 bee4ffffff                     mov        esi, 0xffffffe4
016e5 448b1c24                       mov        r11d, dword ptr [rsp]
016e9 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
016f1 448b542404                     mov        r10d, dword ptr [rsp + 4]
016f6 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
016fe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01703 4c891424                       mov        qword ptr [rsp], r10
01707 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0170c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01711 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01716 6690                           nop        
01718 c5f877                         vzeroupper 
0171b e840fdb3ff                     call       0x7fc50b9c3b60
01720 0f1f840018180020               nop        dword ptr [rax + rax + 0x20001818]
01728 bee4ffffff                     mov        esi, 0xffffffe4
0172d 448b1424                       mov        r10d, dword ptr [rsp]
01731 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01739 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0173e 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01746 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0174b 4c891424                       mov        qword ptr [rsp], r10
0174f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01754 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01759 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0175e 6690                           nop        
01760 c5f877                         vzeroupper 
01763 e8f8fcb3ff                     call       0x7fc50b9c3b60
01768 0f1f840060180021               nop        dword ptr [rax + rax + 0x21001860]
01770 bee4ffffff                     mov        esi, 0xffffffe4
01775 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0177d 448b1424                       mov        r10d, dword ptr [rsp]
01781 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01789 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0178e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01796 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0179b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017a3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017a8 4c891424                       mov        qword ptr [rsp], r10
017ac 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
017b1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017b6 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
017bb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017c0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017c5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017ca 4489442434                     mov        dword ptr [rsp + 0x34], r8d
017cf 90                             nop        
017d0 c5f877                         vzeroupper 
017d3 e888fcb3ff                     call       0x7fc50b9c3b60
017d8 0f1f8400d0180022               nop        dword ptr [rax + rax + 0x220018d0]
017e0 be6effffff                     mov        esi, 0xffffff6e
017e5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
017ed 448b0424                       mov        r8d, dword ptr [rsp]
017f1 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
017f9 4c8b442408                     mov        r8, qword ptr [rsp + 8]
017fe 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
01806 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
0180b 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
01813 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01818 44894c2408                     mov        dword ptr [rsp + 8], r9d
0181d 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01822 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01827 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0182b 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01830 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01835 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
0183a 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0183f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01844 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01849 89542440                       mov        dword ptr [rsp + 0x40], edx
0184d 666690                         nop        
01850 c5f877                         vzeroupper 
01853 e808fcb3ff                     call       0x7fc50b9c3b60
01858 0f1f840050190023               nop        dword ptr [rax + rax + 0x23001950]
01860 458bd1                         mov        r10d, r9d
01863 e935f1ffff                     jmp        0x7fc50be8309d
01868 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01870 4183c308                       add        r11d, 8
01874 458bcb                         mov        r9d, r11d
01877 be45ffffff                     mov        esi, 0xffffff45
0187c 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01884 448b1424                       mov        r10d, dword ptr [rsp]
01888 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01890 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01895 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0189d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
018a2 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
018aa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018af 4c891424                       mov        qword ptr [rsp], r10
018b3 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018b8 4489542408                     mov        dword ptr [rsp + 8], r10d
018bd 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
018c2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018c7 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
018cc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018d1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018d6 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
018db 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
018e0 c5f877                         vzeroupper 
018e3 e878fbb3ff                     call       0x7fc50b9c3b60
018e8 0f1f8400e0190024               nop        dword ptr [rax + rax + 0x240019e0]
018f0 be45ffffff                     mov        esi, 0xffffff45
018f5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
018fd 448b1c24                       mov        r11d, dword ptr [rsp]
01901 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01909 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0190e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01916 448b542404                     mov        r10d, dword ptr [rsp + 4]
0191b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01923 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01928 4c891424                       mov        qword ptr [rsp], r10
0192c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01931 44895c2408                     mov        dword ptr [rsp + 8], r11d
01936 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0193b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01940 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01945 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0194a 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0194f 90                             nop        
01950 c5f877                         vzeroupper 
01953 e808fbb3ff                     call       0x7fc50b9c3b60
01958 0f1f8400501a0025               nop        dword ptr [rax + rax + 0x25001a50]
01960 beccffffff                     mov        esi, 0xffffffcc
01965 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0196d 448b1c24                       mov        r11d, dword ptr [rsp]
01971 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01979 448b542404                     mov        r10d, dword ptr [rsp + 4]
0197e 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01986 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0198b 4c891424                       mov        qword ptr [rsp], r10
0198f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01993 90                             nop        
01994 c5f877                         vzeroupper 
01997 e8c4fab3ff                     call       0x7fc50b9c3b60
0199c 0f1f8400941a0026               nop        dword ptr [rax + rax + 0x26001a94]
019a4 be45ffffff                     mov        esi, 0xffffff45
019a9 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
019b1 448b1c24                       mov        r11d, dword ptr [rsp]
019b5 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
019bd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019c2 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
019ca 448b542404                     mov        r10d, dword ptr [rsp + 4]
019cf 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
019d7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019dc 4c891424                       mov        qword ptr [rsp], r10
019e0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019e5 44895c2408                     mov        dword ptr [rsp + 8], r11d
019ea 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
019ef 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
019f4 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
019f9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019fe 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01a03 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01a08 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01a0d 666690                         nop        
01a10 c5f877                         vzeroupper 
01a13 e848fab3ff                     call       0x7fc50b9c3b60
01a18 0f1f8400101b0027               nop        dword ptr [rax + rax + 0x27001b10]
01a20 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a28 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
01a2f bef6ffffff                     mov        esi, 0xfffffff6
01a34 498beb                         mov        rbp, r11
01a37 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01a3e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01a46 6690                           nop        
01a48 c5f877                         vzeroupper 
01a4b e810fab3ff                     call       0x7fc50b9c3b60
01a50 0f1f8400481b0028               nop        dword ptr [rax + rax + 0x28001b48]
01a58 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01a5d 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a65 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01a6a beccffffff                     mov        esi, 0xffffffcc
01a6f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a77 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01a7f 44890c24                       mov        dword ptr [rsp], r9d
01a83 48894c2408                     mov        qword ptr [rsp + 8], rcx
01a88 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a8d 666690                         nop        
01a90 c5f877                         vzeroupper 
01a93 e8c8f9b3ff                     call       0x7fc50b9c3b60
01a98 0f1f8400901b0029               nop        dword ptr [rax + rax + 0x29001b90]
01aa0 beccffffff                     mov        esi, 0xffffffcc
01aa5 448b1424                       mov        r10d, dword ptr [rsp]
01aa9 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01ab1 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01ab6 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01abe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ac3 4c891424                       mov        qword ptr [rsp], r10
01ac7 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01acb 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01ad0 c5f877                         vzeroupper 
01ad3 e888f9b3ff                     call       0x7fc50b9c3b60
01ad8 0f1f8400d01b002a               nop        dword ptr [rax + rax + 0x2a001bd0]
01ae0 beccffffff                     mov        esi, 0xffffffcc
01ae5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01aed 448b1424                       mov        r10d, dword ptr [rsp]
01af1 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01af9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01afe 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01b06 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b0b 4c891424                       mov        qword ptr [rsp], r10
01b0f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01b13 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01b18 c5f877                         vzeroupper 
01b1b e840f9b3ff                     call       0x7fc50b9c3b60
01b20 0f1f8400181c002b               nop        dword ptr [rax + rax + 0x2b001c18]
01b28 beccffffff                     mov        esi, 0xffffffcc
01b2d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b35 448b1424                       mov        r10d, dword ptr [rsp]
01b39 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b41 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b46 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b4e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b53 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b5b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b60 4c891424                       mov        qword ptr [rsp], r10
01b64 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b69 4489542408                     mov        dword ptr [rsp + 8], r10d
01b6e 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01b72 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b77 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b7c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01b81 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b86 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01b8b 90                             nop        
01b8c c5f877                         vzeroupper 
01b8f e8ccf8b3ff                     call       0x7fc50b9c3b60
01b94 0f1f84008c1c002c               nop        dword ptr [rax + rax + 0x2c001c8c]
01b9c beccffffff                     mov        esi, 0xffffffcc
01ba1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01ba9 448b1c24                       mov        r11d, dword ptr [rsp]
01bad 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bb5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bba 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01bc2 448b542404                     mov        r10d, dword ptr [rsp + 4]
01bc7 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bcf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bd4 4c891424                       mov        qword ptr [rsp], r10
01bd8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bdd 44895c2408                     mov        dword ptr [rsp + 8], r11d
01be2 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01be6 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01beb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01bf0 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01bf5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bfa 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01bff 90                             nop        
01c00 c5f877                         vzeroupper 
01c03 e858f8b3ff                     call       0x7fc50b9c3b60
01c08 0f1f8400001d002d               nop        dword ptr [rax + rax + 0x2d001d00]
01c10 448bc1                         mov        r8d, ecx
01c13 89742414                       mov        dword ptr [rsp + 0x14], esi
01c17 33c9                           xor        ecx, ecx
01c19 458bd0                         mov        r10d, r8d
01c1c e90efeffff                     jmp        0x7fc50be8412f
01c21 bef6ffffff                     mov        esi, 0xfffffff6
01c26 6690                           nop        
01c28 c5f877                         vzeroupper 
01c2b e830f8b3ff                     call       0x7fc50b9c3b60
01c30 0f1f8400281d002e               nop        dword ptr [rax + rax + 0x2e001d28]
01c38 eb0a                           jmp        0x7fc50be84344
01c3a eb08                           jmp        0x7fc50be84344
01c3c eb06                           jmp        0x7fc50be84344
01c3e eb04                           jmp        0x7fc50be84344
01c40 eb02                           jmp        0x7fc50be84344
01c42 eb00                           jmp        0x7fc50be84344
01c44 488bf0                         mov        rsi, rax
01c47 e914eaffff                     jmp        0x7fc50be82d60
01c4c 49baaf32e80bc57f0000           movabs     r10, 0x7fc50be832af
01c56 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c5d e97e8ba7ff                     jmp        0x7fc50b8fcee0
01c62 e83957a6ff                     call       0x7fc50b8e9aa0
01c67 e9d2e3ffff                     jmp        0x7fc50be8273e
01c6c f4                             hlt        
01c6d f4                             hlt        
01c6e f4                             hlt        
01c6f f4                             hlt        
