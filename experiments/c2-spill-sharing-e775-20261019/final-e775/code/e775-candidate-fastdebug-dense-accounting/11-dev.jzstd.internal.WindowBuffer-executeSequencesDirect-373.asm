00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
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
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85403db5ff                   jne        0x7ff8d772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85da230000                   jne        0x7ff8d7bdd418
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 488bde                         mov        rbx, rsi
0004c 8b7638                         mov        esi, dword ptr [rsi + 0x38]
0004f 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00053 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00058 458bcb                         mov        r9d, r11d
0005b 442bce                         sub        r9d, esi
0005e 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
00066 453bd9                         cmp        r11d, r9d
00069 0f8fa1180000                   jg         0x7ff8d7bdc910
0006f 488b6b08                       mov        rbp, qword ptr [rbx + 8]
00073 4c8b4b20                       mov        r9, qword ptr [rbx + 0x20]
00077 4c638424e0000000               movsxd     r8, dword ptr [rsp + 0xe0]
0007f 4c63de                         movsxd     r11, esi
00082 4c03dd                         add        r11, rbp
00085 4d2bcb                         sub        r9, r11
00088 4d3bc1                         cmp        r8, r9
0008b 0f8f7f180000                   jg         0x7ff8d7bdc910
00091 4c8b7310                       mov        r14, qword ptr [rbx + 0x10]
00095 4c8b6b28                       mov        r13, qword ptr [rbx + 0x28]
00099 4d85ed                         test       r13, r13
0009c 0f8492110000                   je         0x7ff8d7bdc234
000a2 33c9                           xor        ecx, ecx
000a4 4c8bda                         mov        r11, rdx
000a7 8b5204                         mov        edx, dword ptr [rdx + 4]
000aa 8b4340                         mov        eax, dword ptr [rbx + 0x40]
000ad 448bc7                         mov        r8d, edi
000b0 85ff                           test       edi, edi
000b2 0f8e94160000                   jle        0x7ff8d7bdc74c
000b8 89742414                       mov        dword ptr [rsp + 0x14], esi
000bc 4c2bed                         sub        r13, rbp
000bf 448d4ae0                       lea        r9d, [rdx - 0x20]
000c3 8b7c2454                       mov        edi, dword ptr [rsp + 0x54]
000c7 83c7e0                         add        edi, -0x20
000ca 418b7204                       mov        esi, dword ptr [r10 + 4]
000ce 85f6                           test       esi, esi
000d0 0f8682180000                   jbe        0x7ff8d7bdc958
000d6 897c2420                       mov        dword ptr [rsp + 0x20], edi
000da 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000df 89442410                       mov        dword ptr [rsp + 0x10], eax
000e3 89542438                       mov        dword ptr [rsp + 0x38], edx
000e7 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ec 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f1 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
000f6 4c89542408                     mov        qword ptr [rsp + 8], r10
000fb 4489442404                     mov        dword ptr [rsp + 4], r8d
00100 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
00108 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
0010d 4c63d6                         movsxd     r10, esi
00110 4d63d8                         movsxd     r11, r8d
00113 49ffcb                         dec        r11
00116 4d3bda                         cmp        r11, r10
00119 0f831d180000                   jae        0x7ff8d7bdc93c
0011f 85c9                           test       ecx, ecx
00121 0f8424180000                   je         0x7ff8d7bdc94b
00127 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0012f 458b5304                       mov        r10d, dword ptr [r11 + 4]
00133 4585d2                         test       r10d, r10d
00136 0f867d180000                   jbe        0x7ff8d7bdc9b9
0013c 4183fa01                       cmp        r10d, 1
00140 0f8673180000                   jbe        0x7ff8d7bdc9b9
00146 4183fa02                       cmp        r10d, 2
0014a 0f8669180000                   jbe        0x7ff8d7bdc9b9
00150 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00158 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0015c 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00161 448b5004                       mov        r10d, dword ptr [rax + 4]
00165 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0016d 448d52f1                       lea        r10d, [rdx - 0xf]
00171 4585d2                         test       r10d, r10d
00174 0f8caa180000                   jl         0x7ff8d7bdca24
0017a 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00182 4183c3f1                       add        r11d, -0xf
00186 4585db                         test       r11d, r11d
00189 0f8c9c180000                   jl         0x7ff8d7bdca2b
0018f 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00197 4183c2f9                       add        r10d, -7
0019b 4585d2                         test       r10d, r10d
0019e 0f8c8e180000                   jl         0x7ff8d7bdca32
001a4 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
001ac 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
001b1 4c8bd0                         mov        r10, rax
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
00201 e9d1010000                     jmp        0x7ff8d7bdb3d7
00206 4533c0                         xor        r8d, r8d
00209 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0020e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00213 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
00217 448bdf                         mov        r11d, edi
0021a 4183fb03                       cmp        r11d, 3
0021e 0f8e7d030000                   jle        0x7ff8d7bdb5a1
00224 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00229 45894310                       mov        dword ptr [r11 + 0x10], r8d
0022d 458b4308                       mov        r8d, dword ptr [r11 + 8]
00231 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00235 448d5ffd                       lea        r11d, [rdi - 3]
00239 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0023e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00243 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00248 45894308                       mov        dword ptr [r11 + 8], r8d
0024c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00254 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00259 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
0025e 4c03542418                     add        r10, qword ptr [rsp + 0x18]
00263 4c63442428                     movsxd     r8, dword ptr [rsp + 0x28]
00268 498bc8                         mov        rcx, r8
0026b 4d03d0                         add        r10, r8
0026e 4d3bda                         cmp        r11, r10
00271 0f8f61130000                   jg         0x7ff8d7bdc5d8
00277 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0027c 4585db                         test       r11d, r11d
0027f 0f8e87120000                   jle        0x7ff8d7bdc50c
00285 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0028a 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
0028f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00294 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00299 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0029e 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
002a3 4503cd                         add        r9d, r13d
002a6 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002ae 498d7c1a08                     lea        rdi, [r10 + rbx + 8]
002b3 448bd3                         mov        r10d, ebx
002b6 4403542428                     add        r10d, dword ptr [rsp + 0x28]
002bb 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
002c3 48636c242c                     movsxd     rbp, dword ptr [rsp + 0x2c]
002c8 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
002cd 0f8fd30b0000                   jg         0x7ff8d7bdbea6
002d3 443b542424                     cmp        r10d, dword ptr [rsp + 0x24]
002d8 0f8f62130000                   jg         0x7ff8d7bdc640
002de 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002e3 4183fb10                       cmp        r11d, 0x10
002e7 0f8f7f010000                   jg         0x7ff8d7bdb46c
002ed 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002f1 0f8349110000                   jae        0x7ff8d7bdc440
002f7 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002ff c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
00306 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0030b 0f8387110000                   jae        0x7ff8d7bdc498
00311 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00316 4403d3                         add        r10d, ebx
00319 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00321 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00326 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0032d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00332 4503d8                         add        r11d, r8d
00335 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0033a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0033f 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00344 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0034c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00351 4183fb10                       cmp        r11d, 0x10
00355 0f8f71130000                   jg         0x7ff8d7bdc6cc
0035b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00360 4183fa10                       cmp        r10d, 0x10
00364 0f8c32030000                   jl         0x7ff8d7bdb69c
0036a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00372 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00377 0f83f10f0000                   jae        0x7ff8d7bdc36e
0037d 458bd3                         mov        r10d, r11d
00380 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00385 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0038c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00391 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00396 0f8334100000                   jae        0x7ff8d7bdc3d0
0039c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
003a1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
003a6 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003ad 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
003b2 4503d0                         add        r10d, r8d
003b5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
003ba 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
003c2 41ffc2                         inc        r10d
003c5 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003ca 0f8d200d0000                   jge        0x7ff8d7bdc0f0
003d0 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
003d7 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003dc 4f8b44d308                     mov        r8, qword ptr [r11 + r10*8 + 8]
003e1 4d8bd8                         mov        r11, r8
003e4 49c1eb12                       shr        r11, 0x12
003e8 458bdb                         mov        r11d, r11d
003eb 4181e3ffff0300                 and        r11d, 0x3ffff
003f2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003f7 4d8bd8                         mov        r11, r8
003fa 49c1fb24                       sar        r11, 0x24
003fe 458bc0                         mov        r8d, r8d
00401 458bdb                         mov        r11d, r11d
00404 418bfb                         mov        edi, r11d
00407 4181e0ffff0100                 and        r8d, 0x1ffff
0040e 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00413 4585db                         test       r11d, r11d
00416 0f8c24110000                   jl         0x7ff8d7bdc540
0041c 458bd8                         mov        r11d, r8d
0041f 4585c0                         test       r8d, r8d
00422 0f84defdffff                   je         0x7ff8d7bdb206
00428 448b0424                       mov        r8d, dword ptr [rsp]
0042c 442bc3                         sub        r8d, ebx
0042f 453bd8                         cmp        r11d, r8d
00432 0f8ed6fdffff                   jle        0x7ff8d7bdb20e
00438 be45ffffff                     mov        esi, 0xffffff45
0043d 418beb                         mov        ebp, r11d
00440 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
00448 c5f877                         vzeroupper 
0044b e81026afff                     call       0x7ff8d76cda60
00450 0f1f840048050000               nop        dword ptr [rax + rax + 0x548]
00458 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
00462 4883e4f0                       and        rsp, 0xfffffffffffffff0
00466 e875171917                     call       0x7ff8eed6cbe0
0046b f4                             hlt        
0046c 4183fb30                       cmp        r11d, 0x30
00470 0f8f75070000                   jg         0x7ff8d7bdbbeb
00476 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0047a 0f83e9120000                   jae        0x7ff8d7bdc769
00480 4c63cb                         movsxd     r9, ebx
00483 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0048b c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00492 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00497 0f8333130000                   jae        0x7ff8d7bdc7d0
0049d 458d5810                       lea        r11d, [r8 + 0x10]
004a1 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
004a9 4d63d8                         movsxd     r11, r8d
004ac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
004b1 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
004b8 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
004bf 413bcd                         cmp        ecx, r13d
004c2 0f8dbf000000                   jge        0x7ff8d7bdb587
004c8 4d2bcb                         sub        r9, r11
004cb 4c63d9                         movsxd     r11, ecx
004ce 4f8d140b                       lea        r10, [r11 + r9]
004d2 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004da 0f8378130000                   jae        0x7ff8d7bdc858
004e0 4d63d5                         movsxd     r10, r13d
004e3 4d2bd3                         sub        r10, r11
004e6 4983c20f                       add        r10, 0xf
004ea 4983e2f0                       and        r10, 0xfffffffffffffff0
004ee 458bd2                         mov        r10d, r10d
004f1 478d540210                     lea        r10d, [r10 + r8 + 0x10]
004f6 4d63d2                         movsxd     r10, r10d
004f9 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004fe 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00506 0f834c130000                   jae        0x7ff8d7bdc858
0050c 3b4c2444                       cmp        ecx, dword ptr [rsp + 0x44]
00510 0f8342130000                   jae        0x7ff8d7bdc858
00516 4983c2f0                       add        r10, -0x10
0051a 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
00522 0f8330130000                   jae        0x7ff8d7bdc858
00528 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
0052f 0f8f7f130000                   jg         0x7ff8d7bdc8b4
00535 448bd3                         mov        r10d, ebx
00538 452bd0                         sub        r10d, r8d
0053b 90                             nop        
0053c 90                             nop        
0053d 90                             nop        
0053e 90                             nop        
0053f 90                             nop        
00540 458bc2                         mov        r8d, r10d
00543 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0054b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00553 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0055a 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00562 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00567 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0056e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00576 4183c010                       add        r8d, 0x10
0057a 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00582 453bc5                         cmp        r8d, r13d
00585 7cb9                           jl         0x7ff8d7bdb540
00587 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0058c 4403db                         add        r11d, ebx
0058f 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00597 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0059c e999fdffff                     jmp        0x7ff8d7bdb33a
005a1 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
005a6 4585c9                         test       r9d, r9d
005a9 7406                           je         0x7ff8d7bdb5b1
005ab 41ffcb                         dec        r11d
005ae 418bfb                         mov        edi, r11d
005b1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005b6 458b4b08                       mov        r9d, dword ptr [r11 + 8]
005ba 85ff                           test       edi, edi
005bc 0f844a080000                   je         0x7ff8d7bdbe0c
005c2 83ff03                         cmp        edi, 3
005c5 0f84e20b0000                   je         0x7ff8d7bdc1ad
005cb 83ff02                         cmp        edi, 2
005ce 0f8785000000                   ja         0x7ff8d7bdb659
005d4 3bbc24e8000000                 cmp        edi, dword ptr [rsp + 0xe8]
005db 0f835b140000                   jae        0x7ff8d7bdca3c
005e1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005e6 458b4cb808                     mov        r9d, dword ptr [r8 + rdi*4 + 8]
005eb 85ff                           test       edi, edi
005ed 7f1b                           jg         0x7ff8d7bdb60a
005ef 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
005f7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
005fc 45894a08                       mov        dword ptr [r10 + 8], r9d
00600 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00605 e94afcffff                     jmp        0x7ff8d7bdb254
0060a 448d5fff                       lea        r11d, [rdi - 1]
0060e 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00616 0f8388160000                   jae        0x7ff8d7bdcca4
0061c 4863cf                         movsxd     rcx, edi
0061f 458bd8                         mov        r11d, r8d
00622 4183c3cc                       add        r11d, -0x34
00626 41c1eb02                       shr        r11d, 2
0062a 458d443bff                     lea        r8d, [r11 + rdi - 1]
0062f 41bb04000000                   mov        r11d, 4
00635 c442a0f5d8                     bzhi       r11, r8, r11
0063a 492bcb                         sub        rcx, r11
0063d 48ffc9                         dec        rcx
00640 4533db                         xor        r11d, r11d
00643 4885c9                         test       rcx, rcx
00646 490f4ccb                       cmovl      rcx, r11
0064a 8bc9                           mov        ecx, ecx
0064c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00654 e902060000                     jmp        0x7ff8d7bdbc5b
00659 48bee0b272e200000000           movabs     rsi, 0xe272b2e0
00663 8beb                           mov        ebp, ebx
00665 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0066d 90                             nop        
0066e 90                             nop        
0066f 90                             nop        
00670 c5f877                         vzeroupper 
00673 e8e845b5ff                     call       0x7ff8d772fc60
00678 0f1f840070070001               nop        dword ptr [rax + rax + 0x1000770]
00680 4885c0                         test       rax, rax
00683 0f844b140000                   je         0x7ff8d7bdcad4
00689 488bf0                         mov        rsi, rax
0068c c5f877                         vzeroupper 
0068f 4881c4d0000000                 add        rsp, 0xd0
00696 5d                             pop        rbp
00697 e9c4a4aeff                     jmp        0x7ff8d76c5b60
0069c 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
006a1 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
006a6 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
006ab 0f8d87020000                   jge        0x7ff8d7bdb938
006b1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
006b6 4183c308                       add        r11d, 8
006ba 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
006c2 4183fa08                       cmp        r10d, 8
006c6 0f8d85010000                   jge        0x7ff8d7bdb851
006cc 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006d4 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
006dc 0f8332180000                   jae        0x7ff8d7bdcf14
006e2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006e7 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
006ed 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
006f2 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
006fa 0f83a0180000                   jae        0x7ff8d7bdcfa0
00700 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00705 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0070d 4183c303                       add        r11d, 3
00711 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00716 41ffc2                         inc        r10d
00719 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00721 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00729 0f83bd180000                   jae        0x7ff8d7bdcfec
0072f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00734 4183c303                       add        r11d, 3
00738 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
00740 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00745 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
0074b 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00753 0f83f3180000                   jae        0x7ff8d7bdd04c
00759 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
0075e 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00763 470fbe44110a                   movsx      r8d, byte ptr [r9 + r10 + 0xa]
00769 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
0076e 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
00774 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
00779 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0077e 4183fb08                       cmp        r11d, 8
00782 0f831c190000                   jae        0x7ff8d7bdd0a4
00788 49ba20ec70e200000000           movabs     r10, 0xe270ec20
00792 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
0079a 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
0079f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
007a4 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a9 4183fa04                       cmp        r10d, 4
007ad 7e3d                           jle        0x7ff8d7bdb7ec
007af 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
007b3 83c504                         add        ebp, 4
007b6 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007bb 418bd1                         mov        edx, r9d
007be 90                             nop        
007bf 90                             nop        
007c0 c5f877                         vzeroupper 
007c3 e89844b5ff                     call       0x7ff8d772fc60
007c8 0f1f8400c0080002               nop        dword ptr [rax + rax + 0x20008c0]
007d0 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007d5 8bd5                           mov        edx, ebp
007d7 8bc8                           mov        ecx, eax
007d9 90                             nop        
007da 90                             nop        
007db 90                             nop        
007dc c5f877                         vzeroupper 
007df e87c44b5ff                     call       0x7ff8d772fc60
007e4 0f1f8400dc080003               nop        dword ptr [rax + rax + 0x30008dc]
007ec 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007f1 4183fa08                       cmp        r10d, 8
007f5 0f8ebffbffff                   jle        0x7ff8d7bdb3ba
007fb 49ba48ec70e200000000           movabs     r10, 0xe270ec48
00805 8b542428                       mov        edx, dword ptr [rsp + 0x28]
00809 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0080e 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00813 83c208                         add        edx, 8
00816 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0081b 90                             nop        
0081c c5f877                         vzeroupper 
0081f e83c44b5ff                     call       0x7ff8d772fc60
00824 0f1f84001c090004               nop        dword ptr [rax + rax + 0x400091c]
0082c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00831 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00838 488bc8                         mov        rcx, rax
0083b 90                             nop        
0083c c5f877                         vzeroupper 
0083f e81c44b5ff                     call       0x7ff8d772fc60
00844 0f1f84003c090005               nop        dword ptr [rax + rax + 0x500093c]
0084c e969fbffff                     jmp        0x7ff8d7bdb3ba
00851 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00856 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
0085d 90                             nop        
0085e 90                             nop        
0085f 90                             nop        
00860 c5f877                         vzeroupper 
00863 e8f843b5ff                     call       0x7ff8d772fc60
00868 0f1f840060090006               nop        dword ptr [rax + rax + 0x6000960]
00870 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00875 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00879 488bc8                         mov        rcx, rax
0087c c5f877                         vzeroupper 
0087f e8dc43b5ff                     call       0x7ff8d772fc60
00884 0f1f84007c090007               nop        dword ptr [rax + rax + 0x700097c]
0088c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00894 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00899 0f8d1bfbffff                   jge        0x7ff8d7bdb3ba
0089f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
008a4 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
008ab 0f8e77050000                   jle        0x7ff8d7bdbe28
008b1 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
008b9 4183c208                       add        r10d, 8
008bd be66ffffff                     mov        esi, 0xffffff66
008c2 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
008ca 448b1c24                       mov        r11d, dword ptr [rsp]
008ce 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
008d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
008db 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
008e3 448b442404                     mov        r8d, dword ptr [rsp + 4]
008e8 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
008f0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
008f5 44895c2408                     mov        dword ptr [rsp + 8], r11d
008fa 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
008ff 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00904 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
00909 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0090e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00913 90                             nop        
00914 c5f877                         vzeroupper 
00917 e84421afff                     call       0x7ff8d76cda60
0091c 0f1f8400140a0008               nop        dword ptr [rax + rax + 0x8000a14]
00924 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0092e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00932 e8a9121917                     call       0x7ff8eed6cbe0
00937 f4                             hlt        
00938 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0093d 4183fa30                       cmp        r10d, 0x30
00941 0f8ff7010000                   jg         0x7ff8d7bdbb3e
00947 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
0094b 83c5f9                         add        ebp, -7
0094e 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00952 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0095a 443bdd                         cmp        r11d, ebp
0095d 0f83f5110000                   jae        0x7ff8d7bdcb58
00963 418beb                         mov        ebp, r11d
00966 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
0096d 4863ed                         movsxd     rbp, ebp
00970 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00978 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0097d 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00982 4889ac24a8000000               mov        qword ptr [rsp + 0xa8], rbp
0098a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0098f 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00994 0f8336120000                   jae        0x7ff8d7bdcbd0
0099a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0099f 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
009a7 4963eb                         movsxd     rbp, r11d
009aa 4889ac24b8000000               mov        qword ptr [rsp + 0xb8], rbp
009b2 488d4d08                       lea        rcx, [rbp + 8]
009b6 48be28c122e200000000           movabs     rsi, 0xe222c128
009c0 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
009c5 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
009cd 4533c9                         xor        r9d, r9d
009d0 c5f877                         vzeroupper 
009d3 e88838b5ff                     call       0x7ff8d772f260
009d8 0f1f8400d00a0009               nop        dword ptr [rax + rax + 0x9000ad0]
009e0 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
009e8 4183c208                       add        r10d, 8
009ec 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
009f4 458bca                         mov        r9d, r10d
009f7 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
009fc 0f8d28010000                   jge        0x7ff8d7bdbb2a
00a02 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00a0a 482bac24b8000000               sub        rbp, qword ptr [rsp + 0xb8]
00a12 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00a1a 4983c3f9                       add        r11, -7
00a1e 4d63c2                         movsxd     r8, r10d
00a21 4d8d1428                       lea        r10, [r8 + rbp]
00a25 4d3bd3                         cmp        r10, r11
00a28 0f835a130000                   jae        0x7ff8d7bdcd88
00a2e 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00a33 4d2bd0                         sub        r10, r8
00a36 4983c207                       add        r10, 7
00a3a 4983e2f8                       and        r10, 0xfffffffffffffff8
00a3e 458bd2                         mov        r10d, r10d
00a41 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00a49 478d540208                     lea        r10d, [r10 + r8 + 8]
00a4e 4d63d2                         movsxd     r10, r10d
00a51 4d8d442af8                     lea        r8, [r10 + rbp - 8]
00a56 4d3bc3                         cmp        r8, r11
00a59 0f8329130000                   jae        0x7ff8d7bdcd88
00a5f 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00a64 0f831e130000                   jae        0x7ff8d7bdcd88
00a6a 4983c2f8                       add        r10, -8
00a6e 4d3bd3                         cmp        r10, r11
00a71 0f8311130000                   jae        0x7ff8d7bdcd88
00a77 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00a7c 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a83 0f8f9b130000                   jg         0x7ff8d7bdce24
00a89 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00a90 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00a97 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00a9b 90                             nop        
00a9c 90                             nop        
00a9d 90                             nop        
00a9e 90                             nop        
00a9f 90                             nop        
00aa0 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00aa8 4963cb                         movsxd     rcx, r11d
00aab 4883c108                       add        rcx, 8
00aaf 8b6c2428                       mov        ebp, dword ptr [rsp + 0x28]
00ab3 03ac24a8000000                 add        ebp, dword ptr [rsp + 0xa8]
00aba 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00abf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ac4 48be28c122e200000000           movabs     rsi, 0xe222c128
00ace 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00ad3 4533c9                         xor        r9d, r9d
00ad6 90                             nop        
00ad7 90                             nop        
00ad8 c5f877                         vzeroupper 
00adb e88037b5ff                     call       0x7ff8d772f260
00ae0 0f1f8400d80b000a               nop        dword ptr [rax + rax + 0xa000bd8]
00ae8 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00af0 4183c208                       add        r10d, 8
00af4 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00afc 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00b01 7c9d                           jl         0x7ff8d7bdbaa0
00b03 eb25                           jmp        0x7ff8d7bdbb2a
00b05 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b0a 4d63d2                         movsxd     r10, r10d
00b0d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b14 c442a8f5db                     bzhi       r11, r11, r10
00b19 c4c1fb92fb                     kmovq      k7, r11
00b1e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b24 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b2a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b2f 440354242c                     add        r10d, dword ptr [rsp + 0x2c]
00b34 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00b39 e97cf8ffff                     jmp        0x7ff8d7bdb3ba
00b3e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00b46 4585db                         test       r11d, r11d
00b49 0f8ce1100000                   jl         0x7ff8d7bdcc30
00b4f 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b54 4585c0                         test       r8d, r8d
00b57 0f8cd3100000                   jl         0x7ff8d7bdcc30
00b5d 4503d3                         add        r10d, r11d
00b60 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00b68 453bc2                         cmp        r8d, r10d
00b6b 0f82bf100000                   jb         0x7ff8d7bdcc30
00b71 443b442414                     cmp        r8d, dword ptr [rsp + 0x14]
00b76 0f82b4100000                   jb         0x7ff8d7bdcc30
00b7c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b81 4585d2                         test       r10d, r10d
00b84 74a4                           je         0x7ff8d7bdbb2a
00b86 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00b8b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b90 4b8d741008                     lea        rsi, [r8 + r10 + 8]
00b95 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00b9a 4883fd20                       cmp        rbp, 0x20
00b9e 0f8661ffffff                   jbe        0x7ff8d7bdbb05
00ba4 488bd5                         mov        rdx, rbp
00ba7 c5f877                         vzeroupper 
00baa 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
00bb4 41ffd2                         call       r10
00bb7 0f1f840000000000               nop        dword ptr [rax + rax]
00bbf e966ffffff                     jmp        0x7ff8d7bdbb2a
00bc4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bc9 4d63d3                         movsxd     r10, r11d
00bcc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bd3 c442a8f5db                     bzhi       r11, r11, r10
00bd8 c4c1fb92fb                     kmovq      k7, r11
00bdd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00be3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00be9 eb60                           jmp        0x7ff8d7bdbc4b
00beb 85db                           test       ebx, ebx
00bed 0f8c0d0f0000                   jl         0x7ff8d7bdcb00
00bf3 4585c0                         test       r8d, r8d
00bf6 0f8c040f0000                   jl         0x7ff8d7bdcb00
00bfc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c01 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00c09 0f82f10e0000                   jb         0x7ff8d7bdcb00
00c0f 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00c17 453bdd                         cmp        r11d, r13d
00c1a 0f82e00e0000                   jb         0x7ff8d7bdcb00
00c20 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c25 4585d2                         test       r10d, r10d
00c28 7421                           je         0x7ff8d7bdbc4b
00c2a 4883f920                       cmp        rcx, 0x20
00c2e 7694                           jbe        0x7ff8d7bdbbc4
00c30 488bd1                         mov        rdx, rcx
00c33 c5f877                         vzeroupper 
00c36 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
00c40 41ffd2                         call       r10
00c43 0f1f840000000000               nop        dword ptr [rax + rax]
00c4b 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00c50 e9e5f6ffff                     jmp        0x7ff8d7bdb33a
00c55 90                             nop        
00c56 90                             nop        
00c57 90                             nop        
00c58 418bfb                         mov        edi, r11d
00c5b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00c60 458b5cbb04                     mov        r11d, dword ptr [r11 + rdi*4 + 4]
00c65 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c6a 45895cb808                     mov        dword ptr [r8 + rdi*4 + 8], r11d
00c6f 448d5fff                       lea        r11d, [rdi - 1]
00c73 443bd9                         cmp        r11d, ecx
00c76 7fe0                           jg         0x7ff8d7bdbc58
00c78 48638c24e8000000               movsxd     rcx, dword ptr [rsp + 0xe8]
00c80 4183fb3f                       cmp        r11d, 0x3f
00c84 0f8e1e010000                   jle        0x7ff8d7bdbda8
00c8a 4c63d7                         movsxd     r10, edi
00c8d 4983c2fe                       add        r10, -2
00c91 4c3bd1                         cmp        r10, rcx
00c94 0f839e100000                   jae        0x7ff8d7bdcd38
00c9a 448d57bf                       lea        r10d, [rdi - 0x41]
00c9e 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00ca6 0f83a0100000                   jae        0x7ff8d7bdcd4c
00cac 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00cb4 0f83a6100000                   jae        0x7ff8d7bdcd60
00cba 448d57c0                       lea        r10d, [rdi - 0x40]
00cbe 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00cc6 0f83a8100000                   jae        0x7ff8d7bdcd74
00ccc 448bd7                         mov        r10d, edi
00ccf 41ffca                         dec        r10d
00cd2 418bfa                         mov        edi, r10d
00cd5 eb0c                           jmp        0x7ff8d7bdbce3
00cd7 90                             nop        
00cd8 90                             nop        
00cd9 90                             nop        
00cda 90                             nop        
00cdb 90                             nop        
00cdc 90                             nop        
00cdd 90                             nop        
00cde 90                             nop        
00cdf 90                             nop        
00ce0 418bfb                         mov        edi, r11d
00ce3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00ce8 62d17e486f84bbc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0x38]
00cf3 62d17e487f84bbccffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0x34], zmm0
00cfe 62d17e486f84bb88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0x78]
00d09 62d17e487f84bb8cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0x74], zmm0
00d14 62d17e486f84bb48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0xb8]
00d1f 62d17e487f84bb4cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0xb4], zmm0
00d2a 62d17e486f84bb08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0xf8]
00d35 62d17e487f84bb0cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0xf4], zmm0
00d40 448d5fc0                       lea        r11d, [rdi - 0x40]
00d44 4183fb3f                       cmp        r11d, 0x3f
00d48 7f96                           jg         0x7ff8d7bdbce0
00d4a 4183fb0f                       cmp        r11d, 0xf
00d4e 7e58                           jle        0x7ff8d7bdbda8
00d50 448bd7                         mov        r10d, edi
00d53 458d42b0                       lea        r8d, [r10 - 0x50]
00d57 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00d5f 0f83c7130000                   jae        0x7ff8d7bdd12c
00d65 4183c2b1                       add        r10d, -0x4f
00d69 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00d71 0f83dd130000                   jae        0x7ff8d7bdd154
00d77 448bd7                         mov        r10d, edi
00d7a 4183c2c0                       add        r10d, -0x40
00d7e 90                             nop        
00d7f 90                             nop        
00d80 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d85 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00d90 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00d9b 4183c2f0                       add        r10d, -0x10
00d9f 4183fa0f                       cmp        r10d, 0xf
00da3 7fdb                           jg         0x7ff8d7bdbd80
00da5 458bda                         mov        r11d, r10d
00da8 4585db                         test       r11d, r11d
00dab 0f8e46f8ffff                   jle        0x7ff8d7bdb5f7
00db1 4d63d3                         movsxd     r10, r11d
00db4 49ffca                         dec        r10
00db7 4c3bd1                         cmp        r10, rcx
00dba 0f8358130000                   jae        0x7ff8d7bdd118
00dc0 458bd3                         mov        r10d, r11d
00dc3 418d4aff                       lea        ecx, [r10 - 1]
00dc7 3b8c24e8000000                 cmp        ecx, dword ptr [rsp + 0xe8]
00dce 0f836c130000                   jae        0x7ff8d7bdd140
00dd4 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00ddc 0f8386130000                   jae        0x7ff8d7bdd168
00de2 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00dea 0f838c130000                   jae        0x7ff8d7bdd17c
00df0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00df5 478b449a04                     mov        r8d, dword ptr [r10 + r11*4 + 4]
00dfa 4789449a08                     mov        dword ptr [r10 + r11*4 + 8], r8d
00dff 41ffcb                         dec        r11d
00e02 4585db                         test       r11d, r11d
00e05 7fe9                           jg         0x7ff8d7bdbdf0
00e07 e9ebf7ffff                     jmp        0x7ff8d7bdb5f7
00e0c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00e14 e9e7f7ffff                     jmp        0x7ff8d7bdb600
00e19 90                             nop        
00e1a 90                             nop        
00e1b 90                             nop        
00e1c 90                             nop        
00e1d 90                             nop        
00e1e 90                             nop        
00e1f 90                             nop        
00e20 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00e28 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00e2f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00e33 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e38 8bd5                           mov        edx, ebp
00e3a 90                             nop        
00e3b 90                             nop        
00e3c c5f877                         vzeroupper 
00e3f e81c3eb5ff                     call       0x7ff8d772fc60
00e44 0f1f84003c0f000b               nop        dword ptr [rax + rax + 0xb000f3c]
00e4c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e51 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00e58 488bc8                         mov        rcx, rax
00e5b 90                             nop        
00e5c c5f877                         vzeroupper 
00e5f e8fc3db5ff                     call       0x7ff8d772fc60
00e64 0f1f84005c0f000c               nop        dword ptr [rax + rax + 0xc000f5c]
00e6c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00e74 4183c308                       add        r11d, 8
00e78 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00e7d 7ca1                           jl         0x7ff8d7bdbe20
00e7f e936f5ffff                     jmp        0x7ff8d7bdb3ba
00e84 4d63d2                         movsxd     r10, r10d
00e87 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e8e c442a8f5db                     bzhi       r11, r11, r10
00e93 c4c1fb92fb                     kmovq      k7, r11
00e98 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e9e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ea4 eb6e                           jmp        0x7ff8d7bdbf14
00ea6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00eab 4585db                         test       r11d, r11d
00eae 0f84b0040000                   je         0x7ff8d7bdc364
00eb4 85db                           test       ebx, ebx
00eb6 0f8c80130000                   jl         0x7ff8d7bdd23c
00ebc 4585c0                         test       r8d, r8d
00ebf 0f8c77130000                   jl         0x7ff8d7bdd23c
00ec5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00eca 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00ed2 0f8264130000                   jb         0x7ff8d7bdd23c
00ed8 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00ee0 453bdd                         cmp        r11d, r13d
00ee3 0f8253130000                   jb         0x7ff8d7bdd23c
00ee9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00eee 4585d2                         test       r10d, r10d
00ef1 7421                           je         0x7ff8d7bdbf14
00ef3 4883f920                       cmp        rcx, 0x20
00ef7 768b                           jbe        0x7ff8d7bdbe84
00ef9 488bd1                         mov        rdx, rcx
00efc c5f877                         vzeroupper 
00eff 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
00f09 41ffd2                         call       r10
00f0c 0f1f840000000000               nop        dword ptr [rax + rax]
00f14 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f19 4585db                         test       r11d, r11d
00f1c 0f8e9f010000                   jle        0x7ff8d7bdc0c1
00f22 458bd5                         mov        r10d, r13d
00f25 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00f2a 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00f32 458bdd                         mov        r11d, r13d
00f35 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00f3a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f3f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f44 458bc2                         mov        r8d, r10d
00f47 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00f4c 4b8d742b08                     lea        rsi, [r11 + r13 + 8]
00f51 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f56 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00f5b 0f8dc6000000                   jge        0x7ff8d7bdc027
00f61 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f66 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00f6b 458bd3                         mov        r10d, r11d
00f6e 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00f73 450f4fd1                       cmovg      r10d, r9d
00f77 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00f7c 4585c0                         test       r8d, r8d
00f7f 0f8c13130000                   jl         0x7ff8d7bdd298
00f85 4585ed                         test       r13d, r13d
00f88 0f8c0a130000                   jl         0x7ff8d7bdd298
00f8e 478d1c02                       lea        r11d, [r10 + r8]
00f92 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00f9a 453bd3                         cmp        r10d, r11d
00f9d 0f82f5120000                   jb         0x7ff8d7bdd298
00fa3 458bdd                         mov        r11d, r13d
00fa6 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00fab 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00fb3 453bd3                         cmp        r10d, r11d
00fb6 0f82dc120000                   jb         0x7ff8d7bdd298
00fbc 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00fc1 4585db                         test       r11d, r11d
00fc4 0f8cce120000                   jl         0x7ff8d7bdd298
00fca 4585db                         test       r11d, r11d
00fcd 7429                           je         0x7ff8d7bdbff8
00fcf 4963d3                         movsxd     rdx, r11d
00fd2 4883fa20                       cmp        rdx, 0x20
00fd6 7735                           ja         0x7ff8d7bdc00d
00fd8 4d63d3                         movsxd     r10, r11d
00fdb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fe2 c442a8f5db                     bzhi       r11, r11, r10
00fe7 c4c1fb92fb                     kmovq      k7, r11
00fec 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ff2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ff8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00ffd 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
01002 0f8db2f3ffff                   jge        0x7ff8d7bdb3ba
01008 e993020000                     jmp        0x7ff8d7bdc2a0
0100d c5f877                         vzeroupper 
01010 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
0101a 41ffd2                         call       r10
0101d 0f1f840000000000               nop        dword ptr [rax + rax]
01025 ebd1                           jmp        0x7ff8d7bdbff8
01027 4585c0                         test       r8d, r8d
0102a 0f8cf0120000                   jl         0x7ff8d7bdd320
01030 4585ed                         test       r13d, r13d
01033 0f8ce7120000                   jl         0x7ff8d7bdd320
01039 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0103e 4503d0                         add        r10d, r8d
01041 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
01049 453bda                         cmp        r11d, r10d
0104c 0f82ce120000                   jb         0x7ff8d7bdd320
01052 458bc3                         mov        r8d, r11d
01055 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0105a 453bc3                         cmp        r8d, r11d
0105d 0f82bd120000                   jb         0x7ff8d7bdd320
01063 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01068 4585d2                         test       r10d, r10d
0106b 0f8449f3ffff                   je         0x7ff8d7bdb3ba
01071 4883fd20                       cmp        rbp, 0x20
01075 772a                           ja         0x7ff8d7bdc0a1
01077 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0107c 4d63d3                         movsxd     r10, r11d
0107f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01086 c442a8f5db                     bzhi       r11, r11, r10
0108b c4c1fb92fb                     kmovq      k7, r11
01090 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01096 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0109c e919f3ffff                     jmp        0x7ff8d7bdb3ba
010a1 488bd5                         mov        rdx, rbp
010a4 c5f877                         vzeroupper 
010a7 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
010b1 41ffd2                         call       r10
010b4 0f1f840000000000               nop        dword ptr [rax + rax]
010bc e9f9f2ffff                     jmp        0x7ff8d7bdb3ba
010c1 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
010c6 e9eff2ffff                     jmp        0x7ff8d7bdb3ba
010cb 4d63d2                         movsxd     r10, r10d
010ce 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010d5 c442a8f5db                     bzhi       r11, r11, r10
010da c4c1fb92fb                     kmovq      k7, r11
010df 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010e5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010eb e9a4000000                     jmp        0x7ff8d7bdc194
010f0 448b1424                       mov        r10d, dword ptr [rsp]
010f4 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
010fc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01101 4585db                         test       r11d, r11d
01104 0f8486100000                   je         0x7ff8d7bdd190
0110a 4d8bc3                         mov        r8, r11
0110d 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
01115 4585c9                         test       r9d, r9d
01118 0f8cbe100000                   jl         0x7ff8d7bdd1dc
0111e 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
01123 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0112b 8b542438                       mov        edx, dword ptr [rsp + 0x38]
0112f 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
01133 85c9                           test       ecx, ecx
01135 0f8cb2100000                   jl         0x7ff8d7bdd1ed
0113b 3b1424                         cmp        edx, dword ptr [rsp]
0113e 0f82a9100000                   jb         0x7ff8d7bdd1ed
01144 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
01148 4103ea                         add        ebp, r10d
0114b 418b5004                       mov        edx, dword ptr [r8 + 4]
0114f 3bd5                           cmp        edx, ebp
01151 0f8296100000                   jb         0x7ff8d7bdd1ed
01157 4585d2                         test       r10d, r10d
0115a 0f8c8d100000                   jl         0x7ff8d7bdd1ed
01160 4585d2                         test       r10d, r10d
01163 742f                           je         0x7ff8d7bdc194
01165 498d740808                     lea        rsi, [r8 + rcx + 8]
0116a 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
0116f 4963d2                         movsxd     rdx, r10d
01172 4883fa20                       cmp        rdx, 0x20
01176 0f864fffffff                   jbe        0x7ff8d7bdc0cb
0117c c5f877                         vzeroupper 
0117f 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
01189 41ffd2                         call       r10
0118c 0f1f840000000000               nop        dword ptr [rax + rax]
01194 896b38                         mov        dword ptr [rbx + 0x38], ebp
01197 c5f877                         vzeroupper 
0119a 4881c4d0000000                 add        rsp, 0xd0
011a1 5d                             pop        rbp
011a2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
011a6 0f8756120000                   ja         0x7ff8d7bdd402
011ac c3                             ret        
011ad 41ffc9                         dec        r9d
011b0 4585c9                         test       r9d, r9d
011b3 7e27                           jle        0x7ff8d7bdc1dc
011b5 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
011ba 45894310                       mov        dword ptr [r11 + 0x10], r8d
011be 458b5b08                       mov        r11d, dword ptr [r11 + 8]
011c2 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
011c7 4589580c                       mov        dword ptr [r8 + 0xc], r11d
011cb 45894808                       mov        dword ptr [r8 + 8], r9d
011cf 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
011d7 e924f4ffff                     jmp        0x7ff8d7bdb600
011dc 48beb0b272e200000000           movabs     rsi, 0xe272b2b0
011e6 8beb                           mov        ebp, ebx
011e8 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
011f0 c5f877                         vzeroupper 
011f3 e8683ab5ff                     call       0x7ff8d772fc60
011f8 0f1f8400f012000d               nop        dword ptr [rax + rax + 0xd0012f0]
01200 4885c0                         test       rax, rax
01203 0f8580f4ffff                   jne        0x7ff8d7bdb689
01209 bef6ffffff                     mov        esi, 0xfffffff6
0120e 90                             nop        
0120f 90                             nop        
01210 c5f877                         vzeroupper 
01213 e84818afff                     call       0x7ff8d76cda60
01218 0f1f84001013000e               nop        dword ptr [rax + rax + 0xe001310]
01220 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0122a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0122e e8ad091917                     call       0x7ff8eed6cbe0
01233 f4                             hlt        
01234 4d03d8                         add        r11, r8
01237 4d3bde                         cmp        r11, r14
0123a 7e08                           jle        0x7ff8d7bdc244
0123c 4533ed                         xor        r13d, r13d
0123f e95eeeffff                     jmp        0x7ff8d7bdb0a2
01244 4533ed                         xor        r13d, r13d
01247 b901000000                     mov        ecx, 1
0124c e953eeffff                     jmp        0x7ff8d7bdb0a4
01251 448bdd                         mov        r11d, ebp
01254 4d63d3                         movsxd     r10, r11d
01257 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0125e c442a8f5db                     bzhi       r11, r11, r10
01263 c4c1fb92fb                     kmovq      k7, r11
01268 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0126e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01274 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01279 4403d5                         add        r10d, ebp
0127c 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01281 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01285 418502                         test       dword ptr [r10], eax
01288 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0128d 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
01292 0f8d22f1ffff                   jge        0x7ff8d7bdb3ba
01298 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
012a0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
012a8 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
012ad 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
012b5 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
012b9 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
012bd 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
012c1 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
012c6 410f4fea                       cmovg      ebp, r10d
012ca 458bc3                         mov        r8d, r11d
012cd 4585db                         test       r11d, r11d
012d0 0f8cea0b0000                   jl         0x7ff8d7bdcec0
012d6 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
012de 4585d2                         test       r10d, r10d
012e1 0f8cd90b0000                   jl         0x7ff8d7bdcec0
012e7 458d1c28                       lea        r11d, [r8 + rbp]
012eb 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
012f3 453bcb                         cmp        r9d, r11d
012f6 0f82c40b0000                   jb         0x7ff8d7bdcec0
012fc 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
01304 4403f5                         add        r14d, ebp
01307 458bd1                         mov        r10d, r9d
0130a 453bd6                         cmp        r10d, r14d
0130d 0f82ad0b0000                   jb         0x7ff8d7bdcec0
01313 85ed                           test       ebp, ebp
01315 0f8ca50b0000                   jl         0x7ff8d7bdcec0
0131b 85ed                           test       ebp, ebp
0131d 0f8451ffffff                   je         0x7ff8d7bdc274
01323 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01328 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
0132d 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
01335 4b8d740308                     lea        rsi, [r11 + r8 + 8]
0133a 4863d5                         movsxd     rdx, ebp
0133d 4883fa20                       cmp        rdx, 0x20
01341 0f860affffff                   jbe        0x7ff8d7bdc251
01347 c5f877                         vzeroupper 
0134a 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
01354 41ffd2                         call       r10
01357 0f1f840000000000               nop        dword ptr [rax + rax]
0135f e910ffffff                     jmp        0x7ff8d7bdc274
01364 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01369 e9a6fbffff                     jmp        0x7ff8d7bdbf14
0136e bee4ffffff                     mov        esi, 0xffffffe4
01373 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0137b 448b1424                       mov        r10d, dword ptr [rsp]
0137f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01387 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0138c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01394 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01399 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
013a1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013a6 4c891424                       mov        qword ptr [rsp], r10
013aa 90                             nop        
013ab 90                             nop        
013ac c5f877                         vzeroupper 
013af e8ac16afff                     call       0x7ff8d76cda60
013b4 0f1f8400ac140010               nop        dword ptr [rax + rax + 0x100014ac]
013bc 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
013c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013ca e811081917                     call       0x7ff8eed6cbe0
013cf f4                             hlt        
013d0 bee4ffffff                     mov        esi, 0xffffffe4
013d5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
013dd 448b1424                       mov        r10d, dword ptr [rsp]
013e1 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013e9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013ee 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
013f6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
013fb 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01403 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01408 4c891424                       mov        qword ptr [rsp], r10
0140c 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01411 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01416 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0141c c5f877                         vzeroupper 
0141f e83c16afff                     call       0x7ff8d76cda60
01424 0f1f84001c150011               nop        dword ptr [rax + rax + 0x1100151c]
0142c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01436 4883e4f0                       and        rsp, 0xfffffffffffffff0
0143a e8a1071917                     call       0x7ff8eed6cbe0
0143f f4                             hlt        
01440 bee4ffffff                     mov        esi, 0xffffffe4
01445 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0144d 448b1424                       mov        r10d, dword ptr [rsp]
01451 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01459 448b542404                     mov        r10d, dword ptr [rsp + 4]
0145e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01466 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0146b 4c891424                       mov        qword ptr [rsp], r10
0146f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01473 90                             nop        
01474 c5f877                         vzeroupper 
01477 e8e415afff                     call       0x7ff8d76cda60
0147c 0f1f840074150012               nop        dword ptr [rax + rax + 0x12001574]
01484 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0148e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01492 e849071917                     call       0x7ff8eed6cbe0
01497 f4                             hlt        
01498 bee4ffffff                     mov        esi, 0xffffffe4
0149d 498bea                         mov        rbp, r10
014a0 448b1c24                       mov        r11d, dword ptr [rsp]
014a4 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
014ac 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014b1 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
014b9 448b542404                     mov        r10d, dword ptr [rsp + 4]
014be 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
014c6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014cb 4c891424                       mov        qword ptr [rsp], r10
014cf 895c2414                       mov        dword ptr [rsp + 0x14], ebx
014d3 4489442438                     mov        dword ptr [rsp + 0x38], r8d
014d8 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
014dd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
014e2 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
014e8 c5f877                         vzeroupper 
014eb e87015afff                     call       0x7ff8d76cda60
014f0 0f1f8400e8150013               nop        dword ptr [rax + rax + 0x130015e8]
014f8 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01502 4883e4f0                       and        rsp, 0xfffffffffffffff0
01506 e8d5061917                     call       0x7ff8eed6cbe0
0150b f4                             hlt        
0150c be45ffffff                     mov        esi, 0xffffff45
01511 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01519 90                             nop        
0151a 90                             nop        
0151b 90                             nop        
0151c c5f877                         vzeroupper 
0151f e83c15afff                     call       0x7ff8d76cda60
01524 0f1f84001c160014               nop        dword ptr [rax + rax + 0x1400161c]
0152c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01536 4883e4f0                       and        rsp, 0xfffffffffffffff0
0153a e8a1061917                     call       0x7ff8eed6cbe0
0153f f4                             hlt        
01540 458bca                         mov        r9d, r10d
01543 be45ffffff                     mov        esi, 0xffffff45
01548 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01550 448b1c24                       mov        r11d, dword ptr [rsp]
01554 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0155c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01561 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01569 448b542404                     mov        r10d, dword ptr [rsp + 4]
0156e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01576 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0157b 4c891424                       mov        qword ptr [rsp], r10
0157f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01584 44895c2408                     mov        dword ptr [rsp + 8], r11d
01589 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0158e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01593 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01597 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0159c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015a1 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
015a6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015ab 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015b0 897c2430                       mov        dword ptr [rsp + 0x30], edi
015b4 c5f877                         vzeroupper 
015b7 e8a414afff                     call       0x7ff8d76cda60
015bc 0f1f8400b4160015               nop        dword ptr [rax + rax + 0x150016b4]
015c4 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
015ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
015d2 e809061917                     call       0x7ff8eed6cbe0
015d7 f4                             hlt        
015d8 4d3bda                         cmp        r11, r10
015db bdffffffff                     mov        ebp, 0xffffffff
015e0 7c08                           jl         0x7ff8d7bdc5ea
015e2 400f95c5                       setne      bpl
015e6 400fb6ed                       movzx      ebp, bpl
015ea be45ffffff                     mov        esi, 0xffffff45
015ef 448b0424                       mov        r8d, dword ptr [rsp]
015f3 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
015fb 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01600 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01608 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0160d 4c891c24                       mov        qword ptr [rsp], r11
01611 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01615 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0161a 90                             nop        
0161b 90                             nop        
0161c c5f877                         vzeroupper 
0161f e83c14afff                     call       0x7ff8d76cda60
01624 0f1f84001c170016               nop        dword ptr [rax + rax + 0x1600171c]
0162c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01636 4883e4f0                       and        rsp, 0xfffffffffffffff0
0163a e8a1051917                     call       0x7ff8eed6cbe0
0163f f4                             hlt        
01640 be45ffffff                     mov        esi, 0xffffff45
01645 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0164d 448b1c24                       mov        r11d, dword ptr [rsp]
01651 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01659 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0165e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01666 448b542404                     mov        r10d, dword ptr [rsp + 4]
0166b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01673 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01678 4c891424                       mov        qword ptr [rsp], r10
0167c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01681 44895c2408                     mov        dword ptr [rsp + 8], r11d
01686 48894424f8                     mov        qword ptr [rsp - 8], rax
0168b 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0168f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01693 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01698 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0169c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016a1 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016a6 90                             nop        
016a7 90                             nop        
016a8 c5f877                         vzeroupper 
016ab e8b013afff                     call       0x7ff8d76cda60
016b0 0f1f8400a8170017               nop        dword ptr [rax + rax + 0x170017a8]
016b8 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
016c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c6 e815051917                     call       0x7ff8eed6cbe0
016cb f4                             hlt        
016cc be45ffffff                     mov        esi, 0xffffff45
016d1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
016d9 448b1424                       mov        r10d, dword ptr [rsp]
016dd 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
016e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016ea 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
016f2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016f7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
016ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01704 4c891424                       mov        qword ptr [rsp], r10
01708 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0170d 4489542408                     mov        dword ptr [rsp + 8], r10d
01712 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01717 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0171c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01721 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01726 90                             nop        
01727 90                             nop        
01728 c5f877                         vzeroupper 
0172b e83013afff                     call       0x7ff8d76cda60
01730 0f1f840028180018               nop        dword ptr [rax + rax + 0x18001828]
01738 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01742 4883e4f0                       and        rsp, 0xfffffffffffffff0
01746 e895041917                     call       0x7ff8eed6cbe0
0174b f4                             hlt        
0174c 85c0                           test       eax, eax
0174e 0f84540c0000                   je         0x7ff8d7bdd3a8
01754 4c8bc0                         mov        r8, rax
01757 8b0c24                         mov        ecx, dword ptr [rsp]
0175a 89742414                       mov        dword ptr [rsp + 0x14], esi
0175e 4533c9                         xor        r9d, r9d
01761 448bd1                         mov        r10d, ecx
01764 e9c6f9ffff                     jmp        0x7ff8d7bdc12f
01769 bee4ffffff                     mov        esi, 0xffffffe4
0176e 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01776 448b1424                       mov        r10d, dword ptr [rsp]
0177a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01782 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01787 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0178f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01794 4c891424                       mov        qword ptr [rsp], r10
01798 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
0179d 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
017a2 895c2440                       mov        dword ptr [rsp + 0x40], ebx
017a6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
017aa 90                             nop        
017ab 90                             nop        
017ac c5f877                         vzeroupper 
017af e8ac12afff                     call       0x7ff8d76cda60
017b4 0f1f8400ac180019               nop        dword ptr [rax + rax + 0x190018ac]
017bc 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
017c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ca e811041917                     call       0x7ff8eed6cbe0
017cf f4                             hlt        
017d0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017d9 bee4ffffff                     mov        esi, 0xffffffe4
017de 498bea                         mov        rbp, r10
017e1 448b1424                       mov        r10d, dword ptr [rsp]
017e5 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
017ed 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017f2 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
017fa 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
017ff 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01807 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0180c 4c891424                       mov        qword ptr [rsp], r10
01810 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01815 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0181a 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0181f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01824 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01829 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0182d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01832 90                             nop        
01833 90                             nop        
01834 c5f877                         vzeroupper 
01837 e82412afff                     call       0x7ff8d76cda60
0183c 0f1f84003419001a               nop        dword ptr [rax + rax + 0x1a001934]
01844 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0184e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01852 e889031917                     call       0x7ff8eed6cbe0
01857 f4                             hlt        
01858 8beb                           mov        ebp, ebx
0185a 83c510                         add        ebp, 0x10
0185d be6effffff                     mov        esi, 0xffffff6e
01862 448b1424                       mov        r10d, dword ptr [rsp]
01866 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0186e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01873 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0187b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01880 4c891424                       mov        qword ptr [rsp], r10
01884 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01888 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0188d 90                             nop        
0188e 90                             nop        
0188f 90                             nop        
01890 c5f877                         vzeroupper 
01893 e8c811afff                     call       0x7ff8d76cda60
01898 0f1f84009019001b               nop        dword ptr [rax + rax + 0x1b001990]
018a0 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
018aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ae e82d031917                     call       0x7ff8eed6cbe0
018b3 f4                             hlt        
018b4 8beb                           mov        ebp, ebx
018b6 83c510                         add        ebp, 0x10
018b9 be66ffffff                     mov        esi, 0xffffff66
018be 448b1c24                       mov        r11d, dword ptr [rsp]
018c2 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
018ca 448b542404                     mov        r10d, dword ptr [rsp + 4]
018cf 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
018d7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018dc 4c891424                       mov        qword ptr [rsp], r10
018e0 895c2414                       mov        dword ptr [rsp + 0x14], ebx
018e4 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
018e9 90                             nop        
018ea 90                             nop        
018eb 90                             nop        
018ec c5f877                         vzeroupper 
018ef e86c11afff                     call       0x7ff8d76cda60
018f4 0f1f8400ec19001c               nop        dword ptr [rax + rax + 0x1c0019ec]
018fc 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0190a e8d1021917                     call       0x7ff8eed6cbe0
0190f f4                             hlt        
01910 be17000000                     mov        esi, 0x17
01915 90                             nop        
01916 90                             nop        
01917 90                             nop        
01918 c5f877                         vzeroupper 
0191b e84011afff                     call       0x7ff8d76cda60
01920 0f1f8400181a001d               nop        dword ptr [rax + rax + 0x1d001a18]
01928 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01932 4883e4f0                       and        rsp, 0xfffffffffffffff0
01936 e8a5021917                     call       0x7ff8eed6cbe0
0193b f4                             hlt        
0193c 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01944 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01949 eb0d                           jmp        0x7ff8d7bdc958
0194b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01953 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01958 be6effffff                     mov        esi, 0xffffff6e
0195d 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01965 4c89542408                     mov        qword ptr [rsp + 8], r10
0196a 89442410                       mov        dword ptr [rsp + 0x10], eax
0196e 897c2418                       mov        dword ptr [rsp + 0x18], edi
01972 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01977 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0197c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01981 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01985 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
0198a 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0198f 90                             nop        
01990 c5f877                         vzeroupper 
01993 e8c810afff                     call       0x7ff8d76cda60
01998 0f1f8400901a001e               nop        dword ptr [rax + rax + 0x1e001a90]
019a0 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
019aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ae e82d021917                     call       0x7ff8eed6cbe0
019b3 f4                             hlt        
019b4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
019b9 bebeffffff                     mov        esi, 0xffffffbe
019be 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
019c6 448b1424                       mov        r10d, dword ptr [rsp]
019ca 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
019d2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019d7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019df 4c895c2408                     mov        qword ptr [rsp + 8], r11
019e4 890424                         mov        dword ptr [rsp], eax
019e7 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
019ec 4489542410                     mov        dword ptr [rsp + 0x10], r10d
019f1 897c2414                       mov        dword ptr [rsp + 0x14], edi
019f5 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
019fa 894c2424                       mov        dword ptr [rsp + 0x24], ecx
019fe 90                             nop        
019ff 90                             nop        
01a00 c5f877                         vzeroupper 
01a03 e85810afff                     call       0x7ff8d76cda60
01a08 0f1f8400001b001f               nop        dword ptr [rax + rax + 0x1f001b00]
01a10 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01a1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a1e e8bd011917                     call       0x7ff8eed6cbe0
01a23 f4                             hlt        
01a24 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a29 eb8e                           jmp        0x7ff8d7bdc9b9
01a2b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a30 eb87                           jmp        0x7ff8d7bdc9b9
01a32 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a37 e97dffffff                     jmp        0x7ff8d7bdc9b9
01a3c 458bca                         mov        r9d, r10d
01a3f bee4ffffff                     mov        esi, 0xffffffe4
01a44 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01a4c 448b1c24                       mov        r11d, dword ptr [rsp]
01a50 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a58 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a5d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01a65 448b542404                     mov        r10d, dword ptr [rsp + 4]
01a6a 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01a72 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a77 4c891424                       mov        qword ptr [rsp], r10
01a7b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a80 4489542408                     mov        dword ptr [rsp + 8], r10d
01a85 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01a8a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a8f 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a93 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a98 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a9d 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01aa2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01aa7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01aac 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01ab0 c5f877                         vzeroupper 
01ab3 e8a80fafff                     call       0x7ff8d76cda60
01ab8 0f1f8400b01b0020               nop        dword ptr [rax + rax + 0x20001bb0]
01ac0 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01aca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ace e80d011917                     call       0x7ff8eed6cbe0
01ad3 f4                             hlt        
01ad4 bef6ffffff                     mov        esi, 0xfffffff6
01ad9 90                             nop        
01ada 90                             nop        
01adb 90                             nop        
01adc c5f877                         vzeroupper 
01adf e87c0fafff                     call       0x7ff8d76cda60
01ae4 0f1f8400dc1b0021               nop        dword ptr [rax + rax + 0x21001bdc]
01aec 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01af6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01afa e8e1001917                     call       0x7ff8eed6cbe0
01aff f4                             hlt        
01b00 beccffffff                     mov        esi, 0xffffffcc
01b05 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b0d 448b1c24                       mov        r11d, dword ptr [rsp]
01b11 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b19 448b542404                     mov        r10d, dword ptr [rsp + 4]
01b1e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01b26 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b2b 4c891424                       mov        qword ptr [rsp], r10
01b2f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01b33 90                             nop        
01b34 c5f877                         vzeroupper 
01b37 e8240fafff                     call       0x7ff8d76cda60
01b3c 0f1f8400341c0022               nop        dword ptr [rax + rax + 0x22001c34]
01b44 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01b4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b52 e889001917                     call       0x7ff8eed6cbe0
01b57 f4                             hlt        
01b58 bee4ffffff                     mov        esi, 0xffffffe4
01b5d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b65 448b1424                       mov        r10d, dword ptr [rsp]
01b69 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01b71 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b76 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01b7e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b83 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01b8b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b90 4c891424                       mov        qword ptr [rsp], r10
01b94 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b99 4489542408                     mov        dword ptr [rsp + 8], r10d
01b9e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01ba6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01bab 90                             nop        
01bac c5f877                         vzeroupper 
01baf e8ac0eafff                     call       0x7ff8d76cda60
01bb4 0f1f8400ac1c0023               nop        dword ptr [rax + rax + 0x23001cac]
01bbc 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01bc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bca e811001917                     call       0x7ff8eed6cbe0
01bcf f4                             hlt        
01bd0 bee4ffffff                     mov        esi, 0xffffffe4
01bd5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01bdd 448b1424                       mov        r10d, dword ptr [rsp]
01be1 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01be9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bee 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01bf6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01bfb 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c03 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c08 4c891424                       mov        qword ptr [rsp], r10
01c0c c5f877                         vzeroupper 
01c0f e84c0eafff                     call       0x7ff8d76cda60
01c14 0f1f84000c1d0024               nop        dword ptr [rax + rax + 0x24001d0c]
01c1c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e8b1ff1817                     call       0x7ff8eed6cbe0
01c2f f4                             hlt        
01c30 beccffffff                     mov        esi, 0xffffffcc
01c35 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01c3d 448b1424                       mov        r10d, dword ptr [rsp]
01c41 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01c49 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c4e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c56 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01c5b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c63 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c68 4c891424                       mov        qword ptr [rsp], r10
01c6c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c71 4489542408                     mov        dword ptr [rsp + 8], r10d
01c76 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c7b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c80 c5f877                         vzeroupper 
01c83 e8d80dafff                     call       0x7ff8d76cda60
01c88 0f1f8400801d0025               nop        dword ptr [rax + rax + 0x25001d80]
01c90 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01c9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9e e83dff1817                     call       0x7ff8eed6cbe0
01ca3 f4                             hlt        
01ca4 be6effffff                     mov        esi, 0xffffff6e
01ca9 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01cb1 448b1c24                       mov        r11d, dword ptr [rsp]
01cb5 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01cbd 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01cc2 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01cca 448b442404                     mov        r8d, dword ptr [rsp + 4]
01ccf 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01cd7 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01cdc 4489442408                     mov        dword ptr [rsp + 8], r8d
01ce1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01ce6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ceb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01cef 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01cf4 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01cf9 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01cfe 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01d03 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d08 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01d0d 897c2440                       mov        dword ptr [rsp + 0x40], edi
01d11 90                             nop        
01d12 90                             nop        
01d13 90                             nop        
01d14 c5f877                         vzeroupper 
01d17 e8440dafff                     call       0x7ff8d76cda60
01d1c 0f1f8400141e0026               nop        dword ptr [rax + rax + 0x26001e14]
01d24 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01d2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d32 e8a9fe1817                     call       0x7ff8eed6cbe0
01d37 f4                             hlt        
01d38 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
01d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d46 e895fe1817                     call       0x7ff8eed6cbe0
01d4b f4                             hlt        
01d4c 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
01d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5a e881fe1817                     call       0x7ff8eed6cbe0
01d5f f4                             hlt        
01d60 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
01d6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6e e86dfe1817                     call       0x7ff8eed6cbe0
01d73 f4                             hlt        
01d74 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
01d7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d82 e859fe1817                     call       0x7ff8eed6cbe0
01d87 f4                             hlt        
01d88 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01d90 458d5a08                       lea        r11d, [r10 + 8]
01d94 458bcb                         mov        r9d, r11d
01d97 be6effffff                     mov        esi, 0xffffff6e
01d9c 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01da4 448b1424                       mov        r10d, dword ptr [rsp]
01da8 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01db0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01db5 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01dbd 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01dc2 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01dca 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dcf 4c891424                       mov        qword ptr [rsp], r10
01dd3 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dd8 4489542408                     mov        dword ptr [rsp + 8], r10d
01ddd 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01de2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01de7 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01dec 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01df1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01df6 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01dfb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01e00 c5f877                         vzeroupper 
01e03 e8580cafff                     call       0x7ff8d76cda60
01e08 0f1f8400001f0027               nop        dword ptr [rax + rax + 0x27001f00]
01e10 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01e1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e1e e8bdfd1817                     call       0x7ff8eed6cbe0
01e23 f4                             hlt        
01e24 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01e2c 458d5a08                       lea        r11d, [r10 + 8]
01e30 458bcb                         mov        r9d, r11d
01e33 be66ffffff                     mov        esi, 0xffffff66
01e38 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e40 448b1424                       mov        r10d, dword ptr [rsp]
01e44 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01e4c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e51 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01e59 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e5e 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e66 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e6b 4c891424                       mov        qword ptr [rsp], r10
01e6f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e74 4489542408                     mov        dword ptr [rsp + 8], r10d
01e79 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01e7e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e83 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01e88 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e8d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01e92 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e97 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01e9c c5f877                         vzeroupper 
01e9f e8bc0bafff                     call       0x7ff8d76cda60
01ea4 0f1f84009c1f0028               nop        dword ptr [rax + rax + 0x28001f9c]
01eac 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eba e821fd1817                     call       0x7ff8eed6cbe0
01ebf f4                             hlt        
01ec0 beccffffff                     mov        esi, 0xffffffcc
01ec5 448b1424                       mov        r10d, dword ptr [rsp]
01ec9 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01ed1 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01ed6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01ede 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ee3 4c891424                       mov        qword ptr [rsp], r10
01ee7 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01eeb 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01ef0 c5f877                         vzeroupper 
01ef3 e8680bafff                     call       0x7ff8d76cda60
01ef8 0f1f8400f01f0029               nop        dword ptr [rax + rax + 0x29001ff0]
01f00 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0e e8cdfc1817                     call       0x7ff8eed6cbe0
01f13 f4                             hlt        
01f14 bee4ffffff                     mov        esi, 0xffffffe4
01f19 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01f21 448b1424                       mov        r10d, dword ptr [rsp]
01f25 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01f2d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f32 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01f3a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01f3f 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01f47 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f4c 4c891424                       mov        qword ptr [rsp], r10
01f50 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f55 4489542408                     mov        dword ptr [rsp + 8], r10d
01f5a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01f5f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f64 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01f69 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f6e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01f76 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f7b 90                             nop        
01f7c c5f877                         vzeroupper 
01f7f e8dc0aafff                     call       0x7ff8d76cda60
01f84 0f1f84007c20002a               nop        dword ptr [rax + rax + 0x2a00207c]
01f8c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9a e841fc1817                     call       0x7ff8eed6cbe0
01f9f f4                             hlt        
01fa0 bee4ffffff                     mov        esi, 0xffffffe4
01fa5 448b1c24                       mov        r11d, dword ptr [rsp]
01fa9 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01fb1 448b542404                     mov        r10d, dword ptr [rsp + 4]
01fb6 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01fbe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fc3 4c891424                       mov        qword ptr [rsp], r10
01fc7 90                             nop        
01fc8 c5f877                         vzeroupper 
01fcb e8900aafff                     call       0x7ff8d76cda60
01fd0 0f1f8400c820002b               nop        dword ptr [rax + rax + 0x2b0020c8]
01fd8 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
01fe2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe6 e8f5fb1817                     call       0x7ff8eed6cbe0
01feb f4                             hlt        
01fec 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01ff3 ffc5                           inc        ebp
01ff5 bee4ffffff                     mov        esi, 0xffffffe4
01ffa 448b1424                       mov        r10d, dword ptr [rsp]
01ffe 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02006 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0200b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02013 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02018 4c891424                       mov        qword ptr [rsp], r10
0201c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02021 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02026 90                             nop        
02027 90                             nop        
02028 c5f877                         vzeroupper 
0202b e8300aafff                     call       0x7ff8d76cda60
02030 0f1f84002821002c               nop        dword ptr [rax + rax + 0x2c002128]
02038 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
02042 4883e4f0                       and        rsp, 0xfffffffffffffff0
02046 e895fb1817                     call       0x7ff8eed6cbe0
0204b f4                             hlt        
0204c bee4ffffff                     mov        esi, 0xffffffe4
02051 448b1c24                       mov        r11d, dword ptr [rsp]
02055 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0205d 448b542404                     mov        r10d, dword ptr [rsp + 4]
02062 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0206a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0206f 4c891424                       mov        qword ptr [rsp], r10
02073 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02078 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0207d 90                             nop        
0207e 90                             nop        
0207f 90                             nop        
02080 c5f877                         vzeroupper 
02083 e8d809afff                     call       0x7ff8d76cda60
02088 0f1f84008021002d               nop        dword ptr [rax + rax + 0x2d002180]
02090 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0209a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209e e83dfb1817                     call       0x7ff8eed6cbe0
020a3 f4                             hlt        
020a4 bee4ffffff                     mov        esi, 0xffffffe4
020a9 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
020b1 448b1c24                       mov        r11d, dword ptr [rsp]
020b5 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
020bd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020c2 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
020ca 448b542404                     mov        r10d, dword ptr [rsp + 4]
020cf 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
020d7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020dc 4c891424                       mov        qword ptr [rsp], r10
020e0 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
020e5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
020ea 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
020ef 4489542420                     mov        dword ptr [rsp + 0x20], r10d
020f4 c5f877                         vzeroupper 
020f7 e86409afff                     call       0x7ff8d76cda60
020fc 0f1f8400f421002e               nop        dword ptr [rax + rax + 0x2e0021f4]
02104 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0210e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02112 e8c9fa1817                     call       0x7ff8eed6cbe0
02117 f4                             hlt        
02118 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
02122 4883e4f0                       and        rsp, 0xfffffffffffffff0
02126 e8b5fa1817                     call       0x7ff8eed6cbe0
0212b f4                             hlt        
0212c 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
02136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213a e8a1fa1817                     call       0x7ff8eed6cbe0
0213f f4                             hlt        
02140 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
0214a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0214e e88dfa1817                     call       0x7ff8eed6cbe0
02153 f4                             hlt        
02154 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
0215e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02162 e879fa1817                     call       0x7ff8eed6cbe0
02167 f4                             hlt        
02168 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
02172 4883e4f0                       and        rsp, 0xfffffffffffffff0
02176 e865fa1817                     call       0x7ff8eed6cbe0
0217b f4                             hlt        
0217c 48bfd0d738b0f87f0000           movabs     rdi, 0x7ff8b038d7d0
02186 4883e4f0                       and        rsp, 0xfffffffffffffff0
0218a e851fa1817                     call       0x7ff8eed6cbe0
0218f f4                             hlt        
02190 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
02198 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
021a0 bef6ffffff                     mov        esi, 0xfffffff6
021a5 498beb                         mov        rbp, r11
021a8 44898c24e0000000               mov        dword ptr [rsp + 0xe0], r9d
021b0 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
021b8 c5f877                         vzeroupper 
021bb e8a008afff                     call       0x7ff8d76cda60
021c0 0f1f8400b822002f               nop        dword ptr [rax + rax + 0x2f0022b8]
021c8 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
021d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021d6 e805fa1817                     call       0x7ff8eed6cbe0
021db f4                             hlt        
021dc 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
021e1 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
021e9 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
021ed beccffffff                     mov        esi, 0xffffffcc
021f2 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
021fa 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
02202 898c24ec000000                 mov        dword ptr [rsp + 0xec], ecx
02209 48891c24                       mov        qword ptr [rsp], rbx
0220d 4c89442410                     mov        qword ptr [rsp + 0x10], r8
02212 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02217 90                             nop        
02218 c5f877                         vzeroupper 
0221b e84008afff                     call       0x7ff8d76cda60
02220 0f1f840018230030               nop        dword ptr [rax + rax + 0x30002318]
02228 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
02232 4883e4f0                       and        rsp, 0xfffffffffffffff0
02236 e8a5f91817                     call       0x7ff8eed6cbe0
0223b f4                             hlt        
0223c beccffffff                     mov        esi, 0xffffffcc
02241 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
02249 448b1424                       mov        r10d, dword ptr [rsp]
0224d 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02255 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0225a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02262 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02267 4c891424                       mov        qword ptr [rsp], r10
0226b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0226f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02274 c5f877                         vzeroupper 
02277 e8e407afff                     call       0x7ff8d76cda60
0227c 0f1f840074230031               nop        dword ptr [rax + rax + 0x31002374]
02284 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0228e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02292 e849f91817                     call       0x7ff8eed6cbe0
02297 f4                             hlt        
02298 beccffffff                     mov        esi, 0xffffffcc
0229d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
022a5 448b1424                       mov        r10d, dword ptr [rsp]
022a9 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
022b1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022b6 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
022be 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
022c3 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
022cb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
022d0 4c891424                       mov        qword ptr [rsp], r10
022d4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
022d9 4489542408                     mov        dword ptr [rsp + 8], r10d
022de 895c240c                       mov        dword ptr [rsp + 0xc], ebx
022e2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
022e7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
022ec 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
022f1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
022f6 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
022fb 90                             nop        
022fc c5f877                         vzeroupper 
022ff e85c07afff                     call       0x7ff8d76cda60
02304 0f1f8400fc230032               nop        dword ptr [rax + rax + 0x320023fc]
0230c 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
02316 4883e4f0                       and        rsp, 0xfffffffffffffff0
0231a e8c1f81817                     call       0x7ff8eed6cbe0
0231f f4                             hlt        
02320 beccffffff                     mov        esi, 0xffffffcc
02325 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0232d 448b1c24                       mov        r11d, dword ptr [rsp]
02331 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02339 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0233e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02346 448b542404                     mov        r10d, dword ptr [rsp + 4]
0234b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02353 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02358 4c891424                       mov        qword ptr [rsp], r10
0235c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02361 44895c2408                     mov        dword ptr [rsp + 8], r11d
02366 895c240c                       mov        dword ptr [rsp + 0xc], ebx
0236a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0236f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02374 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
02379 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0237e 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
02383 90                             nop        
02384 c5f877                         vzeroupper 
02387 e8d406afff                     call       0x7ff8d76cda60
0238c 0f1f840084240033               nop        dword ptr [rax + rax + 0x33002484]
02394 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
0239e 4883e4f0                       and        rsp, 0xfffffffffffffff0
023a2 e839f81817                     call       0x7ff8eed6cbe0
023a7 f4                             hlt        
023a8 448b1424                       mov        r10d, dword ptr [rsp]
023ac 89742414                       mov        dword ptr [rsp + 0x14], esi
023b0 4533c9                         xor        r9d, r9d
023b3 e9e8fdffff                     jmp        0x7ff8d7bdd1a0
023b8 bef6ffffff                     mov        esi, 0xfffffff6
023bd 90                             nop        
023be 90                             nop        
023bf 90                             nop        
023c0 c5f877                         vzeroupper 
023c3 e89806afff                     call       0x7ff8d76cda60
023c8 0f1f8400c0240034               nop        dword ptr [rax + rax + 0x340024c0]
023d0 48bf10ee5fb0f87f0000           movabs     rdi, 0x7ff8b05fee10
023da 4883e4f0                       and        rsp, 0xfffffffffffffff0
023de e8fdf71817                     call       0x7ff8eed6cbe0
023e3 f4                             hlt        
023e4 eb14                           jmp        0x7ff8d7bdd3fa
023e6 eb12                           jmp        0x7ff8d7bdd3fa
023e8 eb10                           jmp        0x7ff8d7bdd3fa
023ea eb0e                           jmp        0x7ff8d7bdd3fa
023ec eb0c                           jmp        0x7ff8d7bdd3fa
023ee eb0a                           jmp        0x7ff8d7bdd3fa
023f0 eb08                           jmp        0x7ff8d7bdd3fa
023f2 eb06                           jmp        0x7ff8d7bdd3fa
023f4 eb04                           jmp        0x7ff8d7bdd3fa
023f6 eb02                           jmp        0x7ff8d7bdd3fa
023f8 eb00                           jmp        0x7ff8d7bdd3fa
023fa 488bf0                         mov        rsi, rax
023fd e98ae2ffff                     jmp        0x7ff8d7bdb68c
02402 49baa2c1bdd7f87f0000           movabs     r10, 0x7ff8d7bdc1a2
0240c 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02413 e9484fb5ff                     jmp        0x7ff8d7732360
02418 e8c31db4ff                     call       0x7ff8d771f1e0
0241d e91cdcffff                     jmp        0x7ff8d7bdb03e
02422 f4                             hlt        
02423 f4                             hlt        
02424 f4                             hlt        
02425 f4                             hlt        
02426 f4                             hlt        
02427 f4                             hlt        
