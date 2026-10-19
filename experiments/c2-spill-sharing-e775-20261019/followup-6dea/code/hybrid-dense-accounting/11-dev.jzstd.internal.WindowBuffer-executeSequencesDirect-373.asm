00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c05aa9ff                   jne        0x7f6c9f8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f856e1f0000                   jne        0x7f6c9fe66e2c
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 448bc7                         mov        r8d, edi
0004c 488bee                         mov        rbp, rsi
0004f 8b7638                         mov        esi, dword ptr [rsi + 0x38]
00052 448b5d04                       mov        r11d, dword ptr [rbp + 4]
00056 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0005b 418bcb                         mov        ecx, r11d
0005e 2bce                           sub        ecx, esi
00060 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
00068 443bd9                         cmp        r11d, ecx
0006b 0f8fdb160000                   jg         0x7f6c9fe665cc
00071 488b4508                       mov        rax, qword ptr [rbp + 8]
00075 488b4d20                       mov        rcx, qword ptr [rbp + 0x20]
00079 4c638c24e0000000               movsxd     r9, dword ptr [rsp + 0xe0]
00081 4c63de                         movsxd     r11, esi
00084 4c03d8                         add        r11, rax
00087 492bcb                         sub        rcx, r11
0008a 4c3bc9                         cmp        r9, rcx
0008d 0f8fb9160000                   jg         0x7f6c9fe665cc
00093 4c8b7510                       mov        r14, qword ptr [rbp + 0x10]
00097 4c8b6d28                       mov        r13, qword ptr [rbp + 0x28]
0009b 4d85ed                         test       r13, r13
0009e 0f84c8100000                   je         0x7f6c9fe65fec
000a4 33db                           xor        ebx, ebx
000a6 4c8bda                         mov        r11, rdx
000a9 8b5204                         mov        edx, dword ptr [rdx + 4]
000ac 8b7d40                         mov        edi, dword ptr [rbp + 0x40]
000af 4585c0                         test       r8d, r8d
000b2 0f8e20150000                   jle        0x7f6c9fe66458
000b8 89742414                       mov        dword ptr [rsp + 0x14], esi
000bc 4c2be8                         sub        r13, rax
000bf 448d4ae0                       lea        r9d, [rdx - 0x20]
000c3 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
000c7 83c1e0                         add        ecx, -0x20
000ca 418b7204                       mov        esi, dword ptr [r10 + 4]
000ce 85f6                           test       esi, esi
000d0 0f86aa160000                   jbe        0x7f6c9fe66600
000d6 894c2420                       mov        dword ptr [rsp + 0x20], ecx
000da 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000df 897c2410                       mov        dword ptr [rsp + 0x10], edi
000e3 89542438                       mov        dword ptr [rsp + 0x38], edx
000e7 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ec 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f1 4889442418                     mov        qword ptr [rsp + 0x18], rax
000f6 4c89542408                     mov        qword ptr [rsp + 8], r10
000fb 4489442404                     mov        dword ptr [rsp + 4], r8d
00100 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
00108 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
0010d 4c63d6                         movsxd     r10, esi
00110 4d63d8                         movsxd     r11, r8d
00113 49ffcb                         dec        r11
00116 4d3bda                         cmp        r11, r10
00119 0f8345160000                   jae        0x7f6c9fe665e4
0011f 85db                           test       ebx, ebx
00121 0f844c160000                   je         0x7f6c9fe665f3
00127 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0012f 458b5304                       mov        r10d, dword ptr [r11 + 4]
00133 4585d2                         test       r10d, r10d
00136 0f8691160000                   jbe        0x7f6c9fe6664d
0013c 4183fa01                       cmp        r10d, 1
00140 0f8687160000                   jbe        0x7f6c9fe6664d
00146 4183fa02                       cmp        r10d, 2
0014a 0f867d160000                   jbe        0x7f6c9fe6664d
00150 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00158 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0015c 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00161 448b5704                       mov        r10d, dword ptr [rdi + 4]
00165 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0016d 448d52f1                       lea        r10d, [rdx - 0xf]
00171 4585d2                         test       r10d, r10d
00174 0f8caa160000                   jl         0x7f6c9fe666a4
0017a 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00182 4183c3f1                       add        r11d, -0xf
00186 4585db                         test       r11d, r11d
00189 0f8c9c160000                   jl         0x7f6c9fe666ab
0018f 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00197 4183c2f9                       add        r10d, -7
0019b 4585d2                         test       r10d, r10d
0019e 0f8c8e160000                   jl         0x7f6c9fe666b2
001a4 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
001ac 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
001b1 4c8bd7                         mov        r10, rdi
001b4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001b9 4d63d3                         movsxd     r10, r11d
001bc 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001c4 458d53f1                       lea        r10d, [r11 - 0xf]
001c8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
001cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
001d5 4983c2f1                       add        r10, -0xf
001d9 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001e1 448bd2                         mov        r10d, edx
001e4 458d5af1                       lea        r11d, [r10 - 0xf]
001e8 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001ed 4d63d2                         movsxd     r10, r10d
001f0 4983c2f1                       add        r10, -0xf
001f4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
001fc 4533d2                         xor        r10d, r10d
001ff 33db                           xor        ebx, ebx
00201 e9bf010000                     jmp        0x7f6c9fe65245
00206 4533c0                         xor        r8d, r8d
00209 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0020e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00213 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00217 448bda                         mov        r11d, edx
0021a 4183fb03                       cmp        r11d, 3
0021e 0f8e5d030000                   jle        0x7f6c9fe65401
00224 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00229 45894b10                       mov        dword ptr [r11 + 0x10], r9d
0022d 458b4308                       mov        r8d, dword ptr [r11 + 8]
00231 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00235 448d5afd                       lea        r11d, [rdx - 3]
00239 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0023e 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00243 45895808                       mov        dword ptr [r8 + 8], r11d
00247 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0024f 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00254 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00259 4c03542418                     add        r10, qword ptr [rsp + 0x18]
0025e 4c63442428                     movsxd     r8, dword ptr [rsp + 0x28]
00263 4d8bc8                         mov        r9, r8
00266 4d03d0                         add        r10, r8
00269 4d3bda                         cmp        r11, r10
0026c 0f8f2e120000                   jg         0x7f6c9fe66320
00272 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00277 4585db                         test       r11d, r11d
0027a 0f8e7c110000                   jle        0x7f6c9fe6627c
00280 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
00285 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
0028a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0028f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00294 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00299 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0029e 4503d5                         add        r10d, r13d
002a1 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
002a9 498d7c1b08                     lea        rdi, [r11 + rbx + 8]
002ae 448bdb                         mov        r11d, ebx
002b1 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
002b6 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
002be 48636c242c                     movsxd     rbp, dword ptr [rsp + 0x2c]
002c3 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
002c8 0f8f1d0b0000                   jg         0x7f6c9fe65c6b
002ce 443b5c2424                     cmp        r11d, dword ptr [rsp + 0x24]
002d3 0f8f1b120000                   jg         0x7f6c9fe66374
002d9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002de 4183fa10                       cmp        r10d, 0x10
002e2 0f8f5c010000                   jg         0x7f6c9fe652c4
002e8 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002ec 0f8366100000                   jae        0x7f6c9fe661d8
002f2 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002fa c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
00301 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00306 0f8390100000                   jae        0x7f6c9fe6621c
0030c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00311 4403d3                         add        r10d, ebx
00314 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
0031c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00321 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00328 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0032d 4503d8                         add        r11d, r8d
00330 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00335 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0033a 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
0033f 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00347 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0034c 4183fa10                       cmp        r10d, 0x10
00350 0f8f16120000                   jg         0x7f6c9fe663ec
00356 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0035b 4183fb10                       cmp        r11d, 0x10
0035f 0f8c1b030000                   jl         0x7f6c9fe65500
00365 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0036d 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
00372 0f83370f0000                   jae        0x7f6c9fe6612f
00378 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0037d c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00384 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00389 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
0038e 0f83680f0000                   jae        0x7f6c9fe6617c
00394 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0039b 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
003a0 4503c2                         add        r8d, r10d
003a3 4489442414                     mov        dword ptr [rsp + 0x14], r8d
003a8 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
003b0 41ffc2                         inc        r10d
003b3 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003b8 0f8d820c0000                   jge        0x7f6c9fe65ec0
003be 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
003c5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003ca 4f8b4cd308                     mov        r9, qword ptr [r11 + r10*8 + 8]
003cf 4d8bd9                         mov        r11, r9
003d2 49c1eb12                       shr        r11, 0x12
003d6 458bdb                         mov        r11d, r11d
003d9 4181e3ffff0300                 and        r11d, 0x3ffff
003e0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003e5 458bc1                         mov        r8d, r9d
003e8 49c1f924                       sar        r9, 0x24
003ec 4181e0ffff0100                 and        r8d, 0x1ffff
003f3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
003f8 458bd9                         mov        r11d, r9d
003fb 418bd3                         mov        edx, r11d
003fe 4585db                         test       r11d, r11d
00401 0f8c15100000                   jl         0x7f6c9fe6629c
00407 458bd8                         mov        r11d, r8d
0040a 4585c0                         test       r8d, r8d
0040d 0f84f3fdffff                   je         0x7f6c9fe65086
00413 448b0424                       mov        r8d, dword ptr [rsp]
00417 442bc3                         sub        r8d, ebx
0041a 453bd8                         cmp        r11d, r8d
0041d 0f8eebfdffff                   jle        0x7f6c9fe6508e
00423 be45ffffff                     mov        esi, 0xffffff45
00428 418beb                         mov        ebp, r11d
0042b 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
00433 90                             nop        
00434 c5f877                         vzeroupper 
00437 e8a4e3b5ff                     call       0x7f6c9f9c3660
0043c 0f1f840034050000               nop        dword ptr [rax + rax + 0x534]
00444 4183fa30                       cmp        r10d, 0x30
00448 0f8f8d070000                   jg         0x7f6c9fe65a5b
0044e 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00452 0f839d110000                   jae        0x7f6c9fe66475
00458 4c63cb                         movsxd     r9, ebx
0045b 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00463 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
0046a 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0046f 0f83d3110000                   jae        0x7f6c9fe664c8
00475 458d5810                       lea        r11d, [r8 + 0x10]
00479 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00481 4963c8                         movsxd     rcx, r8d
00484 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00489 c4c17a7f440a08                 vmovdqu    xmmword ptr [r10 + rcx + 8], xmm0
00490 453bdd                         cmp        r11d, r13d
00493 0f8dce000000                   jge        0x7f6c9fe653e7
00499 4c2bc9                         sub        r9, rcx
0049c 4d63db                         movsxd     r11, r11d
0049f 4f8d140b                       lea        r10, [r11 + r9]
004a3 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004ab 0f830b120000                   jae        0x7f6c9fe6653c
004b1 4d63d5                         movsxd     r10, r13d
004b4 4d2bd3                         sub        r10, r11
004b7 4983c20f                       add        r10, 0xf
004bb 4983e2f0                       and        r10, 0xfffffffffffffff0
004bf 458bda                         mov        r11d, r10d
004c2 478d540310                     lea        r10d, [r11 + r8 + 0x10]
004c7 4d63da                         movsxd     r11, r10d
004ca 4f8d540bf0                     lea        r10, [r11 + r9 - 0x10]
004cf 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004d7 0f83df110000                   jae        0x7f6c9fe6653c
004dd 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
004e5 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
004ea 0f83cc110000                   jae        0x7f6c9fe6653c
004f0 4983c3f0                       add        r11, -0x10
004f4 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
004fc 0f83ba110000                   jae        0x7f6c9fe6653c
00502 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00509 0f8ff5110000                   jg         0x7f6c9fe66584
0050f 448bd3                         mov        r10d, ebx
00512 452bd0                         sub        r10d, r8d
00515 6666660f1f840000000000         nop        word ptr [rax + rax]
00520 458bc2                         mov        r8d, r10d
00523 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0052b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00533 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0053a 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00542 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00547 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0054e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00556 4183c010                       add        r8d, 0x10
0055a 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00562 453bc5                         cmp        r8d, r13d
00565 7cb9                           jl         0x7f6c9fe653a0
00567 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0056c 4403d3                         add        r10d, ebx
0056f 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00577 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0057c e9b4fdffff                     jmp        0x7f6c9fe651b5
00581 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00586 4585c0                         test       r8d, r8d
00589 7406                           je         0x7f6c9fe65411
0058b 41ffcb                         dec        r11d
0058e 418bd3                         mov        edx, r11d
00591 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00596 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0059a 85d2                           test       edx, edx
0059c 0f84a7070000                   je         0x7f6c9fe65bc9
005a2 83fa03                         cmp        edx, 3
005a5 0f84520b0000                   je         0x7f6c9fe65f7d
005ab 83fa02                         cmp        edx, 2
005ae 0f878a000000                   ja         0x7f6c9fe654be
005b4 3b9424e8000000                 cmp        edx, dword ptr [rsp + 0xe8]
005bb 0f8378120000                   jae        0x7f6c9fe666b9
005c1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005c6 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
005cb 85d2                           test       edx, edx
005cd 7e54                           jle        0x7f6c9fe654a3
005cf 448d4aff                       lea        r9d, [rdx - 1]
005d3 443b8c24e8000000               cmp        r9d, dword ptr [rsp + 0xe8]
005db 0f834b140000                   jae        0x7f6c9fe668ac
005e1 4863ca                         movsxd     rcx, edx
005e4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005e9 458bc0                         mov        r8d, r8d
005ec 4183c0cc                       add        r8d, -0x34
005f0 41c1e802                       shr        r8d, 2
005f4 458d4c10ff                     lea        r9d, [r8 + rdx - 1]
005f9 41b804000000                   mov        r8d, 4
005ff c442b8f5c1                     bzhi       r8, r9, r8
00604 492bc8                         sub        rcx, r8
00607 48ffc9                         dec        rcx
0060a 4533c0                         xor        r8d, r8d
0060d 4885c9                         test       rcx, rcx
00610 490f4cc8                       cmovl      rcx, r8
00614 8bc9                           mov        ecx, ecx
00616 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0061e e928060000                     jmp        0x7f6c9fe65acb
00623 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0062b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00630 45895a08                       mov        dword ptr [r10 + 8], r11d
00634 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00639 e911fcffff                     jmp        0x7f6c9fe650cf
0063e 48be90af72e200000000           movabs     rsi, 0xe272af90
00648 8beb                           mov        ebp, ebx
0064a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00652 6690                           nop        
00654 c5f877                         vzeroupper 
00657 e88463a9ff                     call       0x7f6c9f8fb860
0065c 0f1f840054070001               nop        dword ptr [rax + rax + 0x1000754]
00664 4885c0                         test       rax, rax
00667 0f8453120000                   je         0x7f6c9fe66740
0066d 488bf0                         mov        rsi, rax
00670 c5f877                         vzeroupper 
00673 4881c4d0000000                 add        rsp, 0xd0
0067a 5d                             pop        rbp
0067b e96060b6ff                     jmp        0x7f6c9f9cb560
00680 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
00685 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0068a 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0068f 0f8d77020000                   jge        0x7f6c9fe6578c
00695 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0069a 4183c308                       add        r11d, 8
0069e 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
006a6 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
006ab 4183fa08                       cmp        r10d, 8
006af 0f8d84010000                   jge        0x7f6c9fe656b9
006b5 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006bd 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
006c5 0f8339150000                   jae        0x7f6c9fe66a84
006cb 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006d0 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
006d6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
006db 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
006e3 0f8393150000                   jae        0x7f6c9fe66afc
006e9 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
006ee 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
006f6 4183c203                       add        r10d, 3
006fa 41ffc3                         inc        r11d
006fd 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00705 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
0070d 0f83a1150000                   jae        0x7f6c9fe66b34
00713 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00718 4183c203                       add        r10d, 3
0071c 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
00724 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00729 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
0072f 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
00737 0f83c3150000                   jae        0x7f6c9fe66b80
0073d 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
00742 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
00747 470fbe4c190a                   movsx      r9d, byte ptr [r9 + r11 + 0xa]
0074d 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00752 47884c100a                     mov        byte ptr [r8 + r10 + 0xa], r9b
00757 470fbe5c180b                   movsx      r11d, byte ptr [r8 + r11 + 0xb]
0075d 47885c100b                     mov        byte ptr [r8 + r10 + 0xb], r11b
00762 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00767 4183fb08                       cmp        r11d, 8
0076b 0f83d3150000                   jae        0x7f6c9fe66bc4
00771 49bad0e870e200000000           movabs     r10, 0xe270e8d0
0077b 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00783 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00788 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0078d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00792 4183fa04                       cmp        r10d, 4
00796 7e3c                           jle        0x7f6c9fe65654
00798 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
0079c 83c504                         add        ebp, 4
0079f 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007a4 418bd1                         mov        edx, r9d
007a7 90                             nop        
007a8 c5f877                         vzeroupper 
007ab e83062a9ff                     call       0x7f6c9f8fb860
007b0 0f1f8400a8080002               nop        dword ptr [rax + rax + 0x20008a8]
007b8 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007bd 8bd5                           mov        edx, ebp
007bf 8bc8                           mov        ecx, eax
007c1 666690                         nop        
007c4 c5f877                         vzeroupper 
007c7 e81462a9ff                     call       0x7f6c9f8fb860
007cc 0f1f8400c4080003               nop        dword ptr [rax + rax + 0x30008c4]
007d4 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007d9 4183fa08                       cmp        r10d, 8
007dd 0f8ec5fbffff                   jle        0x7f6c9fe65228
007e3 49baf8e870e200000000           movabs     r10, 0xe270e8f8
007ed 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007f1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
007f6 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007fb 83c208                         add        edx, 8
007fe 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00803 90                             nop        
00804 c5f877                         vzeroupper 
00807 e8d461a9ff                     call       0x7f6c9f8fb860
0080c 0f1f840004090004               nop        dword ptr [rax + rax + 0x4000904]
00814 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00819 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00820 488bc8                         mov        rcx, rax
00823 90                             nop        
00824 c5f877                         vzeroupper 
00827 e8b461a9ff                     call       0x7f6c9f8fb860
0082c 0f1f840024090005               nop        dword ptr [rax + rax + 0x5000924]
00834 e96ffbffff                     jmp        0x7f6c9fe65228
00839 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0083e 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00845 666690                         nop        
00848 c5f877                         vzeroupper 
0084b e89061a9ff                     call       0x7f6c9f8fb860
00850 0f1f840048090006               nop        dword ptr [rax + rax + 0x6000948]
00858 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0085d 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00861 488bc8                         mov        rcx, rax
00864 c5f877                         vzeroupper 
00867 e87461a9ff                     call       0x7f6c9f8fb860
0086c 0f1f840064090007               nop        dword ptr [rax + rax + 0x7000964]
00874 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0087c 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00881 0f8d21fbffff                   jge        0x7f6c9fe65228
00887 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0088c 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00893 0f8ecf040000                   jle        0x7f6c9fe65be8
00899 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
008a1 4183c208                       add        r10d, 8
008a5 be66ffffff                     mov        esi, 0xffffff66
008aa 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
008b2 448b1c24                       mov        r11d, dword ptr [rsp]
008b6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
008be 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
008c3 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
008cb 448b442404                     mov        r8d, dword ptr [rsp + 4]
008d0 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
008d8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
008dd 44895c2408                     mov        dword ptr [rsp + 8], r11d
008e2 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
008e7 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
008ec 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
008f1 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008f6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
008fb 90                             nop        
008fc c5f877                         vzeroupper 
008ff e8dcdeb5ff                     call       0x7f6c9f9c3660
00904 0f1f8400fc090008               nop        dword ptr [rax + rax + 0x80009fc]
0090c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00911 4183fb30                       cmp        r11d, 0x30
00915 0f8ffe010000                   jg         0x7f6c9fe65999
0091b 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
0091f 83c5f9                         add        ebp, -7
00922 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00926 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0092e 443bd5                         cmp        r10d, ebp
00931 0f83e50f0000                   jae        0x7f6c9fe6679c
00937 418bea                         mov        ebp, r10d
0093a 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
00941 4863ed                         movsxd     rbp, ebp
00944 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
0094c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00951 498b6c2b08                     mov        rbp, qword ptr [r11 + rbp + 8]
00956 4889ac24a8000000               mov        qword ptr [rsp + 0xa8], rbp
0095e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00963 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00968 0f8312100000                   jae        0x7f6c9fe66800
0096e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00973 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0097b 4963ea                         movsxd     rbp, r10d
0097e 4889ac24b8000000               mov        qword ptr [rsp + 0xb8], rbp
00986 488d4d08                       lea        rcx, [rbp + 8]
0098a 48be28c122e200000000           movabs     rsi, 0xe222c128
00994 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00999 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
009a1 4533c9                         xor        r9d, r9d
009a4 c5f877                         vzeroupper 
009a7 e83456a9ff                     call       0x7f6c9f8fae60
009ac 0f1f8400a40a0009               nop        dword ptr [rax + rax + 0x9000aa4]
009b4 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
009bc 4183c308                       add        r11d, 8
009c0 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
009c8 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
009cd 0f8d32010000                   jge        0x7f6c9fe65985
009d3 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
009db 482bac24b8000000               sub        rbp, qword ptr [rsp + 0xb8]
009e3 4d63c3                         movsxd     r8, r11d
009e6 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
009ee 4983c3f9                       add        r11, -7
009f2 4d8d1428                       lea        r10, [r8 + rbp]
009f6 4d3bd3                         cmp        r10, r11
009f9 0f83b5100000                   jae        0x7f6c9fe66934
009ff 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00a04 4d2bd0                         sub        r10, r8
00a07 4983c207                       add        r10, 7
00a0b 4983e2f8                       and        r10, 0xfffffffffffffff8
00a0f 458bd2                         mov        r10d, r10d
00a12 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00a1a 478d540208                     lea        r10d, [r10 + r8 + 8]
00a1f 4d63d2                         movsxd     r10, r10d
00a22 4d8d442af8                     lea        r8, [r10 + rbp - 8]
00a27 4d3bc3                         cmp        r8, r11
00a2a 0f8384100000                   jae        0x7f6c9fe66934
00a30 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00a38 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00a3d 0f8371100000                   jae        0x7f6c9fe66934
00a43 4983c2f8                       add        r10, -8
00a47 4d3bd3                         cmp        r10, r11
00a4a 0f8364100000                   jae        0x7f6c9fe66934
00a50 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00a55 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00a5c 0f8fda100000                   jg         0x7f6c9fe669bc
00a62 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00a69 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00a70 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00a74 660f1f440000                   nop        word ptr [rax + rax]
00a7a 660f1f440000                   nop        word ptr [rax + rax]
00a80 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a88 4963ca                         movsxd     rcx, r10d
00a8b 4883c108                       add        rcx, 8
00a8f 8b6c2428                       mov        ebp, dword ptr [rsp + 0x28]
00a93 03ac24a8000000                 add        ebp, dword ptr [rsp + 0xa8]
00a9a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a9f 4d8b442b08                     mov        r8, qword ptr [r11 + rbp + 8]
00aa4 48be28c122e200000000           movabs     rsi, 0xe222c128
00aae 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00ab3 4533c9                         xor        r9d, r9d
00ab6 6690                           nop        
00ab8 c5f877                         vzeroupper 
00abb e82055a9ff                     call       0x7f6c9f8fae60
00ac0 0f1f8400b80b000a               nop        dword ptr [rax + rax + 0xa000bb8]
00ac8 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00ad0 4183c308                       add        r11d, 8
00ad4 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00adc 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00ae1 7c9d                           jl         0x7f6c9fe65900
00ae3 eb20                           jmp        0x7f6c9fe65985
00ae5 4d63d3                         movsxd     r10, r11d
00ae8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aef c442a8f5db                     bzhi       r11, r11, r10
00af4 c4c1fb92fb                     kmovq      k7, r11
00af9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aff 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b05 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b0a 440354242c                     add        r10d, dword ptr [rsp + 0x2c]
00b0f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00b14 e98ff8ffff                     jmp        0x7f6c9fe65228
00b19 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00b21 4585db                         test       r11d, r11d
00b24 0f8ca20e0000                   jl         0x7f6c9fe6684c
00b2a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b2f 4585d2                         test       r10d, r10d
00b32 0f8c940e0000                   jl         0x7f6c9fe6684c
00b38 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b3d 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
00b45 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00b4d 453bc3                         cmp        r8d, r11d
00b50 0f82760e0000                   jb         0x7f6c9fe6684c
00b56 458bd0                         mov        r10d, r8d
00b59 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00b5e 0f82680e0000                   jb         0x7f6c9fe6684c
00b64 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b69 4585db                         test       r11d, r11d
00b6c 7497                           je         0x7f6c9fe65985
00b6e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b73 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b78 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00b7d 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b85 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00b8a 4883fd20                       cmp        rbp, 0x20
00b8e 0f8651ffffff                   jbe        0x7f6c9fe65965
00b94 488bd5                         mov        rdx, rbp
00b97 c5f877                         vzeroupper 
00b9a 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00ba4 41ffd2                         call       r10
00ba7 0f1f840000000000               nop        dword ptr [rax + rax]
00baf e951ffffff                     jmp        0x7f6c9fe65985
00bb4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bb9 4d63d2                         movsxd     r10, r10d
00bbc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bc3 c442a8f5db                     bzhi       r11, r11, r10
00bc8 c4c1fb92fb                     kmovq      k7, r11
00bcd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bd3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bd9 eb60                           jmp        0x7f6c9fe65abb
00bdb 85db                           test       ebx, ebx
00bdd 0f8cf50c0000                   jl         0x7f6c9fe66758
00be3 4585c0                         test       r8d, r8d
00be6 0f8cec0c0000                   jl         0x7f6c9fe66758
00bec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00bf1 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00bf9 0f82d90c0000                   jb         0x7f6c9fe66758
00bff 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00c07 453bdd                         cmp        r11d, r13d
00c0a 0f82c80c0000                   jb         0x7f6c9fe66758
00c10 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c15 4585db                         test       r11d, r11d
00c18 7421                           je         0x7f6c9fe65abb
00c1a 4983f920                       cmp        r9, 0x20
00c1e 7694                           jbe        0x7f6c9fe65a34
00c20 498bd1                         mov        rdx, r9
00c23 c5f877                         vzeroupper 
00c26 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00c30 41ffd2                         call       r10
00c33 0f1f840000000000               nop        dword ptr [rax + rax]
00c3b 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00c40 e9f0f6ffff                     jmp        0x7f6c9fe651b5
00c45 666690                         nop        
00c48 418bd2                         mov        edx, r10d
00c4b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c50 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00c55 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00c5a 4589449108                     mov        dword ptr [r9 + rdx*4 + 8], r8d
00c5f 448d52ff                       lea        r10d, [rdx - 1]
00c63 443bd1                         cmp        r10d, ecx
00c66 7fe0                           jg         0x7f6c9fe65ac8
00c68 4183fa3f                       cmp        r10d, 0x3f
00c6c 0f8e3a0e0000                   jle        0x7f6c9fe6692c
00c72 448bd2                         mov        r10d, edx
00c75 41ffca                         dec        r10d
00c78 eb09                           jmp        0x7f6c9fe65b03
00c7a 660f1f440000                   nop        word ptr [rax + rax]
00c80 458bd0                         mov        r10d, r8d
00c83 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c88 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00c93 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00c9e 62917e486f849088ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x78]
00ca9 62917e487f84908cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x74], zmm0
00cb4 62917e486f849048ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xb8]
00cbf 62917e487f84904cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xb4], zmm0
00cca 62917e486f849008ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xf8]
00cd5 62917e487f84900cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xf4], zmm0
00ce0 458d42c0                       lea        r8d, [r10 - 0x40]
00ce4 4183f83f                       cmp        r8d, 0x3f
00ce8 7f96                           jg         0x7f6c9fe65b00
00cea 4183f80f                       cmp        r8d, 0xf
00cee 7e2d                           jle        0x7f6c9fe65b9d
00cf0 458bc2                         mov        r8d, r10d
00cf3 4183c0c0                       add        r8d, -0x40
00cf7 90                             nop        
00cf8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00cfd 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00d08 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00d13 4183c0f0                       add        r8d, -0x10
00d17 4183f80f                       cmp        r8d, 0xf
00d1b 7fdb                           jg         0x7f6c9fe65b78
00d1d 4585c0                         test       r8d, r8d
00d20 0f8e05f9ffff                   jle        0x7f6c9fe654ab
00d26 6690                           nop        
00d28 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d2d 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00d32 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00d37 4789548108                     mov        dword ptr [r9 + r8*4 + 8], r10d
00d3c 41ffc8                         dec        r8d
00d3f 4585c0                         test       r8d, r8d
00d42 7fe4                           jg         0x7f6c9fe65ba8
00d44 e9e2f8ffff                     jmp        0x7f6c9fe654ab
00d49 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00d51 e9def8ffff                     jmp        0x7f6c9fe654b4
00d56 66660f1f840000000000           nop        word ptr [rax + rax]
00d60 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00d68 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00d6f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00d73 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d78 8bd5                           mov        edx, ebp
00d7a 6690                           nop        
00d7c c5f877                         vzeroupper 
00d7f e85c5ca9ff                     call       0x7f6c9f8fb860
00d84 0f1f84007c0e000b               nop        dword ptr [rax + rax + 0xb000e7c]
00d8c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d91 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00d98 488bc8                         mov        rcx, rax
00d9b 90                             nop        
00d9c c5f877                         vzeroupper 
00d9f e83c5ca9ff                     call       0x7f6c9f8fb860
00da4 0f1f84009c0e000c               nop        dword ptr [rax + rax + 0xc000e9c]
00dac 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00db4 4183c208                       add        r10d, 8
00db8 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00dbd 7ca1                           jl         0x7f6c9fe65be0
00dbf e9e4f5ffff                     jmp        0x7f6c9fe65228
00dc4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dc9 4d63d3                         movsxd     r10, r11d
00dcc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dd3 c442a8f5db                     bzhi       r11, r11, r10
00dd8 c4c1fb92fb                     kmovq      k7, r11
00ddd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00de3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de9 eb6e                           jmp        0x7f6c9fe65cd9
00deb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00df0 4585db                         test       r11d, r11d
00df3 0f84ac040000                   je         0x7f6c9fe66125
00df9 85db                           test       ebx, ebx
00dfb 0f8c1f100000                   jl         0x7f6c9fe66ca0
00e01 4585c0                         test       r8d, r8d
00e04 0f8c16100000                   jl         0x7f6c9fe66ca0
00e0a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e0f 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00e17 0f8203100000                   jb         0x7f6c9fe66ca0
00e1d 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00e25 453bdd                         cmp        r11d, r13d
00e28 0f82f20f0000                   jb         0x7f6c9fe66ca0
00e2e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e33 4585d2                         test       r10d, r10d
00e36 7421                           je         0x7f6c9fe65cd9
00e38 4983f920                       cmp        r9, 0x20
00e3c 7686                           jbe        0x7f6c9fe65c44
00e3e 498bd1                         mov        rdx, r9
00e41 c5f877                         vzeroupper 
00e44 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00e4e 41ffd2                         call       r10
00e51 0f1f840000000000               nop        dword ptr [rax + rax]
00e59 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e5e 4585db                         test       r11d, r11d
00e61 0f8eaa010000                   jle        0x7f6c9fe65e91
00e67 458bd5                         mov        r10d, r13d
00e6a 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00e6f 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00e77 458bdd                         mov        r11d, r13d
00e7a 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00e7f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00e84 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e89 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00e8e 4b8d742b08                     lea        rsi, [r11 + r13 + 8]
00e93 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00e98 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00e9d 0f8dd7000000                   jge        0x7f6c9fe65dfa
00ea3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00ea8 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00ead 458bd3                         mov        r10d, r11d
00eb0 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00eb5 450f4fd0                       cmovg      r10d, r8d
00eb9 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00ebe 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00ec6 4585d2                         test       r10d, r10d
00ec9 0f8c990f0000                   jl         0x7f6c9fe66ce8
00ecf 4585ed                         test       r13d, r13d
00ed2 0f8c900f0000                   jl         0x7f6c9fe66ce8
00ed8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00edd 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
00ee5 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00eed 453bc2                         cmp        r8d, r10d
00ef0 0f82720f0000                   jb         0x7f6c9fe66ce8
00ef6 458bd5                         mov        r10d, r13d
00ef9 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00efe 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00f06 453bc2                         cmp        r8d, r10d
00f09 0f82590f0000                   jb         0x7f6c9fe66ce8
00f0f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f14 4585d2                         test       r10d, r10d
00f17 0f8c4b0f0000                   jl         0x7f6c9fe66ce8
00f1d 4585d2                         test       r10d, r10d
00f20 7429                           je         0x7f6c9fe65dcb
00f22 4963d2                         movsxd     rdx, r10d
00f25 4883fa20                       cmp        rdx, 0x20
00f29 7735                           ja         0x7f6c9fe65de0
00f2b 4d63d2                         movsxd     r10, r10d
00f2e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f35 c442a8f5db                     bzhi       r11, r11, r10
00f3a c4c1fb92fb                     kmovq      k7, r11
00f3f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f45 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f4b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f50 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00f55 0f8d4df4ffff                   jge        0x7f6c9fe65228
00f5b e978020000                     jmp        0x7f6c9fe66058
00f60 c5f877                         vzeroupper 
00f63 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00f6d 41ffd2                         call       r10
00f70 0f1f840000000000               nop        dword ptr [rax + rax]
00f78 ebd1                           jmp        0x7f6c9fe65dcb
00f7a 4585d2                         test       r10d, r10d
00f7d 0f8c590f0000                   jl         0x7f6c9fe66d5c
00f83 4585ed                         test       r13d, r13d
00f86 0f8c500f0000                   jl         0x7f6c9fe66d5c
00f8c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f91 4503da                         add        r11d, r10d
00f94 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00f9c 453bd3                         cmp        r10d, r11d
00f9f 0f82370f0000                   jb         0x7f6c9fe66d5c
00fa5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00faa 453bd3                         cmp        r10d, r11d
00fad 0f82290f0000                   jb         0x7f6c9fe66d5c
00fb3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00fb8 4585d2                         test       r10d, r10d
00fbb 0f84e7f3ffff                   je         0x7f6c9fe65228
00fc1 4883fd20                       cmp        rbp, 0x20
00fc5 772a                           ja         0x7f6c9fe65e71
00fc7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fcc 4d63d3                         movsxd     r10, r11d
00fcf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fd6 c442a8f5db                     bzhi       r11, r11, r10
00fdb c4c1fb92fb                     kmovq      k7, r11
00fe0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00fe6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00fec e9b7f3ffff                     jmp        0x7f6c9fe65228
00ff1 488bd5                         mov        rdx, rbp
00ff4 c5f877                         vzeroupper 
00ff7 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
01001 41ffd2                         call       r10
01004 0f1f840000000000               nop        dword ptr [rax + rax]
0100c e997f3ffff                     jmp        0x7f6c9fe65228
01011 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01016 e98df3ffff                     jmp        0x7f6c9fe65228
0101b 4d63d2                         movsxd     r10, r10d
0101e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01025 c442a8f5db                     bzhi       r11, r11, r10
0102a c4c1fb92fb                     kmovq      k7, r11
0102f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01035 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0103b e9a4000000                     jmp        0x7f6c9fe65f64
01040 448b1424                       mov        r10d, dword ptr [rsp]
01044 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
0104c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01051 4585db                         test       r11d, r11d
01054 0f844a0d0000                   je         0x7f6c9fe66c24
0105a 4d8bc3                         mov        r8, r11
0105d 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
01065 4585c9                         test       r9d, r9d
01068 0f8c6e0d0000                   jl         0x7f6c9fe66c5c
0106e 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01073 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0107b 8b542438                       mov        edx, dword ptr [rsp + 0x38]
0107f 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
01083 85c9                           test       ecx, ecx
01085 0f8c620d0000                   jl         0x7f6c9fe66c6d
0108b 3b1424                         cmp        edx, dword ptr [rsp]
0108e 0f82590d0000                   jb         0x7f6c9fe66c6d
01094 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
01098 4103da                         add        ebx, r10d
0109b 418b7804                       mov        edi, dword ptr [r8 + 4]
0109f 3bfb                           cmp        edi, ebx
010a1 0f82460d0000                   jb         0x7f6c9fe66c6d
010a7 4585d2                         test       r10d, r10d
010aa 0f8c3d0d0000                   jl         0x7f6c9fe66c6d
010b0 4585d2                         test       r10d, r10d
010b3 742f                           je         0x7f6c9fe65f64
010b5 498d740808                     lea        rsi, [r8 + rcx + 8]
010ba 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
010bf 4963d2                         movsxd     rdx, r10d
010c2 4883fa20                       cmp        rdx, 0x20
010c6 0f864fffffff                   jbe        0x7f6c9fe65e9b
010cc c5f877                         vzeroupper 
010cf 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
010d9 41ffd2                         call       r10
010dc 0f1f840000000000               nop        dword ptr [rax + rax]
010e4 895d38                         mov        dword ptr [rbp + 0x38], ebx
010e7 c5f877                         vzeroupper 
010ea 4881c4d0000000                 add        rsp, 0xd0
010f1 5d                             pop        rbp
010f2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
010f6 0f879a0e0000                   ja         0x7f6c9fe66e16
010fc c3                             ret        
010fd 41ffcb                         dec        r11d
01100 4585db                         test       r11d, r11d
01103 7e22                           jle        0x7f6c9fe65fa7
01105 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0110a 45894810                       mov        dword ptr [r8 + 0x10], r9d
0110e 458b4808                       mov        r9d, dword ptr [r8 + 8]
01112 4589480c                       mov        dword ptr [r8 + 0xc], r9d
01116 45895808                       mov        dword ptr [r8 + 8], r11d
0111a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01122 e90df5ffff                     jmp        0x7f6c9fe654b4
01127 48be60af72e200000000           movabs     rsi, 0xe272af60
01131 8beb                           mov        ebp, ebx
01133 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0113b 90                             nop        
0113c c5f877                         vzeroupper 
0113f e89c58a9ff                     call       0x7f6c9f8fb860
01144 0f1f84003c12000d               nop        dword ptr [rax + rax + 0xd00123c]
0114c 4885c0                         test       rax, rax
0114f 0f8518f5ffff                   jne        0x7f6c9fe654ed
01155 bef6ffffff                     mov        esi, 0xfffffff6
0115a 6690                           nop        
0115c c5f877                         vzeroupper 
0115f e87cd6b5ff                     call       0x7f6c9f9c3660
01164 0f1f84005c12000e               nop        dword ptr [rax + rax + 0xe00125c]
0116c 4d03d9                         add        r11, r9
0116f 4d3bde                         cmp        r11, r14
01172 7e08                           jle        0x7f6c9fe65ffc
01174 4533ed                         xor        r13d, r13d
01177 e928efffff                     jmp        0x7f6c9fe64f24
0117c 4533ed                         xor        r13d, r13d
0117f bb01000000                     mov        ebx, 1
01184 e91defffff                     jmp        0x7f6c9fe64f26
01189 448bd5                         mov        r10d, ebp
0118c 4d63d2                         movsxd     r10, r10d
0118f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01196 c442a8f5db                     bzhi       r11, r11, r10
0119b c4c1fb92fb                     kmovq      k7, r11
011a0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
011a6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
011ac 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
011b1 4403d5                         add        r10d, ebp
011b4 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
011b9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
011bd 418502                         test       dword ptr [r10], eax
011c0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
011c5 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
011ca 0f8dd8f1ffff                   jge        0x7f6c9fe65228
011d0 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
011d8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
011e0 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
011e5 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
011ed 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
011f1 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
011f5 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
011f9 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
011fe 410f4feb                       cmovg      ebp, r11d
01202 4585d2                         test       r10d, r10d
01205 0f8cb9090000                   jl         0x7f6c9fe66a44
0120b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01213 4585db                         test       r11d, r11d
01216 0f8ca8090000                   jl         0x7f6c9fe66a44
0121c 448bd5                         mov        r10d, ebp
0121f 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
01227 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
0122f 453bda                         cmp        r11d, r10d
01232 0f828c090000                   jb         0x7f6c9fe66a44
01238 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
01240 4403f5                         add        r14d, ebp
01243 453bde                         cmp        r11d, r14d
01246 0f8278090000                   jb         0x7f6c9fe66a44
0124c 85ed                           test       ebp, ebp
0124e 0f8c70090000                   jl         0x7f6c9fe66a44
01254 85ed                           test       ebp, ebp
01256 0f8450ffffff                   je         0x7f6c9fe6602c
0125c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01261 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
01269 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0126e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
01276 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0127b 4863d5                         movsxd     rdx, ebp
0127e 4883fa20                       cmp        rdx, 0x20
01282 0f8601ffffff                   jbe        0x7f6c9fe66009
01288 c5f877                         vzeroupper 
0128b 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
01295 41ffd2                         call       r10
01298 0f1f840000000000               nop        dword ptr [rax + rax]
012a0 e907ffffff                     jmp        0x7f6c9fe6602c
012a5 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
012aa e9aafbffff                     jmp        0x7f6c9fe65cd9
012af bee4ffffff                     mov        esi, 0xffffffe4
012b4 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
012bc 448b1424                       mov        r10d, dword ptr [rsp]
012c0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
012c8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012cd 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
012d5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
012da 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
012e2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012e7 4c891424                       mov        qword ptr [rsp], r10
012eb 90                             nop        
012ec c5f877                         vzeroupper 
012ef e8ecd4b5ff                     call       0x7f6c9f9c3660
012f4 0f1f8400ec130010               nop        dword ptr [rax + rax + 0x100013ec]
012fc bee4ffffff                     mov        esi, 0xffffffe4
01301 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01309 448b1424                       mov        r10d, dword ptr [rsp]
0130d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01315 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0131a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01322 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01327 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0132f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01334 4c891424                       mov        qword ptr [rsp], r10
01338 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
0133d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01342 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01348 c5f877                         vzeroupper 
0134b e890d4b5ff                     call       0x7f6c9f9c3660
01350 0f1f840048140011               nop        dword ptr [rax + rax + 0x11001448]
01358 bee4ffffff                     mov        esi, 0xffffffe4
0135d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01365 448b1c24                       mov        r11d, dword ptr [rsp]
01369 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01371 448b542404                     mov        r10d, dword ptr [rsp + 4]
01376 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0137e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01383 4c891424                       mov        qword ptr [rsp], r10
01387 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0138b 90                             nop        
0138c c5f877                         vzeroupper 
0138f e84cd4b5ff                     call       0x7f6c9f9c3660
01394 0f1f84008c140012               nop        dword ptr [rax + rax + 0x1200148c]
0139c bee4ffffff                     mov        esi, 0xffffffe4
013a1 498bea                         mov        rbp, r10
013a4 448b1c24                       mov        r11d, dword ptr [rsp]
013a8 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
013b0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013b5 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
013bd 448b542404                     mov        r10d, dword ptr [rsp + 4]
013c2 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
013ca 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013cf 4c891424                       mov        qword ptr [rsp], r10
013d3 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013d7 4489442438                     mov        dword ptr [rsp + 0x38], r8d
013dc 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
013e1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
013e6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
013ec c5f877                         vzeroupper 
013ef e8ecd3b5ff                     call       0x7f6c9f9c3660
013f4 0f1f8400ec140013               nop        dword ptr [rax + rax + 0x130014ec]
013fc be45ffffff                     mov        esi, 0xffffff45
01401 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01409 666690                         nop        
0140c c5f877                         vzeroupper 
0140f e8ccd3b5ff                     call       0x7f6c9f9c3660
01414 0f1f84000c150014               nop        dword ptr [rax + rax + 0x1400150c]
0141c 458bca                         mov        r9d, r10d
0141f be45ffffff                     mov        esi, 0xffffff45
01424 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0142c 448b1c24                       mov        r11d, dword ptr [rsp]
01430 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01438 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0143d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01445 448b542404                     mov        r10d, dword ptr [rsp + 4]
0144a 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01452 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01457 4c891424                       mov        qword ptr [rsp], r10
0145b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01460 44895c2408                     mov        dword ptr [rsp + 8], r11d
01465 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0146a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0146f 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01473 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01478 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0147d 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01482 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01487 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0148c 89542430                       mov        dword ptr [rsp + 0x30], edx
01490 c5f877                         vzeroupper 
01493 e848d3b5ff                     call       0x7f6c9f9c3660
01498 0f1f840090150015               nop        dword ptr [rax + rax + 0x15001590]
014a0 4d3bda                         cmp        r11, r10
014a3 bdffffffff                     mov        ebp, 0xffffffff
014a8 7c08                           jl         0x7f6c9fe66332
014aa 400f95c5                       setne      bpl
014ae 400fb6ed                       movzx      ebp, bpl
014b2 be45ffffff                     mov        esi, 0xffffff45
014b7 448b0424                       mov        r8d, dword ptr [rsp]
014bb 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
014c3 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014c8 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
014d0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014d5 4c891c24                       mov        qword ptr [rsp], r11
014d9 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014dd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014e2 6690                           nop        
014e4 c5f877                         vzeroupper 
014e7 e8f4d2b5ff                     call       0x7f6c9f9c3660
014ec 0f1f8400e4150016               nop        dword ptr [rax + rax + 0x160015e4]
014f4 be45ffffff                     mov        esi, 0xffffff45
014f9 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01501 448b1c24                       mov        r11d, dword ptr [rsp]
01505 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0150d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01512 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0151a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0151f 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01527 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0152c 4c891424                       mov        qword ptr [rsp], r10
01530 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01535 44895c2408                     mov        dword ptr [rsp + 8], r11d
0153a 48894424f8                     mov        qword ptr [rsp - 8], rax
0153f 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01543 8944240c                       mov        dword ptr [rsp + 0xc], eax
01547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154c 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01550 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01555 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0155a 6690                           nop        
0155c c5f877                         vzeroupper 
0155f e87cd2b5ff                     call       0x7f6c9f9c3660
01564 0f1f84005c160017               nop        dword ptr [rax + rax + 0x1700165c]
0156c be45ffffff                     mov        esi, 0xffffff45
01571 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01579 448b1424                       mov        r10d, dword ptr [rsp]
0157d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01585 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0158a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01592 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01597 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0159f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015a4 4c891424                       mov        qword ptr [rsp], r10
015a8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015ad 4489542408                     mov        dword ptr [rsp + 8], r10d
015b2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015b7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015bc 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
015c1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015c6 6690                           nop        
015c8 c5f877                         vzeroupper 
015cb e810d2b5ff                     call       0x7f6c9f9c3660
015d0 0f1f8400c8160018               nop        dword ptr [rax + rax + 0x180016c8]
015d8 85ff                           test       edi, edi
015da 0f8470090000                   je         0x7f6c9fe66dd0
015e0 4c8bc7                         mov        r8, rdi
015e3 8b0c24                         mov        ecx, dword ptr [rsp]
015e6 89742414                       mov        dword ptr [rsp + 0x14], esi
015ea 4533c9                         xor        r9d, r9d
015ed 448bd1                         mov        r10d, ecx
015f0 e98afaffff                     jmp        0x7f6c9fe65eff
015f5 bee4ffffff                     mov        esi, 0xffffffe4
015fa 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01602 448b1424                       mov        r10d, dword ptr [rsp]
01606 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0160e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01613 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0161b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01620 4c891424                       mov        qword ptr [rsp], r10
01624 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01629 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0162e 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01632 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01636 6690                           nop        
01638 c5f877                         vzeroupper 
0163b e8a0d1b5ff                     call       0x7f6c9f9c3660
01640 0f1f840038170019               nop        dword ptr [rax + rax + 0x19001738]
01648 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01651 bee4ffffff                     mov        esi, 0xffffffe4
01656 498bea                         mov        rbp, r10
01659 448b1424                       mov        r10d, dword ptr [rsp]
0165d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01665 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0166a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01672 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01677 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0167f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01684 4c891424                       mov        qword ptr [rsp], r10
01688 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0168d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01692 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01697 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0169c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016a1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
016a5 4489442440                     mov        dword ptr [rsp + 0x40], r8d
016aa 6690                           nop        
016ac c5f877                         vzeroupper 
016af e82cd1b5ff                     call       0x7f6c9f9c3660
016b4 0f1f8400ac17001a               nop        dword ptr [rax + rax + 0x1a0017ac]
016bc 8beb                           mov        ebp, ebx
016be 83c510                         add        ebp, 0x10
016c1 be6effffff                     mov        esi, 0xffffff6e
016c6 448b1424                       mov        r10d, dword ptr [rsp]
016ca 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
016d2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016d7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016df 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016e4 4c891424                       mov        qword ptr [rsp], r10
016e8 895c2414                       mov        dword ptr [rsp + 0x14], ebx
016ec 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
016f1 666690                         nop        
016f4 c5f877                         vzeroupper 
016f7 e8e4d0b5ff                     call       0x7f6c9f9c3660
016fc 0f1f8400f417001b               nop        dword ptr [rax + rax + 0x1b0017f4]
01704 8beb                           mov        ebp, ebx
01706 83c510                         add        ebp, 0x10
01709 be66ffffff                     mov        esi, 0xffffff66
0170e 448b1c24                       mov        r11d, dword ptr [rsp]
01712 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0171a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0171f 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01727 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0172c 4c891424                       mov        qword ptr [rsp], r10
01730 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01734 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01739 666690                         nop        
0173c c5f877                         vzeroupper 
0173f e89cd0b5ff                     call       0x7f6c9f9c3660
01744 0f1f84003c18001c               nop        dword ptr [rax + rax + 0x1c00183c]
0174c be17000000                     mov        esi, 0x17
01751 666690                         nop        
01754 c5f877                         vzeroupper 
01757 e884d0b5ff                     call       0x7f6c9f9c3660
0175c 0f1f84005418001d               nop        dword ptr [rax + rax + 0x1d001854]
01764 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0176c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01771 eb0d                           jmp        0x7f6c9fe66600
01773 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0177b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01780 be6effffff                     mov        esi, 0xffffff6e
01785 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0178d 4c89542408                     mov        qword ptr [rsp + 8], r10
01792 897c2410                       mov        dword ptr [rsp + 0x10], edi
01796 4889442418                     mov        qword ptr [rsp + 0x18], rax
0179b 894c2420                       mov        dword ptr [rsp + 0x20], ecx
0179f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017a4 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017a9 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017ad 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
017b2 4c89742440                     mov        qword ptr [rsp + 0x40], r14
017b7 90                             nop        
017b8 c5f877                         vzeroupper 
017bb e820d0b5ff                     call       0x7f6c9f9c3660
017c0 0f1f8400b818001e               nop        dword ptr [rax + rax + 0x1e0018b8]
017c8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
017cd bebeffffff                     mov        esi, 0xffffffbe
017d2 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
017da 448b1424                       mov        r10d, dword ptr [rsp]
017de 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
017e6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017eb 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
017f3 4c895c2408                     mov        qword ptr [rsp + 8], r11
017f8 893c24                         mov        dword ptr [rsp], edi
017fb 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01800 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01805 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01809 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0180e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01812 6690                           nop        
01814 c5f877                         vzeroupper 
01817 e8c4cfb5ff                     call       0x7f6c9f9c3660
0181c 0f1f84001419001f               nop        dword ptr [rax + rax + 0x1f001914]
01824 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01829 eba2                           jmp        0x7f6c9fe6664d
0182b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01830 eb9b                           jmp        0x7f6c9fe6664d
01832 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01837 eb94                           jmp        0x7f6c9fe6664d
01839 458bca                         mov        r9d, r10d
0183c bee4ffffff                     mov        esi, 0xffffffe4
01841 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01849 448b1424                       mov        r10d, dword ptr [rsp]
0184d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01855 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0185a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01862 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01867 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0186f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01874 4c891424                       mov        qword ptr [rsp], r10
01878 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0187d 4489542408                     mov        dword ptr [rsp + 8], r10d
01882 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01887 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0188c 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01890 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01895 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0189a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0189f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018a4 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
018a9 8954243c                       mov        dword ptr [rsp + 0x3c], edx
018ad 666690                         nop        
018b0 c5f877                         vzeroupper 
018b3 e828cfb5ff                     call       0x7f6c9f9c3660
018b8 0f1f8400b0190020               nop        dword ptr [rax + rax + 0x200019b0]
018c0 bef6ffffff                     mov        esi, 0xfffffff6
018c5 666690                         nop        
018c8 c5f877                         vzeroupper 
018cb e810cfb5ff                     call       0x7f6c9f9c3660
018d0 0f1f8400c8190021               nop        dword ptr [rax + rax + 0x210019c8]
018d8 beccffffff                     mov        esi, 0xffffffcc
018dd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
018e5 448b1c24                       mov        r11d, dword ptr [rsp]
018e9 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
018f1 448b542404                     mov        r10d, dword ptr [rsp + 4]
018f6 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
018fe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01903 4c891424                       mov        qword ptr [rsp], r10
01907 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e8ccceb5ff                     call       0x7f6c9f9c3660
01914 0f1f84000c1a0022               nop        dword ptr [rax + rax + 0x22001a0c]
0191c bee4ffffff                     mov        esi, 0xffffffe4
01921 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01929 448b1424                       mov        r10d, dword ptr [rsp]
0192d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01935 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0193a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01942 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01947 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0194f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01954 4c891424                       mov        qword ptr [rsp], r10
01958 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0195d 4489542408                     mov        dword ptr [rsp + 8], r10d
01962 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0196a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0196f 90                             nop        
01970 c5f877                         vzeroupper 
01973 e868ceb5ff                     call       0x7f6c9f9c3660
01978 0f1f8400701a0023               nop        dword ptr [rax + rax + 0x23001a70]
01980 bee4ffffff                     mov        esi, 0xffffffe4
01985 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0198d 448b1424                       mov        r10d, dword ptr [rsp]
01991 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01999 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0199e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019a6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
019ab 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
019b3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019b8 4c891424                       mov        qword ptr [rsp], r10
019bc c5f877                         vzeroupper 
019bf e81cceb5ff                     call       0x7f6c9f9c3660
019c4 0f1f8400bc1a0024               nop        dword ptr [rax + rax + 0x24001abc]
019cc beccffffff                     mov        esi, 0xffffffcc
019d1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
019d9 448b1424                       mov        r10d, dword ptr [rsp]
019dd 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
019e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ea 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019f2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
019f7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
019ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a04 4c891424                       mov        qword ptr [rsp], r10
01a08 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a0d 4489542408                     mov        dword ptr [rsp + 8], r10d
01a12 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a17 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a1c c5f877                         vzeroupper 
01a1f e8bccdb5ff                     call       0x7f6c9f9c3660
01a24 0f1f84001c1b0025               nop        dword ptr [rax + rax + 0x25001b1c]
01a2c be6effffff                     mov        esi, 0xffffff6e
01a31 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01a39 448b0424                       mov        r8d, dword ptr [rsp]
01a3d 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01a45 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01a4a 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
01a52 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
01a57 44898c24e4000000               mov        dword ptr [rsp + 0xe4], r9d
01a5f 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01a64 44894c2408                     mov        dword ptr [rsp + 8], r9d
01a69 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01a6e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01a73 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a77 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01a7c 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01a81 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01a86 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01a8b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a90 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a95 89542440                       mov        dword ptr [rsp + 0x40], edx
01a99 666690                         nop        
01a9c c5f877                         vzeroupper 
01a9f e83ccdb5ff                     call       0x7f6c9f9c3660
01aa4 0f1f84009c1b0026               nop        dword ptr [rax + rax + 0x26001b9c]
01aac 458bc2                         mov        r8d, r10d
01aaf e969f2ffff                     jmp        0x7f6c9fe65b9d
01ab4 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01abc 458d5308                       lea        r10d, [r11 + 8]
01ac0 458bca                         mov        r9d, r10d
01ac3 be6effffff                     mov        esi, 0xffffff6e
01ac8 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01ad0 448b1424                       mov        r10d, dword ptr [rsp]
01ad4 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01adc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ae1 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ae9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01aee 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01af6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01afb 4c891424                       mov        qword ptr [rsp], r10
01aff 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b04 4489542408                     mov        dword ptr [rsp + 8], r10d
01b09 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b0e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b13 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01b18 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b1d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b22 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b27 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01b2c c5f877                         vzeroupper 
01b2f e8acccb5ff                     call       0x7f6c9f9c3660
01b34 0f1f84002c1c0027               nop        dword ptr [rax + rax + 0x27001c2c]
01b3c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01b44 458d5308                       lea        r10d, [r11 + 8]
01b48 458bca                         mov        r9d, r10d
01b4b be66ffffff                     mov        esi, 0xffffff66
01b50 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b58 448b1424                       mov        r10d, dword ptr [rsp]
01b5c 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01b64 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b69 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01b71 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b76 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01b7e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b83 4c891424                       mov        qword ptr [rsp], r10
01b87 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b8c 4489542408                     mov        dword ptr [rsp + 8], r10d
01b91 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b96 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b9b 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01ba0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ba5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01baa 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01baf 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01bb4 c5f877                         vzeroupper 
01bb7 e824ccb5ff                     call       0x7f6c9f9c3660
01bbc 0f1f8400b41c0028               nop        dword ptr [rax + rax + 0x28001cb4]
01bc4 beccffffff                     mov        esi, 0xffffffcc
01bc9 448b1424                       mov        r10d, dword ptr [rsp]
01bcd 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01bd5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01bda 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01be2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01be7 4c891424                       mov        qword ptr [rsp], r10
01beb 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01bef 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01bf4 c5f877                         vzeroupper 
01bf7 e8e4cbb5ff                     call       0x7f6c9f9c3660
01bfc 0f1f8400f41c0029               nop        dword ptr [rax + rax + 0x29001cf4]
01c04 bee4ffffff                     mov        esi, 0xffffffe4
01c09 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01c11 448b1424                       mov        r10d, dword ptr [rsp]
01c15 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01c1d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c22 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c2a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01c2f 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c37 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c3c 4c891424                       mov        qword ptr [rsp], r10
01c40 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c45 4489542408                     mov        dword ptr [rsp + 8], r10d
01c4a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01c4f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c54 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01c59 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c5e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01c66 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c6b 90                             nop        
01c6c c5f877                         vzeroupper 
01c6f e86ccbb5ff                     call       0x7f6c9f9c3660
01c74 0f1f84006c1d002a               nop        dword ptr [rax + rax + 0x2a001d6c]
01c7c bee4ffffff                     mov        esi, 0xffffffe4
01c81 448b1c24                       mov        r11d, dword ptr [rsp]
01c85 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c8d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01c92 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01c9a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c9f 4c891424                       mov        qword ptr [rsp], r10
01ca3 90                             nop        
01ca4 c5f877                         vzeroupper 
01ca7 e834cbb5ff                     call       0x7f6c9f9c3660
01cac 0f1f8400a41d002b               nop        dword ptr [rax + rax + 0x2b001da4]
01cb4 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01cbb ffc5                           inc        ebp
01cbd bee4ffffff                     mov        esi, 0xffffffe4
01cc2 448b1424                       mov        r10d, dword ptr [rsp]
01cc6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01cce 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01cd3 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01cdb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ce0 4c891424                       mov        qword ptr [rsp], r10
01ce4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ce9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01cee 6690                           nop        
01cf0 c5f877                         vzeroupper 
01cf3 e8e8cab5ff                     call       0x7f6c9f9c3660
01cf8 0f1f8400f01d002c               nop        dword ptr [rax + rax + 0x2c001df0]
01d00 bee4ffffff                     mov        esi, 0xffffffe4
01d05 448b1c24                       mov        r11d, dword ptr [rsp]
01d09 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01d11 448b542404                     mov        r10d, dword ptr [rsp + 4]
01d16 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01d1e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d23 4c891424                       mov        qword ptr [rsp], r10
01d27 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d2c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d31 666690                         nop        
01d34 c5f877                         vzeroupper 
01d37 e8a4cab5ff                     call       0x7f6c9f9c3660
01d3c 0f1f8400341e002d               nop        dword ptr [rax + rax + 0x2d001e34]
01d44 bee4ffffff                     mov        esi, 0xffffffe4
01d49 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01d51 448b1c24                       mov        r11d, dword ptr [rsp]
01d55 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d5d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d62 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01d6a 448b542404                     mov        r10d, dword ptr [rsp + 4]
01d6f 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d77 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d7c 4c891424                       mov        qword ptr [rsp], r10
01d80 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d85 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01d8a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01d8f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d94 c5f877                         vzeroupper 
01d97 e844cab5ff                     call       0x7f6c9f9c3660
01d9c 0f1f8400941e002e               nop        dword ptr [rax + rax + 0x2e001e94]
01da4 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01dac 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
01db4 bef6ffffff                     mov        esi, 0xfffffff6
01db9 498beb                         mov        rbp, r11
01dbc 44898c24e0000000               mov        dword ptr [rsp + 0xe0], r9d
01dc4 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01dcc c5f877                         vzeroupper 
01dcf e80ccab5ff                     call       0x7f6c9f9c3660
01dd4 0f1f8400cc1e002f               nop        dword ptr [rax + rax + 0x2f001ecc]
01ddc 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01de1 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01de9 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
01ded beccffffff                     mov        esi, 0xffffffcc
01df2 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01dfa 44898c24e4000000               mov        dword ptr [rsp + 0xe4], r9d
01e02 890c24                         mov        dword ptr [rsp], ecx
01e05 4c89442408                     mov        qword ptr [rsp + 8], r8
01e0a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e0f 90                             nop        
01e10 c5f877                         vzeroupper 
01e13 e8c8c9b5ff                     call       0x7f6c9f9c3660
01e18 0f1f8400101f0030               nop        dword ptr [rax + rax + 0x30001f10]
01e20 beccffffff                     mov        esi, 0xffffffcc
01e25 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e2d 448b1424                       mov        r10d, dword ptr [rsp]
01e31 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01e39 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e3e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01e46 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e4b 4c891424                       mov        qword ptr [rsp], r10
01e4f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e53 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01e58 c5f877                         vzeroupper 
01e5b e880c9b5ff                     call       0x7f6c9f9c3660
01e60 0f1f8400581f0031               nop        dword ptr [rax + rax + 0x31001f58]
01e68 beccffffff                     mov        esi, 0xffffffcc
01e6d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e75 448b1424                       mov        r10d, dword ptr [rsp]
01e79 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01e81 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e86 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01e8e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e93 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e9b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ea0 4c891424                       mov        qword ptr [rsp], r10
01ea4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ea9 4489542408                     mov        dword ptr [rsp + 8], r10d
01eae 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01eb2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01eb7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ebc 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01ec1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ec6 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01ecb 90                             nop        
01ecc c5f877                         vzeroupper 
01ecf e80cc9b5ff                     call       0x7f6c9f9c3660
01ed4 0f1f8400cc1f0032               nop        dword ptr [rax + rax + 0x32001fcc]
01edc beccffffff                     mov        esi, 0xffffffcc
01ee1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01ee9 448b1c24                       mov        r11d, dword ptr [rsp]
01eed 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01ef5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01efa 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01f02 448b542404                     mov        r10d, dword ptr [rsp + 4]
01f07 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01f0f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f14 4c891424                       mov        qword ptr [rsp], r10
01f18 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f1d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f22 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01f26 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01f2b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f30 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01f35 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01f3a 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01f3f 90                             nop        
01f40 c5f877                         vzeroupper 
01f43 e898c8b5ff                     call       0x7f6c9f9c3660
01f48 0f1f840040200033               nop        dword ptr [rax + rax + 0x33002040]
01f50 448b1424                       mov        r10d, dword ptr [rsp]
01f54 89742414                       mov        dword ptr [rsp + 0x14], esi
01f58 4533c9                         xor        r9d, r9d
01f5b e954feffff                     jmp        0x7f6c9fe66c34
01f60 bef6ffffff                     mov        esi, 0xfffffff6
01f65 666690                         nop        
01f68 c5f877                         vzeroupper 
01f6b e870c8b5ff                     call       0x7f6c9f9c3660
01f70 0f1f840068200034               nop        dword ptr [rax + rax + 0x34002068]
01f78 eb14                           jmp        0x7f6c9fe66e0e
01f7a eb12                           jmp        0x7f6c9fe66e0e
01f7c eb10                           jmp        0x7f6c9fe66e0e
01f7e eb0e                           jmp        0x7f6c9fe66e0e
01f80 eb0c                           jmp        0x7f6c9fe66e0e
01f82 eb0a                           jmp        0x7f6c9fe66e0e
01f84 eb08                           jmp        0x7f6c9fe66e0e
01f86 eb06                           jmp        0x7f6c9fe66e0e
01f88 eb04                           jmp        0x7f6c9fe66e0e
01f8a eb02                           jmp        0x7f6c9fe66e0e
01f8c eb00                           jmp        0x7f6c9fe66e0e
01f8e 488bf0                         mov        rsi, rax
01f91 e9dae6ffff                     jmp        0x7f6c9fe654f0
01f96 49ba725fe69f6c7f0000           movabs     r10, 0x7f6c9fe65f72
01fa0 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01fa7 e9b470a9ff                     jmp        0x7f6c9f8fdee0
01fac e86f3ca8ff                     call       0x7f6c9f8eaaa0
01fb1 e988e0ffff                     jmp        0x7f6c9fe64ebe
01fb6 f4                             hlt        
01fb7 f4                             hlt        
