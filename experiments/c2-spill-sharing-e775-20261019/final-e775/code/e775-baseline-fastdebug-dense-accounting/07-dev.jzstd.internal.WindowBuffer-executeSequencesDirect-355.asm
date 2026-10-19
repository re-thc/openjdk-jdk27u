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
0001a 0f85c09bb5ff                   jne        0x7f23ab72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f857c1c0000                   jne        0x7f23abbd6e3a
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
00071 0f8ffa120000                   jg         0x7f23abbd64f1
00077 488b6e08                       mov        rbp, qword ptr [rsi + 8]
0007b 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007f 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00087 4c63442418                     movsxd     r8, dword ptr [rsp + 0x18]
0008c 4c03c5                         add        r8, rbp
0008f 4d2bd8                         sub        r11, r8
00092 4d3bcb                         cmp        r9, r11
00095 0f8fd6120000                   jg         0x7f23abbd64f1
0009b 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009f 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a3 4d85ed                         test       r13, r13
000a6 0f84280d0000                   je         0x7f23abbd5f54
000ac 33ff                           xor        edi, edi
000ae 4c8bda                         mov        r11, rdx
000b1 8b4204                         mov        eax, dword ptr [rdx + 4]
000b4 448b4640                       mov        r8d, dword ptr [rsi + 0x40]
000b8 458bca                         mov        r9d, r10d
000bb 4585d2                         test       r10d, r10d
000be 0f8ea0120000                   jle        0x7f23abbd64e4
000c4 4c2bed                         sub        r13, rbp
000c7 8d48e0                         lea        ecx, [rax - 0x20]
000ca 8b542460                       mov        edx, dword ptr [rsp + 0x60]
000ce 83c2e0                         add        edx, -0x20
000d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d6 418b7204                       mov        esi, dword ptr [r10 + 4]
000da 85f6                           test       esi, esi
000dc 0f86c7120000                   jbe        0x7f23abbd6529
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
0011b 0f837b120000                   jae        0x7f23abbd651c
00121 85ff                           test       edi, edi
00123 0f84ef120000                   je         0x7f23abbd6598
00129 448d58f1                       lea        r11d, [rax - 0xf]
0012d 4585db                         test       r11d, r11d
00130 0f8cf4120000                   jl         0x7f23abbd65aa
00136 458b5804                       mov        r11d, dword ptr [r8 + 4]
0013a 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0013f 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00144 897c2464                       mov        dword ptr [rsp + 0x64], edi
00148 458d53f1                       lea        r10d, [r11 - 0xf]
0014c 4585d2                         test       r10d, r10d
0014f 0f8ce7120000                   jl         0x7f23abbd65bc
00155 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0015d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00161 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00166 4585d2                         test       r10d, r10d
00169 0f86df120000                   jbe        0x7f23abbd65ce
0016f 4183fa01                       cmp        r10d, 1
00173 0f86d5120000                   jbe        0x7f23abbd65ce
00179 4183fa02                       cmp        r10d, 2
0017d 0f86cb120000                   jbe        0x7f23abbd65ce
00183 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00188 4183c3f9                       add        r11d, -7
0018c 4585db                         test       r11d, r11d
0018f 0f8cb9120000                   jl         0x7f23abbd65ce
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
001c1 e9c4010000                     jmp        0x7f23abbd550a
001c6 4533c0                         xor        r8d, r8d
001c9 4489442430                     mov        dword ptr [rsp + 0x30], r8d
001ce 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001d6 418b5b0c                       mov        ebx, dword ptr [r11 + 0xc]
001da 448bda                         mov        r11d, edx
001dd 4183fb03                       cmp        r11d, 3
001e1 0f8e39020000                   jle        0x7f23abbd55a0
001e7 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001ef 41895b10                       mov        dword ptr [r11 + 0x10], ebx
001f3 458b4308                       mov        r8d, dword ptr [r11 + 8]
001f7 4589430c                       mov        dword ptr [r11 + 0xc], r8d
001fb 448d5afd                       lea        r11d, [rdx - 3]
001ff 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00204 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0020c 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00211 45894308                       mov        dword ptr [r11 + 8], r8d
00215 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0021c 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00221 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00226 48034c2420                     add        rcx, qword ptr [rsp + 0x20]
0022b 4c634c2430                     movsxd     r9, dword ptr [rsp + 0x30]
00230 4903c9                         add        rcx, r9
00233 4c3bd9                         cmp        r11, rcx
00236 0f8f680e0000                   jg         0x7f23abbd6224
0023c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00241 4585db                         test       r11d, r11d
00244 0f8e8a0d0000                   jle        0x7f23abbd6154
0024a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0024f 4403442430                     add        r8d, dword ptr [rsp + 0x30]
00254 4403442434                     add        r8d, dword ptr [rsp + 0x34]
00259 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0025e 0f8fb80e0000                   jg         0x7f23abbd629c
00264 458bda                         mov        r11d, r10d
00267 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
0026c 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00271 0f8f410f0000                   jg         0x7f23abbd6338
00277 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0027c 4183fb10                       cmp        r11d, 0x10
00280 0f8fce0f0000                   jg         0x7f23abbd63d4
00286 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
0028b 0f83600b0000                   jae        0x7f23abbd5f71
00291 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00299 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
002a0 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
002a5 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
002aa 0f83ac0b0000                   jae        0x7f23abbd5fdc
002b0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b5 4503da                         add        r11d, r10d
002b8 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
002c0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002c5 418bca                         mov        ecx, r10d
002c8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002cd 4403d1                         add        r10d, ecx
002d0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
002d5 4c63c1                         movsxd     r8, ecx
002d8 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002dd c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
002e4 458bda                         mov        r11d, r10d
002e7 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
002ec 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002f4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002f9 4183fa10                       cmp        r10d, 0x10
002fd 0f8fe50f0000                   jg         0x7f23abbd6468
00303 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00308 4183fb10                       cmp        r11d, 0x10
0030c 0f8c0e020000                   jl         0x7f23abbd56a0
00312 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0031a 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0031f 0f83a70b0000                   jae        0x7f23abbd604c
00325 458bd3                         mov        r10d, r11d
00328 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0032d c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00334 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00339 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0033e 0f83040c0000                   jae        0x7f23abbd60c8
00344 448bd1                         mov        r10d, ecx
00347 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0034c 4d63ca                         movsxd     r9, r10d
0034f 478d1c10                       lea        r11d, [r8 + r10]
00353 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
00358 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0035d 4d63d8                         movsxd     r11, r8d
00360 4d03d9                         add        r11, r9
00363 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00368 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0036f 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
00376 ffc1                           inc        ecx
00378 3b4c2410                       cmp        ecx, dword ptr [rsp + 0x10]
0037c 0f8da8080000                   jge        0x7f23abbd5daa
00382 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0038a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0038f 4d8b44cb08                     mov        r8, qword ptr [r11 + rcx*8 + 8]
00394 458bd8                         mov        r11d, r8d
00397 4181e3ffff0100                 and        r11d, 0x1ffff
0039e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
003a3 4d8bd8                         mov        r11, r8
003a6 49c1fb24                       sar        r11, 0x24
003aa 49c1e812                       shr        r8, 0x12
003ae 458bdb                         mov        r11d, r11d
003b1 418bd3                         mov        edx, r11d
003b4 458bc0                         mov        r8d, r8d
003b7 4181e0ffff0300                 and        r8d, 0x3ffff
003be 4489442434                     mov        dword ptr [rsp + 0x34], r8d
003c3 4585db                         test       r11d, r11d
003c6 0f8c3c0c0000                   jl         0x7f23abbd6188
003cc 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
003d1 4585db                         test       r11d, r11d
003d4 0f84ecfdffff                   je         0x7f23abbd5346
003da 448b0424                       mov        r8d, dword ptr [rsp]
003de 452bc2                         sub        r8d, r10d
003e1 453bd8                         cmp        r11d, r8d
003e4 0f8ee4fdffff                   jle        0x7f23abbd534e
003ea be45ffffff                     mov        esi, 0xffffff45
003ef 418beb                         mov        ebp, r11d
003f2 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
003fa 90                             nop        
003fb 90                             nop        
003fc c5f877                         vzeroupper 
003ff e8dc84afff                     call       0x7f23ab6cda60
00404 0f1f8400fc040000               nop        dword ptr [rax + rax + 0x4fc]
0040c 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00416 4883e4f0                       and        rsp, 0xfffffffffffffff0
0041a e881f6b319                     call       0x7f23c5714c20
0041f f4                             hlt        
00420 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00425 4585c0                         test       r8d, r8d
00428 7406                           je         0x7f23abbd55b0
0042a 41ffcb                         dec        r11d
0042d 418bd3                         mov        edx, r11d
00430 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00438 458b4b08                       mov        r9d, dword ptr [r11 + 8]
0043c 85d2                           test       edx, edx
0043e 0f8400090000                   je         0x7f23abbd5ec4
00444 83fa03                         cmp        edx, 3
00447 0f8403090000                   je         0x7f23abbd5ed0
0044d 83fa02                         cmp        edx, 2
00450 0f878b000000                   ja         0x7f23abbd5661
00456 3b54243c                       cmp        edx, dword ptr [rsp + 0x3c]
0045a 0f8350100000                   jae        0x7f23abbd6630
00460 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00468 458b4c9008                     mov        r9d, dword ptr [r8 + rdx*4 + 8]
0046d 85d2                           test       edx, edx
0046f 7f1d                           jg         0x7f23abbd560e
00471 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00478 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00480 45894b08                       mov        dword ptr [r11 + 8], r9d
00484 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00489 e98efdffff                     jmp        0x7f23abbd539c
0048e 448d42ff                       lea        r8d, [rdx - 1]
00492 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00497 0f8393130000                   jae        0x7f23abbd69b0
0049d 4863da                         movsxd     rbx, edx
004a0 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
004a8 458bdb                         mov        r11d, r11d
004ab 4183c3cc                       add        r11d, -0x34
004af 41c1eb02                       shr        r11d, 2
004b3 458d4413ff                     lea        r8d, [r11 + rdx - 1]
004b8 41bb04000000                   mov        r11d, 4
004be c442a0f5d8                     bzhi       r11, r8, r11
004c3 492bdb                         sub        rbx, r11
004c6 48ffcb                         dec        rbx
004c9 4533db                         xor        r11d, r11d
004cc 4885db                         test       rbx, rbx
004cf 490f4cdb                       cmovl      rbx, r11
004d3 8bfb                           mov        edi, ebx
004d5 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
004dc e985050000                     jmp        0x7f23abbd5be6
004e1 894c2404                       mov        dword ptr [rsp + 4], ecx
004e5 48bea8b272e200000000           movabs     rsi, 0xe272b2a8
004ef 418bea                         mov        ebp, r10d
004f2 90                             nop        
004f3 90                             nop        
004f4 c5f877                         vzeroupper 
004f7 e8e4a5b5ff                     call       0x7f23ab72fc60
004fc 0f1f8400f4050001               nop        dword ptr [rax + rax + 0x10005f4]
00504 4885c0                         test       rax, rax
00507 0f844b100000                   je         0x7f23abbd66d8
0050d 488bf0                         mov        rsi, rax
00510 c5f877                         vzeroupper 
00513 4881c4b0000000                 add        rsp, 0xb0
0051a 5d                             pop        rbp
0051b e9c004afff                     jmp        0x7f23ab6c5b60
00520 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00525 4403542434                     add        r10d, dword ptr [rsp + 0x34]
0052a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0052f 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00534 0f8da2020000                   jge        0x7f23abbd595c
0053a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0053f 4183c308                       add        r11d, 8
00543 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0054b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00550 4183fa08                       cmp        r10d, 8
00554 0f8d93010000                   jge        0x7f23abbd586d
0055a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00562 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00567 0f83bf130000                   jae        0x7f23abbd6aac
0056d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00572 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
00578 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0057d 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00582 0f832c140000                   jae        0x7f23abbd6b34
00588 4c63d1                         movsxd     r10, ecx
0058b 4c635c2430                     movsxd     r11, dword ptr [rsp + 0x30]
00590 4d03da                         add        r11, r10
00593 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00598 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
0059d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
005a5 4183c203                       add        r10d, 3
005a9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005ae 41ffc3                         inc        r11d
005b1 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
005b9 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005be 0f8344140000                   jae        0x7f23abbd6b88
005c4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005c9 4183c203                       add        r10d, 3
005cd 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
005d5 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
005db 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005e0 0f837e140000                   jae        0x7f23abbd6be4
005e6 4c63d1                         movsxd     r10, ecx
005e9 4c63442430                     movsxd     r8, dword ptr [rsp + 0x30]
005ee 4d03c2                         add        r8, r10
005f1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
005f6 43886c0209                     mov        byte ptr [r10 + r8 + 9], bpl
005fb 470fbe541a0a                   movsx      r10d, byte ptr [r10 + r11 + 0xa]
00601 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00606 478854010a                     mov        byte ptr [r9 + r8 + 0xa], r10b
0060b 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
00611 47885c010b                     mov        byte ptr [r9 + r8 + 0xb], r11b
00616 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0061b 4183fb08                       cmp        r11d, 8
0061f 0f8393140000                   jae        0x7f23abbd6c38
00625 49bae8eb70e200000000           movabs     r10, 0xe270ebe8
0062f 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00637 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
0063c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00641 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00646 4183fa04                       cmp        r10d, 4
0064a 7e3c                           jle        0x7f23abbd5808
0064c 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00650 83c504                         add        ebp, 4
00653 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00658 418bd1                         mov        edx, r9d
0065b 90                             nop        
0065c c5f877                         vzeroupper 
0065f e87ca4b5ff                     call       0x7f23ab72fc60
00664 0f1f84005c070002               nop        dword ptr [rax + rax + 0x200075c]
0066c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00671 8bd5                           mov        edx, ebp
00673 8bc8                           mov        ecx, eax
00675 90                             nop        
00676 90                             nop        
00677 90                             nop        
00678 c5f877                         vzeroupper 
0067b e860a4b5ff                     call       0x7f23ab72fc60
00680 0f1f840078070003               nop        dword ptr [rax + rax + 0x3000778]
00688 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0068d 4183fa08                       cmp        r10d, 8
00691 0f8ed8fcffff                   jle        0x7f23abbd54ef
00697 49ba10ec70e200000000           movabs     r10, 0xe270ec10
006a1 8b542430                       mov        edx, dword ptr [rsp + 0x30]
006a5 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006aa 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
006af 83c208                         add        edx, 8
006b2 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006b7 90                             nop        
006b8 c5f877                         vzeroupper 
006bb e820a4b5ff                     call       0x7f23ab72fc60
006c0 0f1f8400b8070004               nop        dword ptr [rax + rax + 0x40007b8]
006c8 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006cd 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
006d4 488bc8                         mov        rcx, rax
006d7 90                             nop        
006d8 c5f877                         vzeroupper 
006db e800a4b5ff                     call       0x7f23ab72fc60
006e0 0f1f8400d8070005               nop        dword ptr [rax + rax + 0x50007d8]
006e8 e982fcffff                     jmp        0x7f23abbd54ef
006ed 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006f2 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
006f9 90                             nop        
006fa 90                             nop        
006fb 90                             nop        
006fc c5f877                         vzeroupper 
006ff e8dca3b5ff                     call       0x7f23ab72fc60
00704 0f1f8400fc070006               nop        dword ptr [rax + rax + 0x60007fc]
0070c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00711 8b542438                       mov        edx, dword ptr [rsp + 0x38]
00715 488bc8                         mov        rcx, rax
00718 c5f877                         vzeroupper 
0071b e8c0a3b5ff                     call       0x7f23ab72fc60
00720 0f1f840018080007               nop        dword ptr [rax + rax + 0x7000818]
00728 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00730 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00735 0f8d34fcffff                   jge        0x7f23abbd54ef
0073b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00740 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00747 0f8e9b050000                   jle        0x7f23abbd5e68
0074d 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00755 4183c008                       add        r8d, 8
00759 be66ffffff                     mov        esi, 0xffffff66
0075e 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00766 448b1c24                       mov        r11d, dword ptr [rsp]
0076a 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00772 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00777 4c891424                       mov        qword ptr [rsp], r10
0077b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00780 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00788 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0078d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00792 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00797 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0079c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
007a1 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
007a6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007ab 4489542420                     mov        dword ptr [rsp + 0x20], r10d
007b0 4489442428                     mov        dword ptr [rsp + 0x28], r8d
007b5 90                             nop        
007b6 90                             nop        
007b7 90                             nop        
007b8 c5f877                         vzeroupper 
007bb e82081afff                     call       0x7f23ab6cda60
007c0 0f1f8400b8080008               nop        dword ptr [rax + rax + 0x80008b8]
007c8 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
007d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007d6 e8c5f2b319                     call       0x7f23c5714c20
007db f4                             hlt        
007dc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
007e1 4183fa30                       cmp        r10d, 0x30
007e5 0f8fe3010000                   jg         0x7f23abbd5b4e
007eb 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
007ef 83c5f9                         add        ebp, -7
007f2 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007f6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
007fe 443bdd                         cmp        r11d, ebp
00801 0f837d0d0000                   jae        0x7f23abbd6704
00807 418beb                         mov        ebp, r11d
0080a 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00811 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00816 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
0081b 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
00823 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00828 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
0082d 0f83e50d0000                   jae        0x7f23abbd6798
00833 448bd1                         mov        r10d, ecx
00836 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0083e 4d63d2                         movsxd     r10, r10d
00841 8b6c2430                       mov        ebp, dword ptr [rsp + 0x30]
00845 4c63dd                         movsxd     r11, ebp
00848 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
0084d 48be28c122e200000000           movabs     rsi, 0xe222c128
00857 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
0085c 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00864 4533c9                         xor        r9d, r9d
00867 90                             nop        
00868 c5f877                         vzeroupper 
0086b e87098b5ff                     call       0x7f23ab72f260
00870 0f1f840068090009               nop        dword ptr [rax + rax + 0x9000968]
00878 03ac2490000000                 add        ebp, dword ptr [rsp + 0x90]
0087f 896c2438                       mov        dword ptr [rsp + 0x38], ebp
00883 448d5d08                       lea        r11d, [rbp + 8]
00887 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0088f 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00894 0f8d20010000                   jge        0x7f23abbd5b3a
0089a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008a2 442bdd                         sub        r11d, ebp
008a5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008aa 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
008af 4983c0f9                       add        r8, -7
008b3 4d63cb                         movsxd     r9, r11d
008b6 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008be 4f8d140b                       lea        r10, [r11 + r9]
008c2 4d3bd0                         cmp        r10, r8
008c5 0f83450e0000                   jae        0x7f23abbd6890
008cb 4c63542418                     movsxd     r10, dword ptr [rsp + 0x18]
008d0 4d2bd3                         sub        r10, r11
008d3 4983c207                       add        r10, 7
008d7 4983e2f8                       and        r10, 0xfffffffffffffff8
008db 458bda                         mov        r11d, r10d
008de 458d5c2b08                     lea        r11d, [r11 + rbp + 8]
008e3 4d63d3                         movsxd     r10, r11d
008e6 4f8d5c11f8                     lea        r11, [r9 + r10 - 8]
008eb 4d3bd8                         cmp        r11, r8
008ee 0f831c0e0000                   jae        0x7f23abbd6890
008f4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
008fc 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00901 0f83090e0000                   jae        0x7f23abbd6890
00907 4983c2f8                       add        r10, -8
0090b 4d3bd0                         cmp        r10, r8
0090e 0f83fc0d0000                   jae        0x7f23abbd6890
00914 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00919 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00920 0f8f7a0e0000                   jg         0x7f23abbd6920
00926 90                             nop        
00927 90                             nop        
00928 90                             nop        
00929 90                             nop        
0092a 90                             nop        
0092b 90                             nop        
0092c 90                             nop        
0092d 90                             nop        
0092e 90                             nop        
0092f 90                             nop        
00930 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00938 4963ca                         movsxd     rcx, r10d
0093b 4883c108                       add        rcx, 8
0093f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00946 036c2430                       add        ebp, dword ptr [rsp + 0x30]
0094a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0094f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00954 48be28c122e200000000           movabs     rsi, 0xe222c128
0095e 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00963 4533c9                         xor        r9d, r9d
00966 90                             nop        
00967 90                             nop        
00968 c5f877                         vzeroupper 
0096b e87097b5ff                     call       0x7f23ab72f260
00970 0f1f8400680a000a               nop        dword ptr [rax + rax + 0xa000a68]
00978 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00980 4183c208                       add        r10d, 8
00984 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0098c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00991 7c9d                           jl         0x7f23abbd5ab0
00993 eb25                           jmp        0x7f23abbd5b3a
00995 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0099a 4d63d2                         movsxd     r10, r10d
0099d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009a4 c442a8f5db                     bzhi       r11, r11, r10
009a9 c4c1fb92fb                     kmovq      k7, r11
009ae 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009b4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009ba 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009bf 4403542434                     add        r10d, dword ptr [rsp + 0x34]
009c4 4489542418                     mov        dword ptr [rsp + 0x18], r10d
009c9 e9a1f9ffff                     jmp        0x7f23abbd54ef
009ce 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009d6 4585d2                         test       r10d, r10d
009d9 0f8cb50c0000                   jl         0x7f23abbd6814
009df 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
009e4 4585db                         test       r11d, r11d
009e7 0f8ca70c0000                   jl         0x7f23abbd6814
009ed 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009f2 4503da                         add        r11d, r10d
009f5 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
009fa 453bd3                         cmp        r10d, r11d
009fd 0f82910c0000                   jb         0x7f23abbd6814
00a03 458bda                         mov        r11d, r10d
00a06 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00a0b 0f82830c0000                   jb         0x7f23abbd6814
00a11 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00a16 4585d2                         test       r10d, r10d
00a19 749f                           je         0x7f23abbd5b3a
00a1b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00a20 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a28 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00a2d 4d03c8                         add        r9, r8
00a30 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00a35 4863542434                     movsxd     rdx, dword ptr [rsp + 0x34]
00a3a 4883fa20                       cmp        rdx, 0x20
00a3e 0f8651ffffff                   jbe        0x7f23abbd5b15
00a44 c5f877                         vzeroupper 
00a47 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
00a51 41ffd2                         call       r10
00a54 0f1f840000000000               nop        dword ptr [rax + rax]
00a5c e959ffffff                     jmp        0x7f23abbd5b3a
00a61 90                             nop        
00a62 90                             nop        
00a63 90                             nop        
00a64 8bd1                           mov        edx, ecx
00a66 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00a6e 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00a73 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00a7b 4489449108                     mov        dword ptr [rcx + rdx*4 + 8], r8d
00a80 8d4aff                         lea        ecx, [rdx - 1]
00a83 3bcf                           cmp        ecx, edi
00a85 7fdd                           jg         0x7f23abbd5be4
00a87 4c6344243c                     movsxd     r8, dword ptr [rsp + 0x3c]
00a8c 83f93f                         cmp        ecx, 0x3f
00a8f 0f8e0a010000                   jle        0x7f23abbd5d1f
00a95 4c63da                         movsxd     r11, edx
00a98 4983c3fe                       add        r11, -2
00a9c 4d3bd8                         cmp        r11, r8
00a9f 0f83370e0000                   jae        0x7f23abbd6a5c
00aa5 448d5abf                       lea        r11d, [rdx - 0x41]
00aa9 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00aae 0f833c0e0000                   jae        0x7f23abbd6a70
00ab4 3b4c243c                       cmp        ecx, dword ptr [rsp + 0x3c]
00ab8 0f83460e0000                   jae        0x7f23abbd6a84
00abe 448d5ac0                       lea        r11d, [rdx - 0x40]
00ac2 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00ac7 0f834b0e0000                   jae        0x7f23abbd6a98
00acd 448bda                         mov        r11d, edx
00ad0 41ffcb                         dec        r11d
00ad3 418bdb                         mov        ebx, r11d
00ad6 eb0a                           jmp        0x7f23abbd5c62
00ad8 90                             nop        
00ad9 90                             nop        
00ada 90                             nop        
00adb 90                             nop        
00adc 90                             nop        
00add 90                             nop        
00ade 90                             nop        
00adf 90                             nop        
00ae0 8bd9                           mov        ebx, ecx
00ae2 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00aea 62f17e486f8499c8ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 - 0x38]
00af5 62f17e487f8499ccffffff         vmovdqu32  zmmword ptr [rcx + rbx*4 - 0x34], zmm0
00b00 62f17e486f849988ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 - 0x78]
00b0b 62f17e487f84998cffffff         vmovdqu32  zmmword ptr [rcx + rbx*4 - 0x74], zmm0
00b16 62f17e486f849948ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 - 0xb8]
00b21 62f17e487f84994cffffff         vmovdqu32  zmmword ptr [rcx + rbx*4 - 0xb4], zmm0
00b2c 62f17e486f849908ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 - 0xf8]
00b37 62f17e487f84990cffffff         vmovdqu32  zmmword ptr [rcx + rbx*4 - 0xf4], zmm0
00b42 8d4bc0                         lea        ecx, [rbx - 0x40]
00b45 83f93f                         cmp        ecx, 0x3f
00b48 7f96                           jg         0x7f23abbd5c60
00b4a 83f90f                         cmp        ecx, 0xf
00b4d 7e50                           jle        0x7f23abbd5d1f
00b4f 8bcb                           mov        ecx, ebx
00b51 448d59b0                       lea        r11d, [rcx - 0x50]
00b55 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00b5a 0f8348100000                   jae        0x7f23abbd6d28
00b60 83c1b1                         add        ecx, -0x4f
00b63 3b4c243c                       cmp        ecx, dword ptr [rsp + 0x3c]
00b67 0f8363100000                   jae        0x7f23abbd6d50
00b6d 448bdb                         mov        r11d, ebx
00b70 4183c3c0                       add        r11d, -0x40
00b74 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00b7c 62b17e486f8499c8ffffff         vmovdqu32  zmm0, zmmword ptr [rcx + r11*4 - 0x38]
00b87 62b17e487f8499ccffffff         vmovdqu32  zmmword ptr [rcx + r11*4 - 0x34], zmm0
00b92 4183c3f0                       add        r11d, -0x10
00b96 4183fb0f                       cmp        r11d, 0xf
00b9a 7fd8                           jg         0x7f23abbd5cf4
00b9c 418bcb                         mov        ecx, r11d
00b9f 85c9                           test       ecx, ecx
00ba1 0f8ed1f8ffff                   jle        0x7f23abbd55f8
00ba7 4c63d9                         movsxd     r11, ecx
00baa 49ffcb                         dec        r11
00bad 4d3bd8                         cmp        r11, r8
00bb0 0f83de0f0000                   jae        0x7f23abbd6d14
00bb6 448bc1                         mov        r8d, ecx
00bb9 458d58ff                       lea        r11d, [r8 - 1]
00bbd 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00bc2 0f83f40f0000                   jae        0x7f23abbd6d3c
00bc8 3b4c243c                       cmp        ecx, dword ptr [rsp + 0x3c]
00bcc 0f8312100000                   jae        0x7f23abbd6d64
00bd2 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00bd7 0f831b100000                   jae        0x7f23abbd6d78
00bdd 90                             nop        
00bde 90                             nop        
00bdf 90                             nop        
00be0 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00be8 458b5c8b04                     mov        r11d, dword ptr [r11 + rcx*4 + 4]
00bed 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00bf5 45895c8808                     mov        dword ptr [r8 + rcx*4 + 8], r11d
00bfa ffc9                           dec        ecx
00bfc 85c9                           test       ecx, ecx
00bfe 7fe0                           jg         0x7f23abbd5d60
00c00 e973f8ffff                     jmp        0x7f23abbd55f8
00c05 4d63d2                         movsxd     r10, r10d
00c08 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c0f c442a8f5db                     bzhi       r11, r11, r10
00c14 c4c1fb92fb                     kmovq      k7, r11
00c19 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c1f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c25 e99b000000                     jmp        0x7f23abbd5e45
00c2a 448b1424                       mov        r10d, dword ptr [rsp]
00c2e 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00c36 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00c3b 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00c43 8b442404                       mov        eax, dword ptr [rsp + 4]
00c47 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00c4c 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
00c53 418b5004                       mov        edx, dword ptr [r8 + 4]
00c57 85c9                           test       ecx, ecx
00c59 0f8ce10e0000                   jl         0x7f23abbd6cc0
00c5f 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
00c64 4585c9                         test       r9d, r9d
00c67 0f8cd80e0000                   jl         0x7f23abbd6cc5
00c6d 3b0424                         cmp        eax, dword ptr [rsp]
00c70 0f82cf0e0000                   jb         0x7f23abbd6cc5
00c76 8b6c2418                       mov        ebp, dword ptr [rsp + 0x18]
00c7a 4103ea                         add        ebp, r10d
00c7d 3bd5                           cmp        edx, ebp
00c7f 0f82c00e0000                   jb         0x7f23abbd6cc5
00c85 4585d2                         test       r10d, r10d
00c88 0f8cb70e0000                   jl         0x7f23abbd6cc5
00c8e 4585d2                         test       r10d, r10d
00c91 7432                           je         0x7f23abbd5e45
00c93 498d7c0b08                     lea        rdi, [r11 + rcx + 8]
00c98 4963d2                         movsxd     rdx, r10d
00c9b 4d8bd8                         mov        r11, r8
00c9e 4b8d740808                     lea        rsi, [r8 + r9 + 8]
00ca3 4883fa20                       cmp        rdx, 0x20
00ca7 0f8658ffffff                   jbe        0x7f23abbd5d85
00cad c5f877                         vzeroupper 
00cb0 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
00cba 41ffd2                         call       r10
00cbd 0f1f840000000000               nop        dword ptr [rax + rax]
00cc5 896b38                         mov        dword ptr [rbx + 0x38], ebp
00cc8 c5f877                         vzeroupper 
00ccb 4881c4b0000000                 add        rsp, 0xb0
00cd2 5d                             pop        rbp
00cd3 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cd7 0f87c70f0000                   ja         0x7f23abbd6e24
00cdd c3                             ret        
00cde 90                             nop        
00cdf 90                             nop        
00ce0 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00ce8 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00cef 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00cf3 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00cf8 8bd5                           mov        edx, ebp
00cfa 90                             nop        
00cfb 90                             nop        
00cfc c5f877                         vzeroupper 
00cff e8dc9db5ff                     call       0x7f23ab72fc60
00d04 0f1f8400fc0d000b               nop        dword ptr [rax + rax + 0xb000dfc]
00d0c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00d11 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00d18 488bc8                         mov        rcx, rax
00d1b 90                             nop        
00d1c c5f877                         vzeroupper 
00d1f e8bc9db5ff                     call       0x7f23ab72fc60
00d24 0f1f84001c0e000c               nop        dword ptr [rax + rax + 0xc000e1c]
00d2c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d34 4183c308                       add        r11d, 8
00d38 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00d3d 7ca1                           jl         0x7f23abbd5e60
00d3f e92bf6ffff                     jmp        0x7f23abbd54ef
00d44 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00d4b e934f7ffff                     jmp        0x7f23abbd5604
00d50 41ffc9                         dec        r9d
00d53 4585c9                         test       r9d, r9d
00d56 7e24                           jle        0x7f23abbd5efc
00d58 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00d60 41895b10                       mov        dword ptr [r11 + 0x10], ebx
00d64 458b4308                       mov        r8d, dword ptr [r11 + 8]
00d68 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00d6c 45894b08                       mov        dword ptr [r11 + 8], r9d
00d70 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00d77 e908f7ffff                     jmp        0x7f23abbd5604
00d7c 894c2404                       mov        dword ptr [rsp + 4], ecx
00d80 48be78b272e200000000           movabs     rsi, 0xe272b278
00d8a 418bea                         mov        ebp, r10d
00d8d 90                             nop        
00d8e 90                             nop        
00d8f 90                             nop        
00d90 c5f877                         vzeroupper 
00d93 e8489db5ff                     call       0x7f23ab72fc60
00d98 0f1f8400900e000d               nop        dword ptr [rax + rax + 0xd000e90]
00da0 4885c0                         test       rax, rax
00da3 0f8564f7ffff                   jne        0x7f23abbd568d
00da9 bef6ffffff                     mov        esi, 0xfffffff6
00dae 90                             nop        
00daf 90                             nop        
00db0 c5f877                         vzeroupper 
00db3 e8287bafff                     call       0x7f23ab6cda60
00db8 0f1f8400b00e000e               nop        dword ptr [rax + rax + 0xe000eb0]
00dc0 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dce e8cdecb319                     call       0x7f23c5714c20
00dd3 f4                             hlt        
00dd4 4d03c1                         add        r8, r9
00dd7 4d3bc6                         cmp        r8, r14
00dda 7e08                           jle        0x7f23abbd5f64
00ddc 4533ed                         xor        r13d, r13d
00ddf e9c8f2ffff                     jmp        0x7f23abbd522c
00de4 4533ed                         xor        r13d, r13d
00de7 bf01000000                     mov        edi, 1
00dec e9bdf2ffff                     jmp        0x7f23abbd522e
00df1 bee4ffffff                     mov        esi, 0xffffffe4
00df6 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00dfe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e03 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e08 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00e0d 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00e12 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e17 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00e1c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e21 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00e26 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00e2b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00e30 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00e35 90                             nop        
00e36 90                             nop        
00e37 90                             nop        
00e38 c5f877                         vzeroupper 
00e3b e8a07aafff                     call       0x7f23ab6cda60
00e40 0f1f8400380f000f               nop        dword ptr [rax + rax + 0xf000f38]
00e48 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e56 e845ecb319                     call       0x7f23c5714c20
00e5b f4                             hlt        
00e5c bee4ffffff                     mov        esi, 0xffffffe4
00e61 498beb                         mov        rbp, r11
00e64 448b1c24                       mov        r11d, dword ptr [rsp]
00e68 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e70 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00e75 4c891c24                       mov        qword ptr [rsp], r11
00e79 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e7e 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00e86 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00e8b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e90 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00e95 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e9a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e9f c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00ea5 90                             nop        
00ea6 90                             nop        
00ea7 90                             nop        
00ea8 c5f877                         vzeroupper 
00eab e8307aafff                     call       0x7f23ab6cda60
00eb0 0f1f8400a80f0010               nop        dword ptr [rax + rax + 0x10000fa8]
00eb8 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00ec2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ec6 e8d5ebb319                     call       0x7f23c5714c20
00ecb f4                             hlt        
00ecc bee4ffffff                     mov        esi, 0xffffffe4
00ed1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ed9 448b1424                       mov        r10d, dword ptr [rsp]
00edd 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00ee5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00eea 4c891424                       mov        qword ptr [rsp], r10
00eee 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ef3 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00efb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f00 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f05 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f0a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f0f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f14 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f19 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f1e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f23 90                             nop        
00f24 c5f877                         vzeroupper 
00f27 e8b479afff                     call       0x7f23ab6cda60
00f2c 0f1f840024100011               nop        dword ptr [rax + rax + 0x11001024]
00f34 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00f3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f42 e859ebb319                     call       0x7f23c5714c20
00f47 f4                             hlt        
00f48 bee4ffffff                     mov        esi, 0xffffffe4
00f4d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00f55 448b1424                       mov        r10d, dword ptr [rsp]
00f59 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f61 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f66 4c891424                       mov        qword ptr [rsp], r10
00f6a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f6f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00f77 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f7c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f81 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f86 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f8b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f90 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f95 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f9a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f9f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00fa4 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00fa9 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00faf 90                             nop        
00fb0 c5f877                         vzeroupper 
00fb3 e82879afff                     call       0x7f23ab6cda60
00fb8 0f1f8400b0100012               nop        dword ptr [rax + rax + 0x120010b0]
00fc0 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00fca 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fce e8cdeab319                     call       0x7f23c5714c20
00fd3 f4                             hlt        
00fd4 be45ffffff                     mov        esi, 0xffffff45
00fd9 48898c24c0000000               mov        qword ptr [rsp + 0xc0], rcx
00fe1 90                             nop        
00fe2 90                             nop        
00fe3 90                             nop        
00fe4 c5f877                         vzeroupper 
00fe7 e8f478afff                     call       0x7f23ab6cda60
00fec 0f1f8400e4100013               nop        dword ptr [rax + rax + 0x130010e4]
00ff4 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
00ffe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01002 e899eab319                     call       0x7f23c5714c20
01007 f4                             hlt        
01008 be45ffffff                     mov        esi, 0xffffff45
0100d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01015 448b0424                       mov        r8d, dword ptr [rsp]
01019 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
01021 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01026 4c891c24                       mov        qword ptr [rsp], r11
0102a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0102f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01037 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0103c 4489442408                     mov        dword ptr [rsp + 8], r8d
01041 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01046 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0104b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01050 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01055 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0105a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0105f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01064 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01069 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0106e 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01072 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01077 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0107c 89542430                       mov        dword ptr [rsp + 0x30], edx
01080 c5f877                         vzeroupper 
01083 e85878afff                     call       0x7f23ab6cda60
01088 0f1f840080110014               nop        dword ptr [rax + rax + 0x14001180]
01090 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0109a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0109e e8fde9b319                     call       0x7f23c5714c20
010a3 f4                             hlt        
010a4 4c3bd9                         cmp        r11, rcx
010a7 bdffffffff                     mov        ebp, 0xffffffff
010ac 7c08                           jl         0x7f23abbd6236
010ae 400f95c5                       setne      bpl
010b2 400fb6ed                       movzx      ebp, bpl
010b6 be45ffffff                     mov        esi, 0xffffff45
010bb 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010c0 44895c2404                     mov        dword ptr [rsp + 4], r11d
010c5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
010ca 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
010cf 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
010d4 4489442414                     mov        dword ptr [rsp + 0x14], r8d
010d9 4489542418                     mov        dword ptr [rsp + 0x18], r10d
010de 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010e3 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
010e8 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
010ed 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
010f2 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
010f7 90                             nop        
010f8 c5f877                         vzeroupper 
010fb e8e077afff                     call       0x7f23ab6cda60
01100 0f1f8400f8110015               nop        dword ptr [rax + rax + 0x150011f8]
01108 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01112 4883e4f0                       and        rsp, 0xfffffffffffffff0
01116 e885e9b319                     call       0x7f23c5714c20
0111b f4                             hlt        
0111c be45ffffff                     mov        esi, 0xffffff45
01121 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01129 448b0c24                       mov        r9d, dword ptr [rsp]
0112d 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01135 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0113a 4c891c24                       mov        qword ptr [rsp], r11
0113e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01143 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0114b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01150 44894c2408                     mov        dword ptr [rsp + 8], r9d
01155 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0115a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0115f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01164 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01169 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0116e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01173 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01178 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0117d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01182 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01187 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0118c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01191 90                             nop        
01192 90                             nop        
01193 90                             nop        
01194 c5f877                         vzeroupper 
01197 e84477afff                     call       0x7f23ab6cda60
0119c 0f1f840094120016               nop        dword ptr [rax + rax + 0x16001294]
011a4 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
011ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
011b2 e8e9e8b319                     call       0x7f23c5714c20
011b7 f4                             hlt        
011b8 be45ffffff                     mov        esi, 0xffffff45
011bd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
011c5 448b0c24                       mov        r9d, dword ptr [rsp]
011c9 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
011d1 4c8b442408                     mov        r8, qword ptr [rsp + 8]
011d6 4c890424                       mov        qword ptr [rsp], r8
011da 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
011df 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
011e7 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
011ec 44894c2408                     mov        dword ptr [rsp + 8], r9d
011f1 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
011f6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
011fb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01200 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01205 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0120a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0120f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01214 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01219 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0121e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01223 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01228 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0122d 90                             nop        
0122e 90                             nop        
0122f 90                             nop        
01230 c5f877                         vzeroupper 
01233 e8a876afff                     call       0x7f23ab6cda60
01238 0f1f840030130017               nop        dword ptr [rax + rax + 0x17001330]
01240 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0124a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0124e e84de8b319                     call       0x7f23c5714c20
01253 f4                             hlt        
01254 be45ffffff                     mov        esi, 0xffffff45
01259 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01261 448b0424                       mov        r8d, dword ptr [rsp]
01265 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0126d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01272 4c891c24                       mov        qword ptr [rsp], r11
01276 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0127b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01283 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01288 4489442408                     mov        dword ptr [rsp + 8], r8d
0128d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01292 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01297 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0129c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012a6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
012ab 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
012b0 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
012b5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
012ba 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
012bf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
012c4 c5f877                         vzeroupper 
012c7 e81476afff                     call       0x7f23ab6cda60
012cc 0f1f8400c4130018               nop        dword ptr [rax + rax + 0x180013c4]
012d4 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
012de 4883e4f0                       and        rsp, 0xfffffffffffffff0
012e2 e8b9e7b319                     call       0x7f23c5714c20
012e7 f4                             hlt        
012e8 be45ffffff                     mov        esi, 0xffffff45
012ed 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
012f5 448b1c24                       mov        r11d, dword ptr [rsp]
012f9 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01301 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01306 4c891424                       mov        qword ptr [rsp], r10
0130a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0130f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01317 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0131c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01321 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01326 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0132b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01330 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01335 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0133a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0133f 90                             nop        
01340 c5f877                         vzeroupper 
01343 e89875afff                     call       0x7f23ab6cda60
01348 0f1f840040140019               nop        dword ptr [rax + rax + 0x19001440]
01350 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0135a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0135e e83de7b319                     call       0x7f23c5714c20
01363 f4                             hlt        
01364 448bc9                         mov        r9d, ecx
01367 33c9                           xor        ecx, ecx
01369 458bd1                         mov        r10d, r9d
0136c e9e2f8ffff                     jmp        0x7f23abbd5dd3
01371 be17000000                     mov        esi, 0x17
01376 90                             nop        
01377 90                             nop        
01378 c5f877                         vzeroupper 
0137b e86075afff                     call       0x7f23ab6cda60
01380 0f1f84007814001a               nop        dword ptr [rax + rax + 0x1a001478]
01388 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01392 4883e4f0                       and        rsp, 0xfffffffffffffff0
01396 e805e7b319                     call       0x7f23c5714c20
0139b f4                             hlt        
0139c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
013a4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013a9 be6effffff                     mov        esi, 0xffffff6e
013ae 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
013b6 4c89542408                     mov        qword ptr [rsp + 8], r10
013bb 4489442410                     mov        dword ptr [rsp + 0x10], r8d
013c0 48894424f8                     mov        qword ptr [rsp - 8], rax
013c5 8b442418                       mov        eax, dword ptr [rsp + 0x18]
013c9 89442414                       mov        dword ptr [rsp + 0x14], eax
013cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d2 89542418                       mov        dword ptr [rsp + 0x18], edx
013d6 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
013da 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
013df 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013e4 897c2430                       mov        dword ptr [rsp + 0x30], edi
013e8 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
013ed 4c89742440                     mov        qword ptr [rsp + 0x40], r14
013f2 90                             nop        
013f3 90                             nop        
013f4 c5f877                         vzeroupper 
013f7 e8e474afff                     call       0x7f23ab6cda60
013fc 0f1f8400f414001b               nop        dword ptr [rax + rax + 0x1b0014f4]
01404 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0140e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01412 e889e6b319                     call       0x7f23c5714c20
01417 f4                             hlt        
01418 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01420 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01425 e97fffffff                     jmp        0x7f23abbd6529
0142a 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01432 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01437 e96dffffff                     jmp        0x7f23abbd6529
0143c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01444 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01449 e95bffffff                     jmp        0x7f23abbd6529
0144e bebeffffff                     mov        esi, 0xffffffbe
01453 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0145b 448b1424                       mov        r10d, dword ptr [rsp]
0145f 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01467 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0146c 4c891424                       mov        qword ptr [rsp], r10
01470 4489442408                     mov        dword ptr [rsp + 8], r8d
01475 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0147a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0147f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01484 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01489 90                             nop        
0148a 90                             nop        
0148b 90                             nop        
0148c c5f877                         vzeroupper 
0148f e84c74afff                     call       0x7f23ab6cda60
01494 0f1f84008c15001c               nop        dword ptr [rax + rax + 0x1c00158c]
0149c 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
014a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014aa e8f1e5b319                     call       0x7f23c5714c20
014af f4                             hlt        
014b0 bee4ffffff                     mov        esi, 0xffffffe4
014b5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
014bd 448b1c24                       mov        r11d, dword ptr [rsp]
014c1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
014c9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014ce 4c891c24                       mov        qword ptr [rsp], r11
014d2 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
014d7 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
014df 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
014e4 4489442408                     mov        dword ptr [rsp + 8], r8d
014e9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
014ee 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014f3 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014f8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014fd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01502 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01507 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0150c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01511 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01516 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0151a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0151f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01524 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01529 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0152e 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01532 90                             nop        
01533 90                             nop        
01534 c5f877                         vzeroupper 
01537 e8a473afff                     call       0x7f23ab6cda60
0153c 0f1f84003416001d               nop        dword ptr [rax + rax + 0x1d001634]
01544 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0154e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01552 e849e5b319                     call       0x7f23c5714c20
01557 f4                             hlt        
01558 bef6ffffff                     mov        esi, 0xfffffff6
0155d 90                             nop        
0155e 90                             nop        
0155f 90                             nop        
01560 c5f877                         vzeroupper 
01563 e87873afff                     call       0x7f23ab6cda60
01568 0f1f84006016001e               nop        dword ptr [rax + rax + 0x1e001660]
01570 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0157a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0157e e81de5b319                     call       0x7f23c5714c20
01583 f4                             hlt        
01584 bee4ffffff                     mov        esi, 0xffffffe4
01589 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01591 448b1c24                       mov        r11d, dword ptr [rsp]
01595 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0159d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015a2 4c891424                       mov        qword ptr [rsp], r10
015a6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015ab 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
015b3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
015b8 44895c2408                     mov        dword ptr [rsp + 8], r11d
015bd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015c2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015c7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015cc 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
015d1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
015d6 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015db 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015e0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
015e5 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
015ed 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
015f2 90                             nop        
015f3 90                             nop        
015f4 c5f877                         vzeroupper 
015f7 e8e472afff                     call       0x7f23ab6cda60
015fc 0f1f8400f416001f               nop        dword ptr [rax + rax + 0x1f0016f4]
01604 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0160e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01612 e889e4b319                     call       0x7f23c5714c20
01617 f4                             hlt        
01618 bee4ffffff                     mov        esi, 0xffffffe4
0161d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01625 448b1c24                       mov        r11d, dword ptr [rsp]
01629 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01631 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01636 4c891424                       mov        qword ptr [rsp], r10
0163a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0163f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01647 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01651 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01656 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0165b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01660 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01665 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0166a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0166f 90                             nop        
01670 c5f877                         vzeroupper 
01673 e86872afff                     call       0x7f23ab6cda60
01678 0f1f840070170020               nop        dword ptr [rax + rax + 0x20001770]
01680 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
0168a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0168e e80de4b319                     call       0x7f23c5714c20
01693 f4                             hlt        
01694 beccffffff                     mov        esi, 0xffffffcc
01699 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
016a1 448b1c24                       mov        r11d, dword ptr [rsp]
016a5 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
016ad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016b2 4c891424                       mov        qword ptr [rsp], r10
016b6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016bb 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
016c3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
016c8 44895c2408                     mov        dword ptr [rsp + 8], r11d
016cd 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016d2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016d7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016dc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016e1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016e6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016eb 90                             nop        
016ec c5f877                         vzeroupper 
016ef e8ec71afff                     call       0x7f23ab6cda60
016f4 0f1f8400ec170021               nop        dword ptr [rax + rax + 0x210017ec]
016fc 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170a e891e3b319                     call       0x7f23c5714c20
0170f f4                             hlt        
01710 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01718 458d5a08                       lea        r11d, [r10 + 8]
0171c 458bcb                         mov        r9d, r11d
0171f be6effffff                     mov        esi, 0xffffff6e
01724 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0172c 448b1424                       mov        r10d, dword ptr [rsp]
01730 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01738 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0173d 4c891424                       mov        qword ptr [rsp], r10
01741 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01746 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0174e 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01753 4489542408                     mov        dword ptr [rsp + 8], r10d
01758 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0175d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01762 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01767 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0176c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01771 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01776 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0177b 90                             nop        
0177c c5f877                         vzeroupper 
0177f e85c71afff                     call       0x7f23ab6cda60
01784 0f1f84007c180022               nop        dword ptr [rax + rax + 0x2200187c]
0178c 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179a e801e3b319                     call       0x7f23c5714c20
0179f f4                             hlt        
017a0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
017a8 458d5a08                       lea        r11d, [r10 + 8]
017ac 458bcb                         mov        r9d, r11d
017af be66ffffff                     mov        esi, 0xffffff66
017b4 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
017bc 448b1c24                       mov        r11d, dword ptr [rsp]
017c0 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
017c8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017cd 4c891424                       mov        qword ptr [rsp], r10
017d1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017d6 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
017de 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
017e3 44895c2408                     mov        dword ptr [rsp + 8], r11d
017e8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017ed 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017f2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
017f7 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
017fc 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01801 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01806 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0180b 90                             nop        
0180c c5f877                         vzeroupper 
0180f e8cc70afff                     call       0x7f23ab6cda60
01814 0f1f84000c190023               nop        dword ptr [rax + rax + 0x2300190c]
0181c 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01826 4883e4f0                       and        rsp, 0xfffffffffffffff0
0182a e871e2b319                     call       0x7f23c5714c20
0182f f4                             hlt        
01830 be6effffff                     mov        esi, 0xffffff6e
01835 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0183d 448b1c24                       mov        r11d, dword ptr [rsp]
01841 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01849 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0184e 4c891c24                       mov        qword ptr [rsp], r11
01852 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01857 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0185f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01864 4489442408                     mov        dword ptr [rsp + 8], r8d
01869 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0186e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01873 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01878 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0187d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01882 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01887 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0188c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01891 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01896 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0189a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0189f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
018a4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
018a9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
018ae 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
018b3 89542440                       mov        dword ptr [rsp + 0x40], edx
018b7 90                             nop        
018b8 c5f877                         vzeroupper 
018bb e82070afff                     call       0x7f23ab6cda60
018c0 0f1f8400b8190024               nop        dword ptr [rax + rax + 0x240019b8]
018c8 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
018d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018d6 e8c5e1b319                     call       0x7f23c5714c20
018db f4                             hlt        
018dc 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
018e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ea e8b1e1b319                     call       0x7f23c5714c20
018ef f4                             hlt        
018f0 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
018fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018fe e89de1b319                     call       0x7f23c5714c20
01903 f4                             hlt        
01904 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
0190e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01912 e889e1b319                     call       0x7f23c5714c20
01917 f4                             hlt        
01918 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01922 4883e4f0                       and        rsp, 0xfffffffffffffff0
01926 e875e1b319                     call       0x7f23c5714c20
0192b f4                             hlt        
0192c bee4ffffff                     mov        esi, 0xffffffe4
01931 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01939 448b1c24                       mov        r11d, dword ptr [rsp]
0193d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01945 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0194a 4c891424                       mov        qword ptr [rsp], r10
0194e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01953 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0195b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01960 44895c2408                     mov        dword ptr [rsp + 8], r11d
01965 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0196a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0196f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01974 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01979 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0197e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01983 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0198b 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01990 c5f877                         vzeroupper 
01993 e8486fafff                     call       0x7f23ab6cda60
01998 0f1f8400901a0025               nop        dword ptr [rax + rax + 0x25001a90]
019a0 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
019aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ae e8ede0b319                     call       0x7f23c5714c20
019b3 f4                             hlt        
019b4 bee4ffffff                     mov        esi, 0xffffffe4
019b9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019be 4489542404                     mov        dword ptr [rsp + 4], r10d
019c3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
019c8 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
019cd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019d2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
019d7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019dc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019e1 90                             nop        
019e2 90                             nop        
019e3 90                             nop        
019e4 c5f877                         vzeroupper 
019e7 e8f46eafff                     call       0x7f23ab6cda60
019ec 0f1f8400e41a0026               nop        dword ptr [rax + rax + 0x26001ae4]
019f4 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
019fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a02 e899e0b319                     call       0x7f23c5714c20
01a07 f4                             hlt        
01a08 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
01a0f ffc5                           inc        ebp
01a11 bee4ffffff                     mov        esi, 0xffffffe4
01a16 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a1b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01a20 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a25 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01a2a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a2f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a34 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a39 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a3e 90                             nop        
01a3f 90                             nop        
01a40 c5f877                         vzeroupper 
01a43 e8986eafff                     call       0x7f23ab6cda60
01a48 0f1f8400401b0027               nop        dword ptr [rax + rax + 0x27001b40]
01a50 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01a5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a5e e83de0b319                     call       0x7f23c5714c20
01a63 f4                             hlt        
01a64 bee4ffffff                     mov        esi, 0xffffffe4
01a69 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a6e 4489542404                     mov        dword ptr [rsp + 4], r10d
01a73 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a78 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01a7d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a82 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a87 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a8c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a91 90                             nop        
01a92 90                             nop        
01a93 90                             nop        
01a94 c5f877                         vzeroupper 
01a97 e8446eafff                     call       0x7f23ab6cda60
01a9c 0f1f8400941b0028               nop        dword ptr [rax + rax + 0x28001b94]
01aa4 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ab2 e8e9dfb319                     call       0x7f23c5714c20
01ab7 f4                             hlt        
01ab8 bee4ffffff                     mov        esi, 0xffffffe4
01abd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01ac5 448b1424                       mov        r10d, dword ptr [rsp]
01ac9 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01ad1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ad6 4c891424                       mov        qword ptr [rsp], r10
01ada 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01adf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01ae7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01aec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01af1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01af6 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01afb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b00 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b05 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b0a 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b0f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b14 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b19 90                             nop        
01b1a 90                             nop        
01b1b 90                             nop        
01b1c c5f877                         vzeroupper 
01b1f e8bc6dafff                     call       0x7f23ab6cda60
01b24 0f1f84001c1c0029               nop        dword ptr [rax + rax + 0x29001c1c]
01b2c 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b3a e861dfb319                     call       0x7f23c5714c20
01b3f f4                             hlt        
01b40 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01b45 beccffffff                     mov        esi, 0xffffffcc
01b4a 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b52 898c24c8000000                 mov        dword ptr [rsp + 0xc8], ecx
01b59 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
01b61 44890c24                       mov        dword ptr [rsp], r9d
01b65 48895c2408                     mov        qword ptr [rsp + 8], rbx
01b6a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b6f 90                             nop        
01b70 c5f877                         vzeroupper 
01b73 e8686dafff                     call       0x7f23ab6cda60
01b78 0f1f8400701c002a               nop        dword ptr [rax + rax + 0x2a001c70]
01b80 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b8e e80ddfb319                     call       0x7f23c5714c20
01b93 f4                             hlt        
01b94 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ba2 e8f9deb319                     call       0x7f23c5714c20
01ba7 f4                             hlt        
01ba8 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01bb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bb6 e8e5deb319                     call       0x7f23c5714c20
01bbb f4                             hlt        
01bbc 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01bc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bca e8d1deb319                     call       0x7f23c5714c20
01bcf f4                             hlt        
01bd0 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01bda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bde e8bddeb319                     call       0x7f23c5714c20
01be3 f4                             hlt        
01be4 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf2 e8a9deb319                     call       0x7f23c5714c20
01bf7 f4                             hlt        
01bf8 48bf80602484237f0000           movabs     rdi, 0x7f2384246080
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e895deb319                     call       0x7f23c5714c20
01c0b f4                             hlt        
01c0c bef6ffffff                     mov        esi, 0xfffffff6
01c11 90                             nop        
01c12 90                             nop        
01c13 90                             nop        
01c14 c5f877                         vzeroupper 
01c17 e8c46cafff                     call       0x7f23ab6cda60
01c1c 0f1f8400141d002b               nop        dword ptr [rax + rax + 0x2b001d14]
01c24 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01c2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c32 e869deb319                     call       0x7f23c5714c20
01c37 f4                             hlt        
01c38 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01c40 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c45 e95ff7ffff                     jmp        0x7f23abbd6529
01c4a eb14                           jmp        0x7f23abbd6de0
01c4c eb12                           jmp        0x7f23abbd6de0
01c4e eb10                           jmp        0x7f23abbd6de0
01c50 eb0e                           jmp        0x7f23abbd6de0
01c52 eb0c                           jmp        0x7f23abbd6de0
01c54 eb0a                           jmp        0x7f23abbd6de0
01c56 eb08                           jmp        0x7f23abbd6de0
01c58 eb06                           jmp        0x7f23abbd6de0
01c5a eb04                           jmp        0x7f23abbd6de0
01c5c eb02                           jmp        0x7f23abbd6de0
01c5e eb00                           jmp        0x7f23abbd6de0
01c60 488bf0                         mov        rsi, rax
01c63 e9a8e8ffff                     jmp        0x7f23abbd5690
01c68 bef6ffffff                     mov        esi, 0xfffffff6
01c6d 498beb                         mov        rbp, r11
01c70 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
01c77 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01c7f 90                             nop        
01c80 c5f877                         vzeroupper 
01c83 e8586cafff                     call       0x7f23ab6cda60
01c88 0f1f8400801d002c               nop        dword ptr [rax + rax + 0x2c001d80]
01c90 48bf90db2f84237f0000           movabs     rdi, 0x7f23842fdb90
01c9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9e e8fdddb319                     call       0x7f23c5714c20
01ca3 f4                             hlt        
01ca4 49ba535ebdab237f0000           movabs     r10, 0x7f23abbd5e53
01cae 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01cb5 e926b5b5ff                     jmp        0x7f23ab732360
01cba e8a183b4ff                     call       0x7f23ab71f1e0
01cbf e97ae3ffff                     jmp        0x7f23abbd51be
01cc4 f4                             hlt        
01cc5 f4                             hlt        
01cc6 f4                             hlt        
01cc7 f4                             hlt        
