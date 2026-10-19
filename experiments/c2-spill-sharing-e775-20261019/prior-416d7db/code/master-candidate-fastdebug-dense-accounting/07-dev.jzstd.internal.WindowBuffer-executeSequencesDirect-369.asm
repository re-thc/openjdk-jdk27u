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
0001a 0f854087b5ff                   jne        0x7f56af72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f854c1c0000                   jne        0x7f56afbd828a
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bd7                         mov        r10d, edi
0004e 488bde                         mov        rbx, rsi
00051 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00055 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0005a 448b5e04                       mov        r11d, dword ptr [rsi + 4]
0005e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00063 452bd8                         sub        r11d, r8d
00066 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0006e 453bc3                         cmp        r8d, r11d
00071 0f8fd6120000                   jg         0x7f56afbd794d
00077 488b6e08                       mov        rbp, qword ptr [rsi + 8]
0007b 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007f 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00087 4c63442418                     movsxd     r8, dword ptr [rsp + 0x18]
0008c 4c03c5                         add        r8, rbp
0008f 4d2bd8                         sub        r11, r8
00092 4d3bcb                         cmp        r9, r11
00095 0f8fb2120000                   jg         0x7f56afbd794d
0009b 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009f 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a3 4d85ed                         test       r13, r13
000a6 0f84000d0000                   je         0x7f56afbd73ac
000ac 33ff                           xor        edi, edi
000ae 4c8bda                         mov        r11, rdx
000b1 8b4204                         mov        eax, dword ptr [rdx + 4]
000b4 448b4640                       mov        r8d, dword ptr [rsi + 0x40]
000b8 458bca                         mov        r9d, r10d
000bb 4585d2                         test       r10d, r10d
000be 0f8e7c120000                   jle        0x7f56afbd7940
000c4 4c2bed                         sub        r13, rbp
000c7 8d48e0                         lea        ecx, [rax - 0x20]
000ca 8b542460                       mov        edx, dword ptr [rsp + 0x60]
000ce 83c2e0                         add        edx, -0x20
000d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d6 418b7204                       mov        esi, dword ptr [r10 + 4]
000da 85f6                           test       esi, esi
000dc 0f86a3120000                   jbe        0x7f56afbd7985
000e2 89542428                       mov        dword ptr [rsp + 0x28], edx
000e6 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
000ea 89442404                       mov        dword ptr [rsp + 4], eax
000ee 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f3 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f8 48896c2420                     mov        qword ptr [rsp + 0x20], rbp
000fd 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
00102 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0010a 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
0010f 4c63d6                         movsxd     r10, esi
00112 4d63d9                         movsxd     r11, r9d
00115 49ffcb                         dec        r11
00118 4d3bda                         cmp        r11, r10
0011b 0f8357120000                   jae        0x7f56afbd7978
00121 85ff                           test       edi, edi
00123 0f84cb120000                   je         0x7f56afbd79f4
00129 448d58f1                       lea        r11d, [rax - 0xf]
0012d 4585db                         test       r11d, r11d
00130 0f8cd0120000                   jl         0x7f56afbd7a06
00136 458b5804                       mov        r11d, dword ptr [r8 + 4]
0013a 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0013f 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00144 897c2464                       mov        dword ptr [rsp + 0x64], edi
00148 458d53f1                       lea        r10d, [r11 - 0xf]
0014c 4585d2                         test       r10d, r10d
0014f 0f8cc3120000                   jl         0x7f56afbd7a18
00155 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0015d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00161 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00166 4585db                         test       r11d, r11d
00169 0f86bb120000                   jbe        0x7f56afbd7a2a
0016f 4183fb01                       cmp        r11d, 1
00173 0f86b1120000                   jbe        0x7f56afbd7a2a
00179 4183fb02                       cmp        r11d, 2
0017d 0f86a7120000                   jbe        0x7f56afbd7a2a
00183 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00188 4183c3f9                       add        r11d, -7
0018c 4585db                         test       r11d, r11d
0018f 0f8c95120000                   jl         0x7f56afbd7a2a
00195 448bd0                         mov        r10d, eax
00198 4d8bd8                         mov        r11, r8
0019b 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
001a0 4183c2f1                       add        r10d, -0xf
001a4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
001a9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
001ae 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
001b3 458d5af1                       lea        r11d, [r10 - 0xf]
001b7 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001bc 4533d2                         xor        r10d, r10d
001bf 33c9                           xor        ecx, ecx
001c1 e9b7010000                     jmp        0x7f56afbd697d
001c6 4533db                         xor        r11d, r11d
001c9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
001ce 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001d6 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
001da 448bda                         mov        r11d, edx
001dd 4183fb03                       cmp        r11d, 3
001e1 0f8e2d020000                   jle        0x7f56afbd6a14
001e7 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001ef 45894310                       mov        dword ptr [r11 + 0x10], r8d
001f3 458b5b08                       mov        r11d, dword ptr [r11 + 8]
001f7 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
001ff 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00203 448d5afd                       lea        r11d, [rdx - 3]
00207 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0020c 45895808                       mov        dword ptr [r8 + 8], r11d
00210 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00217 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
0021c 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00221 48034c2420                     add        rcx, qword ptr [rsp + 0x20]
00226 4c634c2430                     movsxd     r9, dword ptr [rsp + 0x30]
0022b 4903c9                         add        rcx, r9
0022e 4c3bd9                         cmp        r11, rcx
00231 0f8f490e0000                   jg         0x7f56afbd7680
00237 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0023c 4585c0                         test       r8d, r8d
0023f 0f8e6b0d0000                   jle        0x7f56afbd75b0
00245 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0024a 4403442430                     add        r8d, dword ptr [rsp + 0x30]
0024f 4403442434                     add        r8d, dword ptr [rsp + 0x34]
00254 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00259 0f8f990e0000                   jg         0x7f56afbd76f8
0025f 458bda                         mov        r11d, r10d
00262 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
00267 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0026c 0f8f220f0000                   jg         0x7f56afbd7794
00272 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00277 4183f810                       cmp        r8d, 0x10
0027b 0f8faf0f0000                   jg         0x7f56afbd7830
00281 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00286 0f833d0b0000                   jae        0x7f56afbd73c9
0028c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00294 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0029b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002a0 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
002a5 0f83890b0000                   jae        0x7f56afbd7434
002ab 4503c2                         add        r8d, r10d
002ae 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
002b6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002bb 418bca                         mov        ecx, r10d
002be 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002c3 4503da                         add        r11d, r10d
002c6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
002cb 4d63c2                         movsxd     r8, r10d
002ce 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002d3 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
002da 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
002df 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002e7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002ec 4183fa10                       cmp        r10d, 0x10
002f0 0f8fce0f0000                   jg         0x7f56afbd78c4
002f6 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002fb 4183fb10                       cmp        r11d, 0x10
002ff 0f8c07020000                   jl         0x7f56afbd6b0c
00305 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0030d 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00312 0f83900b0000                   jae        0x7f56afbd74a8
00318 458bda                         mov        r11d, r10d
0031b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00320 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00327 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0032c 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00331 0f83ed0b0000                   jae        0x7f56afbd7524
00337 448bd1                         mov        r10d, ecx
0033a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0033f 4d63c2                         movsxd     r8, r10d
00342 478d0c13                       lea        r9d, [r11 + r10]
00346 44034c2434                     add        r9d, dword ptr [rsp + 0x34]
0034b 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
00350 4d63db                         movsxd     r11, r11d
00353 4d03d8                         add        r11, r8
00356 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0035b c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00362 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
00369 ffc1                           inc        ecx
0036b 3b4c2410                       cmp        ecx, dword ptr [rsp + 0x10]
0036f 0f8d81080000                   jge        0x7f56afbd71f6
00375 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0037d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00382 4d8b44cb08                     mov        r8, qword ptr [r11 + rcx*8 + 8]
00387 458bd8                         mov        r11d, r8d
0038a 4181e3ffff0100                 and        r11d, 0x1ffff
00391 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00396 4d8bd8                         mov        r11, r8
00399 49c1fb24                       sar        r11, 0x24
0039d 49c1e812                       shr        r8, 0x12
003a1 458bdb                         mov        r11d, r11d
003a4 418bd3                         mov        edx, r11d
003a7 458bc0                         mov        r8d, r8d
003aa 4181e0ffff0300                 and        r8d, 0x3ffff
003b1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
003b6 4585db                         test       r11d, r11d
003b9 0f8c250c0000                   jl         0x7f56afbd75e4
003bf 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
003c4 4585c9                         test       r9d, r9d
003c7 0f84f9fdffff                   je         0x7f56afbd67c6
003cd 448b1c24                       mov        r11d, dword ptr [rsp]
003d1 452bda                         sub        r11d, r10d
003d4 453bcb                         cmp        r9d, r11d
003d7 0f8ef1fdffff                   jle        0x7f56afbd67ce
003dd be45ffffff                     mov        esi, 0xffffff45
003e2 418be9                         mov        ebp, r9d
003e5 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
003ed 90                             nop        
003ee 90                             nop        
003ef 90                             nop        
003f0 c5f877                         vzeroupper 
003f3 e86870afff                     call       0x7f56af6cda60
003f8 0f1f8400f0040000               nop        dword ptr [rax + rax + 0x4f0]
00400 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
0040a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0040e e8cd9ac417                     call       0x7f56c78204e0
00413 f4                             hlt        
00414 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00419 4585db                         test       r11d, r11d
0041c 7407                           je         0x7f56afbd6a25
0041e 448d5aff                       lea        r11d, [rdx - 1]
00422 418bd3                         mov        edx, r11d
00425 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0042d 458b4b08                       mov        r9d, dword ptr [r11 + 8]
00431 85d2                           test       edx, edx
00433 0f84db080000                   je         0x7f56afbd7314
00439 83fa03                         cmp        edx, 3
0043c 0f84de080000                   je         0x7f56afbd7320
00442 83fa02                         cmp        edx, 2
00445 0f8783000000                   ja         0x7f56afbd6ace
0044b 3b54243c                       cmp        edx, dword ptr [rsp + 0x3c]
0044f 0f8337100000                   jae        0x7f56afbd7a8c
00455 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0045d 458b4c9008                     mov        r9d, dword ptr [r8 + rdx*4 + 8]
00462 85d2                           test       edx, edx
00464 7f1d                           jg         0x7f56afbd6a83
00466 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0046d 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00475 45894b08                       mov        dword ptr [r11 + 8], r9d
00479 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
0047e e994fdffff                     jmp        0x7f56afbd6817
00483 448d5aff                       lea        r11d, [rdx - 1]
00487 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0048c 0f837a130000                   jae        0x7f56afbd7e0c
00492 4863da                         movsxd     rbx, edx
00495 458bd8                         mov        r11d, r8d
00498 4183c3cc                       add        r11d, -0x34
0049c 41c1eb02                       shr        r11d, 2
004a0 458d4413ff                     lea        r8d, [r11 + rdx - 1]
004a5 41bb04000000                   mov        r11d, 4
004ab c442a0f5d8                     bzhi       r11, r8, r11
004b0 492bdb                         sub        rbx, r11
004b3 48ffcb                         dec        rbx
004b6 4533db                         xor        r11d, r11d
004b9 4885db                         test       rbx, rbx
004bc 490f4cdb                       cmovl      rbx, r11
004c0 8bfb                           mov        edi, ebx
004c2 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
004c9 e964050000                     jmp        0x7f56afbd7032
004ce 894c2404                       mov        dword ptr [rsp + 4], ecx
004d2 48bea82574e200000000           movabs     rsi, 0xe27425a8
004dc 418bea                         mov        ebp, r10d
004df 90                             nop        
004e0 c5f877                         vzeroupper 
004e3 e87891b5ff                     call       0x7f56af72fc60
004e8 0f1f8400e0050001               nop        dword ptr [rax + rax + 0x10005e0]
004f0 4885c0                         test       rax, rax
004f3 0f843b100000                   je         0x7f56afbd7b34
004f9 488bf0                         mov        rsi, rax
004fc c5f877                         vzeroupper 
004ff 4881c4b0000000                 add        rsp, 0xb0
00506 5d                             pop        rbp
00507 e95428afff                     jmp        0x7f56af6c9360
0050c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00511 4403542434                     add        r10d, dword ptr [rsp + 0x34]
00516 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0051b 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00520 0f8d9a020000                   jge        0x7f56afbd6dc0
00526 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0052b 4183c208                       add        r10d, 8
0052f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00537 4183fb08                       cmp        r11d, 8
0053b 0f8d90010000                   jge        0x7f56afbd6cd1
00541 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00549 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
0054e 0f83b4130000                   jae        0x7f56afbd7f08
00554 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00559 430fbe6c1008                   movsx      ebp, byte ptr [r8 + r10 + 8]
0055f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00564 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00569 0f8321140000                   jae        0x7f56afbd7f90
0056f 4c63d1                         movsxd     r10, ecx
00572 4c635c2430                     movsxd     r11, dword ptr [rsp + 0x30]
00577 4d03da                         add        r11, r10
0057a 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
0057f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00587 4183c203                       add        r10d, 3
0058b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00590 41ffc3                         inc        r11d
00593 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
0059b 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005a0 0f8332140000                   jae        0x7f56afbd7fd8
005a6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005ab 4183c203                       add        r10d, 3
005af 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
005b7 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
005bd 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005c2 0f836c140000                   jae        0x7f56afbd8034
005c8 4c63d1                         movsxd     r10, ecx
005cb 4c63442430                     movsxd     r8, dword ptr [rsp + 0x30]
005d0 4d03c2                         add        r8, r10
005d3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
005d8 43886c0209                     mov        byte ptr [r10 + r8 + 9], bpl
005dd 470fbe541a0a                   movsx      r10d, byte ptr [r10 + r11 + 0xa]
005e3 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
005e8 478854010a                     mov        byte ptr [r9 + r8 + 0xa], r10b
005ed 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
005f3 47885c010b                     mov        byte ptr [r9 + r8 + 0xb], r11b
005f8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
005fd 4183fb08                       cmp        r11d, 8
00601 0f8381140000                   jae        0x7f56afbd8088
00607 49bae85e72e200000000           movabs     r10, 0xe2725ee8
00611 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00619 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
0061e 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00623 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00628 4183fa04                       cmp        r10d, 4
0062c 7e3e                           jle        0x7f56afbd6c6c
0062e 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00632 83c504                         add        ebp, 4
00635 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0063a 418bd1                         mov        edx, r9d
0063d 90                             nop        
0063e 90                             nop        
0063f 90                             nop        
00640 c5f877                         vzeroupper 
00643 e81890b5ff                     call       0x7f56af72fc60
00648 0f1f840040070002               nop        dword ptr [rax + rax + 0x2000740]
00650 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00655 8bd5                           mov        edx, ebp
00657 8bc8                           mov        ecx, eax
00659 90                             nop        
0065a 90                             nop        
0065b 90                             nop        
0065c c5f877                         vzeroupper 
0065f e8fc8fb5ff                     call       0x7f56af72fc60
00664 0f1f84005c070003               nop        dword ptr [rax + rax + 0x300075c]
0066c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00671 4183fa08                       cmp        r10d, 8
00675 0f8ee7fcffff                   jle        0x7f56afbd6962
0067b 49ba105f72e200000000           movabs     r10, 0xe2725f10
00685 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00689 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0068e 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00693 83c208                         add        edx, 8
00696 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0069b 90                             nop        
0069c c5f877                         vzeroupper 
0069f e8bc8fb5ff                     call       0x7f56af72fc60
006a4 0f1f84009c070004               nop        dword ptr [rax + rax + 0x400079c]
006ac 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006b1 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
006b8 488bc8                         mov        rcx, rax
006bb 90                             nop        
006bc c5f877                         vzeroupper 
006bf e89c8fb5ff                     call       0x7f56af72fc60
006c4 0f1f8400bc070005               nop        dword ptr [rax + rax + 0x50007bc]
006cc e991fcffff                     jmp        0x7f56afbd6962
006d1 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006d6 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
006dd 90                             nop        
006de 90                             nop        
006df 90                             nop        
006e0 c5f877                         vzeroupper 
006e3 e8788fb5ff                     call       0x7f56af72fc60
006e8 0f1f8400e0070006               nop        dword ptr [rax + rax + 0x60007e0]
006f0 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006f5 8b542438                       mov        edx, dword ptr [rsp + 0x38]
006f9 488bc8                         mov        rcx, rax
006fc c5f877                         vzeroupper 
006ff e85c8fb5ff                     call       0x7f56af72fc60
00704 0f1f8400fc070007               nop        dword ptr [rax + rax + 0x70007fc]
0070c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00714 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00719 0f8d43fcffff                   jge        0x7f56afbd6962
0071f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00724 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0072b 0f8e87050000                   jle        0x7f56afbd72b8
00731 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00739 4183c008                       add        r8d, 8
0073d be66ffffff                     mov        esi, 0xffffff66
00742 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0074a 448b1c24                       mov        r11d, dword ptr [rsp]
0074e 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00756 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0075b 4c891424                       mov        qword ptr [rsp], r10
0075f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00764 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0076c 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00771 44895c2408                     mov        dword ptr [rsp + 8], r11d
00776 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0077b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00780 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00785 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0078a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0078f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00794 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00799 90                             nop        
0079a 90                             nop        
0079b 90                             nop        
0079c c5f877                         vzeroupper 
0079f e8bc6cafff                     call       0x7f56af6cda60
007a4 0f1f84009c080008               nop        dword ptr [rax + rax + 0x800089c]
007ac 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
007b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ba e82197c417                     call       0x7f56c78204e0
007bf f4                             hlt        
007c0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
007c5 4183fa30                       cmp        r10d, 0x30
007c9 0f8fdd010000                   jg         0x7f56afbd6fac
007cf 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
007d3 83c5f9                         add        ebp, -7
007d6 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007da 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
007e2 443bd5                         cmp        r10d, ebp
007e5 0f83750d0000                   jae        0x7f56afbd7b60
007eb 418bea                         mov        ebp, r10d
007ee 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
007f5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
007fa 498b6c2b08                     mov        rbp, qword ptr [r11 + rbp + 8]
007ff 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
00807 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0080c 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00811 0f83dd0d0000                   jae        0x7f56afbd7bf4
00817 448bd1                         mov        r10d, ecx
0081a 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00822 4d63d2                         movsxd     r10, r10d
00825 8b6c2430                       mov        ebp, dword ptr [rsp + 0x30]
00829 4c63dd                         movsxd     r11, ebp
0082c 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
00831 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
0083b 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00840 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00848 4533c9                         xor        r9d, r9d
0084b 90                             nop        
0084c c5f877                         vzeroupper 
0084f e80c84b5ff                     call       0x7f56af72f260
00854 0f1f84004c090009               nop        dword ptr [rax + rax + 0x900094c]
0085c 03ac2490000000                 add        ebp, dword ptr [rsp + 0x90]
00863 896c2438                       mov        dword ptr [rsp + 0x38], ebp
00867 448d5d08                       lea        r11d, [rbp + 8]
0086b 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00873 458bd3                         mov        r10d, r11d
00876 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
0087b 0f8d17010000                   jge        0x7f56afbd6f98
00881 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00889 442bc5                         sub        r8d, ebp
0088c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00891 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
00896 4983c0f9                       add        r8, -7
0089a 48634c2430                     movsxd     rcx, dword ptr [rsp + 0x30]
0089f 4d63cb                         movsxd     r9, r11d
008a2 4d8d1c09                       lea        r11, [r9 + rcx]
008a6 4d3bd8                         cmp        r11, r8
008a9 0f833d0e0000                   jae        0x7f56afbd7cec
008af 4c635c2418                     movsxd     r11, dword ptr [rsp + 0x18]
008b4 4d2bd9                         sub        r11, r9
008b7 4983c307                       add        r11, 7
008bb 4983e3f8                       and        r11, 0xfffffffffffffff8
008bf 458bdb                         mov        r11d, r11d
008c2 458d5c2b08                     lea        r11d, [r11 + rbp + 8]
008c7 4d63db                         movsxd     r11, r11d
008ca 4e8d4c19f8                     lea        r9, [rcx + r11 - 8]
008cf 4d3bc8                         cmp        r9, r8
008d2 0f83140e0000                   jae        0x7f56afbd7cec
008d8 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
008dd 0f83090e0000                   jae        0x7f56afbd7cec
008e3 4983c3f8                       add        r11, -8
008e7 4d3bd8                         cmp        r11, r8
008ea 0f83fc0d0000                   jae        0x7f56afbd7cec
008f0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
008f5 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
008fc 0f8f7a0e0000                   jg         0x7f56afbd7d7c
00902 90                             nop        
00903 90                             nop        
00904 90                             nop        
00905 90                             nop        
00906 90                             nop        
00907 90                             nop        
00908 90                             nop        
00909 90                             nop        
0090a 90                             nop        
0090b 90                             nop        
0090c 90                             nop        
0090d 90                             nop        
0090e 90                             nop        
0090f 90                             nop        
00910 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00918 4963ca                         movsxd     rcx, r10d
0091b 4883c108                       add        rcx, 8
0091f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00926 036c2430                       add        ebp, dword ptr [rsp + 0x30]
0092a 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0092f 4d8b442b08                     mov        r8, qword ptr [r11 + rbp + 8]
00934 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
0093e 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00943 4533c9                         xor        r9d, r9d
00946 90                             nop        
00947 90                             nop        
00948 c5f877                         vzeroupper 
0094b e81083b5ff                     call       0x7f56af72f260
00950 0f1f8400480a000a               nop        dword ptr [rax + rax + 0xa000a48]
00958 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00960 4183c208                       add        r10d, 8
00964 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0096c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00971 7c9d                           jl         0x7f56afbd6f10
00973 eb23                           jmp        0x7f56afbd6f98
00975 458bd3                         mov        r10d, r11d
00978 4d63d2                         movsxd     r10, r10d
0097b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00982 c442a8f5db                     bzhi       r11, r11, r10
00987 c4c1fb92fb                     kmovq      k7, r11
0098c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00992 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00998 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0099d 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
009a2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
009a7 e9b6f9ffff                     jmp        0x7f56afbd6962
009ac 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009b4 4585d2                         test       r10d, r10d
009b7 0f8cb30c0000                   jl         0x7f56afbd7c70
009bd 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
009c1 85c9                           test       ecx, ecx
009c3 0f8ca70c0000                   jl         0x7f56afbd7c70
009c9 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009ce 4503da                         add        r11d, r10d
009d1 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
009d5 413bcb                         cmp        ecx, r11d
009d8 0f82920c0000                   jb         0x7f56afbd7c70
009de 3b4c2418                       cmp        ecx, dword ptr [rsp + 0x18]
009e2 0f82880c0000                   jb         0x7f56afbd7c70
009e8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009ed 4585db                         test       r11d, r11d
009f0 74a6                           je         0x7f56afbd6f98
009f2 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
009f6 4a8d7c1108                     lea        rdi, [rcx + r10 + 8]
009fb 4d03c8                         add        r9, r8
009fe 4a8d740908                     lea        rsi, [rcx + r9 + 8]
00a03 4963d3                         movsxd     rdx, r11d
00a06 4883fa20                       cmp        rdx, 0x20
00a0a 0f8665ffffff                   jbe        0x7f56afbd6f75
00a10 c5f877                         vzeroupper 
00a13 49ba409171af567f0000           movabs     r10, 0x7f56af719140
00a1d 41ffd2                         call       r10
00a20 0f1f840000000000               nop        dword ptr [rax + rax]
00a28 e96bffffff                     jmp        0x7f56afbd6f98
00a2d 90                             nop        
00a2e 90                             nop        
00a2f 90                             nop        
00a30 8bd3                           mov        edx, ebx
00a32 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00a3a 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00a3f 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00a47 4489449108                     mov        dword ptr [rcx + rdx*4 + 8], r8d
00a4c 8d5aff                         lea        ebx, [rdx - 1]
00a4f 3bdf                           cmp        ebx, edi
00a51 7fdd                           jg         0x7f56afbd7030
00a53 4c6344243c                     movsxd     r8, dword ptr [rsp + 0x3c]
00a58 83fb3f                         cmp        ebx, 0x3f
00a5b 0f8e12010000                   jle        0x7f56afbd7173
00a61 4c63da                         movsxd     r11, edx
00a64 4983c3fe                       add        r11, -2
00a68 4d3bd8                         cmp        r11, r8
00a6b 0f83470e0000                   jae        0x7f56afbd7eb8
00a71 8d4abf                         lea        ecx, [rdx - 0x41]
00a74 3b4c243c                       cmp        ecx, dword ptr [rsp + 0x3c]
00a78 0f834e0e0000                   jae        0x7f56afbd7ecc
00a7e 3b5c243c                       cmp        ebx, dword ptr [rsp + 0x3c]
00a82 0f83580e0000                   jae        0x7f56afbd7ee0
00a88 448d5ac0                       lea        r11d, [rdx - 0x40]
00a8c 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00a91 0f835d0e0000                   jae        0x7f56afbd7ef4
00a97 448bda                         mov        r11d, edx
00a9a 41ffcb                         dec        r11d
00a9d 418bfb                         mov        edi, r11d
00aa0 eb10                           jmp        0x7f56afbd70b2
00aa2 90                             nop        
00aa3 90                             nop        
00aa4 90                             nop        
00aa5 90                             nop        
00aa6 90                             nop        
00aa7 90                             nop        
00aa8 90                             nop        
00aa9 90                             nop        
00aaa 90                             nop        
00aab 90                             nop        
00aac 90                             nop        
00aad 90                             nop        
00aae 90                             nop        
00aaf 90                             nop        
00ab0 8bfb                           mov        edi, ebx
00ab2 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00aba 62f17e486f84b9c8ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rdi*4 - 0x38]
00ac5 62f17e487f84b9ccffffff         vmovdqu32  zmmword ptr [rcx + rdi*4 - 0x34], zmm0
00ad0 62f17e486f84b988ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rdi*4 - 0x78]
00adb 62f17e487f84b98cffffff         vmovdqu32  zmmword ptr [rcx + rdi*4 - 0x74], zmm0
00ae6 62f17e486f84b948ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rdi*4 - 0xb8]
00af1 62f17e487f84b94cffffff         vmovdqu32  zmmword ptr [rcx + rdi*4 - 0xb4], zmm0
00afc 62f17e486f84b908ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rdi*4 - 0xf8]
00b07 62f17e487f84b90cffffff         vmovdqu32  zmmword ptr [rcx + rdi*4 - 0xf4], zmm0
00b12 8d5fc0                         lea        ebx, [rdi - 0x40]
00b15 83fb3f                         cmp        ebx, 0x3f
00b18 7f96                           jg         0x7f56afbd70b0
00b1a 83fb0f                         cmp        ebx, 0xf
00b1d 7e54                           jle        0x7f56afbd7173
00b1f 448bdf                         mov        r11d, edi
00b22 418d5bb0                       lea        ebx, [r11 - 0x50]
00b26 3b5c243c                       cmp        ebx, dword ptr [rsp + 0x3c]
00b2a 0f8348100000                   jae        0x7f56afbd8178
00b30 4183c3b1                       add        r11d, -0x4f
00b34 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00b39 0f8361100000                   jae        0x7f56afbd81a0
00b3f 448bdf                         mov        r11d, edi
00b42 4183c3c0                       add        r11d, -0x40
00b46 90                             nop        
00b47 90                             nop        
00b48 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00b50 62b17e486f8499c8ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + r11*4 - 0x38]
00b5b 62b17e487f8499ccffffff         vmovdqu32  zmmword ptr [rcx + r11*4 - 0x34], zmm0
00b66 4183c3f0                       add        r11d, -0x10
00b6a 4183fb0f                       cmp        r11d, 0xf
00b6e 7fd8                           jg         0x7f56afbd7148
00b70 418bdb                         mov        ebx, r11d
00b73 85db                           test       ebx, ebx
00b75 0f8ef2f8ffff                   jle        0x7f56afbd6a6d
00b7b 4c63db                         movsxd     r11, ebx
00b7e 49ffcb                         dec        r11
00b81 4d3bd8                         cmp        r11, r8
00b84 0f83da0f0000                   jae        0x7f56afbd8164
00b8a 448bc3                         mov        r8d, ebx
00b8d 458d58ff                       lea        r11d, [r8 - 1]
00b91 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00b96 0f83f00f0000                   jae        0x7f56afbd818c
00b9c 3b5c243c                       cmp        ebx, dword ptr [rsp + 0x3c]
00ba0 0f830e100000                   jae        0x7f56afbd81b4
00ba6 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00bab 0f8317100000                   jae        0x7f56afbd81c8
00bb1 90                             nop        
00bb2 90                             nop        
00bb3 90                             nop        
00bb4 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00bbc 458b449b04                     mov        r8d, dword ptr [r11 + rbx*4 + 4]
00bc1 4589449b08                     mov        dword ptr [r11 + rbx*4 + 8], r8d
00bc6 ffcb                           dec        ebx
00bc8 85db                           test       ebx, ebx
00bca 7fe8                           jg         0x7f56afbd71b4
00bcc e99cf8ffff                     jmp        0x7f56afbd6a6d
00bd1 4d63d2                         movsxd     r10, r10d
00bd4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bdb c442a8f5db                     bzhi       r11, r11, r10
00be0 c4c1fb92fb                     kmovq      k7, r11
00be5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00beb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bf1 e99b000000                     jmp        0x7f56afbd7291
00bf6 448b1424                       mov        r10d, dword ptr [rsp]
00bfa 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00c02 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00c07 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00c0f 8b442404                       mov        eax, dword ptr [rsp + 4]
00c13 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00c18 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
00c1f 418b5004                       mov        edx, dword ptr [r8 + 4]
00c23 85c9                           test       ecx, ecx
00c25 0f8ce50e0000                   jl         0x7f56afbd8110
00c2b 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
00c30 4585c9                         test       r9d, r9d
00c33 0f8cdc0e0000                   jl         0x7f56afbd8115
00c39 3b0424                         cmp        eax, dword ptr [rsp]
00c3c 0f82d30e0000                   jb         0x7f56afbd8115
00c42 8b6c2418                       mov        ebp, dword ptr [rsp + 0x18]
00c46 4103ea                         add        ebp, r10d
00c49 3bd5                           cmp        edx, ebp
00c4b 0f82c40e0000                   jb         0x7f56afbd8115
00c51 4585d2                         test       r10d, r10d
00c54 0f8cbb0e0000                   jl         0x7f56afbd8115
00c5a 4585d2                         test       r10d, r10d
00c5d 7432                           je         0x7f56afbd7291
00c5f 498d7c0b08                     lea        rdi, [r11 + rcx + 8]
00c64 4963d2                         movsxd     rdx, r10d
00c67 4d8bd8                         mov        r11, r8
00c6a 4b8d740808                     lea        rsi, [r8 + r9 + 8]
00c6f 4883fa20                       cmp        rdx, 0x20
00c73 0f8658ffffff                   jbe        0x7f56afbd71d1
00c79 c5f877                         vzeroupper 
00c7c 49ba409171af567f0000           movabs     r10, 0x7f56af719140
00c86 41ffd2                         call       r10
00c89 0f1f840000000000               nop        dword ptr [rax + rax]
00c91 896b38                         mov        dword ptr [rbx + 0x38], ebp
00c94 c5f877                         vzeroupper 
00c97 4881c4b0000000                 add        rsp, 0xb0
00c9e 5d                             pop        rbp
00c9f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ca3 0f87cb0f0000                   ja         0x7f56afbd8274
00ca9 c3                             ret        
00caa 90                             nop        
00cab 90                             nop        
00cac 90                             nop        
00cad 90                             nop        
00cae 90                             nop        
00caf 90                             nop        
00cb0 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00cb8 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00cbf 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00cc3 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00cc8 8bd5                           mov        edx, ebp
00cca 90                             nop        
00ccb 90                             nop        
00ccc c5f877                         vzeroupper 
00ccf e88c89b5ff                     call       0x7f56af72fc60
00cd4 0f1f8400cc0d000b               nop        dword ptr [rax + rax + 0xb000dcc]
00cdc 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00ce1 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00ce8 488bc8                         mov        rcx, rax
00ceb 90                             nop        
00cec c5f877                         vzeroupper 
00cef e86c89b5ff                     call       0x7f56af72fc60
00cf4 0f1f8400ec0d000c               nop        dword ptr [rax + rax + 0xc000dec]
00cfc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d04 4183c308                       add        r11d, 8
00d08 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00d0d 7ca1                           jl         0x7f56afbd72b0
00d0f e94ef6ffff                     jmp        0x7f56afbd6962
00d14 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00d1b e959f7ffff                     jmp        0x7f56afbd6a79
00d20 41ffc9                         dec        r9d
00d23 4585c9                         test       r9d, r9d
00d26 7e2c                           jle        0x7f56afbd7354
00d28 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00d30 45894310                       mov        dword ptr [r11 + 0x10], r8d
00d34 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00d38 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00d40 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00d44 45894808                       mov        dword ptr [r8 + 8], r9d
00d48 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00d4f e925f7ffff                     jmp        0x7f56afbd6a79
00d54 894c2404                       mov        dword ptr [rsp + 4], ecx
00d58 48be782574e200000000           movabs     rsi, 0xe2742578
00d62 418bea                         mov        ebp, r10d
00d65 90                             nop        
00d66 90                             nop        
00d67 90                             nop        
00d68 c5f877                         vzeroupper 
00d6b e8f088b5ff                     call       0x7f56af72fc60
00d70 0f1f8400680e000d               nop        dword ptr [rax + rax + 0xd000e68]
00d78 4885c0                         test       rax, rax
00d7b 0f8578f7ffff                   jne        0x7f56afbd6af9
00d81 bef6ffffff                     mov        esi, 0xfffffff6
00d86 90                             nop        
00d87 90                             nop        
00d88 c5f877                         vzeroupper 
00d8b e8d066afff                     call       0x7f56af6cda60
00d90 0f1f8400880e000e               nop        dword ptr [rax + rax + 0xe000e88]
00d98 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00da2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00da6 e83591c417                     call       0x7f56c78204e0
00dab f4                             hlt        
00dac 4d03c1                         add        r8, r9
00daf 4d3bc6                         cmp        r8, r14
00db2 7e08                           jle        0x7f56afbd73bc
00db4 4533ed                         xor        r13d, r13d
00db7 e9f0f2ffff                     jmp        0x7f56afbd66ac
00dbc 4533ed                         xor        r13d, r13d
00dbf bf01000000                     mov        edi, 1
00dc4 e9e5f2ffff                     jmp        0x7f56afbd66ae
00dc9 bee4ffffff                     mov        esi, 0xffffffe4
00dce 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00dd6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ddb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00de0 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00de5 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00dea 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00def 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00df4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00df9 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00dfe 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00e03 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00e08 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00e0d 90                             nop        
00e0e 90                             nop        
00e0f 90                             nop        
00e10 c5f877                         vzeroupper 
00e13 e84866afff                     call       0x7f56af6cda60
00e18 0f1f8400100f000f               nop        dword ptr [rax + rax + 0xf000f10]
00e20 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00e2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e2e e8ad90c417                     call       0x7f56c78204e0
00e33 f4                             hlt        
00e34 bee4ffffff                     mov        esi, 0xffffffe4
00e39 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e41 448b1c24                       mov        r11d, dword ptr [rsp]
00e45 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e4d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00e52 4c891c24                       mov        qword ptr [rsp], r11
00e56 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e5b 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00e63 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00e68 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e6d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00e72 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e77 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e7c c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00e82 90                             nop        
00e83 90                             nop        
00e84 c5f877                         vzeroupper 
00e87 e8d465afff                     call       0x7f56af6cda60
00e8c 0f1f8400840f0010               nop        dword ptr [rax + rax + 0x10000f84]
00e94 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00e9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ea2 e83990c417                     call       0x7f56c78204e0
00ea7 f4                             hlt        
00ea8 bee4ffffff                     mov        esi, 0xffffffe4
00ead 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00eb5 448b1424                       mov        r10d, dword ptr [rsp]
00eb9 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00ec1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00ec6 4c891424                       mov        qword ptr [rsp], r10
00eca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ecf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00ed7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00edc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ee1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ee6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00eeb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00ef0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ef5 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00efa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00eff 90                             nop        
00f00 c5f877                         vzeroupper 
00f03 e85865afff                     call       0x7f56af6cda60
00f08 0f1f840000100011               nop        dword ptr [rax + rax + 0x11001000]
00f10 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00f1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f1e e8bd8fc417                     call       0x7f56c78204e0
00f23 f4                             hlt        
00f24 bee4ffffff                     mov        esi, 0xffffffe4
00f29 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00f31 448b1424                       mov        r10d, dword ptr [rsp]
00f35 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f3d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f42 4c891424                       mov        qword ptr [rsp], r10
00f46 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f4b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00f53 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f58 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f5d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f62 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f67 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f6c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f71 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f76 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f7b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f80 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f85 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00f8b 90                             nop        
00f8c c5f877                         vzeroupper 
00f8f e8cc64afff                     call       0x7f56af6cda60
00f94 0f1f84008c100012               nop        dword ptr [rax + rax + 0x1200108c]
00f9c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00faa e8318fc417                     call       0x7f56c78204e0
00faf f4                             hlt        
00fb0 be45ffffff                     mov        esi, 0xffffff45
00fb5 48898c24c0000000               mov        qword ptr [rsp + 0xc0], rcx
00fbd 90                             nop        
00fbe 90                             nop        
00fbf 90                             nop        
00fc0 c5f877                         vzeroupper 
00fc3 e89864afff                     call       0x7f56af6cda60
00fc8 0f1f8400c0100013               nop        dword ptr [rax + rax + 0x130010c0]
00fd0 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
00fda 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fde e8fd8ec417                     call       0x7f56c78204e0
00fe3 f4                             hlt        
00fe4 be45ffffff                     mov        esi, 0xffffff45
00fe9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ff1 448b0424                       mov        r8d, dword ptr [rsp]
00ff5 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00ffd 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01002 4c891c24                       mov        qword ptr [rsp], r11
01006 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0100b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01013 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01018 4489442408                     mov        dword ptr [rsp + 8], r8d
0101d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01022 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01027 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0102c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01031 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01036 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0103b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01040 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01045 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0104a 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0104e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01053 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01058 89542430                       mov        dword ptr [rsp + 0x30], edx
0105c c5f877                         vzeroupper 
0105f e8fc63afff                     call       0x7f56af6cda60
01064 0f1f84005c110014               nop        dword ptr [rax + rax + 0x1400115c]
0106c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01076 4883e4f0                       and        rsp, 0xfffffffffffffff0
0107a e8618ec417                     call       0x7f56c78204e0
0107f f4                             hlt        
01080 4c3bd9                         cmp        r11, rcx
01083 bdffffffff                     mov        ebp, 0xffffffff
01088 7c08                           jl         0x7f56afbd7692
0108a 400f95c5                       setne      bpl
0108e 400fb6ed                       movzx      ebp, bpl
01092 be45ffffff                     mov        esi, 0xffffff45
01097 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0109c 44895c2404                     mov        dword ptr [rsp + 4], r11d
010a1 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
010a6 4489442410                     mov        dword ptr [rsp + 0x10], r8d
010ab 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
010b0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
010b5 4489542418                     mov        dword ptr [rsp + 0x18], r10d
010ba 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010bf 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
010c4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
010c9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
010ce 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
010d3 90                             nop        
010d4 c5f877                         vzeroupper 
010d7 e88463afff                     call       0x7f56af6cda60
010dc 0f1f8400d4110015               nop        dword ptr [rax + rax + 0x150011d4]
010e4 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
010ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
010f2 e8e98dc417                     call       0x7f56c78204e0
010f7 f4                             hlt        
010f8 be45ffffff                     mov        esi, 0xffffff45
010fd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01105 448b0c24                       mov        r9d, dword ptr [rsp]
01109 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01111 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01116 4c891c24                       mov        qword ptr [rsp], r11
0111a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0111f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01127 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0112c 44894c2408                     mov        dword ptr [rsp + 8], r9d
01131 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01136 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0113b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01140 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01145 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0114a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0114f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01154 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01159 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0115e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01163 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01168 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0116d 90                             nop        
0116e 90                             nop        
0116f 90                             nop        
01170 c5f877                         vzeroupper 
01173 e8e862afff                     call       0x7f56af6cda60
01178 0f1f840070120016               nop        dword ptr [rax + rax + 0x16001270]
01180 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
0118a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0118e e84d8dc417                     call       0x7f56c78204e0
01193 f4                             hlt        
01194 be45ffffff                     mov        esi, 0xffffff45
01199 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
011a1 448b0c24                       mov        r9d, dword ptr [rsp]
011a5 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
011ad 4c8b442408                     mov        r8, qword ptr [rsp + 8]
011b2 4c890424                       mov        qword ptr [rsp], r8
011b6 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
011bb 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
011c3 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
011c8 44894c2408                     mov        dword ptr [rsp + 8], r9d
011cd 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
011d2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
011d7 4489542410                     mov        dword ptr [rsp + 0x10], r10d
011dc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
011e1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011e6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
011eb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
011f0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
011f5 4489442428                     mov        dword ptr [rsp + 0x28], r8d
011fa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
011ff 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01204 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01209 90                             nop        
0120a 90                             nop        
0120b 90                             nop        
0120c c5f877                         vzeroupper 
0120f e84c62afff                     call       0x7f56af6cda60
01214 0f1f84000c130017               nop        dword ptr [rax + rax + 0x1700130c]
0121c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01226 4883e4f0                       and        rsp, 0xfffffffffffffff0
0122a e8b18cc417                     call       0x7f56c78204e0
0122f f4                             hlt        
01230 be45ffffff                     mov        esi, 0xffffff45
01235 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0123d 448b0424                       mov        r8d, dword ptr [rsp]
01241 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01249 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0124e 4c891c24                       mov        qword ptr [rsp], r11
01252 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01257 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0125f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01264 4489442408                     mov        dword ptr [rsp + 8], r8d
01269 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0126e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01273 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01278 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0127d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01282 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01287 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0128c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01291 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01296 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0129b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
012a0 c5f877                         vzeroupper 
012a3 e8b861afff                     call       0x7f56af6cda60
012a8 0f1f8400a0130018               nop        dword ptr [rax + rax + 0x180013a0]
012b0 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
012ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
012be e81d8cc417                     call       0x7f56c78204e0
012c3 f4                             hlt        
012c4 be45ffffff                     mov        esi, 0xffffff45
012c9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
012d1 448b1c24                       mov        r11d, dword ptr [rsp]
012d5 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
012dd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012e2 4c891424                       mov        qword ptr [rsp], r10
012e6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
012eb 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
012f3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
012f8 44895c2408                     mov        dword ptr [rsp + 8], r11d
012fd 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01302 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01307 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0130c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01311 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01316 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0131b 90                             nop        
0131c c5f877                         vzeroupper 
0131f e83c61afff                     call       0x7f56af6cda60
01324 0f1f84001c140019               nop        dword ptr [rax + rax + 0x1900141c]
0132c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01336 4883e4f0                       and        rsp, 0xfffffffffffffff0
0133a e8a18bc417                     call       0x7f56c78204e0
0133f f4                             hlt        
01340 448bc9                         mov        r9d, ecx
01343 33c9                           xor        ecx, ecx
01345 458bd1                         mov        r10d, r9d
01348 e9d2f8ffff                     jmp        0x7f56afbd721f
0134d be17000000                     mov        esi, 0x17
01352 90                             nop        
01353 90                             nop        
01354 c5f877                         vzeroupper 
01357 e80461afff                     call       0x7f56af6cda60
0135c 0f1f84005414001a               nop        dword ptr [rax + rax + 0x1a001454]
01364 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
0136e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01372 e8698bc417                     call       0x7f56c78204e0
01377 f4                             hlt        
01378 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01380 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01385 be6effffff                     mov        esi, 0xffffff6e
0138a 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01392 4c89542408                     mov        qword ptr [rsp + 8], r10
01397 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0139c 48894424f8                     mov        qword ptr [rsp - 8], rax
013a1 8b442418                       mov        eax, dword ptr [rsp + 0x18]
013a5 89442414                       mov        dword ptr [rsp + 0x14], eax
013a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ae 89542418                       mov        dword ptr [rsp + 0x18], edx
013b2 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
013b6 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
013bb 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013c0 897c2430                       mov        dword ptr [rsp + 0x30], edi
013c4 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
013c9 4c89742440                     mov        qword ptr [rsp + 0x40], r14
013ce 90                             nop        
013cf 90                             nop        
013d0 c5f877                         vzeroupper 
013d3 e88860afff                     call       0x7f56af6cda60
013d8 0f1f8400d014001b               nop        dword ptr [rax + rax + 0x1b0014d0]
013e0 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
013ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
013ee e8ed8ac417                     call       0x7f56c78204e0
013f3 f4                             hlt        
013f4 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
013fc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01401 e97fffffff                     jmp        0x7f56afbd7985
01406 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0140e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01413 e96dffffff                     jmp        0x7f56afbd7985
01418 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01420 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01425 e95bffffff                     jmp        0x7f56afbd7985
0142a bebeffffff                     mov        esi, 0xffffffbe
0142f 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01437 448b1424                       mov        r10d, dword ptr [rsp]
0143b 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01443 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01448 4c891424                       mov        qword ptr [rsp], r10
0144c 4489442408                     mov        dword ptr [rsp + 8], r8d
01451 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01456 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0145b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01460 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01465 90                             nop        
01466 90                             nop        
01467 90                             nop        
01468 c5f877                         vzeroupper 
0146b e8f05fafff                     call       0x7f56af6cda60
01470 0f1f84006815001c               nop        dword ptr [rax + rax + 0x1c001568]
01478 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01482 4883e4f0                       and        rsp, 0xfffffffffffffff0
01486 e8558ac417                     call       0x7f56c78204e0
0148b f4                             hlt        
0148c bee4ffffff                     mov        esi, 0xffffffe4
01491 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01499 448b0424                       mov        r8d, dword ptr [rsp]
0149d 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
014a5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014aa 4c891c24                       mov        qword ptr [rsp], r11
014ae 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014b3 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
014bb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
014c0 44895c2408                     mov        dword ptr [rsp + 8], r11d
014c5 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
014ca 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014cf 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014d4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014d9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014de 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014e3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014e8 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014ed 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014f2 894c2424                       mov        dword ptr [rsp + 0x24], ecx
014f6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
014fb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01500 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01505 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0150a 8954243c                       mov        dword ptr [rsp + 0x3c], edx
0150e 90                             nop        
0150f 90                             nop        
01510 c5f877                         vzeroupper 
01513 e8485fafff                     call       0x7f56af6cda60
01518 0f1f84001016001d               nop        dword ptr [rax + rax + 0x1d001610]
01520 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
0152a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0152e e8ad89c417                     call       0x7f56c78204e0
01533 f4                             hlt        
01534 bef6ffffff                     mov        esi, 0xfffffff6
01539 90                             nop        
0153a 90                             nop        
0153b 90                             nop        
0153c c5f877                         vzeroupper 
0153f e81c5fafff                     call       0x7f56af6cda60
01544 0f1f84003c16001e               nop        dword ptr [rax + rax + 0x1e00163c]
0154c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01556 4883e4f0                       and        rsp, 0xfffffffffffffff0
0155a e88189c417                     call       0x7f56c78204e0
0155f f4                             hlt        
01560 bee4ffffff                     mov        esi, 0xffffffe4
01565 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0156d 448b1c24                       mov        r11d, dword ptr [rsp]
01571 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01579 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0157e 4c891424                       mov        qword ptr [rsp], r10
01582 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01587 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0158f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01594 44895c2408                     mov        dword ptr [rsp + 8], r11d
01599 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0159e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015a3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015a8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
015ad 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
015b2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015b7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015bc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
015c1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
015c9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
015ce 90                             nop        
015cf 90                             nop        
015d0 c5f877                         vzeroupper 
015d3 e8885eafff                     call       0x7f56af6cda60
015d8 0f1f8400d016001f               nop        dword ptr [rax + rax + 0x1f0016d0]
015e0 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
015ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ee e8ed88c417                     call       0x7f56c78204e0
015f3 f4                             hlt        
015f4 bee4ffffff                     mov        esi, 0xffffffe4
015f9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01601 448b1c24                       mov        r11d, dword ptr [rsp]
01605 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0160d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01612 4c891424                       mov        qword ptr [rsp], r10
01616 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0161b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01623 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01628 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0162d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01632 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01637 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0163c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01641 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01646 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0164b 90                             nop        
0164c c5f877                         vzeroupper 
0164f e80c5eafff                     call       0x7f56af6cda60
01654 0f1f84004c170020               nop        dword ptr [rax + rax + 0x2000174c]
0165c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01666 4883e4f0                       and        rsp, 0xfffffffffffffff0
0166a e87188c417                     call       0x7f56c78204e0
0166f f4                             hlt        
01670 beccffffff                     mov        esi, 0xffffffcc
01675 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0167d 448b1c24                       mov        r11d, dword ptr [rsp]
01681 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01689 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0168e 4c891424                       mov        qword ptr [rsp], r10
01692 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01697 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0169f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
016a4 44895c2408                     mov        dword ptr [rsp + 8], r11d
016a9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016ae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016b3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016b8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016bd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016c2 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016c7 90                             nop        
016c8 c5f877                         vzeroupper 
016cb e8905dafff                     call       0x7f56af6cda60
016d0 0f1f8400c8170021               nop        dword ptr [rax + rax + 0x210017c8]
016d8 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
016e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016e6 e8f587c417                     call       0x7f56c78204e0
016eb f4                             hlt        
016ec 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016f4 458d5a08                       lea        r11d, [r10 + 8]
016f8 458bcb                         mov        r9d, r11d
016fb be6effffff                     mov        esi, 0xffffff6e
01700 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01708 448b1424                       mov        r10d, dword ptr [rsp]
0170c 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01714 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01719 4c891424                       mov        qword ptr [rsp], r10
0171d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01722 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0172a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0172f 4489542408                     mov        dword ptr [rsp + 8], r10d
01734 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01739 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0173e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01743 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01748 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0174d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01752 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01757 90                             nop        
01758 c5f877                         vzeroupper 
0175b e8005dafff                     call       0x7f56af6cda60
01760 0f1f840058180022               nop        dword ptr [rax + rax + 0x22001858]
01768 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01772 4883e4f0                       and        rsp, 0xfffffffffffffff0
01776 e86587c417                     call       0x7f56c78204e0
0177b f4                             hlt        
0177c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01784 458d5a08                       lea        r11d, [r10 + 8]
01788 458bcb                         mov        r9d, r11d
0178b be66ffffff                     mov        esi, 0xffffff66
01790 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01798 448b1c24                       mov        r11d, dword ptr [rsp]
0179c 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
017a4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017a9 4c891424                       mov        qword ptr [rsp], r10
017ad 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017b2 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
017ba 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
017bf 44895c2408                     mov        dword ptr [rsp + 8], r11d
017c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017c9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017ce 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
017d3 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
017d8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017dd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017e2 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
017e7 90                             nop        
017e8 c5f877                         vzeroupper 
017eb e8705cafff                     call       0x7f56af6cda60
017f0 0f1f8400e8180023               nop        dword ptr [rax + rax + 0x230018e8]
017f8 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01802 4883e4f0                       and        rsp, 0xfffffffffffffff0
01806 e8d586c417                     call       0x7f56c78204e0
0180b f4                             hlt        
0180c be6effffff                     mov        esi, 0xffffff6e
01811 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01819 448b0424                       mov        r8d, dword ptr [rsp]
0181d 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01825 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0182a 4c891c24                       mov        qword ptr [rsp], r11
0182e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01833 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0183b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01840 44895c2408                     mov        dword ptr [rsp + 8], r11d
01845 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0184a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0184f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01854 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01859 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0185e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01863 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01868 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0186d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01872 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01876 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0187b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01880 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01885 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0188a 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0188f 89542440                       mov        dword ptr [rsp + 0x40], edx
01893 90                             nop        
01894 c5f877                         vzeroupper 
01897 e8c45bafff                     call       0x7f56af6cda60
0189c 0f1f840094190024               nop        dword ptr [rax + rax + 0x24001994]
018a4 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
018ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b2 e82986c417                     call       0x7f56c78204e0
018b7 f4                             hlt        
018b8 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
018c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018c6 e81586c417                     call       0x7f56c78204e0
018cb f4                             hlt        
018cc 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
018d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018da e80186c417                     call       0x7f56c78204e0
018df f4                             hlt        
018e0 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
018ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ee e8ed85c417                     call       0x7f56c78204e0
018f3 f4                             hlt        
018f4 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
018fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01902 e8d985c417                     call       0x7f56c78204e0
01907 f4                             hlt        
01908 bee4ffffff                     mov        esi, 0xffffffe4
0190d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01915 448b1c24                       mov        r11d, dword ptr [rsp]
01919 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01921 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01926 4c891424                       mov        qword ptr [rsp], r10
0192a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0192f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01937 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0193c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01941 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01946 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0194b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01950 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01955 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0195a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0195f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01967 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0196c c5f877                         vzeroupper 
0196f e8ec5aafff                     call       0x7f56af6cda60
01974 0f1f84006c1a0025               nop        dword ptr [rax + rax + 0x25001a6c]
0197c 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0198a e85185c417                     call       0x7f56c78204e0
0198f f4                             hlt        
01990 bee4ffffff                     mov        esi, 0xffffffe4
01995 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0199a 4489542404                     mov        dword ptr [rsp + 4], r10d
0199f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019a4 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
019a9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019ae 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019b3 90                             nop        
019b4 c5f877                         vzeroupper 
019b7 e8a45aafff                     call       0x7f56af6cda60
019bc 0f1f8400b41a0026               nop        dword ptr [rax + rax + 0x26001ab4]
019c4 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
019ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
019d2 e80985c417                     call       0x7f56c78204e0
019d7 f4                             hlt        
019d8 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
019df ffc5                           inc        ebp
019e1 bee4ffffff                     mov        esi, 0xffffffe4
019e6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019eb 44895c2404                     mov        dword ptr [rsp + 4], r11d
019f0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019f5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
019fa 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019ff 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a04 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a09 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a0e 90                             nop        
01a0f 90                             nop        
01a10 c5f877                         vzeroupper 
01a13 e8485aafff                     call       0x7f56af6cda60
01a18 0f1f8400101b0027               nop        dword ptr [rax + rax + 0x27001b10]
01a20 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a2e e8ad84c417                     call       0x7f56c78204e0
01a33 f4                             hlt        
01a34 bee4ffffff                     mov        esi, 0xffffffe4
01a39 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a3e 4489542404                     mov        dword ptr [rsp + 4], r10d
01a43 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a48 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01a4d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a52 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a57 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a5c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a61 90                             nop        
01a62 90                             nop        
01a63 90                             nop        
01a64 c5f877                         vzeroupper 
01a67 e8f459afff                     call       0x7f56af6cda60
01a6c 0f1f8400641b0028               nop        dword ptr [rax + rax + 0x28001b64]
01a74 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01a7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a82 e85984c417                     call       0x7f56c78204e0
01a87 f4                             hlt        
01a88 bee4ffffff                     mov        esi, 0xffffffe4
01a8d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01a95 448b1424                       mov        r10d, dword ptr [rsp]
01a99 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01aa1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01aa6 4c891424                       mov        qword ptr [rsp], r10
01aaa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01aaf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01ab7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01abc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ac1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ac6 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01acb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ad0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ad5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ada 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01adf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ae4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ae9 90                             nop        
01aea 90                             nop        
01aeb 90                             nop        
01aec c5f877                         vzeroupper 
01aef e86c59afff                     call       0x7f56af6cda60
01af4 0f1f8400ec1b0029               nop        dword ptr [rax + rax + 0x29001bec]
01afc 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0a e8d183c417                     call       0x7f56c78204e0
01b0f f4                             hlt        
01b10 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01b15 beccffffff                     mov        esi, 0xffffffcc
01b1a 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b22 898c24c8000000                 mov        dword ptr [rsp + 0xc8], ecx
01b29 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
01b31 44890c24                       mov        dword ptr [rsp], r9d
01b35 48895c2408                     mov        qword ptr [rsp + 8], rbx
01b3a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b3f 90                             nop        
01b40 c5f877                         vzeroupper 
01b43 e81859afff                     call       0x7f56af6cda60
01b48 0f1f8400401c002a               nop        dword ptr [rax + rax + 0x2a001c40]
01b50 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5e e87d83c417                     call       0x7f56c78204e0
01b63 f4                             hlt        
01b64 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01b6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b72 e86983c417                     call       0x7f56c78204e0
01b77 f4                             hlt        
01b78 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b86 e85583c417                     call       0x7f56c78204e0
01b8b f4                             hlt        
01b8c 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01b96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b9a e84183c417                     call       0x7f56c78204e0
01b9f f4                             hlt        
01ba0 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bae e82d83c417                     call       0x7f56c78204e0
01bb3 f4                             hlt        
01bb4 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bc2 e81983c417                     call       0x7f56c78204e0
01bc7 f4                             hlt        
01bc8 48bf70f23688567f0000           movabs     rdi, 0x7f568836f270
01bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bd6 e80583c417                     call       0x7f56c78204e0
01bdb f4                             hlt        
01bdc bef6ffffff                     mov        esi, 0xfffffff6
01be1 90                             nop        
01be2 90                             nop        
01be3 90                             nop        
01be4 c5f877                         vzeroupper 
01be7 e87458afff                     call       0x7f56af6cda60
01bec 0f1f8400e41c002b               nop        dword ptr [rax + rax + 0x2b001ce4]
01bf4 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01bfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c02 e8d982c417                     call       0x7f56c78204e0
01c07 f4                             hlt        
01c08 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01c10 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c15 e96bf7ffff                     jmp        0x7f56afbd7985
01c1a eb14                           jmp        0x7f56afbd8230
01c1c eb12                           jmp        0x7f56afbd8230
01c1e eb10                           jmp        0x7f56afbd8230
01c20 eb0e                           jmp        0x7f56afbd8230
01c22 eb0c                           jmp        0x7f56afbd8230
01c24 eb0a                           jmp        0x7f56afbd8230
01c26 eb08                           jmp        0x7f56afbd8230
01c28 eb06                           jmp        0x7f56afbd8230
01c2a eb04                           jmp        0x7f56afbd8230
01c2c eb02                           jmp        0x7f56afbd8230
01c2e eb00                           jmp        0x7f56afbd8230
01c30 488bf0                         mov        rsi, rax
01c33 e9c4e8ffff                     jmp        0x7f56afbd6afc
01c38 bef6ffffff                     mov        esi, 0xfffffff6
01c3d 498beb                         mov        rbp, r11
01c40 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
01c47 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01c4f 90                             nop        
01c50 c5f877                         vzeroupper 
01c53 e80858afff                     call       0x7f56af6cda60
01c58 0f1f8400501d002c               nop        dword ptr [rax + rax + 0x2c001d50]
01c60 48bf40033888567f0000           movabs     rdi, 0x7f5688380340
01c6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c6e e86d82c417                     call       0x7f56c78204e0
01c73 f4                             hlt        
01c74 49ba9f72bdaf567f0000           movabs     r10, 0x7f56afbd729f
01c7e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01c85 e9d6a0b5ff                     jmp        0x7f56af732360
01c8a e8516fb4ff                     call       0x7f56af71f1e0
01c8f e9aae3ffff                     jmp        0x7f56afbd663e
01c94 f4                             hlt        
01c95 f4                             hlt        
01c96 f4                             hlt        
01c97 f4                             hlt        
