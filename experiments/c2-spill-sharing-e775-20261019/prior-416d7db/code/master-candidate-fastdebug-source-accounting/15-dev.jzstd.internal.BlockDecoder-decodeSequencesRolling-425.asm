00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8576200000                   jne        0x7efc7bbe7a94
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5604                       mov        r10d, dword ptr [rsi + 4]
00049 44891424                       mov        dword ptr [rsp], r10d
0004d 413bea                         cmp        ebp, r10d
00050 0f83471a0000                   jae        0x7efc7bbe749d
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f846d1a0000                   je         0x7efc7bbe74d0
00063 448bc2                         mov        r8d, edx
00066 442b442408                     sub        r8d, dword ptr [rsp + 8]
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d1cc500000000               lea        r11d, [r8*8]
0007d f3440fbdc9                     lzcnt      r9d, ecx
00082 be1f000000                     mov        esi, 0x1f
00087 412bf1                         sub        esi, r9d
0008a bb08000000                     mov        ebx, 8
0008f 2bde                           sub        ebx, esi
00091 418bd3                         mov        edx, r11d
00094 2bd3                           sub        edx, ebx
00096 4183f808                       cmp        r8d, 8
0009a 0f8c80180000                   jl         0x7efc7bbe7320
000a0 85ff                           test       edi, edi
000a2 0f8c601c0000                   jl         0x7efc7bbe7708
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83191b0000                   jae        0x7efc7bbe75d0
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8cf4180000                   jl         0x7efc7bbe73d5
000e1 85ff                           test       edi, edi
000e3 0f8c7f1c0000                   jl         0x7efc7bbe7768
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f832c1b0000                   jae        0x7efc7bbe7624
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f84de190000                   je         0x7efc7bbe74f8
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f84f1190000                   je         0x7efc7bbe7520
0012f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00134 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
0013c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00141 4889442428                     mov        qword ptr [rsp + 0x28], rax
00146 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0014d 8974240c                       mov        dword ptr [rsp + 0xc], esi
00151 895c2424                       mov        dword ptr [rsp + 0x24], ebx
00155 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
0015a 897c2404                       mov        dword ptr [rsp + 4], edi
0015e 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00166 41034804                       add        ecx, dword ptr [r8 + 4]
0016a 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0016f 41034904                       add        ecx, dword ptr [r9 + 4]
00173 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00178 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0017c 4d8bd1                         mov        r10, r9
0017f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00184 4d8bd0                         mov        r10, r8
00187 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0018c 4d8bd3                         mov        r10, r11
0018f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00194 85c9                           test       ecx, ecx
00196 0f84e4080000                   je         0x7efc7bbe6480
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8f09020000                   jg         0x7efc7bbe5db4
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8ddc1c0000                   jge        0x7efc7bbe789c
001c0 41ba01000000                   mov        r10d, 1
001c6 c442f1f7d2                     shlx       r10, r10, rcx
001cb 49ffca                         dec        r10
001ce 4c23d5                         and        r10, rbp
001d1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d6 448bd9                         mov        r11d, ecx
001d9 458bc3                         mov        r8d, r11d
001dc 442b44240c                     sub        r8d, dword ptr [rsp + 0xc]
001e1 458d5008                       lea        r10d, [r8 + 8]
001e5 4183fa40                       cmp        r10d, 0x40
001e9 7c34                           jl         0x7efc7bbe5c1f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c0c8                       add        r8d, -0x38
001f4 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 90                             nop        
0020a 90                             nop        
0020b e850a0b4ff                     call       0x7efc7b72fc60
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7efc7bbe5c50
0021f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00224 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0022c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00231 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00236 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0023e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00246 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00250 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00255 418b6b04                       mov        ebp, dword ptr [r11 + 4]
00259 83fd20                         cmp        ebp, 0x20
0025c 0f8d6a1b0000                   jge        0x7efc7bbe77cc
00262 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00269 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026e 41ba01000000                   mov        r10d, 1
00274 c44251f7da                     shlx       r11d, r10d, ebp
00279 41ffcb                         dec        r11d
0027c 4d63d3                         movsxd     r10, r11d
0027f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00284 458bd2                         mov        r10d, r10d
00287 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0028c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00291 418b6b04                       mov        ebp, dword ptr [r11 + 4]
00295 83fd20                         cmp        ebp, 0x20
00298 0f8d6a1b0000                   jge        0x7efc7bbe7808
0029e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a6 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002aa 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
002b2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002b7 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002bb 458b4b04                       mov        r9d, dword ptr [r11 + 4]
002bf 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002c4 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002c8 458b4204                       mov        r8d, dword ptr [r10 + 4]
002cc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002d1 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002d5 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d9 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002de 4585d2                         test       r10d, r10d
002e1 0f8eae170000                   jle        0x7efc7bbe7495
002e7 41ffc9                         dec        r9d
002ea 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
002ef 41ffc8                         dec        r8d
002f2 4489442464                     mov        dword ptr [rsp + 0x64], r8d
002f7 41ffcb                         dec        r11d
002fa 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
002ff c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00306 41b801000000                   mov        r8d, 1
0030c c44251f7d8                     shlx       r11d, r8d, ebp
00311 458bd2                         mov        r10d, r10d
00314 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00319 41ffcb                         dec        r11d
0031c 4d63d3                         movsxd     r10, r11d
0031f 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00324 458bda                         mov        r11d, r10d
00327 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0032c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00334 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0033b 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00343 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0034b 458b9af0000000                 mov        r11d, dword ptr [r10 + 0xf0]
00352 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0035a 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0035e 4585db                         test       r11d, r11d
00361 0f86e1170000                   jbe        0x7efc7bbe7548
00367 4d63d3                         movsxd     r10, r11d
0036a 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0036f 49ffcb                         dec        r11
00372 4d3bda                         cmp        r11, r10
00375 0f83cd170000                   jae        0x7efc7bbe7548
0037b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00380 4585db                         test       r11d, r11d
00383 0f8cf7180000                   jl         0x7efc7bbe7680
00389 448b1424                       mov        r10d, dword ptr [rsp]
0038d 4183c2f9                       add        r10d, -7
00391 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00399 4533db                         xor        r11d, r11d
0039c 4533d2                         xor        r10d, r10d
0039f 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003a7 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003af e984020000                     jmp        0x7efc7bbe6038
003b4 8be9                           mov        ebp, ecx
003b6 2bee                           sub        ebp, esi
003b8 90                             nop        
003b9 90                             nop        
003ba 90                             nop        
003bb e8a09eb4ff                     call       0x7efc7b72fc60
003c0 0f1f8400b8040001               nop        dword ptr [rax + rax + 0x10004b8]
003c8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003cd 41ba40000000                   mov        r10d, 0x40
003d3 442bd5                         sub        r10d, ebp
003d6 c462d1f7d8                     shlx       r11, rax, rbp
003db c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003e5 4d0bda                         or         r11, r10
003e8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003ed 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003f2 e9e2fdffff                     jmp        0x7efc7bbe5bd9
003f7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ff 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00404 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00409 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00411 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00416 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0041a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0041e 90                             nop        
0041f 90                             nop        
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8d68090000                   jge        0x7efc7bbe6798
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8d290a0000                   jge        0x7efc7bbe688c
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d140b0000                   jge        0x7efc7bbe69a0
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d030c0000                   jge        0x7efc7bbe6ab8
004b5 41b801000000                   mov        r8d, 1
004bb c442d1f7c0                     shlx       r8, r8, rbp
004c0 49ffc8                         dec        r8
004c3 4c23c3                         and        r8, rbx
004c6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004ce 418bf9                         mov        edi, r9d
004d1 4103fa                         add        edi, r10d
004d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004d9 458bd2                         mov        r10d, r10d
004dc 4403d1                         add        r10d, ecx
004df 4863cf                         movsxd     rcx, edi
004e2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
004ea 458bc9                         mov        r9d, r9d
004ed 4d03c1                         add        r8, r9
004f0 4c8b8c24e8000000               mov        r9, qword ptr [rsp + 0xe8]
004f8 4c03c9                         add        r9, rcx
004fb 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
00503 4d85c0                         test       r8, r8
00506 0f8e88070000                   jle        0x7efc7bbe6694
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fa30c0000                   jg         0x7efc7bbe6bbc
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fa20d0000                   jg         0x7efc7bbe6cc8
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8f7e0e0000                   jg         0x7efc7bbe6db0
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f83560f0000                   jae        0x7efc7bbe6e98
00542 4d63d2                         movsxd     r10, r10d
00545 4d63c1                         movsxd     r8, r9d
00548 48c1e112                       shl        rcx, 0x12
0054c 49c1e024                       shl        r8, 0x24
00550 4c0bc1                         or         r8, rcx
00553 4d0bc2                         or         r8, r10
00556 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0055d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00565 4e8944d108                     mov        qword ptr [rcx + r10*8 + 8], r8
0056a 8b2c24                         mov        ebp, dword ptr [rsp]
0056d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00571 0f8db0000000                   jge        0x7efc7bbe6027
00577 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0057f 49c1ea30                       shr        r10, 0x30
00583 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00588 49c1e830                       shr        r8, 0x30
0058c 458bca                         mov        r9d, r10d
0058f 418bf8                         mov        edi, r8d
00592 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
0059a c4c23bf7db                     shrx       ebx, r11d, r8d
0059f 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005a7 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005af c4422bf7c3                     shrx       r8d, r11d, r10d
005b4 4103f8                         add        edi, r8d
005b7 897c2474                       mov        dword ptr [rsp + 0x74], edi
005bb 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005c3 4183fa20                       cmp        r10d, 0x20
005c7 0f8d07100000                   jge        0x7efc7bbe6fd4
005cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005d5 49c1ea30                       shr        r10, 0x30
005d9 458bd2                         mov        r10d, r10d
005dc b901000000                     mov        ecx, 1
005e1 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
005e9 c46239f7c1                     shlx       r8d, ecx, r8d
005ee 41ffc8                         dec        r8d
005f1 4423c3                         and        r8d, ebx
005f4 4503c1                         add        r8d, r9d
005f7 4489442448                     mov        dword ptr [rsp + 0x48], r8d
005fc 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00604 4183f920                       cmp        r9d, 0x20
00608 0f8d72100000                   jge        0x7efc7bbe7080
0060e 41b801000000                   mov        r8d, 1
00614 c44231f7c0                     shlx       r8d, r8d, r9d
00619 41ffc8                         dec        r8d
0061c 4523c3                         and        r8d, r11d
0061f 4503c2                         add        r8d, r10d
00622 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00627 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062b 0f8d95030000                   jge        0x7efc7bbe63c6
00631 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00638 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063d 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00642 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00647 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
0064b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064f 453bc2                         cmp        r8d, r10d
00652 0f8338040000                   jae        0x7efc7bbe6490
00658 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00660 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00665 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
00669 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0066d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00672 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00677 3bcb                           cmp        ecx, ebx
00679 0f83ad040000                   jae        0x7efc7bbe652c
0067f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00684 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00689 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0068e 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00692 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00696 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069b 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a3 453bc1                         cmp        r8d, r9d
006a6 0f832c050000                   jae        0x7efc7bbe65d8
006ac 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c0 ffc5                           inc        ebp
006c2 892c24                         mov        dword ptr [rsp], ebp
006c5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c9 0f8d72030000                   jge        0x7efc7bbe6441
006cf 49c1ea28                       shr        r10, 0x28
006d3 458bda                         mov        r11d, r10d
006d6 450fb6db                       movzx      r11d, r11b
006da 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006e2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006e7 49c1ea28                       shr        r10, 0x28
006eb 458bd2                         mov        r10d, r10d
006ee 410fb6ea                       movzx      ebp, r10b
006f2 4103eb                         add        ebp, r11d
006f5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006fd 49c1ea28                       shr        r10, 0x28
00701 458bd2                         mov        r10d, r10d
00704 450fb6d2                       movzx      r10d, r10b
00708 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00710 4103ea                         add        ebp, r10d
00713 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0071a 41bb01000000                   mov        r11d, 1
00720 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
00728 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00730 49c1ea20                       shr        r10, 0x20
00734 458bda                         mov        r11d, r10d
00737 410fb6eb                       movzx      ebp, r11b
0073b 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00742 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00747 49c1ea20                       shr        r10, 0x20
0074b 458bd2                         mov        r10d, r10d
0074e 410fb6ea                       movzx      ebp, r10b
00752 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00759 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00761 49c1ea20                       shr        r10, 0x20
00765 458bda                         mov        r11d, r10d
00768 410fb6eb                       movzx      ebp, r11b
0076c 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00773 448bc5                         mov        r8d, ebp
00776 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
0077e 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
00786 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
0078e 4585c0                         test       r8d, r8d
00791 0f84d9020000                   je         0x7efc7bbe6470
00797 4183f83f                       cmp        r8d, 0x3f
0079b 0f8ff70d0000                   jg         0x7efc7bbe6f98
007a1 bb40000000                     mov        ebx, 0x40
007a6 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007aa 443bc3                         cmp        r8d, ebx
007ad 7e47                           jle        0x7efc7bbe61f6
007af 458bc8                         mov        r9d, r8d
007b2 442bcb                         sub        r9d, ebx
007b5 83fb40                         cmp        ebx, 0x40
007b8 0f8d62100000                   jge        0x7efc7bbe7220
007be 41ba01000000                   mov        r10d, 1
007c4 c442e1f7d2                     shlx       r10, r10, rbx
007c9 49ffca                         dec        r10
007cc 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d4 c4c2b1f7ea                     shlx       rbp, r10, r9
007d9 41ba40000000                   mov        r10d, 0x40
007df 452bd1                         sub        r10d, r9d
007e2 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007e9 490bea                         or         rbp, r10
007ec 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f4 eb30                           jmp        0x7efc7bbe6226
007f6 412bd8                         sub        ebx, r8d
007f9 c462e3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rbx
00803 4183f840                       cmp        r8d, 0x40
00807 0f8d0f0f0000                   jge        0x7efc7bbe711c
0080d 41ba01000000                   mov        r10d, 1
00813 c4c2b9f7ea                     shlx       rbp, r10, r8
00818 48ffcd                         dec        rbp
0081b 4923e9                         and        rbp, r9
0081e 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00826 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0082b 4503d8                         add        r11d, r8d
0082e 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00833 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00838 4503d0                         add        r10d, r8d
0083b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00840 4183fa40                       cmp        r10d, 0x40
00844 0f8cd6fbffff                   jl         0x7efc7bbe5e20
0084a 458d5ac0                       lea        r11d, [r10 - 0x40]
0084e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00853 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00857 83c5f8                         add        ebp, -8
0085a 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085e 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00862 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00866 83c1f0                         add        ecx, -0x10
00869 83f908                         cmp        ecx, 8
0086c 0f8c06010000                   jl         0x7efc7bbe6378
00872 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00877 4183c0e8                       add        r8d, -0x18
0087b 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00883 0f826efbffff                   jb         0x7efc7bbe5df7
00889 bee4ffffff                     mov        esi, 0xffffffe4
0088e 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00896 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0089b 44891c24                       mov        dword ptr [rsp], r11d
0089f 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a4 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
008ae 4489542408                     mov        dword ptr [rsp + 8], r10d
008b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008bd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008c2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008c7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008cc 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008d1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008d6 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008db 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008e0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008e5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008ea 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008ef 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008f9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fe 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00903 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00908 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0090d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00912 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00917 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0091c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00921 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00926 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0092b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00930 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00935 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0093d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00942 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0094a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0094f 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00957 e80477aeff                     call       0x7efc7b6cda60
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
0096e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00972 e869f1cb17                     call       0x7efc938a54e0
00977 f4                             hlt        
00978 85c9                           test       ecx, ecx
0097a 7f08                           jg         0x7efc7bbe6384
0097c 4533d2                         xor        r10d, r10d
0097f e980faffff                     jmp        0x7efc7bbe5e04
00984 8be9                           mov        ebp, ecx
00986 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098e 8b542408                       mov        edx, dword ptr [rsp + 8]
00992 90                             nop        
00993 e8c898b4ff                     call       0x7efc7b72fc60
00998 0f1f8400900a0003               nop        dword ptr [rax + rax + 0x3000a90]
009a0 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
009a5 41c1e303                       shl        r11d, 3
009a9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ae 41c1e003                       shl        r8d, 3
009b2 452bd8                         sub        r11d, r8d
009b5 4181c3c0000000                 add        r11d, 0xc0
009bc c462a1f7d0                     shlx       r10, rax, r11
009c1 e93efaffff                     jmp        0x7efc7bbe5e04
009c6 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
009ce 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009d6 4d03da                         add        r11, r10
009d9 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009e1 4d3bda                         cmp        r11, r10
009e4 7f29                           jg         0x7efc7bbe640f
009e6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009eb 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
009f3 0f857b140000                   jne        0x7efc7bbe7874
009f9 418bc3                         mov        eax, r11d
009fc 4881c410010000                 add        rsp, 0x110
00a03 5d                             pop        rbp
00a04 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a08 0f8770160000                   ja         0x7efc7bbe7a7e
00a0e c3                             ret        
00a0f 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a19 90                             nop        
00a1a 90                             nop        
00a1b e84098b4ff                     call       0x7efc7b72fc60
00a20 0f1f8400180b0004               nop        dword ptr [rax + rax + 0x4000b18]
00a28 4885c0                         test       rax, rax
00a2b 0f841b140000                   je         0x7efc7bbe784c
00a31 488bf0                         mov        rsi, rax
00a34 4881c410010000                 add        rsp, 0x110
00a3b 5d                             pop        rbp
00a3c e91f2caeff                     jmp        0x7efc7b6c9060
00a41 4533d2                         xor        r10d, r10d
00a44 4533c0                         xor        r8d, r8d
00a47 4533db                         xor        r11d, r11d
00a4a 33c9                           xor        ecx, ecx
00a4c 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a54 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a5c 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a64 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
00a6b e9b8fcffff                     jmp        0x7efc7bbe6128
00a70 4533d2                         xor        r10d, r10d
00a73 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a7b e9a0f9ffff                     jmp        0x7efc7bbe5e20
00a80 4533db                         xor        r11d, r11d
00a83 4533d2                         xor        r10d, r10d
00a86 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a8b e949f7ffff                     jmp        0x7efc7bbe5bd9
00a90 bee4ffffff                     mov        esi, 0xffffffe4
00a95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00aa2 44891424                       mov        dword ptr [rsp], r10d
00aa6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00aab 44894c2404                     mov        dword ptr [rsp + 4], r9d
00ab0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ab5 4489542408                     mov        dword ptr [rsp + 8], r10d
00aba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00abf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ac4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00ac9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00ace 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ad3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ad8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00add 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ae2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ae7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00aec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00af1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00af6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00afb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b00 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b05 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b0a 90                             nop        
00b0b e85075aeff                     call       0x7efc7b6cda60
00b10 0f1f8400080c0005               nop        dword ptr [rax + rax + 0x5000c08]
00b18 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b26 e8b5efcb17                     call       0x7efc938a54e0
00b2b f4                             hlt        
00b2c bee4ffffff                     mov        esi, 0xffffffe4
00b31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b3e 44891c24                       mov        dword ptr [rsp], r11d
00b42 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b47 4489442404                     mov        dword ptr [rsp + 4], r8d
00b4c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b51 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b56 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b5b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b60 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b65 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b6a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b6f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b74 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b79 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b7e 458bd9                         mov        r11d, r9d
00b81 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b86 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b8b 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b90 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b95 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b9a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b9f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ba4 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00ba9 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00bae 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00bb3 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00bb7 e8a474aeff                     call       0x7efc7b6cda60
00bbc 0f1f8400b40c0006               nop        dword ptr [rax + rax + 0x6000cb4]
00bc4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd2 e809efcb17                     call       0x7efc938a54e0
00bd7 f4                             hlt        
00bd8 bee4ffffff                     mov        esi, 0xffffffe4
00bdd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00be5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bea 44891424                       mov        dword ptr [rsp], r10d
00bee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00bf3 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bf8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bfd 4489542408                     mov        dword ptr [rsp + 8], r10d
00c02 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c07 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c0c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00c11 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c16 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c1b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c20 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c25 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c2a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c2f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c34 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c39 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c3e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c43 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c48 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c4d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c52 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c57 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c5c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c61 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c66 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c6b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c70 90                             nop        
00c71 90                             nop        
00c72 90                             nop        
00c73 e8e873aeff                     call       0x7efc7b6cda60
00c78 0f1f8400700d0007               nop        dword ptr [rax + rax + 0x7000d70]
00c80 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8e e84deecb17                     call       0x7efc938a54e0
00c93 f4                             hlt        
00c94 4533c9                         xor        r9d, r9d
00c97 4d3bc1                         cmp        r8, r9
00c9a bdffffffff                     mov        ebp, 0xffffffff
00c9f 7c08                           jl         0x7efc7bbe66a9
00ca1 400f95c5                       setne      bpl
00ca5 400fb6ed                       movzx      ebp, bpl
00ca9 be45ffffff                     mov        esi, 0xffffff45
00cae 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00cb6 4c890c24                       mov        qword ptr [rsp], r9
00cba 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00cbe 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00cc2 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cca 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00ccf 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00cd3 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00cd7 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00cdc 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ce1 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00ce5 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00ce9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cee 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cf3 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00cf7 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00cfb 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00d00 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00d05 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00d09 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d0d 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d15 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d1a 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d1e 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d22 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d27 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d2c 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00d30 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d34 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d39 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d3e 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d46 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d4b 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d53 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d58 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d60 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d67 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d6f 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d77 e8e472aeff                     call       0x7efc7b6cda60
00d7c 0f1f8400740e0008               nop        dword ptr [rax + rax + 0x8000e74]
00d84 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00d8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d92 e849edcb17                     call       0x7efc938a54e0
00d97 f4                             hlt        
00d98 be45ffffff                     mov        esi, 0xffffff45
00d9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00da5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00daa 44891c24                       mov        dword ptr [rsp], r11d
00dae 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00db3 4489542404                     mov        dword ptr [rsp + 4], r10d
00db8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00dbd 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dc2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00dca 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dcf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dd4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dd9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00dde 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00de3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00de8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ded 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00df2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00df7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00dfc 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e01 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e06 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e0b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e10 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e15 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e1a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e1f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00e24 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e29 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e2e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e33 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e38 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e3d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e42 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e47 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e4c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e51 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e59 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e5e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e66 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e6b e8f071aeff                     call       0x7efc7b6cda60
00e70 0f1f8400680f0009               nop        dword ptr [rax + rax + 0x9000f68]
00e78 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e86 e855eccb17                     call       0x7efc938a54e0
00e8b f4                             hlt        
00e8c be45ffffff                     mov        esi, 0xffffff45
00e91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e99 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e9e 44891424                       mov        dword ptr [rsp], r10d
00ea2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00ea7 4489442404                     mov        dword ptr [rsp + 4], r8d
00eac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00eb1 4489542408                     mov        dword ptr [rsp + 8], r10d
00eb6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ebe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ec3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ec8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ecd 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ed2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00ed7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00edc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ee1 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ee6 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00eeb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ef0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ef5 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00efa 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00eff 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f04 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f09 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00f0e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f13 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f18 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f1d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f22 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f27 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00f2c 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00f31 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f36 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f3b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f40 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f45 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f4d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f52 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f5a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f5f 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00f67 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00f6c 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f74 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f7c 90                             nop        
00f7d 90                             nop        
00f7e 90                             nop        
00f7f e8dc70aeff                     call       0x7efc7b6cda60
00f84 0f1f84007c10000a               nop        dword ptr [rax + rax + 0xa00107c]
00f8c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
00f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f9a e841ebcb17                     call       0x7efc938a54e0
00f9f f4                             hlt        
00fa0 be45ffffff                     mov        esi, 0xffffff45
00fa5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fad 448b442408                     mov        r8d, dword ptr [rsp + 8]
00fb2 44890424                       mov        dword ptr [rsp], r8d
00fb6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fbb 4489542404                     mov        dword ptr [rsp + 4], r10d
00fc0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00fc5 4489442408                     mov        dword ptr [rsp + 8], r8d
00fca 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fd2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fd7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fdc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fe1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fe6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00feb 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ff0 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00ff5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ffa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00fff 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01004 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01009 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0100e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01013 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01018 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0101d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01022 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01027 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0102c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01031 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01036 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0103b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01040 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01045 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0104a 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0104f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01054 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01059 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01061 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01066 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0106e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01073 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
0107b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01080 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01088 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0108f 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01097 e8c46faeff                     call       0x7efc7b6cda60
0109c 0f1f84009411000b               nop        dword ptr [rax + rax + 0xb001194]
010a4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
010ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
010b2 e829eacb17                     call       0x7efc938a54e0
010b7 f4                             hlt        
010b8 be45ffffff                     mov        esi, 0xffffff45
010bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010c5 448b442408                     mov        r8d, dword ptr [rsp + 8]
010ca 44890424                       mov        dword ptr [rsp], r8d
010ce 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
010d3 44894c2404                     mov        dword ptr [rsp + 4], r9d
010d8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010dd 4489442408                     mov        dword ptr [rsp + 8], r8d
010e2 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
010e7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
010ec 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
010f1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
010f6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
010fb 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01100 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01105 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0110a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0110f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01114 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01119 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0111e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01123 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01128 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0112d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01132 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01137 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0113c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01141 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01146 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0114b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01150 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01155 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0115a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0115f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01164 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0116c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01171 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01179 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0117e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01183 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
0118a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01192 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
0119a 90                             nop        
0119b e8c06eaeff                     call       0x7efc7b6cda60
011a0 0f1f84009812000c               nop        dword ptr [rax + rax + 0xc001298]
011a8 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
011b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
011b6 e825e9cb17                     call       0x7efc938a54e0
011bb f4                             hlt        
011bc 41b9ffffff7f                   mov        r9d, 0x7fffffff
011c2 4d3bc1                         cmp        r8, r9
011c5 bdffffffff                     mov        ebp, 0xffffffff
011ca 7c08                           jl         0x7efc7bbe6bd4
011cc 400f95c5                       setne      bpl
011d0 400fb6ed                       movzx      ebp, bpl
011d4 be45ffffff                     mov        esi, 0xffffff45
011d9 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
011e1 4c890c24                       mov        qword ptr [rsp], r9
011e5 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
011e9 894c240c                       mov        dword ptr [rsp + 0xc], ecx
011ed 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
011f5 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
011fa 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
011ff 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01204 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01208 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0120c 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01211 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01216 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0121a 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0121e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01223 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01228 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
0122c 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01230 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01235 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0123a 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01241 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01245 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0124a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0124f 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01253 894c2454                       mov        dword ptr [rsp + 0x54], ecx
01257 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0125c 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01261 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01266 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0126b 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01273 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01278 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01280 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
01285 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0128d 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
01294 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0129c 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012a4 90                             nop        
012a5 90                             nop        
012a6 90                             nop        
012a7 e8b46daeff                     call       0x7efc7b6cda60
012ac 0f1f8400a413000d               nop        dword ptr [rax + rax + 0xd0013a4]
012b4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
012be 4883e4f0                       and        rsp, 0xfffffffffffffff0
012c2 e819e8cb17                     call       0x7efc938a54e0
012c7 f4                             hlt        
012c8 be45ffffff                     mov        esi, 0xffffff45
012cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012d5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
012da 44890c24                       mov        dword ptr [rsp], r9d
012de 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
012e3 44894c2404                     mov        dword ptr [rsp + 4], r9d
012e8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
012ed 44894c2408                     mov        dword ptr [rsp + 8], r9d
012f2 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
012f7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
012fc 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01301 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01306 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0130b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01310 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01315 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0131a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0131f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01324 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01329 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0132e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01333 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01338 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0133d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01342 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01347 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0134c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01351 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01356 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0135b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01360 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01365 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0136a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0136f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01374 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0137c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01381 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01386 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0138e 90                             nop        
0138f e8cc6caeff                     call       0x7efc7b6cda60
01394 0f1f84008c14000e               nop        dword ptr [rax + rax + 0xe00148c]
0139c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
013a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013aa e831e7cb17                     call       0x7efc938a54e0
013af f4                             hlt        
013b0 be45ffffff                     mov        esi, 0xffffff45
013b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013bd 448b542408                     mov        r10d, dword ptr [rsp + 8]
013c2 44891424                       mov        dword ptr [rsp], r10d
013c6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013cb 4489542404                     mov        dword ptr [rsp + 4], r10d
013d0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013d5 4489542408                     mov        dword ptr [rsp + 8], r10d
013da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013e4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013e9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
013ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
013f3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013f8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
013fd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01402 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01407 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0140c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01411 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01416 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0141b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01420 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01425 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0142a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0142f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01434 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01439 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0143e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01443 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01448 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0144d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01452 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01457 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0145c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01464 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01469 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0146e 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01475 90                             nop        
01476 90                             nop        
01477 e8e46baeff                     call       0x7efc7b6cda60
0147c 0f1f84007415000f               nop        dword ptr [rax + rax + 0xf001574]
01484 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
0148e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01492 e849e6cb17                     call       0x7efc938a54e0
01497 f4                             hlt        
01498 be3dffffff                     mov        esi, 0xffffff3d
0149d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014a5 8b4c2408                       mov        ecx, dword ptr [rsp + 8]
014a9 890c24                         mov        dword ptr [rsp], ecx
014ac 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
014b0 894c2404                       mov        dword ptr [rsp + 4], ecx
014b4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
014b9 4489442408                     mov        dword ptr [rsp + 8], r8d
014be 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014c3 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014c8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014cd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014d2 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
014d6 894c2420                       mov        dword ptr [rsp + 0x20], ecx
014da 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
014df 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014e4 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
014e8 894c2428                       mov        dword ptr [rsp + 0x28], ecx
014ec 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014f1 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
014f6 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
014fa 894c2430                       mov        dword ptr [rsp + 0x30], ecx
014fe 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01503 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01508 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
0150c 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01510 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01518 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0151d 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01521 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01525 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0152a 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0152f 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01533 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01537 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0153c 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01541 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01549 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0154e 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01556 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0155b 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01560 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01568 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0156f 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01577 e8e46aaeff                     call       0x7efc7b6cda60
0157c 0f1f840074160010               nop        dword ptr [rax + rax + 0x10001674]
01584 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
0158e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01592 e849e5cb17                     call       0x7efc938a54e0
01597 f4                             hlt        
01598 be45ffffff                     mov        esi, 0xffffff45
0159d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015a5 448b542408                     mov        r10d, dword ptr [rsp + 8]
015aa 44891424                       mov        dword ptr [rsp], r10d
015ae 4489442408                     mov        dword ptr [rsp + 8], r8d
015b3 e8a86aaeff                     call       0x7efc7b6cda60
015b8 0f1f8400b0160011               nop        dword ptr [rax + rax + 0x110016b0]
015c0 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
015ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ce e80de5cb17                     call       0x7efc938a54e0
015d3 f4                             hlt        
015d4 be45ffffff                     mov        esi, 0xffffff45
015d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015e1 448b442408                     mov        r8d, dword ptr [rsp + 8]
015e6 44890424                       mov        dword ptr [rsp], r8d
015ea 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
015ef 4489442404                     mov        dword ptr [rsp + 4], r8d
015f4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015f9 4489542408                     mov        dword ptr [rsp + 8], r10d
015fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01603 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01608 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0160d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01612 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01617 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0161c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01621 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01626 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0162b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01630 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01635 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0163a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0163f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01644 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01649 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0164e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01653 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01658 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0165c 90                             nop        
0165d 90                             nop        
0165e 90                             nop        
0165f e8fc69aeff                     call       0x7efc7b6cda60
01664 0f1f84005c170012               nop        dword ptr [rax + rax + 0x1200175c]
0166c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01676 4883e4f0                       and        rsp, 0xfffffffffffffff0
0167a e861e4cb17                     call       0x7efc938a54e0
0167f f4                             hlt        
01680 be45ffffff                     mov        esi, 0xffffff45
01685 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0168d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01692 44890c24                       mov        dword ptr [rsp], r9d
01696 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0169b 4489442404                     mov        dword ptr [rsp + 4], r8d
016a0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
016a5 4489442408                     mov        dword ptr [rsp + 8], r8d
016aa 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
016af 4c89442418                     mov        qword ptr [rsp + 0x18], r8
016b4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
016b9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
016be 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
016c3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
016c8 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
016cd 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
016d2 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
016d7 4489442428                     mov        dword ptr [rsp + 0x28], r8d
016dc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
016e1 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
016e6 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
016eb 4489442430                     mov        dword ptr [rsp + 0x30], r8d
016f0 4489542454                     mov        dword ptr [rsp + 0x54], r10d
016f5 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016fa 90                             nop        
016fb e86069aeff                     call       0x7efc7b6cda60
01700 0f1f8400f8170013               nop        dword ptr [rax + rax + 0x130017f8]
01708 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01712 4883e4f0                       and        rsp, 0xfffffffffffffff0
01716 e8c5e3cb17                     call       0x7efc938a54e0
0171b f4                             hlt        
0171c be45ffffff                     mov        esi, 0xffffff45
01721 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01729 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0172e 44891c24                       mov        dword ptr [rsp], r11d
01732 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01737 44895c2404                     mov        dword ptr [rsp + 4], r11d
0173c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01741 4489542408                     mov        dword ptr [rsp + 8], r10d
01746 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0174e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01753 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01758 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0175d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01762 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01767 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0176c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01771 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01776 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0177b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01780 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01785 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0178a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0178f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01794 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01799 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0179e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017a3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
017a8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
017ad 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017b2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
017b7 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017bc 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
017c1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017c6 4489542450                     mov        dword ptr [rsp + 0x50], r10d
017cb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017d0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017d5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017dd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
017e2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017ea 4c89542468                     mov        qword ptr [rsp + 0x68], r10
017ef 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
017f7 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
017ff e85c68aeff                     call       0x7efc7b6cda60
01804 0f1f8400fc180014               nop        dword ptr [rax + rax + 0x140018fc]
0180c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01816 4883e4f0                       and        rsp, 0xfffffffffffffff0
0181a e8c1e2cb17                     call       0x7efc938a54e0
0181f f4                             hlt        
01820 be45ffffff                     mov        esi, 0xffffff45
01825 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0182d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01832 44891c24                       mov        dword ptr [rsp], r11d
01836 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0183b 4489542404                     mov        dword ptr [rsp + 4], r10d
01840 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01845 44895c2408                     mov        dword ptr [rsp + 8], r11d
0184a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0184f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01854 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01859 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0185e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01863 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01868 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0186d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01872 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01877 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0187c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01881 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01886 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0188b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01890 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01895 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0189a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0189f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018a4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018a9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018ae 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
018b3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018b8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018bd 4489542450                     mov        dword ptr [rsp + 0x50], r10d
018c2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018c7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018cc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018d4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018d9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018e1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018e6 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
018ee 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
018f6 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
018fd 90                             nop        
018fe 90                             nop        
018ff e85c67aeff                     call       0x7efc7b6cda60
01904 0f1f8400fc190015               nop        dword ptr [rax + rax + 0x150019fc]
0190c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0191a e8c1e1cb17                     call       0x7efc938a54e0
0191f f4                             hlt        
01920 4585c0                         test       r8d, r8d
01923 7f07                           jg         0x7efc7bbe732c
01925 33c0                           xor        eax, eax
01927 e99be7ffff                     jmp        0x7efc7bbe5ac7
0192c 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01930 89742428                       mov        dword ptr [rsp + 0x28], esi
01934 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01938 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0193d 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01942 897c2410                       mov        dword ptr [rsp + 0x10], edi
01946 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0194b 48894424f8                     mov        qword ptr [rsp - 8], rax
01950 8b0424                         mov        eax, dword ptr [rsp]
01953 89442404                       mov        dword ptr [rsp + 4], eax
01957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195c 48894424f8                     mov        qword ptr [rsp - 8], rax
01961 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01968 890424                         mov        dword ptr [rsp], eax
0196b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01970 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01978 488bf5                         mov        rsi, rbp
0197b 8b542408                       mov        edx, dword ptr [rsp + 8]
0197f 418bc8                         mov        ecx, r8d
01982 90                             nop        
01983 e8d888b4ff                     call       0x7efc7b72fc60
01988 0f1f8400801a0016               nop        dword ptr [rax + rax + 0x16001a80]
01990 41ba40000000                   mov        r10d, 0x40
01996 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
0199b c4e2a9f7c0                     shlx       rax, rax, r10
019a0 48894424f8                     mov        qword ptr [rsp - 8], rax
019a5 8b442404                       mov        eax, dword ptr [rsp + 4]
019a9 890424                         mov        dword ptr [rsp], eax
019ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b1 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
019b6 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
019ba 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
019bf 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
019c4 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
019c8 8b742428                       mov        esi, dword ptr [rsp + 0x28]
019cc 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019d0 e9f2e6ffff                     jmp        0x7efc7bbe5ac7
019d5 4585c0                         test       r8d, r8d
019d8 7f08                           jg         0x7efc7bbe73e2
019da 4533f6                         xor        r14d, r14d
019dd e926e7ffff                     jmp        0x7efc7bbe5b08
019e2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019e7 4889442430                     mov        qword ptr [rsp + 0x30], rax
019ec 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019f0 89742428                       mov        dword ptr [rsp + 0x28], esi
019f4 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
019f8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019fd 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01a02 897c2410                       mov        dword ptr [rsp + 0x10], edi
01a06 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a10 8b0424                         mov        eax, dword ptr [rsp]
01a13 89442404                       mov        dword ptr [rsp + 4], eax
01a17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a28 890424                         mov        dword ptr [rsp], eax
01a2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a30 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a38 488bf5                         mov        rsi, rbp
01a3b 8b542408                       mov        edx, dword ptr [rsp + 8]
01a3f 418bc8                         mov        ecx, r8d
01a42 90                             nop        
01a43 e81888b4ff                     call       0x7efc7b72fc60
01a48 0f1f8400401b0017               nop        dword ptr [rax + rax + 0x17001b40]
01a50 41ba80000000                   mov        r10d, 0x80
01a56 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a5b c462a9f7f0                     shlx       r14, rax, r10
01a60 48894424f8                     mov        qword ptr [rsp - 8], rax
01a65 8b442404                       mov        eax, dword ptr [rsp + 4]
01a69 890424                         mov        dword ptr [rsp], eax
01a6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a71 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01a75 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01a7a 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01a7e 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01a82 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a86 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01a8b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a90 e973e6ffff                     jmp        0x7efc7bbe5b08
01a95 4533db                         xor        r11d, r11d
01a98 e931efffff                     jmp        0x7efc7bbe63ce
01a9d bee4ffffff                     mov        esi, 0xffffffe4
01aa2 48ffb42490000000               push       qword ptr [rsp + 0x90]
01aaa 488f0424                       pop        qword ptr [rsp]
01aae 90                             nop        
01aaf e8ac65aeff                     call       0x7efc7b6cda60
01ab4 0f1f8400ac1b0018               nop        dword ptr [rax + rax + 0x18001bac]
01abc 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01ac6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aca e811e0cb17                     call       0x7efc938a54e0
01acf f4                             hlt        
01ad0 be5d000000                     mov        esi, 0x5d
01ad5 90                             nop        
01ad6 90                             nop        
01ad7 e88465aeff                     call       0x7efc7b6cda60
01adc 0f1f8400d41b0019               nop        dword ptr [rax + rax + 0x19001bd4]
01ae4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01aee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01af2 e8e9dfcb17                     call       0x7efc938a54e0
01af7 f4                             hlt        
01af8 bef6ffffff                     mov        esi, 0xfffffff6
01afd 90                             nop        
01afe 90                             nop        
01aff e85c65aeff                     call       0x7efc7b6cda60
01b04 0f1f8400fc1b001a               nop        dword ptr [rax + rax + 0x1a001bfc]
01b0c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01b16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1a e8c1dfcb17                     call       0x7efc938a54e0
01b1f f4                             hlt        
01b20 bef6ffffff                     mov        esi, 0xfffffff6
01b25 90                             nop        
01b26 90                             nop        
01b27 e83465aeff                     call       0x7efc7b6cda60
01b2c 0f1f8400241c001b               nop        dword ptr [rax + rax + 0x1b001c24]
01b34 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b42 e899dfcb17                     call       0x7efc938a54e0
01b47 f4                             hlt        
01b48 be6effffff                     mov        esi, 0xffffff6e
01b4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b55 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b5a 44891424                       mov        dword ptr [rsp], r10d
01b5e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b63 4489542408                     mov        dword ptr [rsp + 8], r10d
01b68 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b6d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b72 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b77 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b7c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b81 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b86 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b8b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b90 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b95 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01b9a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b9f 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ba4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ba9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bae 90                             nop        
01baf e8ac64aeff                     call       0x7efc7b6cda60
01bb4 0f1f8400ac1c001c               nop        dword ptr [rax + rax + 0x1c001cac]
01bbc 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01bc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bca e811dfcb17                     call       0x7efc938a54e0
01bcf f4                             hlt        
01bd0 bee4ffffff                     mov        esi, 0xffffffe4
01bd5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bdd 488f0424                       pop        qword ptr [rsp]
01be1 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01be6 48894424f8                     mov        qword ptr [rsp - 8], rax
01beb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bf2 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01bf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfb 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01bff 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01c03 e85864aeff                     call       0x7efc7b6cda60
01c08 0f1f8400001d001d               nop        dword ptr [rax + rax + 0x1d001d00]
01c10 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01c1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c1e e8bddecb17                     call       0x7efc938a54e0
01c23 f4                             hlt        
01c24 bee4ffffff                     mov        esi, 0xffffffe4
01c29 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c31 488f0424                       pop        qword ptr [rsp]
01c35 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c41 89442418                       mov        dword ptr [rsp + 0x18], eax
01c45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4a 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01c4e 89542428                       mov        dword ptr [rsp + 0x28], edx
01c52 4889442430                     mov        qword ptr [rsp + 0x30], rax
01c57 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c5c 90                             nop        
01c5d 90                             nop        
01c5e 90                             nop        
01c5f e8fc63aeff                     call       0x7efc7b6cda60
01c64 0f1f84005c1d001e               nop        dword ptr [rax + rax + 0x1e001d5c]
01c6c 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c7a e861decb17                     call       0x7efc938a54e0
01c7f f4                             hlt        
01c80 bebeffffff                     mov        esi, 0xffffffbe
01c85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c8d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c92 44891424                       mov        dword ptr [rsp], r10d
01c96 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c9b 4489542408                     mov        dword ptr [rsp + 8], r10d
01ca0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ca5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01caa 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01caf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cb4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cb9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01cbe 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01cc3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cc8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ccd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01cd2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cd7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cdc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ce1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ce6 90                             nop        
01ce7 e87463aeff                     call       0x7efc7b6cda60
01cec 0f1f8400e41d001f               nop        dword ptr [rax + rax + 0x1f001de4]
01cf4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01cfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d02 e8d9ddcb17                     call       0x7efc938a54e0
01d07 f4                             hlt        
01d08 beccffffff                     mov        esi, 0xffffffcc
01d0d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d15 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d1a 44891424                       mov        dword ptr [rsp], r10d
01d1e 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01d23 48894424f8                     mov        qword ptr [rsp - 8], rax
01d28 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d2f 89442414                       mov        dword ptr [rsp + 0x14], eax
01d33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d38 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01d3c 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01d40 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01d44 90                             nop        
01d45 90                             nop        
01d46 90                             nop        
01d47 e81463aeff                     call       0x7efc7b6cda60
01d4c 0f1f8400441e0020               nop        dword ptr [rax + rax + 0x20001e44]
01d54 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d62 e879ddcb17                     call       0x7efc938a54e0
01d67 f4                             hlt        
01d68 beccffffff                     mov        esi, 0xffffffcc
01d6d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d75 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d7a 44890424                       mov        dword ptr [rsp], r8d
01d7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d83 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d8a 89442410                       mov        dword ptr [rsp + 0x10], eax
01d8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d93 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01d97 89542418                       mov        dword ptr [rsp + 0x18], edx
01d9b 4889442428                     mov        qword ptr [rsp + 0x28], rax
01da0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01da5 897c2434                       mov        dword ptr [rsp + 0x34], edi
01da9 90                             nop        
01daa 90                             nop        
01dab e8b062aeff                     call       0x7efc7b6cda60
01db0 0f1f8400a81e0021               nop        dword ptr [rax + rax + 0x21001ea8]
01db8 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dc6 e815ddcb17                     call       0x7efc938a54e0
01dcb f4                             hlt        
01dcc be45ffffff                     mov        esi, 0xffffff45
01dd1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01dd6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ddb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01de0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01de5 90                             nop        
01de6 90                             nop        
01de7 e87462aeff                     call       0x7efc7b6cda60
01dec 0f1f8400e41e0022               nop        dword ptr [rax + rax + 0x22001ee4]
01df4 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e8d9dccb17                     call       0x7efc938a54e0
01e07 f4                             hlt        
01e08 be45ffffff                     mov        esi, 0xffffff45
01e0d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01e12 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01e17 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01e1c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e21 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e26 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e2b e83062aeff                     call       0x7efc7b6cda60
01e30 0f1f8400281f0023               nop        dword ptr [rax + rax + 0x23001f28]
01e38 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01e42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e46 e895dccb17                     call       0x7efc938a54e0
01e4b f4                             hlt        
01e4c bef6ffffff                     mov        esi, 0xfffffff6
01e51 90                             nop        
01e52 90                             nop        
01e53 e80862aeff                     call       0x7efc7b6cda60
01e58 0f1f8400501f0024               nop        dword ptr [rax + rax + 0x24001f50]
01e60 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6e e86ddccb17                     call       0x7efc938a54e0
01e73 f4                             hlt        
01e74 be5d000000                     mov        esi, 0x5d
01e79 90                             nop        
01e7a 90                             nop        
01e7b e8e061aeff                     call       0x7efc7b6cda60
01e80 0f1f8400781f0025               nop        dword ptr [rax + rax + 0x25001f78]
01e88 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01e92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e96 e845dccb17                     call       0x7efc938a54e0
01e9b f4                             hlt        
01e9c be45ffffff                     mov        esi, 0xffffff45
01ea1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ea9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01eae 44891424                       mov        dword ptr [rsp], r10d
01eb2 90                             nop        
01eb3 e8a861aeff                     call       0x7efc7b6cda60
01eb8 0f1f8400b01f0026               nop        dword ptr [rax + rax + 0x26001fb0]
01ec0 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ece e80ddccb17                     call       0x7efc938a54e0
01ed3 f4                             hlt        
01ed4 bef6ffffff                     mov        esi, 0xfffffff6
01ed9 418be8                         mov        ebp, r8d
01edc 90                             nop        
01edd 90                             nop        
01ede 90                             nop        
01edf e87c61aeff                     call       0x7efc7b6cda60
01ee4 0f1f8400dc1f0027               nop        dword ptr [rax + rax + 0x27001fdc]
01eec 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01ef6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01efa e8e1dbcb17                     call       0x7efc938a54e0
01eff f4                             hlt        
01f00 bef6ffffff                     mov        esi, 0xfffffff6
01f05 8be9                           mov        ebp, ecx
01f07 e85461aeff                     call       0x7efc7b6cda60
01f0c 0f1f840004200028               nop        dword ptr [rax + rax + 0x28002004]
01f14 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01f1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f22 e8b9dbcb17                     call       0x7efc938a54e0
01f27 f4                             hlt        
01f28 bef6ffffff                     mov        esi, 0xfffffff6
01f2d 418be8                         mov        ebp, r8d
01f30 90                             nop        
01f31 90                             nop        
01f32 90                             nop        
01f33 e82861aeff                     call       0x7efc7b6cda60
01f38 0f1f840030200029               nop        dword ptr [rax + rax + 0x29002030]
01f40 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01f4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4e e88ddbcb17                     call       0x7efc938a54e0
01f53 f4                             hlt        
01f54 bef6ffffff                     mov        esi, 0xfffffff6
01f59 90                             nop        
01f5a 90                             nop        
01f5b e80061aeff                     call       0x7efc7b6cda60
01f60 0f1f84005820002a               nop        dword ptr [rax + rax + 0x2a002058]
01f68 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01f72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f76 e865dbcb17                     call       0x7efc938a54e0
01f7b f4                             hlt        
01f7c bef6ffffff                     mov        esi, 0xfffffff6
01f81 90                             nop        
01f82 90                             nop        
01f83 e8d860aeff                     call       0x7efc7b6cda60
01f88 0f1f84008020002b               nop        dword ptr [rax + rax + 0x2b002080]
01f90 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01f9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9e e83ddbcb17                     call       0x7efc938a54e0
01fa3 f4                             hlt        
01fa4 bef6ffffff                     mov        esi, 0xfffffff6
01fa9 90                             nop        
01faa 90                             nop        
01fab e8b060aeff                     call       0x7efc7b6cda60
01fb0 0f1f8400a820002c               nop        dword ptr [rax + rax + 0x2c0020a8]
01fb8 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01fc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc6 e815dbcb17                     call       0x7efc938a54e0
01fcb f4                             hlt        
01fcc bef6ffffff                     mov        esi, 0xfffffff6
01fd1 90                             nop        
01fd2 90                             nop        
01fd3 e88860aeff                     call       0x7efc7b6cda60
01fd8 0f1f8400d020002d               nop        dword ptr [rax + rax + 0x2d0020d0]
01fe0 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
01fea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fee e8eddacb17                     call       0x7efc938a54e0
01ff3 f4                             hlt        
01ff4 bef6ffffff                     mov        esi, 0xfffffff6
01ff9 90                             nop        
01ffa 90                             nop        
01ffb e86060aeff                     call       0x7efc7b6cda60
02000 0f1f8400f820002e               nop        dword ptr [rax + rax + 0x2e0020f8]
02008 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
02012 4883e4f0                       and        rsp, 0xfffffffffffffff0
02016 e8c5dacb17                     call       0x7efc938a54e0
0201b f4                             hlt        
0201c bef6ffffff                     mov        esi, 0xfffffff6
02021 90                             nop        
02022 90                             nop        
02023 e83860aeff                     call       0x7efc7b6cda60
02028 0f1f84002021002f               nop        dword ptr [rax + rax + 0x2f002120]
02030 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
0203a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0203e e89ddacb17                     call       0x7efc938a54e0
02043 f4                             hlt        
02044 bef6ffffff                     mov        esi, 0xfffffff6
02049 90                             nop        
0204a 90                             nop        
0204b e81060aeff                     call       0x7efc7b6cda60
02050 0f1f840048210030               nop        dword ptr [rax + rax + 0x30002148]
02058 48bf805c9b54fc7e0000           movabs     rdi, 0x7efc549b5c80
02062 4883e4f0                       and        rsp, 0xfffffffffffffff0
02066 e875dacb17                     call       0x7efc938a54e0
0206b f4                             hlt        
0206c eb08                           jmp        0x7efc7bbe7a76
0206e eb06                           jmp        0x7efc7bbe7a76
02070 eb04                           jmp        0x7efc7bbe7a76
02072 eb02                           jmp        0x7efc7bbe7a76
02074 eb00                           jmp        0x7efc7bbe7a76
02076 488bf0                         mov        rsi, rax
02079 e9b6e9ffff                     jmp        0x7efc7bbe6434
0207e 49ba0464be7bfc7e0000           movabs     r10, 0x7efc7bbe6404
02088 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0208f e9cca8b4ff                     jmp        0x7efc7b732360
02094 e84777b3ff                     call       0x7efc7b71f1e0
02099 e980dfffff                     jmp        0x7efc7bbe5a1e
0209e f4                             hlt        
0209f f4                             hlt        
