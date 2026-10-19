00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b0a9ff                   jne        0x7f4b878fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f858c180000                   jne        0x7f4b87e6114a
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 448bc7                         mov        r8d, edi
0004c 488bde                         mov        rbx, rsi
0004f 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
00053 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00058 448b4e04                       mov        r9d, dword ptr [rsi + 4]
0005c 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00061 458bd9                         mov        r11d, r9d
00064 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
00069 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00071 453bcb                         cmp        r9d, r11d
00074 0f8f48110000                   jg         0x7f4b87e60a42
0007a 488b6e08                       mov        rbp, qword ptr [rsi + 8]
0007e 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
00082 48638c24c0000000               movsxd     rcx, dword ptr [rsp + 0xc0]
0008a 4c634c2418                     movsxd     r9, dword ptr [rsp + 0x18]
0008f 4c03cd                         add        r9, rbp
00092 4d2bd9                         sub        r11, r9
00095 493bcb                         cmp        rcx, r11
00098 0f8f24110000                   jg         0x7f4b87e60a42
0009e 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
000a2 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a6 4d85ed                         test       r13, r13
000a9 0f84510c0000                   je         0x7f4b87e60580
000af 33ff                           xor        edi, edi
000b1 4c8bda                         mov        r11, rdx
000b4 8b4204                         mov        eax, dword ptr [rdx + 4]
000b7 448b4e40                       mov        r9d, dword ptr [rsi + 0x40]
000bb 4585c0                         test       r8d, r8d
000be 0f8ef0100000                   jle        0x7f4b87e60a34
000c4 4c2bed                         sub        r13, rbp
000c7 8d48e0                         lea        ecx, [rax - 0x20]
000ca 8b542460                       mov        edx, dword ptr [rsp + 0x60]
000ce 83c2e0                         add        edx, -0x20
000d1 418b7204                       mov        esi, dword ptr [r10 + 4]
000d5 85f6                           test       esi, esi
000d7 0f8608110000                   jbe        0x7f4b87e60a65
000dd 89542428                       mov        dword ptr [rsp + 0x28], edx
000e1 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
000e5 89442404                       mov        dword ptr [rsp + 4], eax
000e9 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ee 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f3 48896c2420                     mov        qword ptr [rsp + 0x20], rbp
000f8 4c89542408                     mov        qword ptr [rsp + 8], r10
000fd 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00102 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0010a 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
0010f 4c63d6                         movsxd     r10, esi
00112 4d63d8                         movsxd     r11, r8d
00115 49ffcb                         dec        r11
00118 4d3bda                         cmp        r11, r10
0011b 0f83b7100000                   jae        0x7f4b87e60a58
00121 85ff                           test       edi, edi
00123 0f8417110000                   je         0x7f4b87e60ac0
00129 448d58f1                       lea        r11d, [rax - 0xf]
0012d 4585db                         test       r11d, r11d
00130 0f8c19110000                   jl         0x7f4b87e60acf
00136 458b5104                       mov        r10d, dword ptr [r9 + 4]
0013a 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0013f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00144 897c2464                       mov        dword ptr [rsp + 0x64], edi
00148 4183c2f1                       add        r10d, -0xf
0014c 4585d2                         test       r10d, r10d
0014f 0f8c09110000                   jl         0x7f4b87e60ade
00155 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0015d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00161 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00166 4585d2                         test       r10d, r10d
00169 0f8601110000                   jbe        0x7f4b87e60af0
0016f 4183fa01                       cmp        r10d, 1
00173 0f86f7100000                   jbe        0x7f4b87e60af0
00179 4183fa02                       cmp        r10d, 2
0017d 0f86ed100000                   jbe        0x7f4b87e60af0
00183 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00188 4183c3f9                       add        r11d, -7
0018c 4585db                         test       r11d, r11d
0018f 0f8cdb100000                   jl         0x7f4b87e60af0
00195 448bc0                         mov        r8d, eax
00198 4d8bd1                         mov        r10, r9
0019b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
001a0 4183c0f1                       add        r8d, -0xf
001a4 4489442448                     mov        dword ptr [rsp + 0x48], r8d
001a9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
001ae 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
001b3 458d5af1                       lea        r11d, [r10 - 0xf]
001b7 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001bc 4533d2                         xor        r10d, r10d
001bf 33db                           xor        ebx, ebx
001c1 e9c1010000                     jmp        0x7f4b87e5fc07
001c6 4533c0                         xor        r8d, r8d
001c9 4489442430                     mov        dword ptr [rsp + 0x30], r8d
001ce 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001d6 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
001da 448bda                         mov        r11d, edx
001dd 4183fb03                       cmp        r11d, 3
001e1 0f8e29020000                   jle        0x7f4b87e5fc90
001e7 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001ef 41894b10                       mov        dword ptr [r11 + 0x10], ecx
001f3 458b4308                       mov        r8d, dword ptr [r11 + 8]
001f7 4589430c                       mov        dword ptr [r11 + 0xc], r8d
001fb 448d5afd                       lea        r11d, [rdx - 3]
001ff 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00204 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0020c 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00211 45894308                       mov        dword ptr [r11 + 8], r8d
00215 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
0021c 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00221 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00226 48034c2420                     add        rcx, qword ptr [rsp + 0x20]
0022b 4c634c2430                     movsxd     r9, dword ptr [rsp + 0x30]
00230 4903c9                         add        rcx, r9
00233 4c3bd9                         cmp        r11, rcx
00236 0f8f1c0d0000                   jg         0x7f4b87e607d8
0023c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00241 4585db                         test       r11d, r11d
00244 0f8e660c0000                   jle        0x7f4b87e60730
0024a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0024f 4403442430                     add        r8d, dword ptr [rsp + 0x30]
00254 4403442434                     add        r8d, dword ptr [rsp + 0x34]
00259 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0025e 0f8f580d0000                   jg         0x7f4b87e6083c
00264 458bda                         mov        r11d, r10d
00267 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
0026c 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00271 0f8fcd0d0000                   jg         0x7f4b87e608c4
00277 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0027c 4183fb10                       cmp        r11d, 0x10
00280 0f8f460e0000                   jg         0x7f4b87e6094c
00286 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
0028b 0f838c0a0000                   jae        0x7f4b87e6059d
00291 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00299 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
002a0 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
002a5 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
002aa 0f83c40a0000                   jae        0x7f4b87e605f4
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
002e4 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
002e9 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002f1 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002f6 4183fb10                       cmp        r11d, 0x10
002fa 0f8f4c0e0000                   jg         0x7f4b87e609cc
00300 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00305 4183fa10                       cmp        r10d, 0x10
00309 0f8c01020000                   jl         0x7f4b87e5fd90
0030f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00317 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0031c 0f83ae0a0000                   jae        0x7f4b87e60650
00322 458bd3                         mov        r10d, r11d
00325 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0032a c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00331 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00336 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0033b 0f83f70a0000                   jae        0x7f4b87e606b8
00341 448bd1                         mov        r10d, ecx
00344 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00349 4d63ca                         movsxd     r9, r10d
0034c 478d1c10                       lea        r11d, [r8 + r10]
00350 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
00355 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0035a 4d63d0                         movsxd     r10, r8d
0035d 4d03d1                         add        r10, r9
00360 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00365 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0036c 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00373 ffc3                           inc        ebx
00375 3b5c2410                       cmp        ebx, dword ptr [rsp + 0x10]
00379 0f8ded070000                   jge        0x7f4b87e603ec
0037f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00387 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0038c 4d8b44db08                     mov        r8, qword ptr [r11 + rbx*8 + 8]
00391 4d8bd8                         mov        r11, r8
00394 49c1fb24                       sar        r11, 0x24
00398 458bdb                         mov        r11d, r11d
0039b 418bd3                         mov        edx, r11d
0039e 4d8bc8                         mov        r9, r8
003a1 49c1e912                       shr        r9, 0x12
003a5 458bd8                         mov        r11d, r8d
003a8 458bc9                         mov        r9d, r9d
003ab 4181e3ffff0100                 and        r11d, 0x1ffff
003b2 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
003b7 4181e1ffff0300                 and        r9d, 0x3ffff
003be 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
003c3 448bda                         mov        r11d, edx
003c6 4585db                         test       r11d, r11d
003c9 0f8c010b0000                   jl         0x7f4b87e60750
003cf 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
003d4 4585db                         test       r11d, r11d
003d7 0f84e9fdffff                   je         0x7f4b87e5fa46
003dd 448b0424                       mov        r8d, dword ptr [rsp]
003e1 452bc2                         sub        r8d, r10d
003e4 453bd8                         cmp        r11d, r8d
003e7 0f8ee1fdffff                   jle        0x7f4b87e5fa4e
003ed be45ffffff                     mov        esi, 0xffffff45
003f2 418beb                         mov        ebp, r11d
003f5 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
003fd 666690                         nop        
00400 c5f877                         vzeroupper 
00403 e8d839b6ff                     call       0x7f4b879c3660
00408 0f1f840000050000               nop        dword ptr [rax + rax + 0x500]
00410 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00415 4585c0                         test       r8d, r8d
00418 7406                           je         0x7f4b87e5fca0
0041a 41ffcb                         dec        r11d
0041d 418bd3                         mov        edx, r11d
00420 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00428 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0042c 85d2                           test       edx, edx
0042e 0f8450080000                   je         0x7f4b87e60504
00434 83fa03                         cmp        edx, 3
00437 0f8453080000                   je         0x7f4b87e60510
0043d 83fa02                         cmp        edx, 2
00440 0f878a000000                   ja         0x7f4b87e5fd50
00446 3b54243c                       cmp        edx, dword ptr [rsp + 0x3c]
0044a 0f836c0e0000                   jae        0x7f4b87e60b3c
00450 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00458 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
0045d 85d2                           test       edx, edx
0045f 7e52                           jle        0x7f4b87e5fd33
00461 448d4aff                       lea        r9d, [rdx - 1]
00465 443b4c243c                     cmp        r9d, dword ptr [rsp + 0x3c]
0046a 0f833c110000                   jae        0x7f4b87e60e2c
00470 4863fa                         movsxd     rdi, edx
00473 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0047b 458bc8                         mov        r9d, r8d
0047e 4183c1cc                       add        r9d, -0x34
00482 41c1e902                       shr        r9d, 2
00486 458d4411ff                     lea        r8d, [r9 + rdx - 1]
0048b b904000000                     mov        ecx, 4
00490 c442f0f5c0                     bzhi       r8, r8, rcx
00495 492bf8                         sub        rdi, r8
00498 48ffcf                         dec        rdi
0049b 4533c0                         xor        r8d, r8d
0049e 4885ff                         test       rdi, rdi
004a1 490f4cf8                       cmovl      rdi, r8
004a5 8bcf                           mov        ecx, edi
004a7 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
004ae e988050000                     jmp        0x7f4b87e602bb
004b3 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
004ba 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004c2 45895808                       mov        dword ptr [r8 + 8], r11d
004c6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
004cb e94cfdffff                     jmp        0x7f4b87e5fa9c
004d0 895c2404                       mov        dword ptr [rsp + 4], ebx
004d4 48be80af72e200000000           movabs     rsi, 0xe272af80
004de 418bea                         mov        ebp, r10d
004e1 666690                         nop        
004e4 c5f877                         vzeroupper 
004e7 e8f4baa9ff                     call       0x7f4b878fb860
004ec 0f1f8400e4050001               nop        dword ptr [rax + rax + 0x10005e4]
004f4 4885c0                         test       rax, rax
004f7 0f844f0e0000                   je         0x7f4b87e60bcc
004fd 488bf0                         mov        rsi, rax
00500 c5f877                         vzeroupper 
00503 4881c4b0000000                 add        rsp, 0xb0
0050a 5d                             pop        rbp
0050b e9d0b7b6ff                     jmp        0x7f4b879cb560
00510 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00515 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
0051a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0051f 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00524 0f8d9a020000                   jge        0x7f4b87e60044
0052a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0052f 4183c208                       add        r10d, 8
00533 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0053b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00540 4183fb08                       cmp        r11d, 8
00544 0f8d9f010000                   jge        0x7f4b87e5ff69
0054a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00552 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00557 0f83ef100000                   jae        0x7f4b87e60ecc
0055d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00562 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
00568 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0056d 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00572 0f8348110000                   jae        0x7f4b87e60f40
00578 4c63d1                         movsxd     r10, ecx
0057b 4c635c2430                     movsxd     r11, dword ptr [rsp + 0x30]
00580 4d03da                         add        r11, r10
00583 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00588 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
0058d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00595 4183c303                       add        r11d, 3
00599 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0059e 41ffc0                         inc        r8d
005a1 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
005a9 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
005ae 0f834c110000                   jae        0x7f4b87e60f80
005b4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005b9 4183c303                       add        r11d, 3
005bd 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
005c5 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
005ca 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
005d0 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
005d5 0f8375110000                   jae        0x7f4b87e60fd0
005db 4c63d9                         movsxd     r11, ecx
005de 4c63442430                     movsxd     r8, dword ptr [rsp + 0x30]
005e3 4d03c3                         add        r8, r11
005e6 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
005eb 43886c0109                     mov        byte ptr [r9 + r8 + 9], bpl
005f0 470fbe4c110a                   movsx      r9d, byte ptr [r9 + r10 + 0xa]
005f6 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
005fa 46884c010a                     mov        byte ptr [rcx + r8 + 0xa], r9b
005ff 460fbe54110b                   movsx      r10d, byte ptr [rcx + r10 + 0xb]
00605 448bc9                         mov        r9d, ecx
00608 478854010b                     mov        byte ptr [r9 + r8 + 0xb], r10b
0060d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00612 4183fa08                       cmp        r10d, 8
00616 0f8374110000                   jae        0x7f4b87e61010
0061c 49bac0e870e200000000           movabs     r10, 0xe270e8c0
00626 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0062b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00633 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00638 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0063d 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00642 4183fb04                       cmp        r11d, 4
00646 7e3c                           jle        0x7f4b87e5ff04
00648 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0064c 83c504                         add        ebp, 4
0064f 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00654 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00658 c5f877                         vzeroupper 
0065b e880b9a9ff                     call       0x7f4b878fb860
00660 0f1f840058070002               nop        dword ptr [rax + rax + 0x2000758]
00668 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0066d 8bd5                           mov        edx, ebp
0066f 8bc8                           mov        ecx, eax
00671 666690                         nop        
00674 c5f877                         vzeroupper 
00677 e864b9a9ff                     call       0x7f4b878fb860
0067c 0f1f840074070003               nop        dword ptr [rax + rax + 0x3000774]
00684 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00689 4183fb08                       cmp        r11d, 8
0068d 0f8ed9fcffff                   jle        0x7f4b87e5fbec
00693 49bae8e870e200000000           movabs     r10, 0xe270e8e8
0069d 8b542430                       mov        edx, dword ptr [rsp + 0x30]
006a1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
006a6 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
006ab 83c208                         add        edx, 8
006ae 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006b3 90                             nop        
006b4 c5f877                         vzeroupper 
006b7 e824b9a9ff                     call       0x7f4b878fb860
006bc 0f1f8400b4070004               nop        dword ptr [rax + rax + 0x40007b4]
006c4 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006c9 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
006d0 488bc8                         mov        rcx, rax
006d3 90                             nop        
006d4 c5f877                         vzeroupper 
006d7 e804b9a9ff                     call       0x7f4b878fb860
006dc 0f1f8400d4070005               nop        dword ptr [rax + rax + 0x50007d4]
006e4 e983fcffff                     jmp        0x7f4b87e5fbec
006e9 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006ee 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
006f5 666690                         nop        
006f8 c5f877                         vzeroupper 
006fb e8e0b8a9ff                     call       0x7f4b878fb860
00700 0f1f8400f8070006               nop        dword ptr [rax + rax + 0x60007f8]
00708 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0070d 8b542438                       mov        edx, dword ptr [rsp + 0x38]
00711 488bc8                         mov        rcx, rax
00714 c5f877                         vzeroupper 
00717 e8c4b8a9ff                     call       0x7f4b878fb860
0071c 0f1f840014080007               nop        dword ptr [rax + rax + 0x7000814]
00724 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0072c 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00731 0f8d35fcffff                   jge        0x7f4b87e5fbec
00737 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0073c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00743 0f8edf040000                   jle        0x7f4b87e604a8
00749 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00751 4183c008                       add        r8d, 8
00755 be66ffffff                     mov        esi, 0xffffff66
0075a 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00762 448b1424                       mov        r10d, dword ptr [rsp]
00766 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0076e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00773 4c891424                       mov        qword ptr [rsp], r10
00777 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0077c 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00784 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00789 4489542408                     mov        dword ptr [rsp + 8], r10d
0078e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00793 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00798 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0079d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
007a2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
007ac 4489442428                     mov        dword ptr [rsp + 0x28], r8d
007b1 666690                         nop        
007b4 c5f877                         vzeroupper 
007b7 e82436b6ff                     call       0x7f4b879c3660
007bc 0f1f8400b4080008               nop        dword ptr [rax + rax + 0x80008b4]
007c4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
007c9 4183fb30                       cmp        r11d, 0x30
007cd 0f8fd6010000                   jg         0x7f4b87e60229
007d3 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
007d7 83c5f9                         add        ebp, -7
007da 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007de 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
007e6 443bdd                         cmp        r11d, ebp
007e9 0f83750b0000                   jae        0x7f4b87e60be4
007ef 418beb                         mov        ebp, r11d
007f2 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
007f9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
007fe 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00803 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
0080b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00810 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00815 0f83c90b0000                   jae        0x7f4b87e60c64
0081b 448bd1                         mov        r10d, ecx
0081e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00826 4d63d2                         movsxd     r10, r10d
00829 8b6c2430                       mov        ebp, dword ptr [rsp + 0x30]
0082d 4c63dd                         movsxd     r11, ebp
00830 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
00835 48be28c122e200000000           movabs     rsi, 0xe222c128
0083f 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00844 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0084c 4533c9                         xor        r9d, r9d
0084f 90                             nop        
00850 c5f877                         vzeroupper 
00853 e888ada9ff                     call       0x7f4b878fae60
00858 0f1f840050090009               nop        dword ptr [rax + rax + 0x9000950]
00860 03ac2490000000                 add        ebp, dword ptr [rsp + 0x90]
00867 896c2438                       mov        dword ptr [rsp + 0x38], ebp
0086b 448d5508                       lea        r10d, [rbp + 8]
0086f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00877 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
0087c 0f8d13010000                   jge        0x7f4b87e60215
00882 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0088a 442bd5                         sub        r10d, ebp
0088d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00892 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
00897 4983c0f9                       add        r8, -7
0089b 4d63ca                         movsxd     r9, r10d
0089e 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008a6 4f8d140b                       lea        r10, [r11 + r9]
008aa 4d3bd0                         cmp        r10, r8
008ad 0f83010c0000                   jae        0x7f4b87e60d34
008b3 4c63542418                     movsxd     r10, dword ptr [rsp + 0x18]
008b8 4d2bd3                         sub        r10, r11
008bb 4983c207                       add        r10, 7
008bf 4983e2f8                       and        r10, 0xfffffffffffffff8
008c3 458bda                         mov        r11d, r10d
008c6 458d5c2b08                     lea        r11d, [r11 + rbp + 8]
008cb 4d63db                         movsxd     r11, r11d
008ce 4f8d5419f8                     lea        r10, [r9 + r11 - 8]
008d3 4d3bd0                         cmp        r10, r8
008d6 0f83d80b0000                   jae        0x7f4b87e60d34
008dc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008e4 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
008e9 0f83c50b0000                   jae        0x7f4b87e60d34
008ef 4983c3f8                       add        r11, -8
008f3 4d3bd8                         cmp        r11, r8
008f6 0f83b80b0000                   jae        0x7f4b87e60d34
008fc 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00901 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00908 0f8f220c0000                   jg         0x7f4b87e60db0
0090e 6690                           nop        
00910 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00918 4963cb                         movsxd     rcx, r11d
0091b 4883c108                       add        rcx, 8
0091f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00926 036c2430                       add        ebp, dword ptr [rsp + 0x30]
0092a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0092f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00934 48be28c122e200000000           movabs     rsi, 0xe222c128
0093e 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00943 4533c9                         xor        r9d, r9d
00946 6690                           nop        
00948 c5f877                         vzeroupper 
0094b e890aca9ff                     call       0x7f4b878fae60
00950 0f1f8400480a000a               nop        dword ptr [rax + rax + 0xa000a48]
00958 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00960 4183c308                       add        r11d, 8
00964 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0096c 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00971 7c9d                           jl         0x7f4b87e60190
00973 eb20                           jmp        0x7f4b87e60215
00975 4d63d3                         movsxd     r10, r11d
00978 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0097f c442a8f5db                     bzhi       r11, r11, r10
00984 c4c1fb92fb                     kmovq      k7, r11
00989 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0098f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00995 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0099a 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
0099f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
009a4 e9c3f9ffff                     jmp        0x7f4b87e5fbec
009a9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
009b1 4585db                         test       r11d, r11d
009b4 0f8c920a0000                   jl         0x7f4b87e60ccc
009ba 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009bf 4585d2                         test       r10d, r10d
009c2 0f8c840a0000                   jl         0x7f4b87e60ccc
009c8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
009cd 4503d3                         add        r10d, r11d
009d0 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
009d4 413bca                         cmp        ecx, r10d
009d7 0f826f0a0000                   jb         0x7f4b87e60ccc
009dd 448bd1                         mov        r10d, ecx
009e0 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
009e5 0f82610a0000                   jb         0x7f4b87e60ccc
009eb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009f0 4585db                         test       r11d, r11d
009f3 74a0                           je         0x7f4b87e60215
009f5 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
009fa 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00a01 498d7c0a08                     lea        rdi, [r10 + rcx + 8]
00a06 4d03c8                         add        r9, r8
00a09 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00a0e 4963d3                         movsxd     rdx, r11d
00a11 4883fa20                       cmp        rdx, 0x20
00a15 0f865affffff                   jbe        0x7f4b87e601f5
00a1b c5f877                         vzeroupper 
00a1e 49ba204f8e874b7f0000           movabs     r10, 0x7f4b878e4f20
00a28 41ffd2                         call       r10
00a2b 0f1f840000000000               nop        dword ptr [rax + rax]
00a33 e95dffffff                     jmp        0x7f4b87e60215
00a38 418bd0                         mov        edx, r8d
00a3b 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00a43 458b449104                     mov        r8d, dword ptr [r9 + rdx*4 + 4]
00a48 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00a50 4489449308                     mov        dword ptr [rbx + rdx*4 + 8], r8d
00a55 448d42ff                       lea        r8d, [rdx - 1]
00a59 443bc1                         cmp        r8d, ecx
00a5c 7fda                           jg         0x7f4b87e602b8
00a5e 4183f83f                       cmp        r8d, 0x3f
00a62 0f8edc0b0000                   jle        0x7f4b87e60ec4
00a68 448bc2                         mov        r8d, edx
00a6b 41ffc8                         dec        r8d
00a6e eb03                           jmp        0x7f4b87e602f3
00a70 458bc1                         mov        r8d, r9d
00a73 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00a7b 62917e486f8481c8ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + r8*4 - 0x38]
00a86 62917e487f8481ccffffff         vmovdqu32  zmmword ptr [r9 + r8*4 - 0x34], zmm0
00a91 62917e486f848188ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + r8*4 - 0x78]
00a9c 62917e487f84818cffffff         vmovdqu32  zmmword ptr [r9 + r8*4 - 0x74], zmm0
00aa7 62917e486f848148ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + r8*4 - 0xb8]
00ab2 62917e487f84814cffffff         vmovdqu32  zmmword ptr [r9 + r8*4 - 0xb4], zmm0
00abd 62917e486f848108ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + r8*4 - 0xf8]
00ac8 62917e487f84810cffffff         vmovdqu32  zmmword ptr [r9 + r8*4 - 0xf4], zmm0
00ad3 458d48c0                       lea        r9d, [r8 - 0x40]
00ad7 4183f93f                       cmp        r9d, 0x3f
00adb 7f93                           jg         0x7f4b87e602f0
00add 4183f90f                       cmp        r9d, 0xf
00ae1 7e31                           jle        0x7f4b87e60394
00ae3 458bc8                         mov        r9d, r8d
00ae6 4183c1c0                       add        r9d, -0x40
00aea 6690                           nop        
00aec 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00af4 62917e486f8488c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x38]
00aff 62917e487f8488ccffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x34], zmm0
00b0a 4183c1f0                       add        r9d, -0x10
00b0e 4183f90f                       cmp        r9d, 0xf
00b12 7fd8                           jg         0x7f4b87e6036c
00b14 4585c9                         test       r9d, r9d
00b17 0f8e9df9ffff                   jle        0x7f4b87e5fd3a
00b1d 666690                         nop        
00b20 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00b28 478b448804                     mov        r8d, dword ptr [r8 + r9*4 + 4]
00b2d 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00b35 4689448908                     mov        dword ptr [rcx + r9*4 + 8], r8d
00b3a 41ffc9                         dec        r9d
00b3d 4585c9                         test       r9d, r9d
00b40 7fde                           jg         0x7f4b87e603a0
00b42 e973f9ffff                     jmp        0x7f4b87e5fd3a
00b47 4d63d2                         movsxd     r10, r10d
00b4a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b51 c442a8f5db                     bzhi       r11, r11, r10
00b56 c4c1fb92fb                     kmovq      k7, r11
00b5b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b61 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b67 e99b000000                     jmp        0x7f4b87e60487
00b6c 448b1424                       mov        r10d, dword ptr [rsp]
00b70 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00b78 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00b7d 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00b85 8b442404                       mov        eax, dword ptr [rsp + 4]
00b89 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b8e 8bbc2480000000                 mov        edi, dword ptr [rsp + 0x80]
00b95 418b4904                       mov        ecx, dword ptr [r9 + 4]
00b99 85ff                           test       edi, edi
00b9b 0f8c630c0000                   jl         0x7f4b87e61084
00ba1 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00ba6 4585c0                         test       r8d, r8d
00ba9 0f8c5a0c0000                   jl         0x7f4b87e61089
00baf 3b0424                         cmp        eax, dword ptr [rsp]
00bb2 0f82510c0000                   jb         0x7f4b87e61089
00bb8 8b6c2418                       mov        ebp, dword ptr [rsp + 0x18]
00bbc 4103ea                         add        ebp, r10d
00bbf 3bcd                           cmp        ecx, ebp
00bc1 0f82420c0000                   jb         0x7f4b87e61089
00bc7 4585d2                         test       r10d, r10d
00bca 0f8c390c0000                   jl         0x7f4b87e61089
00bd0 4585d2                         test       r10d, r10d
00bd3 7432                           je         0x7f4b87e60487
00bd5 498d7c3b08                     lea        rdi, [r11 + rdi + 8]
00bda 4d8bd9                         mov        r11, r9
00bdd 4b8d740108                     lea        rsi, [r9 + r8 + 8]
00be2 4963d2                         movsxd     rdx, r10d
00be5 4883fa20                       cmp        rdx, 0x20
00be9 0f8658ffffff                   jbe        0x7f4b87e603c7
00bef c5f877                         vzeroupper 
00bf2 49ba204f8e874b7f0000           movabs     r10, 0x7f4b878e4f20
00bfc 41ffd2                         call       r10
00bff 0f1f840000000000               nop        dword ptr [rax + rax]
00c07 896b38                         mov        dword ptr [rbx + 0x38], ebp
00c0a c5f877                         vzeroupper 
00c0d 4881c4b0000000                 add        rsp, 0xb0
00c14 5d                             pop        rbp
00c15 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c19 0f87950c0000                   ja         0x7f4b87e61134
00c1f c3                             ret        
00c20 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00c28 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00c2f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00c33 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c38 8bd5                           mov        edx, ebp
00c3a 6690                           nop        
00c3c c5f877                         vzeroupper 
00c3f e89cb3a9ff                     call       0x7f4b878fb860
00c44 0f1f84003c0d000b               nop        dword ptr [rax + rax + 0xb000d3c]
00c4c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c51 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c58 488bc8                         mov        rcx, rax
00c5b 90                             nop        
00c5c c5f877                         vzeroupper 
00c5f e87cb3a9ff                     call       0x7f4b878fb860
00c64 0f1f84005c0d000c               nop        dword ptr [rax + rax + 0xc000d5c]
00c6c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c74 4183c208                       add        r10d, 8
00c78 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c7d 7ca1                           jl         0x7f4b87e604a0
00c7f e9e8f6ffff                     jmp        0x7f4b87e5fbec
00c84 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00c8b e936f8ffff                     jmp        0x7f4b87e5fd46
00c90 41ffcb                         dec        r11d
00c93 4585db                         test       r11d, r11d
00c96 7e24                           jle        0x7f4b87e6053c
00c98 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00ca0 41894810                       mov        dword ptr [r8 + 0x10], ecx
00ca4 458b4808                       mov        r9d, dword ptr [r8 + 8]
00ca8 4589480c                       mov        dword ptr [r8 + 0xc], r9d
00cac 45895808                       mov        dword ptr [r8 + 8], r11d
00cb0 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00cb7 e90af8ffff                     jmp        0x7f4b87e5fd46
00cbc 895c2404                       mov        dword ptr [rsp + 4], ebx
00cc0 48be50af72e200000000           movabs     rsi, 0xe272af50
00cca 418bea                         mov        ebp, r10d
00ccd 666690                         nop        
00cd0 c5f877                         vzeroupper 
00cd3 e808b3a9ff                     call       0x7f4b878fb860
00cd8 0f1f8400d00d000d               nop        dword ptr [rax + rax + 0xd000dd0]
00ce0 4885c0                         test       rax, rax
00ce3 0f8514f8ffff                   jne        0x7f4b87e5fd7d
00ce9 bef6ffffff                     mov        esi, 0xfffffff6
00cee 6690                           nop        
00cf0 c5f877                         vzeroupper 
00cf3 e8e830b6ff                     call       0x7f4b879c3660
00cf8 0f1f8400f00d000e               nop        dword ptr [rax + rax + 0xe000df0]
00d00 4c03c9                         add        r9, rcx
00d03 4d3bce                         cmp        r9, r14
00d06 7e08                           jle        0x7f4b87e60590
00d08 4533ed                         xor        r13d, r13d
00d0b e99ff3ffff                     jmp        0x7f4b87e5f92f
00d10 4533ed                         xor        r13d, r13d
00d13 bf01000000                     mov        edi, 1
00d18 e994f3ffff                     jmp        0x7f4b87e5f931
00d1d bee4ffffff                     mov        esi, 0xffffffe4
00d22 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00d2a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d2f 4489442404                     mov        dword ptr [rsp + 4], r8d
00d34 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d39 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00d3e 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d43 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00d48 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d4d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00d52 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00d57 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00d5c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00d61 666690                         nop        
00d64 c5f877                         vzeroupper 
00d67 e87430b6ff                     call       0x7f4b879c3660
00d6c 0f1f8400640e000f               nop        dword ptr [rax + rax + 0xf000e64]
00d74 bee4ffffff                     mov        esi, 0xffffffe4
00d79 498beb                         mov        rbp, r11
00d7c 448b0424                       mov        r8d, dword ptr [rsp]
00d80 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00d88 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00d8d 4c891c24                       mov        qword ptr [rsp], r11
00d91 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d96 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00d9e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00da3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00da8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00dad 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00db2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00db7 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00dbd 666690                         nop        
00dc0 c5f877                         vzeroupper 
00dc3 e81830b6ff                     call       0x7f4b879c3660
00dc8 0f1f8400c00e0010               nop        dword ptr [rax + rax + 0x10000ec0]
00dd0 bee4ffffff                     mov        esi, 0xffffffe4
00dd5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ddd 448b1c24                       mov        r11d, dword ptr [rsp]
00de1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00de9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00dee 4c891424                       mov        qword ptr [rsp], r10
00df2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00df7 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00dff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e09 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e0e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e13 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e18 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e1d 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e22 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e27 90                             nop        
00e28 c5f877                         vzeroupper 
00e2b e8b02fb6ff                     call       0x7f4b879c3660
00e30 0f1f8400280f0011               nop        dword ptr [rax + rax + 0x11000f28]
00e38 bee4ffffff                     mov        esi, 0xffffffe4
00e3d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e45 448b1c24                       mov        r11d, dword ptr [rsp]
00e49 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e51 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e56 4c891424                       mov        qword ptr [rsp], r10
00e5a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e5f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00e67 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e6c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e71 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e76 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e7b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e80 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e85 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e8a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e8f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e94 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e99 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00e9f 90                             nop        
00ea0 c5f877                         vzeroupper 
00ea3 e8382fb6ff                     call       0x7f4b879c3660
00ea8 0f1f8400a00f0012               nop        dword ptr [rax + rax + 0x12000fa0]
00eb0 be45ffffff                     mov        esi, 0xffffff45
00eb5 48898c24c0000000               mov        qword ptr [rsp + 0xc0], rcx
00ebd 666690                         nop        
00ec0 c5f877                         vzeroupper 
00ec3 e8182fb6ff                     call       0x7f4b879c3660
00ec8 0f1f8400c00f0013               nop        dword ptr [rax + rax + 0x13000fc0]
00ed0 be45ffffff                     mov        esi, 0xffffff45
00ed5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00edd 448b1c24                       mov        r11d, dword ptr [rsp]
00ee1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00ee9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00eee 4c891c24                       mov        qword ptr [rsp], r11
00ef2 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ef7 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00eff 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00f04 44895c2408                     mov        dword ptr [rsp + 8], r11d
00f09 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00f0e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f13 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00f18 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f1d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f22 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f27 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f2c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f31 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f36 895c2424                       mov        dword ptr [rsp + 0x24], ebx
00f3a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f3f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f44 89542430                       mov        dword ptr [rsp + 0x30], edx
00f48 c5f877                         vzeroupper 
00f4b e8902eb6ff                     call       0x7f4b879c3660
00f50 0f1f840048100014               nop        dword ptr [rax + rax + 0x14001048]
00f58 4c3bd9                         cmp        r11, rcx
00f5b bdffffffff                     mov        ebp, 0xffffffff
00f60 7c08                           jl         0x7f4b87e607ea
00f62 400f95c5                       setne      bpl
00f66 400fb6ed                       movzx      ebp, bpl
00f6a be45ffffff                     mov        esi, 0xffffff45
00f6f 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f74 4489442404                     mov        dword ptr [rsp + 4], r8d
00f79 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00f7e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00f83 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00f88 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00f8d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00f92 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f97 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00f9c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fa1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00fa6 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
00fab 90                             nop        
00fac c5f877                         vzeroupper 
00faf e82c2eb6ff                     call       0x7f4b879c3660
00fb4 0f1f8400ac100015               nop        dword ptr [rax + rax + 0x150010ac]
00fbc be45ffffff                     mov        esi, 0xffffff45
00fc1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00fc9 448b1c24                       mov        r11d, dword ptr [rsp]
00fcd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00fd5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00fda 4c891c24                       mov        qword ptr [rsp], r11
00fde 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00fe3 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
00feb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00ff0 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ff5 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
00ffa 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00fff 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01004 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01009 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0100e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01013 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01018 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0101d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01022 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01027 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0102c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01031 666690                         nop        
01034 c5f877                         vzeroupper 
01037 e8a42db6ff                     call       0x7f4b879c3660
0103c 0f1f840034110016               nop        dword ptr [rax + rax + 0x16001134]
01044 be45ffffff                     mov        esi, 0xffffff45
01049 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01051 448b0424                       mov        r8d, dword ptr [rsp]
01055 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0105d 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01062 4c890424                       mov        qword ptr [rsp], r8
01066 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0106b 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
01073 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01078 4489442408                     mov        dword ptr [rsp + 8], r8d
0107d 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01082 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01087 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0108c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01091 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01096 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0109b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
010a0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
010a5 4489442428                     mov        dword ptr [rsp + 0x28], r8d
010aa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
010af 4489542430                     mov        dword ptr [rsp + 0x30], r10d
010b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
010b9 666690                         nop        
010bc c5f877                         vzeroupper 
010bf e81c2db6ff                     call       0x7f4b879c3660
010c4 0f1f8400bc110017               nop        dword ptr [rax + rax + 0x170011bc]
010cc be45ffffff                     mov        esi, 0xffffff45
010d1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
010d9 448b1c24                       mov        r11d, dword ptr [rsp]
010dd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
010e5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010ea 4c891c24                       mov        qword ptr [rsp], r11
010ee 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010f3 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
010fb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01100 44895c2408                     mov        dword ptr [rsp + 8], r11d
01105 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0110a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0110f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01114 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01119 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0111e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01123 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01128 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0112d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01132 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01137 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0113c c5f877                         vzeroupper 
0113f e89c2cb6ff                     call       0x7f4b879c3660
01144 0f1f84003c120018               nop        dword ptr [rax + rax + 0x1800123c]
0114c be45ffffff                     mov        esi, 0xffffff45
01151 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01159 448b1424                       mov        r10d, dword ptr [rsp]
0115d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01165 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0116a 4c891424                       mov        qword ptr [rsp], r10
0116e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01173 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0117b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01180 4489542408                     mov        dword ptr [rsp + 8], r10d
01185 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0118a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0118f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01194 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01199 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0119e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
011a3 90                             nop        
011a4 c5f877                         vzeroupper 
011a7 e8342cb6ff                     call       0x7f4b879c3660
011ac 0f1f8400a4120019               nop        dword ptr [rax + rax + 0x190012a4]
011b4 448b0424                       mov        r8d, dword ptr [rsp]
011b8 33ff                           xor        edi, edi
011ba 458bd0                         mov        r10d, r8d
011bd e9d3f9ffff                     jmp        0x7f4b87e60415
011c2 be17000000                     mov        esi, 0x17
011c7 90                             nop        
011c8 c5f877                         vzeroupper 
011cb e8102cb6ff                     call       0x7f4b879c3660
011d0 0f1f8400c812001a               nop        dword ptr [rax + rax + 0x1a0012c8]
011d8 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
011e0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011e5 be6effffff                     mov        esi, 0xffffff6e
011ea 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
011f2 4c89542408                     mov        qword ptr [rsp + 8], r10
011f7 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
011fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01201 8b442418                       mov        eax, dword ptr [rsp + 0x18]
01205 89442414                       mov        dword ptr [rsp + 0x14], eax
01209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0120e 89542418                       mov        dword ptr [rsp + 0x18], edx
01212 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01216 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0121b 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01220 897c2430                       mov        dword ptr [rsp + 0x30], edi
01224 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01229 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0122e 6690                           nop        
01230 c5f877                         vzeroupper 
01233 e8a82bb6ff                     call       0x7f4b879c3660
01238 0f1f84003013001b               nop        dword ptr [rax + rax + 0x1b001330]
01240 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01248 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0124d eb96                           jmp        0x7f4b87e60a65
0124f 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01257 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0125c eb87                           jmp        0x7f4b87e60a65
0125e 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01266 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0126b e975ffffff                     jmp        0x7f4b87e60a65
01270 bebeffffff                     mov        esi, 0xffffffbe
01275 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0127d 448b1c24                       mov        r11d, dword ptr [rsp]
01281 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01289 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0128e 4c891424                       mov        qword ptr [rsp], r10
01292 44894c2408                     mov        dword ptr [rsp + 8], r9d
01297 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0129c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
012a1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012a6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012ab 90                             nop        
012ac c5f877                         vzeroupper 
012af e82c2bb6ff                     call       0x7f4b879c3660
012b4 0f1f8400ac13001c               nop        dword ptr [rax + rax + 0x1c0013ac]
012bc bee4ffffff                     mov        esi, 0xffffffe4
012c1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
012c9 448b1c24                       mov        r11d, dword ptr [rsp]
012cd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
012d5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012da 4c891c24                       mov        qword ptr [rsp], r11
012de 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
012e3 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
012eb 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
012f0 4489442408                     mov        dword ptr [rsp + 8], r8d
012f5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
012fa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012ff 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01304 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01309 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0130e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01313 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01318 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0131d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01322 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01326 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0132b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01330 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01335 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01339 666690                         nop        
0133c c5f877                         vzeroupper 
0133f e89c2ab6ff                     call       0x7f4b879c3660
01344 0f1f84003c14001d               nop        dword ptr [rax + rax + 0x1d00143c]
0134c bef6ffffff                     mov        esi, 0xfffffff6
01351 666690                         nop        
01354 c5f877                         vzeroupper 
01357 e8842ab6ff                     call       0x7f4b879c3660
0135c 0f1f84005414001e               nop        dword ptr [rax + rax + 0x1e001454]
01364 bee4ffffff                     mov        esi, 0xffffffe4
01369 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01371 448b1424                       mov        r10d, dword ptr [rsp]
01375 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0137d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01382 4c891424                       mov        qword ptr [rsp], r10
01386 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0138b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01393 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01398 4489542408                     mov        dword ptr [rsp + 8], r10d
0139d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013a2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013a7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
013ac 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
013b1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
013b6 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
013bb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
013c0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
013c5 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
013cd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
013d2 6690                           nop        
013d4 c5f877                         vzeroupper 
013d7 e8042ab6ff                     call       0x7f4b879c3660
013dc 0f1f8400d414001f               nop        dword ptr [rax + rax + 0x1f0014d4]
013e4 bee4ffffff                     mov        esi, 0xffffffe4
013e9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
013f1 448b1424                       mov        r10d, dword ptr [rsp]
013f5 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
013fd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01402 4c891424                       mov        qword ptr [rsp], r10
01406 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0140b 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01413 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01418 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0141d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01422 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01427 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0142c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01431 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01436 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0143b 90                             nop        
0143c c5f877                         vzeroupper 
0143f e89c29b6ff                     call       0x7f4b879c3660
01444 0f1f84003c150020               nop        dword ptr [rax + rax + 0x2000153c]
0144c beccffffff                     mov        esi, 0xffffffcc
01451 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01459 448b1424                       mov        r10d, dword ptr [rsp]
0145d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01465 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0146a 4c891424                       mov        qword ptr [rsp], r10
0146e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01473 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0147b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01480 4489542408                     mov        dword ptr [rsp + 8], r10d
01485 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0148a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0148f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01494 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01499 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0149e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
014a3 90                             nop        
014a4 c5f877                         vzeroupper 
014a7 e83429b6ff                     call       0x7f4b879c3660
014ac 0f1f8400a4150021               nop        dword ptr [rax + rax + 0x210015a4]
014b4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
014bc 458d5308                       lea        r10d, [r11 + 8]
014c0 458bca                         mov        r9d, r10d
014c3 be6effffff                     mov        esi, 0xffffff6e
014c8 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
014d0 448b1c24                       mov        r11d, dword ptr [rsp]
014d4 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
014dc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014e1 4c891424                       mov        qword ptr [rsp], r10
014e5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014ea 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
014f2 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
014f7 44895c2408                     mov        dword ptr [rsp + 8], r11d
014fc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01501 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01506 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0150b 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01510 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01515 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0151a 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0151f 90                             nop        
01520 c5f877                         vzeroupper 
01523 e8b828b6ff                     call       0x7f4b879c3660
01528 0f1f840020160022               nop        dword ptr [rax + rax + 0x22001620]
01530 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01538 458d5308                       lea        r10d, [r11 + 8]
0153c 458bca                         mov        r9d, r10d
0153f be66ffffff                     mov        esi, 0xffffff66
01544 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0154c 448b1424                       mov        r10d, dword ptr [rsp]
01550 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01558 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0155d 4c891424                       mov        qword ptr [rsp], r10
01561 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01566 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0156e 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01573 4489542408                     mov        dword ptr [rsp + 8], r10d
01578 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0157d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01582 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01587 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0158c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01591 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01596 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0159b 90                             nop        
0159c c5f877                         vzeroupper 
0159f e83c28b6ff                     call       0x7f4b879c3660
015a4 0f1f84009c160023               nop        dword ptr [rax + rax + 0x2300169c]
015ac be6effffff                     mov        esi, 0xffffff6e
015b1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
015b9 448b0424                       mov        r8d, dword ptr [rsp]
015bd 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
015c5 4c8b442408                     mov        r8, qword ptr [rsp + 8]
015ca 4c890424                       mov        qword ptr [rsp], r8
015ce 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
015d3 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
015db 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
015e0 44894c2408                     mov        dword ptr [rsp + 8], r9d
015e5 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
015ea 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
015ef 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015f4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015f9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015fe 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01603 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01608 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0160d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01612 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01616 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0161b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01620 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01625 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0162a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0162f 89542440                       mov        dword ptr [rsp + 0x40], edx
01633 90                             nop        
01634 c5f877                         vzeroupper 
01637 e8a427b6ff                     call       0x7f4b879c3660
0163c 0f1f840034170024               nop        dword ptr [rax + rax + 0x24001734]
01644 458bc8                         mov        r9d, r8d
01647 e9c8f4ffff                     jmp        0x7f4b87e60394
0164c bee4ffffff                     mov        esi, 0xffffffe4
01651 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01659 448b1424                       mov        r10d, dword ptr [rsp]
0165d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01665 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0166a 4c891424                       mov        qword ptr [rsp], r10
0166e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01673 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0167b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01680 4489542408                     mov        dword ptr [rsp + 8], r10d
01685 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0168a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0168f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01694 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01699 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0169e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016a3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016ab 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016b0 c5f877                         vzeroupper 
016b3 e82827b6ff                     call       0x7f4b879c3660
016b8 0f1f8400b0170025               nop        dword ptr [rax + rax + 0x250017b0]
016c0 bee4ffffff                     mov        esi, 0xffffffe4
016c5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016ca 44895c2404                     mov        dword ptr [rsp + 4], r11d
016cf 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
016d4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016d9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016de 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016e3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016e8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
016ed 666690                         nop        
016f0 c5f877                         vzeroupper 
016f3 e8e826b6ff                     call       0x7f4b879c3660
016f8 0f1f8400f0170026               nop        dword ptr [rax + rax + 0x260017f0]
01700 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
01707 ffc5                           inc        ebp
01709 bee4ffffff                     mov        esi, 0xffffffe4
0170e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01713 4489542404                     mov        dword ptr [rsp + 4], r10d
01718 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0171d 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01722 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01727 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0172c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01731 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01736 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0173b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01740 c5f877                         vzeroupper 
01743 e89826b6ff                     call       0x7f4b879c3660
01748 0f1f840040180027               nop        dword ptr [rax + rax + 0x27001840]
01750 bee4ffffff                     mov        esi, 0xffffffe4
01755 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0175a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0175f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01764 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01769 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0176e 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01773 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01778 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0177d 666690                         nop        
01780 c5f877                         vzeroupper 
01783 e85826b6ff                     call       0x7f4b879c3660
01788 0f1f840080180028               nop        dword ptr [rax + rax + 0x28001880]
01790 bee4ffffff                     mov        esi, 0xffffffe4
01795 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0179d 448b1c24                       mov        r11d, dword ptr [rsp]
017a1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
017a9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017ae 4c891424                       mov        qword ptr [rsp], r10
017b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017b7 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
017bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017ce 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
017d3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017d8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017dd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017e2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017e7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
017ec 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017f1 666690                         nop        
017f4 c5f877                         vzeroupper 
017f7 e8e425b6ff                     call       0x7f4b879c3660
017fc 0f1f8400f4180029               nop        dword ptr [rax + rax + 0x290018f4]
01804 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01809 beccffffff                     mov        esi, 0xffffffcc
0180e 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01816 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
0181d 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01825 44890424                       mov        dword ptr [rsp], r8d
01829 48895c2408                     mov        qword ptr [rsp + 8], rbx
0182e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01833 90                             nop        
01834 c5f877                         vzeroupper 
01837 e8a425b6ff                     call       0x7f4b879c3660
0183c 0f1f84003419002a               nop        dword ptr [rax + rax + 0x2a001934]
01844 bef6ffffff                     mov        esi, 0xfffffff6
01849 666690                         nop        
0184c c5f877                         vzeroupper 
0184f e88c25b6ff                     call       0x7f4b879c3660
01854 0f1f84004c19002b               nop        dword ptr [rax + rax + 0x2b00194c]
0185c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01864 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01869 e977f9ffff                     jmp        0x7f4b87e60a65
0186e eb14                           jmp        0x7f4b87e61104
01870 eb12                           jmp        0x7f4b87e61104
01872 eb10                           jmp        0x7f4b87e61104
01874 eb0e                           jmp        0x7f4b87e61104
01876 eb0c                           jmp        0x7f4b87e61104
01878 eb0a                           jmp        0x7f4b87e61104
0187a eb08                           jmp        0x7f4b87e61104
0187c eb06                           jmp        0x7f4b87e61104
0187e eb04                           jmp        0x7f4b87e61104
01880 eb02                           jmp        0x7f4b87e61104
01882 eb00                           jmp        0x7f4b87e61104
01884 488bf0                         mov        rsi, rax
01887 e974ecffff                     jmp        0x7f4b87e5fd80
0188c bef6ffffff                     mov        esi, 0xfffffff6
01891 498beb                         mov        rbp, r11
01894 89bc24c0000000                 mov        dword ptr [rsp + 0xc0], edi
0189b 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
018a3 90                             nop        
018a4 c5f877                         vzeroupper 
018a7 e83425b6ff                     call       0x7f4b879c3660
018ac 0f1f8400a419002c               nop        dword ptr [rax + rax + 0x2c0019a4]
018b4 49ba9504e6874b7f0000           movabs     r10, 0x7f4b87e60495
018be 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
018c5 e996cda9ff                     jmp        0x7f4b878fdee0
018ca e85199a8ff                     call       0x7f4b878eaaa0
018cf e96ae7ffff                     jmp        0x7f4b87e5f8be
018d4 f4                             hlt        
018d5 f4                             hlt        
018d6 f4                             hlt        
018d7 f4                             hlt        
