00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85c2200000                   jne        0x7f6a97be7b60
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f835f1a0000                   jae        0x7f6a97be7535
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84851a0000                   je         0x7f6a97be7568
00063 448bc2                         mov        r8d, edx
00066 442b442408                     sub        r8d, dword ptr [rsp + 8]
0006b 8b1c24                         mov        ebx, dword ptr [rsp]
0006e 83c3f9                         add        ebx, -7
00071 8d42f8                         lea        eax, [rdx - 8]
00074 468d1cc500000000               lea        r11d, [r8*8]
0007c f3440fbdc9                     lzcnt      r9d, ecx
00081 41be1f000000                   mov        r14d, 0x1f
00087 452bf1                         sub        r14d, r9d
0008a bf08000000                     mov        edi, 8
0008f 412bfe                         sub        edi, r14d
00092 418bd3                         mov        edx, r11d
00095 2bd7                           sub        edx, edi
00097 4183f808                       cmp        r8d, 8
0009b 0f8c9f180000                   jl         0x7f6a97be73c0
000a1 85db                           test       ebx, ebx
000a3 0f8c771c0000                   jl         0x7f6a97be77a0
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83311b0000                   jae        0x7f6a97be7668
000b7 448bd0                         mov        r10d, eax
000ba 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bf 4183c0f8                       add        r8d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183f808                       cmp        r8d, 8
000d3 0f8c14190000                   jl         0x7f6a97be746d
000d9 85db                           test       ebx, ebx
000db 0f8c9b1c0000                   jl         0x7f6a97be77fc
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f834c1b0000                   jae        0x7f6a97be76bc
000f0 458bc2                         mov        r8d, r10d
000f3 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000fb 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f84fe190000                   je         0x7f6a97be7590
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f84111a0000                   je         0x7f6a97be75b8
00127 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0012c 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00134 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00139 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
0013e 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00145 448974240c                     mov        dword ptr [rsp + 0xc], r14d
0014a 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014e 89442410                       mov        dword ptr [rsp + 0x10], eax
00152 895c2404                       mov        dword ptr [rsp + 4], ebx
00156 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015e 41034804                       add        ecx, dword ptr [r8 + 4]
00162 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00167 41034904                       add        ecx, dword ptr [r9 + 4]
0016b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00170 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
00174 4d8bd1                         mov        r10, r9
00177 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0017c 4d8bd0                         mov        r10, r8
0017f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00184 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00189 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018e 85c9                           test       ecx, ecx
00190 0f8404090000                   je         0x7f6a97be651a
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f1e020000                   jg         0x7f6a97be5e43
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8d2e1d0000                   jge        0x7f6a97be7968
001ba 41bb01000000                   mov        r11d, 1
001c0 c4c2f1f7eb                     shlx       rbp, r11, rcx
001c5 48ffcd                         dec        rbp
001c8 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001cd 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001d2 448bd9                         mov        r11d, ecx
001d5 458bd3                         mov        r10d, r11d
001d8 442b54240c                     sub        r10d, dword ptr [rsp + 0xc]
001dd 458d4208                       lea        r8d, [r10 + 8]
001e1 4183f840                       cmp        r8d, 0x40
001e5 7c34                           jl         0x7f6a97be5c9b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c2c8                       add        r10d, -0x38
001f0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 90                             nop        
00206 90                             nop        
00207 e8d49fb4ff                     call       0x7f6a9772fc60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f6a97be5ccc
0021b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00220 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00228 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0022d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00232 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0023a 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00242 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00247 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0024c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00251 458b5304                       mov        r10d, dword ptr [r11 + 4]
00255 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0025a 4183fa20                       cmp        r10d, 0x20
0025e 0f8d7c1b0000                   jge        0x7f6a97be7860
00264 c462abf7542460                 shrx       r10, qword ptr [rsp + 0x60], r10
0026b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00270 41ba01000000                   mov        r10d, 1
00276 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0027b c44239f7d2                     shlx       r10d, r10d, r8d
00280 41ffca                         dec        r10d
00283 4d63d2                         movsxd     r10, r10d
00286 4c23542460                     and        r10, qword ptr [rsp + 0x60]
0028b 458bda                         mov        r11d, r10d
0028e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00293 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00298 458b5204                       mov        r10d, dword ptr [r10 + 4]
0029c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
002a1 4183fa20                       cmp        r10d, 0x20
002a5 0f8d8d1b0000                   jge        0x7f6a97be78b8
002ab 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002b3 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002b7 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
002bf 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002c4 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002c8 458b5204                       mov        r10d, dword ptr [r10 + 4]
002cc 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
002d1 458b5814                       mov        r11d, dword ptr [r8 + 0x14]
002d5 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d9 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
002de 458b4814                       mov        r9d, dword ptr [r8 + 0x14]
002e2 458b4104                       mov        r8d, dword ptr [r9 + 4]
002e6 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002ea 85c9                           test       ecx, ecx
002ec 0f8ebb170000                   jle        0x7f6a97be752d
002f2 41ffca                         dec        r10d
002f5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002fa 41ffcb                         dec        r11d
002fd 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00302 41ffc8                         dec        r8d
00305 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0030a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0030f c462abf75c2468                 shrx       r11, qword ptr [rsp + 0x68], r10
00316 41ba01000000                   mov        r10d, 1
0031c 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
00320 c44251f7c2                     shlx       r8d, r10d, ebp
00325 458bd3                         mov        r10d, r11d
00328 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0032d 41ffc8                         dec        r8d
00330 4d63d0                         movsxd     r10, r8d
00333 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00338 458bda                         mov        r11d, r10d
0033b 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00340 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00348 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0034f 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00357 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0035f 458b9af0000000                 mov        r11d, dword ptr [r10 + 0xf0]
00366 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0036e 458b5b04                       mov        r11d, dword ptr [r11 + 4]
00372 4585db                         test       r11d, r11d
00375 0f86e5170000                   jbe        0x7f6a97be75e0
0037b 4d63d3                         movsxd     r10, r11d
0037e 4c63d9                         movsxd     r11, ecx
00381 49ffcb                         dec        r11
00384 4d3bda                         cmp        r11, r10
00387 0f83d3170000                   jae        0x7f6a97be75e0
0038d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00392 4585db                         test       r11d, r11d
00395 0f8cfd180000                   jl         0x7f6a97be7718
0039b 8b2c24                         mov        ebp, dword ptr [rsp]
0039e 83c5f9                         add        ebp, -7
003a1 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a8 4533db                         xor        r11d, r11d
003ab 4533d2                         xor        r10d, r10d
003ae 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b6 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003be e985020000                     jmp        0x7f6a97be60c8
003c3 8be9                           mov        ebp, ecx
003c5 2bee                           sub        ebp, esi
003c7 e8149eb4ff                     call       0x7f6a9772fc60
003cc 0f1f8400c4040001               nop        dword ptr [rax + rax + 0x10004c4]
003d4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d9 41bb40000000                   mov        r11d, 0x40
003df 442bdd                         sub        r11d, ebp
003e2 c462d1f7c0                     shlx       r8, rax, rbp
003e7 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f1 4d0bc2                         or         r8, r10
003f4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003f9 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fe e9d2fdffff                     jmp        0x7f6a97be5c55
00403 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0040b 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00410 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00415 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0041d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00422 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00426 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042a 90                             nop        
0042b 90                             nop        
0042c 90                             nop        
0042d 90                             nop        
0042e 90                             nop        
0042f 90                             nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8d7c090000                   jge        0x7f6a97be683c
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d3d0a0000                   jge        0x7f6a97be6930
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d280b0000                   jge        0x7f6a97be6a44
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d170c0000                   jge        0x7f6a97be6b5c
004c5 41bb01000000                   mov        r11d, 1
004cb c442d1f7cb                     shlx       r9, r11, rbp
004d0 49ffc9                         dec        r9
004d3 4c23cb                         and        r9, rbx
004d6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004de 418bdb                         mov        ebx, r11d
004e1 4103da                         add        ebx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d1                         add        r10d, ecx
004ef 4c63db                         movsxd     r11, ebx
004f2 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
004fa 8bc9                           mov        ecx, ecx
004fc 4c03c9                         add        r9, rcx
004ff 488b8c24e8000000               mov        rcx, qword ptr [rsp + 0xe8]
00507 4903cb                         add        rcx, r11
0050a 48898c24e8000000               mov        qword ptr [rsp + 0xe8], rcx
00512 4d85c9                         test       r9, r9
00515 0f8e99070000                   jle        0x7f6a97be6734
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8fb80c0000                   jg         0x7f6a97be6c60
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fb70d0000                   jg         0x7f6a97be6d6c
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8f930e0000                   jg         0x7f6a97be6e54
00541 458bc9                         mov        r9d, r9d
00544 4181f900000010                 cmp        r9d, 0x10000000
0054b 0f836b0f0000                   jae        0x7f6a97be6f3c
00551 4d63d2                         movsxd     r10, r10d
00554 4d63c9                         movsxd     r9, r9d
00557 49c1e312                       shl        r11, 0x12
0055b 49c1e124                       shl        r9, 0x24
0055f 4d0bcb                         or         r9, r11
00562 4d0bca                         or         r9, r10
00565 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056d 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00575 4f894cda08                     mov        qword ptr [r10 + r11*8 + 8], r9
0057a 8b2c24                         mov        ebp, dword ptr [rsp]
0057d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00581 0f8db0000000                   jge        0x7f6a97be60b7
00587 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0058f 49c1eb30                       shr        r11, 0x30
00593 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00598 49c1ea30                       shr        r10, 0x30
0059c 458bcb                         mov        r9d, r11d
0059f 418bca                         mov        ecx, r10d
005a2 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005aa c4c22bf7d8                     shrx       ebx, r8d, r10d
005af 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005b7 c4422bf7d0                     shrx       r10d, r8d, r10d
005bc 4103ca                         add        ecx, r10d
005bf 894c2460                       mov        dword ptr [rsp + 0x60], ecx
005c3 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005cb 4183fa20                       cmp        r10d, 0x20
005cf 0f8d27100000                   jge        0x7f6a97be707c
005d5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dd 49c1ea30                       shr        r10, 0x30
005e1 458bd2                         mov        r10d, r10d
005e4 41bb01000000                   mov        r11d, 1
005ea 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005f1 c44241f7db                     shlx       r11d, r11d, edi
005f6 41ffcb                         dec        r11d
005f9 4423db                         and        r11d, ebx
005fc 4503d9                         add        r11d, r9d
005ff 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00604 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
0060c 4183f920                       cmp        r9d, 0x20
00610 0f8d8a100000                   jge        0x7f6a97be7120
00616 41b901000000                   mov        r9d, 1
0061c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00624 c44221f7d9                     shlx       r11d, r9d, r11d
00629 41ffcb                         dec        r11d
0062c 4523d8                         and        r11d, r8d
0062f 4503da                         add        r11d, r10d
00632 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00637 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063b 0f8d9d030000                   jge        0x7f6a97be645e
00641 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442460                     and        r8d, dword ptr [rsp + 0x60]
00652 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00657 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
0065b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0065f 453bc2                         cmp        r8d, r10d
00662 0f8342040000                   jae        0x7f6a97be652a
00668 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0066c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00670 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00675 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00679 458b5104                       mov        r10d, dword ptr [r9 + 4]
0067d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00682 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00687 413bca                         cmp        ecx, r10d
0068a 0f83b8040000                   jae        0x7f6a97be65c8
00690 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00695 4423442448                     and        r8d, dword ptr [rsp + 0x48]
0069a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
006a3 418b5a04                       mov        ebx, dword ptr [r10 + 4]
006a7 4d8b5cc908                     mov        r11, qword ptr [r9 + rcx*8 + 8]
006ac 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
006b4 443bc3                         cmp        r8d, ebx
006b7 0f833b050000                   jae        0x7f6a97be6678
006bd 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006c2 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ca 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d1 ffc5                           inc        ebp
006d3 892c24                         mov        dword ptr [rsp], ebp
006d6 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006da 0f8d79030000                   jge        0x7f6a97be64d9
006e0 49c1ea28                       shr        r10, 0x28
006e4 458bd2                         mov        r10d, r10d
006e7 450fb6da                       movzx      r11d, r10b
006eb 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006f3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006f8 49c1ea28                       shr        r10, 0x28
006fc 458bda                         mov        r11d, r10d
006ff 410fb6eb                       movzx      ebp, r11b
00703 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
0070a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00712 49c1ea28                       shr        r10, 0x28
00716 458bda                         mov        r11d, r10d
00719 450fb6db                       movzx      r11d, r11b
0071d 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00725 4103eb                         add        ebp, r11d
00728 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0072f 41bb01000000                   mov        r11d, 1
00735 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0073d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00745 49c1ea20                       shr        r10, 0x20
00749 458bd2                         mov        r10d, r10d
0074c 410fb6ea                       movzx      ebp, r10b
00750 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00757 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0075c 49c1ea20                       shr        r10, 0x20
00760 458bda                         mov        r11d, r10d
00763 410fb6eb                       movzx      ebp, r11b
00767 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0076e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00776 49c1ea20                       shr        r10, 0x20
0077a 458bd2                         mov        r10d, r10d
0077d 410fb6ea                       movzx      ebp, r10b
00781 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00788 448bc5                         mov        r8d, ebp
0078b 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00793 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
0079b 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
007a3 4585c0                         test       r8d, r8d
007a6 0f84de020000                   je         0x7f6a97be650a
007ac 4183f83f                       cmp        r8d, 0x3f
007b0 0f8f0a0e0000                   jg         0x7f6a97be7040
007b6 b940000000                     mov        ecx, 0x40
007bb 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007bf 443bc1                         cmp        r8d, ecx
007c2 7e47                           jle        0x7f6a97be628b
007c4 458bc8                         mov        r9d, r8d
007c7 442bc9                         sub        r9d, ecx
007ca 83f940                         cmp        ecx, 0x40
007cd 0f8d6d100000                   jge        0x7f6a97be72c0
007d3 41ba01000000                   mov        r10d, 1
007d9 c442f1f7d2                     shlx       r10, r10, rcx
007de 49ffca                         dec        r10
007e1 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007e9 c4c2b1f7ea                     shlx       rbp, r10, r9
007ee 41bb40000000                   mov        r11d, 0x40
007f4 452bd9                         sub        r11d, r9d
007f7 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007fe 490bea                         or         rbp, r10
00801 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00809 eb30                           jmp        0x7f6a97be62bb
0080b 412bc8                         sub        ecx, r8d
0080e c462f3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rcx
00818 4183f840                       cmp        r8d, 0x40
0081c 0f8d1a0f0000                   jge        0x7f6a97be71bc
00822 41ba01000000                   mov        r10d, 1
00828 c4c2b9f7ea                     shlx       rbp, r10, r8
0082d 48ffcd                         dec        rbp
00830 4923e9                         and        rbp, r9
00833 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0083b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00840 4503d0                         add        r10d, r8d
00843 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00848 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0084d 4503d8                         add        r11d, r8d
00850 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00855 4183fb40                       cmp        r11d, 0x40
00859 0f8cd1fbffff                   jl         0x7f6a97be5eb0
0085f 458d53c0                       lea        r10d, [r11 - 0x40]
00863 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00868 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0086c 83c5f8                         add        ebp, -8
0086f 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00873 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00877 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0087b 83c1f0                         add        ecx, -0x10
0087e 83f908                         cmp        ecx, 8
00881 0f8c09010000                   jl         0x7f6a97be6410
00887 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0088c 4183c0e8                       add        r8d, -0x18
00890 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00898 0f8265fbffff                   jb         0x7f6a97be5e83
0089e bee4ffffff                     mov        esi, 0xffffffe4
008a3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
008ab 448b542408                     mov        r10d, dword ptr [rsp + 8]
008b0 44891424                       mov        dword ptr [rsp], r10d
008b4 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008b9 4489542404                     mov        dword ptr [rsp + 4], r10d
008be 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008c3 44895c2408                     mov        dword ptr [rsp + 8], r11d
008c8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008cd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008d2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008d7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008dc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008e1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008e6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008eb 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008f0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008f5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008fa 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008ff 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00904 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00909 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0090e 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00913 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00918 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0091d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00922 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00927 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0092c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00931 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00936 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0093b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00940 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00945 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0094a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00952 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00957 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0095f 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00964 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0096c 90                             nop        
0096d 90                             nop        
0096e 90                             nop        
0096f e86c76aeff                     call       0x7f6a976cda60
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0098a e851811318                     call       0x7f6aafd1e560
0098f f4                             hlt        
00990 85c9                           test       ecx, ecx
00992 7f08                           jg         0x7f6a97be641c
00994 4533d2                         xor        r10d, r10d
00997 e974faffff                     jmp        0x7f6a97be5e90
0099c 8be9                           mov        ebp, ecx
0099e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
009a6 8b542408                       mov        edx, dword ptr [rsp + 8]
009aa 90                             nop        
009ab e83098b4ff                     call       0x7f6a9772fc60
009b0 0f1f8400a80a0003               nop        dword ptr [rax + rax + 0x3000aa8]
009b8 448b542408                     mov        r10d, dword ptr [rsp + 8]
009bd 41c1e203                       shl        r10d, 3
009c1 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009c6 41c1e003                       shl        r8d, 3
009ca 452bd0                         sub        r10d, r8d
009cd 4181c2c0000000                 add        r10d, 0xc0
009d4 c462a9f7d0                     shlx       r10, rax, r10
009d9 e932faffff                     jmp        0x7f6a97be5e90
009de 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
009e6 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009ee 4d03da                         add        r11, r10
009f1 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009f9 4d3bda                         cmp        r11, r10
009fc 7f29                           jg         0x7f6a97be64a7
009fe 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a03 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
00a0b 0f85af140000                   jne        0x7f6a97be7940
00a11 418bc3                         mov        eax, r11d
00a14 4881c410010000                 add        rsp, 0x110
00a1b 5d                             pop        rbp
00a1c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a20 0f87a4160000                   ja         0x7f6a97be7b4a
00a26 c3                             ret        
00a27 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a31 90                             nop        
00a32 90                             nop        
00a33 e8a897b4ff                     call       0x7f6a9772fc60
00a38 0f1f8400300b0004               nop        dword ptr [rax + rax + 0x4000b30]
00a40 4885c0                         test       rax, rax
00a43 0f844f140000                   je         0x7f6a97be7918
00a49 488bf0                         mov        rsi, rax
00a4c 4881c410010000                 add        rsp, 0x110
00a53 5d                             pop        rbp
00a54 e907ffadff                     jmp        0x7f6a976c63e0
00a59 4533db                         xor        r11d, r11d
00a5c 4533d2                         xor        r10d, r10d
00a5f 4533c9                         xor        r9d, r9d
00a62 4533c0                         xor        r8d, r8d
00a65 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a6d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00a75 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a7d 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00a85 e9b3fcffff                     jmp        0x7f6a97be61bd
00a8a 4533d2                         xor        r10d, r10d
00a8d 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a95 e996f9ffff                     jmp        0x7f6a97be5eb0
00a9a 4533db                         xor        r11d, r11d
00a9d 4533d2                         xor        r10d, r10d
00aa0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00aa5 e92bf7ffff                     jmp        0x7f6a97be5c55
00aaa bee4ffffff                     mov        esi, 0xffffffe4
00aaf 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ab7 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00abc 44890c24                       mov        dword ptr [rsp], r9d
00ac0 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ac5 4489542404                     mov        dword ptr [rsp + 4], r10d
00aca 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00acf 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ad4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ad9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ade 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ae3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ae8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00aed 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00af2 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00af7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00afc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00b01 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00b06 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00b0b 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00b10 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b15 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b1a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b1f 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b24 90                             nop        
00b25 90                             nop        
00b26 90                             nop        
00b27 e8b474aeff                     call       0x7f6a976cda60
00b2c 0f1f8400240c0005               nop        dword ptr [rax + rax + 0x5000c24]
00b34 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b42 e8997f1318                     call       0x7f6aafd1e560
00b47 f4                             hlt        
00b48 bee4ffffff                     mov        esi, 0xffffffe4
00b4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b55 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b5a 44891c24                       mov        dword ptr [rsp], r11d
00b5e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b63 4489542404                     mov        dword ptr [rsp + 4], r10d
00b68 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b6d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b72 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b77 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b7c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b81 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b86 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b8b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b90 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b95 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b9a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b9f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ba4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ba9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00bae 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bb3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bb8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bbd 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00bc2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00bc7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00bcc 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00bd1 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00bd5 90                             nop        
00bd6 90                             nop        
00bd7 e80474aeff                     call       0x7f6a976cda60
00bdc 0f1f8400d40c0006               nop        dword ptr [rax + rax + 0x6000cd4]
00be4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bf2 e8e97e1318                     call       0x7f6aafd1e560
00bf7 f4                             hlt        
00bf8 bee4ffffff                     mov        esi, 0xffffffe4
00bfd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c05 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00c0a 44890c24                       mov        dword ptr [rsp], r9d
00c0e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c13 44895c2404                     mov        dword ptr [rsp + 4], r11d
00c18 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00c1d 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c22 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00c27 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c2c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c31 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c36 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c3b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c40 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c45 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00c4a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c4f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c54 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c59 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c5e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c63 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c68 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c6d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c72 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c77 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c7c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c81 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c86 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c8b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c90 90                             nop        
00c91 90                             nop        
00c92 90                             nop        
00c93 e84873aeff                     call       0x7f6a976cda60
00c98 0f1f8400900d0007               nop        dword ptr [rax + rax + 0x7000d90]
00ca0 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00caa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00cae e82d7e1318                     call       0x7f6aafd1e560
00cb3 f4                             hlt        
00cb4 4533db                         xor        r11d, r11d
00cb7 4d3bcb                         cmp        r9, r11
00cba bdffffffff                     mov        ebp, 0xffffffff
00cbf 7c08                           jl         0x7f6a97be6749
00cc1 400f95c5                       setne      bpl
00cc5 400fb6ed                       movzx      ebp, bpl
00cc9 be45ffffff                     mov        esi, 0xffffff45
00cce 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00cd6 4c891c24                       mov        qword ptr [rsp], r11
00cda 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00cdf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ce4 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00cec 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cf1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00cf6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cfb 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00cff 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00d03 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d08 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d0d 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00d11 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00d15 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d1a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00d1f 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00d23 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00d27 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d2c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d31 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00d38 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00d3c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d41 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d46 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00d4a 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00d4e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00d53 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d58 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d5d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d62 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d6a 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d6f 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d77 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d7c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d84 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d8b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d93 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d9b e84072aeff                     call       0x7f6a976cda60
00da0 0f1f8400980e0008               nop        dword ptr [rax + rax + 0x8000e98]
00da8 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00db6 e8257d1318                     call       0x7f6aafd1e560
00dbb f4                             hlt        
00dbc be45ffffff                     mov        esi, 0xffffff45
00dc1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00dc9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00dce 44891424                       mov        dword ptr [rsp], r10d
00dd2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00dd7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ddc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00de1 4489542408                     mov        dword ptr [rsp + 8], r10d
00de6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00dee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00df3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00df8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dfd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e02 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e07 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e0c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e11 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e16 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e1b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e20 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e25 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e2a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e2f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e34 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e39 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e3e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e43 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e48 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e4d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e52 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e57 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e5c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e61 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e66 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e6b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e70 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e75 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e7d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e82 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e8a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e8f e84c71aeff                     call       0x7f6a976cda60
00e94 0f1f84008c0f0009               nop        dword ptr [rax + rax + 0x9000f8c]
00e9c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00ea6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eaa e8317c1318                     call       0x7f6aafd1e560
00eaf f4                             hlt        
00eb0 be45ffffff                     mov        esi, 0xffffff45
00eb5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ebd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ec2 44891c24                       mov        dword ptr [rsp], r11d
00ec6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ecb 4489542404                     mov        dword ptr [rsp + 4], r10d
00ed0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ed5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00eda 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ee2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ee7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00eec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ef1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ef6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00efb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f00 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f05 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f0a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f0f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f14 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f19 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f1e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f23 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f28 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f2d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f32 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f37 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f3c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f41 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f46 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f4b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f50 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f55 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f5a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f5f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f64 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f69 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f71 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f76 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f7e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f83 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00f8b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00f90 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00f98 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00fa0 90                             nop        
00fa1 90                             nop        
00fa2 90                             nop        
00fa3 e83870aeff                     call       0x7f6a976cda60
00fa8 0f1f8400a010000a               nop        dword ptr [rax + rax + 0xa0010a0]
00fb0 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
00fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fbe e81d7b1318                     call       0x7f6aafd1e560
00fc3 f4                             hlt        
00fc4 be45ffffff                     mov        esi, 0xffffff45
00fc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fd1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fd6 44891424                       mov        dword ptr [rsp], r10d
00fda 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fdf 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fe4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fe9 4489542408                     mov        dword ptr [rsp + 8], r10d
00fee 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ff6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ffb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01000 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01005 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0100a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0100f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01014 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01019 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0101e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01023 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01028 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0102d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01032 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01037 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0103c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01041 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01046 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0104b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01050 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01055 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0105a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0105f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01064 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01069 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0106e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01073 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01078 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0107d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01085 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0108a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01092 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01097 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
0109f 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
010a4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
010ac 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
010b3 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
010bb e8206faeff                     call       0x7f6a976cda60
010c0 0f1f8400b811000b               nop        dword ptr [rax + rax + 0xb0011b8]
010c8 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
010d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
010d6 e8057a1318                     call       0x7f6aafd1e560
010db f4                             hlt        
010dc be45ffffff                     mov        esi, 0xffffff45
010e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010e9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
010ee 44890c24                       mov        dword ptr [rsp], r9d
010f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
010fc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01101 44894c2408                     mov        dword ptr [rsp + 8], r9d
01106 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0110b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01110 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01115 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0111a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0111f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01124 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01129 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0112e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01133 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01138 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0113d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01142 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01147 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0114c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01151 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01156 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0115b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01160 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01165 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0116a 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0116f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01174 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01179 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0117e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01183 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01188 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01190 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01195 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0119d 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011a2 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011a7 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011ae 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011b6 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011be 90                             nop        
011bf e81c6eaeff                     call       0x7f6a976cda60
011c4 0f1f8400bc12000c               nop        dword ptr [rax + rax + 0xc0012bc]
011cc 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
011d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
011da e801791318                     call       0x7f6aafd1e560
011df f4                             hlt        
011e0 41bbffffff7f                   mov        r11d, 0x7fffffff
011e6 4d3bcb                         cmp        r9, r11
011e9 bdffffffff                     mov        ebp, 0xffffffff
011ee 7c08                           jl         0x7f6a97be6c78
011f0 400f95c5                       setne      bpl
011f4 400fb6ed                       movzx      ebp, bpl
011f8 be45ffffff                     mov        esi, 0xffffff45
011fd 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01205 4c891c24                       mov        qword ptr [rsp], r11
01209 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0120e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01213 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0121b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01220 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01224 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01228 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0122d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01232 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01236 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0123a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0123f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01244 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01248 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0124c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01251 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01256 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0125a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0125e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01266 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0126b 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0126f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01273 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01278 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0127d 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
01281 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01285 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0128a 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0128f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01297 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0129c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012a4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012a9 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012b1 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
012b8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012c0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012c8 90                             nop        
012c9 90                             nop        
012ca 90                             nop        
012cb e8106daeff                     call       0x7f6a976cda60
012d0 0f1f8400c813000d               nop        dword ptr [rax + rax + 0xd0013c8]
012d8 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
012e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012e6 e8f5771318                     call       0x7f6aafd1e560
012eb f4                             hlt        
012ec be45ffffff                     mov        esi, 0xffffff45
012f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012f9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
012fe 44891c24                       mov        dword ptr [rsp], r11d
01302 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01307 44895c2404                     mov        dword ptr [rsp + 4], r11d
0130c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01311 44895c2408                     mov        dword ptr [rsp + 8], r11d
01316 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0131b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01320 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01325 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0132a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0132f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01334 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01339 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0133e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01343 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01348 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0134d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01352 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01357 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0135c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01361 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01366 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0136b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01370 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01375 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0137a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0137f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01384 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01389 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0138e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01393 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01398 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013a0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013a5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013aa 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013b2 90                             nop        
013b3 e8286caeff                     call       0x7f6a976cda60
013b8 0f1f8400b014000e               nop        dword ptr [rax + rax + 0xe0014b0]
013c0 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
013ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
013ce e80d771318                     call       0x7f6aafd1e560
013d3 f4                             hlt        
013d4 be45ffffff                     mov        esi, 0xffffff45
013d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013e1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013e6 44891c24                       mov        dword ptr [rsp], r11d
013ea 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013ef 44895c2404                     mov        dword ptr [rsp + 4], r11d
013f4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013f9 44895c2408                     mov        dword ptr [rsp + 8], r11d
013fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01403 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01408 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0140d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01412 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01417 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0141c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01421 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01426 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0142b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01430 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01435 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0143a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0143f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01444 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01449 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0144e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01453 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01458 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0145d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01462 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01467 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0146c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01471 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01476 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0147b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01480 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01488 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0148d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01492 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01499 90                             nop        
0149a 90                             nop        
0149b e8406baeff                     call       0x7f6a976cda60
014a0 0f1f84009815000f               nop        dword ptr [rax + rax + 0xf001598]
014a8 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
014b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
014b6 e825761318                     call       0x7f6aafd1e560
014bb f4                             hlt        
014bc be3dffffff                     mov        esi, 0xffffff3d
014c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014ce 44891c24                       mov        dword ptr [rsp], r11d
014d2 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
014d6 894c2404                       mov        dword ptr [rsp + 4], ecx
014da 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014df 44895c2408                     mov        dword ptr [rsp + 8], r11d
014e4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014e9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
014ee 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
014f2 894c240c                       mov        dword ptr [rsp + 0xc], ecx
014f6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014fb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01500 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01504 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01508 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0150d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01512 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01516 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0151a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0151f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01524 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01528 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0152c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01531 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01536 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0153d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01541 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01546 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0154b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0154f 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01553 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01558 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0155d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01562 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01567 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0156f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01574 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0157c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01581 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01586 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0158e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01595 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0159d 90                             nop        
0159e 90                             nop        
0159f e83c6aaeff                     call       0x7f6a976cda60
015a4 0f1f84009c160010               nop        dword ptr [rax + rax + 0x1000169c]
015ac 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
015b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ba e821751318                     call       0x7f6aafd1e560
015bf f4                             hlt        
015c0 be45ffffff                     mov        esi, 0xffffff45
015c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015cd 448b542408                     mov        r10d, dword ptr [rsp + 8]
015d2 44891424                       mov        dword ptr [rsp], r10d
015d6 4489442408                     mov        dword ptr [rsp + 8], r8d
015db e8006aaeff                     call       0x7f6a976cda60
015e0 0f1f8400d8160011               nop        dword ptr [rax + rax + 0x110016d8]
015e8 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
015f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015f6 e8e5741318                     call       0x7f6aafd1e560
015fb f4                             hlt        
015fc be45ffffff                     mov        esi, 0xffffff45
01601 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01609 448b542408                     mov        r10d, dword ptr [rsp + 8]
0160e 44891424                       mov        dword ptr [rsp], r10d
01612 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01617 4489542404                     mov        dword ptr [rsp + 4], r10d
0161c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01621 44895c2408                     mov        dword ptr [rsp + 8], r11d
01626 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0162b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01630 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01635 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0163a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0163f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01644 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01649 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0164e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01653 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01658 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0165d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01662 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01666 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0166b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01670 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01675 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0167a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0167e 90                             nop        
0167f e85c69aeff                     call       0x7f6a976cda60
01684 0f1f84007c170012               nop        dword ptr [rax + rax + 0x1200177c]
0168c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01696 4883e4f0                       and        rsp, 0xfffffffffffffff0
0169a e841741318                     call       0x7f6aafd1e560
0169f f4                             hlt        
016a0 be45ffffff                     mov        esi, 0xffffff45
016a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016ad 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
016b2 44890c24                       mov        dword ptr [rsp], r9d
016b6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
016bb 44894c2404                     mov        dword ptr [rsp + 4], r9d
016c0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016c5 44895c2408                     mov        dword ptr [rsp + 8], r11d
016ca 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016cf 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
016d4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016d9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016de 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016e3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016e8 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
016ed 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
016f2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
016f7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
016fc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01701 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01706 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0170b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01710 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01715 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0171a 90                             nop        
0171b e8c068aeff                     call       0x7f6a976cda60
01720 0f1f840018180013               nop        dword ptr [rax + rax + 0x13001818]
01728 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01732 4883e4f0                       and        rsp, 0xfffffffffffffff0
01736 e8a5731318                     call       0x7f6aafd1e560
0173b f4                             hlt        
0173c be45ffffff                     mov        esi, 0xffffff45
01741 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01749 448b542408                     mov        r10d, dword ptr [rsp + 8]
0174e 44891424                       mov        dword ptr [rsp], r10d
01752 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01757 44895c2404                     mov        dword ptr [rsp + 4], r11d
0175c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01761 4489542408                     mov        dword ptr [rsp + 8], r10d
01766 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0176e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01773 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01778 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0177d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01782 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01787 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0178c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01791 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01796 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0179b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
017a0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017a5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017aa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017af 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017b4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017b9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
017be 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
017c3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017c8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017cd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017d2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
017d7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017dc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
017e1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
017e6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
017eb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017f0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017f5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017fd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01802 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0180a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0180f 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
01817 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0181f e8bc67aeff                     call       0x7f6a976cda60
01824 0f1f84001c190014               nop        dword ptr [rax + rax + 0x1400191c]
0182c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0183a e8a1721318                     call       0x7f6aafd1e560
0183f f4                             hlt        
01840 be45ffffff                     mov        esi, 0xffffff45
01845 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0184d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01852 44891424                       mov        dword ptr [rsp], r10d
01856 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0185b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01860 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01865 4489542408                     mov        dword ptr [rsp + 8], r10d
0186a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0186f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01874 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01879 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0187e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01883 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01888 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0188d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01892 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01897 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0189c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018a1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
018a6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018ab 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
018b0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018b5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
018ba 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018bf 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018c4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
018c9 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
018ce 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018d3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018d8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
018dd 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
018e2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018e7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018ec 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018f4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018f9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01901 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01906 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0190e 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01916 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0191d 90                             nop        
0191e 90                             nop        
0191f e8bc66aeff                     call       0x7f6a976cda60
01924 0f1f84001c1a0015               nop        dword ptr [rax + rax + 0x15001a1c]
0192c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01936 4883e4f0                       and        rsp, 0xfffffffffffffff0
0193a e8a1711318                     call       0x7f6aafd1e560
0193f f4                             hlt        
01940 4585c0                         test       r8d, r8d
01943 7f08                           jg         0x7f6a97be73cd
01945 4533ed                         xor        r13d, r13d
01948 e972e7ffff                     jmp        0x7f6a97be5b3f
0194d 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01951 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01956 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0195a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0195f 89442414                       mov        dword ptr [rsp + 0x14], eax
01963 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01967 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b0424                         mov        eax, dword ptr [rsp]
01974 89442404                       mov        dword ptr [rsp + 4], eax
01978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197d 48894424f8                     mov        qword ptr [rsp - 8], rax
01982 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01989 890424                         mov        dword ptr [rsp], eax
0198c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01991 488bee                         mov        rbp, rsi
01994 8b542408                       mov        edx, dword ptr [rsp + 8]
01998 418bc8                         mov        ecx, r8d
0199b e84088b4ff                     call       0x7f6a9772fc60
019a0 0f1f8400981a0016               nop        dword ptr [rax + rax + 0x16001a98]
019a8 41bb40000000                   mov        r11d, 0x40
019ae 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
019b3 c462a1f7e8                     shlx       r13, rax, r11
019b8 48894424f8                     mov        qword ptr [rsp - 8], rax
019bd 8b442404                       mov        eax, dword ptr [rsp + 4]
019c1 890424                         mov        dword ptr [rsp], eax
019c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c9 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
019ce 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
019d2 8b442414                       mov        eax, dword ptr [rsp + 0x14]
019d6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
019db 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
019df 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
019e4 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019e8 e9d2e6ffff                     jmp        0x7f6a97be5b3f
019ed 4585c0                         test       r8d, r8d
019f0 7f07                           jg         0x7f6a97be7479
019f2 33f6                           xor        esi, esi
019f4 e907e7ffff                     jmp        0x7f6a97be5b80
019f9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019fe 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a03 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a07 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01a0c 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a10 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01a15 89442414                       mov        dword ptr [rsp + 0x14], eax
01a19 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a1d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b0424                         mov        eax, dword ptr [rsp]
01a2a 89442404                       mov        dword ptr [rsp + 4], eax
01a2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a33 48894424f8                     mov        qword ptr [rsp - 8], rax
01a38 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a3f 890424                         mov        dword ptr [rsp], eax
01a42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a47 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a4f 488bf5                         mov        rsi, rbp
01a52 8b542408                       mov        edx, dword ptr [rsp + 8]
01a56 418bc8                         mov        ecx, r8d
01a59 90                             nop        
01a5a 90                             nop        
01a5b e88087b4ff                     call       0x7f6a9772fc60
01a60 0f1f8400581b0017               nop        dword ptr [rax + rax + 0x17001b58]
01a68 41bb80000000                   mov        r11d, 0x80
01a6e 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01a73 c4e2a1f7f0                     shlx       rsi, rax, r11
01a78 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7d 8b442404                       mov        eax, dword ptr [rsp + 4]
01a81 890424                         mov        dword ptr [rsp], eax
01a84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a89 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
01a8d 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01a91 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01a95 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01a9a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a9e 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01aa3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01aa8 e953e6ffff                     jmp        0x7f6a97be5b80
01aad 4533db                         xor        r11d, r11d
01ab0 e931efffff                     jmp        0x7f6a97be6466
01ab5 bee4ffffff                     mov        esi, 0xffffffe4
01aba 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ac2 488f0424                       pop        qword ptr [rsp]
01ac6 90                             nop        
01ac7 e81465aeff                     call       0x7f6a976cda60
01acc 0f1f8400c41b0018               nop        dword ptr [rax + rax + 0x18001bc4]
01ad4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ae2 e8f96f1318                     call       0x7f6aafd1e560
01ae7 f4                             hlt        
01ae8 be5d000000                     mov        esi, 0x5d
01aed 90                             nop        
01aee 90                             nop        
01aef e8ec64aeff                     call       0x7f6a976cda60
01af4 0f1f8400ec1b0019               nop        dword ptr [rax + rax + 0x19001bec]
01afc 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0a e8d16f1318                     call       0x7f6aafd1e560
01b0f f4                             hlt        
01b10 bef6ffffff                     mov        esi, 0xfffffff6
01b15 90                             nop        
01b16 90                             nop        
01b17 e8c464aeff                     call       0x7f6a976cda60
01b1c 0f1f8400141c001a               nop        dword ptr [rax + rax + 0x1a001c14]
01b24 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b32 e8a96f1318                     call       0x7f6aafd1e560
01b37 f4                             hlt        
01b38 bef6ffffff                     mov        esi, 0xfffffff6
01b3d 90                             nop        
01b3e 90                             nop        
01b3f e89c64aeff                     call       0x7f6a976cda60
01b44 0f1f84003c1c001b               nop        dword ptr [rax + rax + 0x1b001c3c]
01b4c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5a e8816f1318                     call       0x7f6aafd1e560
01b5f f4                             hlt        
01b60 be6effffff                     mov        esi, 0xffffff6e
01b65 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b6d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b72 44891c24                       mov        dword ptr [rsp], r11d
01b76 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b7b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b80 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b85 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b8a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b8f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b94 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b99 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b9e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ba3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ba8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01bad 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01bb2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bb7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bbc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bc1 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bc6 90                             nop        
01bc7 e81464aeff                     call       0x7f6a976cda60
01bcc 0f1f8400c41c001c               nop        dword ptr [rax + rax + 0x1c001cc4]
01bd4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01bde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be2 e8f96e1318                     call       0x7f6aafd1e560
01be7 f4                             hlt        
01be8 bee4ffffff                     mov        esi, 0xffffffe4
01bed 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bf5 488f0424                       pop        qword ptr [rsp]
01bf9 89442418                       mov        dword ptr [rsp + 0x18], eax
01bfd 48894424f8                     mov        qword ptr [rsp - 8], rax
01c02 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c09 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c12 897c2428                       mov        dword ptr [rsp + 0x28], edi
01c16 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01c1a 90                             nop        
01c1b e8c063aeff                     call       0x7f6a976cda60
01c20 0f1f8400181d001d               nop        dword ptr [rax + rax + 0x1d001d18]
01c28 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c36 e8a56e1318                     call       0x7f6aafd1e560
01c3b f4                             hlt        
01c3c bee4ffffff                     mov        esi, 0xffffffe4
01c41 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c49 488f0424                       pop        qword ptr [rsp]
01c4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c52 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c59 89442418                       mov        dword ptr [rsp + 0x18], eax
01c5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c62 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01c66 89542428                       mov        dword ptr [rsp + 0x28], edx
01c6a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01c6f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c74 90                             nop        
01c75 90                             nop        
01c76 90                             nop        
01c77 e86463aeff                     call       0x7f6a976cda60
01c7c 0f1f8400741d001e               nop        dword ptr [rax + rax + 0x1e001d74]
01c84 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01c8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c92 e8496e1318                     call       0x7f6aafd1e560
01c97 f4                             hlt        
01c98 bebeffffff                     mov        esi, 0xffffffbe
01c9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ca5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01caa 44891c24                       mov        dword ptr [rsp], r11d
01cae 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cb3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cb8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cbd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cc2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cc7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ccc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cd1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cd6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01cdb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ce0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ce5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01cea 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cef 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cf4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cf9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cfe 90                             nop        
01cff e8dc62aeff                     call       0x7f6a976cda60
01d04 0f1f8400fc1d001f               nop        dword ptr [rax + rax + 0x1f001dfc]
01d0c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d1a e8c16d1318                     call       0x7f6aafd1e560
01d1f f4                             hlt        
01d20 beccffffff                     mov        esi, 0xffffffcc
01d25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d2d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d32 44891424                       mov        dword ptr [rsp], r10d
01d36 89442410                       mov        dword ptr [rsp + 0x10], eax
01d3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d46 89442414                       mov        dword ptr [rsp + 0x14], eax
01d4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4f 897c2418                       mov        dword ptr [rsp + 0x18], edi
01d53 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01d57 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01d5b e88062aeff                     call       0x7f6a976cda60
01d60 0f1f8400581e0020               nop        dword ptr [rax + rax + 0x20001e58]
01d68 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d76 e8656d1318                     call       0x7f6aafd1e560
01d7b f4                             hlt        
01d7c beccffffff                     mov        esi, 0xffffffcc
01d81 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d89 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d8e 44890424                       mov        dword ptr [rsp], r8d
01d92 48894424f8                     mov        qword ptr [rsp - 8], rax
01d97 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d9e 89442410                       mov        dword ptr [rsp + 0x10], eax
01da2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da7 897c2414                       mov        dword ptr [rsp + 0x14], edi
01dab 89542418                       mov        dword ptr [rsp + 0x18], edx
01daf 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01db4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01db9 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01dbd 90                             nop        
01dbe 90                             nop        
01dbf e81c62aeff                     call       0x7f6a976cda60
01dc4 0f1f8400bc1e0021               nop        dword ptr [rax + rax + 0x21001ebc]
01dcc 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e8016d1318                     call       0x7f6aafd1e560
01ddf f4                             hlt        
01de0 be45ffffff                     mov        esi, 0xffffff45
01de5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ded 448b542408                     mov        r10d, dword ptr [rsp + 8]
01df2 44891424                       mov        dword ptr [rsp], r10d
01df6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dfb 4489542408                     mov        dword ptr [rsp + 8], r10d
01e00 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e05 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e0a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e0f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e14 90                             nop        
01e15 90                             nop        
01e16 90                             nop        
01e17 e8c461aeff                     call       0x7f6a976cda60
01e1c 0f1f8400141f0022               nop        dword ptr [rax + rax + 0x22001f14]
01e24 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01e2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e32 e8a96c1318                     call       0x7f6aafd1e560
01e37 f4                             hlt        
01e38 be45ffffff                     mov        esi, 0xffffff45
01e3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e45 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e4a 44891c24                       mov        dword ptr [rsp], r11d
01e4e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e53 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e58 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e5d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e62 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e67 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e6c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01e71 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01e76 90                             nop        
01e77 e86461aeff                     call       0x7f6a976cda60
01e7c 0f1f8400741f0023               nop        dword ptr [rax + rax + 0x23001f74]
01e84 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e92 e8496c1318                     call       0x7f6aafd1e560
01e97 f4                             hlt        
01e98 bef6ffffff                     mov        esi, 0xfffffff6
01e9d 90                             nop        
01e9e 90                             nop        
01e9f e83c61aeff                     call       0x7f6a976cda60
01ea4 0f1f84009c1f0024               nop        dword ptr [rax + rax + 0x24001f9c]
01eac 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eba e8216c1318                     call       0x7f6aafd1e560
01ebf f4                             hlt        
01ec0 be5d000000                     mov        esi, 0x5d
01ec5 90                             nop        
01ec6 90                             nop        
01ec7 e81461aeff                     call       0x7f6a976cda60
01ecc 0f1f8400c41f0025               nop        dword ptr [rax + rax + 0x25001fc4]
01ed4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee2 e8f96b1318                     call       0x7f6aafd1e560
01ee7 f4                             hlt        
01ee8 be45ffffff                     mov        esi, 0xffffff45
01eed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ef5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01efa 44891424                       mov        dword ptr [rsp], r10d
01efe 90                             nop        
01eff e8dc60aeff                     call       0x7f6a976cda60
01f04 0f1f8400fc1f0026               nop        dword ptr [rax + rax + 0x26001ffc]
01f0c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01f16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f1a e8c16b1318                     call       0x7f6aafd1e560
01f1f f4                             hlt        
01f20 bef6ffffff                     mov        esi, 0xfffffff6
01f25 418be8                         mov        ebp, r8d
01f28 90                             nop        
01f29 90                             nop        
01f2a 90                             nop        
01f2b e8b060aeff                     call       0x7f6a976cda60
01f30 0f1f840028200027               nop        dword ptr [rax + rax + 0x27002028]
01f38 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01f42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f46 e8956b1318                     call       0x7f6aafd1e560
01f4b f4                             hlt        
01f4c bef6ffffff                     mov        esi, 0xfffffff6
01f51 8be9                           mov        ebp, ecx
01f53 e88860aeff                     call       0x7f6a976cda60
01f58 0f1f840050200028               nop        dword ptr [rax + rax + 0x28002050]
01f60 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01f6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6e e86d6b1318                     call       0x7f6aafd1e560
01f73 f4                             hlt        
01f74 bef6ffffff                     mov        esi, 0xfffffff6
01f79 418be8                         mov        ebp, r8d
01f7c 90                             nop        
01f7d 90                             nop        
01f7e 90                             nop        
01f7f e85c60aeff                     call       0x7f6a976cda60
01f84 0f1f84007c200029               nop        dword ptr [rax + rax + 0x2900207c]
01f8c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9a e8416b1318                     call       0x7f6aafd1e560
01f9f f4                             hlt        
01fa0 bef6ffffff                     mov        esi, 0xfffffff6
01fa5 90                             nop        
01fa6 90                             nop        
01fa7 e83460aeff                     call       0x7f6a976cda60
01fac 0f1f8400a420002a               nop        dword ptr [rax + rax + 0x2a0020a4]
01fb4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01fbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc2 e8196b1318                     call       0x7f6aafd1e560
01fc7 f4                             hlt        
01fc8 bef6ffffff                     mov        esi, 0xfffffff6
01fcd 90                             nop        
01fce 90                             nop        
01fcf e80c60aeff                     call       0x7f6a976cda60
01fd4 0f1f8400cc20002b               nop        dword ptr [rax + rax + 0x2b0020cc]
01fdc 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
01fe6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fea e8f16a1318                     call       0x7f6aafd1e560
01fef f4                             hlt        
01ff0 bef6ffffff                     mov        esi, 0xfffffff6
01ff5 90                             nop        
01ff6 90                             nop        
01ff7 e8e45faeff                     call       0x7f6a976cda60
01ffc 0f1f8400f420002c               nop        dword ptr [rax + rax + 0x2c0020f4]
02004 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
0200e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02012 e8c96a1318                     call       0x7f6aafd1e560
02017 f4                             hlt        
02018 bef6ffffff                     mov        esi, 0xfffffff6
0201d 90                             nop        
0201e 90                             nop        
0201f e8bc5faeff                     call       0x7f6a976cda60
02024 0f1f84001c21002d               nop        dword ptr [rax + rax + 0x2d00211c]
0202c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
02036 4883e4f0                       and        rsp, 0xfffffffffffffff0
0203a e8a16a1318                     call       0x7f6aafd1e560
0203f f4                             hlt        
02040 bef6ffffff                     mov        esi, 0xfffffff6
02045 90                             nop        
02046 90                             nop        
02047 e8945faeff                     call       0x7f6a976cda60
0204c 0f1f84004421002e               nop        dword ptr [rax + rax + 0x2e002144]
02054 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
0205e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02062 e8796a1318                     call       0x7f6aafd1e560
02067 f4                             hlt        
02068 bef6ffffff                     mov        esi, 0xfffffff6
0206d 90                             nop        
0206e 90                             nop        
0206f e86c5faeff                     call       0x7f6a976cda60
02074 0f1f84006c21002f               nop        dword ptr [rax + rax + 0x2f00216c]
0207c 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
02086 4883e4f0                       and        rsp, 0xfffffffffffffff0
0208a e8516a1318                     call       0x7f6aafd1e560
0208f f4                             hlt        
02090 bef6ffffff                     mov        esi, 0xfffffff6
02095 90                             nop        
02096 90                             nop        
02097 e8445faeff                     call       0x7f6a976cda60
0209c 0f1f840094210030               nop        dword ptr [rax + rax + 0x30002194]
020a4 48bfe09b03706a7f0000           movabs     rdi, 0x7f6a70039be0
020ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
020b2 e8296a1318                     call       0x7f6aafd1e560
020b7 f4                             hlt        
020b8 eb08                           jmp        0x7f6a97be7b42
020ba eb06                           jmp        0x7f6a97be7b42
020bc eb04                           jmp        0x7f6a97be7b42
020be eb02                           jmp        0x7f6a97be7b42
020c0 eb00                           jmp        0x7f6a97be7b42
020c2 488bf0                         mov        rsi, rax
020c5 e982e9ffff                     jmp        0x7f6a97be64cc
020ca 49ba9c64be976a7f0000           movabs     r10, 0x7f6a97be649c
020d4 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020db e900a8b4ff                     jmp        0x7f6a97732360
020e0 e87b76b3ff                     call       0x7f6a9771f1e0
020e5 e934dfffff                     jmp        0x7f6a97be5a9e
020ea f4                             hlt        
020eb f4                             hlt        
020ec f4                             hlt        
020ed f4                             hlt        
020ee f4                             hlt        
020ef f4                             hlt        
