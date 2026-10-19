00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f850e1d0000                   jne        0x7f0c73e5cfac
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
00050 0f83b7180000                   jae        0x7f0c73e5cb8d
00056 0fb65c1607                     movzx      ebx, byte ptr [rsi + rdx + 7]
0005b 85db                           test       ebx, ebx
0005d 0f84c9180000                   je         0x7f0c73e5cbac
00063 448bc2                         mov        r8d, edx
00066 442bc1                         sub        r8d, ecx
00069 8b0c24                         mov        ecx, dword ptr [rsp]
0006c 83c1f9                         add        ecx, -7
0006f 8d42f8                         lea        eax, [rdx - 8]
00072 468d1cc500000000               lea        r11d, [r8*8]
0007a f3440fbdcb                     lzcnt      r9d, ebx
0007f 41be1f000000                   mov        r14d, 0x1f
00085 452bf1                         sub        r14d, r9d
00088 bf08000000                     mov        edi, 8
0008d 412bfe                         sub        edi, r14d
00090 418bd3                         mov        edx, r11d
00093 2bd7                           sub        edx, edi
00095 4183f808                       cmp        r8d, 8
00099 0f8cf9160000                   jl         0x7f0c73e5ca18
0009f 85c9                           test       ecx, ecx
000a1 0f8c311a0000                   jl         0x7f0c73e5cd58
000a7 8b2c24                         mov        ebp, dword ptr [rsp]
000aa 83c5f9                         add        ebp, -7
000ad 3bc5                           cmp        eax, ebp
000af 0f8327190000                   jae        0x7f0c73e5cc5c
000b5 448bd0                         mov        r10d, eax
000b8 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bd 4183c0f8                       add        r8d, -8
000c1 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000c9 4183c2f0                       add        r10d, -0x10
000cd 4183f808                       cmp        r8d, 8
000d1 0f8c6e170000                   jl         0x7f0c73e5cac5
000d7 85c9                           test       ecx, ecx
000d9 0f8c411a0000                   jl         0x7f0c73e5cda0
000df 8b2c24                         mov        ebp, dword ptr [rsp]
000e2 83c5f9                         add        ebp, -7
000e5 443bd5                         cmp        r10d, ebp
000e8 0f832e190000                   jae        0x7f0c73e5cc9c
000ee 458bc2                         mov        r8d, r10d
000f1 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000f9 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
000fe 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00103 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00107 4585db                         test       r11d, r11d
0010a 0f8430180000                   je         0x7f0c73e5cbc0
00110 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00114 458b4104                       mov        r8d, dword ptr [r9 + 4]
00118 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011b 85db                           test       ebx, ebx
0011d 0f8431180000                   je         0x7f0c73e5cbd4
00123 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00128 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00130 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00135 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
0013a 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00141 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00146 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014a 89442410                       mov        dword ptr [rsp + 0x10], eax
0014e 894c2404                       mov        dword ptr [rsp + 4], ecx
00152 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015a 45034304                       add        r8d, dword ptr [r11 + 4]
0015e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00163 44034304                       add        r8d, dword ptr [rbx + 4]
00167 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0016b 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00170 4c8bd3                         mov        r10, rbx
00173 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00178 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0017d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00182 4d8bd1                         mov        r10, r9
00185 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018a 4585c0                         test       r8d, r8d
0018d 0f84cb080000                   je         0x7f0c73e5bcde
00193 be40000000                     mov        esi, 0x40
00198 2bf7                           sub        esi, edi
0019a 443bc6                         cmp        r8d, esi
0019d 0f8f14020000                   jg         0x7f0c73e5b637
001a3 412bf0                         sub        esi, r8d
001a6 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ab 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b0 4183f840                       cmp        r8d, 0x40
001b4 0f8d521a0000                   jge        0x7f0c73e5ce8c
001ba 41ba01000000                   mov        r10d, 1
001c0 c442b9f7d2                     shlx       r10, r10, r8
001c5 49ffca                         dec        r10
001c8 4c23d5                         and        r10, rbp
001cb 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d0 458bd8                         mov        r11d, r8d
001d3 458bcb                         mov        r9d, r11d
001d6 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001db 458d5108                       lea        r10d, [r9 + 8]
001df 4183fa40                       cmp        r10d, 0x40
001e3 7c32                           jl         0x7f0c73e5b497
001e5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ea 4183c1c8                       add        r9d, -0x38
001ee 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f3 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fb 8b542408                       mov        edx, dword ptr [rsp + 8]
001ff 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00203 e8d803aaff                     call       0x7f0c738fb860
00208 0f1f840000030000               nop        dword ptr [rax + rax + 0x300]
00210 4889442420                     mov        qword ptr [rsp + 0x20], rax
00215 eb31                           jmp        0x7f0c73e5b4c8
00217 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0021c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00224 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00229 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0022e 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00236 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0023e 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00243 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00248 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0024d 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00251 83fd20                         cmp        ebp, 0x20
00254 0f8d16190000                   jge        0x7f0c73e5cdf0
0025a c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00261 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00266 41bb01000000                   mov        r11d, 1
0026c c44251f7db                     shlx       r11d, r11d, ebp
00271 41ffcb                         dec        r11d
00274 4d63d3                         movsxd     r10, r11d
00277 4c23542460                     and        r10, qword ptr [rsp + 0x60]
0027c 458bda                         mov        r11d, r10d
0027f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00284 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00289 458b5204                       mov        r10d, dword ptr [r10 + 4]
0028d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00292 4183fa20                       cmp        r10d, 0x20
00296 0f8dfc180000                   jge        0x7f0c73e5ce18
0029c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002a8 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
002b0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002b5 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002b9 458b4b04                       mov        r9d, dword ptr [r11 + 4]
002bd 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002c2 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002c6 458b4204                       mov        r8d, dword ptr [r10 + 4]
002ca 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002cf 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002d3 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d7 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002dc 4585d2                         test       r10d, r10d
002df 0f8e20160000                   jle        0x7f0c73e5cb85
002e5 41ffc9                         dec        r9d
002e8 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
002ed 41ffc8                         dec        r8d
002f0 4489442470                     mov        dword ptr [rsp + 0x70], r8d
002f5 41ffcb                         dec        r11d
002f8 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
002fd 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00302 c462bbf7542468                 shrx       r10, qword ptr [rsp + 0x68], r8
00309 41bb01000000                   mov        r11d, 1
0030f c44239f7db                     shlx       r11d, r11d, r8d
00314 458bd2                         mov        r10d, r10d
00317 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0031c 41ffcb                         dec        r11d
0031f 4d63d3                         movsxd     r10, r11d
00322 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00327 458bda                         mov        r11d, r10d
0032a 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0032f 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00337 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0033e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00346 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0034e 458b9af0000000                 mov        r11d, dword ptr [r10 + 0xf0]
00355 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0035d 458b5b04                       mov        r11d, dword ptr [r11 + 4]
00361 4585db                         test       r11d, r11d
00364 0f86fe150000                   jbe        0x7f0c73e5cbe8
0036a 4d63d3                         movsxd     r10, r11d
0036d 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00372 49ffcb                         dec        r11
00375 4d3bda                         cmp        r11, r10
00378 0f83ea150000                   jae        0x7f0c73e5cbe8
0037e 448b542404                     mov        r10d, dword ptr [rsp + 4]
00383 4585d2                         test       r10d, r10d
00386 0f8cd8160000                   jl         0x7f0c73e5cce4
0038c 448b1c24                       mov        r11d, dword ptr [rsp]
00390 4183c3f9                       add        r11d, -7
00394 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0039c 4533db                         xor        r11d, r11d
0039f 4533d2                         xor        r10d, r10d
003a2 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003aa 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003b2 e991020000                     jmp        0x7f0c73e5b8c8
003b7 418be8                         mov        ebp, r8d
003ba 2bee                           sub        ebp, esi
003bc 666690                         nop        
003bf e81c02aaff                     call       0x7f0c738fb860
003c4 0f1f8400bc040001               nop        dword ptr [rax + rax + 0x10004bc]
003cc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d1 41ba40000000                   mov        r10d, 0x40
003d7 442bd5                         sub        r10d, ebp
003da c462d1f7d8                     shlx       r11, rax, rbp
003df c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003e9 4d0bda                         or         r11, r10
003ec 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003f1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003f6 e9d8fdffff                     jmp        0x7f0c73e5b453
003fb 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00403 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00408 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0040d 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00415 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0041a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0041e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00422 0f1f8000000000                 nop        dword ptr [rax]
00429 0f1f8000000000                 nop        dword ptr [rax]
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8df4090000                   jge        0x7f0c73e5c0b4
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8da10a0000                   jge        0x7f0c73e5c194
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d780b0000                   jge        0x7f0c73e5c294
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d530c0000                   jge        0x7f0c73e5c398
004c5 41bb01000000                   mov        r11d, 1
004cb c442d1f7cb                     shlx       r9, r11, rbp
004d0 49ffc9                         dec        r9
004d3 4c23c9                         and        r9, rcx
004d6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004de 418bcb                         mov        ecx, r11d
004e1 4103ca                         add        ecx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d3                         add        r10d, ebx
004ef 4863d9                         movsxd     rbx, ecx
004f2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004fa 458bdb                         mov        r11d, r11d
004fd 4d03cb                         add        r9, r11
00500 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00508 4c03db                         add        r11, rbx
0050b 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
00513 4d85c9                         test       r9, r9
00516 0f8e20070000                   jle        0x7f0c73e5bebc
0051c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00523 0f8fdf0c0000                   jg         0x7f0c73e5c488
00529 4181faffff0100                 cmp        r10d, 0x1ffff
00530 0f8fc60d0000                   jg         0x7f0c73e5c57c
00536 81f9ffff0300                   cmp        ecx, 0x3ffff
0053c 0f8f8e0e0000                   jg         0x7f0c73e5c650
00542 458bd9                         mov        r11d, r9d
00545 4181fb00000010                 cmp        r11d, 0x10000000
0054c 0f83520f0000                   jae        0x7f0c73e5c724
00552 4d63d2                         movsxd     r10, r10d
00555 4d63db                         movsxd     r11, r11d
00558 48c1e312                       shl        rbx, 0x12
0055c 49c1e324                       shl        r11, 0x24
00560 4c0bdb                         or         r11, rbx
00563 4d0bda                         or         r11, r10
00566 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0056d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00575 4e895cd108                     mov        qword ptr [rcx + r10*8 + 8], r11
0057a 8b2c24                         mov        ebp, dword ptr [rsp]
0057d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00581 0f8db0000000                   jge        0x7f0c73e5b8b7
00587 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0058f 49c1ea30                       shr        r10, 0x30
00593 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00598 49c1eb30                       shr        r11, 0x30
0059c 418bca                         mov        ecx, r10d
0059f 418bdb                         mov        ebx, r11d
005a2 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005aa c44223f7c8                     shrx       r9d, r8d, r11d
005af 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
005b7 c44223f7d0                     shrx       r10d, r8d, r11d
005bc 4103da                         add        ebx, r10d
005bf 895c2460                       mov        dword ptr [rsp + 0x60], ebx
005c3 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005cb 4183fb20                       cmp        r11d, 0x20
005cf 0f8dbf0f0000                   jge        0x7f0c73e5c814
005d5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dd 49c1ea30                       shr        r10, 0x30
005e1 458bda                         mov        r11d, r10d
005e4 41ba01000000                   mov        r10d, 1
005ea 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005f1 c44241f7d2                     shlx       r10d, r10d, edi
005f6 41ffca                         dec        r10d
005f9 4523d1                         and        r10d, r9d
005fc 4403d1                         add        r10d, ecx
005ff 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00604 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
0060c 4183f920                       cmp        r9d, 0x20
00610 0f8d0e100000                   jge        0x7f0c73e5c8a4
00616 41b901000000                   mov        r9d, 1
0061c 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00624 c44229f7d1                     shlx       r10d, r9d, r10d
00629 41ffca                         dec        r10d
0062c 4523d0                         and        r10d, r8d
0062f 4503d3                         add        r10d, r11d
00632 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00637 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063b 0f8da4030000                   jge        0x7f0c73e5bc65
00641 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00648 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0064d 4423542460                     and        r10d, dword ptr [rsp + 0x60]
00652 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00657 458b4314                       mov        r8d, dword ptr [r11 + 0x14]
0065b 458b5804                       mov        r11d, dword ptr [r8 + 4]
0065f 453bd3                         cmp        r10d, r11d
00662 0f8306040000                   jae        0x7f0c73e5bcee
00668 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0066d 44235c2468                     and        r11d, dword ptr [rsp + 0x68]
00672 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00676 448b4914                       mov        r9d, dword ptr [rcx + 0x14]
0067a 418b4904                       mov        ecx, dword ptr [r9 + 4]
0067e 4f8b54d008                     mov        r10, qword ptr [r8 + r10*8 + 8]
00683 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00688 443bd9                         cmp        r11d, ecx
0068b 0f8367040000                   jae        0x7f0c73e5bd78
00691 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00696 4423542448                     and        r10d, dword ptr [rsp + 0x48]
0069b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
006a0 458b4014                       mov        r8d, dword ptr [r8 + 0x14]
006a4 418b5804                       mov        ebx, dword ptr [r8 + 4]
006a8 4f8b5cd908                     mov        r11, qword ptr [r9 + r11*8 + 8]
006ad 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
006b5 443bd3                         cmp        r10d, ebx
006b8 0f83d6040000                   jae        0x7f0c73e5be14
006be 4f8b54d008                     mov        r10, qword ptr [r8 + r10*8 + 8]
006c3 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006cb 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d2 ffc5                           inc        ebp
006d4 892c24                         mov        dword ptr [rsp], ebp
006d7 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006db 0f8dd5020000                   jge        0x7f0c73e5bc36
006e1 49c1ea28                       shr        r10, 0x28
006e5 458bda                         mov        r11d, r10d
006e8 450fb6db                       movzx      r11d, r11b
006ec 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006f4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006f9 49c1ea28                       shr        r10, 0x28
006fd 458bd2                         mov        r10d, r10d
00700 410fb6ea                       movzx      ebp, r10b
00704 4103eb                         add        ebp, r11d
00707 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0070f 49c1ea28                       shr        r10, 0x28
00713 458bd2                         mov        r10d, r10d
00716 450fb6d2                       movzx      r10d, r10b
0071a 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00722 4103ea                         add        ebp, r10d
00725 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0072c 41ba01000000                   mov        r10d, 1
00732 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0073a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00742 49c1ea20                       shr        r10, 0x20
00746 458bda                         mov        r11d, r10d
00749 410fb6eb                       movzx      ebp, r11b
0074d 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00754 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00759 49c1ea20                       shr        r10, 0x20
0075d 458bd2                         mov        r10d, r10d
00760 410fb6ea                       movzx      ebp, r10b
00764 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0076b 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00773 49c1ea20                       shr        r10, 0x20
00777 458bda                         mov        r11d, r10d
0077a 410fb6eb                       movzx      ebp, r11b
0077e 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00785 448bc5                         mov        r8d, ebp
00788 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00790 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
00798 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
007a0 4585c0                         test       r8d, r8d
007a3 0f8487050000                   je         0x7f0c73e5bfb0
007a9 4183f83f                       cmp        r8d, 0x3f
007ad 0f8f59060000                   jg         0x7f0c73e5c08c
007b3 bb40000000                     mov        ebx, 0x40
007b8 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007bc 443bc3                         cmp        r8d, ebx
007bf 7e47                           jle        0x7f0c73e5ba88
007c1 458bc8                         mov        r9d, r8d
007c4 442bcb                         sub        r9d, ebx
007c7 83fb40                         cmp        ebx, 0x40
007ca 0f8ddc0e0000                   jge        0x7f0c73e5c92c
007d0 41ba01000000                   mov        r10d, 1
007d6 c442e1f7d2                     shlx       r10, r10, rbx
007db 49ffca                         dec        r10
007de 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007e6 c4c2b1f7ea                     shlx       rbp, r10, r9
007eb 41bb40000000                   mov        r11d, 0x40
007f1 452bd9                         sub        r11d, r9d
007f4 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007fb 490bea                         or         rbp, r10
007fe 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00806 eb26                           jmp        0x7f0c73e5baae
00808 41ba01000000                   mov        r10d, 1
0080e c442b9f7d2                     shlx       r10, r10, r8
00813 412bd8                         sub        ebx, r8d
00816 c4e2e3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], rbx
00820 49ffca                         dec        r10
00823 4923ea                         and        rbp, r10
00826 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0082e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00833 4503d8                         add        r11d, r8d
00836 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00840 4503d0                         add        r10d, r8d
00843 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00848 4183fb40                       cmp        r11d, 0x40
0084c 0f8cdefbffff                   jl         0x7f0c73e5b6b0
00852 4183c3c0                       add        r11d, -0x40
00856 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0085b 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0085f 83c5f8                         add        ebp, -8
00862 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00866 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086a 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086e 83c1f0                         add        ecx, -0x10
00871 83f908                         cmp        ecx, 8
00874 0f8cee000000                   jl         0x7f0c73e5bbe8
0087a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0087f 4183c0e8                       add        r8d, -0x18
00883 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0088b 0f826afbffff                   jb         0x7f0c73e5b67b
00891 bee4ffffff                     mov        esi, 0xffffffe4
00896 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0089e 448b542408                     mov        r10d, dword ptr [rsp + 8]
008a3 44891424                       mov        dword ptr [rsp], r10d
008a7 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008ac 4489542404                     mov        dword ptr [rsp + 4], r10d
008b1 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
008b6 4489542408                     mov        dword ptr [rsp + 8], r10d
008bb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008c0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008c5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008ca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008cf 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008d4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008d9 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008de 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008e3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008e8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008ed 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008f2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008fc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00901 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00906 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0090b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00910 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00915 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0091a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0091f 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00924 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00929 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0092e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00933 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00938 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00940 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00945 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0094d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00952 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0095a 90                             nop        
0095b e8807ab6ff                     call       0x7f0c739c3660
00960 0f1f8400580a0002               nop        dword ptr [rax + rax + 0x2000a58]
00968 85c9                           test       ecx, ecx
0096a 7f08                           jg         0x7f0c73e5bbf4
0096c 4533d2                         xor        r10d, r10d
0096f e994faffff                     jmp        0x7f0c73e5b688
00974 8be9                           mov        ebp, ecx
00976 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097e 8b542408                       mov        edx, dword ptr [rsp + 8]
00982 90                             nop        
00983 e858fca9ff                     call       0x7f0c738fb860
00988 0f1f8400800a0003               nop        dword ptr [rax + rax + 0x3000a80]
00990 448b542408                     mov        r10d, dword ptr [rsp + 8]
00995 41c1e203                       shl        r10d, 3
00999 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0099e 41c1e003                       shl        r8d, 3
009a2 452bd0                         sub        r10d, r8d
009a5 4181c2c0000000                 add        r10d, 0xc0
009ac c462a9f7d0                     shlx       r10, rax, r10
009b1 e952faffff                     jmp        0x7f0c73e5b688
009b6 4533d2                         xor        r10d, r10d
009b9 4533c0                         xor        r8d, r8d
009bc 4533db                         xor        r11d, r11d
009bf 33c9                           xor        ecx, ecx
009c1 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009c9 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009d1 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009d9 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
009e0 e955fdffff                     jmp        0x7f0c73e5b9ba
009e5 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009ed 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f5 4d03c2                         add        r8, r10
009f8 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a00 4d3bc2                         cmp        r8, r10
00a03 7e30                           jle        0x7f0c73e5bcb5
00a05 48be38ae72e200000000           movabs     rsi, 0xe272ae38
00a0f e8ccfba9ff                     call       0x7f0c738fb860
00a14 0f1f84000c0b0004               nop        dword ptr [rax + rax + 0x4000b0c]
00a1c 4885c0                         test       rax, rax
00a1f 0f84bf110000                   je         0x7f0c73e5ce64
00a25 488bf0                         mov        rsi, rax
00a28 4881c410010000                 add        rsp, 0x110
00a2f 5d                             pop        rbp
00a30 e9abf8b6ff                     jmp        0x7f0c739cb560
00a35 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a3a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a42 0f85b0110000                   jne        0x7f0c73e5ce78
00a48 418bc0                         mov        eax, r8d
00a4b 4881c410010000                 add        rsp, 0x110
00a52 5d                             pop        rbp
00a53 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a57 0f87b9120000                   ja         0x7f0c73e5cf96
00a5d c3                             ret        
00a5e 4533db                         xor        r11d, r11d
00a61 4533d2                         xor        r10d, r10d
00a64 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a69 e965f7ffff                     jmp        0x7f0c73e5b453
00a6e bee4ffffff                     mov        esi, 0xffffffe4
00a73 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a7b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a80 44891c24                       mov        dword ptr [rsp], r11d
00a84 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a89 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a8e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a93 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a98 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00a9d 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00aa2 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00aa7 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00aac 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ab1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ab6 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00abb 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00ac0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ac5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00aca 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00acf 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ad4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ad9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ade 4489442458                     mov        dword ptr [rsp + 0x58], r8d
00ae3 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00ae8 666690                         nop        
00aeb e8f078b6ff                     call       0x7f0c739c3660
00af0 0f1f8400e80b0005               nop        dword ptr [rax + rax + 0x5000be8]
00af8 bee4ffffff                     mov        esi, 0xffffffe4
00afd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b05 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b0a 44891424                       mov        dword ptr [rsp], r10d
00b0e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b13 4489442404                     mov        dword ptr [rsp + 4], r8d
00b18 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b1d 4489542408                     mov        dword ptr [rsp + 8], r10d
00b22 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b27 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b2c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b31 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b36 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00b3b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00b40 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b45 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b4a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00b4f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00b54 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b59 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b5e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00b63 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00b68 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b6d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00b72 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b77 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b7c 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00b81 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
00b86 90                             nop        
00b87 e85478b6ff                     call       0x7f0c739c3660
00b8c 0f1f8400840c0006               nop        dword ptr [rax + rax + 0x6000c84]
00b94 bee4ffffff                     mov        esi, 0xffffffe4
00b99 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ba1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ba6 44891c24                       mov        dword ptr [rsp], r11d
00baa 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00baf 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bb4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00bb9 44895c2408                     mov        dword ptr [rsp + 8], r11d
00bbe 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bc3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bc8 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bcd 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00bd2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bd7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bdc 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00be1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00be6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00beb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bf0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00bf5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00bfa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bff 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c04 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c09 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c0e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c13 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c18 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c1d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c22 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00c27 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c2c 666690                         nop        
00c2f e8ac77b6ff                     call       0x7f0c739c3660
00c34 0f1f84002c0d0007               nop        dword ptr [rax + rax + 0x7000d2c]
00c3c 4533db                         xor        r11d, r11d
00c3f 4d3bcb                         cmp        r9, r11
00c42 bdffffffff                     mov        ebp, 0xffffffff
00c47 7c08                           jl         0x7f0c73e5bed1
00c49 400f95c5                       setne      bpl
00c4d 400fb6ed                       movzx      ebp, bpl
00c51 be45ffffff                     mov        esi, 0xffffff45
00c56 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c5e 4c891c24                       mov        qword ptr [rsp], r11
00c62 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c66 895c240c                       mov        dword ptr [rsp + 0xc], ebx
00c6a 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c72 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c77 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c7c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c81 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00c85 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00c89 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c8e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c93 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00c97 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00c9b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ca0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ca5 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
00ca9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00cad 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cb2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00cb7 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cbe 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00cc2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00cc7 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00ccc 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00cd0 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00cd4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00cd9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00cde 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00ce3 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00ce8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00cf0 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00cf5 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00cfd 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d02 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d0a 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d11 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d19 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d21 6690                           nop        
00d23 e8b876b6ff                     call       0x7f0c739c3660
00d28 0f1f8400200e0008               nop        dword ptr [rax + rax + 0x8000e20]
00d30 be45ffffff                     mov        esi, 0xffffff45
00d35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d3d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d42 44891c24                       mov        dword ptr [rsp], r11d
00d46 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d4b 4489542404                     mov        dword ptr [rsp + 4], r10d
00d50 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d55 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d5a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d5f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d64 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d69 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d6e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d73 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d78 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00d7d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d82 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d87 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d8c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d91 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00d96 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d9b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00da0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00da5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00daa 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00daf 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00db4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00db9 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dbe 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dc3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00dc8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00dcd 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dd2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dd7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ddc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00de4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00de9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00df1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00df6 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00dfe 90                             nop        
00dff e8dc75b6ff                     call       0x7f0c739c3660
00e04 0f1f8400fc0e0009               nop        dword ptr [rax + rax + 0x9000efc]
00e0c be45ffffff                     mov        esi, 0xffffff45
00e11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e19 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e1e 44891c24                       mov        dword ptr [rsp], r11d
00e22 4489442408                     mov        dword ptr [rsp + 8], r8d
00e27 e8b475b6ff                     call       0x7f0c739c3660
00e2c 0f1f8400240f000a               nop        dword ptr [rax + rax + 0xa000f24]
00e34 be45ffffff                     mov        esi, 0xffffff45
00e39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e41 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e46 44891c24                       mov        dword ptr [rsp], r11d
00e4a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e4f 4489542404                     mov        dword ptr [rsp + 4], r10d
00e54 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e59 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e5e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e66 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e6b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e70 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e75 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e7a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e7f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e84 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e89 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e8e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e93 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e98 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e9d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ea2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00ea7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00eac 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00eb1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00eb6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ebb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ec0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ec5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00eca 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ecf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ed4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ed9 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00ede 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ee3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00eed 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ef5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00efa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f02 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f07 e8d474b6ff                     call       0x7f0c739c3660
00f0c 0f1f84000410000b               nop        dword ptr [rax + rax + 0xb001004]
00f14 be45ffffff                     mov        esi, 0xffffff45
00f19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f21 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f26 44891424                       mov        dword ptr [rsp], r10d
00f2a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f2f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f34 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f39 4489542408                     mov        dword ptr [rsp + 8], r10d
00f3e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f4b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f55 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f5a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f5f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f64 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f69 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f6e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f73 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f78 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f7d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f82 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f87 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f8c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f91 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f96 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f9b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00fa0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00fa5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00faa 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00faf 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fb4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fb9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00fbe 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00fc3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fcd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fd5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fda 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fe2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fe7 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00fef 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00ff4 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00ffc 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01004 666690                         nop        
01007 e8d473b6ff                     call       0x7f0c739c3660
0100c 0f1f84000411000c               nop        dword ptr [rax + rax + 0xc001104]
01014 be45ffffff                     mov        esi, 0xffffff45
01019 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01021 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01026 44891c24                       mov        dword ptr [rsp], r11d
0102a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0102f 4489542404                     mov        dword ptr [rsp + 4], r10d
01034 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01039 44895c2408                     mov        dword ptr [rsp + 8], r11d
0103e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01046 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0104b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01050 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01055 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0105a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0105f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01064 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01069 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0106e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01073 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01078 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0107d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01082 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01087 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0108c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01091 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01096 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0109b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
010a0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
010a5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010aa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
010af 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
010b4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
010b9 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
010be 4489542450                     mov        dword ptr [rsp + 0x50], r10d
010c3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010c8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010d5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010da 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010e2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010e7 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
010ef 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
010f4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
010fc 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01103 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
0110b e8d072b6ff                     call       0x7f0c739c3660
01110 0f1f84000812000d               nop        dword ptr [rax + rax + 0xd001208]
01118 be45ffffff                     mov        esi, 0xffffff45
0111d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01125 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0112a 44891c24                       mov        dword ptr [rsp], r11d
0112e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01133 44894c2404                     mov        dword ptr [rsp + 4], r9d
01138 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0113d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01142 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01147 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0114c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01151 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01156 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0115b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01160 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01165 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0116a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0116f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01174 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01179 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0117e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01183 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01188 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0118d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01192 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01197 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0119c 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
011a1 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
011a6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011ab 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
011b0 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
011b5 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
011ba 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
011bf 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
011c4 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011cc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011d1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011d9 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011de 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011e3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
011ea 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011f2 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
011fa 90                             nop        
011fb e8e071b6ff                     call       0x7f0c739c3660
01200 0f1f8400f812000e               nop        dword ptr [rax + rax + 0xe0012f8]
01208 41bbffffff7f                   mov        r11d, 0x7fffffff
0120e 4d3bcb                         cmp        r9, r11
01211 bdffffffff                     mov        ebp, 0xffffffff
01216 7c08                           jl         0x7f0c73e5c4a0
01218 400f95c5                       setne      bpl
0121c 400fb6ed                       movzx      ebp, bpl
01220 be45ffffff                     mov        esi, 0xffffff45
01225 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0122d 4c891c24                       mov        qword ptr [rsp], r11
01231 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01235 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01239 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01241 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01246 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
0124a 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0124e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01253 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01258 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
0125c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01260 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01265 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0126a 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
0126e 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01272 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01277 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0127c 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01280 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01284 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0128c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01291 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01295 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01299 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0129e 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
012a3 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
012a7 895c2458                       mov        dword ptr [rsp + 0x58], ebx
012ab 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
012b0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012b5 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012bd 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012c2 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012ca 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012cf 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012d7 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012de 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e6 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012ee 90                             nop        
012ef e8ec70b6ff                     call       0x7f0c739c3660
012f4 0f1f8400ec13000f               nop        dword ptr [rax + rax + 0xf0013ec]
012fc be45ffffff                     mov        esi, 0xffffff45
01301 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01309 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0130e 44891c24                       mov        dword ptr [rsp], r11d
01312 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01317 44895c2404                     mov        dword ptr [rsp + 4], r11d
0131c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01321 44895c2408                     mov        dword ptr [rsp + 8], r11d
01326 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0132b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01330 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01335 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0133a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0133f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01344 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01349 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0134e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01353 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01358 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0135d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01362 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01367 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0136c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01371 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01376 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0137b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01380 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01385 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0138a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0138f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01394 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01399 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0139e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013a3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
013a8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013b0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013b5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013ba 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013c2 90                             nop        
013c3 e81870b6ff                     call       0x7f0c739c3660
013c8 0f1f8400c0140010               nop        dword ptr [rax + rax + 0x100014c0]
013d0 be45ffffff                     mov        esi, 0xffffff45
013d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013dd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013e2 44891c24                       mov        dword ptr [rsp], r11d
013e6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013eb 44895c2404                     mov        dword ptr [rsp + 4], r11d
013f0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013f5 44895c2408                     mov        dword ptr [rsp + 8], r11d
013fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01404 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01409 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0140e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01413 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01418 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0141d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01422 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01427 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0142c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01431 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01436 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0143b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01440 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01445 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0144a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0144f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01454 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01459 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0145e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01463 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01468 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0146d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01472 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01477 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0147c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01484 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01489 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0148e 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01495 6690                           nop        
01497 e8446fb6ff                     call       0x7f0c739c3660
0149c 0f1f840094150011               nop        dword ptr [rax + rax + 0x11001594]
014a4 be3dffffff                     mov        esi, 0xffffff3d
014a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014b6 44890c24                       mov        dword ptr [rsp], r9d
014ba 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
014bf 44894c2404                     mov        dword ptr [rsp + 4], r9d
014c4 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
014c9 44894c2408                     mov        dword ptr [rsp + 8], r9d
014ce 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
014d3 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
014d8 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
014dc 895c240c                       mov        dword ptr [rsp + 0xc], ebx
014e0 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014e5 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014ea 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
014ee 895c2424                       mov        dword ptr [rsp + 0x24], ebx
014f2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014f7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014fc 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01500 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01504 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01509 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0150e 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01512 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01516 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0151b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01520 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01527 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0152b 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01530 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01535 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01539 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0153d 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01542 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01547 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0154c 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01551 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01559 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0155e 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01566 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0156b 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01570 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01578 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0157f 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01587 e8546eb6ff                     call       0x7f0c739c3660
0158c 0f1f840084160012               nop        dword ptr [rax + rax + 0x12001684]
01594 be45ffffff                     mov        esi, 0xffffff45
01599 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015a1 448b542408                     mov        r10d, dword ptr [rsp + 8]
015a6 44891424                       mov        dword ptr [rsp], r10d
015aa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
015af 4489542404                     mov        dword ptr [rsp + 4], r10d
015b4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015b9 44895c2408                     mov        dword ptr [rsp + 8], r11d
015be 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015c3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015c8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015cd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015d2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015d7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015dc 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015e1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015e6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015f0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015f5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015fa 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015fe 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01603 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01608 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0160d 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01611 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01616 90                             nop        
01617 e8c46db6ff                     call       0x7f0c739c3660
0161c 0f1f840014170013               nop        dword ptr [rax + rax + 0x13001714]
01624 be45ffffff                     mov        esi, 0xffffff45
01629 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01631 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01636 44890c24                       mov        dword ptr [rsp], r9d
0163a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0163f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01644 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01649 4489542408                     mov        dword ptr [rsp + 8], r10d
0164e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01653 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01658 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0165d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01662 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01667 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0166c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01671 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01676 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0167b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01680 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01685 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0168a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0168f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01694 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01699 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0169e 90                             nop        
0169f e83c6db6ff                     call       0x7f0c739c3660
016a4 0f1f84009c170014               nop        dword ptr [rax + rax + 0x1400179c]
016ac be45ffffff                     mov        esi, 0xffffff45
016b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016b9 448b542408                     mov        r10d, dword ptr [rsp + 8]
016be 44891424                       mov        dword ptr [rsp], r10d
016c2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016c7 44895c2404                     mov        dword ptr [rsp + 4], r11d
016cc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016d1 4489542408                     mov        dword ptr [rsp + 8], r10d
016d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016e5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016ea 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016ef 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016f4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
016f9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016fe 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01703 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01708 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0170d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01712 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01717 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0171c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01721 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01726 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0172b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01730 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01735 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0173a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0173f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01744 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01749 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0174e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01753 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01758 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01760 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01765 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0176d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01772 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0177a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01782 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
01789 6690                           nop        
0178b e8506cb6ff                     call       0x7f0c739c3660
01790 0f1f840088180015               nop        dword ptr [rax + rax + 0x15001888]
01798 4585c0                         test       r8d, r8d
0179b 7f08                           jg         0x7f0c73e5ca25
0179d 4533ed                         xor        r13d, r13d
017a0 e918e9ffff                     jmp        0x7f0c73e5b33d
017a5 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017a9 4489742428                     mov        dword ptr [rsp + 0x28], r14d
017ae 897c241c                       mov        dword ptr [rsp + 0x1c], edi
017b2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017b7 89442414                       mov        dword ptr [rsp + 0x14], eax
017bb 894c2410                       mov        dword ptr [rsp + 0x10], ecx
017bf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017c4 48894424f8                     mov        qword ptr [rsp - 8], rax
017c9 8b0424                         mov        eax, dword ptr [rsp]
017cc 89442404                       mov        dword ptr [rsp + 4], eax
017d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d5 48894424f8                     mov        qword ptr [rsp - 8], rax
017da 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017e1 890424                         mov        dword ptr [rsp], eax
017e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e9 488bee                         mov        rbp, rsi
017ec 8b542408                       mov        edx, dword ptr [rsp + 8]
017f0 418bc8                         mov        ecx, r8d
017f3 e8e8eda9ff                     call       0x7f0c738fb860
017f8 0f1f8400f0180016               nop        dword ptr [rax + rax + 0x160018f0]
01800 41bb40000000                   mov        r11d, 0x40
01806 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0180b c462a1f7e8                     shlx       r13, rax, r11
01810 48894424f8                     mov        qword ptr [rsp - 8], rax
01815 8b442404                       mov        eax, dword ptr [rsp + 4]
01819 890424                         mov        dword ptr [rsp], eax
0181c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01821 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01826 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0182a 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0182e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01833 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01837 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
0183c 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01840 e978e8ffff                     jmp        0x7f0c73e5b33d
01845 4585c0                         test       r8d, r8d
01848 7f07                           jg         0x7f0c73e5cad1
0184a 33f6                           xor        esi, esi
0184c e9ade8ffff                     jmp        0x7f0c73e5b37e
01851 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01856 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0185b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0185f 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01864 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01868 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0186d 89442414                       mov        dword ptr [rsp + 0x14], eax
01871 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01875 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0187a 48894424f8                     mov        qword ptr [rsp - 8], rax
0187f 8b0424                         mov        eax, dword ptr [rsp]
01882 89442404                       mov        dword ptr [rsp + 4], eax
01886 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188b 48894424f8                     mov        qword ptr [rsp - 8], rax
01890 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01897 890424                         mov        dword ptr [rsp], eax
0189a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018a7 488bf5                         mov        rsi, rbp
018aa 8b542408                       mov        edx, dword ptr [rsp + 8]
018ae 418bc8                         mov        ecx, r8d
018b1 6690                           nop        
018b3 e828eda9ff                     call       0x7f0c738fb860
018b8 0f1f8400b0190017               nop        dword ptr [rax + rax + 0x170019b0]
018c0 41bb80000000                   mov        r11d, 0x80
018c6 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
018cb c4e2a1f7f0                     shlx       rsi, rax, r11
018d0 48894424f8                     mov        qword ptr [rsp - 8], rax
018d5 8b442404                       mov        eax, dword ptr [rsp + 4]
018d9 890424                         mov        dword ptr [rsp], eax
018dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e1 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
018e5 8b442414                       mov        eax, dword ptr [rsp + 0x14]
018e9 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
018ed 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
018f2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
018f6 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
018fb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01900 e9f9e7ffff                     jmp        0x7f0c73e5b37e
01905 4533c0                         xor        r8d, r8d
01908 e9e0f0ffff                     jmp        0x7f0c73e5bc6d
0190d bee4ffffff                     mov        esi, 0xffffffe4
01912 48ffb42490000000               push       qword ptr [rsp + 0x90]
0191a 488f0424                       pop        qword ptr [rsp]
0191e 90                             nop        
0191f e8bc6ab6ff                     call       0x7f0c739c3660
01924 0f1f84001c1a0018               nop        dword ptr [rax + rax + 0x18001a1c]
0192c be5d000000                     mov        esi, 0x5d
01931 6690                           nop        
01933 e8a86ab6ff                     call       0x7f0c739c3660
01938 0f1f8400301a0019               nop        dword ptr [rax + rax + 0x19001a30]
01940 bef6ffffff                     mov        esi, 0xfffffff6
01945 6690                           nop        
01947 e8946ab6ff                     call       0x7f0c739c3660
0194c 0f1f8400441a001a               nop        dword ptr [rax + rax + 0x1a001a44]
01954 bef6ffffff                     mov        esi, 0xfffffff6
01959 6690                           nop        
0195b e8806ab6ff                     call       0x7f0c739c3660
01960 0f1f8400581a001b               nop        dword ptr [rax + rax + 0x1b001a58]
01968 be6effffff                     mov        esi, 0xffffff6e
0196d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01975 448b542408                     mov        r10d, dword ptr [rsp + 8]
0197a 44891424                       mov        dword ptr [rsp], r10d
0197e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01983 4489542408                     mov        dword ptr [rsp + 8], r10d
01988 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0198d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01992 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01997 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0199c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019a1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019a6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019ab 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
019b0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
019b5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019ba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
019bf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
019c4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019c9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
019ce 90                             nop        
019cf e80c6ab6ff                     call       0x7f0c739c3660
019d4 0f1f8400cc1a001c               nop        dword ptr [rax + rax + 0x1c001acc]
019dc bee4ffffff                     mov        esi, 0xffffffe4
019e1 48ffb42490000000               push       qword ptr [rsp + 0x90]
019e9 488f0424                       pop        qword ptr [rsp]
019ed 89442418                       mov        dword ptr [rsp + 0x18], eax
019f1 48894424f8                     mov        qword ptr [rsp - 8], rax
019f6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019fd 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a06 897c2428                       mov        dword ptr [rsp + 0x28], edi
01a0a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a0e 90                             nop        
01a0f e8cc69b6ff                     call       0x7f0c739c3660
01a14 0f1f84000c1b001d               nop        dword ptr [rax + rax + 0x1d001b0c]
01a1c bee4ffffff                     mov        esi, 0xffffffe4
01a21 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a29 488f0424                       pop        qword ptr [rsp]
01a2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a32 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a39 89442418                       mov        dword ptr [rsp + 0x18], eax
01a3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a42 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a46 89542428                       mov        dword ptr [rsp + 0x28], edx
01a4a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a4f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a54 666690                         nop        
01a57 e88469b6ff                     call       0x7f0c739c3660
01a5c 0f1f8400541b001e               nop        dword ptr [rax + rax + 0x1e001b54]
01a64 bebeffffff                     mov        esi, 0xffffffbe
01a69 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a71 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a76 44891424                       mov        dword ptr [rsp], r10d
01a7a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a7f 4489542408                     mov        dword ptr [rsp + 8], r10d
01a84 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a89 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a8e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a93 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a98 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a9d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01aa2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01aa7 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01aac 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ab1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ab6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01abb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ac0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ac5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01aca 90                             nop        
01acb e81069b6ff                     call       0x7f0c739c3660
01ad0 0f1f8400c81b001f               nop        dword ptr [rax + rax + 0x1f001bc8]
01ad8 beccffffff                     mov        esi, 0xffffffcc
01add 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ae5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01aea 44891424                       mov        dword ptr [rsp], r10d
01aee 89442410                       mov        dword ptr [rsp + 0x10], eax
01af2 48894424f8                     mov        qword ptr [rsp - 8], rax
01af7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01afe 89442414                       mov        dword ptr [rsp + 0x14], eax
01b02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b07 897c2418                       mov        dword ptr [rsp + 0x18], edi
01b0b 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b0f 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01b13 e8c868b6ff                     call       0x7f0c739c3660
01b18 0f1f8400101c0020               nop        dword ptr [rax + rax + 0x20001c10]
01b20 beccffffff                     mov        esi, 0xffffffcc
01b25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b2d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b32 44890424                       mov        dword ptr [rsp], r8d
01b36 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b42 89442410                       mov        dword ptr [rsp + 0x10], eax
01b46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01b4f 89542418                       mov        dword ptr [rsp + 0x18], edx
01b53 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01b58 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b5d 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01b61 6690                           nop        
01b63 e87868b6ff                     call       0x7f0c739c3660
01b68 0f1f8400601c0021               nop        dword ptr [rax + rax + 0x21001c60]
01b70 be45ffffff                     mov        esi, 0xffffff45
01b75 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b7a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b7f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b89 6690                           nop        
01b8b e85068b6ff                     call       0x7f0c739c3660
01b90 0f1f8400881c0022               nop        dword ptr [rax + rax + 0x22001c88]
01b98 be45ffffff                     mov        esi, 0xffffff45
01b9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ba5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01baa 44891424                       mov        dword ptr [rsp], r10d
01bae 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bb3 4489542408                     mov        dword ptr [rsp + 8], r10d
01bb8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bbd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bc2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bc7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bcc 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bd1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bd6 90                             nop        
01bd7 e80468b6ff                     call       0x7f0c739c3660
01bdc 0f1f8400d41c0023               nop        dword ptr [rax + rax + 0x23001cd4]
01be4 bef6ffffff                     mov        esi, 0xfffffff6
01be9 6690                           nop        
01beb e8f067b6ff                     call       0x7f0c739c3660
01bf0 0f1f8400e81c0024               nop        dword ptr [rax + rax + 0x24001ce8]
01bf8 be5d000000                     mov        esi, 0x5d
01bfd 6690                           nop        
01bff e8dc67b6ff                     call       0x7f0c739c3660
01c04 0f1f8400fc1c0025               nop        dword ptr [rax + rax + 0x25001cfc]
01c0c be45ffffff                     mov        esi, 0xffffff45
01c11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c19 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c1e 44891424                       mov        dword ptr [rsp], r10d
01c22 90                             nop        
01c23 e8b867b6ff                     call       0x7f0c739c3660
01c28 0f1f8400201d0026               nop        dword ptr [rax + rax + 0x26001d20]
01c30 bef6ffffff                     mov        esi, 0xfffffff6
01c35 418bea                         mov        ebp, r10d
01c38 666690                         nop        
01c3b e8a067b6ff                     call       0x7f0c739c3660
01c40 0f1f8400381d0027               nop        dword ptr [rax + rax + 0x27001d38]
01c48 bef6ffffff                     mov        esi, 0xfffffff6
01c4d 418beb                         mov        ebp, r11d
01c50 666690                         nop        
01c53 e88867b6ff                     call       0x7f0c739c3660
01c58 0f1f8400501d0028               nop        dword ptr [rax + rax + 0x28001d50]
01c60 bef6ffffff                     mov        esi, 0xfffffff6
01c65 418bea                         mov        ebp, r10d
01c68 666690                         nop        
01c6b e87067b6ff                     call       0x7f0c739c3660
01c70 0f1f8400681d0029               nop        dword ptr [rax + rax + 0x29001d68]
01c78 bef6ffffff                     mov        esi, 0xfffffff6
01c7d 6690                           nop        
01c7f e85c67b6ff                     call       0x7f0c739c3660
01c84 0f1f84007c1d002a               nop        dword ptr [rax + rax + 0x2a001d7c]
01c8c bef6ffffff                     mov        esi, 0xfffffff6
01c91 6690                           nop        
01c93 e84867b6ff                     call       0x7f0c739c3660
01c98 0f1f8400901d002b               nop        dword ptr [rax + rax + 0x2b001d90]
01ca0 bef6ffffff                     mov        esi, 0xfffffff6
01ca5 6690                           nop        
01ca7 e83467b6ff                     call       0x7f0c739c3660
01cac 0f1f8400a41d002c               nop        dword ptr [rax + rax + 0x2c001da4]
01cb4 bef6ffffff                     mov        esi, 0xfffffff6
01cb9 6690                           nop        
01cbb e82067b6ff                     call       0x7f0c739c3660
01cc0 0f1f8400b81d002d               nop        dword ptr [rax + rax + 0x2d001db8]
01cc8 bef6ffffff                     mov        esi, 0xfffffff6
01ccd 6690                           nop        
01ccf e80c67b6ff                     call       0x7f0c739c3660
01cd4 0f1f8400cc1d002e               nop        dword ptr [rax + rax + 0x2e001dcc]
01cdc bef6ffffff                     mov        esi, 0xfffffff6
01ce1 6690                           nop        
01ce3 e8f866b6ff                     call       0x7f0c739c3660
01ce8 0f1f8400e01d002f               nop        dword ptr [rax + rax + 0x2f001de0]
01cf0 bef6ffffff                     mov        esi, 0xfffffff6
01cf5 6690                           nop        
01cf7 e8e466b6ff                     call       0x7f0c739c3660
01cfc 0f1f8400f41d0030               nop        dword ptr [rax + rax + 0x30001df4]
01d04 eb08                           jmp        0x7f0c73e5cf8e
01d06 eb06                           jmp        0x7f0c73e5cf8e
01d08 eb04                           jmp        0x7f0c73e5cf8e
01d0a eb02                           jmp        0x7f0c73e5cf8e
01d0c eb00                           jmp        0x7f0c73e5cf8e
01d0e 488bf0                         mov        rsi, rax
01d11 e912edffff                     jmp        0x7f0c73e5bca8
01d16 49bad3bce5730c7f0000           movabs     r10, 0x7f0c73e5bcd3
01d20 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d27 e9340faaff                     jmp        0x7f0c738fdee0
01d2c e8efdaa8ff                     call       0x7f0c738eaaa0
01d31 e9e8e2ffff                     jmp        0x7f0c73e5b29e
01d36 f4                             hlt        
01d37 f4                             hlt        
