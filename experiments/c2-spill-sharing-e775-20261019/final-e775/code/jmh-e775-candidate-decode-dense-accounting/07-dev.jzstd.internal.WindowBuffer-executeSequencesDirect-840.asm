00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854083a7ff                   jne        0x7f138f8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85101c0000                   jne        0x7f138fe8324e
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
0006e 0f8f78130000                   jg         0x7f138fe829ec
00074 488b4508                       mov        rax, qword ptr [rbp + 8]
00078 4c8b4d20                       mov        r9, qword ptr [rbp + 0x20]
0007c 4c639c24d0000000               movsxd     r11, dword ptr [rsp + 0xd0]
00084 4c63d6                         movsxd     r10, esi
00087 4c03d0                         add        r10, rax
0008a 4d2bca                         sub        r9, r10
0008d 4d3bd9                         cmp        r11, r9
00090 0f8f56130000                   jg         0x7f138fe829ec
00096 4c8b7510                       mov        r14, qword ptr [rbp + 0x10]
0009a 4c8b6d28                       mov        r13, qword ptr [rbp + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f84130b0000                   je         0x7f138fe821ba
000a7 33db                           xor        ebx, ebx
000a9 4c8bda                         mov        r11, rdx
000ac 8b5204                         mov        edx, dword ptr [rdx + 4]
000af 8b7d40                         mov        edi, dword ptr [rbp + 0x40]
000b2 4585c0                         test       r8d, r8d
000b5 0f8ec1110000                   jle        0x7f138fe8287c
000bb 89742414                       mov        dword ptr [rsp + 0x14], esi
000bf 4c2be8                         sub        r13, rax
000c2 448d4ae0                       lea        r9d, [rdx - 0x20]
000c6 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
000ca 83c1e0                         add        ecx, -0x20
000cd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d2 418b7204                       mov        esi, dword ptr [r10 + 4]
000d6 85f6                           test       esi, esi
000d8 0f8642130000                   jbe        0x7f138fe82a20
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
0011c 0f83e2120000                   jae        0x7f138fe82a04
00122 85db                           test       ebx, ebx
00124 0f84e9120000                   je         0x7f138fe82a13
0012a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00132 458b5304                       mov        r10d, dword ptr [r11 + 4]
00136 4585d2                         test       r10d, r10d
00139 0f862e130000                   jbe        0x7f138fe82a6d
0013f 4183fa01                       cmp        r10d, 1
00143 0f8624130000                   jbe        0x7f138fe82a6d
00149 4183fa02                       cmp        r10d, 2
0014d 0f861a130000                   jbe        0x7f138fe82a6d
00153 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0015b 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0015f 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00164 448b5704                       mov        r10d, dword ptr [rdi + 4]
00168 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00170 448d52f1                       lea        r10d, [rdx - 0xf]
00174 4585d2                         test       r10d, r10d
00177 0f8c47130000                   jl         0x7f138fe82ac4
0017d 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00185 4183c3f1                       add        r11d, -0xf
00189 4585db                         test       r11d, r11d
0018c 0f8c39130000                   jl         0x7f138fe82acb
00192 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
0019a 4183c2f9                       add        r10d, -7
0019e 4585d2                         test       r10d, r10d
001a1 0f8c2b130000                   jl         0x7f138fe82ad2
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
001f4 e9b7010000                     jmp        0x7f138fe819b0
001f9 4533c0                         xor        r8d, r8d
001fc 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00201 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00206 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
0020a 448bda                         mov        r11d, edx
0020d 4183fb03                       cmp        r11d, 3
00211 0f8e5a030000                   jle        0x7f138fe81b71
00217 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0021c 41894b10                       mov        dword ptr [r11 + 0x10], ecx
00220 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00224 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00229 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0022d 448d5afd                       lea        r11d, [rdx - 3]
00231 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00236 45895808                       mov        dword ptr [r8 + 8], r11d
0023a 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00242 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
00247 4c635c2414                     movsxd     r11, dword ptr [rsp + 0x14]
0024c 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
00251 4863542428                     movsxd     rdx, dword ptr [rsp + 0x28]
00256 4c03da                         add        r11, rdx
00259 4d3bd3                         cmp        r10, r11
0025c 0f8fde0e0000                   jg         0x7f138fe82740
00262 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00267 4585d2                         test       r10d, r10d
0026a 0f8e2c0e0000                   jle        0x7f138fe8269c
00270 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
00275 4403742428                     add        r14d, dword ptr [rsp + 0x28]
0027a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0027f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00284 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00289 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
0028e 4503ce                         add        r9d, r14d
00291 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00299 498d7c1a08                     lea        rdi, [r10 + rbx + 8]
0029e 448bd3                         mov        r10d, ebx
002a1 4403542428                     add        r10d, dword ptr [rsp + 0x28]
002a6 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002ae 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
002b3 0f8f45090000                   jg         0x7f138fe821fe
002b9 443b542424                     cmp        r10d, dword ptr [rsp + 0x24]
002be 0f8fd00e0000                   jg         0x7f138fe82794
002c4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002c9 4183fb10                       cmp        r11d, 0x10
002cd 0f8f61010000                   jg         0x7f138fe81a34
002d3 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002d7 0f831b0d0000                   jae        0x7f138fe825f8
002dd 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
002e5 c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002ec 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
002f1 0f83450d0000                   jae        0x7f138fe8263c
002f7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002fc 4403d3                         add        r10d, ebx
002ff 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00307 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0030c c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00313 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00318 4503d8                         add        r11d, r8d
0031b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00320 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00325 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0032a 458bc2                         mov        r8d, r10d
0032d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00332 4183fb10                       cmp        r11d, 0x10
00336 0f8fd00e0000                   jg         0x7f138fe8280c
0033c 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00341 4183fa10                       cmp        r10d, 0x10
00345 0f8c25030000                   jl         0x7f138fe81c70
0034b 458bd0                         mov        r10d, r8d
0034e 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
00353 0f83f20b0000                   jae        0x7f138fe8254b
00359 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0035e c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00365 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0036a 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
0036f 0f83270c0000                   jae        0x7f138fe8259c
00375 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0037a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0037f c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00386 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0038b 4503d0                         add        r10d, r8d
0038e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00393 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0039b 41ffc2                         inc        r10d
0039e 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003a3 0f8d50070000                   jge        0x7f138fe820f9
003a9 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
003b0 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003b5 4f8b5cd308                     mov        r11, qword ptr [r11 + r10*8 + 8]
003ba 4d8bc3                         mov        r8, r11
003bd 49c1e812                       shr        r8, 0x12
003c1 458bc0                         mov        r8d, r8d
003c4 4181e0ffff0300                 and        r8d, 0x3ffff
003cb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003d0 4d8bcb                         mov        r9, r11
003d3 49c1f924                       sar        r9, 0x24
003d7 458bc3                         mov        r8d, r11d
003da 458bd9                         mov        r11d, r9d
003dd 418bd3                         mov        edx, r11d
003e0 4181e0ffff0100                 and        r8d, 0x1ffff
003e7 4489442428                     mov        dword ptr [rsp + 0x28], r8d
003ec 4585db                         test       r11d, r11d
003ef 0f8cc70c0000                   jl         0x7f138fe826bc
003f5 458bd8                         mov        r11d, r8d
003f8 4585c0                         test       r8d, r8d
003fb 0f84f8fdffff                   je         0x7f138fe817f9
00401 448b0424                       mov        r8d, dword ptr [rsp]
00405 442bc3                         sub        r8d, ebx
00408 453bd8                         cmp        r11d, r8d
0040b 0f8ef0fdffff                   jle        0x7f138fe81801
00411 be45ffffff                     mov        esi, 0xffffff45
00416 418beb                         mov        ebp, r11d
00419 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00421 666690                         nop        
00424 c5f877                         vzeroupper 
00427 e8b42ab4ff                     call       0x7f138f9c44e0
0042c 0f1f840024050000               nop        dword ptr [rax + rax + 0x524]
00434 4183fb30                       cmp        r11d, 0x30
00438 0f8fad050000                   jg         0x7f138fe81feb
0043e 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00442 0f834f0e0000                   jae        0x7f138fe82897
00448 4c63cb                         movsxd     r9, ebx
0044b 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00453 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
0045a 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0045f 0f83830e0000                   jae        0x7f138fe828e8
00465 458d5810                       lea        r11d, [r8 + 0x10]
00469 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00471 4d63d8                         movsxd     r11, r8d
00474 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00479 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00480 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
00487 413bce                         cmp        ecx, r14d
0048a 0f8dc7000000                   jge        0x7f138fe81b57
00490 4d2bcb                         sub        r9, r11
00493 4c63d9                         movsxd     r11, ecx
00496 4f8d140b                       lea        r10, [r11 + r9]
0049a 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004a2 0f83b40e0000                   jae        0x7f138fe8295c
004a8 4d63d6                         movsxd     r10, r14d
004ab 4d2bd3                         sub        r10, r11
004ae 4983c20f                       add        r10, 0xf
004b2 4983e2f0                       and        r10, 0xfffffffffffffff0
004b6 458bd2                         mov        r10d, r10d
004b9 478d540210                     lea        r10d, [r10 + r8 + 0x10]
004be 4d63d2                         movsxd     r10, r10d
004c1 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004c6 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
004ce 0f83880e0000                   jae        0x7f138fe8295c
004d4 3b4c2444                       cmp        ecx, dword ptr [rsp + 0x44]
004d8 0f837e0e0000                   jae        0x7f138fe8295c
004de 4983c2f0                       add        r10, -0x10
004e2 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
004ea 0f836c0e0000                   jae        0x7f138fe8295c
004f0 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
004f7 0f8fa70e0000                   jg         0x7f138fe829a4
004fd 448bdb                         mov        r11d, ebx
00500 452bd8                         sub        r11d, r8d
00503 0f1f8000000000                 nop        dword ptr [rax]
0050a 660f1f440000                   nop        word ptr [rax + rax]
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
00555 7cb9                           jl         0x7f138fe81b10
00557 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0055c 4403d3                         add        r10d, ebx
0055f 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00567 4489742438                     mov        dword ptr [rsp + 0x38], r14d
0056c e9affdffff                     jmp        0x7f138fe81920
00571 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00576 4585c0                         test       r8d, r8d
00579 7406                           je         0x7f138fe81b81
0057b 41ffcb                         dec        r11d
0057e 418bd3                         mov        edx, r11d
00581 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00586 458b4308                       mov        r8d, dword ptr [r11 + 8]
0058a 85d2                           test       edx, edx
0058c 0f84c0040000                   je         0x7f138fe82052
00592 83fa03                         cmp        edx, 3
00595 0f84c4040000                   je         0x7f138fe8205f
0059b 83fa02                         cmp        edx, 2
0059e 0f878a000000                   ja         0x7f138fe81c2e
005a4 3b9424d8000000                 cmp        edx, dword ptr [rsp + 0xd8]
005ab 0f83280f0000                   jae        0x7f138fe82ad9
005b1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005b6 458b449008                     mov        r8d, dword ptr [r8 + rdx*4 + 8]
005bb 85d2                           test       edx, edx
005bd 7e54                           jle        0x7f138fe81c13
005bf 448d5aff                       lea        r11d, [rdx - 1]
005c3 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
005cb 0f83fb110000                   jae        0x7f138fe82dcc
005d1 4863fa                         movsxd     rdi, edx
005d4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005d9 458bcb                         mov        r9d, r11d
005dc 4183c1cc                       add        r9d, -0x34
005e0 41c1e902                       shr        r9d, 2
005e4 458d5c11ff                     lea        r11d, [r9 + rdx - 1]
005e9 b904000000                     mov        ecx, 4
005ee c442f0f5db                     bzhi       r11, r11, rcx
005f3 492bfb                         sub        rdi, r11
005f6 48ffcf                         dec        rdi
005f9 4533db                         xor        r11d, r11d
005fc 4885ff                         test       rdi, rdi
005ff 490f4cfb                       cmovl      rdi, r11
00603 448bdf                         mov        r11d, edi
00606 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0060e e9b4020000                     jmp        0x7f138fe81ec7
00613 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0061b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00620 45894208                       mov        dword ptr [r10 + 8], r8d
00624 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
00629 e914fcffff                     jmp        0x7f138fe81842
0062e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00636 48be9010bce200000000           movabs     rsi, 0xe2bc1090
00640 8beb                           mov        ebp, ebx
00642 6690                           nop        
00644 c5f877                         vzeroupper 
00647 e8148ca7ff                     call       0x7f138f8fa860
0064c 0f1f840044070001               nop        dword ptr [rax + rax + 0x1000744]
00654 4885c0                         test       rax, rax
00657 0f84ff0e0000                   je         0x7f138fe82b5c
0065d 488bf0                         mov        rsi, rax
00660 c5f877                         vzeroupper 
00663 4881c4c0000000                 add        rsp, 0xc0
0066a 5d                             pop        rbp
0066b e97070b4ff                     jmp        0x7f138f9c8ce0
00670 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00675 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
0067a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0067f 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00684 0f8d7f010000                   jge        0x7f138fe81e09
0068a 4183fa08                       cmp        r10d, 8
0068e 0f8dfc120000                   jge        0x7f138fe82f90
00694 458bd0                         mov        r10d, r8d
00697 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
0069f 0f83770f0000                   jae        0x7f138fe82c1c
006a5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006aa 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
006b0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006b5 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
006bd 0f83c90f0000                   jae        0x7f138fe82c8c
006c3 43886c1308                     mov        byte ptr [r11 + r10 + 8], bpl
006c8 458d5003                       lea        r10d, [r8 + 3]
006cc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006d1 41ffc1                         inc        r9d
006d4 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
006dc 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
006e4 0f83de0f0000                   jae        0x7f138fe82cc8
006ea 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006ef 4183c203                       add        r10d, 3
006f3 4d63d8                         movsxd     r11, r8d
006f6 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
006fb 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
00701 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00709 0f8305100000                   jae        0x7f138fe82d14
0070f 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00714 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
00719 430fbe4c190a                   movsx      ecx, byte ptr [r9 + r11 + 0xa]
0071f 43884c110a                     mov        byte ptr [r9 + r10 + 0xa], cl
00724 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
0072a 47885c110b                     mov        byte ptr [r9 + r10 + 0xb], r11b
0072f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00734 4183fa08                       cmp        r10d, 8
00738 0f831e100000                   jae        0x7f138fe82d5c
0073e 49bab07fb6e200000000           movabs     r10, 0xe2b67fb0
00748 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
0074d 4703448a08                     add        r8d, dword ptr [r10 + r9*4 + 8]
00752 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00757 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0075c 4183fa04                       cmp        r10d, 4
00760 7e3e                           jle        0x7f138fe81da0
00762 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00766 83c504                         add        ebp, 4
00769 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0076e 418bd0                         mov        edx, r8d
00771 666690                         nop        
00774 c5f877                         vzeroupper 
00777 e8e48aa7ff                     call       0x7f138f8fa860
0077c 0f1f840074080002               nop        dword ptr [rax + rax + 0x2000874]
00784 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00789 8bd5                           mov        edx, ebp
0078b 8bc8                           mov        ecx, eax
0078d 666690                         nop        
00790 c5f877                         vzeroupper 
00793 e8c88aa7ff                     call       0x7f138f8fa860
00798 0f1f840090080003               nop        dword ptr [rax + rax + 0x3000890]
007a0 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a5 4183fa08                       cmp        r10d, 8
007a9 0f8ee4fbffff                   jle        0x7f138fe81993
007af 49bad87fb6e200000000           movabs     r10, 0xe2b67fd8
007b9 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007bd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
007c2 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007c7 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
007cb 83c508                         add        ebp, 8
007ce 83c208                         add        edx, 8
007d1 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007d6 6690                           nop        
007d8 c5f877                         vzeroupper 
007db e8808aa7ff                     call       0x7f138f8fa860
007e0 0f1f8400d8080004               nop        dword ptr [rax + rax + 0x40008d8]
007e8 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007ed 8bd5                           mov        edx, ebp
007ef 488bc8                         mov        rcx, rax
007f2 6690                           nop        
007f4 c5f877                         vzeroupper 
007f7 e8648aa7ff                     call       0x7f138f8fa860
007fc 0f1f8400f4080005               nop        dword ptr [rax + rax + 0x50008f4]
00804 e98afbffff                     jmp        0x7f138fe81993
00809 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0080e 4183fa30                       cmp        r10d, 0x30
00812 0f8fc4100000                   jg         0x7f138fe82edc
00818 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
0081c 83c5f9                         add        ebp, -7
0081f 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00823 458bd0                         mov        r10d, r8d
00826 443bd5                         cmp        r10d, ebp
00829 0f83450d0000                   jae        0x7f138fe82b74
0082f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00837 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0083c 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00843 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00848 4889ac2498000000               mov        qword ptr [rsp + 0x98], rbp
00850 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00855 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0085a 0f83700d0000                   jae        0x7f138fe82bd0
00860 48be28c122e200000000           movabs     rsi, 0xe222c128
0086a 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0086e 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00872 4863cd                         movsxd     rcx, ebp
00875 4883c108                       add        rcx, 8
00879 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
0087e 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
00886 4533c9                         xor        r9d, r9d
00889 666690                         nop        
0088c c5f877                         vzeroupper 
0088f e8cc7fa7ff                     call       0x7f138f8f9e60
00894 0f1f84008c090006               nop        dword ptr [rax + rax + 0x600098c]
0089c 83c508                         add        ebp, 8
0089f 896c2438                       mov        dword ptr [rsp + 0x38], ebp
008a3 3b6c2414                       cmp        ebp, dword ptr [rsp + 0x14]
008a7 0f8ca70f0000                   jl         0x7f138fe82e54
008ad 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
008b2 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
008b7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
008bc e9d2faffff                     jmp        0x7f138fe81993
008c1 666690                         nop        
008c4 418bd1                         mov        edx, r9d
008c7 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008cc 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
008d1 498bc9                         mov        rcx, r9
008d4 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
008d9 448d4aff                       lea        r9d, [rdx - 1]
008dd 453bcb                         cmp        r9d, r11d
008e0 7fe2                           jg         0x7f138fe81ec4
008e2 4183f93f                       cmp        r9d, 0x3f
008e6 0f8e600f0000                   jle        0x7f138fe82e4c
008ec 448bd2                         mov        r10d, edx
008ef 41ffca                         dec        r10d
008f2 458bca                         mov        r9d, r10d
008f5 eb0c                           jmp        0x7f138fe81f03
008f7 660f1f840000000000             nop        word ptr [rax + rax]
00900 458bca                         mov        r9d, r10d
00903 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00908 62917e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x38]
00913 62917e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x34], zmm0
0091e 62917e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x78]
00929 62917e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x74], zmm0
00934 62917e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xb8]
0093f 62917e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xb4], zmm0
0094a 62917e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xf8]
00955 62917e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xf4], zmm0
00960 458d51c0                       lea        r10d, [r9 - 0x40]
00964 4183fa3f                       cmp        r10d, 0x3f
00968 7f96                           jg         0x7f138fe81f00
0096a 4183fa0f                       cmp        r10d, 0xf
0096e 7e2d                           jle        0x7f138fe81f9d
00970 458bd1                         mov        r10d, r9d
00973 4183c2c0                       add        r10d, -0x40
00977 90                             nop        
00978 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0097d 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00988 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00993 4183c2f0                       add        r10d, -0x10
00997 4183fa0f                       cmp        r10d, 0xf
0099b 7fdb                           jg         0x7f138fe81f78
0099d 4585d2                         test       r10d, r10d
009a0 0f8e75fcffff                   jle        0x7f138fe81c1b
009a6 6690                           nop        
009a8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
009ad 478b4c9304                     mov        r9d, dword ptr [r11 + r10*4 + 4]
009b2 47894c9308                     mov        dword ptr [r11 + r10*4 + 8], r9d
009b7 41ffca                         dec        r10d
009ba 4585d2                         test       r10d, r10d
009bd 7fe9                           jg         0x7f138fe81fa8
009bf e957fcffff                     jmp        0x7f138fe81c1b
009c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009c9 4d63d2                         movsxd     r10, r10d
009cc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009d3 c442a8f5db                     bzhi       r11, r11, r10
009d8 c4c1fb92fb                     kmovq      k7, r11
009dd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009e3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e9 eb5d                           jmp        0x7f138fe82048
009eb 85db                           test       ebx, ebx
009ed 0f8c590f0000                   jl         0x7f138fe82f4c
009f3 4585c0                         test       r8d, r8d
009f6 0f8c500f0000                   jl         0x7f138fe82f4c
009fc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a01 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00a09 0f823d0f0000                   jb         0x7f138fe82f4c
00a0f 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00a17 453bd6                         cmp        r10d, r14d
00a1a 0f822c0f0000                   jb         0x7f138fe82f4c
00a20 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a25 4585db                         test       r11d, r11d
00a28 741e                           je         0x7f138fe82048
00a2a 4883fa20                       cmp        rdx, 0x20
00a2e 7694                           jbe        0x7f138fe81fc4
00a30 c5f877                         vzeroupper 
00a33 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00a3d 41ffd2                         call       r10
00a40 0f1f840000000000               nop        dword ptr [rax + rax]
00a48 4489742438                     mov        dword ptr [rsp + 0x38], r14d
00a4d e9cef8ffff                     jmp        0x7f138fe81920
00a52 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a5a e9c5fbffff                     jmp        0x7f138fe81c24
00a5f 41ffc8                         dec        r8d
00a62 4585c0                         test       r8d, r8d
00a65 7e27                           jle        0x7f138fe8208e
00a67 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00a6c 41894b10                       mov        dword ptr [r11 + 0x10], ecx
00a70 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00a74 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00a79 4589590c                       mov        dword ptr [r9 + 0xc], r11d
00a7d 45894108                       mov        dword ptr [r9 + 8], r8d
00a81 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a89 e996fbffff                     jmp        0x7f138fe81c24
00a8e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00a96 48be6010bce200000000           movabs     rsi, 0xe2bc1060
00aa0 8beb                           mov        ebp, ebx
00aa2 6690                           nop        
00aa4 c5f877                         vzeroupper 
00aa7 e8b487a7ff                     call       0x7f138f8fa860
00aac 0f1f8400a40b0007               nop        dword ptr [rax + rax + 0x7000ba4]
00ab4 4885c0                         test       rax, rax
00ab7 0f85a0fbffff                   jne        0x7f138fe81c5d
00abd bef6ffffff                     mov        esi, 0xfffffff6
00ac2 6690                           nop        
00ac4 c5f877                         vzeroupper 
00ac7 e81424b4ff                     call       0x7f138f9c44e0
00acc 0f1f8400c40b0008               nop        dword ptr [rax + rax + 0x8000bc4]
00ad4 4d63d2                         movsxd     r10, r10d
00ad7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ade c442a8f5db                     bzhi       r11, r11, r10
00ae3 c4c1fb92fb                     kmovq      k7, r11
00ae8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aee 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00af4 e9a8000000                     jmp        0x7f138fe821a1
00af9 448b1c24                       mov        r11d, dword ptr [rsp]
00afd 458bd3                         mov        r10d, r11d
00b00 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00b08 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b0d 4585db                         test       r11d, r11d
00b10 0f84f60e0000                   je         0x7f138fe8300c
00b16 498bcb                         mov        rcx, r11
00b19 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00b21 4585c0                         test       r8d, r8d
00b24 0f8c1a0f0000                   jl         0x7f138fe83044
00b2a 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
00b2f 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00b37 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00b3b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b40 4585c9                         test       r9d, r9d
00b43 0f8c0d0f0000                   jl         0x7f138fe83056
00b49 3b1424                         cmp        edx, dword ptr [rsp]
00b4c 0f82040f0000                   jb         0x7f138fe83056
00b52 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
00b56 4103da                         add        ebx, r10d
00b59 8b7904                         mov        edi, dword ptr [rcx + 4]
00b5c 3bfb                           cmp        edi, ebx
00b5e 0f82f20e0000                   jb         0x7f138fe83056
00b64 4585d2                         test       r10d, r10d
00b67 0f8ce90e0000                   jl         0x7f138fe83056
00b6d 4585d2                         test       r10d, r10d
00b70 742f                           je         0x7f138fe821a1
00b72 4a8d740908                     lea        rsi, [rcx + r9 + 8]
00b77 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00b7c 4963d2                         movsxd     rdx, r10d
00b7f 4883fa20                       cmp        rdx, 0x20
00b83 0f864bffffff                   jbe        0x7f138fe820d4
00b89 c5f877                         vzeroupper 
00b8c 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00b96 41ffd2                         call       r10
00b99 0f1f840000000000               nop        dword ptr [rax + rax]
00ba1 895d38                         mov        dword ptr [rbp + 0x38], ebx
00ba4 c5f877                         vzeroupper 
00ba7 4881c4c0000000                 add        rsp, 0xc0
00bae 5d                             pop        rbp
00baf 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00bb3 0f877f100000                   ja         0x7f138fe83238
00bb9 c3                             ret        
00bba 4d03d3                         add        r10, r11
00bbd 4d3bd6                         cmp        r10, r14
00bc0 7e08                           jle        0x7f138fe821ca
00bc2 4533ed                         xor        r13d, r13d
00bc5 e9ddf4ffff                     jmp        0x7f138fe816a7
00bca 4533ed                         xor        r13d, r13d
00bcd bb01000000                     mov        ebx, 1
00bd2 e9d2f4ffff                     jmp        0x7f138fe816a9
00bd7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bdc 4d63d3                         movsxd     r10, r11d
00bdf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00be6 c442a8f5db                     bzhi       r11, r11, r10
00beb c4c1fb92fb                     kmovq      k7, r11
00bf0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bf6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bfc eb6b                           jmp        0x7f138fe82269
00bfe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c03 4585db                         test       r11d, r11d
00c06 0f8435030000                   je         0x7f138fe82541
00c0c 85db                           test       ebx, ebx
00c0e 0f8cb80e0000                   jl         0x7f138fe830cc
00c14 4585c0                         test       r8d, r8d
00c17 0f8caf0e0000                   jl         0x7f138fe830cc
00c1d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c22 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00c2a 0f829c0e0000                   jb         0x7f138fe830cc
00c30 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00c38 453bde                         cmp        r11d, r14d
00c3b 0f828b0e0000                   jb         0x7f138fe830cc
00c41 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c46 4585d2                         test       r10d, r10d
00c49 741e                           je         0x7f138fe82269
00c4b 4883fa20                       cmp        rdx, 0x20
00c4f 7686                           jbe        0x7f138fe821d7
00c51 c5f877                         vzeroupper 
00c54 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00c5e 41ffd2                         call       r10
00c61 0f1f840000000000               nop        dword ptr [rax + rax]
00c69 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c6e 4585db                         test       r11d, r11d
00c71 0f8ead010000                   jle        0x7f138fe82424
00c77 458bd6                         mov        r10d, r14d
00c7a 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00c7f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00c87 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c8c 4503de                         add        r11d, r14d
00c8f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c94 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00c99 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00ca1 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00ca6 4b8d743308                     lea        rsi, [r11 + r14 + 8]
00cab 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00cb0 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00cb5 0f8dd1000000                   jge        0x7f138fe8238c
00cbb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00cc0 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00cc5 458bda                         mov        r11d, r10d
00cc8 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00ccd 450f4fd9                       cmovg      r11d, r9d
00cd1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00cd6 4585c0                         test       r8d, r8d
00cd9 0f8c350e0000                   jl         0x7f138fe83114
00cdf 4585f6                         test       r14d, r14d
00ce2 0f8c2c0e0000                   jl         0x7f138fe83114
00ce8 478d1403                       lea        r10d, [r11 + r8]
00cec 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00cf4 453bda                         cmp        r11d, r10d
00cf7 0f82170e0000                   jb         0x7f138fe83114
00cfd 458bde                         mov        r11d, r14d
00d00 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00d05 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d0d 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00d15 453bd3                         cmp        r10d, r11d
00d18 0f82f60d0000                   jb         0x7f138fe83114
00d1e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d23 4585db                         test       r11d, r11d
00d26 0f8ce80d0000                   jl         0x7f138fe83114
00d2c 4585db                         test       r11d, r11d
00d2f 742c                           je         0x7f138fe8235d
00d31 4963d3                         movsxd     rdx, r11d
00d34 4883fa20                       cmp        rdx, 0x20
00d38 7738                           ja         0x7f138fe82372
00d3a 458bd3                         mov        r10d, r11d
00d3d 4d63d2                         movsxd     r10, r10d
00d40 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d47 c442a8f5db                     bzhi       r11, r11, r10
00d4c c4c1fb92fb                     kmovq      k7, r11
00d51 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d57 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d5d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00d62 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00d67 0f8d26f6ffff                   jge        0x7f138fe81993
00d6d e90b010000                     jmp        0x7f138fe8247d
00d72 c5f877                         vzeroupper 
00d75 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00d7f 41ffd2                         call       r10
00d82 0f1f840000000000               nop        dword ptr [rax + rax]
00d8a ebd1                           jmp        0x7f138fe8235d
00d8c 4585c0                         test       r8d, r8d
00d8f 0f8cf30d0000                   jl         0x7f138fe83188
00d95 4585f6                         test       r14d, r14d
00d98 0f8cea0d0000                   jl         0x7f138fe83188
00d9e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00da3 4503d8                         add        r11d, r8d
00da6 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00dae 453bd3                         cmp        r10d, r11d
00db1 0f82d10d0000                   jb         0x7f138fe83188
00db7 458bc2                         mov        r8d, r10d
00dba 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dbf 453bc2                         cmp        r8d, r10d
00dc2 0f82c00d0000                   jb         0x7f138fe83188
00dc8 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00dcd 4585d2                         test       r10d, r10d
00dd0 0f84bdf5ffff                   je         0x7f138fe81993
00dd6 4963d2                         movsxd     rdx, r10d
00dd9 4883fa20                       cmp        rdx, 0x20
00ddd 7728                           ja         0x7f138fe82407
00ddf 458bda                         mov        r11d, r10d
00de2 4d63d3                         movsxd     r10, r11d
00de5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dec c442a8f5db                     bzhi       r11, r11, r10
00df1 c4c1fb92fb                     kmovq      k7, r11
00df6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dfc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e02 e98cf5ffff                     jmp        0x7f138fe81993
00e07 c5f877                         vzeroupper 
00e0a 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00e14 41ffd2                         call       r10
00e17 0f1f840000000000               nop        dword ptr [rax + rax]
00e1f e96ff5ffff                     jmp        0x7f138fe81993
00e24 4489742414                     mov        dword ptr [rsp + 0x14], r14d
00e29 e965f5ffff                     jmp        0x7f138fe81993
00e2e 448bd5                         mov        r10d, ebp
00e31 4d63d2                         movsxd     r10, r10d
00e34 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e3b c442a8f5db                     bzhi       r11, r11, r10
00e40 c4c1fb92fb                     kmovq      k7, r11
00e45 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e4b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e51 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00e56 4403d5                         add        r10d, ebp
00e59 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00e5e 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00e62 418502                         test       dword ptr [r10], eax
00e65 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e6a 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00e6f 0f8d1ef5ffff                   jge        0x7f138fe81993
00e75 4489ac2498000000               mov        dword ptr [rsp + 0x98], r13d
00e7d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e85 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00e8a 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00e92 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00e96 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00e9a 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
00e9e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00ea3 410f4fea                       cmovg      ebp, r10d
00ea7 458bc3                         mov        r8d, r11d
00eaa 4585db                         test       r11d, r11d
00ead 0f8cd90b0000                   jl         0x7f138fe8308c
00eb3 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ebb 4585d2                         test       r10d, r10d
00ebe 0f8cc80b0000                   jl         0x7f138fe8308c
00ec4 458d142b                       lea        r10d, [r11 + rbp]
00ec8 448b8c24dc000000               mov        r9d, dword ptr [rsp + 0xdc]
00ed0 453bca                         cmp        r9d, r10d
00ed3 0f82b30b0000                   jb         0x7f138fe8308c
00ed9 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00ee1 4403ed                         add        r13d, ebp
00ee4 458bd1                         mov        r10d, r9d
00ee7 453bd5                         cmp        r10d, r13d
00eea 0f829c0b0000                   jb         0x7f138fe8308c
00ef0 85ed                           test       ebp, ebp
00ef2 0f8c940b0000                   jl         0x7f138fe8308c
00ef8 85ed                           test       ebp, ebp
00efa 0f8451ffffff                   je         0x7f138fe82451
00f00 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f05 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00f0a 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00f12 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00f17 4863d5                         movsxd     rdx, ebp
00f1a 4883fa20                       cmp        rdx, 0x20
00f1e 0f860affffff                   jbe        0x7f138fe8242e
00f24 c5f877                         vzeroupper 
00f27 49ba203f8e8f137f0000           movabs     r10, 0x7f138f8e3f20
00f31 41ffd2                         call       r10
00f34 0f1f840000000000               nop        dword ptr [rax + rax]
00f3c e910ffffff                     jmp        0x7f138fe82451
00f41 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
00f46 e91efdffff                     jmp        0x7f138fe82269
00f4b bee4ffffff                     mov        esi, 0xffffffe4
00f50 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00f58 448b1424                       mov        r10d, dword ptr [rsp]
00f5c 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00f64 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f69 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00f71 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00f76 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00f7e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f83 4c891424                       mov        qword ptr [rsp], r10
00f87 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f8c c5f877                         vzeroupper 
00f8f e84c1fb4ff                     call       0x7f138f9c44e0
00f94 0f1f84008c10000a               nop        dword ptr [rax + rax + 0xa00108c]
00f9c bee4ffffff                     mov        esi, 0xffffffe4
00fa1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00fa9 448b1424                       mov        r10d, dword ptr [rsp]
00fad 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00fb5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fba 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00fc2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00fc7 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00fcf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fd4 4c891424                       mov        qword ptr [rsp], r10
00fd8 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00fdd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00fe2 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00fe8 c5f877                         vzeroupper 
00feb e8f01eb4ff                     call       0x7f138f9c44e0
00ff0 0f1f8400e810000b               nop        dword ptr [rax + rax + 0xb0010e8]
00ff8 bee4ffffff                     mov        esi, 0xffffffe4
00ffd 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01005 448b1c24                       mov        r11d, dword ptr [rsp]
01009 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01011 448b542404                     mov        r10d, dword ptr [rsp + 4]
01016 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0101e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01023 4c891424                       mov        qword ptr [rsp], r10
01027 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0102b 90                             nop        
0102c c5f877                         vzeroupper 
0102f e8ac1eb4ff                     call       0x7f138f9c44e0
01034 0f1f84002c11000c               nop        dword ptr [rax + rax + 0xc00112c]
0103c bee4ffffff                     mov        esi, 0xffffffe4
01041 498bea                         mov        rbp, r10
01044 448b1c24                       mov        r11d, dword ptr [rsp]
01048 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01050 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01055 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0105d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01062 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0106a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0106f 4c891424                       mov        qword ptr [rsp], r10
01073 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01077 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0107c 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01081 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01086 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0108c c5f877                         vzeroupper 
0108f e84c1eb4ff                     call       0x7f138f9c44e0
01094 0f1f84008c11000d               nop        dword ptr [rax + rax + 0xd00118c]
0109c be45ffffff                     mov        esi, 0xffffff45
010a1 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
010a9 666690                         nop        
010ac c5f877                         vzeroupper 
010af e82c1eb4ff                     call       0x7f138f9c44e0
010b4 0f1f8400ac11000e               nop        dword ptr [rax + rax + 0xe0011ac]
010bc be45ffffff                     mov        esi, 0xffffff45
010c1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
010c9 448b0424                       mov        r8d, dword ptr [rsp]
010cd 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
010d5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010da 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
010e2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
010e7 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
010ef 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
010f4 4c891c24                       mov        qword ptr [rsp], r11
010f8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010fd 4489442408                     mov        dword ptr [rsp + 8], r8d
01102 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01107 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0110c 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01110 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01115 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0111a 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
0111f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01124 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01129 89542430                       mov        dword ptr [rsp + 0x30], edx
0112d 666690                         nop        
01130 c5f877                         vzeroupper 
01133 e8a81db4ff                     call       0x7f138f9c44e0
01138 0f1f84003012000f               nop        dword ptr [rax + rax + 0xf001230]
01140 4d3bd3                         cmp        r10, r11
01143 bdffffffff                     mov        ebp, 0xffffffff
01148 7c08                           jl         0x7f138fe82752
0114a 400f95c5                       setne      bpl
0114e 400fb6ed                       movzx      ebp, bpl
01152 be45ffffff                     mov        esi, 0xffffff45
01157 448b0424                       mov        r8d, dword ptr [rsp]
0115b 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01163 448b542404                     mov        r10d, dword ptr [rsp + 4]
01168 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01170 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01175 4c891424                       mov        qword ptr [rsp], r10
01179 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0117d 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01182 6690                           nop        
01184 c5f877                         vzeroupper 
01187 e8541db4ff                     call       0x7f138f9c44e0
0118c 0f1f840084120010               nop        dword ptr [rax + rax + 0x10001284]
01194 be45ffffff                     mov        esi, 0xffffff45
01199 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
011a1 448b1c24                       mov        r11d, dword ptr [rsp]
011a5 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
011ad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011b2 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
011ba 448b542404                     mov        r10d, dword ptr [rsp + 4]
011bf 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
011c7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011cc 4c891424                       mov        qword ptr [rsp], r10
011d0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011d5 44895c2408                     mov        dword ptr [rsp + 8], r11d
011da 48894424f8                     mov        qword ptr [rsp - 8], rax
011df 8b442414                       mov        eax, dword ptr [rsp + 0x14]
011e3 8944240c                       mov        dword ptr [rsp + 0xc], eax
011e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ec 895c2410                       mov        dword ptr [rsp + 0x10], ebx
011f0 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
011f5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011fa 6690                           nop        
011fc c5f877                         vzeroupper 
011ff e8dc1cb4ff                     call       0x7f138f9c44e0
01204 0f1f8400fc120011               nop        dword ptr [rax + rax + 0x110012fc]
0120c be45ffffff                     mov        esi, 0xffffff45
01211 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01219 448b1424                       mov        r10d, dword ptr [rsp]
0121d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01225 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0122a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01232 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01237 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0123f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01244 4c891424                       mov        qword ptr [rsp], r10
01248 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0124d 4489542408                     mov        dword ptr [rsp + 8], r10d
01252 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01257 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0125c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01261 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01266 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0126b 90                             nop        
0126c c5f877                         vzeroupper 
0126f e86c1cb4ff                     call       0x7f138f9c44e0
01274 0f1f84006c130012               nop        dword ptr [rax + rax + 0x1200136c]
0127c 85ff                           test       edi, edi
0127e 0f8478090000                   je         0x7f138fe831fc
01284 488bcf                         mov        rcx, rdi
01287 448b1424                       mov        r10d, dword ptr [rsp]
0128b 89742414                       mov        dword ptr [rsp + 0x14], esi
0128f 4533c0                         xor        r8d, r8d
01292 e9a4f8ffff                     jmp        0x7f138fe8213b
01297 bee4ffffff                     mov        esi, 0xffffffe4
0129c 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
012a4 448b1424                       mov        r10d, dword ptr [rsp]
012a8 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
012b0 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
012b5 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
012bd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012c2 4c891424                       mov        qword ptr [rsp], r10
012c6 4489742438                     mov        dword ptr [rsp + 0x38], r14d
012cb 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
012d0 895c2440                       mov        dword ptr [rsp + 0x40], ebx
012d4 895c2444                       mov        dword ptr [rsp + 0x44], ebx
012d8 c5f877                         vzeroupper 
012db e8001cb4ff                     call       0x7f138f9c44e0
012e0 0f1f8400d8130013               nop        dword ptr [rax + rax + 0x130013d8]
012e8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
012f1 bee4ffffff                     mov        esi, 0xffffffe4
012f6 498bea                         mov        rbp, r10
012f9 448b1424                       mov        r10d, dword ptr [rsp]
012fd 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01305 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0130a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01312 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01317 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0131f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01324 4c891424                       mov        qword ptr [rsp], r10
01328 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0132d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01332 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01337 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0133c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01341 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01345 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0134a 6690                           nop        
0134c c5f877                         vzeroupper 
0134f e88c1bb4ff                     call       0x7f138f9c44e0
01354 0f1f84004c140014               nop        dword ptr [rax + rax + 0x1400144c]
0135c 8beb                           mov        ebp, ebx
0135e 83c510                         add        ebp, 0x10
01361 be6effffff                     mov        esi, 0xffffff6e
01366 448b1424                       mov        r10d, dword ptr [rsp]
0136a 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01372 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01377 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0137f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01384 4c891424                       mov        qword ptr [rsp], r10
01388 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0138c 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01391 666690                         nop        
01394 c5f877                         vzeroupper 
01397 e8441bb4ff                     call       0x7f138f9c44e0
0139c 0f1f840094140015               nop        dword ptr [rax + rax + 0x15001494]
013a4 8beb                           mov        ebp, ebx
013a6 83c510                         add        ebp, 0x10
013a9 be66ffffff                     mov        esi, 0xffffff66
013ae 448b1c24                       mov        r11d, dword ptr [rsp]
013b2 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
013ba 448b542404                     mov        r10d, dword ptr [rsp + 4]
013bf 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
013c7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013cc 4c891424                       mov        qword ptr [rsp], r10
013d0 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013d4 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
013d9 666690                         nop        
013dc c5f877                         vzeroupper 
013df e8fc1ab4ff                     call       0x7f138f9c44e0
013e4 0f1f8400dc140016               nop        dword ptr [rax + rax + 0x160014dc]
013ec be17000000                     mov        esi, 0x17
013f1 666690                         nop        
013f4 c5f877                         vzeroupper 
013f7 e8e41ab4ff                     call       0x7f138f9c44e0
013fc 0f1f8400f4140017               nop        dword ptr [rax + rax + 0x170014f4]
01404 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
0140c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01411 eb0d                           jmp        0x7f138fe82a20
01413 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
0141b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01420 be6effffff                     mov        esi, 0xffffff6e
01425 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0142d 4c89542408                     mov        qword ptr [rsp + 8], r10
01432 897c2410                       mov        dword ptr [rsp + 0x10], edi
01436 4889442418                     mov        qword ptr [rsp + 0x18], rax
0143b 894c2420                       mov        dword ptr [rsp + 0x20], ecx
0143f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01444 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01449 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0144d 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01452 4c89742440                     mov        qword ptr [rsp + 0x40], r14
01457 90                             nop        
01458 c5f877                         vzeroupper 
0145b e8801ab4ff                     call       0x7f138f9c44e0
01460 0f1f840058150018               nop        dword ptr [rax + rax + 0x18001558]
01468 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0146d bebeffffff                     mov        esi, 0xffffffbe
01472 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0147a 448b1424                       mov        r10d, dword ptr [rsp]
0147e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01486 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0148b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01493 4c895c2408                     mov        qword ptr [rsp + 8], r11
01498 893c24                         mov        dword ptr [rsp], edi
0149b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
014a0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014a5 894c2414                       mov        dword ptr [rsp + 0x14], ecx
014a9 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014ae 895c2424                       mov        dword ptr [rsp + 0x24], ebx
014b2 6690                           nop        
014b4 c5f877                         vzeroupper 
014b7 e8241ab4ff                     call       0x7f138f9c44e0
014bc 0f1f8400b4150019               nop        dword ptr [rax + rax + 0x190015b4]
014c4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014c9 eba2                           jmp        0x7f138fe82a6d
014cb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014d0 eb9b                           jmp        0x7f138fe82a6d
014d2 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014d7 eb94                           jmp        0x7f138fe82a6d
014d9 bee4ffffff                     mov        esi, 0xffffffe4
014de 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
014e6 448b1c24                       mov        r11d, dword ptr [rsp]
014ea 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
014f2 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014f7 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
014ff 448b442404                     mov        r8d, dword ptr [rsp + 4]
01504 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0150c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01511 4c891c24                       mov        qword ptr [rsp], r11
01515 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0151a 4489442408                     mov        dword ptr [rsp + 8], r8d
0151f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01524 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01529 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0152d 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01532 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01537 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
0153c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01541 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01546 8954243c                       mov        dword ptr [rsp + 0x3c], edx
0154a 6690                           nop        
0154c c5f877                         vzeroupper 
0154f e88c19b4ff                     call       0x7f138f9c44e0
01554 0f1f84004c16001a               nop        dword ptr [rax + rax + 0x1a00164c]
0155c bef6ffffff                     mov        esi, 0xfffffff6
01561 666690                         nop        
01564 c5f877                         vzeroupper 
01567 e87419b4ff                     call       0x7f138f9c44e0
0156c 0f1f84006416001b               nop        dword ptr [rax + rax + 0x1b001664]
01574 bee4ffffff                     mov        esi, 0xffffffe4
01579 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01581 448b1c24                       mov        r11d, dword ptr [rsp]
01585 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0158d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01592 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0159a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0159f 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
015a7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015ac 4c891424                       mov        qword ptr [rsp], r10
015b0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015b5 4489542408                     mov        dword ptr [rsp + 8], r10d
015ba 4489442444                     mov        dword ptr [rsp + 0x44], r8d
015bf 90                             nop        
015c0 c5f877                         vzeroupper 
015c3 e81819b4ff                     call       0x7f138f9c44e0
015c8 0f1f8400c016001c               nop        dword ptr [rax + rax + 0x1c0016c0]
015d0 bee4ffffff                     mov        esi, 0xffffffe4
015d5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
015dd 448b1424                       mov        r10d, dword ptr [rsp]
015e1 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
015e9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015ee 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
015f6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
015fb 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01603 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01608 4c891424                       mov        qword ptr [rsp], r10
0160c c5f877                         vzeroupper 
0160f e8cc18b4ff                     call       0x7f138f9c44e0
01614 0f1f84000c17001d               nop        dword ptr [rax + rax + 0x1d00170c]
0161c bee4ffffff                     mov        esi, 0xffffffe4
01621 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01629 448b1c24                       mov        r11d, dword ptr [rsp]
0162d 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01635 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0163a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01642 448b542404                     mov        r10d, dword ptr [rsp + 4]
01647 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0164f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01654 4c891424                       mov        qword ptr [rsp], r10
01658 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0165d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01662 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01667 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0166c 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01671 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01676 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0167b 90                             nop        
0167c c5f877                         vzeroupper 
0167f e85c18b4ff                     call       0x7f138f9c44e0
01684 0f1f84007c17001e               nop        dword ptr [rax + rax + 0x1e00177c]
0168c bee4ffffff                     mov        esi, 0xffffffe4
01691 448b1424                       mov        r10d, dword ptr [rsp]
01695 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0169d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016a2 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
016aa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016af 4c891424                       mov        qword ptr [rsp], r10
016b3 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
016b8 c5f877                         vzeroupper 
016bb e82018b4ff                     call       0x7f138f9c44e0
016c0 0f1f8400b817001f               nop        dword ptr [rax + rax + 0x1f0017b8]
016c8 418d6801                       lea        ebp, [r8 + 1]
016cc bee4ffffff                     mov        esi, 0xffffffe4
016d1 448b1c24                       mov        r11d, dword ptr [rsp]
016d5 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
016dd 448b542404                     mov        r10d, dword ptr [rsp + 4]
016e2 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
016ea 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016ef 4c891424                       mov        qword ptr [rsp], r10
016f3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016f8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
016fd 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01702 6690                           nop        
01704 c5f877                         vzeroupper 
01707 e8d417b4ff                     call       0x7f138f9c44e0
0170c 0f1f840004180020               nop        dword ptr [rax + rax + 0x20001804]
01714 bee4ffffff                     mov        esi, 0xffffffe4
01719 448b1424                       mov        r10d, dword ptr [rsp]
0171d 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01725 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0172a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01732 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01737 4c891424                       mov        qword ptr [rsp], r10
0173b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01740 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01745 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0174a 6690                           nop        
0174c c5f877                         vzeroupper 
0174f e88c17b4ff                     call       0x7f138f9c44e0
01754 0f1f84004c180021               nop        dword ptr [rax + rax + 0x2100184c]
0175c bee4ffffff                     mov        esi, 0xffffffe4
01761 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01769 448b1424                       mov        r10d, dword ptr [rsp]
0176d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01775 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0177a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01782 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01787 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0178f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01794 4c891424                       mov        qword ptr [rsp], r10
01798 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0179d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017a2 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
017a7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017ac 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017b1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017b6 4489442434                     mov        dword ptr [rsp + 0x34], r8d
017bb 90                             nop        
017bc c5f877                         vzeroupper 
017bf e81c17b4ff                     call       0x7f138f9c44e0
017c4 0f1f8400bc180022               nop        dword ptr [rax + rax + 0x220018bc]
017cc be6effffff                     mov        esi, 0xffffff6e
017d1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
017d9 448b1c24                       mov        r11d, dword ptr [rsp]
017dd 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
017e5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
017ea 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
017f2 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
017f7 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
017ff 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01804 44894c2408                     mov        dword ptr [rsp + 8], r9d
01809 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0180e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01813 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01817 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0181c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01821 448b4c2424                     mov        r9d, dword ptr [rsp + 0x24]
01826 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0182b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01830 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01835 89542440                       mov        dword ptr [rsp + 0x40], edx
01839 666690                         nop        
0183c c5f877                         vzeroupper 
0183f e89c16b4ff                     call       0x7f138f9c44e0
01844 0f1f84003c190023               nop        dword ptr [rax + rax + 0x2300193c]
0184c 458bd1                         mov        r10d, r9d
0184f e949f1ffff                     jmp        0x7f138fe81f9d
01854 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0185c 4183c308                       add        r11d, 8
01860 458bcb                         mov        r9d, r11d
01863 be45ffffff                     mov        esi, 0xffffff45
01868 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01870 448b1424                       mov        r10d, dword ptr [rsp]
01874 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0187c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01881 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01889 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0188e 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01896 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0189b 4c891424                       mov        qword ptr [rsp], r10
0189f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018a4 4489542408                     mov        dword ptr [rsp + 8], r10d
018a9 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
018ae 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018b3 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
018b8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018bd 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018c2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
018c7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
018cc c5f877                         vzeroupper 
018cf e80c16b4ff                     call       0x7f138f9c44e0
018d4 0f1f8400cc190024               nop        dword ptr [rax + rax + 0x240019cc]
018dc be45ffffff                     mov        esi, 0xffffff45
018e1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
018e9 448b1c24                       mov        r11d, dword ptr [rsp]
018ed 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
018f5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018fa 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01902 448b542404                     mov        r10d, dword ptr [rsp + 4]
01907 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0190f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01914 4c891424                       mov        qword ptr [rsp], r10
01918 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0191d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01922 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01927 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0192c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01931 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01936 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0193b 90                             nop        
0193c c5f877                         vzeroupper 
0193f e89c15b4ff                     call       0x7f138f9c44e0
01944 0f1f84003c1a0025               nop        dword ptr [rax + rax + 0x25001a3c]
0194c beccffffff                     mov        esi, 0xffffffcc
01951 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01959 448b1c24                       mov        r11d, dword ptr [rsp]
0195d 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01965 448b542404                     mov        r10d, dword ptr [rsp + 4]
0196a 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01972 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01977 4c891424                       mov        qword ptr [rsp], r10
0197b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0197f 90                             nop        
01980 c5f877                         vzeroupper 
01983 e85815b4ff                     call       0x7f138f9c44e0
01988 0f1f8400801a0026               nop        dword ptr [rax + rax + 0x26001a80]
01990 be45ffffff                     mov        esi, 0xffffff45
01995 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0199d 448b1c24                       mov        r11d, dword ptr [rsp]
019a1 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
019a9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ae 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
019b6 448b542404                     mov        r10d, dword ptr [rsp + 4]
019bb 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
019c3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019c8 4c891424                       mov        qword ptr [rsp], r10
019cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
019d6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
019db 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
019e0 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
019e5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019ea 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
019ef 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019f4 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
019f9 666690                         nop        
019fc c5f877                         vzeroupper 
019ff e8dc14b4ff                     call       0x7f138f9c44e0
01a04 0f1f8400fc1a0027               nop        dword ptr [rax + rax + 0x27001afc]
01a0c 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a14 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
01a1b bef6ffffff                     mov        esi, 0xfffffff6
01a20 498beb                         mov        rbp, r11
01a23 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01a2a 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01a32 6690                           nop        
01a34 c5f877                         vzeroupper 
01a37 e8a414b4ff                     call       0x7f138f9c44e0
01a3c 0f1f8400341b0028               nop        dword ptr [rax + rax + 0x28001b34]
01a44 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01a49 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a51 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01a56 beccffffff                     mov        esi, 0xffffffcc
01a5b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a63 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01a6b 44890c24                       mov        dword ptr [rsp], r9d
01a6f 48894c2408                     mov        qword ptr [rsp + 8], rcx
01a74 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a79 666690                         nop        
01a7c c5f877                         vzeroupper 
01a7f e85c14b4ff                     call       0x7f138f9c44e0
01a84 0f1f84007c1b0029               nop        dword ptr [rax + rax + 0x29001b7c]
01a8c beccffffff                     mov        esi, 0xffffffcc
01a91 448b1424                       mov        r10d, dword ptr [rsp]
01a95 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01a9d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01aa2 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01aaa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aaf 4c891424                       mov        qword ptr [rsp], r10
01ab3 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01ab7 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01abc c5f877                         vzeroupper 
01abf e81c14b4ff                     call       0x7f138f9c44e0
01ac4 0f1f8400bc1b002a               nop        dword ptr [rax + rax + 0x2a001bbc]
01acc beccffffff                     mov        esi, 0xffffffcc
01ad1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01ad9 448b1424                       mov        r10d, dword ptr [rsp]
01add 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01ae5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01aea 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01af2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01af7 4c891424                       mov        qword ptr [rsp], r10
01afb 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01aff 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01b04 c5f877                         vzeroupper 
01b07 e8d413b4ff                     call       0x7f138f9c44e0
01b0c 0f1f8400041c002b               nop        dword ptr [rax + rax + 0x2b001c04]
01b14 beccffffff                     mov        esi, 0xffffffcc
01b19 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b21 448b1424                       mov        r10d, dword ptr [rsp]
01b25 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b2d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b32 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b3a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b3f 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b47 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b4c 4c891424                       mov        qword ptr [rsp], r10
01b50 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b55 4489542408                     mov        dword ptr [rsp + 8], r10d
01b5a 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01b5e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b63 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b68 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01b6d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b72 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01b77 90                             nop        
01b78 c5f877                         vzeroupper 
01b7b e86013b4ff                     call       0x7f138f9c44e0
01b80 0f1f8400781c002c               nop        dword ptr [rax + rax + 0x2c001c78]
01b88 beccffffff                     mov        esi, 0xffffffcc
01b8d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b95 448b1c24                       mov        r11d, dword ptr [rsp]
01b99 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01ba1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ba6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01bae 448b542404                     mov        r10d, dword ptr [rsp + 4]
01bb3 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bbb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bc0 4c891424                       mov        qword ptr [rsp], r10
01bc4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bc9 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bce 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01bd2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01bd7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01bdc 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01be1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01be6 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01beb 90                             nop        
01bec c5f877                         vzeroupper 
01bef e8ec12b4ff                     call       0x7f138f9c44e0
01bf4 0f1f8400ec1c002d               nop        dword ptr [rax + rax + 0x2d001cec]
01bfc 448bc1                         mov        r8d, ecx
01bff 89742414                       mov        dword ptr [rsp + 0x14], esi
01c03 33c9                           xor        ecx, ecx
01c05 458bd0                         mov        r10d, r8d
01c08 e90efeffff                     jmp        0x7f138fe8301b
01c0d bef6ffffff                     mov        esi, 0xfffffff6
01c12 6690                           nop        
01c14 c5f877                         vzeroupper 
01c17 e8c412b4ff                     call       0x7f138f9c44e0
01c1c 0f1f8400141d002e               nop        dword ptr [rax + rax + 0x2e001d14]
01c24 eb0a                           jmp        0x7f138fe83230
01c26 eb08                           jmp        0x7f138fe83230
01c28 eb06                           jmp        0x7f138fe83230
01c2a eb04                           jmp        0x7f138fe83230
01c2c eb02                           jmp        0x7f138fe83230
01c2e eb00                           jmp        0x7f138fe83230
01c30 488bf0                         mov        rsi, rax
01c33 e928eaffff                     jmp        0x7f138fe81c60
01c38 49baaf21e88f137f0000           movabs     r10, 0x7f138fe821af
01c42 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c49 e9929ca7ff                     jmp        0x7f138f8fcee0
01c4e e84d68a6ff                     call       0x7f138f8e9aa0
01c53 e9e6e3ffff                     jmp        0x7f138fe8163e
