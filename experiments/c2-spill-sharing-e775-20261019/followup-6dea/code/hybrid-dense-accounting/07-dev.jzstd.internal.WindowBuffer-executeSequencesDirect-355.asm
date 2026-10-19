00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b0a9ff                   jne        0x7f6c9f8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8590180000                   jne        0x7f6c9fe6114e
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bd7                         mov        r10d, edi
0004e 488bde                         mov        rbx, rsi
00051 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
00055 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0005a 448b4604                       mov        r8d, dword ptr [rsi + 4]
0005e 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00063 458bc8                         mov        r9d, r8d
00066 452bcb                         sub        r9d, r11d
00069 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00071 453bd9                         cmp        r11d, r9d
00074 0f8f54110000                   jg         0x7f6c9fe60a4e
0007a 488b6e08                       mov        rbp, qword ptr [rsi + 8]
0007e 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00082 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
0008a 4c635c2418                     movsxd     r11, dword ptr [rsp + 0x18]
0008f 4c03dd                         add        r11, rbp
00092 4d2bc3                         sub        r8, r11
00095 4d3bc8                         cmp        r9, r8
00098 0f8f30110000                   jg         0x7f6c9fe60a4e
0009e 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
000a2 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a6 4d85ed                         test       r13, r13
000a9 0f84610c0000                   je         0x7f6c9fe60590
000af 33ff                           xor        edi, edi
000b1 4c8bda                         mov        r11, rdx
000b4 8b4204                         mov        eax, dword ptr [rdx + 4]
000b7 448b4e40                       mov        r9d, dword ptr [rsi + 0x40]
000bb 458bc2                         mov        r8d, r10d
000be 4585d2                         test       r10d, r10d
000c1 0f8efd100000                   jle        0x7f6c9fe60a44
000c7 4c2bed                         sub        r13, rbp
000ca 8d48e0                         lea        ecx, [rax - 0x20]
000cd 8b542460                       mov        edx, dword ptr [rsp + 0x60]
000d1 83c2e0                         add        edx, -0x20
000d4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d9 418b7204                       mov        esi, dword ptr [r10 + 4]
000dd 85f6                           test       esi, esi
000df 0f860c110000                   jbe        0x7f6c9fe60a71
000e5 89542428                       mov        dword ptr [rsp + 0x28], edx
000e9 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
000ed 89442404                       mov        dword ptr [rsp + 4], eax
000f1 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f6 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000fb 48896c2420                     mov        qword ptr [rsp + 0x20], rbp
00100 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00105 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0010d 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
00112 4c63d6                         movsxd     r10, esi
00115 4d63d8                         movsxd     r11, r8d
00118 49ffcb                         dec        r11
0011b 4d3bda                         cmp        r11, r10
0011e 0f83c0100000                   jae        0x7f6c9fe60a64
00124 85ff                           test       edi, edi
00126 0f8420110000                   je         0x7f6c9fe60acc
0012c 448d58f1                       lea        r11d, [rax - 0xf]
00130 4585db                         test       r11d, r11d
00133 0f8c22110000                   jl         0x7f6c9fe60adb
00139 458b5904                       mov        r11d, dword ptr [r9 + 4]
0013d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00142 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00147 897c2464                       mov        dword ptr [rsp + 0x64], edi
0014b 458d53f1                       lea        r10d, [r11 - 0xf]
0014f 4585d2                         test       r10d, r10d
00152 0f8c12110000                   jl         0x7f6c9fe60aea
00158 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00160 458b5204                       mov        r10d, dword ptr [r10 + 4]
00164 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00169 4585d2                         test       r10d, r10d
0016c 0f860a110000                   jbe        0x7f6c9fe60afc
00172 4183fa01                       cmp        r10d, 1
00176 0f8600110000                   jbe        0x7f6c9fe60afc
0017c 4183fa02                       cmp        r10d, 2
00180 0f86f6100000                   jbe        0x7f6c9fe60afc
00186 4183c3f9                       add        r11d, -7
0018a 4585db                         test       r11d, r11d
0018d 0f8ce9100000                   jl         0x7f6c9fe60afc
00193 448bd0                         mov        r10d, eax
00196 4d8bd9                         mov        r11, r9
00199 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0019e 4183c2f1                       add        r10d, -0xf
001a2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
001a7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
001ac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
001b1 458d5af1                       lea        r11d, [r10 - 0xf]
001b5 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001ba 4533d2                         xor        r10d, r10d
001bd 33db                           xor        ebx, ebx
001bf e9c1010000                     jmp        0x7f6c9fe5fc05
001c4 4533db                         xor        r11d, r11d
001c7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
001cc 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001d4 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
001d8 448bdf                         mov        r11d, edi
001db 4183fb03                       cmp        r11d, 3
001df 0f8e27020000                   jle        0x7f6c9fe5fc8c
001e5 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001ed 41894b10                       mov        dword ptr [r11 + 0x10], ecx
001f1 458b4308                       mov        r8d, dword ptr [r11 + 8]
001f5 4589430c                       mov        dword ptr [r11 + 0xc], r8d
001f9 448d5ffd                       lea        r11d, [rdi - 3]
001fd 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00202 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0020a 45895808                       mov        dword ptr [r8 + 8], r11d
0020e 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00215 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
0021a 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
0021f 48034c2420                     add        rcx, qword ptr [rsp + 0x20]
00224 4c634c2430                     movsxd     r9, dword ptr [rsp + 0x30]
00229 4903c9                         add        rcx, r9
0022c 4c3bd9                         cmp        r11, rcx
0022f 0f8f330d0000                   jg         0x7f6c9fe607e8
00235 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0023a 4585db                         test       r11d, r11d
0023d 0f8e7d0c0000                   jle        0x7f6c9fe60740
00243 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00248 4403442430                     add        r8d, dword ptr [rsp + 0x30]
0024d 4403442434                     add        r8d, dword ptr [rsp + 0x34]
00252 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00257 0f8f6f0d0000                   jg         0x7f6c9fe6084c
0025d 458bda                         mov        r11d, r10d
00260 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
00265 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0026a 0f8fe40d0000                   jg         0x7f6c9fe608d4
00270 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00275 4183fb10                       cmp        r11d, 0x10
00279 0f8f5d0e0000                   jg         0x7f6c9fe6095c
0027f 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00284 0f83a30a0000                   jae        0x7f6c9fe605ad
0028a 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00292 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00299 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0029e 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
002a3 0f83db0a0000                   jae        0x7f6c9fe60604
002a9 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002ae 4503da                         add        r11d, r10d
002b1 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
002b9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002be 418bda                         mov        ebx, r10d
002c1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002c6 4503da                         add        r11d, r10d
002c9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
002ce 4d63c2                         movsxd     r8, r10d
002d1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002d6 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
002dd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002e2 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
002e7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002ef 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002f4 4183fb10                       cmp        r11d, 0x10
002f8 0f8f5e0e0000                   jg         0x7f6c9fe609dc
002fe 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00303 4183fa10                       cmp        r10d, 0x10
00307 0f8cff010000                   jl         0x7f6c9fe5fd8c
0030d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00315 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
0031a 0f83c00a0000                   jae        0x7f6c9fe60660
00320 458bda                         mov        r11d, r10d
00323 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00328 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
0032f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00334 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00339 0f83090b0000                   jae        0x7f6c9fe606c8
0033f 448bd3                         mov        r10d, ebx
00342 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00347 4d63c2                         movsxd     r8, r10d
0034a 478d0c13                       lea        r9d, [r11 + r10]
0034e 44034c2434                     add        r9d, dword ptr [rsp + 0x34]
00353 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
00358 4d63db                         movsxd     r11, r11d
0035b 4d03d8                         add        r11, r8
0035e 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00363 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0036a 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00371 ffc3                           inc        ebx
00373 3b5c2410                       cmp        ebx, dword ptr [rsp + 0x10]
00377 0f8def070000                   jge        0x7f6c9fe603ec
0037d 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00385 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0038a 4d8b44db08                     mov        r8, qword ptr [r11 + rbx*8 + 8]
0038f 4d8bd8                         mov        r11, r8
00392 49c1fb24                       sar        r11, 0x24
00396 458bdb                         mov        r11d, r11d
00399 418bfb                         mov        edi, r11d
0039c 4d8bc8                         mov        r9, r8
0039f 49c1e912                       shr        r9, 0x12
003a3 458bd8                         mov        r11d, r8d
003a6 458bc9                         mov        r9d, r9d
003a9 4181e3ffff0100                 and        r11d, 0x1ffff
003b0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
003b5 4181e1ffff0300                 and        r9d, 0x3ffff
003bc 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
003c1 448bdf                         mov        r11d, edi
003c4 4585db                         test       r11d, r11d
003c7 0f8c130b0000                   jl         0x7f6c9fe60760
003cd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
003d2 4585db                         test       r11d, r11d
003d5 0f84e9fdffff                   je         0x7f6c9fe5fa44
003db 448b0424                       mov        r8d, dword ptr [rsp]
003df 452bc2                         sub        r8d, r10d
003e2 453bd8                         cmp        r11d, r8d
003e5 0f8ee1fdffff                   jle        0x7f6c9fe5fa4c
003eb be45ffffff                     mov        esi, 0xffffff45
003f0 418beb                         mov        ebp, r11d
003f3 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
003fb 90                             nop        
003fc c5f877                         vzeroupper 
003ff e8dc39b6ff                     call       0x7f6c9f9c3660
00404 0f1f8400fc040000               nop        dword ptr [rax + rax + 0x4fc]
0040c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00411 4585c0                         test       r8d, r8d
00414 7406                           je         0x7f6c9fe5fc9c
00416 41ffcb                         dec        r11d
00419 418bfb                         mov        edi, r11d
0041c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00424 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00428 85ff                           test       edi, edi
0042a 0f8464080000                   je         0x7f6c9fe60514
00430 83ff03                         cmp        edi, 3
00433 0f8467080000                   je         0x7f6c9fe60520
00439 83ff02                         cmp        edi, 2
0043c 0f878a000000                   ja         0x7f6c9fe5fd4c
00442 3b7c243c                       cmp        edi, dword ptr [rsp + 0x3c]
00446 0f837c0e0000                   jae        0x7f6c9fe60b48
0044c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00454 458b5cb808                     mov        r11d, dword ptr [r8 + rdi*4 + 8]
00459 85ff                           test       edi, edi
0045b 7e52                           jle        0x7f6c9fe5fd2f
0045d 448d4fff                       lea        r9d, [rdi - 1]
00461 443b4c243c                     cmp        r9d, dword ptr [rsp + 0x3c]
00466 0f834c110000                   jae        0x7f6c9fe60e38
0046c 4863d7                         movsxd     rdx, edi
0046f 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00477 458bc8                         mov        r9d, r8d
0047a 4183c1cc                       add        r9d, -0x34
0047e 41c1e902                       shr        r9d, 2
00482 458d4439ff                     lea        r8d, [r9 + rdi - 1]
00487 b904000000                     mov        ecx, 4
0048c c442f0f5c0                     bzhi       r8, r8, rcx
00491 492bd0                         sub        rdx, r8
00494 48ffca                         dec        rdx
00497 4533c0                         xor        r8d, r8d
0049a 4885d2                         test       rdx, rdx
0049d 490f4cd0                       cmovl      rdx, r8
004a1 8bca                           mov        ecx, edx
004a3 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
004aa e988050000                     jmp        0x7f6c9fe602b7
004af 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
004b6 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004be 45895808                       mov        dword ptr [r8 + 8], r11d
004c2 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
004c7 e949fdffff                     jmp        0x7f6c9fe5fa95
004cc 895c2404                       mov        dword ptr [rsp + 4], ebx
004d0 48be90af72e200000000           movabs     rsi, 0xe272af90
004da 418bea                         mov        ebp, r10d
004dd 666690                         nop        
004e0 c5f877                         vzeroupper 
004e3 e8f8baa9ff                     call       0x7f6c9f8fb860
004e8 0f1f8400e0050001               nop        dword ptr [rax + rax + 0x10005e0]
004f0 4885c0                         test       rax, rax
004f3 0f845f0e0000                   je         0x7f6c9fe60bd8
004f9 488bf0                         mov        rsi, rax
004fc c5f877                         vzeroupper 
004ff 4881c4b0000000                 add        rsp, 0xb0
00506 5d                             pop        rbp
00507 e9d4b7b6ff                     jmp        0x7f6c9f9cb560
0050c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00511 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
00516 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0051b 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00520 0f8d8e020000                   jge        0x7f6c9fe60034
00526 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0052b 4183c308                       add        r11d, 8
0052f 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00537 4183fa08                       cmp        r10d, 8
0053b 0f8d98010000                   jge        0x7f6c9fe5ff59
00541 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00549 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
0054e 0f8304110000                   jae        0x7f6c9fe60ed8
00554 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00559 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
0055f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00564 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00569 0f835d110000                   jae        0x7f6c9fe60f4c
0056f 4c63d3                         movsxd     r10, ebx
00572 4c635c2430                     movsxd     r11, dword ptr [rsp + 0x30]
00577 4d03da                         add        r11, r10
0057a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0057f 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00584 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0058c 4183c203                       add        r10d, 3
00590 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00595 41ffc0                         inc        r8d
00598 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
005a0 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005a5 0f8359110000                   jae        0x7f6c9fe60f84
005ab 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005b0 4183c203                       add        r10d, 3
005b4 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
005bc 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
005c1 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
005c7 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005cc 0f8382110000                   jae        0x7f6c9fe60fd4
005d2 4c63d3                         movsxd     r10, ebx
005d5 4c63442430                     movsxd     r8, dword ptr [rsp + 0x30]
005da 4d03c2                         add        r8, r10
005dd 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
005e2 43886c0109                     mov        byte ptr [r9 + r8 + 9], bpl
005e7 470fbe54190a                   movsx      r10d, byte ptr [r9 + r11 + 0xa]
005ed 478854010a                     mov        byte ptr [r9 + r8 + 0xa], r10b
005f2 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
005f8 47885c010b                     mov        byte ptr [r9 + r8 + 0xb], r11b
005fd 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00602 4183fa08                       cmp        r10d, 8
00606 0f8388110000                   jae        0x7f6c9fe61014
0060c 49bad0e870e200000000           movabs     r10, 0xe270e8d0
00616 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0061b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00623 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00628 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0062d 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00632 4183fb04                       cmp        r11d, 4
00636 7e3c                           jle        0x7f6c9fe5fef4
00638 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0063c 83c504                         add        ebp, 4
0063f 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00644 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00648 c5f877                         vzeroupper 
0064b e890b9a9ff                     call       0x7f6c9f8fb860
00650 0f1f840048070002               nop        dword ptr [rax + rax + 0x2000748]
00658 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0065d 8bd5                           mov        edx, ebp
0065f 8bc8                           mov        ecx, eax
00661 666690                         nop        
00664 c5f877                         vzeroupper 
00667 e874b9a9ff                     call       0x7f6c9f8fb860
0066c 0f1f840064070003               nop        dword ptr [rax + rax + 0x3000764]
00674 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00679 4183fb08                       cmp        r11d, 8
0067d 0f8ee7fcffff                   jle        0x7f6c9fe5fbea
00683 49baf8e870e200000000           movabs     r10, 0xe270e8f8
0068d 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00691 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00696 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
0069b 83c208                         add        edx, 8
0069e 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006a3 90                             nop        
006a4 c5f877                         vzeroupper 
006a7 e834b9a9ff                     call       0x7f6c9f8fb860
006ac 0f1f8400a4070004               nop        dword ptr [rax + rax + 0x40007a4]
006b4 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006b9 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
006c0 488bc8                         mov        rcx, rax
006c3 90                             nop        
006c4 c5f877                         vzeroupper 
006c7 e814b9a9ff                     call       0x7f6c9f8fb860
006cc 0f1f8400c4070005               nop        dword ptr [rax + rax + 0x50007c4]
006d4 e991fcffff                     jmp        0x7f6c9fe5fbea
006d9 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006de 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
006e5 666690                         nop        
006e8 c5f877                         vzeroupper 
006eb e8f0b8a9ff                     call       0x7f6c9f8fb860
006f0 0f1f8400e8070006               nop        dword ptr [rax + rax + 0x60007e8]
006f8 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006fd 8b542438                       mov        edx, dword ptr [rsp + 0x38]
00701 488bc8                         mov        rcx, rax
00704 c5f877                         vzeroupper 
00707 e8d4b8a9ff                     call       0x7f6c9f8fb860
0070c 0f1f840004080007               nop        dword ptr [rax + rax + 0x7000804]
00714 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0071c 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00721 0f8d43fcffff                   jge        0x7f6c9fe5fbea
00727 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0072c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00733 0f8eff040000                   jle        0x7f6c9fe604b8
00739 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00741 4183c208                       add        r10d, 8
00745 be66ffffff                     mov        esi, 0xffffff66
0074a 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00752 448b1c24                       mov        r11d, dword ptr [rsp]
00756 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0075e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00763 4c891c24                       mov        qword ptr [rsp], r11
00767 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0076c 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00774 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00779 44895c2408                     mov        dword ptr [rsp + 8], r11d
0077e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00783 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00788 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0078d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00792 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00797 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0079c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
007a1 666690                         nop        
007a4 c5f877                         vzeroupper 
007a7 e83436b6ff                     call       0x7f6c9f9c3660
007ac 0f1f8400a4080008               nop        dword ptr [rax + rax + 0x80008a4]
007b4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
007b9 4183fb30                       cmp        r11d, 0x30
007bd 0f8fdb010000                   jg         0x7f6c9fe6021e
007c3 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
007c7 83c5f9                         add        ebp, -7
007ca 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007ce 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
007d6 443bd5                         cmp        r10d, ebp
007d9 0f83910b0000                   jae        0x7f6c9fe60bf0
007df 418bea                         mov        ebp, r10d
007e2 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
007e9 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
007ee 498b6c2b08                     mov        rbp, qword ptr [r11 + rbp + 8]
007f3 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
007fb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00800 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00805 0f83e50b0000                   jae        0x7f6c9fe60c70
0080b 448bd3                         mov        r10d, ebx
0080e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00816 4d63d2                         movsxd     r10, r10d
00819 8b6c2430                       mov        ebp, dword ptr [rsp + 0x30]
0081d 4c63dd                         movsxd     r11, ebp
00820 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
00825 48be28c122e200000000           movabs     rsi, 0xe222c128
0082f 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00834 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0083c 4533c9                         xor        r9d, r9d
0083f 90                             nop        
00840 c5f877                         vzeroupper 
00843 e898ada9ff                     call       0x7f6c9f8fae60
00848 0f1f840040090009               nop        dword ptr [rax + rax + 0x9000940]
00850 03ac2490000000                 add        ebp, dword ptr [rsp + 0x90]
00857 896c2438                       mov        dword ptr [rsp + 0x38], ebp
0085b 448d5d08                       lea        r11d, [rbp + 8]
0085f 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00867 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
0086c 0f8d18010000                   jge        0x7f6c9fe6020a
00872 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0087a 442bdd                         sub        r11d, ebp
0087d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00882 4c634c244c                     movsxd     r9, dword ptr [rsp + 0x4c]
00887 4983c1f9                       add        r9, -7
0088b 4963cb                         movsxd     rcx, r11d
0088e 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
00896 4d8d140b                       lea        r10, [r11 + rcx]
0089a 4d3bd1                         cmp        r10, r9
0089d 0f831d0c0000                   jae        0x7f6c9fe60d40
008a3 4c63542418                     movsxd     r10, dword ptr [rsp + 0x18]
008a8 4d2bd3                         sub        r10, r11
008ab 4983c207                       add        r10, 7
008af 4983e2f8                       and        r10, 0xfffffffffffffff8
008b3 458bd2                         mov        r10d, r10d
008b6 458d5c2a08                     lea        r11d, [r10 + rbp + 8]
008bb 4d63db                         movsxd     r11, r11d
008be 4e8d5419f8                     lea        r10, [rcx + r11 - 8]
008c3 4d3bd1                         cmp        r10, r9
008c6 0f83f40b0000                   jae        0x7f6c9fe60d40
008cc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008d4 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
008d9 0f83e10b0000                   jae        0x7f6c9fe60d40
008df 4983c3f8                       add        r11, -8
008e3 4d3bd9                         cmp        r11, r9
008e6 0f83d40b0000                   jae        0x7f6c9fe60d40
008ec 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
008f1 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
008f8 0f8f3e0c0000                   jg         0x7f6c9fe60dbc
008fe 6690                           nop        
00900 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00908 4963ca                         movsxd     rcx, r10d
0090b 4883c108                       add        rcx, 8
0090f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00916 036c2430                       add        ebp, dword ptr [rsp + 0x30]
0091a 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0091f 4d8b442b08                     mov        r8, qword ptr [r11 + rbp + 8]
00924 48be28c122e200000000           movabs     rsi, 0xe222c128
0092e 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00933 4533c9                         xor        r9d, r9d
00936 6690                           nop        
00938 c5f877                         vzeroupper 
0093b e8a0aca9ff                     call       0x7f6c9f8fae60
00940 0f1f8400380a000a               nop        dword ptr [rax + rax + 0xa000a38]
00948 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00950 4183c208                       add        r10d, 8
00954 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0095c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00961 7c9d                           jl         0x7f6c9fe60180
00963 eb25                           jmp        0x7f6c9fe6020a
00965 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0096a 4d63d2                         movsxd     r10, r10d
0096d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00974 c442a8f5db                     bzhi       r11, r11, r10
00979 c4c1fb92fb                     kmovq      k7, r11
0097e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00984 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0098a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0098f 4403542434                     add        r10d, dword ptr [rsp + 0x34]
00994 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00999 e9ccf9ffff                     jmp        0x7f6c9fe5fbea
0099e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009a6 4585d2                         test       r10d, r10d
009a9 0f8ca90a0000                   jl         0x7f6c9fe60cd8
009af 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
009b4 4585db                         test       r11d, r11d
009b7 0f8c9b0a0000                   jl         0x7f6c9fe60cd8
009bd 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009c2 4503da                         add        r11d, r10d
009c5 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
009ca 453bd3                         cmp        r10d, r11d
009cd 0f82850a0000                   jb         0x7f6c9fe60cd8
009d3 458bda                         mov        r11d, r10d
009d6 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
009db 0f82770a0000                   jb         0x7f6c9fe60cd8
009e1 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
009e6 4585d2                         test       r10d, r10d
009e9 749f                           je         0x7f6c9fe6020a
009eb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
009f0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009f8 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
009fd 4d03c8                         add        r9, r8
00a00 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00a05 4863542434                     movsxd     rdx, dword ptr [rsp + 0x34]
00a0a 4883fa20                       cmp        rdx, 0x20
00a0e 0f8651ffffff                   jbe        0x7f6c9fe601e5
00a14 c5f877                         vzeroupper 
00a17 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00a21 41ffd2                         call       r10
00a24 0f1f840000000000               nop        dword ptr [rax + rax]
00a2c e959ffffff                     jmp        0x7f6c9fe6020a
00a31 666690                         nop        
00a34 418bf8                         mov        edi, r8d
00a37 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00a3f 458b44b904                     mov        r8d, dword ptr [r9 + rdi*4 + 4]
00a44 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00a4c 448944bb08                     mov        dword ptr [rbx + rdi*4 + 8], r8d
00a51 448d47ff                       lea        r8d, [rdi - 1]
00a55 443bc1                         cmp        r8d, ecx
00a58 7fda                           jg         0x7f6c9fe602b4
00a5a 4183f83f                       cmp        r8d, 0x3f
00a5e 0f8eec0b0000                   jle        0x7f6c9fe60ed0
00a64 448bc7                         mov        r8d, edi
00a67 41ffc8                         dec        r8d
00a6a eb07                           jmp        0x7f6c9fe602f3
00a6c 0f1f4000                       nop        dword ptr [rax]
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
00adb 7f93                           jg         0x7f6c9fe602f0
00add 4183f90f                       cmp        r9d, 0xf
00ae1 7e31                           jle        0x7f6c9fe60394
00ae3 458bc8                         mov        r9d, r8d
00ae6 4183c1c0                       add        r9d, -0x40
00aea 6690                           nop        
00aec 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00af4 62917e486f8488c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x38]
00aff 62917e487f8488ccffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x34], zmm0
00b0a 4183c1f0                       add        r9d, -0x10
00b0e 4183f90f                       cmp        r9d, 0xf
00b12 7fd8                           jg         0x7f6c9fe6036c
00b14 4585c9                         test       r9d, r9d
00b17 0f8e99f9ffff                   jle        0x7f6c9fe5fd36
00b1d 666690                         nop        
00b20 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00b28 478b448804                     mov        r8d, dword ptr [r8 + r9*4 + 4]
00b2d 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00b35 4689448908                     mov        dword ptr [rcx + r9*4 + 8], r8d
00b3a 41ffc9                         dec        r9d
00b3d 4585c9                         test       r9d, r9d
00b40 7fde                           jg         0x7f6c9fe603a0
00b42 e96ff9ffff                     jmp        0x7f6c9fe5fd36
00b47 4d63d2                         movsxd     r10, r10d
00b4a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b51 c442a8f5db                     bzhi       r11, r11, r10
00b56 c4c1fb92fb                     kmovq      k7, r11
00b5b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b61 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b67 e99e000000                     jmp        0x7f6c9fe6048a
00b6c 448b1c24                       mov        r11d, dword ptr [rsp]
00b70 458bd3                         mov        r10d, r11d
00b73 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00b7b 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00b80 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00b88 8b442404                       mov        eax, dword ptr [rsp + 4]
00b8c 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b91 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
00b98 418b5104                       mov        edx, dword ptr [r9 + 4]
00b9c 85c9                           test       ecx, ecx
00b9e 0f8c640c0000                   jl         0x7f6c9fe61088
00ba4 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00ba9 4585c0                         test       r8d, r8d
00bac 0f8c5b0c0000                   jl         0x7f6c9fe6108d
00bb2 3b0424                         cmp        eax, dword ptr [rsp]
00bb5 0f82520c0000                   jb         0x7f6c9fe6108d
00bbb 8b6c2418                       mov        ebp, dword ptr [rsp + 0x18]
00bbf 4103ea                         add        ebp, r10d
00bc2 3bd5                           cmp        edx, ebp
00bc4 0f82430c0000                   jb         0x7f6c9fe6108d
00bca 4585d2                         test       r10d, r10d
00bcd 0f8c3a0c0000                   jl         0x7f6c9fe6108d
00bd3 4585d2                         test       r10d, r10d
00bd6 7432                           je         0x7f6c9fe6048a
00bd8 498d7c0b08                     lea        rdi, [r11 + rcx + 8]
00bdd 4d8bd9                         mov        r11, r9
00be0 4b8d740108                     lea        rsi, [r9 + r8 + 8]
00be5 4963d2                         movsxd     rdx, r10d
00be8 4883fa20                       cmp        rdx, 0x20
00bec 0f8655ffffff                   jbe        0x7f6c9fe603c7
00bf2 c5f877                         vzeroupper 
00bf5 49ba204f8e9f6c7f0000           movabs     r10, 0x7f6c9f8e4f20
00bff 41ffd2                         call       r10
00c02 0f1f840000000000               nop        dword ptr [rax + rax]
00c0a 896b38                         mov        dword ptr [rbx + 0x38], ebp
00c0d c5f877                         vzeroupper 
00c10 4881c4b0000000                 add        rsp, 0xb0
00c17 5d                             pop        rbp
00c18 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c1c 0f87960c0000                   ja         0x7f6c9fe61138
00c22 c3                             ret        
00c23 0f1f8000000000                 nop        dword ptr [rax]
00c2a 660f1f440000                   nop        word ptr [rax + rax]
00c30 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00c38 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00c3f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00c43 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c48 8bd5                           mov        edx, ebp
00c4a 6690                           nop        
00c4c c5f877                         vzeroupper 
00c4f e88cb3a9ff                     call       0x7f6c9f8fb860
00c54 0f1f84004c0d000b               nop        dword ptr [rax + rax + 0xb000d4c]
00c5c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c61 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c68 488bc8                         mov        rcx, rax
00c6b 90                             nop        
00c6c c5f877                         vzeroupper 
00c6f e86cb3a9ff                     call       0x7f6c9f8fb860
00c74 0f1f84006c0d000c               nop        dword ptr [rax + rax + 0xc000d6c]
00c7c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00c84 4183c308                       add        r11d, 8
00c88 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c8d 7ca1                           jl         0x7f6c9fe604b0
00c8f e9d6f6ffff                     jmp        0x7f6c9fe5fbea
00c94 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00c9b e922f8ffff                     jmp        0x7f6c9fe5fd42
00ca0 41ffcb                         dec        r11d
00ca3 4585db                         test       r11d, r11d
00ca6 7e24                           jle        0x7f6c9fe6054c
00ca8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00cb0 41894810                       mov        dword ptr [r8 + 0x10], ecx
00cb4 458b4808                       mov        r9d, dword ptr [r8 + 8]
00cb8 4589480c                       mov        dword ptr [r8 + 0xc], r9d
00cbc 45895808                       mov        dword ptr [r8 + 8], r11d
00cc0 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00cc7 e9f6f7ffff                     jmp        0x7f6c9fe5fd42
00ccc 895c2404                       mov        dword ptr [rsp + 4], ebx
00cd0 48be60af72e200000000           movabs     rsi, 0xe272af60
00cda 418bea                         mov        ebp, r10d
00cdd 666690                         nop        
00ce0 c5f877                         vzeroupper 
00ce3 e8f8b2a9ff                     call       0x7f6c9f8fb860
00ce8 0f1f8400e00d000d               nop        dword ptr [rax + rax + 0xd000de0]
00cf0 4885c0                         test       rax, rax
00cf3 0f8500f8ffff                   jne        0x7f6c9fe5fd79
00cf9 bef6ffffff                     mov        esi, 0xfffffff6
00cfe 6690                           nop        
00d00 c5f877                         vzeroupper 
00d03 e8d830b6ff                     call       0x7f6c9f9c3660
00d08 0f1f8400000e000e               nop        dword ptr [rax + rax + 0xe000e00]
00d10 4d03d9                         add        r11, r9
00d13 4d3bde                         cmp        r11, r14
00d16 7e08                           jle        0x7f6c9fe605a0
00d18 4533ed                         xor        r13d, r13d
00d1b e98ff3ffff                     jmp        0x7f6c9fe5f92f
00d20 4533ed                         xor        r13d, r13d
00d23 bf01000000                     mov        edi, 1
00d28 e984f3ffff                     jmp        0x7f6c9fe5f931
00d2d bee4ffffff                     mov        esi, 0xffffffe4
00d32 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00d3a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d3f 4489442404                     mov        dword ptr [rsp + 4], r8d
00d44 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d49 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00d4e 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d53 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00d58 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00d5d 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00d62 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00d67 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d6c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00d71 666690                         nop        
00d74 c5f877                         vzeroupper 
00d77 e86430b6ff                     call       0x7f6c9f9c3660
00d7c 0f1f8400740e000f               nop        dword ptr [rax + rax + 0xf000e74]
00d84 bee4ffffff                     mov        esi, 0xffffffe4
00d89 498beb                         mov        rbp, r11
00d8c 448b0424                       mov        r8d, dword ptr [rsp]
00d90 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00d98 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00d9d 4c891c24                       mov        qword ptr [rsp], r11
00da1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00da6 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00dae 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00db3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00db8 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00dbd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00dc2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00dc7 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00dcd 666690                         nop        
00dd0 c5f877                         vzeroupper 
00dd3 e80830b6ff                     call       0x7f6c9f9c3660
00dd8 0f1f8400d00e0010               nop        dword ptr [rax + rax + 0x10000ed0]
00de0 bee4ffffff                     mov        esi, 0xffffffe4
00de5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00ded 448b1424                       mov        r10d, dword ptr [rsp]
00df1 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00df9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00dfe 4c891424                       mov        qword ptr [rsp], r10
00e02 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e07 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00e0f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e19 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e1e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e23 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00e28 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e2d 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e32 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e37 90                             nop        
00e38 c5f877                         vzeroupper 
00e3b e8a02fb6ff                     call       0x7f6c9f9c3660
00e40 0f1f8400380f0011               nop        dword ptr [rax + rax + 0x11000f38]
00e48 bee4ffffff                     mov        esi, 0xffffffe4
00e4d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e55 448b1424                       mov        r10d, dword ptr [rsp]
00e59 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00e61 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e66 4c891424                       mov        qword ptr [rsp], r10
00e6a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e6f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00e77 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e7c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e81 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e86 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e8b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e90 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e95 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00e9a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e9f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ea4 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00ea9 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00eaf 90                             nop        
00eb0 c5f877                         vzeroupper 
00eb3 e8282fb6ff                     call       0x7f6c9f9c3660
00eb8 0f1f8400b00f0012               nop        dword ptr [rax + rax + 0x12000fb0]
00ec0 be45ffffff                     mov        esi, 0xffffff45
00ec5 48898c24c0000000               mov        qword ptr [rsp + 0xc0], rcx
00ecd 666690                         nop        
00ed0 c5f877                         vzeroupper 
00ed3 e8082fb6ff                     call       0x7f6c9f9c3660
00ed8 0f1f8400d00f0013               nop        dword ptr [rax + rax + 0x13000fd0]
00ee0 be45ffffff                     mov        esi, 0xffffff45
00ee5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00eed 448b1c24                       mov        r11d, dword ptr [rsp]
00ef1 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00ef9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00efe 4c891c24                       mov        qword ptr [rsp], r11
00f02 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f07 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00f0f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00f14 44895c2408                     mov        dword ptr [rsp + 8], r11d
00f19 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00f1e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00f23 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00f28 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f2d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f32 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f37 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00f3c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f41 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f46 895c2424                       mov        dword ptr [rsp + 0x24], ebx
00f4a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f4f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f54 897c2430                       mov        dword ptr [rsp + 0x30], edi
00f58 c5f877                         vzeroupper 
00f5b e8802eb6ff                     call       0x7f6c9f9c3660
00f60 0f1f840058100014               nop        dword ptr [rax + rax + 0x14001058]
00f68 4c3bd9                         cmp        r11, rcx
00f6b bdffffffff                     mov        ebp, 0xffffffff
00f70 7c08                           jl         0x7f6c9fe607fa
00f72 400f95c5                       setne      bpl
00f76 400fb6ed                       movzx      ebp, bpl
00f7a be45ffffff                     mov        esi, 0xffffff45
00f7f 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f84 4489442404                     mov        dword ptr [rsp + 4], r8d
00f89 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00f8e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00f93 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00f98 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00f9d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00fa2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00fa7 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00fac 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00fb1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00fb6 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
00fbb 90                             nop        
00fbc c5f877                         vzeroupper 
00fbf e81c2eb6ff                     call       0x7f6c9f9c3660
00fc4 0f1f8400bc100015               nop        dword ptr [rax + rax + 0x150010bc]
00fcc be45ffffff                     mov        esi, 0xffffff45
00fd1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00fd9 448b1c24                       mov        r11d, dword ptr [rsp]
00fdd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00fe5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00fea 4c891c24                       mov        qword ptr [rsp], r11
00fee 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ff3 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
00ffb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01000 44895c2408                     mov        dword ptr [rsp + 8], r11d
01005 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0100a 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0100f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01014 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01019 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0101e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01023 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01028 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0102d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01032 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01037 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0103c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01041 666690                         nop        
01044 c5f877                         vzeroupper 
01047 e8942db6ff                     call       0x7f6c9f9c3660
0104c 0f1f840044110016               nop        dword ptr [rax + rax + 0x16001144]
01054 be45ffffff                     mov        esi, 0xffffff45
01059 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01061 448b0424                       mov        r8d, dword ptr [rsp]
01065 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0106d 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01072 4c890424                       mov        qword ptr [rsp], r8
01076 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0107b 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
01083 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01088 4489442408                     mov        dword ptr [rsp + 8], r8d
0108d 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01092 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01097 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0109c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010a6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
010ab 4489442414                     mov        dword ptr [rsp + 0x14], r8d
010b0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
010b5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
010ba 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
010bf 4489442430                     mov        dword ptr [rsp + 0x30], r8d
010c4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
010c9 666690                         nop        
010cc c5f877                         vzeroupper 
010cf e80c2db6ff                     call       0x7f6c9f9c3660
010d4 0f1f8400cc110017               nop        dword ptr [rax + rax + 0x170011cc]
010dc be45ffffff                     mov        esi, 0xffffff45
010e1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
010e9 448b1c24                       mov        r11d, dword ptr [rsp]
010ed 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
010f5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010fa 4c891c24                       mov        qword ptr [rsp], r11
010fe 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01103 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0110b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01110 44895c2408                     mov        dword ptr [rsp + 8], r11d
01115 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0111a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0111f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01124 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01129 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0112e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01133 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01138 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0113d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01142 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01147 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0114c c5f877                         vzeroupper 
0114f e88c2cb6ff                     call       0x7f6c9f9c3660
01154 0f1f84004c120018               nop        dword ptr [rax + rax + 0x1800124c]
0115c be45ffffff                     mov        esi, 0xffffff45
01161 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01169 448b1424                       mov        r10d, dword ptr [rsp]
0116d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01175 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0117a 4c891424                       mov        qword ptr [rsp], r10
0117e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01183 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0118b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01190 4489542408                     mov        dword ptr [rsp + 8], r10d
01195 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0119a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0119f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
011a4 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011a9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
011ae 4489542420                     mov        dword ptr [rsp + 0x20], r10d
011b3 90                             nop        
011b4 c5f877                         vzeroupper 
011b7 e8242cb6ff                     call       0x7f6c9f9c3660
011bc 0f1f8400b4120019               nop        dword ptr [rax + rax + 0x190012b4]
011c4 448bd1                         mov        r10d, ecx
011c7 33c9                           xor        ecx, ecx
011c9 e9caf9ffff                     jmp        0x7f6c9fe60418
011ce be17000000                     mov        esi, 0x17
011d3 90                             nop        
011d4 c5f877                         vzeroupper 
011d7 e8042cb6ff                     call       0x7f6c9f9c3660
011dc 0f1f8400d412001a               nop        dword ptr [rax + rax + 0x1a0012d4]
011e4 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
011ec 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011f1 be6effffff                     mov        esi, 0xffffff6e
011f6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
011fe 4c89542408                     mov        qword ptr [rsp + 8], r10
01203 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
01208 48894424f8                     mov        qword ptr [rsp - 8], rax
0120d 8b442418                       mov        eax, dword ptr [rsp + 0x18]
01211 89442414                       mov        dword ptr [rsp + 0x14], eax
01215 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0121a 89542418                       mov        dword ptr [rsp + 0x18], edx
0121e 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01222 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01227 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0122c 897c2430                       mov        dword ptr [rsp + 0x30], edi
01230 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01235 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0123a 6690                           nop        
0123c c5f877                         vzeroupper 
0123f e89c2bb6ff                     call       0x7f6c9f9c3660
01244 0f1f84003c13001b               nop        dword ptr [rax + rax + 0x1b00133c]
0124c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01254 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01259 eb96                           jmp        0x7f6c9fe60a71
0125b 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01263 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01268 eb87                           jmp        0x7f6c9fe60a71
0126a 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01272 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01277 e975ffffff                     jmp        0x7f6c9fe60a71
0127c bebeffffff                     mov        esi, 0xffffffbe
01281 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01289 448b1c24                       mov        r11d, dword ptr [rsp]
0128d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01295 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0129a 4c891424                       mov        qword ptr [rsp], r10
0129e 44894c2408                     mov        dword ptr [rsp + 8], r9d
012a3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
012a8 448954240c                     mov        dword ptr [rsp + 0xc], r10d
012ad 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012b2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012b7 90                             nop        
012b8 c5f877                         vzeroupper 
012bb e8202bb6ff                     call       0x7f6c9f9c3660
012c0 0f1f8400b813001c               nop        dword ptr [rax + rax + 0x1c0013b8]
012c8 bee4ffffff                     mov        esi, 0xffffffe4
012cd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
012d5 448b0424                       mov        r8d, dword ptr [rsp]
012d9 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
012e1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012e6 4c891c24                       mov        qword ptr [rsp], r11
012ea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012ef 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
012f7 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
012fc 4489442408                     mov        dword ptr [rsp + 8], r8d
01301 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01306 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0130b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01310 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01315 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0131a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0131f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01324 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01329 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0132e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01332 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01337 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0133c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01341 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01345 666690                         nop        
01348 c5f877                         vzeroupper 
0134b e8902ab6ff                     call       0x7f6c9f9c3660
01350 0f1f84004814001d               nop        dword ptr [rax + rax + 0x1d001448]
01358 bef6ffffff                     mov        esi, 0xfffffff6
0135d 666690                         nop        
01360 c5f877                         vzeroupper 
01363 e8782ab6ff                     call       0x7f6c9f9c3660
01368 0f1f84006014001e               nop        dword ptr [rax + rax + 0x1e001460]
01370 bee4ffffff                     mov        esi, 0xffffffe4
01375 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0137d 448b1424                       mov        r10d, dword ptr [rsp]
01381 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01389 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0138e 4c891424                       mov        qword ptr [rsp], r10
01392 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01397 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0139f 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
013a4 4489542408                     mov        dword ptr [rsp + 8], r10d
013a9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013ae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013b3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013b8 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
013bd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
013c2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
013c7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
013cc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
013d1 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
013d9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
013de 6690                           nop        
013e0 c5f877                         vzeroupper 
013e3 e8f829b6ff                     call       0x7f6c9f9c3660
013e8 0f1f8400e014001f               nop        dword ptr [rax + rax + 0x1f0014e0]
013f0 bee4ffffff                     mov        esi, 0xffffffe4
013f5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
013fd 448b1424                       mov        r10d, dword ptr [rsp]
01401 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01409 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0140e 4c891424                       mov        qword ptr [rsp], r10
01412 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01417 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0141f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01424 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01429 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0142e 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01433 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01438 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0143d 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01442 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01447 90                             nop        
01448 c5f877                         vzeroupper 
0144b e89029b6ff                     call       0x7f6c9f9c3660
01450 0f1f840048150020               nop        dword ptr [rax + rax + 0x20001548]
01458 beccffffff                     mov        esi, 0xffffffcc
0145d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01465 448b1424                       mov        r10d, dword ptr [rsp]
01469 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01471 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01476 4c891424                       mov        qword ptr [rsp], r10
0147a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0147f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01487 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0148c 4489542408                     mov        dword ptr [rsp + 8], r10d
01491 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01496 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0149b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014a0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014a5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014aa 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
014af 90                             nop        
014b0 c5f877                         vzeroupper 
014b3 e82829b6ff                     call       0x7f6c9f9c3660
014b8 0f1f8400b0150021               nop        dword ptr [rax + rax + 0x210015b0]
014c0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
014c8 458d5a08                       lea        r11d, [r10 + 8]
014cc 458bc3                         mov        r8d, r11d
014cf be6effffff                     mov        esi, 0xffffff6e
014d4 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
014dc 448b1c24                       mov        r11d, dword ptr [rsp]
014e0 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
014e8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014ed 4c891424                       mov        qword ptr [rsp], r10
014f1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014f6 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
014fe 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01503 44895c2408                     mov        dword ptr [rsp + 8], r11d
01508 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0150d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01512 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01517 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0151c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01521 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01526 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0152b 90                             nop        
0152c c5f877                         vzeroupper 
0152f e8ac28b6ff                     call       0x7f6c9f9c3660
01534 0f1f84002c160022               nop        dword ptr [rax + rax + 0x2200162c]
0153c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01544 458d5a08                       lea        r11d, [r10 + 8]
01548 458bc3                         mov        r8d, r11d
0154b be66ffffff                     mov        esi, 0xffffff66
01550 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01558 448b1424                       mov        r10d, dword ptr [rsp]
0155c 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01564 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01569 4c891424                       mov        qword ptr [rsp], r10
0156d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01572 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0157a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0157f 4489542408                     mov        dword ptr [rsp + 8], r10d
01584 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01589 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0158e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01593 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01598 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0159d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015a2 4489442430                     mov        dword ptr [rsp + 0x30], r8d
015a7 90                             nop        
015a8 c5f877                         vzeroupper 
015ab e83028b6ff                     call       0x7f6c9f9c3660
015b0 0f1f8400a8160023               nop        dword ptr [rax + rax + 0x230016a8]
015b8 be6effffff                     mov        esi, 0xffffff6e
015bd 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
015c5 448b0424                       mov        r8d, dword ptr [rsp]
015c9 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
015d1 4c8b442408                     mov        r8, qword ptr [rsp + 8]
015d6 4c890424                       mov        qword ptr [rsp], r8
015da 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
015df 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
015e7 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
015ec 44894c2408                     mov        dword ptr [rsp + 8], r9d
015f1 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
015f6 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
015fb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01600 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01605 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0160a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0160f 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01614 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01619 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0161e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01622 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01627 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0162c 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01631 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01636 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0163b 897c2440                       mov        dword ptr [rsp + 0x40], edi
0163f 90                             nop        
01640 c5f877                         vzeroupper 
01643 e89827b6ff                     call       0x7f6c9f9c3660
01648 0f1f840040170024               nop        dword ptr [rax + rax + 0x24001740]
01650 458bc8                         mov        r9d, r8d
01653 e9bcf4ffff                     jmp        0x7f6c9fe60394
01658 bee4ffffff                     mov        esi, 0xffffffe4
0165d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01665 448b1424                       mov        r10d, dword ptr [rsp]
01669 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01671 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01676 4c891424                       mov        qword ptr [rsp], r10
0167a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0167f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
01687 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0168c 4489542408                     mov        dword ptr [rsp + 8], r10d
01691 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01696 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0169b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016a0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016a5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
016aa 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016af 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016b7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016bc c5f877                         vzeroupper 
016bf e81c27b6ff                     call       0x7f6c9f9c3660
016c4 0f1f8400bc170025               nop        dword ptr [rax + rax + 0x250017bc]
016cc bee4ffffff                     mov        esi, 0xffffffe4
016d1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016d6 44895c2404                     mov        dword ptr [rsp + 4], r11d
016db 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016e0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016e5 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
016ea 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
016ef 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
016f4 c5f877                         vzeroupper 
016f7 e8e426b6ff                     call       0x7f6c9f9c3660
016fc 0f1f8400f4170026               nop        dword ptr [rax + rax + 0x260017f4]
01704 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
0170b ffc5                           inc        ebp
0170d bee4ffffff                     mov        esi, 0xffffffe4
01712 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01717 4489542404                     mov        dword ptr [rsp + 4], r10d
0171c 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01721 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01726 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0172b 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01730 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01735 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0173a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0173f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01744 c5f877                         vzeroupper 
01747 e89426b6ff                     call       0x7f6c9f9c3660
0174c 0f1f840044180027               nop        dword ptr [rax + rax + 0x27001844]
01754 bee4ffffff                     mov        esi, 0xffffffe4
01759 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0175e 44895c2404                     mov        dword ptr [rsp + 4], r11d
01763 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01768 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0176d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01772 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01777 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0177c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01781 666690                         nop        
01784 c5f877                         vzeroupper 
01787 e85426b6ff                     call       0x7f6c9f9c3660
0178c 0f1f840084180028               nop        dword ptr [rax + rax + 0x28001884]
01794 bee4ffffff                     mov        esi, 0xffffffe4
01799 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
017a1 448b1c24                       mov        r11d, dword ptr [rsp]
017a5 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
017ad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017b2 4c891424                       mov        qword ptr [rsp], r10
017b6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017bb 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
017c3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017cd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017d2 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
017d7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017dc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017e1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017e6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017eb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
017f0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017f5 666690                         nop        
017f8 c5f877                         vzeroupper 
017fb e8e025b6ff                     call       0x7f6c9f9c3660
01800 0f1f8400f8180029               nop        dword ptr [rax + rax + 0x290018f8]
01808 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0180d beccffffff                     mov        esi, 0xffffffcc
01812 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0181a 898c24c8000000                 mov        dword ptr [rsp + 0xc8], ecx
01821 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01829 44890424                       mov        dword ptr [rsp], r8d
0182d 48895c2408                     mov        qword ptr [rsp + 8], rbx
01832 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01837 90                             nop        
01838 c5f877                         vzeroupper 
0183b e8a025b6ff                     call       0x7f6c9f9c3660
01840 0f1f84003819002a               nop        dword ptr [rax + rax + 0x2a001938]
01848 bef6ffffff                     mov        esi, 0xfffffff6
0184d 666690                         nop        
01850 c5f877                         vzeroupper 
01853 e88825b6ff                     call       0x7f6c9f9c3660
01858 0f1f84005019002b               nop        dword ptr [rax + rax + 0x2b001950]
01860 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01868 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0186d e97ff9ffff                     jmp        0x7f6c9fe60a71
01872 eb14                           jmp        0x7f6c9fe61108
01874 eb12                           jmp        0x7f6c9fe61108
01876 eb10                           jmp        0x7f6c9fe61108
01878 eb0e                           jmp        0x7f6c9fe61108
0187a eb0c                           jmp        0x7f6c9fe61108
0187c eb0a                           jmp        0x7f6c9fe61108
0187e eb08                           jmp        0x7f6c9fe61108
01880 eb06                           jmp        0x7f6c9fe61108
01882 eb04                           jmp        0x7f6c9fe61108
01884 eb02                           jmp        0x7f6c9fe61108
01886 eb00                           jmp        0x7f6c9fe61108
01888 488bf0                         mov        rsi, rax
0188b e96cecffff                     jmp        0x7f6c9fe5fd7c
01890 bef6ffffff                     mov        esi, 0xfffffff6
01895 498beb                         mov        rbp, r11
01898 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
0189f 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
018a7 90                             nop        
018a8 c5f877                         vzeroupper 
018ab e83025b6ff                     call       0x7f6c9f9c3660
018b0 0f1f8400a819002c               nop        dword ptr [rax + rax + 0x2c0019a8]
018b8 49ba9804e69f6c7f0000           movabs     r10, 0x7f6c9fe60498
018c2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
018c9 e992cda9ff                     jmp        0x7f6c9f8fdee0
018ce e84d99a8ff                     call       0x7f6c9f8eaaa0
018d3 e966e7ffff                     jmp        0x7f6c9fe5f8be
