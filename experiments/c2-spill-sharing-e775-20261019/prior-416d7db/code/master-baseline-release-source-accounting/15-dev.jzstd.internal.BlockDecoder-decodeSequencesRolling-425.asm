00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85661d0000                   jne        0x7ffaebe71204
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
00050 0f83f7180000                   jae        0x7ffaebe70dcd
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f8409190000                   je         0x7ffaebe70dec
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
0009b 0f8c37170000                   jl         0x7ffaebe70c58
000a1 85db                           test       ebx, ebx
000a3 0f8c6f1a0000                   jl         0x7ffaebe70f98
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f8365190000                   jae        0x7ffaebe70e9c
000b7 448bd0                         mov        r10d, eax
000ba 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bf 4183c0f8                       add        r8d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183f808                       cmp        r8d, 8
000d3 0f8cac170000                   jl         0x7ffaebe70d05
000d9 85db                           test       ebx, ebx
000db 0f8c7f1a0000                   jl         0x7ffaebe70fe0
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f836c190000                   jae        0x7ffaebe70edc
000f0 458bc2                         mov        r8d, r10d
000f3 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000fb 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f846e180000                   je         0x7ffaebe70e00
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f846d180000                   je         0x7ffaebe70e14
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
00190 0f84f0080000                   je         0x7ffaebe6ff06
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f1e020000                   jg         0x7ffaebe6f843
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8dae1a0000                   jge        0x7ffaebe710e8
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
001e5 7c34                           jl         0x7ffaebe6f69b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c2c8                       add        r10d, -0x38
001f0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 6690                           nop        
00207 e8d4c1a8ff                     call       0x7ffaeb8fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7ffaebe6f6cc
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
0025e 0f8d4c190000                   jge        0x7ffaebe71030
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
002a5 0f8d49190000                   jge        0x7ffaebe71074
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
002ec 0f8e53160000                   jle        0x7ffaebe70dc5
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
00375 0f862d160000                   jbe        0x7ffaebe70e28
0037b 4d63d3                         movsxd     r10, r11d
0037e 4c63d9                         movsxd     r11, ecx
00381 49ffcb                         dec        r11
00384 4d3bda                         cmp        r11, r10
00387 0f831b160000                   jae        0x7ffaebe70e28
0038d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00392 4585db                         test       r11d, r11d
00395 0f8c09170000                   jl         0x7ffaebe70f24
0039b 8b2c24                         mov        ebp, dword ptr [rsp]
0039e 83c5f9                         add        ebp, -7
003a1 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a8 4533db                         xor        r11d, r11d
003ab 4533d2                         xor        r10d, r10d
003ae 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b6 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003be e985020000                     jmp        0x7ffaebe6fac8
003c3 8be9                           mov        ebp, ecx
003c5 2bee                           sub        ebp, esi
003c7 e814c0a8ff                     call       0x7ffaeb8fb860
003cc 0f1f8400c4040001               nop        dword ptr [rax + rax + 0x10004c4]
003d4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d9 41bb40000000                   mov        r11d, 0x40
003df 442bdd                         sub        r11d, ebp
003e2 c462d1f7c0                     shlx       r8, rax, rbp
003e7 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f1 4d0bc2                         or         r8, r10
003f4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003f9 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fe e9d2fdffff                     jmp        0x7ffaebe6f655
00403 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0040b 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00410 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00415 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0041d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00422 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00426 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042a 660f1f440000                   nop        word ptr [rax + rax]
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8d18090000                   jge        0x7ffaebe701d8
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8dc5090000                   jge        0x7ffaebe702b8
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d9c0a0000                   jge        0x7ffaebe703b8
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d770b0000                   jge        0x7ffaebe704bc
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
00515 0f8e49070000                   jle        0x7ffaebe700e4
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8f040c0000                   jg         0x7ffaebe705ac
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fef0c0000                   jg         0x7ffaebe706a4
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8fb70d0000                   jg         0x7ffaebe70778
00541 458bc9                         mov        r9d, r9d
00544 4181f900000010                 cmp        r9d, 0x10000000
0054b 0f837b0e0000                   jae        0x7ffaebe7084c
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
00581 0f8db0000000                   jge        0x7ffaebe6fab7
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
005cf 0f8d0f0f0000                   jge        0x7ffaebe70964
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
00610 0f8d5e0f0000                   jge        0x7ffaebe709f4
00616 41b901000000                   mov        r9d, 1
0061c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00624 c44221f7d9                     shlx       r11d, r9d, r11d
00629 41ffcb                         dec        r11d
0062c 4523d8                         and        r11d, r8d
0062f 4503da                         add        r11d, r10d
00632 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00637 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063b 0f8d89030000                   jge        0x7ffaebe6fe4a
00641 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442460                     and        r8d, dword ptr [rsp + 0x60]
00652 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00657 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
0065b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0065f 453bc2                         cmp        r8d, r10d
00662 0f832e040000                   jae        0x7ffaebe6ff16
00668 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0066c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00670 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00675 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00679 458b5104                       mov        r10d, dword ptr [r9 + 4]
0067d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00682 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00687 413bca                         cmp        ecx, r10d
0068a 0f8390040000                   jae        0x7ffaebe6ffa0
00690 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00695 4423442448                     and        r8d, dword ptr [rsp + 0x48]
0069a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
006a3 418b5a04                       mov        ebx, dword ptr [r10 + 4]
006a7 4d8b5cc908                     mov        r11, qword ptr [r9 + rcx*8 + 8]
006ac 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
006b4 443bc3                         cmp        r8d, ebx
006b7 0f83ff040000                   jae        0x7ffaebe7003c
006bd 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006c2 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ca 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d1 ffc5                           inc        ebp
006d3 892c24                         mov        dword ptr [rsp], ebp
006d6 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006da 0f8d65030000                   jge        0x7ffaebe6fec5
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
007a6 0f84ca020000                   je         0x7ffaebe6fef6
007ac 4183f83f                       cmp        r8d, 0x3f
007b0 0f8f060d0000                   jg         0x7ffaebe7093c
007b6 b940000000                     mov        ecx, 0x40
007bb 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007bf 443bc1                         cmp        r8d, ecx
007c2 7e47                           jle        0x7ffaebe6fc8b
007c4 458bc8                         mov        r9d, r8d
007c7 442bc9                         sub        r9d, ecx
007ca 83f940                         cmp        ecx, 0x40
007cd 0f8d190f0000                   jge        0x7ffaebe70b6c
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
00809 eb30                           jmp        0x7ffaebe6fcbb
0080b 412bc8                         sub        ecx, r8d
0080e c462f3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rcx
00818 4183f840                       cmp        r8d, 0x40
0081c 0f8dda0d0000                   jge        0x7ffaebe70a7c
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
00859 0f8cd1fbffff                   jl         0x7ffaebe6f8b0
0085f 458d53c0                       lea        r10d, [r11 - 0x40]
00863 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00868 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0086c 83c5f8                         add        ebp, -8
0086f 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00873 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00877 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0087b 83c1f0                         add        ecx, -0x10
0087e 83f908                         cmp        ecx, 8
00881 0f8cf5000000                   jl         0x7ffaebe6fdfc
00887 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0088c 4183c0e8                       add        r8d, -0x18
00890 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00898 0f8265fbffff                   jb         0x7ffaebe6f883
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
0096c 666690                         nop        
0096f e86c38b5ff                     call       0x7ffaeb9c3660
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 85c9                           test       ecx, ecx
0097e 7f08                           jg         0x7ffaebe6fe08
00980 4533d2                         xor        r10d, r10d
00983 e988faffff                     jmp        0x7ffaebe6f890
00988 8be9                           mov        ebp, ecx
0098a 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00992 8b542408                       mov        edx, dword ptr [rsp + 8]
00996 90                             nop        
00997 e844baa8ff                     call       0x7ffaeb8fb860
0099c 0f1f8400940a0003               nop        dword ptr [rax + rax + 0x3000a94]
009a4 448b542408                     mov        r10d, dword ptr [rsp + 8]
009a9 41c1e203                       shl        r10d, 3
009ad 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009b2 41c1e003                       shl        r8d, 3
009b6 452bd0                         sub        r10d, r8d
009b9 4181c2c0000000                 add        r10d, 0xc0
009c0 c462a9f7d0                     shlx       r10, rax, r10
009c5 e946faffff                     jmp        0x7ffaebe6f890
009ca 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
009d2 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009da 4d03da                         add        r11, r10
009dd 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009e5 4d3bda                         cmp        r11, r10
009e8 7f29                           jg         0x7ffaebe6fe93
009ea 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009ef 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
009f7 0f8557120000                   jne        0x7ffaebe710d4
009fd 418bc3                         mov        eax, r11d
00a00 4881c410010000                 add        rsp, 0x110
00a07 5d                             pop        rbp
00a08 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a0c 0f875c130000                   ja         0x7ffaebe711ee
00a12 c3                             ret        
00a13 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a1d 6690                           nop        
00a1f e8bcb9a8ff                     call       0x7ffaeb8fb860
00a24 0f1f84001c0b0004               nop        dword ptr [rax + rax + 0x4000b1c]
00a2c 4885c0                         test       rax, rax
00a2f 0f840b120000                   je         0x7ffaebe710c0
00a35 488bf0                         mov        rsi, rax
00a38 4881c410010000                 add        rsp, 0x110
00a3f 5d                             pop        rbp
00a40 e91b99b5ff                     jmp        0x7ffaeb9c97e0
00a45 4533db                         xor        r11d, r11d
00a48 4533d2                         xor        r10d, r10d
00a4b 4533c9                         xor        r9d, r9d
00a4e 4533c0                         xor        r8d, r8d
00a51 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a59 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00a61 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a69 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00a71 e9c7fcffff                     jmp        0x7ffaebe6fbbd
00a76 4533d2                         xor        r10d, r10d
00a79 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a81 e9aaf9ffff                     jmp        0x7ffaebe6f8b0
00a86 4533db                         xor        r11d, r11d
00a89 4533d2                         xor        r10d, r10d
00a8c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a91 e93ff7ffff                     jmp        0x7ffaebe6f655
00a96 bee4ffffff                     mov        esi, 0xffffffe4
00a9b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aa3 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00aa8 44890c24                       mov        dword ptr [rsp], r9d
00aac 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ab1 4489542404                     mov        dword ptr [rsp + 4], r10d
00ab6 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00abb 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ac0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ac5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aca 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00acf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ad4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ad9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ade 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ae3 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00ae8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00aed 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00af2 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00af7 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00afc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b01 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b06 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b0b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b10 666690                         nop        
00b13 e8c836b5ff                     call       0x7ffaeb9c3660
00b18 0f1f8400100c0005               nop        dword ptr [rax + rax + 0x5000c10]
00b20 bee4ffffff                     mov        esi, 0xffffffe4
00b25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b2d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b32 44891c24                       mov        dword ptr [rsp], r11d
00b36 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b3b 4489542404                     mov        dword ptr [rsp + 4], r10d
00b40 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b45 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b4a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b4f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b54 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b59 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b5e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b63 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b68 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b6d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b72 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b77 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b7c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b81 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b86 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b8b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b90 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b95 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b9a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b9f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ba4 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00ba9 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00bad 6690                           nop        
00baf e82c36b5ff                     call       0x7ffaeb9c3660
00bb4 0f1f8400ac0c0006               nop        dword ptr [rax + rax + 0x6000cac]
00bbc bee4ffffff                     mov        esi, 0xffffffe4
00bc1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bc9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bce 44890c24                       mov        dword ptr [rsp], r9d
00bd2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bd7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00bdc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00be1 44894c2408                     mov        dword ptr [rsp + 8], r9d
00be6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00beb 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bf0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bf5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bfa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bff 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c04 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c09 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00c0e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c13 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c18 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c1d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c22 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c27 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c2c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c31 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c36 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c3b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c40 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c45 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c4a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c4f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c54 666690                         nop        
00c57 e88435b5ff                     call       0x7ffaeb9c3660
00c5c 0f1f8400540d0007               nop        dword ptr [rax + rax + 0x7000d54]
00c64 4533db                         xor        r11d, r11d
00c67 4d3bcb                         cmp        r9, r11
00c6a bdffffffff                     mov        ebp, 0xffffffff
00c6f 7c08                           jl         0x7ffaebe700f9
00c71 400f95c5                       setne      bpl
00c75 400fb6ed                       movzx      ebp, bpl
00c79 be45ffffff                     mov        esi, 0xffffff45
00c7e 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c86 4c891c24                       mov        qword ptr [rsp], r11
00c8a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c8f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c94 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c9c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00ca1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ca6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cab 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00caf 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00cb3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cb8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cbd 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00cc1 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00cc5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00cca 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ccf 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00cd3 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00cd7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cdc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ce1 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00ce8 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00cec 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00cf1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cf6 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00cfa 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00cfe 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00d03 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d08 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d0d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d12 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d1a 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d1f 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d27 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d2c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d34 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d3b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d43 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d4b e89034b5ff                     call       0x7ffaeb9c3660
00d50 0f1f8400480e0008               nop        dword ptr [rax + rax + 0x8000e48]
00d58 be45ffffff                     mov        esi, 0xffffff45
00d5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d65 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d6a 44891424                       mov        dword ptr [rsp], r10d
00d6e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d73 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d78 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d7d 4489542408                     mov        dword ptr [rsp + 8], r10d
00d82 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d8a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d99 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d9e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00da3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00da8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00dad 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00db2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00db7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00dbc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00dc1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00dc6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00dcb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00dd0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00dd5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00dda 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ddf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00de4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00de9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00dee 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00df3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00df8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00dfd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e02 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e07 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e0c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e11 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e19 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e1e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e26 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e2b e8b033b5ff                     call       0x7ffaeb9c3660
00e30 0f1f8400280f0009               nop        dword ptr [rax + rax + 0x9000f28]
00e38 be45ffffff                     mov        esi, 0xffffff45
00e3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e45 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e4a 44891c24                       mov        dword ptr [rsp], r11d
00e4e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e53 4489542404                     mov        dword ptr [rsp + 4], r10d
00e58 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e5d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e62 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e6f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e74 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e79 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e7e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e83 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e88 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e8d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e92 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e97 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e9c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ea1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ea6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00eab 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00eb0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00eb5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00eba 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ebf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ec4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ec9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ece 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ed3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ed8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00edd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00ee2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ee7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00eec 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ef1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ef9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00efe 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f06 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f0b 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00f13 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00f18 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00f20 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f28 666690                         nop        
00f2b e8b032b5ff                     call       0x7ffaeb9c3660
00f30 0f1f84002810000a               nop        dword ptr [rax + rax + 0xa001028]
00f38 be45ffffff                     mov        esi, 0xffffff45
00f3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f45 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f4a 44891424                       mov        dword ptr [rsp], r10d
00f4e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f53 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f58 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f5d 4489542408                     mov        dword ptr [rsp + 8], r10d
00f62 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f6f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f74 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f79 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f7e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f83 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f88 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f8d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f92 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f97 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f9c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00fa1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00fa6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00fab 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00fb0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00fb5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fba 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00fbf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00fc4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fc9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fce 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00fd3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00fd8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00fdd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00fe2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fe7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fec 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ff1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ff9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ffe 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01006 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0100b 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
01013 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01018 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01020 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01027 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
0102f e8ac31b5ff                     call       0x7ffaeb9c3660
01034 0f1f84002c11000b               nop        dword ptr [rax + rax + 0xb00112c]
0103c be45ffffff                     mov        esi, 0xffffff45
01041 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01049 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0104e 44890c24                       mov        dword ptr [rsp], r9d
01052 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01057 44895c2404                     mov        dword ptr [rsp + 4], r11d
0105c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01061 44894c2408                     mov        dword ptr [rsp + 8], r9d
01066 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0106b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01070 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01075 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0107a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0107f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01084 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01089 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0108e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01093 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01098 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0109d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
010a2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
010a7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
010ac 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
010b1 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
010b6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
010bb 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
010c0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
010c5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
010ca 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
010cf 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
010d4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
010d9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
010de 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
010e3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
010e8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
010f0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
010f5 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
010fd 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01102 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01107 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
0110e 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01116 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
0111e 90                             nop        
0111f e8bc30b5ff                     call       0x7ffaeb9c3660
01124 0f1f84001c12000c               nop        dword ptr [rax + rax + 0xc00121c]
0112c 41bbffffff7f                   mov        r11d, 0x7fffffff
01132 4d3bcb                         cmp        r9, r11
01135 bdffffffff                     mov        ebp, 0xffffffff
0113a 7c08                           jl         0x7ffaebe705c4
0113c 400f95c5                       setne      bpl
01140 400fb6ed                       movzx      ebp, bpl
01144 be45ffffff                     mov        esi, 0xffffff45
01149 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01151 4c891c24                       mov        qword ptr [rsp], r11
01155 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0115a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0115f 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01167 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0116c 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01170 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01174 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01179 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0117e 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01182 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01186 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0118b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01190 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01194 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01198 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0119d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
011a2 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
011a6 894c2440                       mov        dword ptr [rsp + 0x40], ecx
011aa 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
011b2 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
011b7 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
011bb 894c2450                       mov        dword ptr [rsp + 0x50], ecx
011bf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011c4 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
011c9 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
011cd 894c2458                       mov        dword ptr [rsp + 0x58], ecx
011d1 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
011d6 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011db 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011e3 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011e8 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011f0 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
011f5 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011fd 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
01204 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0120c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01214 666690                         nop        
01217 e8c42fb5ff                     call       0x7ffaeb9c3660
0121c 0f1f84001413000d               nop        dword ptr [rax + rax + 0xd001314]
01224 be45ffffff                     mov        esi, 0xffffff45
01229 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01231 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01236 44891c24                       mov        dword ptr [rsp], r11d
0123a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0123f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01244 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01249 44895c2408                     mov        dword ptr [rsp + 8], r11d
0124e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01253 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01258 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0125d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01262 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01267 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0126c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01271 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01276 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0127b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01280 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01285 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0128a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0128f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01294 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01299 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0129e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
012a3 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
012a8 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
012ad 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
012b2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
012b7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
012bc 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
012c1 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
012c6 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
012cb 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
012d0 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012dd 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012e2 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
012ea 90                             nop        
012eb e8f02eb5ff                     call       0x7ffaeb9c3660
012f0 0f1f8400e813000e               nop        dword ptr [rax + rax + 0xe0013e8]
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01305 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0130a 44891c24                       mov        dword ptr [rsp], r11d
0130e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01313 44895c2404                     mov        dword ptr [rsp + 4], r11d
01318 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0131d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01322 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01327 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0132c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01331 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01336 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0133b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01340 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01345 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0134a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0134f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01354 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01359 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0135e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01363 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01368 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0136d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01372 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01377 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0137c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01381 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01386 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0138b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01390 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01395 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0139a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0139f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
013a4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
013ac 4c89542460                     mov        qword ptr [rsp + 0x60], r10
013b1 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013b6 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
013bd 6690                           nop        
013bf e81c2eb5ff                     call       0x7ffaeb9c3660
013c4 0f1f8400bc14000f               nop        dword ptr [rax + rax + 0xf0014bc]
013cc be3dffffff                     mov        esi, 0xffffff3d
013d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013de 44891c24                       mov        dword ptr [rsp], r11d
013e2 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
013e6 894c2404                       mov        dword ptr [rsp + 4], ecx
013ea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013ef 44895c2408                     mov        dword ptr [rsp + 8], r11d
013f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013f9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
013fe 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01402 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01406 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0140b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01410 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01414 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01418 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0141d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01422 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01426 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0142a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0142f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01434 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01438 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0143c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01441 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01446 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0144d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01451 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01456 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0145b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0145f 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01463 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01468 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0146d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01472 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01477 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0147f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01484 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0148c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01491 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01496 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0149e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
014a5 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
014ad 6690                           nop        
014af e82c2db5ff                     call       0x7ffaeb9c3660
014b4 0f1f8400ac150010               nop        dword ptr [rax + rax + 0x100015ac]
014bc be45ffffff                     mov        esi, 0xffffff45
014c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c9 448b542408                     mov        r10d, dword ptr [rsp + 8]
014ce 44891424                       mov        dword ptr [rsp], r10d
014d2 4489442408                     mov        dword ptr [rsp + 8], r8d
014d7 e8042db5ff                     call       0x7ffaeb9c3660
014dc 0f1f8400d4150011               nop        dword ptr [rax + rax + 0x110015d4]
014e4 be45ffffff                     mov        esi, 0xffffff45
014e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014f1 448b542408                     mov        r10d, dword ptr [rsp + 8]
014f6 44891424                       mov        dword ptr [rsp], r10d
014fa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014ff 4489542404                     mov        dword ptr [rsp + 4], r10d
01504 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01509 44895c2408                     mov        dword ptr [rsp + 8], r11d
0150e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01513 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01518 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0151d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01522 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01527 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0152c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01531 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01536 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0153b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01540 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01545 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0154a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0154e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01553 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01558 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0155d 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01562 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01566 90                             nop        
01567 e8742cb5ff                     call       0x7ffaeb9c3660
0156c 0f1f840064160012               nop        dword ptr [rax + rax + 0x12001664]
01574 be45ffffff                     mov        esi, 0xffffff45
01579 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01581 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01586 44890c24                       mov        dword ptr [rsp], r9d
0158a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0158f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01594 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01599 44895c2408                     mov        dword ptr [rsp + 8], r11d
0159e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015a3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015a8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015ad 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015b2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015b7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015bc 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
015c1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015c6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015cb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015d0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
015d5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
015da 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
015df 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
015e4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
015e9 4489442458                     mov        dword ptr [rsp + 0x58], r8d
015ee 90                             nop        
015ef e8ec2bb5ff                     call       0x7ffaeb9c3660
015f4 0f1f8400ec160013               nop        dword ptr [rax + rax + 0x130016ec]
015fc be45ffffff                     mov        esi, 0xffffff45
01601 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01609 448b542408                     mov        r10d, dword ptr [rsp + 8]
0160e 44891424                       mov        dword ptr [rsp], r10d
01612 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01617 44895c2404                     mov        dword ptr [rsp + 4], r11d
0161c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01621 4489542408                     mov        dword ptr [rsp + 8], r10d
01626 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0162e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01633 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01638 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0163d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01642 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01647 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0164c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01651 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01656 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0165b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01660 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01665 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0166a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0166f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01674 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01679 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0167e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01683 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01688 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0168d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01692 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01697 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0169c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
016a1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
016a6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016ab 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
016b0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
016b5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016bd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016c2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
016ca 4c89542468                     mov        qword ptr [rsp + 0x68], r10
016cf 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
016d7 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
016df e8fc2ab5ff                     call       0x7ffaeb9c3660
016e4 0f1f8400dc170014               nop        dword ptr [rax + rax + 0x140017dc]
016ec be45ffffff                     mov        esi, 0xffffff45
016f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016f9 448b542408                     mov        r10d, dword ptr [rsp + 8]
016fe 44891424                       mov        dword ptr [rsp], r10d
01702 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01707 44895c2404                     mov        dword ptr [rsp + 4], r11d
0170c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01711 4489542408                     mov        dword ptr [rsp + 8], r10d
01716 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0171b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01720 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01725 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0172a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0172f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01734 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01739 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0173e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01743 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01748 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0174d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01752 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01757 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0175c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01761 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01766 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0176b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01770 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01775 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0177a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0177f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01784 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01789 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0178e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01793 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01798 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017a0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
017a5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017ad 4c89542468                     mov        qword ptr [rsp + 0x68], r10
017b2 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
017ba 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
017c2 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
017c9 6690                           nop        
017cb e8102ab5ff                     call       0x7ffaeb9c3660
017d0 0f1f8400c8180015               nop        dword ptr [rax + rax + 0x150018c8]
017d8 4585c0                         test       r8d, r8d
017db 7f08                           jg         0x7ffaebe70c65
017dd 4533ed                         xor        r13d, r13d
017e0 e9dae8ffff                     jmp        0x7ffaebe6f53f
017e5 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017e9 4489742428                     mov        dword ptr [rsp + 0x28], r14d
017ee 897c241c                       mov        dword ptr [rsp + 0x1c], edi
017f2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017f7 89442414                       mov        dword ptr [rsp + 0x14], eax
017fb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
017ff 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01804 48894424f8                     mov        qword ptr [rsp - 8], rax
01809 8b0424                         mov        eax, dword ptr [rsp]
0180c 89442404                       mov        dword ptr [rsp + 4], eax
01810 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01815 48894424f8                     mov        qword ptr [rsp - 8], rax
0181a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01821 890424                         mov        dword ptr [rsp], eax
01824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01829 488bee                         mov        rbp, rsi
0182c 8b542408                       mov        edx, dword ptr [rsp + 8]
01830 418bc8                         mov        ecx, r8d
01833 e8a8aba8ff                     call       0x7ffaeb8fb860
01838 0f1f840030190016               nop        dword ptr [rax + rax + 0x16001930]
01840 41bb40000000                   mov        r11d, 0x40
01846 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0184b c462a1f7e8                     shlx       r13, rax, r11
01850 48894424f8                     mov        qword ptr [rsp - 8], rax
01855 8b442404                       mov        eax, dword ptr [rsp + 4]
01859 890424                         mov        dword ptr [rsp], eax
0185c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01861 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01866 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
0186a 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0186e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01873 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01877 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
0187c 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01880 e93ae8ffff                     jmp        0x7ffaebe6f53f
01885 4585c0                         test       r8d, r8d
01888 7f07                           jg         0x7ffaebe70d11
0188a 33f6                           xor        esi, esi
0188c e96fe8ffff                     jmp        0x7ffaebe6f580
01891 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01896 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0189b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0189f 4489742428                     mov        dword ptr [rsp + 0x28], r14d
018a4 897c241c                       mov        dword ptr [rsp + 0x1c], edi
018a8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
018ad 89442414                       mov        dword ptr [rsp + 0x14], eax
018b1 895c2410                       mov        dword ptr [rsp + 0x10], ebx
018b5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
018ba 48894424f8                     mov        qword ptr [rsp - 8], rax
018bf 8b0424                         mov        eax, dword ptr [rsp]
018c2 89442404                       mov        dword ptr [rsp + 4], eax
018c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cb 48894424f8                     mov        qword ptr [rsp - 8], rax
018d0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018d7 890424                         mov        dword ptr [rsp], eax
018da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018df 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018e7 488bf5                         mov        rsi, rbp
018ea 8b542408                       mov        edx, dword ptr [rsp + 8]
018ee 418bc8                         mov        ecx, r8d
018f1 6690                           nop        
018f3 e8e8aaa8ff                     call       0x7ffaeb8fb860
018f8 0f1f8400f0190017               nop        dword ptr [rax + rax + 0x170019f0]
01900 41bb80000000                   mov        r11d, 0x80
01906 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0190b c4e2a1f7f0                     shlx       rsi, rax, r11
01910 48894424f8                     mov        qword ptr [rsp - 8], rax
01915 8b442404                       mov        eax, dword ptr [rsp + 4]
01919 890424                         mov        dword ptr [rsp], eax
0191c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01921 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
01925 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01929 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
0192d 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01932 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01936 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
0193b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01940 e9bbe7ffff                     jmp        0x7ffaebe6f580
01945 4533db                         xor        r11d, r11d
01948 e985f0ffff                     jmp        0x7ffaebe6fe52
0194d bee4ffffff                     mov        esi, 0xffffffe4
01952 48ffb42490000000               push       qword ptr [rsp + 0x90]
0195a 488f0424                       pop        qword ptr [rsp]
0195e 90                             nop        
0195f e87c28b5ff                     call       0x7ffaeb9c3660
01964 0f1f84005c1a0018               nop        dword ptr [rax + rax + 0x18001a5c]
0196c be5d000000                     mov        esi, 0x5d
01971 6690                           nop        
01973 e86828b5ff                     call       0x7ffaeb9c3660
01978 0f1f8400701a0019               nop        dword ptr [rax + rax + 0x19001a70]
01980 bef6ffffff                     mov        esi, 0xfffffff6
01985 6690                           nop        
01987 e85428b5ff                     call       0x7ffaeb9c3660
0198c 0f1f8400841a001a               nop        dword ptr [rax + rax + 0x1a001a84]
01994 bef6ffffff                     mov        esi, 0xfffffff6
01999 6690                           nop        
0199b e84028b5ff                     call       0x7ffaeb9c3660
019a0 0f1f8400981a001b               nop        dword ptr [rax + rax + 0x1b001a98]
019a8 be6effffff                     mov        esi, 0xffffff6e
019ad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019b5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
019ba 44891c24                       mov        dword ptr [rsp], r11d
019be 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019c3 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019cd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019d2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019d7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019dc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019e1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019e6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
019eb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019f0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
019f5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019fa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
019ff 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a04 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a09 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a0e 90                             nop        
01a0f e8cc27b5ff                     call       0x7ffaeb9c3660
01a14 0f1f84000c1b001c               nop        dword ptr [rax + rax + 0x1c001b0c]
01a1c bee4ffffff                     mov        esi, 0xffffffe4
01a21 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a29 488f0424                       pop        qword ptr [rsp]
01a2d 89442418                       mov        dword ptr [rsp + 0x18], eax
01a31 48894424f8                     mov        qword ptr [rsp - 8], rax
01a36 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a3d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a46 897c2428                       mov        dword ptr [rsp + 0x28], edi
01a4a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a4e 90                             nop        
01a4f e88c27b5ff                     call       0x7ffaeb9c3660
01a54 0f1f84004c1b001d               nop        dword ptr [rax + rax + 0x1d001b4c]
01a5c bee4ffffff                     mov        esi, 0xffffffe4
01a61 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a69 488f0424                       pop        qword ptr [rsp]
01a6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a72 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a79 89442418                       mov        dword ptr [rsp + 0x18], eax
01a7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a82 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a86 89542428                       mov        dword ptr [rsp + 0x28], edx
01a8a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a8f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a94 666690                         nop        
01a97 e84427b5ff                     call       0x7ffaeb9c3660
01a9c 0f1f8400941b001e               nop        dword ptr [rax + rax + 0x1e001b94]
01aa4 bebeffffff                     mov        esi, 0xffffffbe
01aa9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ab1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ab6 44891c24                       mov        dword ptr [rsp], r11d
01aba 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01abf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ac4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ac9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ace 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ad3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ad8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01add 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ae2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ae7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01aec 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01af1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01af6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01afb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b00 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b05 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b0a 90                             nop        
01b0b e8d026b5ff                     call       0x7ffaeb9c3660
01b10 0f1f8400081c001f               nop        dword ptr [rax + rax + 0x1f001c08]
01b18 beccffffff                     mov        esi, 0xffffffcc
01b1d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b25 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b2a 44891424                       mov        dword ptr [rsp], r10d
01b2e 89442410                       mov        dword ptr [rsp + 0x10], eax
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b3e 89442414                       mov        dword ptr [rsp + 0x14], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 897c2418                       mov        dword ptr [rsp + 0x18], edi
01b4b 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b4f 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01b53 e88826b5ff                     call       0x7ffaeb9c3660
01b58 0f1f8400501c0020               nop        dword ptr [rax + rax + 0x20001c50]
01b60 beccffffff                     mov        esi, 0xffffffcc
01b65 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b6d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b72 44890424                       mov        dword ptr [rsp], r8d
01b76 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b82 89442410                       mov        dword ptr [rsp + 0x10], eax
01b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01b8f 89542418                       mov        dword ptr [rsp + 0x18], edx
01b93 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01b98 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b9d 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01ba1 6690                           nop        
01ba3 e83826b5ff                     call       0x7ffaeb9c3660
01ba8 0f1f8400a01c0021               nop        dword ptr [rax + rax + 0x21001ca0]
01bb0 be45ffffff                     mov        esi, 0xffffff45
01bb5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bbd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bc2 44891424                       mov        dword ptr [rsp], r10d
01bc6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bcb 4489542408                     mov        dword ptr [rsp + 8], r10d
01bd0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bd5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bda 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bdf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01be4 666690                         nop        
01be7 e8f425b5ff                     call       0x7ffaeb9c3660
01bec 0f1f8400e41c0022               nop        dword ptr [rax + rax + 0x22001ce4]
01bf4 be45ffffff                     mov        esi, 0xffffff45
01bf9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c01 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c06 44891c24                       mov        dword ptr [rsp], r11d
01c0a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c0f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c14 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c19 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c1e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c23 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c28 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c2d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c32 90                             nop        
01c33 e8a825b5ff                     call       0x7ffaeb9c3660
01c38 0f1f8400301d0023               nop        dword ptr [rax + rax + 0x23001d30]
01c40 bef6ffffff                     mov        esi, 0xfffffff6
01c45 6690                           nop        
01c47 e89425b5ff                     call       0x7ffaeb9c3660
01c4c 0f1f8400441d0024               nop        dword ptr [rax + rax + 0x24001d44]
01c54 be5d000000                     mov        esi, 0x5d
01c59 6690                           nop        
01c5b e88025b5ff                     call       0x7ffaeb9c3660
01c60 0f1f8400581d0025               nop        dword ptr [rax + rax + 0x25001d58]
01c68 be45ffffff                     mov        esi, 0xffffff45
01c6d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c75 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c7a 44891424                       mov        dword ptr [rsp], r10d
01c7e 90                             nop        
01c7f e85c25b5ff                     call       0x7ffaeb9c3660
01c84 0f1f84007c1d0026               nop        dword ptr [rax + rax + 0x26001d7c]
01c8c bef6ffffff                     mov        esi, 0xfffffff6
01c91 418be8                         mov        ebp, r8d
01c94 666690                         nop        
01c97 e84425b5ff                     call       0x7ffaeb9c3660
01c9c 0f1f8400941d0027               nop        dword ptr [rax + rax + 0x27001d94]
01ca4 bef6ffffff                     mov        esi, 0xfffffff6
01ca9 8be9                           mov        ebp, ecx
01cab e83025b5ff                     call       0x7ffaeb9c3660
01cb0 0f1f8400a81d0028               nop        dword ptr [rax + rax + 0x28001da8]
01cb8 bef6ffffff                     mov        esi, 0xfffffff6
01cbd 418be8                         mov        ebp, r8d
01cc0 666690                         nop        
01cc3 e81825b5ff                     call       0x7ffaeb9c3660
01cc8 0f1f8400c01d0029               nop        dword ptr [rax + rax + 0x29001dc0]
01cd0 bef6ffffff                     mov        esi, 0xfffffff6
01cd5 6690                           nop        
01cd7 e80425b5ff                     call       0x7ffaeb9c3660
01cdc 0f1f8400d41d002a               nop        dword ptr [rax + rax + 0x2a001dd4]
01ce4 bef6ffffff                     mov        esi, 0xfffffff6
01ce9 6690                           nop        
01ceb e8f024b5ff                     call       0x7ffaeb9c3660
01cf0 0f1f8400e81d002b               nop        dword ptr [rax + rax + 0x2b001de8]
01cf8 bef6ffffff                     mov        esi, 0xfffffff6
01cfd 6690                           nop        
01cff e8dc24b5ff                     call       0x7ffaeb9c3660
01d04 0f1f8400fc1d002c               nop        dword ptr [rax + rax + 0x2c001dfc]
01d0c bef6ffffff                     mov        esi, 0xfffffff6
01d11 6690                           nop        
01d13 e8c824b5ff                     call       0x7ffaeb9c3660
01d18 0f1f8400101e002d               nop        dword ptr [rax + rax + 0x2d001e10]
01d20 bef6ffffff                     mov        esi, 0xfffffff6
01d25 6690                           nop        
01d27 e8b424b5ff                     call       0x7ffaeb9c3660
01d2c 0f1f8400241e002e               nop        dword ptr [rax + rax + 0x2e001e24]
01d34 bef6ffffff                     mov        esi, 0xfffffff6
01d39 6690                           nop        
01d3b e8a024b5ff                     call       0x7ffaeb9c3660
01d40 0f1f8400381e002f               nop        dword ptr [rax + rax + 0x2f001e38]
01d48 bef6ffffff                     mov        esi, 0xfffffff6
01d4d 6690                           nop        
01d4f e88c24b5ff                     call       0x7ffaeb9c3660
01d54 0f1f84004c1e0030               nop        dword ptr [rax + rax + 0x30001e4c]
01d5c eb08                           jmp        0x7ffaebe711e6
01d5e eb06                           jmp        0x7ffaebe711e6
01d60 eb04                           jmp        0x7ffaebe711e6
01d62 eb02                           jmp        0x7ffaebe711e6
01d64 eb00                           jmp        0x7ffaebe711e6
01d66 488bf0                         mov        rsi, rax
01d69 e9caecffff                     jmp        0x7ffaebe6feb8
01d6e 49ba88fee6ebfa7f0000           movabs     r10, 0x7ffaebe6fe88
01d78 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d7f e9dccca8ff                     jmp        0x7ffaeb8fdee0
01d84 e89798a7ff                     call       0x7ffaeb8eaaa0
01d89 e990e2ffff                     jmp        0x7ffaebe6f49e
01d8e f4                             hlt        
01d8f f4                             hlt        
